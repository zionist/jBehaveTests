Story: History of Trades

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated
And I generate Some text for private note + UUID and put it to test param someText

Scenario: History of Trades
GivenStories:
   stories/functional/test/portfolio/create_non_diversified_trading_portfolio.story#{name:Create non diversified trading porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Tools with css selector div.cx-portfolios-action-menu-group__title:nth-child(2) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > span:nth-child(2) > span:nth-child(1)
And I click on history of trades with css selector .social-menu__icon_history
And I wait until service ready
Then I see No results yet. with css selector .text-muted contains: No results yet.
And I wait small timeout
When I click on Search button with css selector .col-xs-2 > button:nth-child(1)
Then I see text with css selector p.ng-binding contains: Select a date to view allocation details
When I click on Actual Adjusted with css selector .cx-allocation-history-page__alloc-name
And I wait small timeout
Then I see Cash Reserve with css selector .cx-misc-tooltip-activator > span:nth-child(1) > b:nth-child(1) contains: Cash Reserve
And I wait small timeout
When I click on Positions with css selector label.cx-radio:nth-child(2) > span:nth-child(2)
And I wait small timeout
Then I see Cash Reserve with css selector .cx-misc-tooltip-activator > span:nth-child(1) > b:nth-child(1) contains: Cash Reserve
Then I see $10,000.00 with css selector span.number-col:nth-child(2) contains: $10,000.00
And I wait small timeout
When I click on Percentages with css selector .pull-xs-right > label:nth-child(1) > span:nth-child(2)
And I wait small timeout
Then I see Cash Reserve with css selector .cx-misc-tooltip-activator > span:nth-child(1) > b:nth-child(1) contains: Cash Reserve
Then I see 100.00% with css selector span.number-col:nth-child(3) contains: 100.00%
When I wait until service ready
When I execute javascript scroll(0, 0)
And I click on step back with css selector p.cx-breadcrumbs:nth-child(2) > span:nth-child(3) > a:nth-child(1)
And I wait small timeout
And I remove portfolio