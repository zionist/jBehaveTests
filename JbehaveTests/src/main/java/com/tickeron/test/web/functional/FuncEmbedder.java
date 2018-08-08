package com.tickeron.test.web.functional;

import com.tickeron.test.common.exceptions.PropertyNotFoundException;
import com.tickeron.test.web.functional.steps.*;
import com.tickeron.test.web.functional.steps.service.*;
import org.jbehave.core.configuration.Configuration;
import org.jbehave.core.configuration.MostUsefulConfiguration;
import org.jbehave.core.embedder.Embedder;
import org.jbehave.core.embedder.EmbedderControls;
import org.jbehave.core.embedder.EmbedderMonitor;
import org.jbehave.core.io.CodeLocations;
import org.jbehave.core.io.LoadFromClasspath;
import org.jbehave.core.io.StoryFinder;
import org.jbehave.core.reporters.CrossReference;
import org.jbehave.core.reporters.StoryReporterBuilder;
import org.jbehave.core.steps.InjectableStepsFactory;
import org.jbehave.core.steps.InstanceStepsFactory;
import org.jbehave.core.steps.ParameterConverters;
import org.jbehave.core.steps.SilentStepMonitor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import static org.jbehave.core.reporters.Format.*;

public class FuncEmbedder extends Embedder {

    public Boolean failed = false;

    @Autowired
    private Environment env;
    @Autowired
    private SeleniumSteps seleniumSteps;
    @Autowired
    private AdminSteps adminSteps;
    @Autowired
    private ServiceStepsBasic serviceStepsBasic;
    @Autowired
    private PortfolioSteps portfolioSteps;
    @Autowired
    private PortfolioLeftSideMenuSteps portfolioLeftSideMenuSteps;
    @Autowired
    private HttpSteps httpSteps;
    @Autowired
    private MailSteps mailSteps;
    @Autowired
    private LoginSteps loginSteps;
    @Autowired
    private StripeSteps stripeSteps;
    @Autowired
    private MallSteps mallSteps;
    @Autowired
    private MenuStepsPageObject menuStepsPageObject;
    @Autowired
    private HomePageSteps homePageSteps;
    @Autowired
    private CommunitySteps communitySteps;
    @Autowired
    private CustomStoryParser customStoryParser;
    @Autowired
    private AdviserClientSteps adviserClientSteps;
    @Autowired
    private WebCastSteps webCastSteps;
    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;
    @Autowired
    private CustomAnsiStoryReporter customAnsiStoryReporter;
    @Autowired
    private PatternSteps patternSteps;
    @Autowired
    private PreloginSteps preloginSteps;
    @Autowired
    private ChatNoteSteps chatNoteSteps;
    @Autowired
    private ZendeskSteps zendeskSteps;
    @Autowired
    private CatchWebMail catchWebMail;
    @Autowired
    private ImageCompareSteps imageCompareSteps;

    public FuncEmbedder(EmbedderMonitor embedderMonitor) {
        super(embedderMonitor);
    }

    /**
     * Set global story run is failed
     */
    public void setFailed() {
        failed = true;
    }


    @Override
    public EmbedderControls embedderControls() {
        return new EmbedderControls()
                .doIgnoreFailureInStories(false)
                .doIgnoreFailureInView(true)
                .doVerboseFailures(true)
                .doVerboseFiltering(false)
                .doFailOnStoryTimeout(false)
                .useStoryTimeouts("1h")
                .doGenerateViewAfterStories(true);
    }

    @Override
    public Configuration configuration() {
        Class<? extends FuncEmbedder> embedderClass = this.getClass();

        return new MostUsefulConfiguration()
                .useStoryLoader(new LoadFromClasspath(embedderClass.getClassLoader()))
                .useStoryReporterBuilder(new StoryReporterBuilder()
                        .withReporters(customAnsiStoryReporter)
                        .withCodeLocation(CodeLocations.codeLocationFromClass(embedderClass))
                        //.withDefaultFormats()
                        .withFormats(TXT, STATS, XML)
                        .withFailureTrace(false)
                        .withFailureTraceCompression(false)
                        .withCrossReference(new CrossReference()))
                .useStoryParser(customStoryParser)
                .useParameterConverters(new ParameterConverters()
                        .addConverters(new ParameterConverters.DateConverter(new SimpleDateFormat("yyyy-MM-dd")))) // use custom date pattern
                //.useStepPatternParser(new RegexPrefixCapturingPatternParser(
                //        "%")) // use '%' instead of '$' to identify parameters
                .useStepMonitor(new SilentStepMonitor());
    }


