Story: Check Settings menu

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated
And I generate Titile + UUID and put it to test param portfolioTitle

!-- Create non-diversified trading portfolio and check Settings menu
Scenario: Check Settings menu
GivenStories:
   stories/functional/test/portfolio/create_non_diversified_trading_portfolio.story#{name:Create non diversified trading porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Settings with css selector .social-menu__icon_setting
And I wait small timeout
Then I see page header with css selector h1.ng-scope > span:nth-child(1) contains: Settings
When I click on Edit icon with css selector button[ng-click="onEdit(true)"]
!-- Change portfolio params
When I clear the Title input with css selector #input_title
When I type %{portfolioTitle} into Title input with css selector #input_title
When I click on Brokerage account with css selector .cx-toggle-on-off
!-- Check subscribe buttons
!-- Change wizard
When I select Important ByVisibleText from Select element with css selector select[ng-model="header.DivScoreImportant"]
When I select Moderate ByVisibleText from Select element with css selector select[name="cxPortfoliosRiskSelection"]
When I select 5 - 15 ByVisibleText from Select element with css selector select[name="cxPortfoliosYearsWithdrawalSelection"]
When I select Retirement (tax-deferred) ByVisibleText from Select element with css selector select[name="cxPortfoliosPortfTypeSelection"]
When I select CA, California ByVisibleText from Select element with css selector select[state-code="header.UsState"]
When I select More than 12 months ByVisibleText from Select element with css selector select[name="cxPortfoliosCashResSelection"]
!-- When I type Important into Divercification with css selector .cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > select:nth-child(1)
!-- When I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > select:nth-child(1)").change()
!-- When I type Moderate into Risk levels with css selector .cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > span:nth-child(2) > select:nth-child(1)
!-- When I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > span:nth-child(2) > select:nth-child(1)").change()
!-- When I type 5 - 15 into Years until withdrawall with css selector .cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(3) > div:nth-child(2) > span:nth-child(2) > select:nth-child(1)
!-- When I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(3) > div:nth-child(2) > span:nth-child(2) > select:nth-child(1)").change()
!-- When I type Retirement (tax-deferred) into Type with css selector .cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(4) > div:nth-child(2) > span:nth-child(2) > select:nth-child(1)
!-- When I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(4) > div:nth-child(2) > span:nth-child(2) > select:nth-child(1)").change()
!-- When I type CA, California into U.S.State with css selector .cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(2) > select:nth-child(2)
!-- When I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(2) > select:nth-child(2)").change()
!-- When I type More than 12 months into Cash reserves with css selector .cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(6) > div:nth-child(2) > span:nth-child(2) > select:nth-child(1)
!-- When I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(6) > div:nth-child(2) > span:nth-child(2) > select:nth-child(1)").change()
!-- Will add money
When I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(10) > span:nth-child(2) > div:nth-child(1) > span:nth-child(1) > label:nth-child(1) > span:nth-child(2)").click()
When I wait small timeout
!-- When I click on volatility with css selector .cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(10) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(10)
!-- Save
When I click on Save btn with css selector button[ng-click="savePortfolio()"]
Then I see Toastr with css selector .toast-message is Portfolio has been saved
And I wait small timeout
!-- Go to Summary and back to Settings to check all changes have been saved
When I click on Summary with css selector .social-menu__icon_summary
And I wait small timeout
Then I see Header with css selector .col-sm-9 > h1:nth-child(1) is: Summary
When I click on Settings with css selector .social-menu__icon_setting
And I wait small timeout
Then I see Diversified ― Trading style with css selector h6.col-xs-12 is Diversified ― Trading
Then I see edited title with css selector p.cx-breadcrumbs:nth-child(2) > span:nth-child(3) > a:nth-child(1) is %{portfolioTitle}
Then I see edited Brokerage with css selector span.text-uppercase > span:nth-child(1) > span:nth-child(1) is YES
Then I see edited style - Diversified ― Trading with css selector .cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(2) is Diversified ― Trading
Then I see Diversification - important with css selector .cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) is Important
Then I see Risk levels - Moderate with css selector .cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(3) > span:nth-child(1) > span:nth-child(1) is Moderate
Then I see Years until withdrawall - 5-15 with css selector .cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(3) > div:nth-child(3) > span:nth-child(1) > span:nth-child(1) is 5 - 15
Then I see Type - retirement with css selector .cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(4) > div:nth-child(3) > span:nth-child(1) > span:nth-child(1) is Retirement (tax-deferred)
Then I see U.S.State - CA with css selector .cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(3) > div:nth-child(1) is CA
Then I see Cash reserves - more than 12 with css selector .cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(6) > div:nth-child(3) > span:nth-child(1) > span:nth-child(1) is More than 12 months
!-- Need to check there are no Subscribe buttons
!-- Change style on ‘Investment’ -> check just saved changes
When I click on Edit icon with css selector button[ng-click="onEdit(true)"]
When I click on Grater than 3 months with css selector .cx-portfolio-edit-settings__strategy-investment > label:nth-child(1) > span:nth-child(2)
When I click on Save btn with css selector button[ng-click="savePortfolio()"]
Then I see Toastr with css selector .toast-message is Portfolio has been saved
Then I see Diversified-Investment style with css selector h6.col-xs-12 is Diversified ― Investment
When I click on Adjust Actual Positions with css selector a.btn
And I wait small timeout
Then I see Page header with css selector div.portfolio_page_title:nth-child(4) > div:nth-child(1) > h1:nth-child(1) is Adjust Actual Positions
And I wait small timeout


