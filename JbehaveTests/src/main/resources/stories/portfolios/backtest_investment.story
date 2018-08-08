Story: Investment Backtest Performance

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Personal + UUID and put it to test param portfolioGenerated
And I generate Some text for private note + UUID and put it to test param someText

Scenario: Investment Backtest Performance
GivenStories:
         stories/functional/test/portfolio/create_investement_portfolio.story#{name:Create investment porfolio}
Given Do nothing
!-- Check Backtest for investment portfolio
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Analyze with css selector div.social-menu:nth-child(4) > div:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > span:nth-child(2) > span:nth-child(1)
And I click on Backtest Performance with css selector .social-menu__icon_backtest-perf
Then I see header with css selector .col-xs-10 contains: Analyze Historical Performance
!-- Set the date
When I execute javascript $("#from_DatePicker").val("Oct 10, 2010")
And I execute javascript $("#from_DatePicker").change()
When I execute javascript $(" #to_DatePicker").val("Oct 10, 2015")
And I execute javascript $(" #to_DatePicker").change()
When I click on Run Performance Calculator with css selector .col-xs-4 > button:nth-child(1)
And I wait until service ready
Then I see text with css selector .cx-portfolios-stat__graph_title > h2:nth-child(1) contains: Performance graph
When I click on X button with css selector .btn-cancel
And I wait until service ready
Then I see Summary header with css selector .col-sm-9 > h1:nth-child(1) contains: Summary
