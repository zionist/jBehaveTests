Story: Score tables page

Narrative:
As a data admin
I want to check "Score tables" page

Scenario:
Setup params. Checks "Score tables" page as data admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
And Set test param password value from property param.accountadmin.password

Scenario: Checks "Score tables" page
Meta:
@name Checks "Score tables" page
GivenStories:
    stories/login/admin_login.story#{name:Login to admin interface as account admin}
Given Do nothing
!-- Go to Score tables page
When I click on Data menu with link selector Data
And I click on Score tables menu  with link selector Score tables
Then I see top of page with css selector h1.ng-scope is: Score Tables
And I wait big timeout
And I see Conservative Allocation with css selector tr.ng-scope:nth-child(4) > td:nth-child(5) > span:nth-child(1) contains: 15.25
!-- Change Market Value parameters
When I click on Market Value filter with css selector div.form-group:nth-child(2) > div:nth-child(2) > select:nth-child(1)
And I click on change Market Value with css selector div.form-group:nth-child(2) > div:nth-child(2) > select:nth-child(1) > option:nth-child(4)
And I wait small timeout
!-- Change Cash Reserves  parameters
And I click on Cash Reserves filter with css selector div.form-group:nth-child(3) > div:nth-child(2) > select:nth-child(1)
And I click on change Cash Reserves with css selector div.form-group:nth-child(3) > div:nth-child(2) > select:nth-child(1) > option:nth-child(2)
And I wait small timeout
!-- Change Risk Level  parameters
And I click on Risk Level filter with css selector div.form-group:nth-child(1) > div:nth-child(4) > select:nth-child(1)
And I click on change Risk Level with css selector div.form-group:nth-child(1) > div:nth-child(4) > select:nth-child(1) > option:nth-child(2)
And I wait small timeout
!-- Change Years till Withdrawal  parameters
And I click on Years till Withdrawal filter with css selector div.form-group:nth-child(3) > div:nth-child(4) > select:nth-child(1)
And I click on change Years till Withdrawal with css selector div.form-group:nth-child(3) > div:nth-child(4) > select:nth-child(1) > option:nth-child(3)
And I wait small timeout
Then I see Conservative Allocation with css selector tr.ng-scope:nth-child(4) > td:nth-child(5) > span:nth-child(1) contains: 4.8
