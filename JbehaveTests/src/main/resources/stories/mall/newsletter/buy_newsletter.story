Story: Mall -> Buy newsletter

Scenario:
Setup params. Set user to advisor
Given Set test param buyer_username value from property param.intermediate.username
Given Set test param buyer_password value from property param.intermediate.password
Given Set test param seller_username value from property param.expert.username
Given Set test param seller_password value from property param.expert.password
And I generate Nlet + UUID and put it to test param newsletterGeneratedName
And I generate Issue + UUID and put it to test param issueGeneratedName
And I generate Issue + UUID and put it to test param issueGeneratedName2

Given Set test param username with value %{seller_username}
Given Set test param password with value %{seller_password}

Scenario: create and publish newsletter
Meta:
@name Create opinion
GivenStories:
    stories/mall/newsletter/cred_newsletter.story#{name:Create and sell newsletter},
    stories/mall/newsletter/cred_newsletter.story#{name:Publish newsletter},
Given Do nothing

Scenario:
Setup params. Set user to account admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
Given Set test param password value from property param.accountadmin.password
Given Set test param itemType with value Newsletter
Given Set test param productTitle with value %{newsletterGeneratedName}

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

Scenario: Buy newsletter
Meta:
@name Buy newsletter
Given I connect card as client for %{username} with %{password}
And I logged in with %{username} and %{password}
When I open MALL menu
And Mall. Open buy newsletter
!-- Find newsletter
When I execute javascript $(".form-control").val("%{newsletterGeneratedName}")
And I execute javascript $(".form-control").change()
And I wait small timeout
And I click on newsletter in list with containsText selector %{newsletterGeneratedName}
And I wait until service ready
Then I see header with css selector .pull-left is %{newsletterGeneratedName}
And I wait small timeout
When I will execute javascript $('label:contains("I agree with")').children('input').click()
!-- When I click on checkbox with css selector .ng-untouched
And I wait small timeout
And I click on buy broduct button with css selector .btn-primary-sm
And I wait small timeout
And I click on Buy with css selector button.ng-binding:nth-child(2)
And I wait small timeout
And I click on Ok with css selector button.ng-binding
And I wait until service ready
Then I see head with css selector .h1 contains: Purchases
!-- Find newsletter
When I execute javascript $(".form-control").val("%{newsletterGeneratedName}")
And I execute javascript $(".form-control").change()
And I wait small timeout
!-- Check it
When I click on bought newsletter link with containsText selector %{newsletterGeneratedName}
And I wait until service ready
Then I see newsletter title with css selector .h1 is %{newsletterGeneratedName}
And I see newsletter description with css selector p.ng-binding > p:nth-child(1) is test description
And I see issue title with css selector .cx-mall-table__text-large is %{issueGeneratedName}
!-- When I click on issue image with css selector .cx-issue-previewable
!-- And I wait small timeout
!-- Then I see issue image description with css selector h3.modal-title is cat.jpeg
!-- When I click on close button with css selector div.modal:nth-child(24) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > button:nth-child(1)
And I wait small timeout

!-- Check purchases
When Mall. Find item %{newsletterGeneratedName} in Mall purchases
And I click on newsletter name with link selector %{newsletterGeneratedName}
When I wait until service ready
Then I see page header with css selector span.pull-xs-left:nth-child(1) is %{newsletterGeneratedName}
Then I see number of issues with css selector span.pull-xs-left:nth-child(3) > span:nth-child(2) > span:nth-child(2) is 1
And I see newsletter description with css selector .cx-word-wrap > p:nth-child(1) is test description
And I see issue title with css selector .cx-mall-table__text-large is %{issueGeneratedName}
!-- When I click on issue image with css selector .cx-issue-previewable
!-- And I wait small timeout
!-- Then I see issue image description with css selector h3.modal-title is cat.jpeg
!-- When I click on close button with css selector div.modal:nth-child(24) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > button:nth-child(1)
And I wait small timeout
!-- Check chat
When I click on note button with css selector .cx-mall-preview__notes > span:nth-child(2)
And I send note message with text bla-la la
And I click on Chats button with css selector .btn-with-chat-icon
And I send chat message with text Some text


Scenario:
Setup params. Set user to advisor
Given Set test param username with value %{seller_username}
Given Set test param password with value %{seller_password}

Scenario:
Create issue
Given I logged in with %{username} and %{password}
When I open MALL menu
And Mall. Open buy newsletter
!-- Find newsletter
When I execute javascript $(".form-control").val("%{newsletterGeneratedName}")
And I execute javascript $(".form-control").change()
And I wait small timeout

!-- Add one more issue
When I click on newletter header with css selector div.cx-mall-table__text-large
And I wait until service ready
When I click on Add issue with css selector button.btn-secondary:nth-child(1)
And I wait until service ready
When I click on Add issue with css selector button.btn-secondary:nth-child(1)
And I wait small timeout
And I type %{issueGeneratedName2} into title with css selector #title
And Mall. I upload file cat2.jpeg using input element with css selector input[type=file]
!-- # Add tickers. Wait until tickers list will be loaded
When I add ticker A with css selector #chb34108 in module(choose one of MALL/Start here/Portfolio/Article/Blog): MALL
When I add ticker AA with css selector #chb33569 in module(choose one of MALL/Start here/Portfolio/Article/Blog): MALL
!-- Click on search input. Tickers list should disappear
When I click on filter input element with css selector #filterInput
And I wait big timeout
And I wait small timeout
!-- Add issue
When I click on Add issue button with css selector button.btn-primary:nth-child(2)
And I wait big timeout
!-- Check chat
When Chats. I receive chat message with text Some text and %{newsletterGeneratedName}

Scenario:
Setup params. Set user to account admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
Given Set test param password value from property param.accountadmin.password
Given Set test param itemType with value Newsletter
Given Set test param titleNewsletter with value %{newsletterGeneratedName}
Given Set test param issue with value %{issueGeneratedName2}

Scenario: Approve issue for newsletter in MALL
Meta:
@name Approve issue for newsletter in MALL

Given I logged in to Admin Service with %{username} and %{password}
!-- Go to Mall
When I click on MALL menu tab with link selector Mall
Then I see page header with css selector .col-md-12 > h1:nth-child(1) is: Manage mall items
!-- Open list of products
When MALL. I approve issue %{issue} for newsletter with %{titleNewsletter} which has a product type (Newsletter): %{itemType}


Scenario:
Setup params. Set user to expert
Given Set test param username with value %{buyer_username}
Given Set test param password with value %{buyer_password}

Scenario:
Check new issue on buyer side
Given I logged in with %{username} and %{password}
When Mall. Find item %{newsletterGeneratedName} in Mall purchases
And I click on newsletter title with link selector %{newsletterGeneratedName}
And I wait small timeout
And I wait until service ready
!-- check it
Then I see second issue title with css selector tr.ng-scope:nth-child(1) > td:nth-child(2) is %{issueGeneratedName2}
!-- When I click on second issue image with css selector tr.ng-scope:nth-child(1) > td:nth-child(1) > img:nth-child(1)
!-- And I wait small timeout
!-- Then I see modal window with css selector h3.modal-title is cat2.jpeg
!-- When I click on close icon with css selector div.modal:nth-child(24) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > button:nth-child(1)
Given Do nothing




