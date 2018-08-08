Story: Check Patterns module functionality on community ticker page
!--/*
Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.atexpertat.username
Given Set test param password value from property param.atexpertat.password


Scenario:
Check ticker patterns as not subscribed user
GivenStories:
    stories/community/tickers/tickers_check_menu.story#{name:Community - open ticker}
!-- Open A.I. Pattern Recognitions
When I click on patterns menu item with css selector #community__tickers__menu__trade-patterns-link
Then I see page header with css selector .social-title > h1:nth-child(1) contains: A.I. Pattern Recognitions
Then I see Subscribe button with containsText selector Subscribe contains: Subscribe
!-- Add to watch list
When I click on add to watch list icon with css selector table.bordered-table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(7) > a:nth-child(2) > img:nth-child(1)
And I wait small timeout
And I click on No with css selector button.ng-binding:nth-child(2)
And I wait small timeout
!-- Configure alerts
When I click on Configure alerts with css selector a[href='/app/patterns#!/patterns/subscriptions_alert_setup']
And I wait big timeout
Then I see header with xpath selector //div[h1/text()='A. I. Pattern Recognition'] contains: A. I. Pattern Recognition
!-- return to tickers
When I open COMMUNITY - Tickers menu
Then I see page header with css selector .social-title > h1:nth-child(1) contains: List of tickers
When I type AAPL into searching form  with css selector #community__tickers__search-input
And I wait big timeout
And I click on AAPL with css selector strong.ng-binding
And I wait until service ready
Then I see header of page with css selector .social-title > h1:nth-child(1) contains: Apple Inc.
!-- Subscribe button
When I click on patterns menu item with css selector #community__tickers__menu__trade-patterns-link
Then I see page header with css selector .social-title > h1:nth-child(1) contains: A.I. Pattern Recognitions
When I click on Subscribe button with containsText selector Subscribe
And I wait big timeout
Then I see header with xpath selector //div[h1/text()='A. I. Pattern Recognition'] contains: A. I. Pattern Recognition
!-- return to tickers
When I click on Community menu with css selector #page_menu__community
And I wait until service ready
When I click on Tickers  with css selector #community__menu__tickers-link
And I wait until service ready
Then I see page header with css selector .social-title > h1:nth-child(1) contains: List of tickers
When I type AAPL into searching form  with css selector #community__tickers__search-input
And I wait big timeout
And I click on AAPL with css selector strong.ng-binding
And I wait until service ready
Then I see header of page with css selector .social-title > h1:nth-child(1) contains: Apple Inc.
!-- Open pattern type
When I click on patterns menu item with css selector #community__tickers__menu__trade-patterns-link
Then I see page header with css selector .social-title > h1:nth-child(1) contains: A.I. Pattern Recognitions
When I click on Broadening Bottom with css selector a[href='/app/patterns#!/patterns/pattern/1']
And I wait until service ready
Then I see header with css selector .col-xs-9 contains: Broadening Bottom

!--*/
Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario:
Subscribe to patterns, open ticker page
GivenStories:
    stories/ai_patterns/patterns_subscription.story#{name:Patterns Subscribe},
    stories/community/tickers/tickers_check_menu.story#{name:Community - open ticker}
Given Do nothing


