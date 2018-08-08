package com.tickeron.test.web.functional;

import com.tickeron.test.common.exceptions.MultilineCommentExeption;
import com.tickeron.test.common.exceptions.NoStoryHeaderInStoryFile;
import org.jbehave.core.model.Story;
import org.jbehave.core.parsers.RegexStoryParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.core.env.Environment;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by slaviann on 10.12.15.
 */
public class CustomStoryParser extends RegexStoryParser {

    @Override
    public Story parseStory(String storyAsText) {
        return parseStory(storyAsText, null);
    }

    @Autowired
    private ApplicationContext applicationContext;

    /**
     * Make multiline comments work
     * @param storyAsText
     * @return
     */
    private String multilineComments(String storyAsText) {
        // remove all code berwwen !--/* !--*/ comments
        List<String> strings = Arrays.asList(storyAsText.split("\n"));
        List<String> newStrings = new ArrayList<>();
        Boolean delete = false;
        int open = 0, close = 0;
        for (String string : strings) {
            if (string.startsWith("!--/*")) {
                delete = true;
                open += 1;
                continue;
            }
            if (string.startsWith("!--*/")) {
                delete = false;
                close += 1;
                continue;
            }
            if (!delete) newStrings.add(string);
        }
        if (open != close) throw applicationContext.getBean(MultilineCommentExeption.class);
        return String.join("\n", newStrings);

    }

    @Override
    public Story parseStory(String storyAsText, String storyPath) {
        Story story = super.parseStory(String.join("\n", multilineComments(storyAsText)), storyPath);

        if(story.getDescription().asString().isEmpty() && !storyPath.isEmpty()) {
           throw (NoStoryHeaderInStoryFile)applicationContext.getBean("noStoryHeaderInStoryFile", storyPath);
        }
        return story;
    }



}
