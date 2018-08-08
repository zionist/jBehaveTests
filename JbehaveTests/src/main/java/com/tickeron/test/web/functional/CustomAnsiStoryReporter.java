package com.tickeron.test.web.functional;

import com.google.common.collect.Lists;
import com.tickeron.test.web.functional.steps.ParamsAndVariablesSteps;
import com.tickeron.test.web.functional.steps.SeleniumSteps;
import org.apache.commons.io.FileUtils;
import org.jbehave.core.model.Story;
import org.jbehave.core.reporters.ANSIConsoleOutput;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by slaviann on 23.10.15.
 * Teamcity reporting, custom failure reporting
 *
 *  === team city ===
 test suite 1 started
 test suite 1 finished
 test suite 2 started
 test suite 2 finished
 ...

 === jbhave ===
 test suite 1 started
 test case 1 started
 test suite 2 stared
 ....
 test suite 2 finished
 test case 1 finished
 test suite 1 finihed
 */
public class CustomAnsiStoryReporter extends ANSIConsoleOutput {
    private static Logger log = LoggerFactory.getLogger(CustomAnsiStoryReporter.class);

    @Autowired
    FuncEmbedder funcEmbedder;

    @Autowired
    private Environment env;

    @Autowired
    Environment environment;

    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;

    @Autowired
    private SeleniumSteps seleniumSteps;

    private String failedStep;

    private List<CustomStory> runStories = new ArrayList<>();

    public CustomStory getCurrentStory() {
        return runStories.get(runStories.size() - 1);
    }

    private void removeLastStory() {
        runStories.remove(runStories.size() - 1);
    }

    private Optional<CustomStory> getLastNotGivenStory() {
        Optional<CustomStory> story = Optional.empty();
        for (CustomStory customStory: Lists.reverse(runStories)) {
            if (!customStory.IsGiven()) story = Optional.of(customStory);
        }
        return story;
    }

    // On fail we need to get last scenario from not given story which call given stories. We can get him and print correct teamcity failure error
    private Optional<String> getLastScenarioInNotGivenStory() {
        Optional<String> result = Optional.empty();
        if (getLastNotGivenStory().isPresent()){
                result = Optional.of(getLastNotGivenStory().get().getCurrentScenario());
        };
        return result;
    }

    private String getPathToStory(Story story) {
        List<String> paths = new ArrayList<>(Arrays.asList(story.getPath().split("/")));
        paths.remove(0);
        paths.remove(paths.size() - 1);
        return "Module: " + String.join("/", (paths));
    }

    private String escapeTeamSityOut(String input) {
       return input.replace("'", "").replace("[", "").replace("]", "");
    }

