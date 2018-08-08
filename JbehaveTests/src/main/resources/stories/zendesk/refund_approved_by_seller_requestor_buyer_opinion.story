Story: Refund approved by Seller Requestor: buyer in opinion

Scenario:
Setup params. Set user to intermediate
Given Set test param buyer_name value from property param.intermediate.username
Given Set test param buyer_password value from property param.intermediate.password
Given Set test param seller_name value from property param.expert.username
Given Set test param seller_password value from property param.expert.password
Given Set test param mailusername value from property catchmail.catch01.username
Given Set test param mailpassword value from property catchmail.catch01.password
Given Set test param messageText with value Where is my money?
And I generate Opinion_ + UUID and put it to test param opinonGeneratedName
Given Set test param username with value %{seller_name}
Given Set test param password with value %{seller_password}

Scenario: Create opinion and publish it for zendesk test
GivenStories:
   stories/mall/opinion/buy_opinion.story#{name:create opinion and publish it}
Given Do nothing

Scenario:
Setup params. Set user to account admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
Given Set test param password value from property param.accountadmin.password
Given Set test param itemType with value Portfolio model
Given Set test param productTitle with value %{opinonGeneratedName}

Scenario: Login to admin interface as account admin
Meta:
@name Login to admin interface as account admin
GivenStories:
    stories/mall/model_portfolio/cred_model_portfolio.story#{name:Approve Portfolio model in MALL}
Given Do nothing


Given Set test param username with value %{buyer_name}
Given Set test param password with value %{buyer_password}

Scenario: Buy opinion for zendesk test

Given I connect card as client for %{username} with %{password}
Given I logged in with %{username} and %{password}
When I open MALL menu
!--  Go  to BUY button in MALL
When Mall. Open buy opinion
!-- Find model portfolio
When I execute javascript $(".form-control").val("%{opinonGeneratedName}")
And I execute javascript $(".form-control").change()
And I wait small timeout
And I click on portfolio subscription in list with containsText selector %{opinonGeneratedName}
And I wait until service ready
!-- Check it
Then I see page header with css selector .pull-left is %{opinonGeneratedName}
And I see price with css selector .cx-mall-item__price-num is $22.00
!-- And I see test desciption with css selector p.ng-binding > p:nth-child(1) is test descr
!-- Buy product
!-- Agree with terms
When I execute javascript $(".cx-checkbox > input:nth-child(1)").click()
When I click on BUY PRODUCT with css selector .btn-primary-sm
And I wait small timeout
Then I see modal titile window with css selector h4.modal-title:nth-child(1) is Buy this Opinion
When I click on Buy button with css selector button.ng-binding:nth-child(2)
And I wait big timeout
Then I see modal window header with css selector h4.modal-title:nth-child(1) is Congratulations
And I see modal window text with css selector div.ng-binding:nth-child(2) contains: You have successfully purchased
And I see modal window text with css selector div.ng-binding:nth-child(2) contains: %{opinonGeneratedName}
When I click on Ok Button with css selector button.ng-binding
And I wait small timeout
When I open HOME menu
And I wait big timeout
And I open Payments page
And I type %{opinonGeneratedName} into search field with css selector input[type=text]
And I wait big timeout
And I click on arrow down with css selector .cx-arrow-down-icon
And I wait small timeout
And I click on View details button with css selector button.btn-secondary:nth-child(1)
And I wait until service ready
Then I see Transaction Details header with css selector .h1 contains: Payment Details
When I click on Request refund with css selector .btn-block
And I request refund with reason Other and with text Return my money


Given Set test param username with value %{seller_name}
Given Set test param password with value %{seller_password}

Scenario: As seller go to Transaction Details page and Approve Refund


Given I logged in with %{username} and %{password}
When I open Payments page
And I type %{opinonGeneratedName} into search field with css selector input[type=text]
And I wait big timeout
And I click on arrow down with css selector .cx-arrow-down-icon
And I wait until service ready
And I start recording action
And I will move in action to Extend element with css selector .btn-link-more
Then I perform previously recorded action
And I wait small timeout
When I click on Extend with css selector .btn-link-more
And I wait until service ready
Then I see header with css selector .h1 contains: Payment Details
And I wait small timeout
When I send Issue Refund As Seller with text No problem

Given Set test param username with value %{buyer_name}
Given Set test param password with value %{buyer_password}

Scenario: As buyer check it

Given I logged in with %{username} and %{password}
When I open Notifications page
And I wait until service ready
Then I see Refund Requested  with css selector tr.ng-scope:nth-child(1) > td:nth-child(3) > span:nth-child(1) contains: Your Refund Request was Processed
When I click on More button with css selector tr.ng-scope:nth-child(1) > td:nth-child(3) > a:nth-child(2)
Then I see text of notification with css selector .cx-wall-table__content contains: Tickeron refunded your payment for
When I click on Click here with css selector .cx-wall-table__content > a:nth-child(2)
And I wait until service ready
Then I see header with css selector .h1 contains: Payment Details
Then I see REFUND FOR CHARGE with css selector tr.ng-scope:nth-child(3) > td:nth-child(4) contains: REFUND FOR CHARGE
Then I see status with css selector .col-xs-3 > div:nth-child(2) contains: Refunded

