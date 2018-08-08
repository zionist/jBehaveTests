package com.tickeron.test.web.functional.steps.service;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.tickeron.test.common.exceptions.AssertionErrorWithContextParamsException;
import com.tickeron.test.web.functional.steps.HttpSteps;
import com.tickeron.test.web.functional.steps.MailSteps;
import com.tickeron.test.web.functional.steps.ParamsAndVariablesSteps;
import com.tickeron.test.web.functional.steps.SeleniumSteps;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.core.env.Environment;

import java.util.List;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * Created by slaviann on 28.12.15.
 */
public class LoginSteps extends ServiceStepsBasic {

    @Autowired
    private Environment environment;

    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;

    @Autowired
    private ApplicationContext applicationContext;

    @Autowired
    private AdminSteps adminSteps;

    @Autowired
    private MailSteps mailSteps;

//    @Autowired
//    private LoginSteps loginSteps;

    @Autowired
    private HttpSteps httpSteps;

    @Autowired
    private SeleniumSteps seleniumSteps;

    @Autowired
    private ServiceStepsBasic serviceStepsBasic;

    public Optional<String> getAuthCookie() {
        return authCoockie;
    }

    public void setAuthCoockie(String authCoockie) {
        this.authCoockie = Optional.of(authCoockie);
    }
    private final static String GET_PROFILE_ADMIN_METHOD_URL = "api/CxAdminAccounts/GetAdminAccount";
    private final static String EDIT_ADMIN_PROFILE_URL = "#/account/705";
    private Optional<String> authCoockie = Optional.empty();
    private JsonParser jsonParser = new JsonParser();

