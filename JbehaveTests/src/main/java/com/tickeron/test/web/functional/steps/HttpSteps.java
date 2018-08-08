package com.tickeron.test.web.functional.steps;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.fge.jsonpatch.JsonPatch;
import com.github.fge.jsonpatch.diff.JsonDiff;
import com.google.gson.*;
import com.squareup.okhttp.*;
import com.tickeron.test.common.exceptions.HttpFailureException;
import com.tickeron.test.common.exceptions.PropertyNotFoundException;
import com.tickeron.test.web.functional.steps.service.LoginSteps;
import groovy.json.JsonSlurper;
import static org.junit.Assert.*;

import groovy.util.Eval;
import org.apache.commons.io.IOUtils;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.jbehave.core.model.ExamplesTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.CookieManager;
import java.net.CookiePolicy;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.TimeUnit;

/**
 * Created by slaviann on 19.01.16.
 */
public class HttpSteps {

    public HttpSteps(Integer connectTimeout) {
        CookieManager cookieManager = new CookieManager();
        cookieManager.setCookiePolicy(CookiePolicy.ACCEPT_ALL);
        okHttpClient.setCookieHandler(cookieManager);
        okHttpClient.setConnectTimeout(connectTimeout, TimeUnit.SECONDS); // connect timeout
        okHttpClient.setReadTimeout(connectTimeout, TimeUnit.SECONDS); // connect timeout
    }
    // Groovy JSON(;
    private JsonSlurper jsonSlurper = new JsonSlurper();
    // Cool java JSON parser
    private JsonParser jsonParser = new JsonParser();

    // Jackson for json diff
    final ObjectMapper mapper = new ObjectMapper();

    private OkHttpClient okHttpClient = new OkHttpClient();

    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;

    @Autowired
    private ApplicationContext applicationContext;

    @Autowired
    private LoginSteps loginSteps;

    @Autowired
    private Environment environment;

    private Optional<String> requestBody = Optional.empty();
    private Optional<String> responseBody;
    private Response response;
    private Map<String, String> queryParams = new HashMap<>();

    public Map<String, String> getQueryParams() {
        return queryParams;
    }

    public Map<String, String> getRequestHeaders() {
        return requestHeaders;
    }

    private Map<String, String> requestHeaders = new HashMap<>();

    public Optional<String> getRequestBody() {
        return requestBody;
    }

    private void cleanupClient(){
        requestBody = Optional.empty();
        queryParams.clear();
        requestHeaders.clear();
    }

    private File getLocalFile(String fileName) {
        String imageDirString = environment.getProperty("image.path", "");
        if (imageDirString.isEmpty()) {
            throw (PropertyNotFoundException)applicationContext.getBean("PropertyNotFoundException", "image.path");
        }
        File imageDir = null;
        try {
            imageDir = new ClassPathResource(imageDirString).getFile();
            if (!imageDir.isDirectory()) fail(String.format("Image %s is not a directory", imageDirString));
        } catch (IOException e) {
            fail(String.format("Please check directory %s exists", imageDirString));
        }
        File imageFile  = new File(Paths.get(imageDir.getAbsolutePath(), fileName).toString());
        if(!imageFile.exists()) {
            fail(String.format("Please check file %s exists", imageFile.getAbsolutePath()));
        }
        return imageFile;
    }

    public Response getResponse() {
        return response;
    }

    public void setResponse(Response response) {
        try {
            responseBody = Optional.of(response.body().string());
        } catch (IOException e) {
            responseBody = Optional.empty();
        }
        this.response = response;
    }

    @Given("query string parameters: $paramTable")
    public void setQueryStringParams(ExamplesTable table)  {
        queryParams.clear();
        for (Map<String,String> row : table.getRows()) {
            String name = row.get("name");
            String value = row.get("value");
            value = paramsAndVariablesSteps.substituteParamsAndVariables(value);
            name = paramsAndVariablesSteps.substituteParamsAndVariables(name);
            queryParams.put(name, value);
        }
    }

    @Given("request header $header with value $value")
    public void setRequestHeader(String name, String value) {
        value = paramsAndVariablesSteps.substituteParamsAndVariables(value);


    }

    private String getResponseHeader(String header) {
        return getResponse().header(header);
    }

    @Given("request body: $body")
    public void setRequestBody(String body) {
        cleanupClient();
        requestBody = Optional.of(paramsAndVariablesSteps.substituteParamsAndVariables(body));
    }

    @Given("request body is empty")
    public void setRequestBodyToempry() {
        cleanupClient();
        requestBody = Optional.empty();
    }

    private Object parseJsonString(String json) {
        return jsonSlurper.parseText(json);
    }

