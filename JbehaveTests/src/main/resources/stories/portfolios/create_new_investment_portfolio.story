Story: create new investment portfolio

Narrative:
As a user
I want to create a new investment portfolio with AAPL ticker

Scenario:
Setup params set user to expert
Given Set test param username value from property param.expert.username
And Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated


Scenario: create a new investment portfolio
Meta:
@name create a new investment portfolio
Given Do nothing
Given I logged in with %{username} and %{password}
When I open HOME menu
And I open portfolios block
And I wait big timeout
And I click on Create New button with css selector a.btn
And I wait until service ready
Then I see Create portfolio page header with css selector .cx-create-portfolio-title-block contains: Create Portfolio
When I type %{portfolioGenerated} into Portfolio title with css selector #input_title
!-- Next -> next -> next
And I click on NEXT button with css selector .btn-primary-sm
And I wait small timeout
!--/*
And I type AAPL into search field with css selector #filterInput
And I wait small timeout
And I start recording action
And I will move in action to on ticker AAPL element with css selector #chb33807
And I click on AAPL with css selector #chb33807
And I wait small timeout
And I click on ADD button with css selector .ticker-picker-add-button
!--*/
And I wait small timeout
When I add ticker AAPL with css selector #chb33807 in module(choose one of MALL/Start here/Portfolio/Article/Blog): Portfolio
And I click on NEXT button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait until service ready
Then I see pop up window with css selector h3.modal-title > b:nth-child(1) contains: Attention! For retirement accounts
When I click on Proceed as is with css selector button.btn-primary:nth-child(2)
And I wait until service ready
And I click on NEXT button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait small timeout
!-- Let's fill wizard
And I type Aggressive into Risk Level with css selector .cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)
And I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)").change()
And I wait small timeout
And I type 0 - 5 into Years till wuthdrawal with css selector .cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(3) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)
And I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(3) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)").change()
And I wait small timeout
And I type Non-retirement into Type with css selector .cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(4) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)
And I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(4) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)").change()
And I wait small timeout
And I type AK, Alaska into Us state with css selector .cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)
And I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)").change()
And I wait small timeout
And I type Less than 12 months into Cach reserves with css selector .cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(6) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)
And I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(6) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)").change()
And I wait small timeout
!-- Press finish button
And I click on finish button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait until service ready
Then I see Portfolio title with css selector p.cx-breadcrumbs:nth-child(2) > span:nth-child(3) > a:nth-child(1) is %{portfolioGenerated}
Then I see  Diversified ― Investment strategy with css selector h6.col-xs-12 is Diversified ― Investment
Then I see Portfolio is Personal with css selector h3.portfolio_page_topplate_zero contains: Personal Portfolio

