Story: Remove portfolio

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario: Remove portfolio
GivenStories:
   stories/functional/test/portfolio/create_non_diversified_trading_portfolio.story#{name:Create non diversified trading porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Remove with css selector .social-menu__icon_remove
And I wait until service ready
And I click on No button with css selector button.ng-binding:nth-child(2)
And I wait small timeout
And I remove portfolio
And I wait until service ready
Then I see header with css selector div.col-sm-6:nth-child(1) > div:nth-child(1) > h1:nth-child(1) is: Portfolios

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate __Personal + UUID and put it to test param portfolioGenerated

Scenario: Remove portfolio in list clicks on tresh icon
GivenStories:
   stories/functional/test/portfolio/create_non_diversified_trading_portfolio.story#{name:Create non diversified trading porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When I open HOME menu
And I wait until service ready
And I open portfolios block
And I wait until service ready
And I click on sort by title with css selector div.cx-grid-header:nth-child(2) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1)
And I wait small timeout
And I click on sort by title with css selector div.cx-grid-header:nth-child(2) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1)
And I wait small timeout
And I click on tresh icon with css selector .cx-navigation-list-first-item > div:nth-child(6) > div:nth-child(1)
And I wait small timeout
And I click on Yes button with css selector button.ng-binding:nth-child(1)
And I wait until service ready
Then I see header with css selector div.col-sm-6:nth-child(1) > div:nth-child(1) > h1:nth-child(1) is: Portfolios


