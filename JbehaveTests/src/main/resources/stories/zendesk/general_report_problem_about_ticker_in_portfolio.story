Story: General report about missing ticker in portfolio

Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password
Given Set test param messageText with value ticker miss in portfolio
And I generate Personal + UUID and put it to test param portfolioGenerated
And I generate Some text for private note + UUID and put it to test param someText


Scenario: report about missing ticker in portfolio
GivenStories:
   stories/functional/test/portfolio/create_non_diversified_trading_portfolio.story#{name:Create non diversified trading porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Adjust Actual Positions with css selector .social-menu__icon_adjust
And I wait small timeout
And I report a problem about ticker QWERTY with text %{messageText}

Scenario:
Check zendesk last ticket
Meta:
@name Check zendesk last ticket
Given I check in zendesk sent message with text %{messageText}
Given Do nothing