package com.tickeron.test.web.functional.steps.service;

import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
// import com.thoughtworks.selenium.webdriven.commands.DragAndDrop;
// import com.thoughtworks.selenium.webdriven.commands.DragAndDropToObject;
import com.tickeron.test.common.exceptions.AssertionErrorWithContextParamsException;
import com.tickeron.test.common.exceptions.PropertyNotFoundException;
import com.tickeron.test.web.functional.steps.MailSteps;
import com.tickeron.test.web.functional.steps.ParamsAndVariablesSteps;
import com.tickeron.test.web.functional.steps.SeleniumSteps;

import org.hamcrest.CoreMatchers;
import org.jbehave.core.annotations.*;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;

import static org.junit.Assert.*;

import java.io.*;
import java.math.BigInteger;
import java.net.CookieManager;
import java.net.CookiePolicy;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by slaviann on 11.09.15.
 * Basic class for all service related logic.
 * This class can have child classes for logical units (Login, Portfolio, User Management, Community ... etc)
 */
public class ServiceStepsBasic {

    private static Logger log = LoggerFactory.getLogger(ServiceStepsBasic.class);

    private Optional<String> md5String = Optional.empty();
    private Optional<Actions> actions = Optional.empty();

    @Autowired
    private Environment environment;

    @Autowired
    private SeleniumSteps seleniumSteps;

    @Autowired
    private MailSteps mailSteps;

    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;

    @Autowired
    private ApplicationContext applicationContext;

    protected WebDriver getWebDriver() {
        return seleniumSteps.getWebDriver();
    }


    protected String substituteParamsAndVariables(String input) {
        return paramsAndVariablesSteps.substituteParamsAndVariables(input);
    }



    @BeforeStories
    /**
     * Stops service
     */
    public void beforeStories() {
        if (!environment.getProperty("service.reset", Boolean.class)) return;
        String url = environment.getProperty("service.reset.daemon.url");
        log.debug("Service reset started on " + url);

        OkHttpClient okHttpClient = new OkHttpClient();
        try {
        // stop service
            Request.Builder builder = new Request.Builder().url(url + "stop");
            Request request = builder.build();
            okHttpClient.newCall(request).execute();
        // reset db
            builder = new Request.Builder().url(url + "db_reset");
            request = builder.build();
            okHttpClient.newCall(request).execute();
        // start service
            builder = new Request.Builder().url(url + "start");
            request = builder.build();
            okHttpClient.newCall(request).execute();
        } catch (IOException e ) {
            fail(String.format("Can't perform action with service reset daemon %s", url));
            e.printStackTrace();
        }
        log.debug("Service reset finished");
    }


    @When("I wait until service ready")
    public void waitUntilServiceReady() {
        try {
            // Wait until server will show progress bar
            Thread.sleep(environment.getProperty("wait.timeout.small", Integer.class) * 1000);
            WebDriverWait wait = new WebDriverWait(getWebDriver(), environment.getProperty("wait.timeout.big", Integer.class));
            wait.until(
                    new ExpectedCondition<Boolean>() {
                        String currentValue = "";

                        @Override
                        public Boolean apply(WebDriver driver) {
                            currentValue = driver.findElement(By.cssSelector("html")).getAttribute("class");
                            return !currentValue.contains("nprogress-busy");
                        }

                        @Override
                        public String toString() {
                            return String.format("attribute %s to be \"%s\". Current attribute values : \"%s\"", "class", "nprogress-busy", currentValue);
                        }
                    }


            );
        }
        catch (java.lang.InterruptedException e) {
            log.error(e.toString());
            System.exit(1);
        }
    }


