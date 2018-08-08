Story: Check functionality of Community Tickers page

Scenario:
Community Tickers
Meta:
@name Community Tickers
Given Browser ready
When I open EXPLORE AS GUEST menu
And I wait small timeout
Then I see header with xpath selector //span[text()='HUMAN INTELLIGENCE'] contains: HUMAN INTELLIGENCE
!-- Open Community
When I execute javascript $("a[href='/app/guest#!/community']")[0].click()
!-- When I click on Community tab with xpath selector //a[@href='/app/guest#!/community']
And I wait small timeout
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Community
!-- Tickers
When I execute javascript $("div[ng-click=\"GoTo('../../app/social#!/tickers')\"]")[0].click()
And I wait small timeout
Then I see header with css selector .social-title > h1:nth-child(1) contains: List of tickers
!-- Find googl ticker
When I type GOOGL into search field with css selector #community__tickers__search-input
And I wait small timeout
And I click on GOOGL ticker with css selector strong.ng-binding
And I wait until service ready
Then I see header with css selector .social-title > h1:nth-child(1) contains: Alphabet Inc. Class A
When I click on Log in with containsText selector Log in
And I wait small timeout
Then I see log in pop-up window and close it
Then I wait small timeout
When I click on Sign up with containsText selector Sign up
And I wait small timeout
Then I see sign up pop-up window and close it
Then I wait small timeout
!-- Details
When I click on Details with css selector #community__tickers__menu_details-link
And I wait small timeout
Then I see header with css selector .social-title > h1:nth-child(1) contains: GOOGL details
!-- fundamentals
When I click on fundamentals with css selector #community__tickers__menu__fundamentals-link
And I wait small timeout
Then I see header with css selector h1.ng-scope contains: GOOGL fundamentals
!-- A.I. Pattern Recognitions
When I click on A.I. Pattern Recognitions with css selector #community__tickers__menu__trade-patterns-link
And I wait small timeout
Then I see header with css selector .social-title > h1:nth-child(1) contains: A.I. Pattern Recognitions

!--/*
!-- A.I. Trend Predictions
When I click on A.I. Trend Predictions with css selector #community__tickers__menu__trade-predictions-link
And I wait small timeout
Then I see header with css selector .social-title > h1:nth-child(1) contains: A.I. Trend Predictions for GOOGL
!-- Community Trend Predictions
When I click on Community Trend Predictions with xpath selector //a[@href='#!/tickers/GOOGL/predictions']
And I wait small timeout
Then I see header with css selector .social-title > h1:nth-child(1) contains: Community Trend Predictions for GOOGL
!--*/

!-- in MALL
When I click on in MALL with css selector #community__tickers__menu__in-mall-link
And I wait small timeout
Then I see header with css selector .social-title > h1:nth-child(1) contains: GOOGL in MALL

!-- Investors Clubs
When I click on Investors Clubs with css selector #community__tickers__menu__in-investment-clubs-link
And I wait small timeout
Then I see header with css selector .tickers__page-header contains: GOOGL in Investors Clubs
When I click on Clubs link with xpath selector //a[@href='#!/clubs/list']
And I wait small timeout
Then I see header with xpath selector //span[text()='Investors Clubs'] contains: Investors Clubs

!-- in blogs

When I click on EXPLORE AS GUEST menu with css selector #prelogin_page_menu__guest
And I wait small timeout
Then I see header with xpath selector //span[text()='HUMAN INTELLIGENCE'] contains: HUMAN INTELLIGENCE
!-- Open Community
When I execute javascript $("a[href='/app/guest#!/community']")[0].click()
!-- When I click on Community tab with xpath selector //a[@href='/app/guest#!/community']
And I wait small timeout
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Community
!-- Tickers
When I execute javascript $("div[ng-click=\"GoTo('../../app/social#!/tickers')\"]")[0].click()
And I wait small timeout
Then I see header with css selector .social-title > h1:nth-child(1) contains: List of tickers
!-- Find googl ticker
When I type GOOGL into search field with css selector #community__tickers__search-input
And I wait small timeout
And I click on GOOGL ticker with css selector strong.ng-binding
And I wait until service ready
Then I see header with css selector h1.ng-binding:nth-child(1) contains: Alphabet Inc. Class A
When I click on in blogs with css selector #community__tickers__menu__in-blogs-link
And I wait small timeout
Then I see header with css selector .tickers__page-header contains: GOOGL in blogs

!--/* was removed from service
!-- in iExpert
When I click on Overview with css selector #community__tickers__menu__overview-link
And I wait small timeout
And I click on in iExpert with css selector #community__tickers__menu__in-iexpert-link
And I wait small timeout
Then I see header with css selector .iexpert-search-result-block > h1:nth-child(2) contains: Search Results


!-- in Twitter
When I open EXPLORE AS GUEST menu
And I wait small timeout
Then I see header with xpath selector //span[text()='HUMAN INTELLIGENCE'] contains: HUMAN INTELLIGENCE
!-- Open Community
When I execute javascript $("a[href='/app/guest#!/community']")[0].click()
!-- When I click on Community tab with xpath selector //a[@href='/app/guest#!/community']
And I wait small timeout
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Community
!-- Tickers
When I execute javascript $("div[ng-click=\"GoTo('../../app/social#!/tickers')\"]")[0].click()
And I wait small timeout
Then I see header with css selector .social-title > h1:nth-child(1) contains: List of tickers
!-- Find googl ticker
When I type GOOGL into search field with css selector #community__tickers__search-input
And I wait small timeout
And I click on GOOGL ticker with css selector strong.ng-binding
And I wait until service ready
Then I see header with css selector .social-title > h1:nth-child(1) contains: Alphabet Inc. Class A
When I click on in Twitter with css selector #community__tickers__menu__in-twitter-link
And I wait small timeout
Then I see header with css selector .tickers__page-header contains: GOOGL in Twitter
!--*/