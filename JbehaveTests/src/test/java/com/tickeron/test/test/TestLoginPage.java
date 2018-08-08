package com.tickeron.test.test;

//import com.thoughtworks.selenium.Selenium;
import com.tickeron.test.LoginPage;
import com.tickeron.test.config.AppConfig;
import com.tickeron.test.config.ExceptionsConfig;
import com.tickeron.test.web.functional.steps.SeleniumSteps;
import com.tickeron.test.web.functional.steps.service.CommunitySteps;
import com.tickeron.test.web.functional.steps.service.LoginSteps;
import com.tickeron.test.web.functional.steps.service.PortfolioSteps;
import junit.framework.TestCase;
import org.junit.Test;
import org.openqa.selenium.support.PageFactory;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * Created by slaviann on 20.04.16.
 */
public class TestLoginPage extends TestCase {

    private SeleniumSteps seleniumSteps;
    private static AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();

    public void setUp(){
        context.register(AppConfig.class);
        context.register(ExceptionsConfig.class);
        context.refresh();
        seleniumSteps = context.getBean(SeleniumSteps.class);
    }

    @Test
    public void testLoginForm() throws InterruptedException {
        seleniumSteps.setUpWebDriver();
        LoginPage loginPage = PageFactory.initElements(seleniumSteps.getWebDriver(), LoginPage.class);
        loginPage.clickLoginButton();
    }

    @Test
    public void testFindClub() throws InterruptedException {

    }

}
