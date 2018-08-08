package com.tickeron.test.common.exceptions;

/**
 * Created by slaviann on 22.10.15.
 */
public class MultilineCommentExeption extends RuntimeException {

    public MultilineCommentExeption() {
        super("Please check multiline comments. Amount of open comments != amount of close comments");
    }

    public MultilineCommentExeption(String message) {
        super(message);
    }

    public MultilineCommentExeption(String message, Throwable cause) {
        super(message, cause);
    }

    public MultilineCommentExeption(Throwable cause) {
        super(cause);
    }

    public MultilineCommentExeption(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
