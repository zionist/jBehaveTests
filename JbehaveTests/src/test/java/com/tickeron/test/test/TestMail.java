package com.tickeron.test.test;

import com.squareup.okhttp.*;
import com.tickeron.test.config.AppConfig;
import com.tickeron.test.web.functional.steps.service.LoginSteps;
import com.tickeron.test.web.functional.steps.MailSteps;
import junit.framework.TestCase;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import javax.mail.MessagingException;
import java.io.IOException;

/**
 * Created by slaviann on 17.12.15.
 */
public class TestMail extends TestCase {

    private static AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();

    @Test
    public void testMailClient() throws IOException, MessagingException {
        context.register(AppConfig.class);
        context.refresh();
        MailSteps mailSteps = context.getBean(MailSteps.class);
        mailSteps.setLastMessage();
        System.out.println(mailSteps.getLastMessage().subject);
    }

    @Test
    public void testMailClientParser() throws IOException, MessagingException {
        /*
        context.register(AppConfig.class);
        context.refresh();
        MailSteps mailSteps = context.getBean(MailSteps.class);
        ParamsAndVariablesSteps paramsAndVariablesSteps = context.getBean(ParamsAndVariablesSteps.class);
        mailSteps.setLastMessage();
        mailSteps.saveParamFromMailLnk("Click here", "testParam");
        assertEquals(paramsAndVariablesSteps.getTestParamsStorage().size(), 1);
        */
    }

    @Test
    public void testGetPasswordFromEmail() throws IOException, MessagingException {
        /*
        context.register(AppConfig.class);
        context.refresh();
        LoginSteps loginSteps = context.getBean(LoginSteps.class);
        MailSteps mailSteps = context.getBean(MailSteps.class);
        mailSteps.setLastMessage();
        loginSteps.getPasswordFromEmail("test");
        */
    }

    @Test
    public void testGetIndicators() {
        context.register(AppConfig.class);
        context.refresh();
        LoginSteps loginSteps = context.getBean(LoginSteps.class);

        // Login
        loginSteps.doApiLogin("a1@catch01.tickerontest.com", "qwerty");
        System.out.println(loginSteps.getAuthCookie());


        String url = context.getEnvironment().getProperty("server.url") + "api/CxAdvisorClient/SearchAdvisorRelations";
        OkHttpClient okHttpClient = new OkHttpClient();
        //CookieManager cookieManager = new CookieManager();

        final MediaType APPLICATION_JSON = MediaType.parse("application/json; charset=utf-8");

        // Let's accept all cookies
        //cookieManager.setCookiePolicy(CookiePolicy.ACCEPT_ALL);
        //okHttpClient.setCookieHandler(cookieManager);

        Request.Builder builder = new Request.Builder();
        builder = builder.url(url);
        builder.addHeader("Accept", "application/json, text/plain, *//*");
        builder.addHeader("Cookie", loginSteps.getAuthCookie().get());
        builder.post(RequestBody.create(APPLICATION_JSON,
                "{\"searchRequest\":{\"ConnectionState\":\"BidSent\",\"Offset\":0,\"PageSize\":11}}"));

        Request request = builder.build();
        try {
            long startTime = System.currentTimeMillis();
            Response response = okHttpClient.newCall(request).execute();
            long estimatedTime = System.currentTimeMillis() - startTime;
            System.out.println(estimatedTime);
        } catch (IOException e ) {
            e.printStackTrace();
        }


    }

}
