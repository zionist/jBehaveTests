Story: Production - Check Tickers in Community

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario:
Community -> Tickers

Given I logged in with %{username} and %{password}
!-- Select ticker AAPL
When I click on Community menu with css selector #page_menu__community
And I wait until service ready
When I click on Tickers  with css selector #community__menu__tickers-link
And I wait until service ready
Then I see page header with css selector .social-title > h1:nth-child(1) contains: List of tickers
When I type AAPL into searching form  with css selector #community__tickers__search-input
And I wait big timeout
And I click on AAPL with css selector strong.ng-binding
And I wait until service ready

!-- Overview
Then I see header of page with css selector h1.ng-binding:nth-child(1) contains: Apple Inc.
Then I see AAPL - Bullish or Bearish? with css selector div.member-overview__block:nth-child(6) > div:nth-child(1) > h3:nth-child(1) contains: Bullish or Bearish?
Then I see New ideas in MALL  with css selector div.member-overview__block:nth-child(7) > div:nth-child(1) > h3:nth-child(1) contains: New ideas in MALL
Then I see Clubs with css selector div.row:nth-child(8) > div:nth-child(1) > div:nth-child(1) > h3:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) contains: Clubs
And I wait small timeout

!-- Fundamentals
When I click on 'Fundamentals' button with css selector #community__tickers__menu__fundamentals-link
Then I see page header with css selector h1.ng-scope contains: AAPL fundamentals
And I see filter button with css selector .btn-secondary-sm is: ADD TO PORTFOLIO

!-- Details
When I click on 'Details' button with css selector #community__tickers__menu_details-link
Then I see page header with css selector h1.ng-binding:nth-child(1) contains: AAPL details
And I see 1st parameter with css selector div.row:nth-child(7) > div:nth-child(1) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) contains: Group
And I see last parameter with css selector div.row:nth-child(7) > div:nth-child(2) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(6) > td:nth-child(1) contains: Revenue/Share
And I see portlet header with css selector h3.ng-scope:nth-child(9) contains: Company Profile

!-- Trade Ideas. A.I. Pattern Recognitions
When I click on 'Predictions' button with css selector #community__tickers__menu__trade-patterns-link
Then I see page header with css selector .social-title > h1:nth-child(1) contains: A.I. Pattern Recognitions
Then I see Current Recognised Patterns with css selector .tickers-patterns-page__recognised-header contains: Current Recognised Patterns

!-- Trade Ideas. A.I. Trend Predictions
!-- When I click on 'Predictions' button with css selector #community__tickers__menu__trade-predictions-link
!-- Then I see page header with css selector .social-title > h1:nth-child(1) contains: A.I. Trend Predictions for

!-- Trade Ideas. Patterns
When I click on 'Patterns' button with css selector .cx-content-menu__icon__predictions
Then I see page header with css selector .social-title > h1:nth-child(1) contains: Community Trend Predictions for
Then I see 1st table header with css selector h2.ng-binding contains: AAPL (end-of-day price)

!--/*
!-- Return to patterns page
When I open COMMUNITY menu
When I click on Tickers  with link selector Tickers
And I wait until service ready
When I type AAPL into searching form  with css selector .form-control
And I wait big timeout
And I click on AAPL with css selector .table-tickers__ticker
And I wait small timeout
When I click on 'Patterns' button with css selector .fa-line-chart
Then I see last table header with css selector div.col-xs-12:nth-child(4) > h3:nth-child(1) contains: Ticker Trade Statistics (since 2005)
!--*/

!-- In Mall
When I click on 'In Mall' button with css selector #community__tickers__menu__in-mall-link
Then I see page header with css selector h1.ng-binding:nth-child(1) contains: AAPL in MALL
Then I see filter with css selector .social-title__search > span:nth-child(1) contains: SHOW ME

!-- In Investors Clubs
When I click on 'In Clubs' button with css selector #community__tickers__menu__in-investment-clubs-link
Then I see page header with css selector .tickers__page-header contains: AAPL in Investors Clubs
When I click on chevron 'Clubs' with css selector .pull-xs-right > a:nth-child(1)
And I wait until service ready
Then I see page header with css selector .cx-misc-tooltip-activator > span:nth-child(1) > span:nth-child(1) contains: Clubs

!-- Return to tickers
When I click on Tickers  with css selector #community__menu__tickers-link
And I wait until service ready
Then I see page header with css selector .social-title > h1:nth-child(1) contains: List of tickers
When I type AAPL into searching form  with css selector #community__tickers__search-input
And I wait big timeout
And I click on AAPL with css selector strong.ng-binding
And I wait until service ready

!-- Check 'In iExpert'
And I execute javascript $("#community__tickers__menu__in-iexpert-link")[0].click()
And I wait until service ready
Then I see page header with css selector .iexpert-search-result-block > h1:nth-child(2) contains: Search Results

!-- Return to tickers
When I click on Community with css selector #page_menu__community
And I wait until service ready
When I click on Tickers  with css selector #community__menu__tickers-link
And I wait until service ready
Then I see page header with css selector .social-title > h1:nth-child(1) contains: List of tickers
When I type AAPL into searching form  with css selector #community__tickers__search-input
And I wait big timeout
And I click on AAPL with css selector strong.ng-binding
And I wait until service ready

!-- Check 'In Blogs'
And I execute javascript $("#community__tickers__menu__in-blogs-link")[0].click()
And I will refresh the page
And I wait until service ready
Then I see page header with css selector .tickers__page-header contains: AAPL in blogs

!-- In Twitter
When I execute javascript $("#community__tickers__menu__in-twitter-link")[0].click()
And I will refresh the page
And I wait until service ready
Then I see page header with css selector .tickers__page-header contains: AAPL in Twitter
When I click on chevron 'Tickers' with css selector .cx-breadcrumbs > a:nth-child(1)
And I wait until service ready
Then I see page header with css selector .social-title > h1:nth-child(1) contains: List of tickers

