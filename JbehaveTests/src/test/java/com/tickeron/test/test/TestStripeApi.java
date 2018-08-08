package com.tickeron.test.test;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.stripe.exception.*;
import com.stripe.model.*;
import com.stripe.net.RequestOptions;
import com.tickeron.test.config.AppConfig;
import com.tickeron.test.config.ExceptionsConfig;
import com.tickeron.test.web.functional.steps.service.LoginSteps;
import com.tickeron.test.web.functional.steps.service.MallSteps;
import com.tickeron.test.web.functional.steps.service.StripeSteps;
import junit.framework.TestCase;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.core.env.Environment;
import org.springframework.core.env.SystemEnvironmentPropertySource;

import javax.mail.MessagingException;
import java.io.IOException;
import java.util.*;
import java.util.function.Predicate;

/**
 */
public class TestStripeApi extends TestCase {

    private static AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
    private MallSteps mallSteps;
    private LoginSteps loginSteps;
    private StripeSteps stripeSteps;
    private Environment environment;
    private String apiKey;
    private RequestOptions requestOptions;

    public void setUp() {
        context.register(AppConfig.class);
        context.register(ExceptionsConfig.class);
        context.refresh();
        loginSteps = context.getBean(LoginSteps.class);
        mallSteps = context.getBean(MallSteps.class);
        stripeSteps = context.getBean(StripeSteps.class);
        environment = context.getBean(Environment.class);
        apiKey = environment.getProperty("stripe.sandbox.secret.key");
        requestOptions = (new RequestOptions.RequestOptionsBuilder()).setApiKey(apiKey).build();
    }


    public void testGetConnectedAccounts() {
        Map<String, Object> accountParams = new HashMap<String, Object>();
        accountParams.put("limit", 3);
        try {
            AccountCollection accountCollection = Account.list(accountParams, requestOptions);
            accountCollection.getData().forEach(System.out::println);
        } catch (StripeException e) {
            e.printStackTrace();
        }

    }

    @Test
    public void testGetCardFromCustomer() {
        Map<String, Object> params = new HashMap<>();
        Gson gson = new GsonBuilder().create();
        try {
            CustomerCollection customerCollection = Customer.list(params, requestOptions);
            customerCollection.getData().stream().filter(e -> e.getSources().getData().stream().anyMatch(s -> s.getClass() == Card.class
                    && gson.fromJson(s.toJson(), Map.class).get("name").equals("a1@catch01.tickerontest.com")
            )).forEach(System.out::println);
        } catch (StripeException e) {
            e.printStackTrace();
        }

    }

    @Test
    public void testCheckCardWithNumExistsForCustomer() throws StripeException {
        stripeSteps.checkCardWithNumExistsForCustomer("4242 4242 4242 4242", "a1@catch01.tickerontest.com");
    }


    @Test
    public void testGetAllTickeronCustomersFromStripeWithNonFreePlan() {
        String apiKey = environment.getProperty("stripe.sandbox.secret.key");
        RequestOptions requestOptions = (new RequestOptions.RequestOptionsBuilder()).setApiKey(apiKey).build();
        Map<String, Object> params = new HashMap<>();
        Gson gson = new GsonBuilder().create();
        try {
            CustomerCollection customerCollection = Customer.list(params, requestOptions);
            customerCollection.getData().stream().filter(c ->
                    c.getSubscriptions().getData().stream().filter(isSubscribtionWithPaidPlan()).count() > 0).
                    forEach(c -> c.getSources().getData().stream().filter(isExtenalAccountCard()).findFirst().ifPresent(cs -> {
                        Map res =  gson.fromJson(cs.toJson(), Map.class);
                        System.out.println(res.get("name"));
                    }));
        }
        catch (StripeException e) {
            e.printStackTrace();
        }
    }


    private Predicate<Subscription> isSubscribtionWithPaidPlan() {
         return  s -> s.getPlan().getAmount() > 0;
    }

    private Predicate<ExternalAccount> isExtenalAccountCard() {
        return sr -> sr.getClass() == Card.class;
    }

    @Test
    public void testGetAllConnectedAccounts() {
        String apiKey = environment.getProperty("stripe.sandbox.secret.key");
        RequestOptions requestOptions = (new RequestOptions.RequestOptionsBuilder()).setApiKey(apiKey).build();
        Map<String, Object> params = new HashMap<>();
        try {
            for(Account a : Account.list(params, requestOptions).getData()) {
                System.out.println(a.getId());
                RequestOptions childRequestOptions = (new RequestOptions.RequestOptionsBuilder()).
                        setApiKey(apiKey).setStripeAccount(a.getId()).build();
                CustomerCollection customerCollection = Customer.list(params, childRequestOptions);

                customerCollection.getData().stream().filter(c ->
                        c.getSubscriptions().getData().stream().filter(isSubscribtionWithPaidPlan()).count() > 0).
                        forEach(c -> {
                            System.out.println(c.getEmail());
                        });

            }
        }
        catch (StripeException e) {
            e.printStackTrace();
        }
    }

    public void testCheckTransactionOnStripe() {
        stripeSteps.checkTransactionOnStripe("ch_1ADaXGGylNhW5O8Jal0yJPgI", 1995L);
    }

    public void testStripeGetAllConnectedAccounts() {
        try {
            String apiKey = environment.getProperty("stripe.sandbox.secret.key");
            RequestOptions requestOptions = (new RequestOptions.RequestOptionsBuilder()).setApiKey(apiKey).build();
            Map<String, Object> params = new HashMap<>();
            Account.list(params, requestOptions).getData().stream().filter(a -> !a.getDebitNegativeBalances()).forEach(System.out::println);
        } catch (StripeException e) {
            e.printStackTrace();
        }
    }




    /*@Test
    TODO: Danger
    public void testStripeCleanUp() {
        // delete all customers
        Map<String, Object> customerParams = new HashMap<>();
        customerParams.put("limit", 1000);
        try {
            Customer.list(customerParams, requestOptions).getData().forEach(c -> {
                try {
                    c.delete(requestOptions);
                } catch (StripeException e) {
                    e.printStackTrace();
                }
            });
        } catch (StripeException e) {
            e.printStackTrace();
        }

    }
    */
}

