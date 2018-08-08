package com.tickeron.test.web.functional.steps.service;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.tickeron.test.web.functional.steps.HttpSteps;
import com.tickeron.test.web.functional.steps.ParamsAndVariablesSteps;
import com.tickeron.test.web.functional.steps.SeleniumSteps;
import com.tickeron.test.web.functional.steps.service.ServiceStepsBasic;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.assertEquals;

public class PatternSteps extends ServiceStepsBasic {
    private static final String GET_PROFILE_SUBSCRIBTIONS_URL = "api/CxUser/GetProfileSubscriptionsInfo";
    private static final String REMOVE_SUBSCRIBTIONS_URL = "api/CxAiSubscription/RemoveAiSubscription";
    private static final String ADD_SUBSCRIBTIONS_URL = "api/CxAiSubscription/AddAiSubscription";
    @Autowired
    private ServiceStepsBasic serviceStepsBasic;

    @Autowired
    private SeleniumSteps seleniumSteps;

    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;

    @Autowired
    private LoginSteps loginSteps;

    @Autowired
    private HttpSteps httpSteps;

    private JsonParser jsonParser = new JsonParser();


    @When("I create empty DB and forward Time Machine for $days days")
    public void TimeMachineForwarder(Integer days) {
        serviceStepsBasic.clickOnElementBySelector("System Menu", "css", "#navbar > ul:nth-child(1) > li:nth-child(3) > a");
        serviceStepsBasic.clickOnElementBySelector("Time machine", "css", "#navbar > ul:nth-child(1) > li.ng-scope.open > ul > li:nth-child(4) > a");
        waitUntilElementIsVisibleAndEnabled(By.cssSelector("#createDb-inputDate1")).clear();
        waitUntilElementIsVisibleAndEnabled(By.cssSelector("#createDb-inputDate1")).sendKeys("01/19/10");
        waitUntilElementIsVisibleAndEnabled(By.cssSelector(".col-xs-8")).click();
        serviceStepsBasic.clickOnElementBySelector("create empty DB", "css", "button.btn:nth-child(1)");
        waitBigTimeout();
        waitBigTimeout();
        getWebDriver().navigate().refresh();
        waitSmallTimeout();

        for (int i = 0; i <= days; i++) {
            serviceStepsBasic.clickOnElementBySelector("field", "css", "#wrapper > div > div > ui-view > div.form-horizontal.ng-scope > div > div > select");
            serviceStepsBasic.clickOnElementBySelector("field", "css", "select.form-control > option:nth-child(2)");
            serviceStepsBasic.clickOnElementBySelector("submit", "css", "#wrapper > div > div > ui-view > div:nth-child(4) > div > div > div > button");
            waitBigTimeout();
            waitSmallTimeout();
        }
    }

    @When("I forward Time Machine for $newdays days")
        public void TimeMachineForward(Integer newdays) {
             for (int i=0; i<=newdays; i++ )
            {
                serviceStepsBasic.clickOnElementBySelector("field", "css", "#wrapper > div > div > ui-view > div.form-horizontal.ng-scope > div > div > select");
                serviceStepsBasic.clickOnElementBySelector("field", "css", "select.form-control > option:nth-child(2)");
                serviceStepsBasic.clickOnElementBySelector("submit", "css", "#wrapper > div > div > ui-view > div:nth-child(4) > div > div > div > button");
                waitBigTimeout();
            }
    }

    @When("Patterns. I check More pattern description on overview page")
    public void checkMorePatternDescription() {
        clickOnElementBySelector("", "xpath", "//button[@class='btn-more']");
        checkElementTextBySelectorContains("", "xpath", "//div[h1/text()='Overview']", "Overview" );
        seleniumSteps.executeJavaScript("$(\".close\").click()");
    }

    @When("Patterns. I remove all set up alerts")
    public void removeAllSetAlerts() {
        List<WebElement> removeList=getWebDriver().findElements(By.className("btn-x-icon-big"));
        for(int i = removeList.size(); i > 0; i--){
            String javaScriptExpression = "$(\".btn-x-icon-big\")" + "[" + Integer.toString(i-1) + "]" + ".click()";
            seleniumSteps.executeJavaScript(javaScriptExpression);
        }
    }


    @When("Patterns. Open tab $patternStatus")
    public void removeAllSetAlerts(String patternStatus) {
        patternStatus = substituteParamsAndVariables(patternStatus);
        switch(patternStatus) {
            case "Emerging":
                serviceStepsBasic.clickOnElementBySelector("", "css", "li[ng-click=\"model.filter.state = 'Emerged'\"]");
                break;
            case "Confirmed":
                serviceStepsBasic.clickOnElementBySelector("", "css", "li[ng-click=\"model.filter.state = 'Confirmed'\"]");
                break;
            case "Successful":
                serviceStepsBasic.clickOnElementBySelector("", "css", "li[ng-click=\"model.filter.state = 'Successed'\"]");
                break;
            case "Inactive":
                serviceStepsBasic.clickOnElementBySelector("", "css", "li[ng-click=\"model.filter.state = 'Failed'\"]");
                break;
            default:
                throw new RuntimeException(String.format("Wrong pattern status name - %s", patternStatus));
        }
    }

    @Given("User $username with password $password has no AI Patterns subscription")
    public void userHasNoPatternSubscribtion(String username, String password) {
        // Are patterns subscribtion activated?
        username = paramsAndVariablesSteps.substituteParamsAndVariables(username);
        password = paramsAndVariablesSteps.substituteParamsAndVariables(password);
        loginSteps.doApiLogin(username, password);
        httpSteps.performJsonRequest("POST", GET_PROFILE_SUBSCRIBTIONS_URL);
        JsonObject object = jsonParser.parse(httpSteps.getResponseBody().orElse("")).getAsJsonObject();
        Boolean hasPatternRecognition  = object.get("HasPatternRecognition").getAsBoolean();

        // If yes - deactivate it
        if (hasPatternRecognition) {
            httpSteps.setRequestBody("{\"subscriptionType\": 0}");
            httpSteps.performJsonRequest("POST", REMOVE_SUBSCRIBTIONS_URL);
            assertEquals(httpSteps.getResponse().code(), 200);
            //{"subscriptionType": 0}
        }
    }

    public void buyAiPatternSubscribtion() {
        httpSteps.setRequestBody("{\"subscriptionType\": 0}");
        httpSteps.performJsonRequest("POST", ADD_SUBSCRIBTIONS_URL);
        assertEquals(httpSteps.getResponse().code(), 200);
    }


}



