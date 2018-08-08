package com.tickeron.test.web.functional;

import org.jbehave.core.model.Description;
import org.jbehave.core.model.Story;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by slaviann on 23.12.15.
 */
public class CustomStory {

    private Story story;
    private Boolean isGiven;
    private String modulePath;


    private List<String> runScenarios = new ArrayList<>();

    public String getCurrentScenario() {
        return runScenarios.get(runScenarios.size() - 1);
    }

    public void addScenario(String scenario) {
        runScenarios.add(scenario);
    }

    public void removeLastScenario() {
        runScenarios.remove(runScenarios.size() - 1);
    }

    public CustomStory(Story story) {
        this.story = story;
    }

    public Boolean IsGiven() {
        return isGiven;
    }

    public void setIsGiven(Boolean isGiven) {
        this.isGiven = isGiven;
    }

    public Story getStory() {
        return story;
    }

    public Description getDescription() {
        return story.getDescription();
    }

    public String getPath() {
        return story.getPath();
    }
}