    @Given("I wait big timeout")
    @When("I wait big timeout")
    @Then("I wait big timeout")
    public void waitBigTimeout() {
        try {
            Thread.sleep(environment.getProperty("sleep.timeout.big", Integer.class) * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
            System.exit(1);
        }
    }

    @Given("I wait small timeout")
    @When("I wait small timeout")
    @Then("I wait small timeout")
    public void waitSmallTimeout() {
        try {
            Thread.sleep(environment.getProperty("sleep.timeout.small", Integer.class) * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
            System.exit(1);
        }
    }

    @Given("I wait for $milliseconds milliseconds")
    @Then("I wait for $milliseconds milliseconds")
    @When("I wait for $milliseconds milliseconds")
    public void Wait(Integer milliseconds) throws InterruptedException {
        Thread.sleep(milliseconds);
    }


    @Given("Do nothing")
    @Then("Do nothing")
    public void doNothing() {

    }

    @When("I click on $description with $selectorType selector $selector")
    public void clickOnElementBySelector(String description, String selectorType, String selector) {
        selector = substituteParamsAndVariables(selector);
        waitUntilElementIsVisibleAndEnabled(getByBySelectorType(selectorType, selector)).click();
    }

    @When("I click using js on $description with $selectorType selector $selector")
    public void clickOnElementBySelectorUsingJs(String description, String selectorType, String selector) {
        selector = substituteParamsAndVariables(selector);
        seleniumSteps.executeJavaScript(String.format("$(\"%s\").click()", selector));
        seleniumSteps.executeJavaScript(String.format("$(\"%s\").change()", selector));
    }

    @When("I pushAndHold on element $description with $selectorType selector $selector")
    // description only for humans
    public void pushAndHoldElementWithSelector(String description, String selectorType, String selector) {
       actions.ifPresent(a -> {
            a.clickAndHold(getWebDriver().findElement(getByBySelectorType(selectorType, selector))).perform();
        });

    }

    @When("I move to element $description with $selectorType selector $selector")
    // description only for humans
    public void moveToElementWithSelector(String description, String selectorType, String selector) {
        actions.ifPresent(a -> {
            a.moveToElement(getWebDriver().findElement(getByBySelectorType(selectorType, selector))).release().perform();
        });
    }

    @When("I clear the $description with $selectorType selector $selector")
    // description only for humans
    public void ClearElementBySelector(String description, String selectorType, String selector) {
        selector = substituteParamsAndVariables(selector);
        waitUntilElementIsVisibleAndEnabled(getByBySelectorType(selectorType, selector)).clear();
    }

    @When("I type $string into $description with $selectorType selector $selector")
    // description only for humans
    public void typeIntoElementBySelector(String input, String description, String selectorType, String selector) {
        input = substituteParamsAndVariables(input);
        selector = substituteParamsAndVariables(selector);
        waitUntilElementIsVisibleAndEnabled(getByBySelectorType(selectorType, selector));
        //getWebDriver().findElement(getByBySelectorType(selectorType, selector)).clear();
        getWebDriver().findElement(getByBySelectorType(selectorType, selector)).sendKeys(input);
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


    /**
     * Uploads file from classpath via selenium
     * Must be used for all files upload
     * @param webElement
     * @param fileName
     */
    private void uploadFileToWebElement(WebElement webElement, String fileName) throws InterruptedException {
        webElement.sendKeys(getLocalFile(fileName).getAbsolutePath());
        Thread.sleep(environment.getProperty("sleep.timeout.small", Integer.class) * 1000);
    }


    /**
     * Download via via okhttp client
     * Count new digestString and save it to the class property
     * @param url file url
     */

    private void downloadFile(String url) {
        log.debug(String.format("File download using okhttpclient started"));
        md5String = Optional.empty();

        OkHttpClient okHttpClient = new OkHttpClient();
        CookieManager cookieManager = new CookieManager();

        // Let's accept all cookies
        cookieManager.setCookiePolicy(CookiePolicy.ACCEPT_ALL);
        okHttpClient.setCookieHandler(cookieManager);

        Request.Builder builder = new Request.Builder();
        builder = builder.url(url);

        // Copy all cookies from browser.
        for(org.openqa.selenium.Cookie cookie : getWebDriver().manage().getCookies()) {
            builder = builder.addHeader("Cookie", String.format("%s=%s", cookie.getName(), cookie.getValue()));
        }


        Request request = builder.build();
        try {
            Response response = okHttpClient.newCall(request).execute();
            InputStream inputStream = response.body().byteStream();
            md5String = Optional.of(MD5StringFromInputStream(inputStream));
        } catch (IOException e ) {
            fail(String.format("Can't download file %s", url));
            e.printStackTrace();
        }
        log.debug(String.format("File download finished. md5sum of downloaded file is %s", md5String));

    }

    /**
     * Counts MD5 human readable string from InputStream object
     * @param inputStream
     * @return human readable MD5 string
     */
    private String MD5StringFromInputStream(InputStream inputStream) {
        MessageDigest messageDigest;
        try {
            messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.reset();
            byte[] dataBytes = new byte[1024];
            int read;
            while ((read = inputStream.read(dataBytes)) != -1) {
                messageDigest.update(dataBytes, 0, read);

            }
        } catch (NoSuchAlgorithmException | IOException e) {
            fail("Can't read from input stream");
            e.printStackTrace();
            return "";
        }
        return new BigInteger(1, messageDigest.digest()).toString(16);
    }


    @Then("Downloaded file is $fileName")
    public void compareDownloadedFileChecksumWithLocalFile(String fileName) throws IOException, NoSuchAlgorithmException {
        InputStream inputStream = new FileInputStream(getLocalFile(fileName).getAbsolutePath());
        assertEquals(String.format("Downloaded file is not %s. Please see md5 checksum", fileName),
                MD5StringFromInputStream(inputStream), md5String.get());
        md5String = Optional.empty();

    }

    @When("I download $description file from <a> element with $selectorType selector $selector")
    public void downloadFileFromElement(String description, String selectorType, String selector) {
        WebElement element = getWebDriver().findElement(getByBySelectorType(selectorType, selector));
        downloadFile(element.getAttribute("href"));
    }

    @When("I upload file $fileName using input element with $selectorType selector $selector")
    public void uploadFile(String fileName, String selectorType, String selector) throws InterruptedException {
        uploadFileToWebElement(getWebDriver().findElement(getByBySelectorType(selectorType, selector)), fileName);
    }

    protected By getByBySelectorType(String selectorType, String selector){
        By by;
        switch(selectorType) {
            case "css":
                by = By.cssSelector(selector);
                break;
            case "xpath":
                by = By.xpath(selector);
                break;
            case "link":
                by = By.linkText(selector);
                break;
            case "partialLinkText":
                by = By.partialLinkText(selector);
                break;
            case "containsText":
                by = By.xpath(String.format("(//*[contains(.,'%s')])[last()]", selector));
                break;
            default:
                throw new RuntimeException(String.format("No selector type %s found. Please use css, xpath, link or PartialLinkText selectors", selectorType));

        }
        return by;
    }

    @Then("I see $description with $selectorType selector $selector is: $text")
    @Alias("I see $description with $selectorType selector $selector is $text")
    // description only for humans
    public void checkElementTextBySelectorIs(String desription, String selectorType, String selector, String text) {
        text = paramsAndVariablesSteps.substituteParamsAndVariables(text);
        waitUntilElementIsVisibleAndEnabled(getByBySelectorType(selectorType, selector));
        waitUntilElementTextIs(getByBySelectorType(selectorType, selector), text);
    }

    @Then("I see html code of $description with $selectorType selector $selector contains $text")
    // description only for humans
    public void checkElementHtmlCodeBySelectorContains(String desription, String selectorType, String selector, String text) {
        text = paramsAndVariablesSteps.substituteParamsAndVariables(text);
        try {
            WebElement element = waitUntilElementIsVisibleAndEnabled(getByBySelectorType(selectorType, selector));
            assertTrue(waitUntilElementIsVisibleAndEnabled(getByBySelectorType(selectorType, selector)).getAttribute("innerHTML").contains(text));
        } catch (AssertionError e) {
            throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException", e);
        }
    }

    @Then("I don't see element $description with $selectorType selector $selector")
    // description only for humans
    public void checkNoElementPresent(String description, String selectorType, String selector) {
        waitSmallTimeout();
        try {
            By by = getByBySelectorType(selectorType, selector);
            assertEquals(String.format("The element %s was unexpecticly found", selector), true, getWebDriver().findElements(by).isEmpty());
        }
        catch (AssertionError e) {
            throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException", e);
        }
    }

    @Then("I see $description with $selectorType selector $selector is not $text")
    // description only for humans
    public void checkElementTextBySelectorIsNot(String description, String selectorType, String selector, String text) {
        text = paramsAndVariablesSteps.substituteParamsAndVariables(text);
        try {
            assertNotEquals(text, waitUntilElementIsVisibleAndEnabled(getByBySelectorType(selectorType, selector)).getText());
        }
        catch (AssertionError e) {
            throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException", e);
        }
    }

    @Then("I see $description with $selectorType selector $selector contains: $text")
    // description only for humans
    public void checkElementTextBySelectorContains(String desription, String selectorType, String selector, String text) {
        text = paramsAndVariablesSteps.substituteParamsAndVariables(text);
        waitUntilElementIsVisibleAndEnabled(getByBySelectorType(selectorType, selector));
        waitUntilElementTextContains(getByBySelectorType(selectorType, selector), text);
    }

    @Then("I check $description with $selectorType selector $selector contains $text or contains $text2")
    // description only for humans
    // This step checked do we have text or text2 in this Selector
    public void checkElementTextOrTextBySelectorContains(String desription, String selectorType, String selector, String text, String text2) {
        text = paramsAndVariablesSteps.substituteParamsAndVariables(text);
        text2 = paramsAndVariablesSteps.substituteParamsAndVariables(text2);
        WebElement webElement = waitUntilElementIsVisibleAndEnabled(getByBySelectorType(selectorType, selector));
        if(webElement.getText().contains(text) || webElement.getText().contains(text2)){
        }
        else {
            throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException", "No one element not true");
        }
    }

    @When("I start recording action")
    public void startActionRecord() throws InterruptedException {
        actions = Optional.of(new Actions(getWebDriver()));

    }
    @When("I will move in action to $description element with $selectorType selector $selector")
    public void actionsMoveToElementBySelector(String description, String selectorType, String selector) {
        actions.ifPresent(a -> {
            a.moveToElement(getWebDriver().findElement(getByBySelectorType(selectorType, selector)));
        });
    }

    @When("I will click in action on $description element with $selectorType selector $selector")
    public void actionsClickOnElementBySelector(String description, String selectorType, String selector) {
        actions.ifPresent(a -> {
            a.click(getWebDriver().findElement(getByBySelectorType(selectorType, selector)));
        });
    }


    @Then("I perform previously recorded action")
    public void performAction() {
        actions.ifPresent(a -> {
            a.perform();
            waitSmallTimeout();
        });
    }


    /**
     * Wait until text of element will be contain content string
     * Then do assert equals check
     * Display old element content if element became not visible
     * @param by
     * @param content
     */
    private void waitUntilElementTextIs(By by, String content) {
        log.debug(String.format("Waiting for element %s will contains text %s", by.toString(), content));
        WebElement webElement = getWebDriver().findElement(by);
        // display old text in case element is not visible after wait
        String oldText = webElement.getText();
        try {
            new WebDriverWait(getWebDriver(), environment.getProperty("wait.timeout.big", Integer.class))
                    .until(ExpectedConditions.textToBePresentInElement(webElement, content));
            assertEquals(content, getWebDriver().findElement(by).getText());
        }
        catch (WebDriverException e) {
            try {
                assertEquals(content, getWebDriver().findElement(by).getText());
            } catch (AssertionError a) {
                throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException", a);
                // display old text in case no element not visible after wait
            } catch (NoSuchElementException a) {
                try {
                    assertEquals(content, oldText);
                } catch (AssertionError b) {
                    throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException", b);
                }
            }
        }
        catch (AssertionError e) {
            throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException", e);
        }
        log.debug(String.format("Waiting for element %s contains text %s finished successfully", by.toString(), content));
    }

    /**
     * Wait until text of element will be contain content string
     * Then do assert contains check
     * @param by
     * @param content
     */
    private void waitUntilElementTextContains(By by, String content) {
        log.debug(String.format("Waiting for element %s will contains text %s", by.toString(), content));
        WebElement webElement = getWebDriver().findElement(by);
        try {
            new WebDriverWait(getWebDriver(), environment.getProperty("wait.timeout.big", Integer.class))
                    .until(ExpectedConditions.textToBePresentInElement(webElement, content));
            assertThat(getWebDriver().findElement(by).getText(), CoreMatchers.containsString(content));
        }
        catch (WebDriverException e) {
            //log.warn(String.format("element %s does not contains %s. Can't perform any action with it", by.toString(), content), paramsAndVariablesSteps.getTestParamsStorage());
            try {
                assertThat(getWebDriver().findElement(by).getText(), CoreMatchers.containsString(content));
            } catch (AssertionError a) {
                throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException", a);
            }
        } catch (AssertionError e) {
            throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException", e);
        }
        log.debug(String.format("Waiting for element %s contains text %s finished successfully", by.toString(), content));

    }

    public WebElement waitUntilElementIsVisibleAndEnabled(By by) {
        log.debug(String.format("Waiting for element %s will be visible", by.toString()));
        try {
            new WebDriverWait(getWebDriver(), environment.getProperty("wait.timeout.big", Integer.class))
                    .until(ExpectedConditions.elementToBeClickable(by));
        }
        catch (WebDriverException e) {
            throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException",
                    String.format("element with selector %s is not visible or not enabled. Can't perform any action with it", by.toString()));
        }
        log.debug(String.format("Waiting for element %s finished successfully", by.toString()));
        return getWebDriver().findElement(by);

    }

    @When("I will wait until $description element with $selectorType selector $selector will be visible")
    @Then("I will wait until $description element with $selectorType selector $selector will be visible")
    public void waitUntilElementIsVisibleAndEnabled(String description, String selectorType, String selector) {
        waitUntilElementIsVisibleAndEnabled(getByBySelectorType(selectorType, selector));

    }

    @Then("I see there is no $description with $selectorType selector $selector")
    public void checkThereisNoElement(String description, String selectorType, String selector) {
        try {
            getWebDriver().findElement(getByBySelectorType(selectorType, selector));
        }
        catch (NoSuchElementException e) {
            return;
        }
        //If element present in DOM, check that it invisible
        if (!getWebDriver().findElement(getByBySelectorType(selectorType, selector)).isDisplayed())
            return;

        throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException",
                String.format("Element %s should not be present, but it was found", getByBySelectorType(selectorType, selector)));
        }

    @When("I switch to $description frame with $selectorType selector $selector")
    // description only for humans
    public void switchToFrame(String description, String selectorType, String selector) {
        selector = substituteParamsAndVariables(selector);
        waitUntilElementIsVisibleAndEnabled(getByBySelectorType(selectorType, selector));
        WebElement frameElement = getWebDriver().findElement(getByBySelectorType(selectorType, selector));
        getWebDriver().switchTo().frame(frameElement);
    }

    @When("I type $input using js to element $description with css selector $selector")
    public void typeTextUsingJs(String input, String description, String selector) {
        selector = paramsAndVariablesSteps.substituteParamsAndVariables(selector);
        String v1 = String.format("$(\"%s\").val(\"%s\")", selector, input);
        String v2 = String.format("$(\"%s\").change()", selector);
        seleniumSteps.executeJavaScript(String.format("$(\"%s\").val(\"%s\")", selector, input));
        seleniumSteps.executeJavaScript(String.format("$(\"%s\").change()", selector));

    }

    @Then("I switch to default content")
    public void switchToDefaultContent() {
        getWebDriver().switchTo().defaultContent();
    }

    @Then("Stop")
    @When("Stop")
    public void stop() {
        System.exit(0);
    }

    /**
     * Handle Select elements on web page, like dropdown lists.
     * @param elementTitle  option which you select, could be of types: visible text, index, value
     * @param byMethod      a select method corresponding to elementTitle: ByVisibleText, ByIndex, ByValue
     * @param selectorType  type of selector for Select element (e.g. css, xpath...)
     * @param selector      selector value for Select element, which you want to handle
     * @see                 Select
     */
    @When("I select $elementTitle $byMethod from Select element with $selectorType selector $selector")
    public void selectFromList(String elementTitle, String byMethod, String selectorType, String selector) {
        selector = substituteParamsAndVariables(selector);
        waitUntilElementIsVisibleAndEnabled(getByBySelectorType(selectorType, selector));
        Select dropdown = new Select(getWebDriver().findElement(getByBySelectorType(selectorType, selector)));
        switch (byMethod) {
            case "ByVisibleText":
                dropdown.selectByVisibleText(elementTitle);
                break;
            case "ByIndex":
                dropdown.selectByIndex(Integer.parseInt(elementTitle));
                break;
            case "ByValue":
                dropdown.selectByValue(elementTitle);
                break;
            default:
                throw new RuntimeException(String.format("No byMethod type %s found. Please use ByVisibleText, ByIndex, ByValue methods", byMethod));

        }
        waitUntilServiceReady();
    }

    //@Then("I see if $description with $selectorType selector $selector istrue: $contains")
    @Then("I see element $description with css selector $selector has class $class")
    // description only for humans
    public void checkElementClassContains(String description, String selector, String cls) {
        cls = paramsAndVariablesSteps.substituteParamsAndVariables(cls);
        seleniumSteps.executeJavaScript(String.format("if ($(\"%s\").attr(\"class\").indexOf(\"%s\")!=-1 !=true) { throw (\"Test failed\") }", selector, cls));
    }

    /**
     * Step for checking any property value of element, like 'value', 'tagName'...
     * @param description   element description, for better human understanding
     * @param selector      element css selector
     * @param property      property title for checking
     * @param propertyValue expected property value
     */
    @Then("I see element property $description with css selector $selector has property $property with value $propertyValue")
    public void checkElementPropertyContains(String description, String selector, String property, String propertyValue) {
        property = paramsAndVariablesSteps.substituteParamsAndVariables(property);
        propertyValue = paramsAndVariablesSteps.substituteParamsAndVariables(propertyValue);
        seleniumSteps.executeJavaScript(String.format("if ($(\"%s\").prop(\"%s\").indexOf(\"%s\")!=-1 !=true) { throw (\"Test failed\") }", selector, property, propertyValue));
    }

    /**
     * Step for checking any attribute value of element
     * @param description       element description, for better human understanding
     * @param selector          element css selector
     * @param attribute         attribute title for checking
     * @param attributeValue    expected attribute value
     */
    @Then("I see element attribute $description with css selector $selector has attribute $attribute with value $attributeValue")
    public void checkElementAttributeContains(String description, String selector, String attribute, String attributeValue) {
        attribute = paramsAndVariablesSteps.substituteParamsAndVariables(attribute);
        attributeValue = paramsAndVariablesSteps.substituteParamsAndVariables(attributeValue);
        seleniumSteps.executeJavaScript(String.format("if ($(\"%s\").attr(\"%s\").indexOf(\"%s\")!=-1 !=true) { throw (\"Test failed\") }", selector, attribute, attributeValue));
    }

    @Then("I check input element $description with property $property with css selector $selector is true")
    public void checkInputElementChecked(String description, String property, String selector) {
        seleniumSteps.executeJavaScript(String.format("if ($(\"%s\").prop(\"%s\") != true) { throw (\"Test failed\") }", selector, property));
    }

    @Then("I check input element $description with property $property with css selector $selector is false")
    public void checkInputElementUnChecked(String description, String property, String selector) {
        seleniumSteps.executeJavaScript(String.format("if ($(\"%s\").prop(\"%s\") != false) { throw (\"Test failed\") }", selector, property));
    }

    @When("I save text from $description element with $selectorType selector $selector to variable $name")
    public void saveTextFromElement(String description, String selectorType, String selector, String name) {
        WebElement element = waitUntilElementIsVisibleAndEnabled(getByBySelectorType(selectorType, selector));
        paramsAndVariablesSteps.setParamValue(name, element.getText());
    }

    @When("Open new tab in browser")
    public void openNewTab() {
        getWebDriver().findElement(By.cssSelector("body")).sendKeys(Keys.CONTROL +"t");
    }

    @When("SwitchTo new window in browser")
    public void switchToNewWindow() {
        getWebDriver().switchTo().window("");
    }


    @When("close all windows and open new one")
    public void closeWindowAndOpenNew() throws InterruptedException {
        getWebDriver().quit();  // close all windows
        seleniumSteps.setWebDriver(Optional.empty());
        //seleniumSteps.setUpWebDriver(); // open new browser
    }

    @When("Switch to tab $number")
    public void switchToTab(String number) {
        ArrayList<String> tabs = new ArrayList<String> (getWebDriver().getWindowHandles());
        getWebDriver().switchTo().window(tabs.get(Integer.parseInt(number)));
    }

    @When("Browser navigate back")
    public void browserNavigateBack() {
        getWebDriver().navigate().back();
    }
}
