package com.tickeron.test.config;

import com.tickeron.test.web.functional.*;
import com.tickeron.test.web.functional.steps.*;
import com.tickeron.test.web.functional.steps.service.*;
import org.jbehave.core.parsers.RegexStoryParser;
import org.openqa.selenium.WebElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

/**
 * Created by slaviann on 11.09.15.
 */
@Configuration
@PropertySource("classpath:app.properties")
public class AppConfig {

    @Autowired
    Environment env;

    //@Bean
    //public ServiceStepsBasic serviceSteps() {
    //    return new ServiceStepsBasic();
    //}


    @Bean
    PortfolioSteps portfolioSteps() {
        return new PortfolioSteps();
    }

    @Bean
    AdminSteps adminSteps() {
        return new AdminSteps();
    }

    @Bean
    MailSteps mailSteps() {
        return new MailSteps(env.getProperty("mail.host"),
                env.getProperty("mail.username"),
                env.getProperty("mail.password"),
                env.getProperty("mail.port", Integer.class),
                env.getProperty("mail.provider"));
    }

    @Bean
    public LoginSteps loginSteps() {
        return new LoginSteps();
    }

    @Bean
    public StripeSteps stripeSteps() {
        return new StripeSteps();
    }

    @Bean
    public HttpSteps httpSteps() {
        return new HttpSteps(env.getProperty("wait.timeout.big", Integer.class));
    }

    @Bean
    //@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
    public SeleniumSteps seleniumSteps() {
        return new SeleniumSteps();
    }

    @Bean
    public FuncEmbedder funcEmbedder() {
        return new FuncEmbedder(new CustomEmbedderMonitor());
    }

    @Bean
    public ServiceStepsBasic serviceStepsBasic() {
        return new ServiceStepsBasic();
    }

    @Bean
    public ParamsAndVariablesSteps commonSteps() {
        return new ParamsAndVariablesSteps();
    }

    @Bean
    public CustomAnsiStoryReporter customStoryReporter() {
        return new CustomAnsiStoryReporter();
    }

    @Bean
    public CustomStoryParser customStoryParser() {
        return new CustomStoryParser();
    }

    @Bean
    public RegexStoryParser regexStoryParser() {
        return new RegexStoryParser();
    }


    @Bean
    public PatternSteps patternsSteps() {
        return new PatternSteps();
    }

    @Bean
    public MallSteps mallSteps() {
        return new MallSteps();
    }

    @Bean
    public MenuStepsPageObject menuSteps() {
        return new MenuStepsPageObject();
    }

    @Bean
    public HomePageSteps homePageSteps() {
        return new HomePageSteps();
    }

    @Bean
    public AdviserClientSteps adviserClientSteps() {
        return new AdviserClientSteps();
    }

    @Bean
    public CommunitySteps communitySteps() {
        return new CommunitySteps();
    }

    @Bean
    public PreloginSteps preloginSteps() {
        return new PreloginSteps();
    }

    @Bean
    public ChatNoteSteps chatNoteSteps() {
        return new ChatNoteSteps();
    }

    @Bean
    public WebCastSteps webCastSteps() {
        return new WebCastSteps();
    }

    @Bean
    public ZendeskSteps zendeskSteps() {
        return new ZendeskSteps();
    }

    @Bean
    public CatchWebMail catchWebMail() {
        return new CatchWebMail();
    }

    @Bean
    public PortfolioLeftSideMenuSteps portfolioLeftSideMenuSteps() { return new PortfolioLeftSideMenuSteps(); }

    @Bean
    public ImageCompareSteps imageCompareSteps() {
        return new ImageCompareSteps();
    }



}
