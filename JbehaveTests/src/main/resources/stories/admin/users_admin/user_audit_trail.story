Story: User Audit Trail page

Narrative:
I am a User admin
I want to check "User Audit Trail" page

Scenario:
Setup params. Checks "User Audit Trail" page as user admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
And Set test param password value from property param.accountadmin.password

Scenario: Checks "User Audit Trail" page
Meta:
@name Checks "User Audit Trail" page
GivenStories:
  stories/login/admin_login.story#{name:Login to admin interface as account admin}
Given Do nothing

!-- Go to User Audit Trail page
When I click on Users menu with link selector Users
And I click on Audit trail menu  with link selector Audit trail
Then I see top of page with css selector div.col-sm-12:nth-child(1) > h1:nth-child(1) is: User Audit Trail
And I wait big timeout
Then I see an inscription at the bottom of the page with css selector .text-center > p:nth-child(1) contains: Please select event types
!-- Change date
When I clear the Data field with css selector #fromDate
And I type 12/15/2004 into User field with css selector #fromDate
!-- Choose user
And I click on field User with css selector input.ng-isolate-scope
And I type Advisor A into User field with css selector input.ng-isolate-scope
And I wait small timeout
And I click on user from drop-down list with css selector a.ng-binding > strong:nth-child(1)
!-- Click on checkbox "SelectAll" and click on Search button
And I click on Select all with css selector #SelectAll
And I wait small timeout
And I click on Search button with css selector .btn
And I wait big timeout
Then I see search results with css selector .text-center > p:nth-child(1) contains:  No Events Found
