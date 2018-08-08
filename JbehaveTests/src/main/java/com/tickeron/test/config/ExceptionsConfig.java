package com.tickeron.test.config;

import com.tickeron.test.common.exceptions.*;
import com.tickeron.test.web.functional.steps.HttpSteps;
import com.tickeron.test.web.functional.steps.ParamsAndVariablesSteps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.Scope;

/**
 * Created by slaviann on 11.09.15.
 */
@Configuration
@PropertySource("classpath:app.properties")
public class ExceptionsConfig {

    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;

    @Autowired
    private HttpSteps httpSteps;

    @Bean
    @Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
    public NoStoryHeaderInStoryFile noStoryHeaderInStoryFile(String path) {
        return new NoStoryHeaderInStoryFile(path);
    }

    @Bean
    @Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
    public AssertionErrorWithContextParamsException assertionErrorWithContextParamsException(Object detailMessage) {
        return new AssertionErrorWithContextParamsException(String.valueOf(detailMessage) +
                Formatter.formatParamsString(paramsAndVariablesSteps.getTestParamsStorage()));
    }

    @Bean
    @Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
    public MultilineCommentExeption multilineCommentExeption() {
        return new MultilineCommentExeption();
    }

    @Bean
    @Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
    public PropertyNotFoundException propertyNotFoundException(String propertyName){
        return new PropertyNotFoundException(propertyName);

    }

    @Bean
    @Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
    public HttpFailureException httpFailureException(Object message){
        return new HttpFailureException(String.valueOf(message) + String.format("\n---->\n%s\n\n<----\n%s", httpSteps.prettyPrintRequest(), httpSteps.prettyPrintResponce()));
    }


}
