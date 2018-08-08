package com.tickeron.test.web.functional.steps.service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.tickeron.test.web.functional.steps.HttpSteps;
import com.tickeron.test.web.functional.steps.ParamsAndVariablesSteps;
import com.tickeron.test.web.functional.steps.SeleniumSteps;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.When;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by slaviann on 15.12.15.
 */
public class MenuStepsPageObject extends ServiceStepsBasic {

    @Autowired
    private SeleniumSteps seleniumSteps;

    @Autowired
    private HomePageSteps homePageSteps ;

    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;

    @When("I open HOME menu")
    public void openHome() {
        this.clickOnElementBySelector("", "css", "#page_menu__home");
        waitUntilServiceReady();
    }

    @When("I open MALL menu")
    public void openMall() {
        this.clickOnElementBySelector("", "css", "#page_menu__mall");
        waitUntilServiceReady();
    }

    @When("I open CLIENTS menu")
    public void openClients() {
        this.clickOnElementBySelector("", "css", "a.cx-page-header__first-level__link:nth-child(3)");
        waitUntilServiceReady();
    }
    @When("I open FIND NEW CLIENTS menu")
    public void openFindNewClients() {
        this.clickOnElementBySelector("", "css", "a.cx-second-level-menu-item:nth-child(1)");
        waitUntilServiceReady();
    }

    @When("I open Current Advisor menu")
    public void openCurrentAdvisor() {
        this.clickOnElementBySelector("", "css", "a.cx-second-level-menu-item:nth-child(2)");
        waitUntilServiceReady();
    }



    @When("I open Invite Advisors to Tickeron menu")
    public void openInviteAdvisorsToTickeron() {
        this.clickOnElementBySelector("", "css", "a.cx-second-level-menu-item:nth-child(3)");
        waitUntilServiceReady();
    }

    @When("I open Request Form menu")
    public void openRequestForm() {
        this.clickOnElementBySelector("", "css", "a.cx-second-level-menu-item:nth-child(5)");
        waitUntilServiceReady();
    }


    @When("I open ADVISORS menu")
    public void openAdvisors() {
        this.clickOnElementBySelector("", "css", "a.cx-page-header__first-level__link:nth-child(3)");
        waitUntilServiceReady();
        seleniumSteps.executeJavaScript("$(\"div[ng-click=\\\"GoTo('../../app/advisor-client#!/?tab=search-for-advisors')\\\"]\")[0].click()");
        waitUntilServiceReady();
    }

    @When("I open Your Clients menu")
    public void openYourClients() {
        this.clickOnElementBySelector("", "css", "a.cx-second-level-menu-item:nth-child(2)");
        waitUntilServiceReady();
    }

    @When("I open Invite Clients to Tickeron menu")
    public void openInviteClientstoTickeron() {
        this.clickOnElementBySelector("", "css", "a.cx-second-level-menu-item:nth-child(3)");
        waitUntilServiceReady();
    }
    @When("I open 1-on-1 menu on Advisor side")
    public void open1on1() {
        this.clickOnElementBySelector("", "css", "a.cx-second-level-menu-item:nth-child(4)");
        waitUntilServiceReady();
    }
    @When("I open 1-on-1 menu on Client side")
    public void open1on1Clint() {
        this.clickOnElementBySelector("", "css", "a.cx-second-level-menu-item:nth-child(4)");
        waitUntilServiceReady();
    }
    @When("I open Manage Terms & Conditions menu")
    public void openManageTermsAndConditions() {
        this.clickOnElementBySelector("", "css", "a.cx-second-level-menu-item:nth-child(5)");
        waitUntilServiceReady();
    }

    
    @When("I open ACADEMY menu")
    public void openAcademy() {
        this.clickOnElementBySelector("", "css", "#page_menu__iexpert");
        waitUntilServiceReady();
    }

    @When("I open IEXPERT menu")
    public void openIexpert() throws InterruptedException {
        this.clickOnElementBySelector("", "xpath", "//a[@href='/app/academy#!/overview']");
        waitUntilServiceReady();
        this.startActionRecord();
        this.actionsMoveToElementBySelector("", "css", "div.col-xs-12:nth-child(2) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1)");
        this.performAction();
        this.clickOnElementBySelector("", "css", "a[href='/app/academy#!/iexpert/index']");
        waitUntilServiceReady();
    }
    @When("I open WEBCASTS menu")
    public void openWebcasts() throws InterruptedException {
        this.clickOnElementBySelector("", "css", "#page_menu__iexpert");
        waitUntilServiceReady();
        this.startActionRecord();
        this.actionsMoveToElementBySelector("", "css", "div.col-lg-6:nth-child(1) > div:nth-child(2) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1)");
        this.performAction();
        this.clickOnElementBySelector("", "css", "a[href='/app/academy#!/webcasts']");
       waitUntilServiceReady();
  }

