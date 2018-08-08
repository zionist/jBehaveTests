package com.tickeron.test.web.functional.steps.service;

import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.When;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import static org.junit.Assert.*;

/**
 * Created by slaviann on 15.12.15.
 */
public class AdminSteps extends ServiceStepsBasic {

    @Given("I set all permissions for account admin if they are not set")
    public void setAllPermissions() {
        // click on Admin Accounts menu tab
        waitUntilElementIsVisibleAndEnabled(By.linkText("Admin accounts")).click();
        waitBigTimeout();
        // click on self account
        waitUntilElementIsVisibleAndEnabled(By.cssSelector("a[href*='#/account/705']")).click();
        waitSmallTimeout();
        // set all checkboxes if they are not set
        By contentAdministrationCheckbox = By.cssSelector("input[ng-model*='account.Roles.IsContentAdmin']");
        if (!waitUntilElementIsVisibleAndEnabled(contentAdministrationCheckbox).isSelected()) waitUntilElementIsVisibleAndEnabled(contentAdministrationCheckbox).click();

        By systemAdministration = By.cssSelector("input[ng-model*='account.Roles.IsSystemAdmin']");
        if (!waitUntilElementIsVisibleAndEnabled(systemAdministration).isSelected()) waitUntilElementIsVisibleAndEnabled(systemAdministration).click();

        By userAdministration = By.cssSelector("input[ng-model*='account.Roles.IsUserAdmin']");
        if (!waitUntilElementIsVisibleAndEnabled(userAdministration).isSelected()) waitUntilElementIsVisibleAndEnabled(userAdministration).click();

        By dataAdministration = By.cssSelector("input[ng-model*='account.Roles.IsDataAdmin']");
        if (!waitUntilElementIsVisibleAndEnabled(dataAdministration).isSelected()) waitUntilElementIsVisibleAndEnabled(dataAdministration).click();

        By mallAdministration = By.cssSelector("input[ng-model*='account.Roles.IsMallAdmin']");
        if (!waitUntilElementIsVisibleAndEnabled(mallAdministration).isSelected()) waitUntilElementIsVisibleAndEnabled(mallAdministration).click();

        By financesAdministration = By.cssSelector("input[ng-model*='account.Roles.IsFinancialAdmin']");
        if (!waitUntilElementIsVisibleAndEnabled(financesAdministration).isSelected()) waitUntilElementIsVisibleAndEnabled(financesAdministration).click();

        By accountAdministration = By.cssSelector("input[ng-model*='account.Roles.IsAdminAccountsAdmin']");
        if (!waitUntilElementIsVisibleAndEnabled(accountAdministration).isSelected()) waitUntilElementIsVisibleAndEnabled(accountAdministration).click();

        By patternAdministration = By.cssSelector("input[ng-model*='account.Roles.IsPatternAdmin']");
        if (!waitUntilElementIsVisibleAndEnabled(patternAdministration).isSelected()) waitUntilElementIsVisibleAndEnabled(patternAdministration).click();

        By managerAdministration = By.cssSelector("input[ng-model*='account.Roles.IsManager']");
        if (!waitUntilElementIsVisibleAndEnabled(managerAdministration).isSelected()) waitUntilElementIsVisibleAndEnabled(managerAdministration).click();
        // click Update button
        waitUntilElementIsVisibleAndEnabled(By.cssSelector("button.btn:nth-child(2)")).click();
        // Check update has been done
       // assertEquals("Admin account updated", waitUntilElementIsVisibleAndEnabled(By.cssSelector(".toast-message")).getText());
        waitBigTimeout();
        Alert alert = getWebDriver().switchTo ().alert ();
        //alert is present
        //System.out.println(alert.getText());
        alert.accept();


    }
    @When("I accept alert when update Admin account")
    public void acceptAlertWhenUpdateAdmin() {
       
        Alert alert = getWebDriver().switchTo ().alert ();
        alert.accept();
        waitUntilServiceReady();

    }
    @Given("I unsubscribe and disconnect from client/advisor")
    public void setDisconnectPermissions() {

        try {
            By advisorUnsubscribeBy = By.xpath("//button[@class='btn ng-binding btn-default'][contains(., 'Unsubscribe')]");
            if(getWebDriver().findElement(advisorUnsubscribeBy).isDisplayed())
            waitUntilElementIsVisibleAndEnabled(advisorUnsubscribeBy).click();
            waitUntilElementIsVisibleAndEnabled(By.xpath("//button[@class='btn ng-binding ng-scope btn-default'][contains(., 'Yes')]")).click();
            }
        catch (Exception e)
            {
            waitBigTimeout();
            By advisorDisconnectBy = By.xpath("//button[@class='btn ng-binding btn-secondary'][contains(., 'Disconnect')]");
            if(getWebDriver().findElement(advisorDisconnectBy).isDisplayed())
            waitUntilElementIsVisibleAndEnabled(advisorDisconnectBy).click();
            }
        //waitBigTimeout();
        // Check update has been done
       // assertEquals("Not Connected", waitUntilElementIsVisibleAndEnabled(By.cssSelector(".cx-adv-bid-state__text")).getText());
        waitBigTimeout();
    }
}
