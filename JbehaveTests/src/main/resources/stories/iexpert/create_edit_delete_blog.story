Story: Create, edit and delete blog

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Blog_ + UUID and put it to test param blogGeneratedTitle

Scenario:
Create blog
Meta:
@name Create blog
!-- Open blog page
Given I logged in with %{username} and %{password}
When I open COMMUNITY menu
!-- Open blog page
When I click on blog left menu with css selector #community__menu__blogs-link
Then I see blog page header with css selector .social-title > h1:nth-child(1) is: Blog posts
!-- Create blog
When I click on Create Post button with css selector .btn-secondary-sm
And I wait until service ready
When I type %{blogGeneratedTitle} into blog title input with css selector input.ng-invalid
!-- # Wait until tickers list will be loaded
!--/*
And I click on ticker selection input with css selector #filterInput
And I will wait until ticker element element with css selector #chb34108 will be visible
!-- # Tickers list appears. Add two tickers
And I start recording action
And I will move in action to A ticker checkbox element with css selector #chb34108
And I will click in action on A ticker checkbox element with css selector #chb34108
And I will move in action to AA ticker checkbox element with css selector #chb33569
And I will click in action on AA ticker checkbox element with css selector #chb33569
!-- And I will move in action to AAPL ticker checkbox element with css selector #chb33807
!-- And I will click in action on AAPL ticker checkbox element with css selector #chb33807
Then I perform previously recorded action
!--*/
When I add ticker A with css selector #chb34108 in module(choose one of MALL/Start here/Portfolio/Article/Blog): Blog
When I add ticker AA with css selector #chb33569 in module(choose one of MALL/Start here/Portfolio/Article/Blog): Blog
When I wait big timeout
!-- And I click on Add button with css selector .ticker-picker-add-button
And I wait small timeout
!-- Write main text
And I will execute javascript CKEDITOR.instances.text.setData("Some interesting info in my blog")
!-- Save blog
And I wait small timeout
And I click on save button with css selector .blog-post-form__buttons > button:nth-child(1)
And I wait until service ready
Given Do nothing

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.contentadmin.username
Given Set test param password value from property param.contentadmin.password

Scenario:
As CONTENT ADMIN Approve blog
Meta:
@name As CONTENT ADMIN Approve blog
!-- Open blog page
Given I logged in with %{username} and %{password}
When I open COMMUNITY menu
And I open CONTENT ADMIN menu
And I click on Moderate user content with css selector li.list-group-item:nth-child(7) > a:nth-child(1)
And I wait until service ready
Then I see header of page with css selector h1.ng-binding contains: Moderate
When I click on moderate icon with css selector button.btn-link
And I wait until service ready
!-- And I click on button Approve with containsText selector Approve
And I click on button Approve with css selector button[ng-click='approve()']
Then I see toaster with css selector .toast contains: Done!


Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Edit blog
Meta:
@name Edit blog
Given I logged in with %{username} and %{password}
When I open COMMUNITY menu
!-- Open blog page
When I click on blog left menu with css selector #community__menu__blogs-link
Then I see blog page header with css selector .social-title > h1:nth-child(1) is: Blog posts
!-- Edit blog
When I wait small timeout
And I click on blog with containsText selector %{blogGeneratedTitle}
When I click on link Edit with css selector .btn-edit-icon
!-- change blog title and main text
And I wait until service ready
When I will execute javascript CKEDITOR.instances.text.setData("some interesting info in my edit blog 2")
!-- Save blog
When I wait small timeout
And I click on save button with css selector .blog-post-form__buttons > button:nth-child(1)
And I wait until service ready
Given Do nothing

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.contentadmin.username
Given Set test param password value from property param.contentadmin.password

Scenario: As CONTENT ADMIN Approve blog
GivenStories:
    stories/iexpert/create_edit_delete_blog.story#{name:As CONTENT ADMIN Approve blog},
Given Do nothing

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Delete blog
Meta:
@name Delete blog
!-- Delete blog
Given I logged in with %{username} and %{password}
When I open COMMUNITY menu
And I wait until service ready
!-- Open blog page
When I click on blog left menu with css selector .cx-content-menu__icon__blog
Then I see blog page header with css selector .social-title > h1:nth-child(1) is: Blog posts
When I click on blog header with containsText selector %{blogGeneratedTitle}
When I click on link Delete with css selector .btn-delete-icon
Then I see Attention with css selector div.ng-binding:nth-child(2) is: This operation can not be undone. Are you sure you want to delete this post?
When I click on button Yes with css selector button.ng-binding:nth-child(1)
And I wait small timeout
Given Do nothing

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario: Work with blog as expert user
GivenStories:
    stories/iexpert/create_edit_delete_blog.story#{name:Create blog},
Given Do nothing

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.contentadmin.username
Given Set test param password value from property param.contentadmin.password

Scenario: As CONTENT ADMIN Approve blog
GivenStories:
    stories/iexpert/create_edit_delete_blog.story#{name:As CONTENT ADMIN Approve blog},
Given Do nothing

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario: Work with blog as expert user
GivenStories:
    stories/iexpert/create_edit_delete_blog.story#{name:Edit blog},
Given Do nothing

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.contentadmin.username
Given Set test param password value from property param.contentadmin.password

Scenario: As CONTENT ADMIN Approve blog
GivenStories:
    stories/iexpert/create_edit_delete_blog.story#{name:As CONTENT ADMIN Approve blog},
Given Do nothing


Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario: Work with blog as expert user
GivenStories:
    stories/iexpert/create_edit_delete_blog.story#{name:Delete blog}
Given Do nothing

