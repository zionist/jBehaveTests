Story: Production - Check Patterns and Predictions

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Check pattern recognition from community tickers
Meta:
@name Check pattern recognition from community tickers
Given I logged in during maintenance with %{username} and %{password}
When I open COMMUNITY menu
And I click on tickers menu item with css selector #community__menu__tickers-link
And I type ADM using js to element css with css selector #community__tickers__search-input
And I wait small timeout
And I click on ADM ticker with css selector tr.ng-scope:nth-child(1) > td:nth-child(2)
And I click on patterns menu item with css selector #community__tickers__menu__trade-patterns-link
When I wait until service ready
Then I see page header with css selector .social-title > h1:nth-child(1) is A.I. Pattern Recognitions
And I see breadcumb with css selector .cx-breadcrumbs > a:nth-child(3) is ADM
!-- Click on subsribe
When I click on Subscribe button with css selector a.btn-primary:nth-child(5)
And I wait until service ready
Then I see page header with css selector .col-lg-5 > h1:nth-child(1) is A. I. Pattern Recognition

Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password

Scenario:
Production check community patterns from intermed
GivenStories:
    stories/2production/trade_ideas/community_patterns.story#{name:Check pattern recognition from community tickers}
Given Do nothing


Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario:
Production check community patterns from beginner
GivenStories:
    stories/2production/trade_ideas/community_patterns.story#{name:Check pattern recognition from community tickers}
Given Do nothing

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario:
duction check community patterns from expert
GivenStories:
    stories/2production/trade_ideas/community_patterns.story#{name:Check pattern recognition from community tickers}
Given Do nothing
