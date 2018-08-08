Story: Actual performance in portfolio

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated
And I generate Some text for private note + UUID and put it to test param someText

Scenario: Actual performance in portfolio
GivenStories:
   stories/functional/test/portfolio/create_non_diversified_trading_portfolio.story#{name:Create non diversified trading porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Analyze with css selector div.social-menu:nth-child(4) > div:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > span:nth-child(2) > span:nth-child(1)
And I click on Actual Performance with css selector .social-menu__icon_actual-perf
Then I see header with css selector .col-xs-10 contains: Analyze Actual Performance
When I click on Run Performance Calculator with css selector button.pull-right:nth-child(1)
And I wait until service ready
Then I see text with css selector div.cx-wizard-body:nth-child(2) > span:nth-child(2) > div:nth-child(1) > p:nth-child(1) contains: not enough data to display
When I click on X button with css selector .btn-cancel
And I wait until service ready
Then I see Summary header with css selector .col-sm-9 > h1:nth-child(1) contains: Summary
