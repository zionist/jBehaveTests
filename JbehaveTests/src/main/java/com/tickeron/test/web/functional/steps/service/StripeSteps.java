package com.tickeron.test.web.functional.steps.service;

import com.google.gson.*;
import com.squareup.okhttp.*;
import com.stripe.exception.StripeException;
import com.stripe.model.*;
import com.stripe.net.RequestOptions;
import com.tickeron.test.common.exceptions.AssertionErrorWithContextParamsException;
import com.tickeron.test.web.functional.steps.HttpSteps;
import com.tickeron.test.web.functional.steps.ParamsAndVariablesSteps;
import com.tickeron.test.web.functional.steps.SeleniumSteps;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.openqa.selenium.By;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.core.env.Environment;

import java.io.IOException;
import java.util.*;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import static org.junit.Assert.assertEquals;

/**
 * Created by slaviann on 15.12.15.
 */
public class StripeSteps extends ServiceStepsBasic {

    @Autowired
    private SeleniumSteps seleniumSteps;

    @Autowired
    private ServiceStepsBasic serviceStepsBasic;

    @Autowired
    private HttpSteps httpSteps;

    @Autowired
    private LoginSteps loginSteps;

    @Autowired MallSteps mallSteps;

    @Autowired
    private ApplicationContext applicationContext;

    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;

    @Autowired
    private Environment environment;

    private JsonParser jsonParser = new JsonParser();

    private final static String PAYMENT_PROFILE_URL = "app/user#!/editProfile/stripe-seller";
    private final static String PAYMENT_PROFILE_URL2 = "app/user#!/editProfile/stripe-buyer";
    private final static String GET_PROFILE_METHOD_URL = "api/CxPaymentProfile/GetProfileSummary";
    private final static String DELETE_BUYER_PROFILE_URL = "api/CxPaymentProfile/DeleteBuyerProfile";
    private final static String SEARCH_TRANSACTION_URL = "api/CxTransaction/Search";
    private final static String DEFAULT_CARD = "4242 4242 4242 4242";

