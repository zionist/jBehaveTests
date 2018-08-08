package com.tickeron.test.web.functional.steps.service;

import com.tickeron.test.web.functional.steps.SeleniumSteps;
import org.jbehave.core.annotations.When;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by slaviann on 22.06.16.
 */
public class HomePageSteps extends ServiceStepsBasic {

    @Autowired
    private SeleniumSteps seleniumSteps;

    @When("I open portfolios block")
    public void openPortfoliosBlock() {
        this.clickOnElementBySelector("", "xpath", "(//span[contains(., \"Portfolios (A.I.)\")])");

    }
    @When("I open purchases block")
    public void openPurchasesBlock() {
        this.clickOnElementBySelector("", "xpath", "(//span[contains(., \"Purchases\")])[1]");

    }

    @When("I open AI patterns recognition block")
    public void openAiPatternsBlock() {
        this.clickOnElementBySelector("", "xpath", "//a[@href='/app/patterns/']");

    }

    @When("I open AI trend predictions block")
    public void openAiTrendPredictionsBlock() {
        this.clickOnElementBySelector("", "xpath", "(//span[contains(., \"Trend Predictions (A.I.)\")])[1]");

    }

    @When("I open community trend predictions block")
    public void openCommunityTrendPredictionsBlock() {
        this.clickOnElementBySelector("", "xpath", "(//span[contains(., \"Trend predictions (members)\")])[1]");

    }

    @When("I open starts here wizard")
    public void openStartsHereWizard() {
        this.clickOnElementBySelector("", "xpath", "(//span[contains(., \"Start here with\")])[1]");

    }

    @When("I open Upgrade block")
    public void openUpgradeBlock() {
        this.clickOnElementBySelector("", "xpath", "//a[@href='/app/user#!/memberships']");

    }

    @When("I open chats block")
    public void openChatsBlock() {
        seleniumSteps.executeJavaScript("$('a[href=\"/app/home#!/chats\"]').click()");

    }

    @When("I open notes block")
    public void openNotesBlock() {
        this.clickOnElementBySelector("", "xpath", "(//span[contains(., \"Notes\")])[1]");
    }

    @When("I open Notifications page")
    public void openNotificationsPage() {
        this.clickOnElementBySelector("", "css", ".cx-home-screen-more-events > a:nth-child(2)");
    }

    @When("I open Friends page")
    public void openFriendsPage() {
        this.clickOnElementBySelector("", "css", "a[href='/app/social#!/connections']");
    }

    @When("I open My public page")
    public void openMyPublicPage() {
        this.clickOnElementBySelector("", "css", "a[href='/app/social#!/members/me']");
    }

    @When("I open Payments page")
    public void openPaymentsPage() {
        seleniumSteps.executeJavaScript("$('a[href=\"/app/payment#!/transactions\"]')[1].click()");
    }

    @When("I open Listings page")
    public void openListingsPage() {
        this.clickOnElementBySelector("", "css", "a[href='/app/mallnew#!/listing']");
    }
}
