package com.tickeron.test.web.functional.steps.service;

import com.tickeron.test.web.functional.steps.ParamsAndVariablesSteps;
import com.tickeron.test.web.functional.steps.SeleniumSteps;
import org.jbehave.core.annotations.When;
import org.openqa.selenium.By;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

/**
 * Created by slaviann on 17.12.15.
 */
//@PropertySource("classpath:app.properties")

public class MallSteps extends ServiceStepsBasic {

    @Autowired
    private SeleniumSteps seleniumSteps;

    @Autowired
    private ServiceStepsBasic serviceStepsBasic;

    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;

    @Autowired
    private HomePageSteps homePageSteps;

    @Autowired
    private MenuStepsPageObject menuStepsPageObject;

    @When("Mall. I upload file $fileName using input element with css selector $selector")
    /**
     * Make <input type="file" visible. Then upload file to it. Scroll on top of page
     */
    public void uploadFileInMall(String fileName, String selector) throws InterruptedException {
        // body > input:nth-child(22)
        //$x('//input[@type="file"]')[0]
        getWebDriver().findElement(new By.ByCssSelector(selector));
        String executable = String.format("var el = $(\"%s\")[0]; " +
                "el.style.setProperty(\"visibility\", \"visible\");" +
                "el.style.setProperty(\"overflow\", \"visible\");" +
                "el.style.setProperty(\"width\", \"200px\");" +
                "el.style.setProperty(\"height\", \"200px\")", selector);
        //System.out.println(executable);
        seleniumSteps.executeJavaScript(executable);
        uploadFile(fileName, "css", selector);
        seleniumSteps.executeJavaScript("scroll(1250, 0)");

    }

    @When("Mall. Open Home page listing")
    public void openMallHomeListing() {
        menuStepsPageObject.openHome();
        waitUntilServiceReady();
        homePageSteps.openListingsPage();
        waitUntilServiceReady();
    }

    @When("Mall. Find item $itemTitle in Mall list")
    public void findItemInMall(String item) {
        openMallHomeListing();
        item = paramsAndVariablesSteps.substituteParamsAndVariables(item);
        seleniumSteps.executeJavaScript(String.format("$(\".form-control\").val(\"%s\")", item));
        seleniumSteps.executeJavaScript("$(\".form-control\").change()");
        waitUntilServiceReady();

    }

    @When("Mall. Find item $itemTitle in Mall purchases")
    public void findItemInPurchases(String item) {
        menuStepsPageObject.openHome();
        homePageSteps.openPurchasesBlock();
        waitUntilServiceReady();
        item = paramsAndVariablesSteps.substituteParamsAndVariables(item);
        seleniumSteps.executeJavaScript(String.format("$(\".form-control\").val(\"%s\")", item));
        seleniumSteps.executeJavaScript("$(\".form-control\").change()");
        waitSmallTimeout();

    }

    private void clickButtonOnMallPage(String blockCssSelector, String buttonCssSelector) throws InterruptedException {
        //menuStepsPageObject.openMall();
        waitUntilServiceReady();
        startActionRecord();
        actionsMoveToElementBySelector("", "css", blockCssSelector);
        waitSmallTimeout();
        performAction();
        startActionRecord();
        actionsMoveToElementBySelector("", "css", buttonCssSelector);
        actionsClickOnElementBySelector("", "css", buttonCssSelector);
        performAction();

    }


    @When("Mall. Open buy model portfolio")
    public void openBuyModelPortfolio() throws InterruptedException {
        seleniumSteps.executeJavaScript("$(\"a[href='#!/model-portfolios']\").click()");
    }

    @When("Mall. Open sell model portfolio")
    public void openSellModelPortfolio() throws InterruptedException {
        waitSmallTimeout();
        seleniumSteps.executeJavaScript("$(\"div.col-xs-6:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(5) > a:nth-child(2)\").click()");
        waitUntilServiceReady();
    }

    @When("Mall. Open buy AI pattern recoginition a-la carte")
    public void openBuyAiPatternsRecoginition() throws InterruptedException {
        waitSmallTimeout();
        seleniumSteps.executeJavaScript("$(\"div.col-xs-6:nth-child(2) > div:nth-child(2) > div:nth-child(1) > div:nth-child(5) > a:nth-child(1)\").click()");
        waitUntilServiceReady();
    }

