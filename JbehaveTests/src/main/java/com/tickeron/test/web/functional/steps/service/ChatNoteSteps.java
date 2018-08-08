package com.tickeron.test.web.functional.steps.service;


import com.tickeron.test.web.functional.steps.ParamsAndVariablesSteps;
import com.tickeron.test.web.functional.steps.SeleniumSteps;
import org.jbehave.core.annotations.When;
import org.openqa.selenium.By;
import org.springframework.beans.factory.annotation.Autowired;



/**
 * Created by Ieugen on 25.08.2016.
 */
public class ChatNoteSteps extends ServiceStepsBasic {

    @Autowired
    private SeleniumSteps seleniumSteps;

    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;

    @Autowired
    private MenuStepsPageObject menuStepsPageObject;

    @Autowired
    private HomePageSteps homePageSteps;

    @When("I send chat message with text $text")
    public void sendChatMessage (String text) {
        text = substituteParamsAndVariables(text);
        waitBigTimeout();
        typeIntoElementBySelector(text, "", "css", ".cx-chat-default__new-message__textarea");
        waitSmallTimeout();
        //Click on Send button
        seleniumSteps.executeJavaScript("$(\"button:contains('Send')\")[0].click()");
        //waitUntilElementIsVisibleAndEnabled(new By.ByCssSelector(".cx-chat-default__new-message__textarea")).click();
        //waitUntilServiceReady();
        //waitUntilElementIsVisibleAndEnabled(new By.ByCssSelector(".btn-secondary-sm")).click();
        //TODO: Add check for message
        waitBigTimeout();
        waitUntilElementIsVisibleAndEnabled(new By.ByCssSelector(".cx-chat-close-icon")).click();
        waitSmallTimeout();

    }

    @When("I send note message with text $text")
    public void sendNoteMessage (String text) {
        text = paramsAndVariablesSteps.substituteParamsAndVariables(text);
        waitBigTimeout();
        seleniumSteps.executeJavaScript(String.format("CKEDITOR.instances.editor1.setData(\"%s\")", text));
        waitUntilElementIsVisibleAndEnabled(new By.ByCssSelector("input.btn:nth-child(2)")).click();
        waitUntilServiceReady();
        waitUntilElementIsVisibleAndEnabled(new By.ByCssSelector(".cx-note-close-icon")).click();
        waitSmallTimeout();
    }

    //@When()

    /**
     * Receives message for chat. Open chat block using uniq identificator on tooltip of chat block. For example opinion name.
     * @param identificator unique chat identification
     * @param text - text for assert
     */
    @When("Chats. I receive chat message with text $text and $identificator")
    public void receiveChatMessage(String text, String identificator) {
        menuStepsPageObject.openHome();
        homePageSteps.openChatsBlock();
        waitUntilServiceReady();
        seleniumSteps.executeJavaScript(String.format("$(\"h3[title='%s']\").parent().children(\"button\").click()", identificator));
        waitSmallTimeout();
        checkElementTextBySelectorIs("", "css", "pre.ng-binding", text);
    }


}


