Story: Production - Check Tickers in Community

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario:
Community - open ticker
Meta:
@name Community - open ticker
Given I logged in with %{username} and %{password}
!-- Select ticker AAPL
When I open COMMUNITY - Tickers menu
And I wait until service ready
Then I see page header with css selector .social-title > h1:nth-child(1) contains: List of tickers
When I type AAPL into searching form  with css selector #community__tickers__search-input
And I wait big timeout
And I click on AAPL with css selector .tickers-list > table:nth-child(6) > tbody:nth-child(2) > tr:nth-child(1)
And I wait until service ready


Scenario:
Community -> Tickers - check menu
!-- Overview
Then I see header of page with css selector .social-title > h1:nth-child(1) contains: Apple Inc.
Then I see button Week with css selector button.btn-secondary:nth-child(1) contains: WEEK
Then I see button Month with css selector .pull-xs-right > button:nth-child(2) contains: MONTH
Then I see button Year with css selector button.btn:nth-child(3) contains: YEAR
Then I see element attribute chart with css selector .ticker-overview__chart-layout has attribute cx-ticker-chart with value ticker
Then I see AAPL - Bullish or Bearish? with css selector div.member-overview__block:nth-child(6) > div:nth-child(1) > h3:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) contains: Bullish
Then I see New ideas in MALL  with css selector div.member-overview__block:nth-child(7) > div:nth-child(1) > h3:nth-child(1) contains: New ideas in MALL
Then I see Clubs with css selector div.row:nth-child(8) > div:nth-child(1) > div:nth-child(1) > h3:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) contains: Clubs
And I wait small timeout

!-- Fundamentals
When I click on 'Fundamentals' button with css selector #community__tickers__menu__fundamentals-link
Then I see page header with css selector h1.ng-scope contains: AAPL fundamentals
And I see filter button with css selector .btn-secondary-sm is: ADD TO PORTFOLIO

!-- Details
When I click on 'Details' button with css selector #community__tickers__menu_details-link
Then I see page header with css selector .social-title > h1:nth-child(1) contains: AAPL details
Then I see element attribute chart with css selector .ticker-overview__chart-layout has attribute cx-ticker-chart with value ticker
And I see 1st parameter with css selector div.row:nth-child(7) > div:nth-child(1) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) contains: Group
And I see last parameter with css selector div.row:nth-child(7) > div:nth-child(2) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(6) > td:nth-child(1) contains: Revenue/Share
And I see portlet header with css selector h3.ng-scope:nth-child(9) contains: Company Profile

!-- A.I. Support & Resistance
When I click on Support & Resistance button with css selector #community__tickers__menu__trade-support-link
And I wait until service ready
Then I see page header with css selector .social-title > h1:nth-child(1) contains: A.I. Support & Resistance
Then I see element attribute chart with css selector .ticker-support-and-resistance-chart has attribute cx-ticker-support-and-resistance-chart with value ticker

!-- Trade Ideas. A.I. Pattern Recognitions
When I click on 'Predictions' button with css selector #community__tickers__menu__trade-patterns-link
Then I see page header with css selector .social-title > h1:nth-child(1) contains: A.I. Pattern Recognitions
Then I see Current Recognised Patterns with css selector .tickers-patterns-page__recognised-header contains: Current Recognised Patterns

!-- Trade Ideas. A.I. Trend Predictions
!-- When I click on 'Predictions' button with css selector #community__tickers__menu__trade-predictions-link
!-- Then I see page header with css selector .social-title > h1:nth-child(1) contains: A.I. Trend Predictions for
!-- Then I see table header with css selector .tickers-predictions-page > h2:nth-child(4) contains: Overall Statistics
!-- Then I see element statistics table with css selector .member-preds-full-width-container > div:nth-child(1) has class row
!--/*
!-- Community Trend Predictions
When I click on 'Patterns' button with css selector #community__tickers__menu__trade-community-predictions-link
Then I see page header with css selector .social-title > h1:nth-child(1) contains: Community Trend Predictions for
Then I see 1st table header with css selector h2.ng-binding contains: AAPL (end-of-day price)
Then I see element attribute chart with css selector .tickers-chart has attribute cx-ticker-chart with value ticker


!-- Return to patterns page
When I open COMMUNITY menu
When I click on Tickers  with link selector Tickers
And I wait until service ready
When I type AAPL into searching form  with css selector .form-control
And I wait big timeout
And I click on AAPL with css selector .tickers-list > table:nth-child(6) > tbody:nth-child(2) > tr:nth-child(1)
And I wait small timeout
When I click on 'Patterns' button with css selector .fa-line-chart
Then I see last table header with css selector div.col-xs-12:nth-child(4) > h3:nth-child(1) contains: Ticker Trade Statistics (since 2005)
!--*/

!-- In Mall
When I click on 'In Mall' button with css selector #community__tickers__menu__in-mall-link
Then I see page header with css selector .social-title > h1:nth-child(1) contains: AAPL in MALL
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
And I click on AAPL with css selector .tickers-list > table:nth-child(6) > tbody:nth-child(2) > tr:nth-child(1)
And I wait until service ready
!--/*
!-- Check 'In iExpert'
And I execute javascript $("#community__tickers__menu__in-iexpert-link")[0].click()
And I wait until service ready
Then I see page header with css selector .iexpert-search-result-block > h1:nth-child(2) contains: Search Results
Then I see ticker AAPL with css selector .btn-ticker-remove is AAPL

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
!--*/
!-- Check 'In Blogs'
And I execute javascript $("#community__tickers__menu__in-blogs-link")[0].click()
And I will refresh the page
And I wait until service ready
Then I see page header with css selector .tickers__page-header contains: AAPL in blogs

