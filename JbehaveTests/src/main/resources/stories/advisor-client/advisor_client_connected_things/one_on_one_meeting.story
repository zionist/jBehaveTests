Story: Create and check 1-on 1 meeting with connected client

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
As Advisor create 1-on 1 meeting with connected client
Meta:
@name As Advisor create 1-on 1 meeting with connected client
Given I logged in with %{advisor_username} and %{advisor_password}
When I wait until service ready
!-- Open Advisor/Client menu
And I open CLIENTS menu
And I wait until service ready
And I open 1-on-1 menu on Advisor side
And I wait until service ready
!-- Add 1-on-1 meeting for client Mike In.
Then I see header of page with css selector .ac-title contains: My 1-on-1 meeting schedule
!-- When Webcast. Click on right 5 times
And I wait small timeout
!-- And I click on date in future with css selector tr.ng-scope:nth-child(2) > td:nth-child(6)
!-- And I wait small timeout
When Webcast. Select free time
When Webcast. Select free time to end of day
When Webcast. Unselect first free slot
And I wait small timeout
And I type Mike  into search fild with css selector .form-control
And I type  In. into search fild with css selector .form-control

And I wait until service ready
And I wait small timeout
And I click on Mike In. with css selector li.active
And I wait small timeout
And I click on Add button with xpath selector //button[contains(., 'Add')]
!-- And I click on Add button with css selector .table > tbody:nth-child(1) > tr:nth-child(3) > td:nth-child(4) > button:nth-child(1)

!-- And I save text from time of meeting element with css selector .table > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(2) > span:nth-child(1) to variable %{TimeSaved}
!-- Check it on ACWA page
And I wait small timeout
When I open FIND NEW CLIENTS menu
And I wait until service ready
And I click on tab connections with css selector .tabs-left > li:nth-child(2)
And I wait until service ready
And I wait small timeout
And I click on clients name with containsText selector %{clientName}
And I wait until service ready
Then I see client name in list of webcasts with css selector div.mCustomScrollbar:nth-child(3) > div:nth-child(1) > div:nth-child(1) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(2) contains: %{clientName}
!-- Then I see text element with css selector tr.ng-scope:nth-child(1) > td:nth-child(1) contains: %{TimeSaved}


Scenario:
As Client check 1-on 1 meeting with connected client
Meta:
@name As Client check 1-on 1 meeting with connected client
Given I logged in with %{client_username} and %{client_password}
When I wait until service ready
And I open ADVISORS menu
And I wait until service ready
And I open 1-on-1 menu on Client side
And I wait until service ready
!-- When Webcast. Click on right 5 times
And I wait small timeout
!-- And I click on date in future with css selector tr.ng-scope:nth-child(2) > td:nth-child(6)
And I wait small timeout
Then I see Advisor name with css selector .table > tbody:nth-child(1) > tr:nth-child(3) > td:nth-child(3) > span:nth-child(1) > a:nth-child(1) contains: %{advisorName}
When I click on Advisor with css selector .table > tbody:nth-child(1) > tr:nth-child(3) > td:nth-child(3) > span:nth-child(1) > a:nth-child(1)
And I wait until service ready
And I click on ACWA page in left menu with css selector .cx-content-menu__icon__member
And I wait until service ready
Then I see Advisor name with css selector tr.ng-scope:nth-child(1) > td:nth-child(2) contains: %{advisorName}
And I wait big timeout
When I open Notifications (click on BELL) page
And I wait until service ready
Then I check Notification with css selector tr.ng-scope:nth-child(1) > td:nth-child(3) > span:nth-child(1) contains Reminder. Your 1-on-1 Meeting Starts Soon or contains Advisor James Adv. Created 1-on-1 Meeting with
When I execute javascript $("a[class*='cx-wall-table__more ng-scope']:first").click()
Then I check message with css selector .cx-wall-table__content contains Your 1-on-1 meeting with Advisor James Adv. or contains The Advisor James Adv. created a 1-on-1 meeting
