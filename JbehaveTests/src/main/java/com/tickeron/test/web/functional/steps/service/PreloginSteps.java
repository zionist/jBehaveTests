package com.tickeron.test.web.functional.steps.service;

import com.tickeron.test.web.functional.steps.ParamsAndVariablesSteps;
import com.tickeron.test.web.functional.steps.SeleniumSteps;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Nikolai on 07.31.16.
 */
public class PreloginSteps extends ServiceStepsBasic {

    @Autowired
    private SeleniumSteps seleniumSteps;

    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;

    @Then("I see log in pop-up window and close it")
    public void seeLoginWindowCloseIt() {
        checkElementTextBySelectorContains("Login pop-up window", "xpath", "//span[contains(., 'Welcome to Tickeron!')]", "Welcome to Tickeron!");
        waitSmallTimeout();
        seleniumSteps.executeJavaScript("$(\".close\").click()");
    }

    @Then("I see sign up pop-up window and close it")
    public void seeSignupWindowCloseIt() {
        checkElementTextBySelectorContains("Signup pop-up window", "xpath", "//span[contains(., 'Get Started for')]", "Get Started for");
        waitSmallTimeout();
        seleniumSteps.executeJavaScript("$(\"button[ng-click='cancel()']\").click()");
    }

    @Then("I see email catch pop-up window and close it")
    public void seeEmailCatchWindowCloseIt() {
        checkElementTextBySelectorContains("Signup pop-up window", "xpath", "//h3[contains(., 'Warning!')]", "Warning!");
        waitSmallTimeout();
        seleniumSteps.executeJavaScript("$(\"button[ng-click='cancel();']\").click()");
    }
    @When("Explore as guest. Click on Mall block and check header")
    public void exploreAsGuestClickMallBlock() {
        seleniumSteps.executeJavaScript("$(\"a[href='/app/mallnew']\")[0].click()");
        //clickOnElementBySelector("", "xpath", "//a[@href='/app/mallnew']");
        waitSmallTimeout();
        checkElementTextBySelectorContains("", "css", ".explore-as-guest__intro-page-container__left-info-plate-title", "MALL");
    }

    @When("Main page. Click on Advisor rectangle")
    public void clickOnAdvisorRectangle() {
        clickOnElementBySelector("", "css", "a.homepage-menu-item[href=\"/#/advisor\"]");
    }

    @When("Main page. Click on Expert rectangle")
    public void clickOnExpertRectangle() {
        clickOnElementBySelector("", "css", "a.homepage-menu-item[href=\"/#/expert\"]");
    }

    @When("Main page. Click on Intermediate rectangle")
    public void clickOnIntermediateRectangle() {
        clickOnElementBySelector("", "css", "a.homepage-menu-item[href=\"/#/intermediate\"]");
    }

    @When("Main page. Click on Beginner rectangle")
    public void clickOnBeginnerRectangle() {
        clickOnElementBySelector("", "css", "a.homepage-menu-item[href=\"/#/beginner\"]");
    }





}


