Story: create new diversified trading portfolio

Narrative:
As a user I want to create a new diversified trading portfolio

Scenario:
Setup params set user to expert
Given Set test param username value from property param.expert.username
And Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated


Scenario: create a new diversified trading portfolio
Meta:
@name create a new diversified trading portfolio
Given Do nothing
Given I logged in with %{username} and %{password}
When I open HOME menu
And I open portfolios block
And I wait big timeout
And I click on Create New button with css selector a.btn
And I wait until service ready
Then I see Create portfolio page header with css selector .cx-create-portfolio-title-block is: Create Portfolio
When I type %{portfolioGenerated} into Portfolio title with css selector #input_title
!-- Next -> add tickers by employer
And I click on NEXT button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait small timeout
When I click on Select tickers by employer with css selector .cx-create-portfolio-add-tickers__radio-buttons > div:nth-child(3) > label:nth-child(1) > span:nth-child(2)
And I type Z into search field with css selector #cxCompanyTickers_Input
And I wait small timeout
And I will move in action to Zimmer Holding element with css selector .cx-company-tickers__list__item
And I click on Zimmer Holding with css selector .cx-company-tickers__list__item
And I click on remove all with css selector .bordered-table > thead:nth-child(1) > tr:nth-child(1) > th:nth-child(1) > label:nth-child(1) > span:nth-child(2)
And I click on first ticker with css selector tr.ng-scope:nth-child(1) > td:nth-child(1) > label:nth-child(1) > span:nth-child(2)
And I click on Add selected btn with css selector a.btn:nth-child(1)
And I wait until service ready
!-- Next -> Allocations in Percentage mode
And I click on NEXT button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait until service ready
Then I see pop up window with css selector h3.modal-title > b:nth-child(1) contains: Attention! For retirement accounts
When I click on Proceed as is with css selector button.btn-primary:nth-child(2)
And I wait until service ready
And I click on Percentages mode with css selector label.cx-radio:nth-child(2) > span:nth-child(2)
And I wait until service ready
And I click on %input with css selector tr.ng-scope > td:nth-child(4) > div:nth-child(3) > span:nth-child(2)
And I clear the input with css selector input.form-control
And I type 10 into %input with css selector input.form-control
And I click on Apply btn with css selector input.btn:nth-child(2)
!-- Next -> Trading important
And I click on NEXT button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait small timeout
And I click on Less than 3 month with css selector .cx-portfolio-edit-settings__strategy-trading > label:nth-child(1) > span:nth-child(2)
And I wait until service ready
When I select Important ByVisibleText from Select element with css selector select[ng-model="header.DivScoreImportant"]
When I select Aggressive ByVisibleText from Select element with css selector select[id="select_risk"]
When I select 15+ ByVisibleText from Select element with css selector select[id="select_years"]
When I select Retirement (tax-deferred) ByVisibleText from Select element with css selector select[id="select_type"]
When I select CA, California ByVisibleText from Select element with css selector select[id="select_state"]
When I select More than 12 months ByVisibleText from Select element with css selector select[id="select_cash"]
!-- Will add money
And I execute javascript $("div.ng-dirty > div:nth-child(10) > span:nth-child(2) > div:nth-child(1) > span:nth-child(1) > label:nth-child(1) > span:nth-child(2)").click()
And I wait small timeout
!-- Press finish button
And I click on finish button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait until service ready
Then I see Portfolio title with css selector p.cx-breadcrumbs:nth-child(2) > span:nth-child(3) > a:nth-child(1) is %{portfolioGenerated}
Then I see Diversified ― Trading with css selector h6.col-xs-12 contains: Diversified ― Trading
Then I see Personal Portfolio with css selector h3.portfolio_page_topplate_zero contains: Personal Portfolio
