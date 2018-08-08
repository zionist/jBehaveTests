package com.tickeron.test.test;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.fge.jsonpatch.JsonPatch;
import com.github.fge.jsonpatch.diff.JsonDiff;
import com.tickeron.test.config.AppConfig;
import com.tickeron.test.config.ExceptionsConfig;
import com.tickeron.test.web.functional.steps.HttpSteps;
import com.tickeron.test.web.functional.steps.service.LoginSteps;
import com.tickeron.test.web.functional.steps.service.MallSteps;
import junit.framework.TestCase;
import org.apache.commons.io.IOUtils;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import javax.mail.MessagingException;
import java.io.IOException;
import java.io.InputStream;

/**
 */
public class TestJsonDiff extends TestCase {

    @Test
    public void testMallIndexPage1Test() throws IOException, MessagingException, InterruptedException {
        final ObjectMapper mapper = new ObjectMapper();
        final JsonNode patch = JsonDiff.asJson(mapper.readValue("[1, 2, [1, 3]]", JsonNode.class),
                mapper.readValue("[1, 2, [1, 3]]", JsonNode.class));
        assertEquals(patch.toString(), "[]");
    }

}

