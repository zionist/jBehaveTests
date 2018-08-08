package com.tickeron.test;

import java.util.List;
import java.util.Map;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class LoginPage {
    private Map<String, String> data;
    private WebDriver driver;
    private int timeout = 15;

    @FindBy(css = "#message-block div:nth-of-type(2) div a.prelogin-marketing__button-plus")
    @CacheLookup
    private WebElement calculateForFree;

    @FindBy(css = "button.btn.btn-secondary")
    @CacheLookup
    private WebElement cancel;

    @FindBy(css = "a[href='/app/guest#!/']")
    @CacheLookup
    private WebElement exploreAsGuest;

    @FindBy(css = "a[href='/app/mallnew']")
    @CacheLookup
    private WebElement exploreForFree1;

    @FindBy(css = "a[href='/app/guest#!/find_clients']")
    @CacheLookup
    private WebElement exploreForFree2;

    @FindBy(css = "div:nth-of-type(2) header.ng-scope.headroom.headroom--pinned div:nth-of-type(3) div.container-fluid div.row div:nth-of-type(2) div.row.prelogin-marketing-panel-top-menu-options div:nth-of-type(1) a")
    @CacheLookup
    private WebElement getDivscore;

    @FindBy(css = "#message-block div:nth-of-type(1) div a.prelogin-marketing__button-plus")
    @CacheLookup
    private WebElement getYourDivscore;

    @FindBy(css = "button.btn.btn-primary")
    @CacheLookup
    private WebElement logOut;

    @FindBy(css = "button.btn.btn-default.prelogin-marketing__button_show-login-menu")
    @CacheLookup
    private WebElement login;

    @FindBy(css = "a[href='#/desktop/pricing']")
    @CacheLookup
    private WebElement membership;

    private final String pageLoadedText = "to determine if your investments are optimally diversified";

    private final String pageUrl = "/#/desktop/";

    @FindBy(css = "button.btn.btn-default.prelogin-marketing__button_show-signup-menu")
    @CacheLookup
    private WebElement signUp;

    @FindBy(css = "a[href='/app/guest#!/a_i_wizard_allocation']")
    @CacheLookup
    private WebElement tryForFree;

    @FindBy(css = "a[href='#/desktop/why']")
    @CacheLookup
    private WebElement whyTickeron;

    public LoginPage() {
    }

    public LoginPage(WebDriver driver) {
        this();
        this.driver = driver;
    }

    public LoginPage(WebDriver driver, Map<String, String> data) {
        this(driver);
        this.data = data;
    }

    public LoginPage(WebDriver driver, Map<String, String> data, int timeout) {
        this(driver, data);
        this.timeout = timeout;
    }

    /**
     * Click on Calculate For Free Link.
     *
     * @return the LoginPage class instance.
     */
    public LoginPage clickCalculateForFreeLink() {
        calculateForFree.click();
        return this;
    }

    /**
     * Click on Cancel Button.
     *
     * @return the LoginPage class instance.
     */
    public LoginPage clickCancelButton() {
        cancel.click();
        return this;
    }

    /**
     * Click on Explore As Guest Link.
     *
     * @return the LoginPage class instance.
     */
    public LoginPage clickExploreAsGuestLink() {
        exploreAsGuest.click();
        return this;
    }

    /**
     * Click on Explore For Free Link.
     *
     * @return the LoginPage class instance.
     */
    public LoginPage clickExploreForFree1Link() {
        exploreForFree1.click();
        return this;
    }

    /**
     * Click on Explore For Free Link.
     *
     * @return the LoginPage class instance.
     */
    public LoginPage clickExploreForFree2Link() {
        exploreForFree2.click();
        return this;
    }

    /**
     * Click on Get Divscore Link.
     *
     * @return the LoginPage class instance.
     */
    public LoginPage clickGetDivscoreLink() {
        getDivscore.click();
        return this;
    }

    /**
     * Click on Get Your Divscore Link.
     *
     * @return the LoginPage class instance.
     */
    public LoginPage clickGetYourDivscoreLink() {
        getYourDivscore.click();
        return this;
    }

    /**
     * Click on Log Out Button.
     *
     * @return the LoginPage class instance.
     */
    public LoginPage clickLogOutButton() {
        logOut.click();
        return this;
    }

    /**
     * Click on Login Button.
     *
     * @return the LoginPage class instance.
     */
    public LoginPage clickLoginButton() {
        login.click();
        return this;
    }

    /**
     * Click on Membership Link.
     *
     * @return the LoginPage class instance.
     */
    public LoginPage clickMembershipLink() {
        membership.click();
        return this;
    }

    /**
     * Click on Sign Up Button.
     *
     * @return the LoginPage class instance.
     */
    public LoginPage clickSignUpButton() {
        signUp.click();
        return this;
    }

    /**
     * Click on Try For Free Link.
     *
     * @return the LoginPage class instance.
     */
    public LoginPage clickTryForFreeLink() {
        tryForFree.click();
        return this;
    }

    /**
     * Click on Why Tickeron Link.
     *
     * @return the LoginPage class instance.
     */
    public LoginPage clickWhyTickeronLink() {
        whyTickeron.click();
        return this;
    }

    /**
     * Submit the form to target page.
     *
     * @return the LoginPage class instance.
     */
    public LoginPage submit() {
        clickLoginButton();
        return this;
    }

    /**
     * Verify that the page loaded completely.
     *
     * @return the LoginPage class instance.
     */
    public LoginPage verifyPageLoaded() {
        (new WebDriverWait(driver, timeout)).until(new ExpectedCondition<Boolean>() {
            public Boolean apply(WebDriver d) {
                return d.getPageSource().contains(pageLoadedText);
            }
        });
        return this;
    }

    /**
     * Verify that current page URL matches the expected URL.
     *
     * @return the LoginPage class instance.
     */
    public LoginPage verifyPageUrl() {
        (new WebDriverWait(driver, timeout)).until(new ExpectedCondition<Boolean>() {
            public Boolean apply(WebDriver d) {
                return d.getCurrentUrl().contains(pageUrl);
            }
        });
        return this;
    }
}