Scenario:
Check ticker patterns as subscribed user
When I click on patterns menu item with css selector #community__tickers__menu__trade-patterns-link
Then I see page header with css selector .social-title > h1:nth-child(1) contains: A.I. Pattern Recognitions
!-- configure alerts
When I click on Configure alerts with css selector a[href='/app/patterns#!/patterns/subscriptions_alert_setup']
And I wait big timeout
Then I see header with css selector h1.col-xs-12 contains: Pattern Alert Setup
!-- return to tickers
When I open COMMUNITY - Tickers menu
Then I see page header with css selector .social-title > h1:nth-child(1) contains: List of tickers
When I type AAPL into searching form  with css selector #community__tickers__search-input
And I wait big timeout
And I click on AAPL with css selector strong.ng-binding
And I wait until service ready
Then I see header of page with css selector .social-title > h1:nth-child(1) contains: Apple Inc.
!-- Open pattern menu
When I click on patterns menu item with css selector #community__tickers__menu__trade-patterns-link
Then I see page header with css selector .social-title > h1:nth-child(1) contains: A.I. Pattern Recognitions
!-- Open first pattern in table
When I click on first pattern in list with css selector table.bordered-table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(2) > a:nth-child(1)
And I wait small timeout
Then I see header with css selector h1.ng-binding contains: Apple Inc.
!-- return to tickers
When I open COMMUNITY - Tickers menu
Then I see page header with css selector .social-title > h1:nth-child(1) contains: List of tickers
When I type AAPL into searching form  with css selector #community__tickers__search-input
And I wait big timeout
And I click on AAPL with css selector strong.ng-binding
And I wait until service ready
Then I see header of page with css selector .social-title > h1:nth-child(1) contains: Apple Inc.
!-- Open pattern menu
When I click on patterns menu item with css selector #community__tickers__menu__trade-patterns-link
Then I see page header with css selector .social-title > h1:nth-child(1) contains: A.I. Pattern Recognitions
!-- Save 1st pattern status
When I save text from 1st status element with css selector table.bordered-table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(4) to variable patternStatus
!-- Bookmark
And I click on bookmark first recognition with css selector table.bordered-table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(7) > button:nth-child(2)
Then I see toaster with css selector .toast-message contains: Pattern successfully added to bookmarks.
!-- Check in bookmark
When I open HOME menu
And I wait until service ready
And I open AI patterns recognition block
And I wait until service ready
Then I see header with css selector h1.col-xs-6 contains: Inbox
When I click on bookmarked with xpath selector //a[@href='#!/patterns/bookmarked']
And I wait until service ready
Then I see header with css selector h1.col-xs-6 contains: Bookmarked
When Patterns. Open tab %{patternStatus}
!-- When I click on tab Emerging with css selector .cx-patterns-table__table__pattern-image
!-- When I click on tab Confirmed with css selector li.nav-item:nth-child(2) > a:nth-child(1)
When I click on first pattern in list with css selector .cx-patterns-table__table__pattern-name > span:nth-child(1)
And I wait until service ready
Then I see ticker AAPL with css selector .cx-patterns-ticker contains: AAPL
!-- return to tickers
When I open COMMUNITY - Tickers menu
Then I see page header with css selector .social-title > h1:nth-child(1) contains: List of tickers
When I type AAPL into searching form  with css selector #community__tickers__search-input
And I wait big timeout
And I click on AAPL with css selector strong.ng-binding
And I wait until service ready
Then I see header of page with css selector .social-title > h1:nth-child(1) contains: Apple Inc.
!-- Open pattern menu
When I click on patterns menu item with css selector #community__tickers__menu__trade-patterns-link
Then I see page header with css selector .social-title > h1:nth-child(1) contains: A.I. Pattern Recognitions
!-- Unbookmark
When I click on unbookmark first recognition with css selector table.bordered-table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(7) > button:nth-child(1)
Then I see toaster with css selector .toast-message contains: Pattern successfully removed from bookmarks.
!-- Add to watch list
When I wait big timeout
And I click on add to watch list icon with css selector table.bordered-table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(7) > a:nth-child(2) > img:nth-child(1)
And I wait small timeout
And I click on Yes with css selector button.ng-binding:nth-child(1)
And I wait until service ready
Then I see toaster with css selector .toast-message contains: You subscribed for
!-- Check in alerts list
When I open HOME menu
And I wait until service ready
And I open AI patterns recognition block
And I wait until service ready
Then I see header with css selector h1.col-xs-6 contains: Inbox
When I click on setting with css selector ul.ng-scope > li:nth-child(3) > a:nth-child(1)
And I click on alerts with xpath selector //a[@href='#!/patterns/subscriptions_alert_setup']
And I wait until service ready
Then I see header with css selector h1.col-xs-12 contains: Pattern Alert Setup
Then I see alert ticker with css selector div.col-xs-6:nth-child(1) > ul:nth-child(2) > li:nth-child(1) > strong:nth-child(1) contains: AAPL
When Patterns. I remove all set up alerts


Scenario:
Unsubscribe from patterns
GivenStories:
    stories/ai_patterns/patterns_subscription.story#{name:Patterns Unsubscribe}
Given Do nothing

