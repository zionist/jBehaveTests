Story: Production Check Advisor page on pre-login

Scenario:
Advisor page
Given Browser ready
!-- Explore for free from top palte button
When I open root url /
And I wait small timeout
When Main page. Click on Advisor rectangle
!-- When I will execute javascript $(".prelogin-marketing-panel-top__role-menu__item_image-border-advisor > div:nth-child(1)").click()
And I wait small timeout
And I click on Explore for free with css selector a.prelogin-marketing__button-plus:nth-child(3)
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: Find new clients

!-- Webcasts
When I open root url /
And I wait small timeout
When Main page. Click on Advisor rectangle
And I wait small timeout
When I will execute javascript $("span.page-article-button:nth-child(3)").click()
And I wait small timeout
Then I see page header with css selector .pull-xs-left > h1:nth-child(1) is: Popular Webcasts

!-- Mall
Given I open root url /
And I wait small timeout
When Main page. Click on Advisor rectangle
And I wait small timeout
When I will execute javascript $("a.page-article:nth-child(3) > span:nth-child(4)").click()
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: MALL

!-- Teach in Academy
Given I open root url /
And I wait small timeout
When Main page. Click on Advisor rectangle
And I wait small timeout
When I will execute javascript $("a.page-article:nth-child(5) > span:nth-child(4)").click()
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: Academy

!-- AC
Given I open root url /
And I wait small timeout
When Main page. Click on Advisor rectangle
And I wait small timeout
When I will execute javascript $("a.page-article:nth-child(7) > span:nth-child(4)").click()
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: Find new clients

!-- Clubs
Given I open root url /
And I wait small timeout
When Main page. Click on Advisor rectangle
And I wait small timeout
When I will execute javascript $("span.-photo:nth-child(4)").click()
And I wait small timeout
Then I see page header with css selector .cx-misc-tooltip-activator > span:nth-child(1) > span:nth-child(1) contains: Investors Clubs

!-- Allocate Client's Assets
Given I open root url /
And I wait small timeout
When Main page. Click on Advisor rectangle
And I wait small timeout
When I will execute javascript $("a.page-article:nth-child(10) > span:nth-child(4)").click()
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains:  Asset allocation ideas

!-- Div score
Given I open root url /
And I wait small timeout
When Main page. Click on Advisor rectangle
And I wait small timeout
When I will execute javascript $("a.page-article:nth-child(12) > span:nth-child(4)").click()
And I wait small timeout
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Calculate your

!-- Find new clients from bottom of page
Given I open root url /
And I wait small timeout
When Main page. Click on Advisor rectangle
And I wait small timeout
And I will execute javascript $("a.prelogin-marketing__button-plus:nth-child(1)").click()
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: Find new clients


