package com.tickeron.test.test;

import com.tickeron.test.config.AppConfig;
import com.tickeron.test.config.ExceptionsConfig;
import com.tickeron.test.web.functional.steps.SeleniumSteps;
import com.tickeron.test.web.functional.steps.service.LoginSteps;
import com.tickeron.test.web.functional.steps.service.PatternSteps;
import com.tickeron.test.web.functional.steps.service.StripeSteps;
import junit.framework.TestCase;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * Created by slaviann on 20.04.16.
 */
public class TestPatternsSteps extends TestCase {

    private PatternSteps patternSteps;
    private static AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();

    public void setUp(){
        context.register(AppConfig.class);
        context.register(ExceptionsConfig.class);
        context.refresh();
        patternSteps = context.getBean(PatternSteps.class);
    }

    @Test
    public void testUserHasNotPatternSubscribtion(String username, String password) throws InterruptedException {
        patternSteps.userHasNoPatternSubscribtion(username,password);
    }
}
