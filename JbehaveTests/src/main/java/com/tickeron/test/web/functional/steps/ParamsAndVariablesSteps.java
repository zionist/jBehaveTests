package com.tickeron.test.web.functional.steps;

import com.tickeron.test.common.exceptions.PropertyNotFoundException;

import org.jbehave.core.annotations.*;
import org.jbehave.core.model.ExamplesTable;
import org.jbehave.core.steps.Steps;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.core.env.Environment;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Interface class for common variable storage for all steps
 */
public class ParamsAndVariablesSteps extends Steps {

    @Autowired
    Environment environment;

    @Autowired
    ApplicationContext applicationContext;

    // Storage for values
    private Map<String, String> tempValues = new HashMap<String, String>();
    private Map<String, String> testParams = new HashMap<String, String>();

    private static Logger log = LoggerFactory.getLogger(ParamsAndVariablesSteps.class);
    public Map<String, String> getVariableStorage() {
        return tempValues;
    }
    public Map<String, String> getTestParamsStorage() {
        return testParams;
    }

    public String substituteParamsAndVariables(String input) {
        input = substituteTestParams(input);
        return substituteTestVariables(input);

    }

    private String substituteTestParams(String input) {
        for (String key: getTestParamsStorage().keySet()) {
            String keyPattern = "%{" + key + "}";
            if (input.contains(keyPattern)) input = input.replace(keyPattern, testParams.get(key));
        }
        return input;
    }

    private String substituteTestVariables(String input) {
        for (String key: getVariableStorage().keySet()) {
            String keyPattern = "${" + key + "}";
            if (input.contains(keyPattern)) input = input.replace(keyPattern, getVariableStorage().get(key));
        }
        return input;
    }

    @Given("Test params are: $table")
    public void setTestParams(ExamplesTable table) {
        getTestParamsStorage().clear();
        getTestParamsStorage().put("__dynamic__localdate_now", String.valueOf(LocalDate.now()));
        for (int i = 0; i < table.getRowCount(); i++) {
            String name = table.getRow(i).get("name");
            String value = table.getRowAsParameters(i, false).valueAs("value", String.class);
            // Get value from app.properties file if value is like {value}
            if (value.startsWith("{") && value.endsWith("}")) {
                String valueParam = environment.getProperty(value, String.class, "");
                if (valueParam.isEmpty())
                throw (PropertyNotFoundException)applicationContext.getBean("PropertyNotFoundException", valueParam);
                getTestParamsStorage().put(name, valueParam);
            }
            getTestParamsStorage().put(name, value);
        }
    }


    @Given("Set test param $name with value $value")
    @When("Set test param $name with value $value")
    @Then("Set test param $name with value $value")
    public void setParamValue(String name,  String value) {
        name = substituteParamsAndVariables(name);
        value = substituteParamsAndVariables(value);
        getTestParamsStorage().put(name, value);
    }

    @Given("Set test param $name value from property $propertyName")
    public void setParamValueFromPoperty(String name,  String propertyName) {
        String property = environment.getProperty(propertyName, String.class, "");
        if (property.isEmpty())
        throw (PropertyNotFoundException)applicationContext.getBean("PropertyNotFoundException", propertyName);
        getTestParamsStorage().put(name, property);
    }

    @Given("I generate $string + UUID and put it to test param $param")
    public void generateUuid(String string, String param) {
        this.getTestParamsStorage().put(param, string + UUID.randomUUID().toString());

    }
    @Given("I generate UUID + $string and put it to test param $param")
    public void generateUuidPlusString(String string, String param) {
        this.getTestParamsStorage().put(param, UUID.randomUUID().toString() + string);
    }

    @AfterStory
    public void AfterStory() {
        getTestParamsStorage().clear();
    }


}

