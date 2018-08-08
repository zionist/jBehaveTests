package com.tickeron.test.web.functional.steps;

import com.squareup.okhttp.HttpUrl;
import com.tickeron.test.common.exceptions.AssertionErrorWithContextParamsException;
import com.tickeron.test.web.functional.steps.service.ServiceStepsBasic;
import org.apache.commons.io.FileUtils;
import org.jbehave.core.annotations.*;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.remote.UnreachableBrowserException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

/**
 * Created by slaviann on 11.09.15.
 * Selenium integration class
 */
public class SeleniumSteps {

    private static Logger log = LoggerFactory.getLogger(SeleniumSteps.class);
    public Optional<WebDriver> webDriver = Optional.empty();

    @Autowired
    private Environment environment;

    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;

    @Autowired
    private HttpSteps httpSteps;

    @Autowired
    ServiceStepsBasic serviceStepsBasic;

    @Given("Reset browser")
    public void resetBrowser() {
        webDriver.ifPresent(d -> d.manage().deleteAllCookies());
    }

    @When("I will refresh the page")
    public void refreshPage() {
        webDriver.ifPresent(d -> d.navigate().refresh());
    }

    private void setFireFoxWebDriver() {
        webDriver = Optional.of(new FirefoxDriver());
    }

    @When("I will execute javascript $javaScript")
    @Alias("I execute javascript $javaScript")
    public Optional<Object> executeJavaScript(String javaScript) {
        javaScript = paramsAndVariablesSteps.substituteParamsAndVariables(javaScript);
        webDriver.orElseThrow(() -> new RuntimeException("Now web driver configured"));
        if (webDriver.get() instanceof JavascriptExecutor) {
            JavascriptExecutor js;
            js = (JavascriptExecutor) webDriver.get();
            //js.executeScript("return document.getElementById('someId');");
            return Optional.ofNullable(js.executeScript(javaScript));
        }
        return Optional.empty();
    }

    private void setChromWebDriver() {
        System.setProperty("webdriver.chrome.driver", environment.getProperty("chrome.driver"));
        webDriver = Optional.of(new ChromeDriver());
    }

    private void setIEWebDriver() {
        System.setProperty("webdriver.ie.driver", environment.getProperty("ie.driver"));
        webDriver = Optional.of(new InternetExplorerDriver());
            }
    private void setEdgeWebDriver() {
        System.setProperty("webdriver.edge.driver", environment.getProperty("edge.driver"));
        webDriver =Optional.of(new EdgeDriver());
    }


    @Given("I open $description url $url")
    @When("I open $description url $url")
    public void openUrl(String description, String url) throws InterruptedException {
        url = paramsAndVariablesSteps.substituteParamsAndVariables(url);
        getWebDriver().get(httpSteps.getServiceUrlProperty() + url);
    }

    @Given("I open admin url")
    @When("I open admin url")
    public void openAdminUrl() throws InterruptedException {
        //url = paramsAndVariablesSteps.substituteParamsAndVariables(url);
        getWebDriver().get(httpSteps.getServiceAdminUrlProperty() + "");
    }
    @When("Open external url $url")
    public void openExternalUrl(String url) throws InterruptedException {
        url = paramsAndVariablesSteps.substituteParamsAndVariables(url);
        getWebDriver().get(url);
    }

    public void cLoseComingSoon() {
        //Try to find close button for notify me
        try {
            //WebElement element = serviceStepsBasic.waitUntilElementIsVisibleAndEnabled(new By.ByCssSelector(".close"));
             //WebElement element = serviceStepsBasic.waitUntilElementIsVisibleAndEnabled(new By.ByCssSelector(".cx-marketing-modal__header"));
            WebElement element = serviceStepsBasic.waitUntilElementIsVisibleAndEnabled(new By.ByCssSelector(".cx-marketing-modal__header > button:nth-child(1)"));
            element.click();
        } catch (AssertionErrorWithContextParamsException e) {
            //e.printStackTrace();
        }
    }


