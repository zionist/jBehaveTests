Story: As advisor create portfolio for client and make draft in Investment portfolio


Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Adv_managed + UUID and put it to test param portfolioGenerated
And I generate Some text for private note + UUID and put it to test param someText
Given Set test param clientName with value Mike In.
Given Set test param advisorName with value James Adv.

Scenario: as advisor create portfolio for client and make draft in Investment portfolio
Meta:
@name as advisor create portfolio for client and make draft in Investment portfolio
Given I logged in with %{username} and %{password}
When I open HOME menu
And I open portfolios block
And I wait small timeout
And I click on Create New button with css selector a.btn
And I wait until service ready
Then I see Create portfolio page header with css selector .cx-create-portfolio-title-block contains: Create Portfolio
When I type %{portfolioGenerated} into Portfolio title with css selector #input_title
And I wait small timeout
When I select Mike In. ByVisibleText from Select element with css selector #select_cxPortfoliosDupDestinationUserSelection
And I wait until service ready
!-- Next -> next -> next
And I click on NEXT button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait until service ready
!-- And I type AAPL into search field with css selector #filterInput
!-- And I wait until service ready
!-- And I start recording action
!-- And I will move in action to on ticker AAPL element with css selector #chb33807
!-- And I click on AAPL with css selector #chb33807
!-- Then I perform previously recorded action
!-- And I wait small timeout
!-- When I click on ADD button with css selector .ticker-picker-add-button
When I add ticker AAPL with css selector #chb33807 in module(choose one of MALL/Start here/Portfolio/Article/Blog): MALL

And I wait until service ready
And I click on NEXT button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait until service ready
Then I see pop up window with css selector h3.modal-title > b:nth-child(1) contains: Attention! For retirement accounts
When I click on Proceed as is with css selector button.btn-primary:nth-child(2)
And I wait until service ready
And I click on NEXT button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait until service ready
!-- Let's fill wizard
And I type Aggressive into Risk Level with css selector .cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)
And I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)").change()
And I wait until service ready
And I type 0 - 5 into Years till wuthdrawal with css selector .cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(3) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)
And I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(3) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)").change()
And I wait until service ready
And I type Non-retirement into Type with css selector .cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(4) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)
And I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(4) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)").change()
And I wait until service ready
And I type AK, Alaska into Us state with css selector .cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)
And I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)").change()
And I wait small timeout
And I type Less than 12 months into Cach reserves with css selector .cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(6) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)
And I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(6) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)").change()
And I wait small timeout
!-- Press finish button
And I click on finish button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait until service ready
Then I see head of page with css selector .col-sm-9 > h1:nth-child(1) is Client Portfolio Summary
Then I see Portfolio is Personal with css selector div.col-xs-8:nth-child(5) > div:nth-child(1) > div:nth-child(2) contains: Fully controlled by Advisor
Then I see client name with css selector span.ng_portfolio_topplate_animation:nth-child(4) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > a:nth-child(1) contains: %{clientName}
And I wait small timeout

!-- Make draft for client
When I click on Investment Ideas with css selector .cx-portfolio-menu__trade-idea > span:nth-child(2) > span:nth-child(1)
And I wait until service ready
Then I see header with css selector div.portfolio_page_title:nth-child(1) > div:nth-child(1) > h1:nth-child(1) contains: Investment Ideas
When I click on Get ideas from A.I., modify, & apply with css selector div.col-xs-12:nth-child(4) > div:nth-child(2) > span:nth-child(1)
And I wait until service ready
And I wait big timeout
And I click on Edite button with css selector .cx-idea-preview__comment_ait-block_buttons > div:nth-child(1) > button:nth-child(2)
And I wait until service ready
And I type AAPL into search field with css selector #filterInput
And I wait small timeout
And I start recording action
And I will move in action to on ticker AAPL element with css selector #chb33807
And I click on AAPL with css selector #chb33807
And I wait small timeout
And I click on ADD button with css selector div.col-xs-2:nth-child(3) > button:nth-child(1)
And I wait small timeout
Then I see Edit Selection with css selector .cx-idea__wizard-navigation > div:nth-child(1) > h3:nth-child(2) > span:nth-child(2) contains: Edit Selection
When I click on Next button with css selector button.btn-primary:nth-child(2)
And I wait until service ready
And I click on Get A.I. Allocation Ideas with css selector button.btn-join:nth-child(1)
And I wait until service ready
When I click on Next button with css selector button.btn-primary:nth-child(2)
And I wait until service ready
Then I see Edit Selection with css selector .cx-idea__wizard-navigation > div:nth-child(1) > h3:nth-child(2) > span:nth-child(2) contains: Review Advice
When I click on Edit text with css selector .cx-idea-preview__comment_do-edit-caption > span:nth-child(1) > a:nth-child(1) > span:nth-child(2)
And I wait until service ready
And I type New Advice into Edit text with css selector .cx-idea-preview__comment_editor_on-edit
And I wait small timeout
And I click on Save button with css selector .cx-idea-preview__comment_manager-buttons > button:nth-child(1)
And I wait small timeout
And I clear the Data picker with css selector .ng-valid-date
And I type Nov 19, 2021 into Data picker with css selector .ng-valid-date
And I wait small timeout
And I click on Post button with css selector button.btn:nth-child(4)
And I wait until service ready
Then I see h1 Next Investment with css selector h1.ng-scope contains: Next Investment

Scenario:
Setup params. Set user to intermed
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password


Scenario: Check portfolio created by advisor

Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
And I wait until service ready
Then I see Managed by Advisor with css selector div.portfolio_topplate_block:nth-child(3) > div:nth-child(1) > div:nth-child(2) contains: Fully controlled by Advisor













