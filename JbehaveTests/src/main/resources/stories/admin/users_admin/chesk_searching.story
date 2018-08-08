
Story: As User Admin checks searching by Public Name / Email / Portfolio Count / Level

Scenario:
Setup params. Set user to account admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
And Set test param password value from property param.accountadmin.password
And Set test param searchUsername value from property param.advisor.username

Scenario:
Check searching
Meta:
@name Check searching
GivenStories:
    stories/login/admin_login.story#{name:Login to admin interface as account admin}
Given Do nothing

!-- As User Admin opens "User Accounts" page
When I click on "Users" with link selector Users
When I click on "Manage user accounts" with link selector Manage user accounts
And I wait until service ready
Then I see page header with css selector .col-md-12 > h1:nth-child(1) is: User accounts

!-- Check searching by Public Name
When I type James Adv. into "Public Name" input field with css selector #publicName
And I wait small timeout
Then I see search result with css selector div.break-word:nth-child(1) is: James Adv.
When I clear the Public name with css selector #publicName

!-- Check searching by email
When I type %{searchUsername} into "Email" input field with css selector #userName
And I wait small timeout
Then I see search result with css selector div.break-word:nth-child(2) is: %{searchUsername}
When I clear the Email with css selector #userName

!-- Check searching by Portfolio count
!-- When I type 13 into "Portfolio count" input field with css selector #portfoliosCount
!-- And I wait small timeout
!-- Then I see search result with css selector div.break-word:nth-child(4) is: 13
!-- When I clear the Portfolio count with css selector #portfoliosCount

!-- Check searching by levels
!-- Intermediate
When I click on "Intermediate" level with css selector label.filter-item:nth-child(4)
And I wait small timeout
Then I see First user on the page with css selector div.ng-scope:nth-child(3) > div:nth-child(3) > span:nth-child(1) is: Intermediate
!-- Expert
When I click on "Expert" level with css selector label.filter-item:nth-child(5)
And I wait small timeout
Then I see First user on the page with css selector div.ng-scope:nth-child(3) > div:nth-child(3) > span:nth-child(1) is: Expert
!-- Advisor
When I click on "Advisor" level with css selector label.filter-item:nth-child(6)
And I wait small timeout
Then I see First user on the page with css selector div.ng-scope:nth-child(3) > div:nth-child(3) > span:nth-child(1) is: Advisor


