Story: Production Check Expert page on pre-login

Scenario:
Expert page
Given Browser ready
!-- Explore for free - Mall
And I open root url /
And I wait small timeout
When Main page. Click on Expert rectangle
And I wait small timeout
And I click on Explore for free with css selector a.prelogin-marketing__button-plus:nth-child(3)
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: MALL

!-- Subscribe to patterns
When I open root url /
And I wait small timeout
When Main page. Click on Expert rectangle
And I wait small timeout
When I will execute javascript $("span.page-article-button:nth-child(3)").click()
And I wait small timeout
Then I see page header with css selector .col-lg-5 > h1:nth-child(1) is: A. I. Pattern Recognition

!-- Academy
Given I open root url /
And I wait small timeout
When Main page. Click on Expert rectangle
And I wait small timeout
When I will execute javascript $("a.page-article:nth-child(3)").click()
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: Academy

!-- MALL
Given Browser ready
And I open root url /
And I wait small timeout
When Main page. Click on Expert rectangle
And I wait small timeout
When I will execute javascript $("a.page-article:nth-child(5) > span:nth-child(4)").click()
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: MALL

!-- Make predictions
Given Browser ready
And I open root url /
And I wait small timeout
When Main page. Click on Expert rectangle
And I wait small timeout
When I will execute javascript $("a.page-article:nth-child(7) > span:nth-child(4)").click()
And I wait small timeout
Then I see page header with css selector .col-md-4 > h1:nth-child(1) is: Community Trend Predictions

!-- Clubs
Given Browser ready
And I open root url /
And I wait small timeout
When Main page. Click on Expert rectangle
And I wait small timeout
When I will execute javascript $("span.-photo:nth-child(4)").click()
And I wait small timeout
Then I see page header with css selector .cx-misc-tooltip-activator > span:nth-child(1) > span:nth-child(1) contains: Investors Clubs

!-- Webcasts
Given Browser ready
And I open root url /
And I wait small timeout
When Main page. Click on Expert rectangle
And I wait small timeout
When I will execute javascript $("a.page-article:nth-child(10) > span:nth-child(4)").click()
And I wait small timeout
Then I see page header with css selector .pull-xs-left > h1:nth-child(1) is: Popular Webcasts

!-- Allocate your assets
Given Browser ready
And I open root url /
And I wait small timeout
When Main page. Click on Expert rectangle
And I wait small timeout
When I will execute javascript $("a.page-article:nth-child(12) > span:nth-child(4)").click()
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains:  Asset allocation ideas

!-- Sell
Given I open root url /
And I wait small timeout
When Main page. Click on Expert rectangle
And I wait small timeout
And I will execute javascript $("a.prelogin-marketing__button-plus:nth-child(1)").click()
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: MALL