    private void setUpNewBrowser(String url) throws InterruptedException {
        String browser = environment.getProperty("browser");
        switch(browser) {
            case "Firefox":
                System.setProperty("webdriver.gecko.driver", environment.getProperty("firefox.driver"));
                setFireFoxWebDriver();
                break;
            case "Chrome":
                setChromWebDriver();
                break;
            case "IE":
                setIEWebDriver();
                break;
            case "Edge":
                setEdgeWebDriver();
                break;
            default:
                throw new RuntimeException(String.format("Wrong browser name - %s", browser));
        }
        getWebDriver().get(url);
        Thread.sleep(environment.getProperty("sleep.timeout.big", Integer.class) * 1000);
        getWebDriver().manage().window().setSize(
                new Dimension(environment.getProperty("browser.window.width", Integer.class),
                        environment.getProperty("browser.window.height", Integer.class)));
    }

    @Then("Browser ready")
    @Given("Browser ready")
    public void setUpWebDriver() throws InterruptedException {
        //String browser = paramsAndVariablesSteps.getTestParamsStorage().get("browser");
        // Do not create new browser use old one. Just reset cookies
        if (webDriver.isPresent()) {
            try {
                resetBrowser();
                getWebDriver().get(httpSteps.getServiceUrlProperty().toString());
                Thread.sleep(environment.getProperty("sleep.timeout.small", Long.class) * 1000) ;
                //cLoseComingSoon();
                return;
            } catch (Exception ex) {
                log.error("# Looks like browser is dead. Will create new one");
                log.error(ex.getMessage());
                ex.printStackTrace();
            }
        }
        setUpNewBrowser(httpSteps.getServiceUrlProperty().toString());
        //cLoseComingSoon();
    }

    @Then("Browser ready for admin")
    @Given("Browser ready for admin")
    public void setUpWebDriverForAdmin() throws InterruptedException {
        //String browser = paramsAndVariablesSteps.getTestParamsStorage().get("browser");
        // Do not create new browser use old one. Just reset cookies
        if (webDriver.isPresent()) {
            try {
                resetBrowser();
                getWebDriver().get(httpSteps.getServiceAdminUrlProperty().toString());
                Thread.sleep(environment.getProperty("sleep.timeout.small", Long.class) * 1000) ;
                //cLoseComingSoon();
                return;
            } catch (Exception ex) {
                log.error("# Looks like browser is dead. Will create new one");
                log.error(ex.getMessage());
                ex.printStackTrace();
            }
        }
        setUpNewBrowser(httpSteps.getServiceAdminUrlProperty().toString());
        //cLoseComingSoon();
    }


    @Then("Browser ready with $url")
    @Given("Browser ready with $url")
    public void setUpWebDriver(String url) throws InterruptedException {
        //String browser = paramsAndVariablesSteps.getTestParamsStorage().get("browser");
        // Do not create new browser use old one. Just reset cookies
        url = paramsAndVariablesSteps.substituteParamsAndVariables(url);
        if (webDriver.isPresent()) {
            try {
                resetBrowser();
                getWebDriver().get(url);
                Thread.sleep(environment.getProperty("sleep.timeout.small", Long.class) * 1000) ;
                //cLoseComingSoon();
                return;
            } catch (Exception ex) {
                log.error("# Looks like browser is dead. Will create new one");
                log.error(ex.getMessage());
                ex.printStackTrace();
            }
        }
        setUpNewBrowser(url);
    }



    public WebDriver getWebDriver() {
        return webDriver.orElseThrow(() -> new RuntimeException("There is no WebDriver"));
    }

    public void setWebDriver(Optional<WebDriver> driver) {
        this.webDriver = driver;
    }

    @Then("Close browser session")
    public void closeBrowserSession() {
        getWebDriver().quit();
        this.webDriver = Optional.empty();
    }

    @Then("Stop")
    public void stop() {
        System.exit(0);
    }


    @AfterStory
    // Close browser if close.browser.after.story is true
    public void AfterStory() {
        if (webDriver.isPresent() && environment.getProperty("close.browser.after.story", Boolean.class)) {
            webDriver.get().quit();
            webDriver = Optional.empty();
        }
    }


}
