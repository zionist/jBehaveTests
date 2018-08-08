Story: Admin login

Narrative:
As account admin user
I want to login to admin interface

Scenario:
Setup params. Set user to account admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
And Set test param password value from property param.accountadmin.password

Scenario: Login to admin interface as account admin
Meta:
@name Login to admin interface as account admin
GivenStories:
    stories/login/admin_login.story#{name:Login to admin interface as account admin and set permition}
Given Do nothing
When I will refresh the page
When I wait until service ready
And I type %{username} into email input field with css selector input.ng-valid-email
When I wait until service ready
And I type %{password} into password input field with css selector div.form-group:nth-child(2) > input:nth-child(1)
When I wait until service ready
And I click on "Login" button with css selector #admin__login-form__login-button
And I wait small timeout
Then I see page text header with css selector .col-md-12 > h1:nth-child(1) is Hello, admin!


Scenario: Login to admin interface as account admin and set permition
Meta:
@name Login to admin interface as account admin and set permition
Given Browser ready
Given I open admin url
When I wait until service ready
And I type %{username} into email input field with css selector input.ng-valid-email
When I wait until service ready
And I type %{password} into password input field with css selector div.form-group:nth-child(2) > input:nth-child(1)
When I wait until service ready
And I click on "Login" button with css selector #admin__login-form__login-button
And I wait small timeout
Then I see page text header with css selector .col-md-12 > h1:nth-child(1) is Hello, admin!
Given I set all permissions for account admin if they are not set


