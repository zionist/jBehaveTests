Story: Production Check Intermediate page on pre-login

Scenario:
Intermediate page
Given Browser ready
And I open root url /
And I wait small timeout
When Main page. Click on Intermediate rectangle
And I wait small timeout

!-- Try for free from top palte button
And I click on try for free with css selector a.prelogin-marketing__button-plus:nth-child(3)
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains:  Asset allocation ideas

!-- Click 1st TRY FOR FREE button (Mall)
Given I open root url /
And I wait small timeout
When Main page. Click on Intermediate rectangle
And I wait small timeout
When I execute javascript $("a.page-article:nth-child(2) > span:nth-child(3)").click()
And I wait small timeout
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Calculate your

!-- Find advisor
Given I open root url /
And I wait small timeout
When Main page. Click on Intermediate rectangle
And I wait small timeout
When I will execute javascript $("a.page-article:nth-child(3) > span:nth-child(4)").click()
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is Find an Advisor

!-- Share with friends
Given I open root url /
And I wait small timeout
When Main page. Click on Intermediate rectangle
And I wait small timeout
When I will execute javascript $("a.page-article:nth-child(5) > span:nth-child(4)").click()
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Share with friends

!-- Join clubs
Given I open root url /
And I wait small timeout
When Main page. Click on Intermediate rectangle
And I wait small timeout
When I will execute javascript $("a.page-article:nth-child(7) > span:nth-child(4)").click()
And I wait small timeout
Then I see page header with css selector .cx-misc-tooltip-activator > span:nth-child(1) > span:nth-child(1) contains: Investors Clubs

!-- Subscribe to patterns
Given I open root url /
And I wait small timeout
When Main page. Click on Intermediate rectangle
And I wait small timeout
When I will execute javascript $("span.-photo:nth-child(4)").click()
And I wait small timeout
Then I see page header with css selector .col-lg-5 > h1:nth-child(1) is: A. I. Pattern Recognition

!-- make predictions
Given I open root url /
And I wait small timeout
When Main page. Click on Intermediate rectangle
And I wait small timeout
When I will execute javascript $("a.page-article:nth-child(10) > span:nth-child(4)").click()
And I wait small timeout
Then I see page header with css selector .col-md-4 > h1:nth-child(1) is: Community Trend Predictions

!-- use webcasts
Given I open root url /
And I wait small timeout
When Main page. Click on Intermediate rectangle
And I wait small timeout
When I will execute javascript $("a.page-article:nth-child(12) > span:nth-child(4)").click()
And I wait small timeout
Then I see page header with css selector .pull-xs-left > h1:nth-child(1) is: Popular Webcasts

!-- Academy
Given I open root url /
And I wait small timeout
When Main page. Click on Intermediate rectangle
And I wait small timeout
When I will execute javascript $("a.page-article:nth-child(14) > span:nth-child(4)").click()
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: Academy

!-- Mall
Given I open root url /
And I wait small timeout
When Main page. Click on Intermediate rectangle
And I wait small timeout
When I will execute javascript $("a.page-article:nth-child(16) > span:nth-child(3)").click()
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: MALL

!-- Try it from bottom of page
Given I open root url /
And I wait small timeout
When Main page. Click on Intermediate rectangle
And I wait small timeout
When I will execute javascript $("a.prelogin-marketing__button-plus:nth-child(1)")[0].click()
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains:  Asset allocation ideas

