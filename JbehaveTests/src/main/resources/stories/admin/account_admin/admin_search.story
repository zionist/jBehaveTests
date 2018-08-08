Story: Searching from account admin works correctly

Scenario:
Setup params. Set user to account admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
And Set test param password value from property param.accountadmin.password
And I generate Admin-Full_ + UUID and put it to test param accountAdminGeneratedName
And I generate UUID + @catch01.tickerontest.com and put it to test param accountAdminGeneratedEmail
And Set test param accountAdminPassword with value Qwerty12345


Scenario: Create user as account admin
Meta:
@name Create user as account admin
GivenStories:
    stories/admin/account_admin/create_edit_admin.story#{name:Create admin user as account admin}
Given Do nothing
!-- Find a new account using field of search and check that it's really new account
When I type %{accountAdminGeneratedName} into search by full name input field with css selector .form-control
When I wait small timeout
When I click on full name with link selector %{accountAdminGeneratedName}