Story:  Publish new allocation in Subscription

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate PS_portfolio + UUID and put it to test param portfolioGenerated


Scenario: Create portfolio subscribtion, publish it
Meta:
@name Create portfolio subscribtion and publish it
GivenStories:
    stories/mall/portfolio_subscribtion/cred_portfolio_subscribtion.story#{name:Create portfolio subscribtion},
    stories/mall/portfolio_subscribtion/cred_portfolio_subscribtion.story#{name:Publish portfolio subscribtion}
Given Do nothing

Scenario:
Setup params. Set user to account admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
Given Set test param password value from property param.accountadmin.password
Given Set test param itemType with value Portfolio subscription
Given Set test param productTitle with value %{portfolioGenerated}

Scenario: Login to admin interface as account admin
Meta:
@name Login to admin interface as account admin
GivenStories:
    stories/mall/model_portfolio/cred_model_portfolio.story#{name:Approve Portfolio model in MALL}
Given Do nothing

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario: Create portfolio subscribtion, publish it
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
And I wait small timeout
!-- Press on ‘Trade ideas’ button
When I click on btn with css selector .cx-portfolio-menu__trade-idea
And I wait small timeout
!-- My own ideas
And I click on plate with css selector div.cx-idea-main__task-block:nth-child(3) > div:nth-child(2) > span:nth-child(1)
And I wait small timeout
!-- Actuals
When I click on plate with css selector div.cx-idea-main__from_block:nth-child(1) > div:nth-child(1)
And I wait small timeout
!-- Press the button "Edit"
When I click on Edit with css selector button.btn-join:nth-child(2)
And I wait small timeout
!-- Press the button "Modify" -> Edit Manually
!-- When I click on Modify with css selector div.dropdown:nth-child(2) > button:nth-child(1)
!-- And I click on Edit Manually with css selector div.dropdown:nth-child(2) > ul:nth-child(2) > li:nth-child(1) > a:nth-child(1)
And I wait small timeout
!-- Add ticker
!--/*
When I type AAPL into search field with css selector #filterInput
And I wait small timeout
And I start recording action
And I will move in action to on ticker AAPL element with css selector #chb33807
And I click on AAPL with css selector #chb33807
And I wait small timeout
And I click on ADD button with css selector div.col-xs-10:nth-child(3) > div:nth-child(3) > button:nth-child(1)
And I wait small timeout
!--*/
When I add ticker AAPL with css selector #chb33807 in module(choose one of MALL/Start here/Portfolio/Article/Blog): Portfolio
!-- Press "Save and Done"
!-- When I click on btn with css selector .cx-idea-edit__btn-line > div:nth-child(2) > div:nth-child(1) > button:nth-child(2)
And I wait small timeout
!-- Press the button "Next"
When I click on btn with css selector button.btn-primary:nth-child(2)
And I wait small timeout
!-- Press the button "Modify" -> Edit Manually
!-- When I click on Modify with css selector div.dropdown:nth-child(2) > button:nth-child(1)
!-- And I click on Edit Manually with css selector div.dropdown:nth-child(2) > ul:nth-child(2) > li:nth-child(1) > a:nth-child(1)
And I wait small timeout
!-- make some allocations
When I click on input with css selector table.col-xs-12 > tbody:nth-child(2) > tr:nth-child(2) > td:nth-child(13) > div:nth-child(5) > div:nth-child(2) > span:nth-child(2)
And I clear the input with css selector input.form-control:nth-child(2)
And I type 10 into %input with css selector input.form-control:nth-child(2)
And I click on Apply btn with css selector .col-xs-offset-6 > span:nth-child(1) > input:nth-child(2)
!-- Press "Save and Done"
!-- When I click on btn with css selector .cx-idea-edit__btn-line > div:nth-child(2) > div:nth-child(1) > button:nth-child(2)
And I wait small timeout
!-- Press the button "Next"
When I click on btn with css selector button.btn-primary:nth-child(2)
And I wait small timeout
!-- Press the button "Apply"
When I click on btn with css selector button.btn:nth-child(3)
And I wait small timeout
Then I see Warning with css selector .cx-modal-dafault > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) contains: You have only one opportunity to make Next Trade
When I click on Yes with css selector button.ng-binding:nth-child(2)
And I wait until service ready
!-- Make sure that appears ‘Next Trade’ no possibility to cancel it
Then I see Title "Next Trade" with css selector h3.col-xs-9 contains: Next Trade
Then I see button Cancel Next Trade with css selector .cx-cancel-next-trade-btn contains: Cancel next trade
!-- When I click on button "Cancel Next Trade" with css selector .cx-cancel-next-trade-btn