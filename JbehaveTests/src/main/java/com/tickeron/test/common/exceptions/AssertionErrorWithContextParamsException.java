package com.tickeron.test.common.exceptions;

import com.tickeron.test.web.functional.CustomStoryParser;
import com.tickeron.test.web.functional.steps.ParamsAndVariablesSteps;
import org.junit.ComparisonFailure;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;

/**
 * Created by slaviann on 22.10.15.
 */
public class AssertionErrorWithContextParamsException extends AssertionError {

    public AssertionErrorWithContextParamsException(Object detailMessage) {
        super(detailMessage);
    }
}
