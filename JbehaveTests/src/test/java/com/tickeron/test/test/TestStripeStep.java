package com.tickeron.test.test;

import com.tickeron.test.config.AppConfig;
import com.tickeron.test.config.ExceptionsConfig;
import com.tickeron.test.web.functional.steps.SeleniumSteps;
import com.tickeron.test.web.functional.steps.service.LoginSteps;
import com.tickeron.test.web.functional.steps.service.PatternSteps;
import com.tickeron.test.web.functional.steps.service.StripeSteps;
import junit.framework.TestCase;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * Created by slaviann on 20.04.16.
 */
public class TestStripeStep extends TestCase {

    private SeleniumSteps seleniumSteps;
    private StripeSteps stripeSteps;
    private LoginSteps loginSteps;
    private PatternSteps patternSteps;
    private static AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();

    public void setUp(){
        context.register(AppConfig.class);
        context.register(ExceptionsConfig.class);
        context.refresh();
        seleniumSteps = context.getBean(SeleniumSteps.class);
        stripeSteps = context.getBean(StripeSteps.class);
        loginSteps = context.getBean(LoginSteps.class);
        patternSteps = context.getBean(PatternSteps.class);

    }

    @Test
    public void testConnectAsClient() throws InterruptedException {
        stripeSteps.setStripeAsClient("a1@catch01.tickerontest.com", "qwerty");
    }

    @Test
    public void testConnectAsSeller() throws InterruptedException {
        //stripeSteps.setStripeAsClient("a1@copymytrade.com", "qwerty");
        stripeSteps.setStripeAsSeller("e1@catch01.tickerontest.com", "qwerty");
    }

    @Test
    public void testConnectAsClientWithoutSeleniumTimeout() throws InterruptedException {
        final String username = "a1@catch01.tickerontest.com";
        final String password = "Tarakan1";
        loginSteps.doApiLogin(username, password);
        patternSteps.userHasNoPatternSubscribtion(username, password);
        stripeSteps.setStripeAsClient("4000 0000 0000 0259",  username, password);
        //stripeSteps.setStripeAsClient(username, password);
        patternSteps.buyAiPatternSubscribtion();
        System.out.println(stripeSteps.getTransactionsListFromApp().get(0));
        System.out.println(stripeSteps.getAllTransactionFromStripe().get(0));
        Thread.sleep(10000);
        System.out.println(stripeSteps.getTransactionsListFromApp().get(0));
        Thread.sleep(20000);
    }


}