    @Given("I authenticated using JSON with username $username and password $password")
    public void doApiLogin(String user, String password) {
        user = paramsAndVariablesSteps.substituteParamsAndVariables(user);
        password = paramsAndVariablesSteps.substituteParamsAndVariables(password);

        // Crutch for app init
        httpSteps.performJsonRequest("GET", "/");

        httpSteps.setRequestBody(
                String.format("{" +
                        "  \"captchaValue\": null," +
                        "  \"login\": \"%s\"," +
                        "  \"password\": \"%s\"," +
                        "  \"rememberMe\": true" +
                        "}" +
                        "", user, password));
        httpSteps.performJsonRequest("POST", "api/Account/Login");
        if(httpSteps.getResponse().code() != 200) {
            throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException",
                    String.format("Can't do API login. Status should be 200, but it is: %d", httpSteps.getResponse().code()));
        }
    }

    @When("I get password for adviser created account from email and save it into variable $variable")
    public void getPasswordFromEmail(String variable) {
        //Can work slowly
        Pattern pattern = Pattern.compile("Your password is: <b>(.*?)</b>");
        variable = paramsAndVariablesSteps.substituteParamsAndVariables(variable);
        Matcher matcher = pattern.matcher(mailSteps.getLastMessage().body);
        if (matcher.find()) {
            paramsAndVariablesSteps.getTestParamsStorage().put(variable, matcher.group(1));
        } else
            throw new RuntimeException(String.format("Can't get password from email message. Message was %s", mailSteps.getLastMessage()));
    }

    @Given("I logged in with $username and $password")
    public void doLoginUsingSelenium(String username, String password) throws InterruptedException {
        username = paramsAndVariablesSteps.substituteParamsAndVariables(username);
        password = paramsAndVariablesSteps.substituteParamsAndVariables(password);
        seleniumSteps.setUpWebDriver();
        waitUntilServiceReady();
        clickOnElementBySelector("login link", "css",  "button[ng-click='showLogin()']");
        waitUntilServiceReady();
        waitSmallTimeout();
        inputCredentialsAndSubmit(username, password);
        waitUntilServiceReady();
    }

    @When("I submit $username and $password into open Log in form")
    public void inputCredentialsAndSubmit(String username, String password) {
        waitUntilServiceReady();
        typeIntoElementBySelector(username, "", "css", "#email");
        waitUntilServiceReady();
        typeIntoElementBySelector(password, "", "css", "#password");
        waitUntilServiceReady();
        clickOnElementBySelector("login button", "css", "input.btn");
        waitUntilServiceReady();
    }

    @When("I submit $fullname and $email and $password into open Sign in form")
    public void inputCredentialsAndSubmit(String fullname, String email, String password) {
        fullname = paramsAndVariablesSteps.substituteParamsAndVariables(fullname);
        email = paramsAndVariablesSteps.substituteParamsAndVariables(email);
        password = paramsAndVariablesSteps.substituteParamsAndVariables(password);
        waitUntilServiceReady();
        typeIntoElementBySelector(fullname, "", "css", "#fullName");
        typeIntoElementBySelector(email, "", "css", "#email");
        typeIntoElementBySelector(password, "", "css", "#password");
        clickOnElementBySelector("sign up button", "css", "div.cx-signup-hide-mobile:nth-child(7) > div:nth-child(2) > div:nth-child(1) > button:nth-child(1)");
        waitUntilServiceReady();
    }

    @Given("I logged in to Zendesk")
    public void doLoginToZendeskUsingSelenium() throws InterruptedException {

        final String username = environment.getProperty("zendesk.username");
        final String password = environment.getProperty("zendesk.password");
        final String hostname = environment.getProperty("zendesk.host");
        //TODO: check https
        seleniumSteps.setUpWebDriver(hostname);
        Thread.sleep(environment.getProperty("sleep.timeout.small", Long.class));
        //waitBigTimeout();
        List<WebElement> webElements = getWebDriver().findElements(By.cssSelector("#face"));

        // Do login if not logged in
        if (webElements.size() == 0) {
            serviceStepsBasic.switchToFrame("", "css", "body > div:nth-child(3) > iframe:nth-child(1)");
            typeIntoElementBySelector(username, "", "css", "#user_email");
            typeIntoElementBySelector(password, "", "css", "#user_password");
            clickOnElementBySelector("login button", "css", ".button");
            waitBigTimeout();
        }
    }

    @Given("I logged in to tickeronmailtest with $username and $password")
    public void doLoginToTickeronMailTestSelenium(String username, String password) throws InterruptedException {

        username = paramsAndVariablesSteps.substituteParamsAndVariables(username);
        password = paramsAndVariablesSteps.substituteParamsAndVariables(password);
        final String hostname = environment.getProperty("catchmail.webhost");
        //TODO: check https
        seleniumSteps.setUpWebDriver(hostname);
        Thread.sleep(environment.getProperty("sleep.timeout.small", Long.class));
        if (!"SquirrelMail - Login".equals(getWebDriver().getTitle())) {
            throw new InterruptedException("This is not the webmail page");
        }

        typeIntoElementBySelector(username, "", "css", "input[name='login_username']");
        typeIntoElementBySelector(password, "", "css", "input[name='secretkey']");
        clickOnElementBySelector( "", "css", "input[name='login_username']");
        clickOnElementBySelector("login button", "css", "input[type='submit']");
        waitSmallTimeout();
    }
    @Given("I logged in to googlemailtest with $username and $password")
    public void doLoginToGmailMailTestAccount(String username, String password) throws InterruptedException {

        username = paramsAndVariablesSteps.substituteParamsAndVariables(username);
        password = paramsAndVariablesSteps.substituteParamsAndVariables(password);
        final String hostname = environment.getProperty("catchmail.webhost2");
        //TODO: check https
        seleniumSteps.setUpWebDriver(hostname);
        Thread.sleep(environment.getProperty("sleep.timeout.small", Long.class));
//        if (!"SquirrelMail - Login".equals(getWebDriver().getTitle())) {
//            throw new InterruptedException("This is not the webmail page");
//        }

        typeIntoElementBySelector(username, "", "css", "#identifierId");
        clickOnElementBySelector( "", "css", ".RveJvd");
        typeIntoElementBySelector(password, "", "css", "input[name='password']");
        clickOnElementBySelector( "", "css", ".RveJvd");
        waitBigTimeout();
//        clickOnElementBySelector("login button", "css", "input[type='submit']");
//        waitSmallTimeout();
    }


    @Given("I logged in during maintenance with $username and $password")
    public void doLoginMaintenanceMode(String username, String password) throws InterruptedException {

        username = paramsAndVariablesSteps.substituteParamsAndVariables(username);
        password = paramsAndVariablesSteps.substituteParamsAndVariables(password);
        seleniumSteps.setUpWebDriver();
        // Thread.sleep(environment.getProperty("sleep.timeout.big", Long.class));

        clickOnElementBySelector("sign up", "css", ".btn");
        waitSmallTimeout();
        clickOnElementBySelector("login link", "css", ".cx-login-block__sign-in > a:nth-child(2)");
        waitSmallTimeout();
        typeIntoElementBySelector(username, "", "css", "#email");
        waitSmallTimeout();
        typeIntoElementBySelector(password, "", "css", "#password");
        clickOnElementBySelector("login button", "css", "input.btn");
        waitSmallTimeout();
        waitUntilServiceReady();
    }

    @Given("I logged OUT")
    public void doLogoutUsingSelenium() throws InterruptedException {

        clickOnElementBySelector("logout link", "css", ".cx-page-header__first-level__username");
        waitSmallTimeout();
        clickOnElementBySelector("logout button", "css", "#PageMenuLogOutButton");
        waitSmallTimeout();
       // clickOnElementBySelector("logout button", "css", "div.modal:nth-child(17) > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > button:nth-child(1)");
        clickOnElementBySelector("logout button", "css", "body > div.modal.fade.in > div > div > div.modal-footer > button.btn.btn-primary");
        waitUntilServiceReady();

    }

    @Given("I logged in to Admin Service with $username and $password")
    public void doLoginToAdminUsingSelenium(String username, String password) throws InterruptedException {
        username = paramsAndVariablesSteps.substituteParamsAndVariables(username);
        password = paramsAndVariablesSteps.substituteParamsAndVariables(password);
        seleniumSteps.setUpWebDriverForAdmin();
        waitSmallTimeout();
        seleniumSteps.openAdminUrl();
        waitSmallTimeout();
        typeIntoElementBySelector(username, "", "css", "input.ng-valid-email");
        waitUntilServiceReady();
        typeIntoElementBySelector(password, "", "css", "div.form-group:nth-child(2) > input:nth-child(1)");
        waitUntilServiceReady();
        clickOnElementBySelector("login button", "css", "#admin__login-form__login-button");
        waitUntilServiceReady();
        checkElementTextBySelectorContains("login button", "css", ".col-md-12 > h1:nth-child(1)", "Hello, admin!");
    }

    @Given("I authenticated using JSON to admin service with username $username and password $password")
    public void doApiLoginToAdmin(String user, String password) {
        user = this.paramsAndVariablesSteps.substituteParamsAndVariables(user);
        password = this.paramsAndVariablesSteps.substituteParamsAndVariables(password);

        // Crutch for app init
        httpSteps.performAdminJsonRequest("GET", "/");

        httpSteps.setRequestBody(
                String.format("{" +
                        "  \"captchaValue\": null," +
                        "  \"login\": \"%s\"," +
                        "  \"password\": \"%s\"," +
                        "  \"rememberMe\": true" +
                        "}" +
                        "", user, password));
        httpSteps.performAdminJsonRequest("POST", "api/CxAdminAuth/Login");
        if(httpSteps.getResponse().code() != 200) {
            throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException",
                    String.format("Can't do API login to Admin service. Status should be 200, but it is: %d", httpSteps.getResponse().code()));
        }
    }
    @Given("I set all permissions to admin for $username with $password")
    public void setPermissionsToAdvisor2(String username, String password) throws InterruptedException {
        // Are we have permissions?
        username = paramsAndVariablesSteps.substituteParamsAndVariables(username);
        password = paramsAndVariablesSteps.substituteParamsAndVariables(password);
        doApiLoginToAdmin(username, password);
        httpSteps.performAdminJsonRequest("POST", GET_PROFILE_ADMIN_METHOD_URL);
        JsonObject object = jsonParser.parse(httpSteps.getResponseBody().orElse("")).getAsJsonObject();
        JsonObject profile = object.get("Profile").getAsJsonObject();
        Boolean IsContentAdmin = profile.get("IsContentAdmin").getAsBoolean();
        Boolean IsSystemAdmin = profile.get("IsSystemAdmin").getAsBoolean();
        Boolean IsUserAdmin = profile.get("IsUserAdmin").getAsBoolean();
        Boolean IsDataAdmin = profile.get("IsDataAdmin").getAsBoolean();
        Boolean IsFinancialAdmin = profile.get("IsFinancialAdmin").getAsBoolean();
        Boolean IsAdminAccountsAdmin = profile.get("IsAdminAccountsAdmin").getAsBoolean();
        Boolean IsMallAdmin = profile.get("IsMallAdmin").getAsBoolean();
        Boolean IsPatternAdmin = profile.get("IsPatternAdmin").getAsBoolean();
        Boolean IsManager = profile.get("IsManager").getAsBoolean();

        // Delete all cookies
        if (!IsContentAdmin || !IsSystemAdmin || !IsUserAdmin || !IsDataAdmin || !IsFinancialAdmin || !IsAdminAccountsAdmin || !IsMallAdmin || !IsPatternAdmin || !IsManager) {

            doLoginToAdminUsingSelenium(username, password);
            seleniumSteps.openUrl("", EDIT_ADMIN_PROFILE_URL);
            waitUntilServiceReady();
            adminSteps.setAllPermissions();
            waitSmallTimeout();
    //if (any from list = false) do
        }

        seleniumSteps.resetBrowser();
    }

}
