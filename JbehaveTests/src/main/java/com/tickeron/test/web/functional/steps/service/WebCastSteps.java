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
public class WebCastSteps extends ServiceStepsBasic {

    @Autowired
    private SeleniumSteps seleniumSteps;

    @Autowired
    private HttpSteps httpSteps;

    @Autowired
    private LoginSteps loginSteps;

    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;

    @When("Webcast. Select free time")
         public void selectFreeTime(){
        // click on first non busy time for webcast
        seleniumSteps.executeJavaScript("for (i = 1; i<48; i++) { if (!$(\"div.webcast-slots__slot:nth-child(\" + i + \")\")[0].getAttribute(\"class\").indexOf(\"webcast-slots__slot_restricted\")!=-1 & !$(\"div.webcast-slots__slot:nth-child(\" + i + \")\")[0].getAttribute(\"class\").indexOf(\"webcast-slots__slot_busy\")!=-1 & !$(\"div.webcast-slots__slot:nth-child(\" + i + \")\")[0].getAttribute(\"class\").indexOf(\"webcast-slots__slot_selected\")!=-1) { $(\"div.webcast-slots__slot:nth-child(\" + i + \")\")[0].click(); break;   }   }");
        waitUntilServiceReady();
    }

    @When("Webcast. Select free time to end of day")
    public void selectFreeTimeToEndDay(){
        // click on first non busy time for webcast
        seleniumSteps.executeJavaScript("for (i = 1; i<48; i++) { if (!$(\"div.webcast-slots__slot:nth-child(\" + i + \")\")[0].getAttribute(\"class\").indexOf(\"webcast-slots__slot_restricted\")!=-1 & !$(\"div.webcast-slots__slot:nth-child(\" + i + \")\")[0].getAttribute(\"class\").indexOf(\"webcast-slots__slot_busy\")!=-1 & !$(\"div.webcast-slots__slot:nth-child(\" + i + \")\")[0].getAttribute(\"class\").indexOf(\"webcast-slots__slot_selected\")!=-1) { $(\"div.webcast-slots__slot:nth-child(\" + i + \")\")[0].click(); 1;   }   }");
        waitUntilServiceReady();
    }

    @When("Webcast. Unselect first free slot")
    public void unSelecrFirstTimeSlot(){
        // click on first non busy time for webcast
        seleniumSteps.executeJavaScript("for (i = 1; i<48; i++) { if (!$(\"div.webcast-slots__slot:nth-child(\" + i + \")\")[0].getAttribute(\"class\").indexOf(\"webcast-slots__slot_restricted\")!=-1 & !$(\"div.webcast-slots__slot:nth-child(\" + i + \")\")[0].getAttribute(\"class\").indexOf(\"webcast-slots__slot_busy\")!=-1) { $(\"div.webcast-slots__slot:nth-child(\" + i + \")\")[0].click(); break;   }   }");
        waitUntilServiceReady();
    }

    @When("Webcast. Click on right 5 times")
    public void selectRight(){
        // click on right arrow 5 times
        waitSmallTimeout();
        clickOnElementBySelector("", "css", ".pull-right");
        waitSmallTimeout();
        clickOnElementBySelector("", "css", ".pull-right");
        waitSmallTimeout();
        clickOnElementBySelector("", "css", ".pull-right");
        waitSmallTimeout();
        clickOnElementBySelector("", "css", ".pull-right");
        waitSmallTimeout();
        clickOnElementBySelector("", "css", ".pull-right");
    }
    // .common-date-picker-input
    //


}


