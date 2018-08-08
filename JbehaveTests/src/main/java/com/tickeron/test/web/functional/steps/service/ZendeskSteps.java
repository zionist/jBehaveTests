package com.tickeron.test.web.functional.steps.service;


import com.tickeron.test.web.functional.steps.ParamsAndVariablesSteps;
import com.tickeron.test.web.functional.steps.SeleniumSteps;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;

/**
 * Created by Admin on 01.12.2016.
 */
public class ZendeskSteps extends ServiceStepsBasic {

    @Autowired
    private SeleniumSteps seleniumSteps;

    @Autowired
    private Environment environment;

    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;

    @Autowired
    private LoginSteps loginSteps;
    @Autowired
    private MallSteps mallSteps;


    public void clickOnSideMenuViewsIcon() {
        //clickOnElementBySelector("", "css", "a[href='/agent/filters']");
        getWebDriver().switchTo().defaultContent();
        seleniumSteps.executeJavaScript("$(\"a[href='/agent/filters']\")[0].click()");
        getWebDriver().switchTo().defaultContent();

    }

    public void clickOnLastTicketInList() {
        setRequestedOrderDesc();
        seleniumSteps.executeJavaScript("$(\"tr.regular:nth-child(1) > td:nth-child(5) > a:nth-child(1)\").click()");
    }

    @When("Open Zendesk last ticket")
    public void openZendeskLastTicket() {
        clickOnSideMenuViewsIcon();
        waitSmallTimeout();
        clickOnLastTicketInList();
        waitSmallTimeout();
    }

    private void setRequestedOrderDesc() {
        //check Requested sorting order and set to descending
        WebElement columnHeader = waitUntilElementIsVisibleAndEnabled(By.xpath("(//table/thead/tr/th[@data-column-id='created'])[1]"));
        String columnClassName = columnHeader.getAttribute("class");
        //System.out.println(String.format("class name %s", columnClassName));
        if (columnClassName.equals("sortable") || columnClassName.equals("sortable asc")) {
            columnHeader.click();
            waitSmallTimeout();
        }
    }

    @When("I check in zendesk sent message with text $text")
    @Given("I check in zendesk sent message with text $text")
    public void checkZendeskMessage(String text) throws InterruptedException {
        loginSteps.doLoginToZendeskUsingSelenium();
        openZendeskLastTicket();
        checkElementTextBySelectorContains("", "css", ".zd-comment > p:nth-child(1)", text);
    }

    @When("I check that zendesk ticket with $title have status is(choose one of solved/open/pending): $status")
    @Given("I check that zendesk ticket with $title have status is(choose one of solved/open/pending): $status")
    @Then("I check that zendesk ticket with $title have status is(choose one of solved/open/pending): $status")
    public void checkStatusZendeskTicket(String title, String status) throws InterruptedException {
        loginSteps.doLoginToZendeskUsingSelenium();
        clickOnSideMenuViewsIcon();
        switch (status) {
            case "solved": clickOnElementBySelector("", "css", "li.legacy-styling:nth-child(6) > a:nth-child(1)");
                break;
            case "open": clickOnElementBySelector("", "css", "li.legacy-styling:nth-child(1) > a:nth-child(1)");
                break;
            case "pending": clickOnElementBySelector("", "css", "li.legacy-styling:nth-child(5) > a:nth-child(1)");
                break;
            default:
                throw new RuntimeException(String.format("Wrong ticket status - %s", status));
        }
        // .deleted_tickets    deleted
        // .suspended_tickets
        waitSmallTimeout();
        clickOnLastTicketInList();
        waitSmallTimeout();
        checkZendeskTicketSubject(title);
        checkElementTextBySelectorContains("", "css", "span.active:nth-child(2) > span:nth-child(1)", status);
        //checkElementTextBySelectorContains("", "css", "div.workspace:nth-child(3) > section:nth-child(2) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(4) > input:nth-child(1)", title);
    }

    @When("I check in zendesk sent message and subject with text $messageText and subject $reason")
    @Given("I check in zendesk sent message and subject with text $messageText and subject $reason")
    public void checkZendeskMessage(String text, String subject) throws InterruptedException {
        checkZendeskMessage(text);
        checkZendeskTicketSubject(subject);
    }

    private void checkZendeskTicketSubject(String subject) throws InterruptedException {
        subject = paramsAndVariablesSteps.substituteParamsAndVariables(subject);
        checkElementPropertyContains("", "div[class='header pane_header mast clearfix web'] input[name='subject']", "value", subject);
    }

    @When("I report a problem about ticker $ticker with text $text")
    public void reportAProblemAboutTicker(String tickerName, String text) throws InterruptedException {
        clickOnElementBySelector("", "css", "#filterInput");
        waitSmallTimeout();
        clickOnElementBySelector("", "css", ".cx-ticker-picker-report-missed-link");
        waitSmallTimeout();
        typeIntoElementBySelector(tickerName, "", "css", "input.ng-valid-pattern");
        typeIntoElementBySelector(text, "", "css", "div.form-group:nth-child(2) > div:nth-child(2) > input:nth-child(1)");
        clickOnElementBySelector("", "css", "button.btn-primary-sm:nth-child(2)");
        checkElementTextBySelectorContains("", "css", ".toast-message", "Ticker " + tickerName + " is successfully reported");
    }