    @Override
    public InjectableStepsFactory stepsFactory() {
        return new InstanceStepsFactory(configuration(),
                serviceStepsBasic,
                seleniumSteps,
                paramsAndVariablesSteps,
                adminSteps,
                loginSteps,
                httpSteps,
                mailSteps,
                stripeSteps,
                patternSteps,
                mallSteps,
                menuStepsPageObject,
                portfolioSteps,
                homePageSteps,
                communitySteps,
                adviserClientSteps,
                preloginSteps,
                chatNoteSteps,
                webCastSteps,
                zendeskSteps,
                catchWebMail,
                portfolioLeftSideMenuSteps,
                imageCompareSteps
        );
        //return new InstanceStepsFactory(configuration());
    }

    /**
     * Get stories via glob. Or comma separated list of globs
     *
     * @param storiesGlob
     * @return list of stories file matching glob
     * @throws IOException
     */
    public List<String> getStoryPaths(Optional<String> storiesGlob) {
        // Specify story paths as URLs
        String testStoriesPath = env.getProperty("test.stories.path");
        String codeLocation = null;
        try {
            codeLocation = new ClassPathResource(testStoriesPath).getFile().getAbsolutePath() + File.separator;
        } catch (IOException e) {
            e.printStackTrace();
            System.exit(1);
        }

        List<String> searchIn = new LinkedList<>();
        //List<String> searchIn = new LinkedList<>(Arrays.asList(
        //        String.format("*%s*.story", File.separator),
        //        String.format("*%s*%s*.story", File.separator, File.separator)
        //        )
        //);

        if (storiesGlob.isPresent()) {
            searchIn.clear();
            for (String glob : storiesGlob.get().split(",")) {
                searchIn.add(glob);
            }

        }


        List<String> exlude = new ArrayList<>();
        exlude.add(String.format("*%s_*.story", File.separator));
        exlude.add(String.format("*%s_*.txt", File.separator));
        exlude.add(String.format("*.txt"));
        exlude.add(String.format("*%s*.txt", File.separator));
        exlude.add(String.format("*%s*%s*.txt", File.separator, File.separator));
        exlude.add(String.format("*%s*%s*%s*.txt", File.separator, File.separator, File.separator));
        exlude.add(String.format("*%s*%s*%s*%s*.txt", File.separator, File.separator, File.separator, File.separator));


        String excludePaths = env.getProperty("exclude.tests.path");
        //Check ^functional in any stories glob. If no - we have plain tests run so remove all functional tests from run
        List<String> paths = Arrays.asList(excludePaths.split(","));
        paths.forEach(p -> {
            if (!searchIn.stream().anyMatch(s -> s.startsWith(p))) {
                exlude.add(String.format("%s/", p));
            }
        });

        return new StoryFinder().findPaths(codeLocation, searchIn, exlude, testStoriesPath + File.separator);
    }

    /**
     * Parse and set tests properties (for example username, password etc) from command line prompt
     */
    public void setTestsProperties(Optional<String> properties) {
        properties.ifPresent((p) -> {
            Iterator<String> propertiesIterator = Arrays.asList(p.split(",")).iterator();
            while (propertiesIterator.hasNext()) {
                String property = propertiesIterator.next();
                String[] pairs = property.split("=");
                String name = pairs[0];
                String filePropertyName = pairs[1];
                String propertyValue = env.getProperty(filePropertyName, String.class, "");
                if (property.isEmpty()) throw new PropertyNotFoundException(filePropertyName);
                paramsAndVariablesSteps.getTestParamsStorage().put(name, propertyValue);
            }
        });
    }

    public void run(Optional<String> storiesGlob) throws IOException {
        Integer exit_code = 0;
        this.runStoriesAsPaths(getStoryPaths(storiesGlob));
        if (this.failed) exit_code = 1;
        // May have client threads in background
        System.exit(exit_code);
    }

}