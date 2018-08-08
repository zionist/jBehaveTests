Story: Create / edit / delete article

Scenario:
Setup params. Set user to content admin
Given Set test param username value from property param.contentadmin.username
And Set test param password value from property param.contentadmin.password
And I generate Article_title_ + UUID and put it to test param articleGeneratedTitle
And I generate Article_title_Edit_ + UUID and put it to test param articleGeneratedTitleEdit

Scenario:
Create Article
Meta:
@name Create Article
Given I logged in with %{username} and %{password}
!-- Open content admin menu
When I open COMMUNITY menu
And I open CONTENT ADMIN menu
Then I see Content Admin Panel with css selector .cx-ca-header > h1:nth-child(1) is: Content Administration Panel
!-- Open HIT Article menu
When I click on H.I.T. Articles with css selector div.col-sm-3:nth-child(3) > ul:nth-child(2) > li:nth-child(1) > a:nth-child(1)
And I wait until service ready
Then I see H.I.T. Articles Header with css selector h1.ng-binding is: Manage H.I. Tickeron Articles
!-- Create New Article
When I click on Create new link with css selector .cx-btn-create-new
And I wait until service ready
Then I see Create Article Header with css selector h1.ng-binding is: Create Article
When I type %{articleGeneratedTitle} into Title field with css selector #title
And I type Teaser text into Teaser field with css selector #teaser
And I wait small timeout
When I execute javascript scroll(1050, 700)
And I wait small timeout
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
When I add ticker A with css selector #chb34108 in module(choose one of MALL/Start here/Portfolio/Article/Blog): Article
When I add ticker AA with css selector #chb33569 in module(choose one of MALL/Start here/Portfolio/Article/Blog): Article
!-- Add keywords
When I type 10% early withdrawal penalty into Keywords field with css selector #ticker-picker__keywords-input
And I wait big timeout
And I click on 10% early withdrawal penalty with css selector .keyword-picker__item
And I wait small timeout
Then I see keyword item with css selector .btn-default > span:nth-child(1) contains: 10% early withdrawal penalty
And I wait small timeout
When I will execute javascript CKEDITOR.instances.text.setData("Article text filling")
!-- Save
When I click on Save button with css selector .col-sm-2 > button:nth-child(1)
And I wait until service ready
Then I see Article Header with css selector .iexpert-article__header is: %{articleGeneratedTitle}

Scenario:
Edit article
Meta:
@name Edit article
Given I logged in with %{username} and %{password}
!-- Edit article (return to Content Admin -> H.I.T. Articles menu)
When I open COMMUNITY menu
And I open CONTENT ADMIN menu
Then I see Content Admin Panel with css selector .cx-ca-header > h1:nth-child(1)  is: Content Administration Panel
When I click on H.I.T. Articles with css selector div.col-sm-3:nth-child(3) > ul:nth-child(2) > li:nth-child(1) > a:nth-child(1)
And I wait until service ready
Then I see H.I.T. Articles Header with css selector h1.ng-binding is: Manage H.I. Tickeron Articles
!-- Search necessary article
When I type %{articleGeneratedTitle} into Search field with css selector #searchText
And I wait until service ready
!-- Edit
When I click on "Edit" icon with css selector a.btn:nth-child(1) > i:nth-child(1)
And I wait until service ready
Then I see Page header with css selector h1.ng-binding contains: Edit Article
!-- Edit title / teaser / text / remove tickers / remove keywords
When I clear the Title field with css selector #title
When I type %{articleGeneratedTitleEdit} into Title field with css selector #title
And I type _Edit into Teaser field with css selector #teaser
And I will execute javascript CKEDITOR.instances.text.setData("Article text Edit")
And I wait small timeout
When I execute javascript scroll(1050, 700)
And I click on "x" next to 1st ticker with css selector span.label:nth-child(1) > span:nth-child(2) > i:nth-child(1)
And I wait small timeout
And I click on "x" next to 2nd ticker with css selector .cx-tickers__times > i:nth-child(1)
And I wait small timeout
And I click on "x" next to keyword with css selector .fa-times
!-- Save
When I click on Save button with css selector .col-sm-2 > button:nth-child(1)
And I wait until service ready
Then I see Article Header with css selector .iexpert-article__header is: %{articleGeneratedTitleEdit}

Scenario:
Delete article
Meta:
@name Delete article
Given I logged in with %{username} and %{password}
!-- Delete article (return to Content Admin -> H.I.T. Articles menu)
When I open COMMUNITY menu
And I open CONTENT ADMIN menu
Then I see Content Admin Panel with css selector .cx-ca-header > h1:nth-child(1) is: Content Administration Panel
When I click on H.I.T. Articles with css selector div.col-sm-3:nth-child(3) > ul:nth-child(2) > li:nth-child(1) > a:nth-child(1)
And I wait until service ready
Then I see H.I.T. Articles Header with css selector h1.ng-binding is: Manage H.I. Tickeron Articles
!-- Search necessary article
When I type %{articleGeneratedTitleEdit} into Search field with css selector #searchText
And I wait until service ready
!-- Delete
When I click on "delete" icon with css selector tr.ng-scope:nth-child(1) > td:nth-child(4) > a:nth-child(2) > span:nth-child(1)
And I wait small timeout
Then I see confirmation modal with css selector h4.modal-title:nth-child(1) contains: Confirmation
When I click on "Yes" button with css selector button.ng-binding:nth-child(1)
And I wait until service ready
Then I see Inscription with css selector .well > p:nth-child(1) > span:nth-child(1) contains: No data found




