Story: Admin can create users accounts (All levels)


Narrative:
As a user admin
I want to create user account

Scenario:
Setup params. Set user to account admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
And Set test param password value from property param.accountadmin.password
And I generate Advisor_name_ + UUID and put it to test param accountAdvisorGeneratedName
And I generate Expert_name_ + UUID and put it to test param accountExpertGeneratedName
And I generate Interm_name_ + UUID and put it to test param accountIntermGeneratedName
And I generate Beg_name_ + UUID and put it to test param accountBeginnerGeneratedName
And I generate UUID + @portfoliodirect.com and put it to test param AdviserGeneratedEmail
And I generate UUID + @portfoliodirect.com and put it to test param ExpertGeneratedEmail
And I generate UUID + @portfoliodirect.com and put it to test param IntermedGeneratedEmail
And I generate UUID + @portfoliodirect.com and put it to test param BeginnerGeneratedEmail


Scenario: Login as Admin
Meta:
@name Create a new Advisor
GivenStories:
    stories/login/admin_login.story#{name:Login to admin interface as account admin}
Given Do nothing
!-- Create a new Advisor
When I click on "Users"  with css selector #admin__menu__user
And I click on "Manage user accounts" with link selector Manage user accounts
And I wait small timeout
When I click on "Create New User" button with css selector a.btn
And I wait small timeout
When I type %{AdviserGeneratedEmail} into E-mail input field with css selector #email
And I wait small timeout
When I type %{accountAdvisorGeneratedName} into Public name input field with css selector #publicName
And I wait small timeout
And I type First name  into field with css selector #firstName
And I wait small timeout
And I type Last name into field  with css selector #lastName
And I wait small timeout
And I type Advisor into drop-down with css selector #level
And I wait small timeout
And I type Qwerty12345 into Password with css selector #password
And I wait small timeout
And I type Qwerty12345 into Retype Pass with css selector #passwordVerify
And I wait small timeout
And I execute javascript $(".btn").attr("disabled", false)
And I click on "Save" button with css selector .btn
And I wait small timeout
Then I see toaster with xpath selector .//*[@id='toast-container']/div is: User account was successfully created!
When I wait small timeout

Scenario: Create a new Expert, login as admin
Meta:
@name Create a new Expert
Given I set all permissions for account admin if they are not set
!-- Create a new Expert
When I click on "Users"  with css selector #admin__menu__user
And I click on "Manage user accounts" with link selector Manage user accounts
And I wait small timeout
When I click on "Create New User" button with css selector a.btn
And I wait small timeout
When I clear the E-mail with css selector #email
When I type %{ExpertGeneratedEmail} into E-mail input field with css selector #email
And I wait small timeout
When I type %{accountExpertGeneratedName} into Public name input field with css selector #publicName
And I wait small timeout
And I type First name  into field with css selector #firstName
When I wait small timeout
And I type Last name into field  with css selector #lastName
When I wait small timeout
And I type Expert into drop-down with css selector #level
When I wait small timeout
And I type Qwerty12345 into Password with css selector #password
When I wait small timeout
And I type Qwerty12345 into Retype Pass with css selector #passwordVerify
When I wait small timeout
And I execute javascript $(".btn").attr("disabled", false)
And I click on "Save" button with css selector .btn
And I wait small timeout
Then I see toaster with xpath selector .//*[@id='toast-container']/div is: User account was successfully created!
When I wait small timeout

Scenario: Create a new Intermediate, login as admin
Meta:
@name Create a new Intermediate
Given I set all permissions for account admin if they are not set
!-- Create a new Intermediate
When I click on "Users"  with css selector #admin__menu__user
And I click on "Manage user accounts" with link selector Manage user accounts
And I wait small timeout
When I click on "Create New User" button with css selector a.btn
And I wait small timeout
When I type %{IntermedGeneratedEmail} into E-mail input field with css selector #email
And I wait small timeout
When I type %{accountIntermGeneratedName} into Public name input field with css selector #publicName
And I wait small timeout
And I type First name  into field with css selector #firstName
When I wait small timeout
And I type Last name into field  with css selector #lastName
When I wait small timeout
And I type Intermediate into drop-down with css selector #level
And I wait small timeout
And I type Qwerty12345 into Password with css selector #password
When I wait small timeout
And I type Qwerty12345 into Retype Pass with css selector #passwordVerify
And I wait small timeout
And I execute javascript $(".btn").attr("disabled", false)
And I click on "Save" button with css selector .btn
And I wait small timeout
Then I see toaster with xpath selector .//*[@id='toast-container']/div is: User account was successfully created!
When I wait small timeout

Scenario: Create a new Beginner, login as admin
Meta:
@name Create a new Beginner
Given I set all permissions for account admin if they are not set
!-- Create a new Beginner
When I click on "Users"  with css selector #admin__menu__user
And I click on "Manage user accounts" with link selector Manage user accounts
And I wait small timeout
When I click on "Create New User" button with css selector a.btn
And I wait small timeout
When I type %{BeginnerGeneratedEmail} into E-mail input field with css selector #email
And I wait small timeout
When I type %{accountBeginnerGeneratedName} into Public name input field with css selector #publicName
And I wait small timeout
And I type First name  into field with css selector #firstName
When I wait small timeout
And I type Last name into field  with css selector #lastName
When I wait small timeout
And I type Beginner into drop-down with css selector #level
When I wait small timeout
And I type Qwerty12345 into Password with css selector #password
When I wait small timeout
And I type Qwerty12345 into Retype Pass with css selector #passwordVerify
And I wait small timeout
And I execute javascript $(".btn").attr("disabled", false)
And I click on "Save" button with css selector .btn
And I wait small timeout
Then I see toaster with xpath selector .//*[@id='toast-container']/div is: User account was successfully created!
When I wait small timeout