    @When("I open COMMUNITY menu")
    public void openCommunity() {
        this.clickOnElementBySelector("", "css", "#page_menu__community");
        waitUntilServiceReady();
        seleniumSteps.executeJavaScript("$(\"div[ng-click=\\\"GoTo('../../app/social#!/members/me')\\\"]\")[0].click()");
        waitUntilServiceReady();
    }

    @When("I open COMMUNITY - Clubs menu")
    public void openCommunityClubs() {
        this.clickOnElementBySelector("", "css", "#page_menu__community");
        waitUntilServiceReady();
        seleniumSteps.executeJavaScript("$(\"div[ng-click=\\\"GoTo('../../app/social#!/clubs/list')\\\"]\")[0].click()");
        waitUntilServiceReady();
    }

    @When("I open COMMUNITY - Friends menu")
    public void openCommunityFriends() {
        this.clickOnElementBySelector("", "css", "#page_menu__community");
        waitUntilServiceReady();
        seleniumSteps.executeJavaScript("$(\"div[ng-click=\\\"GoTo('../../app/social#!/connections')\\\"]\")[0].click()");
        waitUntilServiceReady();
    }

    @When("I open COMMUNITY - Tickers menu")
    public void openCommunityTickers() {
        this.clickOnElementBySelector("", "css", "#page_menu__community");
        waitUntilServiceReady();
        seleniumSteps.executeJavaScript("$(\"div[ng-click=\\\"GoTo('../../app/social#!/tickers')\\\"]\")[0].click()");
        waitUntilServiceReady();
    }

    @When("I open CONTENT ADMIN menu")
    public void openContentAdmin() {
        this.clickOnElementBySelector("", "css", "#page_menu__community");
        waitUntilServiceReady();
        seleniumSteps.executeJavaScript("$(\"div[ng-click=\\\"GoTo('../../app/social#!/connections')\\\"]\")[0].click()");
        waitUntilServiceReady();
        this.clickOnElementBySelector("", "css", "a[href='/app/forum#!/adminDashboard'");
        waitUntilServiceReady();

    }

    @When("I open EXPLORE AS GUEST menu")
    public void openExploreAsGuest() {
        this.clickOnElementBySelector("", "css", "a[href='/app/guest#!/'");
        waitUntilServiceReady();
    }

    @When("I open Personal Profile menu")
    public void openPersonalProfile() {
        this.clickOnElementBySelector("", "css", ".cx-page-header__first-level__username");
        this.clickOnElementBySelector("", "css", "a.dropdown-item:nth-child(1)");
        waitUntilServiceReady();
    }

    @When("I open Payments menu")
    public void openPaymentsMenu() {
        this.clickOnElementBySelector("", "css", ".cx-page-header__first-level__username");
        this.clickOnElementBySelector("", "containsText", "Payments");
        waitUntilServiceReady();
    }

    @When("I open Refund Menu In Admin")
    public void openFinancesMenuInAdmin() {
        this.clickOnElementBySelector("", "css", " #admin__menu__finances");
        waitUntilServiceReady();
        this.clickOnElementBySelector("", "css", "#admin__menu__finances__refunds");
        waitUntilServiceReady();
    }

    @When("I open Notifications (click on BELL) page")
    public void openEventsPage() {

        this.clickOnElementBySelector("", "css", "#page_menu__alerts");
    }

    @When("I open First notification on Notification page")
    public void openFirstNotification() {
        this.openHome();
        homePageSteps.openNotificationsPage();
        waitUntilServiceReady();
        seleniumSteps.executeJavaScript("$(\"a[class*='cx-wall-table__more ng-scope']:first\").click()");
        waitSmallTimeout();
        this.clickOnElementBySelector("", "xpath", "//a[text()='Click here']"); // selector //a[text()='Click here']
        waitUntilServiceReady();
    }


}


