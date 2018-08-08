package com.tickeron.test.test;

import com.squareup.okhttp.*;
import com.tickeron.test.config.AppConfig;
import com.tickeron.test.config.ExceptionsConfig;
import com.tickeron.test.web.functional.steps.MailSteps;
import com.tickeron.test.web.functional.steps.service.LoginSteps;
import com.tickeron.test.web.functional.steps.service.MallSteps;
import com.tickeron.test.web.functional.steps.service.StripeSteps;
import junit.framework.TestCase;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import javax.mail.MessagingException;
import java.io.IOException;

/**
 */
public class TestMall extends TestCase {

    private static AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
    private MallSteps mallSteps;
    private LoginSteps loginSteps;
    private StripeSteps stripeSteps;

    public void setUp() {
        context.register(AppConfig.class);
        context.register(ExceptionsConfig.class);
        context.refresh();
        loginSteps = context.getBean(LoginSteps.class);
        mallSteps = context.getBean(MallSteps.class);
        stripeSteps = context.getBean(StripeSteps.class);
    }


    @Test
    public void testMallIndexPage1Test() throws IOException, MessagingException, InterruptedException {
        loginSteps.doLoginUsingSelenium("a1@catch01.tickerontest.com", "qwerty");
        //mallSteps.openBuyModelPortfolio();
        //mallSteps.openSellModelPortfolio();
        mallSteps.openBuyAiPatternsRecoginition();
    }

    @Test
    public void testSetStripeAsSeller() throws InterruptedException {
        stripeSteps.setStripeAsSeller("a1@catch01.tickerontest.com", "qwerty");
    }

    @Test
    public void testSetStripeAsClient() throws InterruptedException {
        stripeSteps.setStripeAsClient("a1@catch01.tickerontest.com", "qwerty");
    }



}

