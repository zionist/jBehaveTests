Story: Mall CRED newsletter

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Newsletter_ + UUID and put it to test param newsletterGeneratedName
And I generate Issue + UUID and put it to test param issueGeneratedName
And I generate Issue + UUID and put it to test param issueGeneratedName2

Scenario: create and sell newsletter
Meta:
@name Create and sell newsletter
Given I connect stripe as seller for %{username} with %{password}
And I logged in with %{username} and %{password}
When I open MALL menu
And Mall. Open sell newsletter
!-- Create newsletter
When I wait until service ready
When I type %{newsletterGeneratedName} into title with css selector #name
And Mall. I upload file cat.jpeg using input element with css selector input[type=file]
And I wait small timeout
When I type 29 into price with css selector #price
And I wait until service ready
And I execute javascript CKEDITOR.instances.text.setData("test description")
And I wait small timeout
And I click on Save and next with css selector button.btn-primary:nth-child(2)
When I wait until service ready

!-- Create issue
When I click on Add issue with css selector button.btn-secondary:nth-child(1)
And I wait small timeout
And I type %{issueGeneratedName} into title with css selector #title
And I wait small timeout
And Mall. I upload file cat.jpeg using input element with css selector input[type=file]

!-- # Add tickers. Wait until tickers list will be loaded
When I add ticker A with css selector #chb34108 in module(choose one of MALL/Start here/Portfolio/Article/Blog): MALL
When I add ticker AA with css selector #chb33569 in module(choose one of MALL/Start here/Portfolio/Article/Blog): MALL

!-- Click on search input. Tickers list should disappear
When I click on filter input element with css selector #filterInput
And I wait big timeout
When I click on Add issue with css selector button.btn-primary:nth-child(2)
Then I see toaster with css selector .toast-message is Issue added!
When I click on Save and Preview with css selector button.btn-primary:nth-child(2)
And I wait until service ready
Then I see newsletter title with css selector .cx-mall-create-header contains: %{newsletterGeneratedName}

Scenario: Publish newsletter
Meta:
@name Publish newsletter
When I click on List in MALL with css selector .pull-xs-right
And I wait small timeout
And I click on Agree button with css selector button.ng-binding:nth-child(2)
And I wait small timeout
Then I see popup with css selector h4.modal-title:nth-child(1) contains: Tickeron
When I click on ok button with css selector button.ng-binding
And I wait small timeout
!-- Find newsletter
When I execute javascript $(".form-control").val("%{newsletterGeneratedName}")
And I execute javascript $(".form-control").change()
And I wait small timeout
!--/*
!-- Check created newsletter
When I open MALL menu
And Mall. Open buy newsletter
When I execute javascript $(".form-control").val("%{newsletterGeneratedName}")
And I execute javascript $(".form-control").change()
And I wait small timeout
And I click on newsletter in list with containsText selector %{newsletterGeneratedName}
Then I see newsletter title with css selector .h1 is %{newsletterGeneratedName}
And I see newsletter price with css selector .cx-mall-item__price-num is $29.00
When I click on Back with css selector .cx-breadcrumbs > a:nth-child(1)
And I wait until service ready
!--*/

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
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario: Edit newsletter
Meta:
@name Edit newsletter
!-- Find newsletter
Given I logged in with %{username} and %{password}
When Mall. Find item %{newsletterGeneratedName} in Mall list
And I wait small timeout
When I execute javascript $(".form-control").val("%{newsletterGeneratedName}")
And I execute javascript $(".form-control").change()
And I wait small timeout

!-- Add one more issue
When I click on newletter header with css selector .cx-mall-table__hover-active > span:nth-child(2)
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
And I wait until service ready
!-- Click on search input. Tickers list should disappear
When I click on filter input element with css selector #filterInput
!-- Add issue
When I execute javascript $("div.form-group:nth-child(5) > div:nth-child(1) > button:nth-child(2)").click()
!-- When I click on Add issue with css selector div.form-group:nth-child(5) > div:nth-child(1) > button:nth-child(2)
Then I see toaster with css selector .toast-message is Issue added!
When I execute javascript scroll(0, 0)
And I wait small timeout
When I click on chevron back to listing with css selector .cx-breadcrumbs > a:nth-child(1) > span:nth-child(2)
And I wait until service ready
!-- Find newsletter
When I execute javascript $(".form-control").val("%{newsletterGeneratedName}")
And I execute javascript $(".form-control").change()
And I wait small timeout

!-- Open newsletter and check it
When I open MALL menu
And Mall. Open buy newsletter
When I execute javascript $(".form-control").val("%{newsletterGeneratedName}")
And I execute javascript $(".form-control").change()
And I wait small timeout
And I click on newsletter in list with containsText selector %{newsletterGeneratedName}
Then I see newsletter title with css selector .h1 is %{newsletterGeneratedName}
And I see newsletter price with css selector .cx-mall-item__price-num is $29.00
And I see title of new issue with css selector tr.ng-scope:nth-child(1) > td:nth-child(2) is: %{issueGeneratedName2}

Scenario: Delete newsletter
Meta:
@name Delete newsletter
!-- Open listing
When I open HOME menu
And I wait until service ready
And I open Listings page
And I wait until service ready
!-- Find newsletter
When I execute javascript $(".form-control").val("%{newsletterGeneratedName}")
And I execute javascript $(".form-control").change()
And I wait small timeout
!-- Remove newsletter
And I click on chevron with css selector .cx-arrow-down-icon
And I click on remove button with css selector .cx-trash-btn
And I click on Yes button with css selector button.ng-binding:nth-child(1)
Then I see toaster with css selector .toast-message is Newsletter deleted!
