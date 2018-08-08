Story: Duplicate portfolio

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated
And I generate Duplicate + UUID and put it to test param portfolioDuplicate

Scenario: Duplicate portfolio
GivenStories:
   stories/functional/test/portfolio/create_diversified_trading_portfolio.story#{name:Create diversified trading porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Tools with css selector div.cx-portfolios-action-menu-group__title:nth-child(2) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > span:nth-child(2) > span:nth-child(1)
And I click on Duplicate portfolio with css selector .social-menu__icon_duplicate
And I wait until service ready
Then I see header with css selector h3.modal-title is: Duplicate Portfolio
When I type %{portfolioDuplicate} into title of portfolio duplicate with css selector #input_title
And I click on Duplicate button with css selector body > div.modal.fade.ng-isolate-scope.cx-modal-dafault.modal-duplicate.in > div > div > div.modal-footer.ng-scope > div > div > div > button.btn.btn-primary > span:nth-child(2)
Then I see Toaster item with css selector .toast-message is: Portfolio has been duplicated
When I wait until service ready
And I wait small timeout
When I execute javascript scroll(1050, 350)
And I click on History of Trades with css selector .social-menu__icon_history
And I wait until service ready
Then I see header with css selector h1.ng-scope is: History of Trades
When I click on Search in history with css selector .col-xs-2 > button:nth-child(1)
And I wait until service ready
And I click on Actual Adjusted with css selector .cx-allocation-history-page__alloc-name
Then I see Cash Reserve with css selector .cx-misc-tooltip-activator > span:nth-child(1) > b:nth-child(1) is: Cash Reserve
When I execute javascript scroll(0, 0)
When I click on step back with containsText selector %{portfolioDuplicate}
And I remove portfolio