    /***
     * Gets List with 4 digits from card num string
      * @param cardNum card num: 4242 4242 4242 4242
     * @return List of 4 digits * 4
     */
    private List<String> getCardListFromString(String cardNum) {
        List<String> nums = Arrays.asList(cardNum.split(" "));
        if(nums.size() != 4)
            throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException",
                    "Please set the correct card num XXXX XXXX XXXX XXXX");
        return nums;
    }

    private Predicate<ExternalAccount> isExtenalAccountCard() {
        return sr -> sr.getClass() == Card.class;
    }

    private Predicate<Subscription> isSubscribtionWithPaidPlan() {
        return  s -> s.getPlan().getAmount() > 0;
    }

    @Given("I connect stripe as seller for $username with $password")
    public void setStripeAsSeller(String username, String password) throws InterruptedException {
        // Are we connected?
        username = paramsAndVariablesSteps.substituteParamsAndVariables(username);
        password = paramsAndVariablesSteps.substituteParamsAndVariables(password);
        loginSteps.doApiLogin(username, password);
        httpSteps.performJsonRequest("POST", GET_PROFILE_METHOD_URL);
        JsonObject object = jsonParser.parse(httpSteps.getResponseBody().orElse("")).getAsJsonObject();
        JsonObject profile = object.get("Profile").getAsJsonObject();
        Boolean isAccountConnected = profile.get("IsAccountCreated").getAsBoolean();

        // Delete all cookies
        if (!isAccountConnected) {
            loginSteps.doLoginUsingSelenium(username, password);
            seleniumSteps.openUrl("", PAYMENT_PROFILE_URL);
            waitUntilServiceReady();
            //clickOnElementBySelector("Enter seller info", "css", "a.btn");
            typeIntoElementBySelector("firstName", "", "css", "#firstName");
            typeIntoElementBySelector("secondName", "", "css", "#lastName");
            typeIntoElementBySelector("Aug 30, 1980", "", "css", "#dateOfBirth");
            clickOnElementBySelector("", "css", "#lastName");
            typeIntoElementBySelector("New York", "", "css", "#city");
            typeIntoElementBySelector("1st Street", "", "css", "#addressLine1");
            typeIntoElementBySelector("23466", "", "css", "#postalCode");
            typeIntoElementBySelector("110000000", "", "css", "#routingNumber");
            typeIntoElementBySelector("000123456789", "", "css", "#accountNumber");
            typeIntoElementBySelector("1111", "", "css", "#ssnLast4");
            typeIntoElementBySelector("AR, Arkansas", "", "css", "#state");
            // clickOnElementBySelector("", "css", "#lastName");
            waitSmallTimeout();
            seleniumSteps.executeJavaScript("form.isAgree.click()");
            waitSmallTimeout();
            seleniumSteps.executeJavaScript("scroll(1050, 350)");
            waitSmallTimeout();
            clickOnElementBySelector("", "css", "input.btn");
            waitUntilServiceReady();
            clickOnElementBySelector("", "css", "input.btn:nth-child(1)");
            waitBigTimeout();
            serviceStepsBasic.ClearElementBySelector("", "css", "#personalIdNumber");
            typeIntoElementBySelector("123451111", "", "css", "#personalIdNumber");
            clickOnElementBySelector("", "css", "input.btn");
            waitUntilServiceReady();
            clickOnElementBySelector("", "css", ".cx-modal-dafault > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > button:nth-child(1)");
            waitSmallTimeout();
            mallSteps.uploadFileInMall("seller.jpg", "input[type=file]");
            waitSmallTimeout();
            clickOnElementBySelector("", "css", "input.btn");
            clickOnElementBySelector("", "css", ".cx-modal-dafault > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > button:nth-child(1)");
            waitBigTimeout();

        }

        seleniumSteps.resetBrowser();
    }

    @Given("I connect card as client for $username with $password")
    public void setStripeAsClient(String username, String password) throws InterruptedException {
        setStripeAsClient(DEFAULT_CARD, username, password);
    }

    @Given("There is no credit card in profile for $username with $password")
    public void deleteCreditCardFromProfileForUser(String username, String password) {
        username = paramsAndVariablesSteps.substituteParamsAndVariables(username);
        password = paramsAndVariablesSteps.substituteParamsAndVariables(password);
        loginSteps.doApiLogin(username, password);
        httpSteps.performJsonRequest("POST", GET_PROFILE_METHOD_URL);
        JsonObject object = jsonParser.parse(httpSteps.getResponseBody().orElse("")).getAsJsonObject();
        JsonObject profile = object.get("Profile").getAsJsonObject();
        Boolean isCardConnected = profile.get("IsCardConnected").getAsBoolean();
        if (isCardConnected) {
            httpSteps.performJsonRequest("POST", DELETE_BUYER_PROFILE_URL);
        }

    }


    /***
     * Connect card to Buyer account.
     * Check is card with last 4 digits is connected
     * Delete card if last 4 digits are not like cardNUmber
     * Connect new card.
     * Wait for timeout and selenium switch toDeafultContent if waitForSelenium = true
     */
    @Given("I connect card with $num as client for $username with $password")
    public void setStripeAsClient(String cardNumber, String username, String password) throws InterruptedException {
        String cardLast4 = getCardListFromString(cardNumber).get(3);
        cardNumber = substituteParamsAndVariables(cardNumber);
        // Are we connected?
        username = paramsAndVariablesSteps.substituteParamsAndVariables(username);
        password = paramsAndVariablesSteps.substituteParamsAndVariables(password);
        loginSteps.doApiLogin(username, password);
        httpSteps.performJsonRequest("POST", GET_PROFILE_METHOD_URL);
        JsonObject object = jsonParser.parse(httpSteps.getResponseBody().orElse("")).getAsJsonObject();
        JsonObject profile = object.get("Profile").getAsJsonObject();
        Boolean isCardConnected = profile.get("IsCardConnected").getAsBoolean();

        //Delete card if 4 digits are not like card number
        if (isCardConnected) {
            String oldCardLast4 = profile.get("CardLast4").getAsString();
            if (!cardLast4.equals(oldCardLast4)) {
                httpSteps.performJsonRequest("POST", DELETE_BUYER_PROFILE_URL);
                isCardConnected = false;
            }
        }

        // Connect if not connected
        if (!isCardConnected) {
            loginSteps.doLoginUsingSelenium(username, password);
            seleniumSteps.openUrl("", PAYMENT_PROFILE_URL2);
            waitUntilServiceReady();
            waitSmallTimeout();
            clickOnElementBySelector("", "css", "a.btn");
            waitSmallTimeout();
            switchToFrame("", "css", ".stripe_checkout_app");
            waitSmallTimeout();
            //String emailSelector = "input[placeholder='Email']";
            String cardSector = "input[placeholder='Card number']";
            String dateSelector = "input[placeholder='MM / YY']";
            String cvcSelector = "input[placeholder='CVC']";
            //typeIntoElementBySelector(username, "", "css", emailSelector);
            List<String> nums = getCardListFromString(cardNumber);
            typeIntoElementBySelector(nums.get(0), "", "css", cardSector);
            typeIntoElementBySelector(nums.get(1), "", "css", cardSector);
            typeIntoElementBySelector(nums.get(2), "", "css", cardSector);
            typeIntoElementBySelector(nums.get(3), "", "css", cardSector);
            typeIntoElementBySelector("12", "", "css", dateSelector);
            typeIntoElementBySelector("20", "", "css", dateSelector);
            typeIntoElementBySelector("1111", "", "css", cvcSelector);
            clickOnElementBySelector("", "css", "button");
            waitBigTimeout();
            switchToDefaultContent();
        }
    }




    @When("I delete connected card from Buyer profile for $username with $password")
    public void deleteCardFromByerProfile(String username, String password) throws InterruptedException {
        loginSteps.doLoginUsingSelenium(username, password);
        seleniumSteps.openUrl("", PAYMENT_PROFILE_URL2);
        waitUntilServiceReady();
        clickOnElementBySelector("remove button", "css", "a.btn:nth-child(2)");
        clickOnElementBySelector("Yes button", "css", "button.ng-binding:nth-child(1)");
    }

    @Then("Stripe. Check card $num exists for customer with $username")
    public void checkCardWithNumExistsForCustomer(String cardNumber, String email) {
        cardNumber = substituteParamsAndVariables(cardNumber);
        String email1 = paramsAndVariablesSteps.substituteParamsAndVariables(email);
        List<String> nums = getCardListFromString(cardNumber);
        String apiKey = environment.getProperty("stripe.sandbox.secret.key");
        RequestOptions requestOptions = (new RequestOptions.RequestOptionsBuilder()).setApiKey(apiKey).build();

        Map<String, Object> params = new HashMap<>();
        Gson gson = new GsonBuilder().create();
        try {
            CustomerCollection customerCollection = Customer.list(params, requestOptions);
            Optional<Customer> anyFoundCustomer = customerCollection.getData().stream().filter(e -> e.getSources().getData().stream().anyMatch(s ->
            {  Map res =  gson.fromJson(s.toJson(), Map.class);
               return s.getClass() == Card.class
                    && res.get("name").equals(email1)
                    && res.get("last4").equals(nums.get(3));
            })
            ).findAny();
            if(!anyFoundCustomer.isPresent()) {
                throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException",
                        String.format("User with email %s and card %s was not found on stripe", email1, nums.get(3)));
            }
        } catch (StripeException e) {
            throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException", e);
        }
    }

    @Then("Billing. Check I'm on buyer profile page")
    public void checkImOnBuyerProfile() {
        checkElementTextBySelectorIs("Modal windows header", "css", "h4.modal-title:nth-child(1)", "Fill buyer settings.");
        checkElementTextBySelectorIs("Modal windows text", "css", "div.ng-binding:nth-child(2)", "To perform this operation you need to fill buyer settings first. Do you want to leave current page and fill buyer settings?");
        clickOnElementBySelector("Yes button", "css", "button.ng-binding:nth-child(1)");
        checkElementTextBySelectorIs("Page header", "css", "h1", "Buyer Settings");
    }

    @Then("Billing. I see last transaction has amount $amount and status $status")
    public void checkLastTransaction(String amount, String status) {
        amount = substituteParamsAndVariables(amount);
        status = substituteParamsAndVariables(status);
        clickOnElementBySelector("Last transaction chevron", "css", "tr.ng-scope:nth-child(1) > td:nth-child(8) > i:nth-child(1)");
        waitSmallTimeout();
        checkElementTextBySelectorIs("Amount", "css", "div.cx-apercu", amount);
        checkElementTextBySelectorIs("Status", "css", ".cx-transaction__status > span:nth-child(1)", status);
    }

    @When("Billing. Save transaction number to variable $variable")
    public void saveTransactionNUmberToVariable(String variable) {
        final String selector = "div.col-xs-4:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > span:nth-child(2)";
        Optional<Object> transactionHash = seleniumSteps.executeJavaScript("return $(\"div.col-xs-4:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > span:nth-child(2)\").text()");
        if(!transactionHash.isPresent()) {
            throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException",
                    String.format("Can't get transaction %s from web page", transactionHash));
        }
        paramsAndVariablesSteps.setParamValue(variable, transactionHash.get().toString());
        System.out.println("#");
        System.out.println(transactionHash.get().toString());
        System.out.println("#");
    }



    @Then("Stripe. I see transaction with hash $hash has amount $amount")
    public void checkTransactionOnStripe(String hash, Long amount) {
        hash = paramsAndVariablesSteps.substituteParamsAndVariables(hash);

        String apiKey = environment.getProperty("stripe.sandbox.secret.key");
        RequestOptions requestOptions = (new RequestOptions.RequestOptionsBuilder()).setApiKey(apiKey).build();
        Map<String, Object> params = new HashMap<>();

        try {
            Charge charge = Charge.retrieve(hash, requestOptions);
            if (!charge.getAmount().equals(amount)) {
                throw (AssertionErrorWithContextParamsException) applicationContext.getBean("assertionErrorWithContextParamsException",
                        String.format("Charge %s amount is not %d on stripe", hash, amount));
            }
            if (!charge.getPaid()) {
                throw (AssertionErrorWithContextParamsException) applicationContext.getBean("assertionErrorWithContextParamsException",
                        String.format("Charge %s is not paid on stripe", hash));
            }


        }
        catch (StripeException e) {
            e.printStackTrace();
            throw (AssertionErrorWithContextParamsException) applicationContext.getBean("assertionErrorWithContextParamsException",
                    String.format("Error on stripe"));
        }
    }

    public List<String> getTransactionsListFromApp() {
        httpSteps.setRequestBody("{\"request\":{\"Title\":null,\"Offset\":0,\"PageSize\":10,\"FromDate\":null,\"ToDate\":null,\"IsDebit\":true,\"IsCredit\":true,\"StripeChargeId\":null,\"ProductId\":null,\"BuyerId\":null,\"IsMall\":true,\"IsAdvisorClient\":true,\"IsMembership\":true,\"IsPattern\":true,\"IsPrediction\":true,\"IsWebcast\":true,\"IsCompleted\":true,\"IsRefundRequested\":true,\"IsRefundRejected\":true,\"IsRefunded\":true}}");
        httpSteps.performJsonRequest("POST", SEARCH_TRANSACTION_URL);
        assertEquals(httpSteps.getResponse().code(), 200);
        JsonObject object = jsonParser.parse(httpSteps.getResponseBody().orElse("")).getAsJsonObject();
        JsonArray items = object.get("Items").getAsJsonArray();
        List<String> res = new ArrayList<>();
        items.forEach(i -> res.add(i.toString()));
        return res;
    }

    public List<Charge> getAllTransactionFromStripe() {
        String apiKey = environment.getProperty("stripe.sandbox.secret.key");
        RequestOptions requestOptions = (new RequestOptions.RequestOptionsBuilder()).setApiKey(apiKey).build();
        Map<String, Object> params = new HashMap<>();
        Charge charge = null;
        List<Charge> res = new ArrayList<>();
        try {
            ChargeCollection charges = Charge.list(params, requestOptions);
            charges.getData().forEach(res::add);

        } catch (StripeException e) {
            e.printStackTrace();
        }
        return res;

    }




}


