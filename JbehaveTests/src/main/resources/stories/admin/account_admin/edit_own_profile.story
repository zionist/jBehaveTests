Story: Edit account admin own permissions

Narrative:
As a account admin user
I want to edit own profile

Scenario:
Setup params. Set user to account admin
Given Set test param username value from property param.accountadmin.username
And Set test param password value from property param.accountadmin.password
!-- params for Create user as account admin test
And I generate account_admin_ + UUID and put it to test param accountAdminGeneratedName
And I generate UUID + @catch01.tickerontest.com and put it to test param accountAdminGeneratedEmail
And Set test param accountAdminPassword with value Qwerty12345
!-- params for self account update
And I generate account_admin_updated + UUID and put it to test param accountAdminGeneratedNameUpdated
And I generate UUID + @catch01.tickerontest.com and put it to test param accountAdminGeneratedEmailUpdated
And Set test param accountAdminPasswordUpdated with value Qwerty12345

Scenario: Create new account admin. Login from him
Meta:
GivenStories:
    stories/admin/account_admin/create_edit_admin.story#{name:Create admin user as account admin}
Given Do nothing
!-- Login from created new account admin
Given Reset browser
And I open admin url
When I wait until service ready
And I type %{accountAdminGeneratedEmail} into email input field with css selector input.ng-valid-email
And I type %{accountAdminPassword} into password input field with css selector div.form-group:nth-child(2) > input:nth-child(1)
And I click on "Login" button with css selector #admin__login-form__login-button
And I wait small timeout
Then I see page text header with css selector .col-md-12 > h1:nth-child(1) is Hello, admin!

Scenario: Edit self permisions
When I click on admin accounts top menu  with css selector #admin__menu__admin-accounts
And I wait until service ready
When I type %{accountAdminGeneratedName} into searching form with css selector .form-control
And I wait small timeout
And I click on Admin name with css selector .account-name
And I wait small timeout
!-- unmark all checkboxes except account admin checkbox
When I execute javascript $("input[ng-model*='account.Roles.IsContentAdmin']").click()
When I execute javascript $("input[ng-model*='account.Roles.IsSystemAdmin']").click()
When I execute javascript $("input[ng-model*='account.Roles.IsUserAdmin']").click()
When I execute javascript $("input[ng-model*='account.Roles.IsDataAdmin']").click()
When I execute javascript $("input[ng-model*='account.Roles.IsMallAdmin']").click()
When I execute javascript $("input[ng-model*='account.Roles.IsFinancialAdmin']").click()
When I execute javascript $("input[ng-model*='account.Roles.IsAdminAccountsAdmin']").click()
When I execute javascript $("input[ng-model*='account.Roles.IsPatternAdmin']").click()
When I execute javascript $("input[ng-model*='account.Roles.IsManager']").click()
And I wait small timeout
And I click on Update button with css selector button.btn:nth-child(2)
!-- checking toastr
!-- Then I see toaster with css selector .toast-message is: Admin account updated
Then I see warning dialog window with css selector .text-center > p:nth-child(1) is:
You will loose permission to administer admin accounts. You will not be able to re-enable this later. Are you sure you want to continue?
And I wait small timeout
!-- unmark account admin checkbox
!-- When I execute javascript $("input[ng-model*='account.Roles.IsAdminAccountsAdmin']").click()
!-- And I click on Update button with css selector button.btn:nth-child(2)
!-- Check warning dialog appears
Then I see warning dialog window with css selector .text-center > p:nth-child(1) is:
You will loose permission to administer admin accounts. You will not be able to re-enable this later. Are you sure you want to continue?
When I click on "No" button with css selector button.btn:nth-child(2)
!-- Check account admin checkbox
When I execute javascript $("input[ng-model*='account.Roles.IsAdminAccountsAdmin']").click()
!-- Change own Full name, Email, set new password
When I clear the Full name input with css selector input[ng-model='account.FullName']
When I type %{accountAdminGeneratedNameUpdated} into Full name unput with css selector input[ng-model='account.FullName']
When I clear the Email imput with css selector input[ng-model='account.Email']
When I type %{accountAdminGeneratedEmailUpdated} into Email imput with css selector input[ng-model='account.Email']
When I clear the Reset password with css selector input[ng-model='account.Password']
When I type %{accountAdminPasswordUpdated} into Reset password with css selector input[ng-model='account.Password']
And I wait small timeout
And I click on Update button with css selector button.btn:nth-child(2)
And I wait until service ready
And I accept alert when update Admin account
!-- checking toaster and user name is changed
!-- Then I see toaster with css selector .toast-message is: Admin account updated
Then I see login form with css selector .navbar-brand is Tickeron Admin

Scenario: Login from user with updated username and password
Given Reset browser
And I open admin url
When I wait until service ready
And I type %{accountAdminGeneratedEmailUpdated} into email input field with css selector input.ng-valid-email
And I type %{accountAdminPasswordUpdated} into password input field with css selector div.form-group:nth-child(2) > input:nth-child(1)
And I wait small timeout
And I click on "Login" button with css selector #admin__login-form__login-button
And I wait small timeout
Then I see page text header with css selector .col-md-12 > h1:nth-child(1) is Hello, admin!
