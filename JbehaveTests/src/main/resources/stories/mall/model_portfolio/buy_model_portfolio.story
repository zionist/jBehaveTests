Story: Mall -> Buy model portfolio, Create Editable portfolio

Scenario:
Setup params. Set user to advisor
Given Set test param buyer_username value from property param.intermediate.username
Given Set test param buyer_password value from property param.intermediate.password
Given Set test param seller_username value from property param.expert.username
Given Set test param seller_password value from property param.expert.password
And I generate M_portfolio + UUID and put it to test param portfolioGenerated
And I generate E_portfolio + UUID and put it to test param EditablePortfolioGenerated

Given Set test param username with value %{seller_username}
Given Set test param password with value %{seller_password}

Scenario: Create model portfolio and publish it
Meta:
@name Create model portfolio and publish it
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
Given Set test param username with value %{buyer_username}
Given Set test param password with value %{buyer_password}

Scenario: Buy model portfolio
Meta:
@name Buy model portfolio
Given Browser ready
Given I connect card as client for %{username} with %{password}
And I logged in with %{username} and %{password}
When I open MALL menu
!--  Go  to BUY button in MALL
When Mall. Open buy model portfolio
!-- Find model portfolio
When I execute javascript $(".form-control").val("%{portfolioGenerated}")
And I execute javascript $(".form-control").change()
And I wait small timeout
And I click on model portfolio in list with containsText selector %{portfolioGenerated}
And I wait until service ready
!-- Check it
Then I see page header with css selector .pull-left is %{portfolioGenerated}
And I see price with css selector .cx-mall-item__price-num is $22.00
And I see test desciption with css selector p.ng-binding > p:nth-child(1) is test descr

!-- Buy product
!-- Agree with terms
When I execute javascript $(".cx-checkbox > input:nth-child(1)").click()
When I click on BUY PRODUCT with css selector .btn-primary-sm
And I wait small timeout
Then I see modal titile window with css selector h4.modal-title:nth-child(1) is Buy this Model Portfolio
When I click on Buy button with css selector button.ng-binding:nth-child(2)
And I wait small timeout
Then I see modal window header with css selector h4.modal-title:nth-child(1) is Congratulations
And I see modal window text with css selector div.ng-binding:nth-child(2) contains: You have successfully purchased the model portfolio
And I see modal window text with css selector div.ng-binding:nth-child(2) contains: %{portfolioGenerated}
When I click on Ok Button with css selector button.ng-binding
And I wait small timeout
!-- Then I see Toaster item with css selector .toast-message contains: Congratulations

!-- open product
When Mall. Find item %{portfolioGenerated} in Mall purchases
And I click on portfolio link with link selector %{portfolioGenerated}
When I wait until service ready
!-- Check it
Then I see page header with css selector .h1 > span:nth-child(1) contains: M_portfolio
And I see description with css selector p.ng-binding > p:nth-child(1) is test descr
And I see seller name with css selector .cx-new-avatar__name is John Exp.
!-- Check chat
When I click on note button with css selector .cx-mall-preview__notes > span:nth-child(2)
And I send note message with text bla-la la
And I click on Chats button with css selector .btn-with-chat-icon
And I send chat message with text Some text

Scenario: Create editable portfolio
When I click on Create editable portfolio with css selector button.pull-right
And I wait small timeout
Then I see modal window titile with css selector h3.modal-title is Enter a title for the editable portfolio
When I type %{EditablePortfolioGenerated} into portfolio input with css selector #name
And I click on create button with css selector button.btn-primary:nth-child(2)
And I wait big timeout

!-- Check we are on portfolio page
When Portfolio. I find portfolio %{EditablePortfolioGenerated}
Then I see page header with css selector .col-sm-9 > h1:nth-child(1) is Summary
And I see plate "Based on" with css selector span.ng_portfolio_topplate_animation:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > span:nth-child(1) is Based on
And I see Model Potfolio with css selector span.ng_portfolio_topplate_animation:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > a:nth-child(1) is Model Portfolio
And I see portfolio titile with css selector p.cx-breadcrumbs:nth-child(2) > span:nth-child(3) > a:nth-child(1) is %{EditablePortfolioGenerated}

!-- Click on compare with model
When I click on Compare wth model link with css selector .col-sm-3 > a:nth-child(1)
And I wait until service ready
Then I see your allocation quality with css selector .cx-idea-preview__panel_actual > div:nth-child(1) > h2:nth-child(1) is Your Actual
Then I see model allocation quality with css selector .cx-idea-preview__panel_draft > div:nth-child(1) > h2:nth-child(1) > div:nth-child(1) is Model
!-- And I see your selection quality with css selector .cx-idea-preview__panel_actual > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) is 68%
!-- And I see you selection quality with css selector .cx-idea-preview__panel_draft > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) is 68%
And I wait small timeout
When I click on button Done with css selector .btn-join
And I wait small timeout
When I click on Settings with css selector .social-menu__icon_setting
And I wait small timeout
When I click on Edit with css selector button[ng-click='onEdit(true)']
And I wait small timeout
When I click on radio-button with css selector .cx-portfolio-edit-settings__strategy-trading > label:nth-child(1) > span:nth-child(2)
And I wait small timeout
When I click on Save with css selector button[ng-click='savePortfolio()']
And I wait small timeout
When I click on Adjust Actul Positions with css selector .social-menu__icon_adjust
!-- Add ticker
When I add ticker AMD with css selector #chb34563 in module(choose one of MALL/Start here/Portfolio/Article/Blog): Portfolio
!-- Make some allocations
When I click on first ticker with css selector tr.ng-scope:nth-child(2) > td:nth-child(4) > span:nth-child(2) > div:nth-child(2)
And I clear the input with css selector input.form-control:nth-child(2)
And I type 10 into %input with css selector input.form-control:nth-child(2)
And I click on Apply  with css selector input.btn:nth-child(2)
And I wait small timeout
!-- And I click on Done with css selector button.btn-primary-sm:nth-child(1)
And I click on Done button with css selector button[ng-click='savePortfolio()']
When Portfolio left side menu. Click on Summary
!-- Click on compare with model
When I click on Compare wth model link with css selector .col-sm-3 > a:nth-child(1)
And I wait until service ready
Then I see new ticker with css selector tr.ng-scope:nth-child(3) > td:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) is AMD
Then I see new allocation with css selector tr.ng-scope:nth-child(2) > td:nth-child(5) > span:nth-child(3) is 10.00%

Scenario:
Setup params. Set user to advisor
Given Set test param username with value %{seller_username}
Given Set test param password with value %{seller_password}


Scenario: Check chat on seller side
Given Do nothing
Given I logged in with %{username} and %{password}
When Chats. I receive chat message with text Some text and %{portfolioGenerated}
