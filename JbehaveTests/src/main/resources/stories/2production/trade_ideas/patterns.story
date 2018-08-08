Story: Production - Check Patterns

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Production check AI pattern recognition from advisor
Meta:
@name Production check AI pattern recognition
Given I logged in during maintenance with %{username} and %{password}
When I open AI patterns recognition block
And I click on subcribe button with css selector button.btn:nth-child(6)
Then I see modal window with css selector h4.modal-title:nth-child(1) is Fill payment profile.
When I click on No button with css selector button.ng-binding:nth-child(2)
And I wait small timeout
!-- Open READ MORE
When I click on READ MORE with css selector .btn-more
Then I see pupup windows dialog with css selector div.in:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > h1:nth-child(1) is Overview
When I click on close icon with css selector button.close:nth-child(2)
And I wait small timeout
!-- Open 1st Bullish patterns
When I click on first bullish pattern with css selector div.row:nth-child(5) > a:nth-child(1) > span:nth-child(2)
And I wait until service ready
Then I see second header for description with css selector strong.cx-patterns-pattern-page__description__header:nth-child(1) is General Description
Then I see third header for description with css selector strong.cx-patterns-pattern-page__description__header:nth-child(3) is Trading Idea
And I see statistic header with css selector .cx-patterns-overall-statistics-for-all-tickers > h2:nth-child(1) contains: Overall stats for all tickers
And I see second statistic header with css selector .cx-patterns-trade-statistics > h2:nth-child(1) contains: Pattern Statistics
And I wait small timeout

!-- Click on subscribe
When I click on subscribe button with css selector button.btn:nth-child(4)
Then I see modal window with css selector h4.modal-title:nth-child(1) is Fill payment profile.
When I click on No button with css selector button.ng-binding:nth-child(2)
And I wait small timeout


Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password

Scenario:
Production check AI pattern recognition from intermed
GivenStories:
    stories/2production/trade_ideas/patterns.story#{name:Production check AI pattern recognition}
Given Do nothing

Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario:
Production check AI pattern recognition from beginner
GivenStories:
    stories/2production/trade_ideas/patterns.story#{name:Production check AI pattern recognition}
Given Do nothing



