Story: Production - Check Predictions

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Check predictions from community tickers
Meta:
@name Check predictions from community tickers
Given I logged in during maintenance with %{username} and %{password}
When I open COMMUNITY menu
And I click on tickers menu item with css selector #community__menu__tickers-link
And I type ADM using js to element css with css selector #community__tickers__search-input
And I wait small timeout
And I click on ADM ticker with css selector tr.ng-scope:nth-child(1) > td:nth-child(2)
When I execute javascript scroll(1050, 0)
And I click on predictions menu item with css selector #community__tickers__menu__trade-predictions-link
And I wait until service ready
!-- TMA-5825  Fixed on rc.tickerontest.com, but actual for rc branch
Then I see page header with css selector .social-title > h1:nth-child(1) contains: A.I. Trend Predictions for
And I see breadcumb with css selector .cx-breadcrumbs > a:nth-child(3) is ADM
!-- Click on subscribe
And I wait small timeout
!-- 'Subscribe' btn does not work on rc branch, works on rc.tickerontest.com
When I click on Subscribe with css selector div.tickers-predictions-page__status:nth-child(2) > a:nth-child(2)
And I wait until service ready
When I click on Subcribe button with css selector button.btn:nth-child(6)
And I wait until service ready
Then I see page header with css selector h4.modal-title:nth-child(1) is Fill payment profile.

Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password

Scenario:
Production check community patterns from intermed
GivenStories:
    stories/2production/trade_ideas/community_predictions.story#{name:Check predictions from community tickers}
Given Do nothing

Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario:
Production check community patterns from beginner
GivenStories:
    stories/2production/trade_ideas/community_predictions.story#{name:Check predictions from community tickers}
Given Do nothing