    public String prettyPrintRequest() {
        final List<String> headers = new ArrayList<>();
        this.getRequestHeaders().forEach((k, v) -> headers.add(String.format("%s: %s\n",
                paramsAndVariablesSteps.substituteParamsAndVariables(k),
                paramsAndVariablesSteps.substituteParamsAndVariables(v))));
        return String.format("Headers:\n%s\nBody:\n%s\n\n", String.join("", headers),
                paramsAndVariablesSteps.substituteParamsAndVariables(this.getRequestBody().orElse("")));

    }

    public String prettyPrintResponce() {
        final List<String> headers = new ArrayList<>();
        this.getResponse().headers().names().forEach(n -> headers.add(String.format("%s, %s\n",
                paramsAndVariablesSteps.substituteParamsAndVariables(n),
                paramsAndVariablesSteps.substituteParamsAndVariables(this.getResponseHeader(n)))));
        return String.format("Headers:\n%s\nBody:\n%s\n\n", String.join("", headers),
                paramsAndVariablesSteps.substituteParamsAndVariables(this.getResponseBody().orElse("")));
    }

    @Then("response body is: $content")
    public void bodyIs(String content) {
        content = paramsAndVariablesSteps.substituteParamsAndVariables(content);
        assertEquals(content, getResponseBody().orElse(""));
    }

    @Then("response body contains: $content")
    public void bodyContains(String content) {
        content = paramsAndVariablesSteps.substituteParamsAndVariables(content);
        assertTrue(getResponseBody().orElse("").contains(content));
    }

    /**
     * Checks if JSON response matches is the given JSON content. Print JSON diff
     */
    @Then("response JSON body is: $content")
    public void jsonBodyEqualsTo(String content) throws IOException {
        content = paramsAndVariablesSteps.substituteParamsAndVariables(content);
        final JsonNode jsonNode1 = mapper.readValue(getResponseBody().orElse(""), JsonNode.class);
        final JsonNode jsonNode2 = mapper.readValue(content, JsonNode.class);
        final JsonNode patch = JsonDiff.asJson(jsonNode2, jsonNode1);

        List<String> l = new ArrayList<>();
        patch.forEach(n -> l.add(n.toString()));

        assertTrue(String.format("Comparison failed: \nExpected: %s \nResponse body: %s \nDiff:\n%s",
                content, getResponseBody().orElse(""), String.join("\n", l)),
                patch.toString().equals("[]"));
    }

    @Then("response has status $status")
    public void checkResponseStatus(Integer status) {
        Integer actualStatus = getResponse().code();
        try {
            assertEquals(status, actualStatus);
        } catch (AssertionError e) {
            throw (HttpFailureException)applicationContext.getBean("httpFailureException", e);
        }
    }

    @Then("response has header $header with value which matches $regexp regexp")
    public void checkHeaderMatchedRegexp(String header, String regexp) {
        String actualValue = getResponseHeader(header);
        assertNotNull(String.format("Header %s is not set", header), actualValue);
        assertTrue(String.format("Header '%s' has value '%s', which doesn't match regexp '%s'",
                header, actualValue, regexp), actualValue.matches(regexp));
    }
    @Then("response has header $header with value $value")
    public void checkHeaderValue(String header, String value) {
        String actualValue = getResponseHeader(header);
        assertNotNull(String.format("Header %s is not set", header), actualValue);
        assertTrue(String.format("Header '%s' has value '%s', which doesn't == '%s'",
                header, actualValue, value), actualValue.equals(value));
    }
    @Then("response header $header contains value $value")
    public void checkHeaderContainsValue(String header, String value) {
        header = getResponseHeader(header);
        assertTrue(header.contains(value));
    }

    @Then("response body is empty")
    public void responseBodyIsEmpty() {
        try {
            assertTrue(String.format("Responce body is not empty %s",
                    getResponseBody().get()), getResponseBody().orElse("").isEmpty());
        } catch (AssertionError e) {
            throw (HttpFailureException)applicationContext.getBean("httpFailureException", e);
        }
    }

    public Optional<String> getResponseBody() {
        return responseBody;
    }

    @Then("response JSON body satisfies condition: $condition")
    public void jsonBodySatisfiesCondition(String condition) throws IOException {
        condition = paramsAndVariablesSteps.substituteParamsAndVariables(condition);
        Object parsedBody = parseJsonString(getResponseBody().orElse(""));
        Object result = Eval.me("it", parsedBody, condition);
        Boolean res = (Boolean)result;
        assertTrue("Condition failed:\n" +
                "expected: true\n" +
                "actual: " + res + "\n" +
                "response body: " + getResponseBody().orElse("") + "\n" +
                //"parsed as: \n" + parsedBody + "\n"
                "Must be: " + condition, res);
    }


