package com.tickeron.test.web.functional.steps.service;

import com.tickeron.test.web.functional.steps.ParamsAndVariablesSteps;
import com.tickeron.test.web.functional.steps.SeleniumSteps;
import org.jbehave.core.annotations.When;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by slaviann on 17.12.15.
 */
//@PropertySource("classpath:app.properties")

public class CommunitySteps extends ServiceStepsBasic {

    @Autowired
    private SeleniumSteps seleniumSteps;

    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;

    @Autowired
    private HomePageSteps homePageSteps;

    @Autowired
    private MenuStepsPageObject menuStepsPageObject;

    @When("Community. Find club $clubTitile in Clubs")
    public void findClub(String clubTitle) {
        menuStepsPageObject.openCommunity();
        //open investor clubs menu
        clickOnElementBySelector("", "css", "#community__menu__clubs-link");
        waitUntilServiceReady();
        clubTitle = clubTitle.replace("Club", "");
        clubTitle = clubTitle.replace(" ", "");
        seleniumSteps.executeJavaScript(String.format("$(\"#community__clubs__search-by-title-input\").val(\"%s\")", clubTitle));
        seleniumSteps.executeJavaScript(String.format("$(\"#community__clubs__search-by-title-input\").change()"));
        waitSmallTimeout();
        clickOnElementBySelector("", "css", ".club-card__header");
        waitUntilServiceReady();

    }


}
