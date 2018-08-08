Story: Apply Investment in copy of Model portfolio

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate M_portfolio + UUID and put it to test param portfolioGenerated
And I generate E_portfolio + UUID and put it to test param EditablePortfolioGenerated


Scenario: Create model portfolio and  publish
Meta:
@name Create model portfolio and publish
GivenStories:
    stories/mall/model_portfolio/cred_model_portfolio.story#{name:Create model portfolio},
    stories/mall/model_portfolio/cred_model_portfolio.story#{name:Publish model portfolio}
Given Do nothing

Scenario:
Setup params. Set user to account admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
Given Set test param password value from property param.accountadmin.password
Given Set test param itemType with value Portfolio model
Given Set test param productTitle with value %{portfolioGenerated}

Scenario: Login to admin interface as account admin
Meta:
@name Login to admin interface as account admin
GivenStories:
    stories/mall/model_portfolio/cred_model_portfolio.story#{name:Approve Portfolio model in MALL}
Given Do nothing

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario: Buy model portfolio as expert
GivenStories:
    stories/mall/model_portfolio/buy_model_portfolio.story#{name:Buy model portfolio}
Given Do nothing

Scenario: Create editable portfolio and open it
Meta:
@name Create editable portfolio and open it
When I click on Create editable portfolio with css selector button.pull-right
And I wait small timeout
Then I see modal window title with css selector h3.modal-title is Enter a title for the editable portfolio
When I type %{EditablePortfolioGenerated} into portfolio input with css selector #name
And I click on create button with css selector button.btn-primary:nth-child(2)
And I wait big timeout
!-- Investment ideas
When I click on button with css selector .cx-portfolio-menu__trade-idea > span:nth-child(2) > span:nth-child(1)
And I wait small timeout
!-- Press on ‘Model Portfolio’ item
When I click on plate "Review, modify, & apply" with css selector div.cx-idea-main__task-block:nth-child(3) > div:nth-child(2) > span:nth-child(1)
And I wait small timeout
!-- Check that seller allocations are immutable
!-- press Edit
!-- Press the button "Edit"
When I click on Edit with css selector button.btn-join:nth-child(2)
And I wait small timeout
!-- Press the button "Modify" -> Edit Manually
!-- When I click on Modify with css selector div.dropdown:nth-child(2) > button:nth-child(1)
!-- And I click on Edit Manually with css selector div.dropdown:nth-child(2) > ul:nth-child(2) > li:nth-child(1) > a:nth-child(1)
!-- And I wait small timeout
!-- Add some tickers
!--/*
When I type AMD into search field with css selector #filterInput
And I wait small timeout
And I start recording action
And I will move in action to on ticker AMD element with css selector #chb34563
And I click on AMD with css selector #chb34563
And I wait small timeout
And I click on ADD button with css selector div.col-xs-2:nth-child(3) > button:nth-child(1)
And I wait small timeout
!--*/
When I add ticker AMD with css selector #chb34563 in module(choose one of MALL/Start here/Portfolio/Article/Blog): Portfolio
!-- Press "Save and Done"
!-- When I click on btn with css selector .cx-idea-edit__btn-line > div:nth-child(2) > div:nth-child(1) > button:nth-child(2)
!-- And I wait small timeout
!-- Press the button "Next"
When I click on btn with css selector button.btn-primary:nth-child(2)
And I wait small timeout
!-- Press the button "Modify" -> Edit Manually
!-- When I click on Modify with css selector div.dropdown:nth-child(2) > button:nth-child(1)
!-- And I click on Edit Manually with css selector div.dropdown:nth-child(2) > ul:nth-child(2) > li:nth-child(1) > a:nth-child(1)
And I wait small timeout
!-- Make some allocations
When I click on first ticker with css selector table.col-xs-12 > tbody:nth-child(2) > tr:nth-child(2) > td:nth-child(13) > div:nth-child(5) > div:nth-child(2)
And I clear the input with css selector input.form-control:nth-child(2)
And I type 10 into %input with css selector input.form-control:nth-child(2)
!-- And I click on Apply  with css selector .col-xs-offset-6 > span:nth-child(1) > input:nth-child(2)
And I wait until service ready
When I execute javascript $("input[ng-click*='OnCommit()']").click()

And I wait small timeout
!-- Press "Save and Done"
!-- When I click on btn with css selector .cx-idea-edit__btn-line > div:nth-child(2) > div:nth-child(1) > button:nth-child(2)
!-- And I wait small timeout
!-- Press the button "Next"
When I click on btn with css selector button.btn-primary:nth-child(2)
And I wait small timeout
!-- Press the button "Apply"
When I click on btn with css selector button.btn:nth-child(3)
And I wait small timeout
!-- Open ‘Summary’ page
When I click on left menu with css selector .social-menu__icon_summary
And I wait small timeout
!-- Make sure that you can see committed Next Investment with a possibility to cancel it
Then I see columns allocations: Actuals with css selector th.value-col:nth-child(5) is ACTUALS
Then I see columns allocations: Next Trade with css selector .cx_next-trade > div:nth-child(1) is NEXT TRADE
