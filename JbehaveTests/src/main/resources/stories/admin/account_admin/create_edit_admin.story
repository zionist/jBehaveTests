Story: Create and edit admin account

Narrative:
As a account admin user
I want to create and edit admin user using admin interface

Scenario:
Setup params. Set user to account admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
And Set test param password value from property param.accountadmin.password
And I generate Admin-Full_ + UUID and put it to test param accountAdminGeneratedName
And I generate UUID + @catch01.tickerontest.com and put it to test param accountAdminGeneratedEmail
And Set test param accountAdminPassword with value Qwerty12345


Scenario: Create admin user as account admin
Meta:
@name Create admin user as account admin
GivenStories:
    stories/login/admin_login.story#{name:Login to admin interface as account admin}
Given Do nothing

When I click on admin accounts top menu  with css selector #admin__menu__admin-accounts
And I wait until service ready
And I click on create new account button with css selector #admin__admin-accounts-create-new-button
And I wait until service ready
Then I see header with css selector .form > h1:nth-child(1) is: Create new administrator account
When I type %{accountAdminGeneratedName} into Full name input field with css selector input[ng-model='model.fullName']
And I wait until service ready
And I type %{accountAdminGeneratedEmail} into E-mail input field with css selector input[ng-model='model.email']
And I wait until service ready
And I type %{accountAdminPassword} into Password  with css selector input[ng-model='model.password']
And I wait until service ready
!-- mark checkboxes
When I execute javascript $("input[ng-model*='model.roles.isContentAdmin']").click()
When I execute javascript $("input[ng-model*='model.roles.isSystemAdmin']").click()
When I execute javascript $("input[ng-model*='model.roles.isUserAdmin']").click()
When I execute javascript $("input[ng-model*='model.roles.isDataAdmin']").click()
When I execute javascript $("input[ng-model*='model.roles.isMallAdmin']").click()
When I execute javascript $("input[ng-model*='model.roles.isFinancialAdmin']").click()
When I execute javascript $("input[ng-model*='model.roles.IsAdminAccountsAdmin']").click()
When I execute javascript $("input[ng-model*='model.roles.isPatternAdmin']").click()
When I execute javascript $("input[ng-model*='model.roles.isManager']").click()
And I wait until service ready
And I click on create button with css selector button[ng-click='createAccount()']
And I wait until service ready

Scenario: Edit user as account admin
Meta:
@name Edit user as account admin
!-- open just created admin
When I click on admin accounts top menu  with css selector #admin__menu__admin-accounts
And I wait until service ready
And I type %{accountAdminGeneratedName} into searching form with css selector .form-control
And I wait until service ready
And I click on Admin name with link selector %{accountAdminGeneratedName}
And I wait until service ready
!-- unmark checkboxed
!-- When I execute javascript $("input[ng-model*='account.Roles.IsContentAdmin']").click()
When I execute javascript $("input[ng-model*='account.Roles.IsSystemAdmin']").click()
When I execute javascript $("input[ng-model*='account.Roles.IsUserAdmin']").click()
When I execute javascript $("input[ng-model*='account.Roles.IsDataAdmin']").click()
When I execute javascript $("input[ng-model*='account.Roles.IsMallAdmin']").click()
When I execute javascript $("input[ng-model*='account.Roles.IsFinancialAdmin']").click()
When I execute javascript $("input[ng-model*='account.Roles.IsAdminAccountsAdmin']").click()
When I execute javascript $("input[ng-model*='account.Roles.IsPatternAdmin']").click()
When I execute javascript $("input[ng-model*='account.Roles.IsManager']").click()
And I wait until service ready
And I click on Update button with css selector button.btn:nth-child(2)
!-- checking toastr
Then I see toaster with css selector .toast-message is: Admin account updated



