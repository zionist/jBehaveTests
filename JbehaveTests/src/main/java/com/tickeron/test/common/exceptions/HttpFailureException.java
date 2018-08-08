package com.tickeron.test.common.exceptions;

/**
 * Created by slaviann on 12.02.16.
 */
public class HttpFailureException extends AssertionError {

    public HttpFailureException(Object detailMessage) {
        super(detailMessage);
    }
}
