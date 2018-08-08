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
public class PortfolioSteps extends ServiceStepsBasic {

    @Autowired
    private MenuStepsPageObject menuStepsPageObject;
    @Autowired
    private HomePageSteps homePageSteps;
    @Autowired
    private SeleniumSteps seleniumSteps;
    @Autowired
    private ApplicationContext applicationContext;
    @Autowired
    private ServiceStepsBasic serviceStepsBasic;


    /**
     * Try to find portfolio with title in portfolio listing and click on it. If not click next and try to find again ...
     * @param portfolioName
     */

    private void findPortfolioInternal(String portfolioName) {
        WebElement webElement = getWebDriver().findElement(new By.ByCssSelector(".cx-portfolio-list"));
        // Find h5 with portfolio titles in container element

        for (WebElement element : webElement.findElements(new By.ByCssSelector("h3"))) {
            if (element.getText().equals(portfolioName)) {
                element.click();
                return;
            }
        }

        // Is there next button?
        String result = seleniumSteps.executeJavaScript("return $('a:contains(Next)').length").get().toString();

        if (result.equals("1")) {
            // next button was on page
            seleniumSteps.executeJavaScript("$('a:contains(Next)').click()");
            waitUntilServiceReady();
            // recursive call.
            findPortfolioInternal(portfolioName);
        }
        //throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException",
        //        String.format("Can't find portfolio %s in portfolio listing", portfolioName));
    }

    @When("Portfolio. I find portfolio $portfolioName")
    public void findPortfolio(String portfolioName) {
        portfolioName = substituteParamsAndVariables(portfolioName);
        menuStepsPageObject.openHome();
        homePageSteps.openPortfoliosBlock();
        waitBigTimeout();
        waitUntilServiceReady();
        findPortfolioInternal(portfolioName);
    }

    @When("Portfolio. I remove in list portfolio $portfolioName")
    public void removeFromListPortfolio(String portfolioName) {
        portfolioName = substituteParamsAndVariables(portfolioName);
        menuStepsPageObject.openHome();
        homePageSteps.openPortfoliosBlock();
        waitBigTimeout();
        waitUntilServiceReady();
        findPortfolioInternal(portfolioName);
        waitUntilElementIsVisibleAndEnabled(new By.ByCssSelector(".social-menu__icon_remove")).click();
        waitUntilServiceReady();
        waitUntilElementIsVisibleAndEnabled(new By.ByCssSelector("button.ng-binding:nth-child(1)")).click();
        waitUntilServiceReady();
    }

    @When("I remove portfolio")
    public void removePortfolio() {
        seleniumSteps.executeJavaScript("$('.social-menu__icon_remove').click()");
        waitUntilElementIsVisibleAndEnabled(new By.ByCssSelector("button.ng-binding:nth-child(1)")).click();
        waitUntilServiceReady();
    }

    @When("I add ticker $ticker with $selectorType selector $selector in module(choose one of MALL/Start here/Portfolio/Article/Blog): $module")
    //@And("I add ticker $ticker with $selectorType selector $selector")
    public void addTicker(String ticker, String selectorType, String selector, String module) throws InterruptedException {
        //  public void clickOnElementBySelector(String description, String selectorType, String selector) {
        waitUntilElementIsVisibleAndEnabled(new By.ByCssSelector("#filterInput")).click();
        waitUntilServiceReady();
        serviceStepsBasic.typeIntoElementBySelector(ticker, "ticker", "css", "#filterInput");
        waitSmallTimeout();
        clickOnElementBySelector(ticker, selectorType, selector);
        waitSmallTimeout();
        switch (module) {
            case "MALL": //clickOnElementBySelector("", "css", "li.legacy-styling:nth-child(6) > a:nth-child(1)");
                break;
            case "Start here": clickOnElementBySelector("", "css", "button[ng-click='addTickers()']");
                break;
            case "Portfolio": clickOnElementBySelector("", "css", "button[ng-click='addTickers(false)']");
                break;
            case "Article": clickOnElementBySelector("", "css", "span[ng-click='updateTickerCollection()']");
                break;
            case "Blog": clickOnElementBySelector("", "css", "button[ng-click='updateSelected()']");
                break;
            default:
                throw new RuntimeException(String.format("Wrong ticker status - %s", module));
        }
        waitUntilServiceReady();

    }
}

