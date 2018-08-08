package com.tickeron.test.common.exceptions;

/**
 * Created by slaviann on 22.10.15.
 */
public class NoStoryHeaderInStoryFile extends RuntimeException {

    public NoStoryHeaderInStoryFile(String storyPath) {
        super(String.format("Please check %s file. There is no Story header there", storyPath));
    }
}
