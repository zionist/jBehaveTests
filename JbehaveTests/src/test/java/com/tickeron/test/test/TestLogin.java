package com.tickeron.test.test;

import com.squareup.okhttp.*;
import com.tickeron.test.config.AppConfig;
import com.tickeron.test.web.functional.steps.MailSteps;
import com.tickeron.test.web.functional.steps.service.LoginSteps;
import junit.framework.TestCase;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import javax.mail.MessagingException;
import java.io.IOException;

/**
 * Created by slaviann on 17.12.15.
 */
public class TestLogin extends TestCase {

    private static AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();

    @Test
    public void testZendeskLogin() throws IOException, MessagingException, InterruptedException {
        context.register(AppConfig.class);
        context.refresh();
        LoginSteps loginSteps = context.getBean(LoginSteps.class);
        loginSteps.doLoginToZendeskUsingSelenium();
        loginSteps.doLoginToZendeskUsingSelenium();
    }

}