    @When("Mall. Open buy subscription portfolio")
    public void openBuyPortfolioSubscription() throws InterruptedException {
        waitSmallTimeout();
        seleniumSteps.executeJavaScript("$(\"div.col-xs-6:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(5) > a:nth-child(1)\").click()");
        waitUntilServiceReady();
    }

    @When("Mall. Open sell subscription portfolio")
    public void openSellPortfolioSubscription() throws InterruptedException {
        //clickOnElementBySelector("", "css", "div.col-xs-6:nth-child(1) > div:nth-child(3) > div:nth-child(1) > span:nth-child(1)");
        seleniumSteps.executeJavaScript("$(\"div.col-xs-6:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(5) > a:nth-child(2)\").click() ");
        waitUntilServiceReady();
    }

    @When("Mall. Open AI pattern recoginition. Start for free")
    public void openBuyAiPatternsRecoginition2() throws InterruptedException {
        waitSmallTimeout();
        seleniumSteps.executeJavaScript("$(\"a[href='/app/patterns#!/patterns/overview']\")[0].click();");
        waitUntilServiceReady();
   }

    @When("Mall. Open buy newsletter")
    public void openBuyNewsletter() throws InterruptedException {
        seleniumSteps.executeJavaScript("$(\"div.col-xs-6:nth-child(1) > div:nth-child(4) > div:nth-child(1) > div:nth-child(5) > a:nth-child(1)\").click();");
        waitUntilServiceReady();
    }

    @When("Mall. Open sell newsletter")
    public void openSellNewsletter() throws InterruptedException {
        seleniumSteps.executeJavaScript("$(\"div.col-xs-6:nth-child(1) > div:nth-child(4) > div:nth-child(1) > div:nth-child(5) > a:nth-child(2)\").click()");
        waitUntilServiceReady();
    }

    @When("Mall. Open AI tred prediction. Start for free")
    public void openAITrendPredictionsStartForFree() throws InterruptedException {
        waitSmallTimeout();
        seleniumSteps.executeJavaScript("$(\"div.explore-as-guest__intro-page-container__plain-outer-border:nth-child(5) > div:nth-child(1) > div:nth-child(5) > a:nth-child(2)\").click()");
        waitUntilServiceReady();
    }

    @When("Mall. Open buy opinion")
    public void openBuyOpinion() throws InterruptedException {
        waitSmallTimeout();
        seleniumSteps.executeJavaScript("$(\"div.explore-as-guest__intro-page-container__plain-outer-border:nth-child(5) > div:nth-child(1) > div:nth-child(5) > a:nth-child(1)\").click()");
        waitUntilServiceReady();
    }

    @When("Mall. Open sell opinion")
    public void openSellOpinion() throws InterruptedException {
       // clickOnElementBySelector("", "css", "div.explore-as-guest__intro-page-container__plain-outer-border:nth-child(5) > div:nth-child(1) > span:nth-child(1)");
        waitSmallTimeout();
        seleniumSteps.executeJavaScript("$(\"div.explore-as-guest__intro-page-container__plain-outer-border:nth-child(5) > div:nth-child(1) > div:nth-child(5) > a:nth-child(2)\").click()");
        waitUntilServiceReady();
    }

    @When("Mall. Parse file upload url from variable $variable")
    public void parseUrlField(String variable) {
        String res = paramsAndVariablesSteps.getTestParamsStorage().get(variable);
        res = res.split("\\?")[1].split("=")[1];
        paramsAndVariablesSteps.getTestParamsStorage().put(variable, res);
        System.out.println(res);
    }

    @When("Mall. Add ticker $ticker")
    public void addTicker(String tickerName) throws InterruptedException {
        tickerName = paramsAndVariablesSteps.substituteParamsAndVariables(tickerName);
        typeIntoElementBySelector(tickerName, "", "css", "#filterInput");
        // hardcode here. It's ok
        Thread.sleep(3 * 1000);
        clickOnElementBySelector("", "css", "#tickersList > div > table > tbody > tr:nth-child(1) > td:nth-child(1) > input");
        clickOnElementBySelector("", "css", "#filterInput");
    }


