Story: Check that user can delete profile

Scenario:
Setup params. Set user to account admin
Given Set test param username value from property param.accountadmin.username
And Set test param password value from property param.accountadmin.password
And I generate Beg_name_ + UUID and put it to test param accountBeginnerGeneratedName
And I generate UUID + @catch01.tickerontest.com and put it to test param BeginnerGeneratedEmail
Given Set test param password2 with value Qwerty12345

Scenario: Create beginner user
Meta:
@name Create beginner user
GivenStories:
    stories/login/admin_login.story#{name:Login to admin interface as account admin}
Given Do nothing
!-- Create a new beginner
When I click on "Users"  with css selector li.ng-scope:nth-child(2) > a:nth-child(1)
And I click on "Manage user accounts" with link selector Manage Accounts
And I wait small timeout
When I click on "Create New User" button with css selector a.btn
And I wait small timeout
When I type %{BeginnerGeneratedEmail} into E-mail input field with css selector #email
!-- When I type %{accountBeginnerGeneratedName} into Public name input field with css selector #publicName
And I type First name  into field with css selector #firstName
And I type Last name into field  with css selector #lastName
And I type %{password2} into Password with css selector #password
And I type %{password2} into Retype Pass with css selector #passwordVerify
And I execute javascript $(".btn").attr("disabled", false)
And I click on "Save" button with css selector .btn
When I wait small timeout
Given Do nothing

Scenario:
Check that user can delete profile
Meta:
@name User delete profile
Given I logged in with %{BeginnerGeneratedEmail} and %{password2}
!-- Personal Profile
When I click on Avatar with css selector .cx-page-header__first-level__username
And I click on profile with css selector a.dropdown-item:nth-child(1)
And I wait until service ready
!-- Delete page
When I click on page "Delete Profile" with css selector li.nav-item:nth-child(10) > a:nth-child(1) > span:nth-child(2)
Then I see page header with css selector .profile-page-content > div:nth-child(1) > div:nth-child(1) > h1:nth-child(1) contains: Deactivate Account
And I wait small timeout
When I click on button "Delete account" with css selector .btn-danger
And I wait small timeout
Then I see pop-up warning  with css selector div.ng-binding:nth-child(2) contains: Are you sure you want to deactivate your account?
When I click on button "Yes" with css selector button.ng-binding:nth-child(1)
And I wait big timeout
Then I see element Tickeron pre-login page with css selector .header-logo-img has class header-logo-img
Given Do nothing

Scenario:
Check that user account is unavailable
Meta:
@name User can not login
Given I logged in with %{BeginnerGeneratedEmail} and %{password2}
When I wait small timeout
Then I see warning message with css selector .alert contains: You have entered an invalid/deactivated username or password.

