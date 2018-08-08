Story: As Advisor duplicate portfolio for client and make draft in Trading portfolio

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Adv_managed + UUID and put it to test param portfolioGenerated
And I generate Some text for private note + UUID and put it to test param someText
Given Set test param clientName with value Mike In.
Given Set test param advisorName with value James Adv.
And I generate Duplicate + UUID and put it to test param portfolioDuplicate

Scenario: As Advisor duplicate portfolio for client
GivenStories:
   stories/functional/test/portfolio/create_non_diversified_trading_portfolio.story#{name:Create non diversified trading porfolio}

Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Tools with css selector div.cx-portfolios-action-menu-group__title:nth-child(2) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > span:nth-child(2) > button:nth-child(3)
And I click on Duplicate portfolio with css selector .social-menu__icon_duplicate
And I wait until service ready
Then I see header with css selector h3.modal-title is: Duplicate Portfolio
When I type %{portfolioDuplicate} into title of portfolio duplicate with css selector #input_title
And I wait small timeout
When I select Mike In. ByVisibleText from Select element with css selector #select_cxPortfoliosDupDestinationUserSelection
And I wait small timeout
And I click on Duplicate button with xpath selector //button[contains(., 'Duplicate')]
Then I see Toaster item with css selector .toast-message is: Portfolio has been duplicated
When I wait until service ready
Then I see head of page with css selector .col-sm-9 > h1:nth-child(1) is Client Portfolio Summary
Then I see Portfolio is not Personal with css selector div.col-xs-8:nth-child(5) > div:nth-child(1) > div:nth-child(2) contains: Fully controlled by Advisor
Then I see client name with css selector span.ng_portfolio_topplate_animation:nth-child(4) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > a:nth-child(1) contains: %{clientName}
And I wait small timeout
!-- Make draft for client
When I click on Treade Ideas with css selector .cx-portfolio-menu__trade-idea > span:nth-child(2) > span:nth-child(1)
And I wait until service ready
Then I see header with css selector div.portfolio_page_title:nth-child(1) > div:nth-child(1) > h1:nth-child(1) contains: Trade Ideas
When I click on Get ideas from A.I., modify, & apply with css selector div.col-xs-12:nth-child(4) > div:nth-child(2) > span:nth-child(1)
And I wait until service ready
!-- And I click on Next button with xpath selector //button[contains(., 'Next')]
When I click on Post button with css selector div.cx-idea-edit__btn-line:nth-child(1) > div:nth-child(2) > div:nth-child(1) > button:nth-child(5)
And I wait until service ready
Then I see Next Trade with css selector h1.ng-scope contains: Next Trade

Scenario:
Setup params. Set user to intermed
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password


Scenario: Check portfolio created by advisor

Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioDuplicate}
And I wait until service ready
Then I see Managed by Advisor with css selector #pageMenuContainer > div.cx-content-menu.row > div.cx-portfolio.ng-scope > div > div.cx-content-menu__content > div > div > div > div > div > div > div.portfolio_page_topplate_container.ng-scope > div > span:nth-child(3) > div > div.portfolio_topplate_section.col-xs-5.portfolio_topplate__v_divider > div:nth-child(3) > div > div:nth-child(2) contains: Fully controlled by Advisor
Then I see Actuals with css selector .cx_actuals contains: ACTUALS
Then I see Next Trade with css selector .cx_next-trade > div:nth-child(1) contains: NEXT TRADE




