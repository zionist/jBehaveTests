package com.tickeron.test.web.functional;

import com.tickeron.test.config.AppConfig;
import com.tickeron.test.config.ExceptionsConfig;
import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.File;
import java.io.IOException;
import java.util.*;

import static java.util.Arrays.asList;

/**
 * Created by slaviann on 24.02.15.
 */
public class Runner {

    private static AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();

    public static void main(String[] args) throws IOException {

        context.register(AppConfig.class);
        context.register(ExceptionsConfig.class);
        context.refresh();
        FuncEmbedder funcEmbedder = context.getBean(FuncEmbedder.class);


        Optional<String> glob = Optional.empty();
        // run one story from IDEA 
        if(args.length == 1 && args[0].endsWith(".story")) {
            String storyPath = args[0];
            // Jbehave have / in path in Windows too
            List<String> paths = Arrays.asList(storyPath.split("/"));
            Collections.reverse(paths);
            List<String> newPaths = new ArrayList<>();
            for (String path : paths) {
                //TODO: remove hardcode
                if(path.equals("stories"))  break;
                newPaths.add(path);
            }
            Collections.reverse(newPaths);
            glob = Optional.of(String.join("/", newPaths));
        // run from command prompt
        } else {
            if (!System.getProperty("story.glob").isEmpty()) {
                glob = Optional.of(System.getProperty("story.glob"));

            }
            String meta = System.getProperty("meta.filter");
            String properties = System.getProperty("tests.properties");

            funcEmbedder.useMetaFilters(asList(meta.split(" ")));
            funcEmbedder.setTestsProperties(Optional.ofNullable(properties));
        }
        funcEmbedder.run(glob);
    }
}