    @When("I perform $method request to $url")
    public void performJsonRequest(String method, String url) {
        url = paramsAndVariablesSteps.substituteParamsAndVariables(url);

        //JSON only requests
        final MediaType APPLICATION_JSON = MediaType.parse("application/json; charset=utf-8");

        Request.Builder builder = new Request.Builder();

        //Build url
        HttpUrl.Builder httpUrlBuilder = new HttpUrl.Builder();

        httpUrlBuilder = httpUrlBuilder.scheme(getServiceUrlProperty().scheme())
        .host(getServiceUrlProperty().host())
        .addPathSegment(url);

        // set query params
        for(String key: getQueryParams().keySet()) {
            httpUrlBuilder = httpUrlBuilder.addQueryParameter(paramsAndVariablesSteps.substituteParamsAndVariables(key),
                    paramsAndVariablesSteps.substituteParamsAndVariables(getQueryParams().get(key)));
        }

        HttpUrl httpUrl = httpUrlBuilder.build();
        builder = builder.url(httpUrl);

        // set requestHeaders
        for (String key : getRequestHeaders().keySet()) {
            builder = builder.addHeader(paramsAndVariablesSteps.substituteParamsAndVariables(key),
                    paramsAndVariablesSteps.substituteParamsAndVariables(getRequestHeaders().get(key)));
        }
        builder = builder.addHeader("Accept", "application/json, text/plain, *//*");
        //builder = builder.addHeader("Cookie", loginSteps.getAuthCookie().orElseThrow(() -> new RuntimeException("Please make auth first. Can't do any request without auth cookie")));

        if (method.equals("POST"))
        builder.post(RequestBody.create(APPLICATION_JSON, getRequestBody().orElse("")));

        if (method.equals("GET"))
            builder.get();

        Request request = builder.build();
        try {
            setResponse(okHttpClient.newCall(request).execute());
        } catch (IOException e ) {
            e.printStackTrace();
        }
        //cleanupClient();
    }

    @When("I admin perform $method request to $url")
    public void performAdminJsonRequest(String method, String url2) {
        url2 = paramsAndVariablesSteps.substituteParamsAndVariables(url2);

        //JSON only requests
        final MediaType APPLICATION_JSON = MediaType.parse("application/json; charset=utf-8");

        Request.Builder builder = new Request.Builder();

        //Build url
        HttpUrl.Builder httpUrlBuilderAdmin = new HttpUrl.Builder();

        httpUrlBuilderAdmin = httpUrlBuilderAdmin.scheme(getServiceAdminUrlProperty().scheme())
                .host(getServiceAdminUrlProperty().host())
                .addPathSegment(url2);

        // set query params
        for(String key: getQueryParams().keySet()) {
            httpUrlBuilderAdmin = httpUrlBuilderAdmin.addQueryParameter(paramsAndVariablesSteps.substituteParamsAndVariables(key),
                    paramsAndVariablesSteps.substituteParamsAndVariables(getQueryParams().get(key)));
        }

        HttpUrl httpUrl = httpUrlBuilderAdmin.build();
        builder = builder.url(httpUrl);

        // set requestHeaders
        for (String key : getRequestHeaders().keySet()) {
            builder = builder.addHeader(paramsAndVariablesSteps.substituteParamsAndVariables(key),
                    paramsAndVariablesSteps.substituteParamsAndVariables(getRequestHeaders().get(key)));
        }
        builder = builder.addHeader("Accept", "application/json, text/plain, *//*");
        //builder = builder.addHeader("Cookie", loginSteps.getAuthCookie().orElseThrow(() -> new RuntimeException("Please make auth first. Can't do any request without auth cookie")));

        if (method.equals("POST"))
            builder.post(RequestBody.create(APPLICATION_JSON, getRequestBody().orElse("")));

        if (method.equals("GET"))
            builder.get();

        Request request = builder.build();
        try {
            setResponse(okHttpClient.newCall(request).execute());
        } catch (IOException e ) {
            e.printStackTrace();
        }
        //cleanupClient();
    }

