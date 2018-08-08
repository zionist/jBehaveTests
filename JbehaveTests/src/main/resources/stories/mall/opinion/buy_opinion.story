Story: Mall -> Buy opinion

Scenario:
Setup params. Set user to advisor
!-- Given Set test param username value from property param.advisor.username
!-- Given Set test param password value from property param.advisor.password
Given Set test param buyer_username value from property param.intermediate.username
Given Set test param buyer_password value from property param.intermediate.password
Given Set test param seller_username value from property param.expert.username
Given Set test param seller_password value from property param.expert.password
And I generate Opinion_ + UUID and put it to test param opinonGeneratedName


Given Set test param username with value %{seller_username}
Given Set test param password with value %{seller_password}

Scenario: create opinion and publish it
Meta:
@name create opinion and publish it
GivenStories:
    stories/mall/opinion/cred_opinion.story#{name:Create opinion},
    stories/mall/opinion/cred_opinion.story#{name:Publish opinion}
Given Do nothing

Scenario:
Setup params. Set user to account admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
Given Set test param password value from property param.accountadmin.password
Given Set test param itemType with value Opinion
Given Set test param productTitle with value %{opinonGeneratedName}

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

Scenario: buy opinion
Meta:
@name Buy opinion
Given I connect card as client for %{username} with %{password}
Given I logged in with %{username} and %{password}
When I open MALL menu
And I wait until service ready
When Mall. Open buy opinion
!-- Find opinion
When I execute javascript $(".form-control").val("%{opinonGeneratedName}")
And I execute javascript $(".form-control").change()
And I wait small timeout
And I click on opinion in list with containsText selector %{opinonGeneratedName}
And I wait until service ready
Then I see header with css selector .pull-left is %{opinonGeneratedName}
And I wait small timeout
When I will execute javascript $('label:contains("I agree with")').children('input').click()
!-- When I click on checkbox with css selector .ng-untouched
And I wait small timeout
And I click on buy broduct button with css selector .btn-primary-sm
And I wait small timeout
And I click on Buy with css selector button.ng-binding:nth-child(2)
And I wait until service ready
And I click on Ok with css selector button.ng-binding
And I wait until service ready
Then I see head with css selector .h1 contains: Purchases
!-- Find opinion
When I execute javascript $(".form-control").val("%{opinonGeneratedName}")
And I execute javascript $(".form-control").change()
And I wait small timeout
!-- Check it
When I click on bought opinion link with containsText selector %{opinonGeneratedName}
And I wait until service ready
Then I see opinion title with css selector .h1 is %{opinonGeneratedName}
And I see opinion description with css selector p.ng-binding > p:nth-child(1) is test descr
When I click on note button with css selector .cx-mall-preview__notes > span:nth-child(2)
And I send note message with text bla-la la
And I click on Chats button with css selector .btn-with-chat-icon
And I send chat message with text Some text

Given Set test param username with value %{seller_username}
Given Set test param password with value %{seller_password}

Scenario: Check chat on seller side
Meta:
@name check chut in model
Given Do nothing
Given I logged in with %{username} and %{password}
When Chats. I receive chat message with text Some text and %{opinonGeneratedName}
