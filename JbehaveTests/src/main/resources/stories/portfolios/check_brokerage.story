Story: Check Brokerege menu

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated


Scenario: Open portfolio and check Brokerage menu
GivenStories:
   stories/functional/test/portfolio/create_diversified_trading_portfolio.story#{name:Create diversified trading porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
!-- Brokerage on
When I click on brokerage toggle with css selector .cx-portfolio-toggle
Then I see toastr with css selector .toast-message contains: Portfolio updated
And I wait small timeout
Then I see Adjust Actual Positions with css selector div.pull-left:nth-child(1) contains: Adjust Actual Positions
Then I see Brokerage Order with css selector div.disabled > a:nth-child(2) > span:nth-child(6) contains: & Brokerage Order
!-- Brokerage off
When I click on brokerage toggle with css selector .cx-portfolio-toggle
Then I see toastr with css selector .toast-message contains: Portfolio updated
Then I see Next Trade with css selector div.disabled > a:nth-child(2) > span:nth-child(4) contains: Next Trade