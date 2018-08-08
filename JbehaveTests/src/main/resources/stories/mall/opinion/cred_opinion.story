Story: Mall -> CRED opinion

Scenario:
Setup params. Set user to expert
Given Set test param seller_username value from property param.expert.username
Given Set test param seller_password value from property param.expert.password
And I generate Opinion_ + UUID and put it to test param opinonGeneratedName
Given Set test param username with value %{seller_username}
Given Set test param password with value %{seller_password}

Scenario: Create opinion
Meta:
@name Create opinion
Given I connect stripe as seller for %{username} with %{password}
Given I logged in with %{username} and %{password}
When I open MALL menu
!-- And I wait until service ready

!--  Go  to SELL button in MALL
And Mall. Open sell opinion
!-- Create create opinion
And I type %{opinonGeneratedName} into title with css selector #name
And I execute javascript CKEDITOR.instances['description'].insertHtml('test descr')
And Mall. I upload file cat.jpeg using input element with css selector input[type=file]
When I add ticker AAPL with css selector #chb33807 in module(choose one of MALL/Start here/Portfolio/Article/Blog): MALL
When I add ticker GOOGL with css selector #chb72469 in module(choose one of MALL/Start here/Portfolio/Article/Blog): MALL
!-- Then I perform previously recorded action
When I type 22 into price with css selector #price
And I click on button "Save and Preview" with css selector button.btn-primary:nth-child(2)
And I wait small timeout
And I wait until service ready
!-- Check created opinion
When Mall. Find item %{opinonGeneratedName} in Mall list
And I click on created opinion link with containsText selector %{opinonGeneratedName}
And I click on view botton with css selector .cx-listing-detail__buttons > button:nth-child(1)
And I wait until service ready
Then I see opinion title with css selector .h1 is %{opinonGeneratedName}
And I see opinion price with css selector .cx-mall-item__price-num is $22.00
And I see ticker with css selector .cx-mall-item__tickers > span:nth-child(1) > a:nth-child(1) is AAPL
When I click on $description with css selector .h2
Then I see ticker with css selector .cx-mall-item__tickers > span:nth-child(2) > a:nth-child(1) is GOOGL

Scenario: Edit opinion
When Mall. Find item %{opinonGeneratedName} in Mall list
!-- Go to edit
When I start recording action
And I will move in action to titile element with css selector .cx-mall-table__hover-active > span:nth-child(2)
And I will move in action to edit icon element with css selector a.cx-listing-edit__item:nth-child(1)
And I will click in action on edit icon element with css selector a.cx-listing-edit__item:nth-child(1)
Then I perform previously recorded action
When I wait until service ready
!-- Change title, descr, image
Given I generate Opinion_ + UUID and put it to test param opinonGeneratedName
!-- Will set new generated opinion
When I clear the title with css selector #name
When I type %{opinonGeneratedName} into title with css selector #name
And I execute javascript CKEDITOR.instances.description.setData("test descr edited")
And Mall. I upload file cat2.jpeg using input element with css selector input[type=file]
!-- Add tickers. Wait until tickers list will be loaded
And I click on remove AAPL with css selector #form > div:nth-child(5) > div > button:nth-child(3)
And I add ticker NTES with css selector #chb61557 in module(choose one of MALL/Start here/Portfolio/Article/Blog): MALL
!-- And Mall. Add ticker NTES
And I wait small timeout
When I clear the price with css selector #price
When I type 23 into price with css selector #price
And I wait small timeout
And I click on button "Save and Preview" with css selector button.btn-primary:nth-child(2)
Then I see toaster with css selector .toast-message is Opinion edited!
And I wait small timeout

!-- Check edited opinion
When Mall. Find item %{opinonGeneratedName} in Mall list
And I click on created opinion link with containsText selector %{opinonGeneratedName}
And I click on view botton with css selector .cx-listing-detail__buttons > button:nth-child(1)
And I wait until service ready
Then I see opinion title with css selector .h1 is %{opinonGeneratedName}
And I see opinion price with css selector .cx-mall-item__price-num is $23.00
And I see ticker with css selector .cx-mall-item__tickers > span:nth-child(2) > a:nth-child(1) is NTES


Scenario: Publish opinion
Meta:
@name Publish opinion
When Mall. Find item %{opinonGeneratedName} in Mall list
!-- Sell it
And I click on chevron with css selector .cx-arrow-down-icon
And I click on List in Mall button with css selector button.btn-primary:nth-child(2)
And I click on Agree button with css selector button.ng-binding:nth-child(2)
And I wait small timeout
Then I see popup with css selector h4.modal-title:nth-child(1) contains: Tickeron
When I click on ok button with css selector button.ng-binding
!-- Then I see toaster with css selector .toast-message is Opinion published!
And I wait until service ready

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
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario: Delete opinion
Meta:
@name Delete opinion
Given I logged in with %{username} and %{password}
When Mall. Find item %{opinonGeneratedName} in Mall list
!-- Remove opinion
And I click on chevron with css selector .cx-arrow-down-icon
And I click on remove button with css selector .cx-trash-btn
And I click on Yes button with css selector button.ng-binding:nth-child(1)
Then I see toaster with css selector .toast-message is Opinion deleted!



