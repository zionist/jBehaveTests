Story: Refund denied by Seller Requestor: buyer in model portfolio

Scenario:
Setup params. Set user to intermediate
Given Set test param buyer_name value from property param.intermediate.username
Given Set test param buyer_password value from property param.intermediate.password
Given Set test param seller_name value from property param.advisor.username
Given Set test param seller_password value from property param.advisor.password
Given Set test param mailusername value from property catchmail.catch01.username
Given Set test param mailpassword value from property catchmail.catch01.password
Given Set test param messageText with value Where is my money?
Given Set test param adminusername value from property param.accountadmin.username
And Set test param adminpassword value from property param.accountadmin.password
And I generate PS_portfolio + UUID and put it to test param portfolioGenerated
And I generate PSE_portfolio + UUID and put it to test param EditablePortfolioGenerated
Given Set test param username with value %{seller_name}
Given Set test param password with value %{seller_password}

Scenario: Create model_portfolio and publish it for zendesk test
GivenStories:
   stories/mall/model_portfolio/buy_model_portfolio.story#{name:Create model portfolio and publish it}
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


Given Set test param username with value %{buyer_name}
Given Set test param password with value %{buyer_password}

Scenario: Buy portfolio subscribtion for zendesk test

Given I connect card as client for %{username} with %{password}
Given I logged in with %{username} and %{password}
When I open MALL menu
!--  Go  to BUY button in MALL
When Mall. Open buy model portfolio
!-- Find model portfolio
When I execute javascript $(".form-control").val("%{portfolioGenerated}")
And I execute javascript $(".form-control").change()
And I wait small timeout
And I click on portfolio subscription in list with containsText selector %{portfolioGenerated}
And I wait until service ready
!-- Check it
Then I see page header with css selector .pull-left is %{portfolioGenerated}
And I see price with css selector .cx-mall-item__price-num is $22.00
!-- Buy product
!-- Agree with terms
When I execute javascript $(".cx-checkbox > input:nth-child(1)").click()
When I click on BUY PRODUCT with css selector .btn-primary-sm
And I wait small timeout
Then I see modal titile window with css selector h4.modal-title:nth-child(1) is Buy this Model Portfolio
When I click on Buy button with css selector button.ng-binding:nth-child(2)
And I wait big timeout
Then I see modal window header with css selector h4.modal-title:nth-child(1) is Congratulations
And I see modal window text with css selector div.ng-binding:nth-child(2) contains: You have successfully purchased
And I see modal window text with css selector div.ng-binding:nth-child(2) contains: %{portfolioGenerated}
When I click on Ok Button with css selector button.ng-binding
And I wait small timeout
When I open HOME menu
And I wait big timeout
And I open Payments page
And I type %{portfolioGenerated} into search field with css selector input[type=text]
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

Scenario: As seller go to Transaction Details page and Reject Refund


Given I logged in with %{username} and %{password}
When I open Payments page
And I type %{portfolioGenerated} into search field with css selector input[type=text]
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
When I reject Issue Refund As Seller with text No thx

Scenario:
Check zendesk last ticket
Meta:
@name Check zendesk last ticket
!-- Given I logged in to Zendesk
Given I check in zendesk sent message with text Buyer Mike In. requested refund for Model Portfolio "%{portfolioGenerated}" from James Adv
Then I see status of ticker with css selector span.active:nth-child(2) > span:nth-child(1) contains: open
When I click on transaction number with css selector div.api:nth-child(1) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1)
When SwitchTo new window in browser
And I wait until service ready
And I wait big timeout
And I click on email input field with css selector #admin__login-form__login-input
And I type %{adminusername} into email input field with css selector #admin__login-form__login-input
And I type %{adminpassword} into password input field with css selector #admin__login-form__password-input
And I click on "Login" button with css selector #admin__login-form__login-button
And I wait until service ready
And I click on refund button with css selector button.btn:nth-child(1)
Then I see header with css selector .text-uppercase contains: ISSUE REFUND
When I execute javascript CKEDITOR.instances.text.setData("Refund about -- %{messageText}");
And I wait small timeout
And I click on submit button with css selector button.btn:nth-child(5)
Then I see toaster with css selector .toast-message is Refund request was issued.
When close all windows and open new one

Scenario:
Check zendesk last ticket
Meta:
@name Check zendesk last ticket
Given I check that zendesk ticket with Buyer Mike In. requested refund for Model Portfolio have status is(choose one of solved/open/pending): solved
