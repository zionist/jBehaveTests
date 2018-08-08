Story: Expense Ratios

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario: Expense Ratios
GivenStories:
   stories/functional/test/portfolio/create_non_diversified_trading_portfolio.story#{name:Create non diversified trading porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Adjust Actual Positions with css selector .social-menu__icon_adjust
And I wait small timeout
And I click on remove GOOGL with css selector tr.ng-scope:nth-child(3) > td:nth-child(6) > i:nth-child(1)
And I click on Yes with css selector button.ng-scope:nth-child(1)
And I wait until service ready
And I click on remove AAPL with css selector .dsg
And I click on Yes with css selector button.ng-scope:nth-child(1)
And I wait small timeout
And I click on Save with xpath selector //button[contains(., 'Save')]
And I wait until service ready
When I click on Analyze with css selector div.social-menu:nth-child(4) > div:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > span:nth-child(2)
And I wait small timeout
And I click on Expense Ratios with css selector .social-menu__icon_expense-ratios
And I wait until service ready
Then I see header with css selector .portfolio_page_title-nomenu > div:nth-child(1) > h1:nth-child(1) contains: Analyze Expense Ratios
Then I see There are no tickers in this portfolio with css selector .cx-summary_mdsm contains: There are no tickers in this portfolio

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario: Expense Ratios with ticker
GivenStories:
         stories/functional/test/portfolio/create_investement_portfolio.story#{name:Create investment porfolio}
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Analyze with css selector div.social-menu:nth-child(4) > div:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > span:nth-child(2)
And I click on Expense Ratios with css selector .social-menu__icon_expense-ratios
And I wait until service ready
Then I see header with css selector .portfolio_page_title-nomenu > div:nth-child(1) > h1:nth-child(1) contains: Analyze Expense Ratios
Then I see AAPL with css selector tr.ng-scope:nth-child(1) > td:nth-child(2) contains: AAPL
Then I see No load with css selector tr.ng-scope > td:nth-child(6) contains: N/A
When I click on X button with css selector .btn-cancel
And I wait until service ready
Then I see Summary header with css selector .col-sm-9 > h1:nth-child(1) contains: Summary
And I wait small timeout
When I remove portfolio

