Story: Mall -> Buy portfolio subscribtion

Scenario:
Setup params. Set user to advisor
Given Set test param buyer_username value from property param.intermediate.username
Given Set test param buyer_password value from property param.intermediate.password
Given Set test param seller_username value from property param.expert.username
Given Set test param seller_password value from property param.expert.password
And I generate PS_portfolio + UUID and put it to test param portfolioGenerated
And I generate PSE_portfolio + UUID and put it to test param EditablePortfolioGenerated

Given Set test param username with value %{seller_username}
Given Set test param password with value %{seller_password}

Scenario: Create portfolio subscribtion and publish it
Meta:
@name Create portfolio subscribtion and publish it
GivenStories:
    stories/mall/portfolio_subscribtion/cred_portfolio_subscribtion.story#{name:Create portfolio subscribtion},
    stories/mall/portfolio_subscribtion/cred_portfolio_subscribtion.story#{name:Publish portfolio subscribtion},
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
Setup params. Set user to expert
Given Set test param username with value %{buyer_username}
Given Set test param password with value %{buyer_password}

Scenario: Buy portfolio subscribtion
Meta:
@name Buy portfolio subcribtion
Given I connect card as client for %{username} with %{password}
Given I logged in with %{username} and %{password}
When I open MALL menu
!--  Go  to BUY button in MALL
When Mall. Open buy subscription portfolio
!-- Find model portfolio
When I execute javascript $(".form-control").val("%{portfolioGenerated}")
And I execute javascript $(".form-control").change()
And I wait small timeout
And I click on portfolio subscription in list with containsText selector %{portfolioGenerated}
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
Then I see modal titile window with css selector h4.modal-title:nth-child(1) contains: Are you sure you want to subscribe for
When I click on Buy button with css selector button.ng-binding:nth-child(2)
And I wait big timeout
Then I see modal window header with css selector h4.modal-title:nth-child(1) is Congratulations
And I see modal window text with css selector div.ng-binding:nth-child(2) contains: You have successfully purchased
And I see modal window text with css selector div.ng-binding:nth-child(2) contains: %{portfolioGenerated}
When I click on Ok Button with css selector button.ng-binding
And I wait small timeout

!-- open product
When Mall. Find item %{portfolioGenerated} in Mall purchases
And I click on portfolio link with link selector %{portfolioGenerated}
When I wait until service ready
!-- Check it
Then I see page header with css selector .h1 > span:nth-child(1) contains: PS_portfolio
And I see description with css selector p.ng-binding > p:nth-child(1) is test descr
And I see seller name with css selector .cx-new-avatar__name is John Exp.
When I wait until service ready
!-- Check chat
When I click on note button with css selector .cx-mall-preview__notes > span:nth-child(2)
And I send note message with text bla-la la
And I click on Chats button with css selector .btn-with-chat-icon
And I send chat message with text Some text
!-- Click on Create editable portfolio
When I click on Create editable portfolio with css selector button.pull-right
And I wait small timeout
Then I see modal window titile with css selector h3.modal-title is Enter a title for the editable portfolio
When I type %{EditablePortfolioGenerated} into portfolio input with css selector #name
And I click on create button with css selector button.btn-primary:nth-child(2)
And I wait big timeout

!-- Check we are on portfolio page
When Portfolio. I find portfolio %{EditablePortfolioGenerated}
Then I see page header with css selector .col-sm-9 > h1:nth-child(1) is Summary
And I see portfolio titile with css selector p.cx-breadcrumbs:nth-child(2) > span:nth-child(3) > a:nth-child(1) is %{EditablePortfolioGenerated}

!-- Click on compare with portfolio subscription
When I click on Compare wth model link with css selector .col-sm-3 > a:nth-child(1)
And I wait until service ready
Then I see your allocation quality with css selector .cx-idea-preview__panel_actual > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) contains: 0
Then I see model allocation quality with css selector .cx-idea-preview__panel_draft > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) contains: 0

Scenario:
Setup params. Set user to advisor
Given Set test param username with value %{seller_username}
Given Set test param password with value %{seller_password}

Scenario:
Create new portfolio allocation on buyer side
Given I logged in with %{username} and %{password}
!-- Check chat
When Chats. I receive chat message with text Some text and  Subscription: %{portfolioGenerated}

!-- When Portfolio. I find portfolio %{portfolioGenerated}
!-- And I click on Investemnt ideas with css selector span.pull-left:nth-child(1)
!-- And I click on No ideas -> Enter draft with css selector div.cx-idea-main__task-block:nth-child(3) > div:nth-child(2) > span:nth-child(1) > h3:nth-child(1)
!-- And I click on  ACtuals -> with css selector div.cx-idea-main__from_block:nth-child(1) > div:nth-child(1)
!-- And I wait until service ready
!-- And I click on edit button with css selector a.btn
!-- And I wait until service ready
!-- And I click on modify with css selector .cx-idea-edit__btn-line > div:nth-child(2) > div:nth-child(1) > span:nth-child(2) > button:nth-child(1)
!-- And I wait small timeout
!-- And I click on Edit manually with css selector .open > ul:nth-child(2) > li:nth-child(1) > a:nth-child(1)

!-- # Add tickers. Wait until tickers list will be loaded
!-- And I click on ticker selection input with css selector #filterInput
!-- And I will wait until ticker element element with css selector #chb34108 will be visible

!-- # Tickers list appears. Add two tickers
!-- And I start recording action
!-- And I will move in action to A ticker checkbox element with css selector #chb34108
!-- And I will click in action on A ticker checkbox element with css selector #chb34108
!-- And I will move in action to A ticker checkbox element with css selector #chb33569
!-- And I will click in action on A ticker checkbox element with css selector #chb33569
!-- Then I perform previously recorded action
!--  Wait until tickers list disappears
!-- And I wait small timeout
Given Do nothing