    @Override
    public void failed(String step, Throwable cause) {
        //TODO: is there an ability to make it not so ugly?
        // get failed step name. Save it to class body
        failedStep = step.replace("｟", "").replace("｠", "");
        if (failedStep.contains(" is:")) {
            failedStep = failedStep.split(" is:")[0];
            failedStep += " is:";
        }

        // make screenshot
        if (environment.getProperty("make.screenshot.onfail", Boolean.class) && seleniumSteps.webDriver.isPresent()) {
            File scrFile = ((TakesScreenshot) seleniumSteps.getWebDriver()).getScreenshotAs(OutputType.FILE);
            try {
                SimpleDateFormat sdfDate = new SimpleDateFormat("_yyyy-MM-dd_HH-mm-ss");
                Date now = new Date();
                String strDate = sdfDate.format(now);
                File screenShotFile = new File(Paths.get(environment.getProperty("screenshot.path"), getCurrentStory().getCurrentScenario() + strDate + ".png").toAbsolutePath().toString());
                log.debug("Will save screenshot file " + screenShotFile.getAbsolutePath());
                FileUtils.copyFile(scrFile, screenShotFile);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }

        // We should get last not given story entry point scenario
        if (env.getProperty("teamcity.tests.out.enabled", Boolean.class))
            getLastScenarioInNotGivenStory().ifPresent(s -> {
                print(String.format("\n##teamcity[testFailed name='%s' message='%s' details='%s']\n", s,
                        escapeTeamSityOut(cause.toString()),
                        escapeTeamSityOut(cause.toString())));
            });
        funcEmbedder.setFailed();

        super.failed(step, cause);

        // Print getFailureNunber
        print(String.format("Error line %d in file %s\n", getFailureNumber(), getCurrentStory().getPath()));

        if (environment.getProperty("stop.onfail", Boolean.class)) {
            System.exit(1);
        }

    }


    /**
     * Parse story again and get line of failure.
     * Use basicScenarioName and failedStep from class instance
     * @return
     */
    public Integer getFailureNumber() {
        //parse story
        //List<String> paths = funcEmbedder.getStoryPaths(Optional.of(storyPath));
        List<String> lines = null;
        try {
            lines = FileUtils.readLines(new ClassPathResource(getCurrentStory().getPath()).getFile());
        } catch (IOException e) {
            e.printStackTrace();
            System.exit(1);
        }
        Integer counter = 0;
        Boolean scenarioFound = false;
        for (String line : lines) {
            counter += 1;
            if (line.equals(getCurrentStory().getCurrentScenario())) {
                scenarioFound = true;
            }
            if (scenarioFound) {
                //System.out.println("# line: " + line);
                if (line.contains(failedStep)) {
                    return counter;
                }

            }
        }
        return 0;
        //throw new RuntimeException(String.format("Can't find failure line number in story %s, scenario %s, step %s",
        //        currentStory.getPath(), basicScenarioName, failedStep));

    }

    @Override
    public void beforeScenario(String title) {
        getCurrentStory().addScenario(title);
        if (env.getProperty("teamcity.tests.out.enabled", Boolean.class)) {
            if (!getCurrentStory().IsGiven())
                print(String.format("##teamcity[testStarted name='%s' captureStandardOutput='true']\n", getCurrentStory().getCurrentScenario()));
        }
        ;
        String scenarioName = String.format("%s. Params are %s", title, paramsAndVariablesSteps.getTestParamsStorage().toString());
        print(format("beforeScenario", "{0} {1}\n", "Scenario:", scenarioName));
    }

    @Override
    public void beforeStory(Story story, boolean givenStory) {
        super.beforeStory(story, givenStory);
        //System.out.println("# Before story " + story.getPath() + " # Is given " + givenStory);
        CustomStory customStory = new CustomStory(story);
        if (runStories.size() == 0)
            customStory.setIsGiven(false);
         else
            customStory.setIsGiven(true);
        runStories.add(customStory);
        // teamcity integration
        if (!getCurrentStory().getDescription().asString().isEmpty() && env.getProperty("teamcity.tests.out.enabled", Boolean.class)) {
            String path = getPathToStory(story);
            if (!getCurrentStory().IsGiven())
                print(String.format("##teamcity[testSuiteStarted name='%s %s']\n", path, story.getDescription().asString()));
        }

    }

    @Override
    public void afterStory(boolean givenOrRestartingStory) {
        super.afterStory(givenOrRestartingStory);
        //System.out.println("# After story " + getCurrentStory().getPath() + " # Is given " + getCurrentStory().IsGiven());
        // teamcity integration
        if (!getCurrentStory().getDescription().asString().isEmpty() && env.getProperty("teamcity.tests.out.enabled", Boolean.class))
            if (!getCurrentStory().IsGiven())
                print(String.format("##teamcity[testSuiteFinished name='%s %s']\n", getPathToStory(getCurrentStory().getStory()), getCurrentStory().getDescription().asString()));
        removeLastStory();
    }


    @Override
    public void afterScenario() {
        if(env.getProperty("teamcity.tests.out.enabled", Boolean.class)) {
            if (!getCurrentStory().IsGiven())
                print(String.format("##teamcity[testFinished name='%s']\n", getCurrentStory().getCurrentScenario()));
        }
        getCurrentStory().removeLastScenario();
    }
}