    @When("I make multipart file upload for $file request to $url")
    public void uploadFileToServerMultipart(String fileName, String url) {
        url = paramsAndVariablesSteps.substituteParamsAndVariables(url);

        //JSON only requests
        final MediaType MEDIA_TYPE_GIF = MediaType.parse("image/gif");

        Request.Builder builder = new Request.Builder();

        //Build url
        HttpUrl.Builder httpUrlBuilder = new HttpUrl.Builder();

        httpUrlBuilder = httpUrlBuilder.scheme(getServiceUrlProperty().scheme())
                .host(getServiceUrlProperty().host())
                .addPathSegment(url);

        // set query params
        for(String key: getQueryParams().keySet()) {
            httpUrlBuilder = httpUrlBuilder.addQueryParameter(paramsAndVariablesSteps.substituteParamsAndVariables(key),
                    paramsAndVariablesSteps.substituteParamsAndVariables(getQueryParams().get(key)));
        }

        HttpUrl httpUrl = httpUrlBuilder.build();
        builder = builder.url(httpUrl);

        // set requestHeaders
        for (String key : getRequestHeaders().keySet()) {
            builder = builder.addHeader(paramsAndVariablesSteps.substituteParamsAndVariables(key),
                    paramsAndVariablesSteps.substituteParamsAndVariables(getRequestHeaders().get(key)));
        }

        RequestBody requestBody = new MultipartBuilder()
                .type(MultipartBuilder.FORM)
                .addPart(
                        Headers.of("Content-Disposition", String.format("form-data; name=\"file\"; filename=\"%s\"", fileName)),
                        RequestBody.create(MEDIA_TYPE_GIF, new File(getLocalFile(fileName).getAbsolutePath())))
                .build();


        builder = builder.addHeader("Accept", "application/json, text/plain, *//*");
        //builder = builder.addHeader("Cookie", loginSteps.getAuthCookie().orElseThrow(() -> new RuntimeException("Please make auth first. Can't do any request without auth cookie")));

        builder.post(requestBody);

        Request request = builder.build();
        try {
            setResponse(okHttpClient.newCall(request).execute());
        } catch (IOException e ) {
            e.printStackTrace();
        }
    }


    /*
    @Then("I save response header $responseHeader value to variable $variable")
    public void copyResponseHeaderToRequestHeader(String responseHeader, String variable) {
        Header header = getResponse().getFirstHeader(responseHeader);
        getVariableStorage().put(variable, header.getValue());
    }
    */
    @Then("I save JSON field $fieldName value into variable $variable")
    public void saveJsonFieldValuetoVariable(String fieldName, String variable) {
        JsonObject object = jsonParser.parse(getResponseBody().orElse("")).getAsJsonObject();
        if (object == null) fail(String.format("Wrong json format in response body %s", getResponseBody()));
        String result = null;
        if (object.isJsonObject()) {
            JsonObject element = object.getAsJsonObject();
            result = element.get(fieldName).getAsString();
        }
        else {
            fail(String.format("Wrong json format in response body %s", getResponseBody()));
        }
        assertNotNull(String.format("There is no result in response %s", getResponseBody()), result);
        paramsAndVariablesSteps.getTestParamsStorage().put(variable, result);
    }

    /**
     * @param groovyQueryToField groovy script for query one JSON value. result will be saved as String
     * @param variable variable for save groovy script resuolt
     */
    @Then("I save JSON field value using groovy query $groovyQuery into variable $variable")
    public void saveJsonFieldValuetoVariableUsingGroovy(String groovyQueryToField, String variable) {
        Object parsedBody = parseJsonString(getResponseBody().orElse(""));
        Object result = Eval.me("it", parsedBody, groovyQueryToField);
        if (result == null) throw new RuntimeException(String.format("GroovyQuery %s returned null. Response was %s", groovyQueryToField, getResponseBody().orElse("")));
        paramsAndVariablesSteps.getTestParamsStorage().put(variable, result.toString());
    }

    @Then("I save result to variable $variable")
    public void saveResultDigit(String variable) {
        variable = paramsAndVariablesSteps.substituteParamsAndVariables(variable);
            paramsAndVariablesSteps.getTestParamsStorage().put(variable, getResponseBody().orElse(""));
    }

    public HttpUrl getServiceUrlProperty() {
        //Build url
        HttpUrl.Builder httpUrlBuilder = new HttpUrl.Builder();
        Optional<String> serverUlr = Optional.ofNullable(System.getProperty("server.url"));

        if(serverUlr.isPresent()) {
            return HttpUrl.parse(serverUlr.get());
        } else {
            httpUrlBuilder = httpUrlBuilder.scheme(environment.getProperty("server.protocol"))
                    .host(environment.getProperty("server.host"))
                    .port(environment.getProperty("server.port", Integer.class));
            return httpUrlBuilder.build();
        }
    }

    public HttpUrl getServiceAdminUrlProperty() {
        //Build url
        HttpUrl.Builder httpUrlBuilderAdmin = new HttpUrl.Builder();
        Optional<String> serverUlr = Optional.ofNullable(System.getProperty("admin.url"));

        if(serverUlr.isPresent()) {
            return HttpUrl.parse(serverUlr.get());
        } else {
            httpUrlBuilderAdmin = httpUrlBuilderAdmin.scheme(environment.getProperty("server.protocol"))
                    .host(environment.getProperty("server.host.admin"))
                    .port(environment.getProperty("server.port", Integer.class));
            return httpUrlBuilderAdmin.build();
        }
    }
}
