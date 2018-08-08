package com.tickeron.test.test;

import com.tickeron.test.config.AppConfig;
import com.tickeron.test.config.ExceptionsConfig;
import com.tickeron.test.web.functional.steps.SeleniumSteps;
import com.tickeron.test.web.functional.steps.service.*;
import junit.framework.TestCase;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * Created by slaviann on 20.04.16.
 */
public class TestPortfolioSteps extends TestCase {

    private PortfolioSteps portfolioSteps;
    private CommunitySteps communitySteps;
    private LoginSteps loginSteps;
    private static AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();

    public void setUp(){
        context.register(AppConfig.class);
        context.register(ExceptionsConfig.class);
        context.refresh();
        portfolioSteps = context.getBean(PortfolioSteps.class);
        communitySteps = context.getBean(CommunitySteps.class);
        loginSteps = context.getBean(LoginSteps.class);
    }

    @Test
    public void testFindPortfolio() throws InterruptedException {
        loginSteps.doLoginUsingSelenium("a1@catch01.tickerontest.com", "qwerty");
        portfolioSteps.findPortfolio("Personal72c07e19-0cf9-4b89-8bfb-ac86071d794d");
        //portfolioSteps.findPortfolio("111");

    }

    @Test
    public void testFindClub() throws InterruptedException {
        loginSteps.doLoginUsingSelenium("a1@catch01.tickerontest.com", "qwerty");
        communitySteps.findClub("Club 04d86b2e-acb4-4420-b696-8d508b8e804c");

    }

}
