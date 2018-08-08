Story: as System Admin checks Configuration settings page

Scenario:
Setup params. Set user to account admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
And Set test param password value from property param.accountadmin.password

Scenario: Check Configuration settings
Meta:
@name Check Configuration settings
GivenStories:
    stories/login/admin_login.story#{name:Login to admin interface as account admin}
Given Do nothing

!-- As System Admin opens "App config settings" page
When I click on "System" with link selector System
When I click on "Confiquration settings" with link selector Configuration settings
And I wait big timeout
Then I see page header with css selector div.row:nth-child(1) > div:nth-child(1) > h1:nth-child(1) is: Application configuration settings

!-- Check SMTP settings
When I type Test@portfoliodirect.com into "Email Recipient" input field with css selector .form-control
When I click on "Test SMTP settings" button with css selector button.btn:nth-child(3)
And I wait big timeout
Then I see inscription with css selector p.form-control-static:nth-child(1) is: Message sent, check your email client

!-- Later we will add additional checking of email here

!-- Check Mongo connection
When I click on "Test!" button with css selector button.btn:nth-child(1)
And I wait big timeout
Then I see inscription with css selector .form-control-static is: Ok

!-- Check of "Tickeron Settings" table
And I see Table header (1st column) with css selector div.ng-scope:nth-child(3) > div:nth-child(1) > div:nth-child(2) > table:nth-child(1) > thead:nth-child(1) > tr:nth-child(1) > th:nth-child(1) is: Key
And I see Table header (2nd column) with css selector div.ng-scope:nth-child(3) > div:nth-child(1) > div:nth-child(2) > table:nth-child(1) > thead:nth-child(1) > tr:nth-child(1) > th:nth-child(2) is: Value
And I see 4 line (1st column) with css selector div.ng-scope:nth-child(3) > div:nth-child(1) > div:nth-child(2) > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(5) > td:nth-child(1) is: Stripe.AccountName
And I see 4 line (2nd column) with css selector div.ng-scope:nth-child(3) > div:nth-child(1) > div:nth-child(2) > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(5) > td:nth-child(2) is: Debug
And I wait big timeout