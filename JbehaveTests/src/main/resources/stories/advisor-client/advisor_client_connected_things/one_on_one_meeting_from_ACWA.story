Story: Create and check 1-on 1 meeting with connected client on ACWA page

Scenario:
Setup params. Set user to beginner
Given Set test param client_username value from property param.intermediate.username
Given Set test param client_password value from property param.intermediate.password
Given Set test param advisor_username value from property param.advisor.username
Given Set test param advisor_password value from property param.advisor.password
Given Set test param clientName with value Mike In.
Given Set test param advisorName with value James Adv.
And I generate Personal + UUID and put it to test param portfolioGenerated
And I generate UUID + @catch01.tickerontest.com and put it to test param generatedEmail

Scenario:
As Advisor create 1-on 1 meeting with connected client on ACWA page
Meta:
@name As Advisor create 1-on 1 meeting with connected client
Given I logged in with %{advisor_username} and %{advisor_password}
When I wait until service ready
And I open CLIENTS menu
And I click on tab connections with css selector .tabs-left > li:nth-child(2)
And I wait until service ready
And I click on clients name with containsText selector %{clientName}
And I wait until service ready
Then I see header ACWA page with css selector h1.pull-left contains: Advisor-Client Private Work Area
When I click on Schedule with css selector div.pull-right > button:nth-child(1)
And I wait until service ready
Then I see header My 1-on-1 meetings schedule with css selector .ac-title contains: My 1-on-1 meeting schedule
When Webcast. Select free time
When Webcast. Select free time to end of day
When Webcast. Unselect first free slot
And I wait small timeout
And I click on Add button with xpath selector //button[contains(., 'Add')]
!-- Check it on ACWA page
And I wait small timeout
When I open FIND NEW CLIENTS menu
And I click on tab connections with css selector .tabs-left > li:nth-child(2)
And I wait until service ready
And I click on clients name with containsText selector %{clientName}
And I wait until service ready
Then I see client name in list of webcasts with css selector div.mCustomScrollbar:nth-child(3) > div:nth-child(1) > div:nth-child(1) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(2) contains: %{clientName}


Scenario:
As Client check 1-on 1 meeting with connected client
Meta:
@name As Client check 1-on 1 meeting with connected client
Given I logged in with %{client_username} and %{client_password}
When I wait until service ready
And I open ADVISORS menu
And I open 1-on-1 menu on Client side
Then I see Advisor name with css selector .table > tbody:nth-child(1) > tr:nth-child(3) > td:nth-child(3) > span:nth-child(1) > a:nth-child(1) contains: %{advisorName}
When I click on Advisor with css selector .table > tbody:nth-child(1) > tr:nth-child(3) > td:nth-child(3) > span:nth-child(1) > a:nth-child(1)
And I wait until service ready
And I click on ACWA page in left menu with css selector .cx-content-menu__icon__member
And I wait until service ready
Then I see Advisor name with css selector tr.ng-scope:nth-child(1) > td:nth-child(2) contains: %{advisorName}
And I wait big timeout
When I open Notifications (click on BELL) page
Then I check Notification with css selector tr.ng-scope:nth-child(1) > td:nth-child(3) > span:nth-child(1) contains Reminder. Your 1-on-1 Meeting Starts Soon or contains Advisor James Adv. Created 1-on-1 Meeting with
When I execute javascript $("a[class*='cx-wall-table__more ng-scope']:first").click()
Then I check message with css selector .cx-wall-table__content contains Your 1-on-1 meeting with Advisor James Adv. or contains The Advisor James Adv. created a 1-on-1 meeting
