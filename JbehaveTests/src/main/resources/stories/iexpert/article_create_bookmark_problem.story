Story: Create article, find it, bookmark, report a problem, delete article

Scenario:
Setup params. Set user to content admin
Given Set test param username value from property param.contentadmin.username
And Set test param password value from property param.contentadmin.password
And I generate Article_title_ + UUID and put it to test param articleGeneratedTitle
And I generate Article_title_ + UUID and put it to test param articleGeneratedTitle1

Scenario:
Create Article
Meta:
@name Create Article
Given I logged in with %{username} and %{password}
!-- Open content admin menu
When I open COMMUNITY menu
And I open CONTENT ADMIN menu
And I wait until service ready
Then I see Content Admin Panel with css selector .cx-ca-header > h1:nth-child(1) is: Content Administration Panel
!-- Open HIT Article menu
When I click on H.I.T Articles (iExpert) with link selector H.I.T. Articles (iExpert)
And I wait until service ready
Then I see H.I.T. Articles Header with css selector h1.ng-binding is: Manage H.I. Tickeron Articles
!-- Create New Article
When I click on Create new link with css selector .cx-btn-create-new
And I wait until service ready
Then I see Create Article Header with css selector h1.ng-binding is: Create Article
When I type %{articleGeneratedTitle} into Title field with css selector #title
And I type Teaser text into Teaser field with css selector #teaser
And I will execute javascript CKEDITOR.instances.text.setData("Article text filling")
!-- Add tickers
!--/*
And I click on ticker selection input with css selector #filterInput
And I will wait until ticker element element with css selector #chb34108 will be visible
!-- # Tickers list appears. Add two tickers
And I start recording action
And I will move in action to A ticker checkbox element with css selector #chb34108
And I will click in action on A ticker checkbox element with css selector #chb34108
And I will move in action to AA ticker checkbox element with css selector #chb33569
And I will click in action on AA ticker checkbox element with css selector #chb33569
And I will move in action to Add button element with css selector span.btn-primary
And I will click in action on Add button element with css selector span.btn-primary
Then I perform previously recorded action
!--*/
!-- When I add ticker A with css selector #chb34108 in module(choose one of MALL/Start here/Portfolio/Article/Blog): Article
!-- When I add ticker AA with css selector #chb33569 in module(choose one of MALL/Start here/Portfolio/Article/Blog): Article
!-- Add keywords
When I type Alternatives into Keywords field with css selector #ticker-picker__keywords-input
And I wait big timeout
And I wait until service ready
And I click on Alternatives  with css selector .keyword-picker__item
And I wait small timeout
Then I see Alternatives item with css selector .btn-default > span:nth-child(1) contains: alternatives
!-- Save
When I click on Save button with css selector .col-sm-2 > button:nth-child(1)
And I wait until service ready
Then I see Article Header with css selector .iexpert-article__header is: %{articleGeneratedTitle}

Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password

Scenario:
Report problem
Meta:
@name Report problem
Given I logged in with %{username} and %{password}
!-- Find Article
When I open IEXPERT menu
!-- And I execute javascript $("a[href*='/app/academy#!/iexpert/index']").click()
And I wait until service ready
Then I see page headers with css selector .iexpert-index-page__column-blogposts > h2:nth-child(1) is: Top blogs
When I type %{articleGeneratedTitle} into Search field with css selector .iexpert-search-bar__box > div:nth-child(1) > input:nth-child(1)
!-- And I click on search button with css selector .iexpert-search-bar__search-button
And I wait until service ready
Then I see Search results header with css selector .iexpert-search-result-block > h1:nth-child(2) contains: Search Results
Then I see articleGeneratedTitle with css selector .iexpert-search-result__title is: %{articleGeneratedTitle}
!-- Open article
When I click on articleGeneratedTitle with css selector .iexpert-search-result__title
And I wait until service ready
Then I see Article header with css selector .iexpert-article__header is: %{articleGeneratedTitle}
!-- Report problem
When I click on report problem item with css selector .btn-link-problem
And I wait until service ready
Then I see Report a Problem header with css selector #form > h4:nth-child(1) contains: Report a problem
When I wait until service ready
And I type Test text of problem into input field with css selector #cxReportProblemModalText
!-- When I will execute javascript CKEDITOR.instances.text.setData("Test text of problem")
And I click on Send with css selector button.btn:nth-child(6)
And I wait until service ready
Then I see articleGeneratedTitle header with css selector .iexpert-article__header is: %{articleGeneratedTitle}

Scenario:
Setup params. Set user to content admin
Given Set test param username value from property param.contentadmin.username
And Set test param password value from property param.contentadmin.password

Scenario: Remove complaint and article
Meta:
@name Check problem report as admin
Given I logged in with %{username} and %{password}
When I open COMMUNITY menu
And I open CONTENT ADMIN menu
!-- Remove article
When I click on H.I.T Articles (iExpert) with link selector H.I.T. Articles (iExpert)
When I type %{articleGeneratedTitle} into search input with css selector #searchText
When I click on 'Trash' icon with css selector tr.ng-scope:nth-child(1) > td:nth-child(4) > a:nth-child(2)
When I click on 'Yes' button with css selector button.ng-binding:nth-child(1)
And I wait until service ready
Then I see No data found with css selector .well > p:nth-child(1) > span:nth-child(1) contains: No data found
Given Do nothing
