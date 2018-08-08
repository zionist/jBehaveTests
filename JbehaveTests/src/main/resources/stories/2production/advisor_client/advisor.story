Story: Production - Check advisor clients functionality on advisor side

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Check Add potential Clients page
Meta:
@name Check Add potential Clients page
Given I logged in during maintenance with %{username} and %{password}
!-- Check "Members searching for Advisors" tab
When I wait until service ready
When I open CLIENTS menu
And I wait until service ready
Then I see Type of Members with css selector form.ng-pristine > div:nth-child(1) > label:nth-child(1) is: TYPE OF MEMBERS
!-- Check "Connections & Bids" tab
When I click on tab Connections & Bids with css selector .tabs-left > li:nth-child(2)
And I wait until service ready
Then I see Column header with css selector .table > tbody:nth-child(1) > tr:nth-child(2) > th:nth-child(6) contains: MONTHLY
Then Do nothing

Scenario:
Check Your Clients page
Meta:
@name Check Your Clients page
Given I logged in during maintenance with %{username} and %{password}
When I open CLIENTS menu
And I wait until service ready
And I open Your Clients menu
And I wait until service ready
Then I see head of page with css selector div.col-xs-8:nth-child(1) > h1:nth-child(1) contains: Your Clients
When I click on invite button with css selector .btn-block
And I wait until service ready
Then I see head of page with css selector h3.modal-title is: Create New Group

Scenario:
Check 1-on-1 page
Meta:
@name Check 1-on-1 page
Given I logged in during maintenance with %{username} and %{password}
When I open CLIENTS menu
And I wait until service ready
And I open 1-on-1 menu on Advisor side
And I wait until service ready
Then I see Slot with css selector h3.pull-left contains: Slot
Then I see header of page with css selector .ac-title contains: My 1-on-1 meetings schedule


Scenario:
Check Manage Terms and Conditions page
Meta:
@name Check Manage Terms and Conditions page
Given I logged in during maintenance with %{username} and %{password}
When I open CLIENTS menu
And I wait until service ready
And I open Manage Terms & Conditions menu
And I wait until service ready
Then I see Terms And Conditions on head of page with xpath selector //h1[contains(text(),'Terms and Conditions')] is: Terms and Conditions
!-- Click on create new
When I click on create new with css selector button[href='#!/edit/']
And I wait until service ready
Then I see head of page with css selector h1.ng-scope is: Create Terms and Conditions
When I click on cancel with css selector .btn-transparent
Then I see Terms And Conditions on head of page with xpath selector //h1[contains(text(),'Terms and Conditions')] is: Terms and Conditions
Then Do nothing
