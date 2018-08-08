package com.tickeron.test.web.functional.steps.service;

import com.tickeron.test.web.functional.steps.ParamsAndVariablesSteps;
import com.tickeron.test.web.functional.steps.SeleniumSteps;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.openqa.selenium.WebElement;
import org.springframework.beans.factory.annotation.Autowired;


/**
 * Created by Nikolai on 15.12.2016.
 */
public class CatchWebMail extends ServiceStepsBasic {

    @Autowired
    private SeleniumSteps seleniumSteps;
    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;
    @Autowired
    private ServiceStepsBasic serviceStepsBasic;

    @When("CatchMail. Get mail body and add string $text at the beginning")
    public void getMailBodyAddTextAtBeginning(String text) {
        text = substituteParamsAndVariables(text);
        WebElement mailBody = getWebDriver().findElement(serviceStepsBasic.getByBySelectorType("css", "#body"));
        String message = mailBody.getText();
        message = text + "\n\r" + message;
        mailBody.clear();
        mailBody.sendKeys(message);

    }

    @When("CatchMail. I open last email with subject [Request received]")
    public void openLastRequestReceivedEmail() {
        switchToFrame("right", "css", "#fs1 > frame:nth-child(2)");
        clickOnElementBySelector("", "xpath", "(//a[contains(text(),'[Request received]')])[1]");
        waitSmallTimeout();
    }

    @When("CatchMail. I open last email letter with subject $subject")
    public void openLastReceivedEmail(String subject) {
        switchToFrame("right", "css", "#fs1 > frame:nth-child(2)");
        clickOnElementBySelector("", "link", subject);
        waitSmallTimeout();
    }

    @When("CatchMail. I open last email which has $subject")
    public void openLastRequestReceivedEmailWhichHasSubject(String subject) {
        //Stock Pattern Search Engine eBook
        subject = substituteParamsAndVariables(subject);
        switchToFrame("right", "css", "#fs1 > frame:nth-child(2)");
        String selector = String.format("(//a[contains(text(),'%s')])[1]", subject);
        clickOnElementBySelector("", "xpath", selector);
        waitSmallTimeout();
    }

    @When("GoogleMail. I open last email letter with subject $subject")
    public void openLastReceivedEmailInGoogle(String subject) {
        clickOnElementBySelector("", "containsText", subject);
        waitSmallTimeout();
    }

}