    @When("I request refund with reason $reason and with text $text")
    public void requestRefound(String reason, String text) throws InterruptedException {
        selectFromList(reason, "ByVisibleText", "css", "#reason");
        waitSmallTimeout();
        seleniumSteps.executeJavaScript(String.format("CKEDITOR.instances.text.setData(\"%s\")", text));
        // typeIntoElementBySelector(text, "", "css", "body > p:nth-child(1)");
        waitSmallTimeout();
        clickOnElementBySelector("", "css", "button.btn:nth-child(5)");
        checkElementTextBySelectorContains("", "css", ".toast-message", "Your refund request was submitted.");
    }

    public void openReportProblemWindow() {
        clickOnElementBySelector("", "xpath", "//a[text()='Report a problem']");
        waitUntilServiceReady();
    }

    public void sendGeneralReportFromOpenWindow (String reason, String text) {
        reason = substituteParamsAndVariables(reason);
        text = substituteParamsAndVariables(text);
        //waitUntilElementIsVisibleAndEnabled("", "xpath", "//div[@class='cx-marketing-modal__title']/span[text()='Report a problem']");
        waitBigTimeout();
        selectFromList(reason, "ByVisibleText", "css", "#subject");
        typeIntoElementBySelector(text, "", "css", "#message");
        clickOnElementBySelector("", "css", ".btn-loader");
        waitUntilServiceReady();
        checkElementTextBySelectorContains("", "css", ".toast-success", "Your report has been sent.");
    }

    @When("I send General Report with reason $reason and with text $text")
    public void sendGeneralReport(String reason, String text) {
        openReportProblemWindow();
        sendGeneralReportFromOpenWindow(reason, text);
    }

    @When("I send Issue Refund As Seller with text $text")
    public void sendIssueRefundAsSeller(String text) {
        clickOnElementBySelector("", "css", "button[ng-click='processRefund(false)']");
        waitSmallTimeout();
        seleniumSteps.executeJavaScript(String.format("CKEDITOR.instances.text.setData(\"%s\")", text));
        clickOnElementBySelector("", "css", "button.btn:nth-child(4)");
        waitUntilServiceReady();
        checkElementTextBySelectorContains("", "css", ".toast-success", "Refund request was issued.");
        waitSmallTimeout();
    }
    @When("I reject Issue Refund As Seller with text $text")
    public void rejectIssueRefundAsSeller(String text) {
        clickOnElementBySelector("", "css", "button[ng-click='processRefund(true)']");
        waitSmallTimeout();
        seleniumSteps.executeJavaScript(String.format("CKEDITOR.instances.text.setData(\"%s\")", text));
        waitSmallTimeout();
        clickOnElementBySelector("", "css", "button.btn:nth-child(4)");
        waitUntilServiceReady();
        checkElementTextBySelectorContains("", "css", ".toast-success", "Refund request was rejected.");
        waitSmallTimeout();
    }
    @When("I send General Report with file $filename with reason $reason and with text $text")
    public void sendGeneralReportWithFile(String filename, String reason, String text) throws InterruptedException{
        filename = substituteParamsAndVariables(filename);
        openReportProblemWindow();
        attachFileToReportProblemPopup(filename);
        sendGeneralReportFromOpenWindow(reason, text);
    }

    public void attachFileToReportProblemPopup(String filename) throws InterruptedException{
        waitSmallTimeout();
        String executable = "$(\"input[type='file']\").show()";
        seleniumSteps.executeJavaScript(executable);
        uploadFile(filename, "css", "input[type='file']");
    }


    //status: open, pending, solved
    @When("Zendesk. Submit ticket as $status")
    public void submitTicketWithStatus(String status){
        status = substituteParamsAndVariables(status);
        clickOnElementBySelector("", "xpath", "(//div[@class='ember-view btn-group dropup ticket_submit_buttons status_button']/button[@class='btn btn-inverse dropdown-toggle'])[last()-1]");
        String statusSelector;
        switch(status) {
            case "solved":
                statusSelector = "(//li[@class='ember-view solved status _tooltip'])[last()-1]";
                break;
            case "pending":
                statusSelector = "(//li[@class='ember-view pending status _tooltip'])[last()-1]";
                break;
            case "open":
                statusSelector = "(//li[@class='ember-view open status _tooltip'])[last()-1]";
                break;
            default:
                throw new RuntimeException(String.format("Wrong ticket status - %s", status));
        }
        clickOnElementBySelector("", "xpath", statusSelector);

    }

    @When("Zendesk. iExpert. Open Report problem dialog")
    public void openReportProblemIExpert() {
        clickOnElementBySelector("", "xpath", "//span[@ng-click='showReportForm();']");
    }

    @When("Zendesk. iExpert. Send report with reason $reason and text $text")
    public void sendIExpertReportFromOpenWindow (String reason, String text) {
        reason = substituteParamsAndVariables(reason);
        text = substituteParamsAndVariables(text);
        //waitUntilElementIsVisibleAndEnabled("", "xpath", "//form[@id='form']/h4[text()='Report a problem']");
        waitBigTimeout();
        selectFromList(reason, "ByVisibleText", "css", "#cxReportProblemModalSelect");
        typeIntoElementBySelector(text, "", "css", "#cxReportProblemModalText");
        clickOnElementBySelector("", "xpath", "//button[@ng-click='save()']");
        waitUntilServiceReady();
        checkElementTextBySelectorContains("", "css", ".toast-success", "Your report was successfully saved and will be sent to administrator.");
        waitUntilServiceReady();
    }

    @When("Zendesk. iExpert. Send report with file $filename with reason $reason and with text $text")
    public void sendIExpertReportWithFile(String filename, String reason, String text) throws InterruptedException{
        filename = substituteParamsAndVariables(filename);
        attachFileToReportProblemPopup(filename);
        sendIExpertReportFromOpenWindow(reason, text);
    }

}


