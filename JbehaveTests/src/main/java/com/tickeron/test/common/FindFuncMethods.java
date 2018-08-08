package com.tickeron.test.common;

import com.google.gson.Gson;
import com.tickeron.test.config.AppConfig;
import com.tickeron.test.config.ExceptionsConfig;
import com.tickeron.test.web.functional.FuncEmbedder;
import org.jbehave.core.embedder.Embedder;
import org.jbehave.core.embedder.EmbedderMonitor;
import org.jbehave.core.model.Story;
import org.jbehave.core.parsers.RegexStoryParser;
import org.jbehave.core.parsers.StoryParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.core.io.Resource;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

/**
 * Created by slaviann on 04.03.16.
 */
public class FindFuncMethods {

    private static AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
    private static Pattern postStepRegex  = Pattern.compile("When I perform POST request to (.*?)$");
    private static String funcStoriesPath = "stories/functional/test/";
    private static Gson gson = new Gson();

    public static void main(String[] args) throws IOException {
        context.register(AppConfig.class);
        context.register(ExceptionsConfig.class);
        context.refresh();
        FuncEmbedder funcEmbedder = context.getBean(FuncEmbedder.class);
        StoryParser storyParser = (RegexStoryParser)context.getBean("regexStoryParser");
        List<String> storyPaths = funcEmbedder.getStoryPaths(Optional.of("functional/"));


        final Set<String> allMethods = new HashSet<>();
        final Map<String, Set<String>> methodsByModules = new HashMap<>();
        for (String storyPath : storyPaths) {
            Resource resource = context.getResource(storyPath);
            String storyText = String.join("\n", Files.lines(Paths.get(resource.getFile().getAbsolutePath())).collect(Collectors.toList()));
            // Get module name from directories paths
            storyPath = storyPath.replace(funcStoriesPath, "");
            final String module = storyPath.split("/")[0];
            Story story = storyParser.parseStory(storyText);
            story.getScenarios().forEach(s -> s.getSteps().forEach(st -> {

                Matcher matcher = postStepRegex.matcher(st);
                if (matcher.find()) {
                    // Add method
                    if(methodsByModules.containsKey(module)) {
                        methodsByModules.get(module).add(matcher.group(1));
                    } else {
                        Set<String> methods = new HashSet<String>();
                        methods.add(matcher.group(1));
                        methodsByModules.put(module, methods);
                    }

                    allMethods.add(matcher.group(1));
                }

            }) );

        }

        methodsByModules.put("allModules", allMethods);

        //Make pretty out
        final List<FindFuncMethodsResult> findFuncMethodsResults = new ArrayList<>();

        methodsByModules.forEach((k, v) -> {
            FindFuncMethodsResult findFuncMethodsResult = new FindFuncMethodsResult();
            findFuncMethodsResult.setModule(k);
            findFuncMethodsResult.setMethods(v);
            findFuncMethodsResults.add(findFuncMethodsResult);

        });

        System.out.println(gson.toJson(findFuncMethodsResults));


    }
}
