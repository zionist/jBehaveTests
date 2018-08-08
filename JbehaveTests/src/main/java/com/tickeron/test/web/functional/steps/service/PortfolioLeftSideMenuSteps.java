package com.tickeron.test.web.functional.steps.service;

import com.tickeron.test.web.functional.steps.SeleniumSteps;
import org.jbehave.core.annotations.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

/**
 * Created by slaviann on 13.09.15.
 */
public class PortfolioLeftSideMenuSteps extends ServiceStepsBasic {

    @Autowired
    private MenuStepsPageObject menuStepsPageObject;
    @Autowired
    private HomePageSteps homePageSteps;
    @Autowired
    private SeleniumSteps seleniumSteps;
    @Autowired
    private ApplicationContext applicationContext;


    @When("Portfolio left side menu. Click on Summary")
    public void portfolioLeftSideSummary() {
        waitUntilElementIsVisibleAndEnabled(new By.ByXPath("//a[@class='social-menu__item-content ng-scope']/span[text()='Summary']")).click();
    }
}