    @When("Mall. Buy opinion $opinionName")
    public void buyOpinion(String opinionName) throws InterruptedException {
        menuStepsPageObject.openMall();
        waitUntilServiceReady();
        openBuyOpinion();
        seleniumSteps.executeJavaScript("$(\".form-control\").val(\"%{opinonGeneratedName}\")");
        seleniumSteps.executeJavaScript("$(\".form-control\").change()");
        waitSmallTimeout();
        clickOnElementBySelector("opinion in list", "containsText", opinionName);
        waitUntilServiceReady();
        checkElementTextBySelectorIs("header", "css", ".pull-left", opinionName);
    }


    @When("MALL. I approve mall product with $titleProduct which has a product type (Portfolio model/Portfolio subscription/Newsletter/Opinion): $itemType")
    public void approveMallItem(String titleProduct, String itemType) {
        itemType = paramsAndVariablesSteps.substituteParamsAndVariables(itemType);
        titleProduct = paramsAndVariablesSteps.substituteParamsAndVariables(titleProduct);
//        div.row:nth-child(7) > div:nth-child(2) > p:nth-child(1)
        waitSmallTimeout();
        typeIntoElementBySelector(titleProduct,"title","css","#title");
        waitSmallTimeout();
        serviceStepsBasic.selectFromList(itemType,"ByVisibleText","css","#itemType");
        waitSmallTimeout();
        clickOnElementBySelector("Search button", "css", "#admin__maill__search-button");
        waitSmallTimeout();
      //  seleniumSteps.executeJavaScript(String.format("$(\"p[class*='form-control-static mall-overflow-ellipsis ng-binding']\")[0].val(\"%s\")", titleProduct));
        waitSmallTimeout();
        //imagrCompareSteps.makeScreenshotInternal(name);
        clickOnElementBySelector("View Details Button", "css", "a[ng-if='item.IsDeleted === false']");
        waitSmallTimeout();
        switch (itemType) {
            case "Newsletter":
                clickOnElementBySelector("Approve button", "css", "button[ng-click='approveIssue(i)']");
                checkElementTextBySelectorContains("product title", "css", ".toast-message", "Item Published!");
                waitSmallTimeout();
                clickOnElementBySelector("Approve button", "css", "button[ng-click='approve(mdl.item)']");

                break;
            case "Portfolio model":
                clickOnElementBySelector("Approve button", "css", "button[ng-click='approve(mdl.item)']");

                break;
            case "Portfolio subscription":
                clickOnElementBySelector("Approve button", "css", "button[ng-click='approve(mdl.item)']");

                break;
            case "Opinion":
                clickOnElementBySelector("Approve button", "css", "button[ng-click='approve(mdl.item)']");

                break;
            default:
                throw new RuntimeException(String.format("Wrong item Type - %s", itemType));
        }
        checkElementTextBySelectorContains("product title", "css", ".toast-message", "Item Published!");
    }

    @When("MALL. I approve issue $issue for newsletter with $titleNewsletter which has a product type (Newsletter): $itemType")
    public void approveIssueForNewsleterMallItem(String issue, String titleNewsletter, String itemType) {
        itemType = this.paramsAndVariablesSteps.substituteParamsAndVariables(itemType);
        issue = this.paramsAndVariablesSteps.substituteParamsAndVariables(issue);
        titleNewsletter = this.paramsAndVariablesSteps.substituteParamsAndVariables(titleNewsletter);
        typeIntoElementBySelector(titleNewsletter,"title","css","#title");
        waitSmallTimeout();
        serviceStepsBasic.selectFromList(itemType,"ByVisibleText","css","#itemType");
        waitSmallTimeout();
        clickOnElementBySelector("Search button", "css", "#admin__maill__search-button");
        waitSmallTimeout();
//        checkElementTextBySelectorContains("product title", "css", "p[class*='form-control-static mall-overflow-ellipsis ng-binding'][0]", titleNewsletter);
        waitSmallTimeout();
        clickOnElementBySelector("View Details Button", "css", "a.btn");
        waitSmallTimeout();
        checkElementTextBySelectorContains("issue title", "css", "tr.ng-scope:nth-child(1) > td:nth-child(2)", issue);
        clickOnElementBySelector("Approve button", "css", "button[ng-click='approveIssue(i)']");
        checkElementTextBySelectorContains("product title", "css", ".toast-message", "Item Published!");
        waitSmallTimeout();
//        clickOnElementBySelector("Approve button", "css", "button[ng-click='approve(mdl.item)']");

    }
}
