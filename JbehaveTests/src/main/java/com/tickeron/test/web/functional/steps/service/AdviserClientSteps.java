package com.tickeron.test.web.functional.steps.service;

import com.tickeron.test.web.functional.steps.ParamsAndVariablesSteps;
import com.tickeron.test.web.functional.steps.SeleniumSteps;
import org.jbehave.core.annotations.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by slaviann on 15.12.15.
 */
public class AdviserClientSteps extends ServiceStepsBasic {

    @Autowired
    private SeleniumSteps seleniumSteps;

    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;

    @Autowired
    MenuStepsPageObject menuStepsPageObject;


    @When("Adviser client. Make me visible with portfolio $portfolioTitle")
    public void makeMeVisibleIfNotvisible(String portfolioTitle) throws InterruptedException {
        menuStepsPageObject.openAdvisors();
        waitUntilServiceReady();
        WebElement element = waitUntilElementIsVisibleAndEnabled(new By.ByCssSelector(".ac-let__toggle"));
        String cls = element.getAttribute("class");
        System.out.println(cls);
        // Do nothing if user is already visible for advisors
        if (cls.contains("cx-toggle-on-off_on")) return;
        clickOnElementBySelector("Find advisor menu", "containsText", "Find Advisor");
        waitUntilServiceReady();
        clickOnElementBySelector("let advisor find me", "css", ".ac-let__toggle");
        waitUntilServiceReady();
        clickOnElementBySelector("review button", "css", "button.btn-primary:nth-child(2)");
        waitUntilServiceReady();
        startActionRecord();
        actionsMoveToElementBySelector("ADD MORE portfolios button", "css", "button.btn-secondary:nth-child(1)");
        performAction();
        clickOnElementBySelector("ADD MORE portfolios button", "css", "button.btn-secondary:nth-child(1)");
        waitSmallTimeout();
        waitSmallTimeout();
        seleniumSteps.executeJavaScript(String.format("$(\"td:contains('%s')\").parent().children().last().children().last().click()", portfolioTitle));
        clickOnElementBySelector("Done button", "css", "body > div.modal.fade.in > div > div > div.modal-footer > button.btn.btn-primary");
        // button[class='btn btn-primary']
        //$("td:contains('Personalaf75a5ce-2752-43a6-853b-c1367a8eb506')").parent().children().last().children().last().click()
        waitSmallTimeout();
        clickOnElementBySelector("Save and Exit", "containsText", "Save and Exit");
        waitUntilServiceReady();



        checkElementTextBySelectorIs("h1", "css", ".ac-title", "Find Advisor");


        // <div style="" state="mdl.isVisible" on-change="onVisibilityChange" class="ac-let__toggle cx-toggle-on-off_blue cx-toggle-on-off ng-isolate-scope cx-toggle-on-off_on" ng-click="onChange()" ng-class="{'cx-toggle-on-off_on' : state, 'cx-toggle-on-off_off' : !state}"></div>
        // <div style="" state="mdl.isVisible" on-change="onVisibilityChange" class="ac-let__toggle cx-toggle-on-off_blue cx-toggle-on-off ng-isolate-scope cx-toggle-on-off_off" ng-click="onChange()" ng-class="{'cx-toggle-on-off_on' : state, 'cx-toggle-on-off_off' : !state}"></div>
        //clickOnElementBySelector("", "");

    }


}


