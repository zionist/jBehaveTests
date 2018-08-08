Story: Production - Check advisor clients functionality on client side

Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario:
Check Find Advisor page
Meta:
@name Check Find Advisor page
Given I logged in during maintenance with %{username} and %{password}
When I open ADVISORS menu
Then I see Page header with css selector .ac-title is: Find Advisor
And I wait small timeout
When I type James Adv using js to element Search field with css selector .col-xs-9 > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > input:nth-child(1)
And I wait small timeout
And I wait until service ready
And I execute javascript $(".table-ac__user")[0].click()
!-- And I click on Advisor name with css selector .table-ac__user
And I wait until service ready
And I wait small timeout
Then I see Info with css selector .cx-adv-plate__free contains: Free Portfolio Review Available
When I open ADVISORS menu
And I click on Let advisors find me switcher with css selector .ac-let__toggle
And I wait small timeout

Then I see modal window header with css selector body > div.modal.fade.ng-isolate-scope.cx-modal-dafault.in > div > div > div.modal-header.ng-scope > h4 is: Let advisor find me
Then I see modal window header with css selector body > div.modal.fade.ng-isolate-scope.cx-modal-dafault.in > div > div > div.modal-body.ng-scope contains: You haven't set up your Portfolio review request yet.
When I click on Cancel button with css selector button.btn-secondary:nth-child(1)
And I wait small timeout
!-- Check Connections tab
And I click on tab connection with css selector .tabs-left > li:nth-child(2)
And I wait until service ready
Then I see Column header with css selector .table > tbody:nth-child(1) > tr:nth-child(1) > th:nth-child(2) is: BID

Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario:
Check Current Advisor page
Meta:
@name Check Current Advisor page
Given I logged in during maintenance with %{username} and %{password}
When I open ADVISORS menu
And I open Current Advisor menu
And I wait until service ready
Then I see page header with css selector .ac-title is: Current Advisor
And I see info label with css selector h3.ng-scope contains: You have no advisor yet
!-- click to find
When I click on find link with css selector h3.ng-scope > a:nth-child(1)
And I wait until service ready
Then I see page header with css selector .ac-title is: Find Advisor
When I open Current Advisor menu
And I click on invite link with css selector h3.ng-scope > a:nth-child(2)
And I wait until service ready
Then I see page header with css selector .ac-title is: Invite to Tickeron

Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario:
Check Request Form page
Meta:
@name Check Request Form page
Given I logged in during maintenance with %{username} and %{password}
When I open ADVISORS menu
And I open Request Form menu
And I wait until service ready
Then I see page header with css selector .ac-title is: Request for Portfolio Review
When I click on Preview button with css selector button.ng-scope:nth-child(2)
Then I see page header with css selector .ac-title is: Request for Portfolio Review
And I see label with css selector .ac-request-form__text is: Hi, I am looking for a financial advisor and would like you to review my portfolios at Tickeron.

Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario:
Check 1-on-1 page
Meta:
@name Check 1-on-1 page
Given I logged in during maintenance with %{username} and %{password}
When I open ADVISORS menu
And I wait until service ready
And I open 1-on-1 menu on Client side
And I wait until service ready
Then I see My 1-on-1 meetings schedule with css selector .ac-title contains: My 1-on-1 meetings schedule
Then I see Slot with css selector h3.pull-left contains: Slot

Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario:
Check Invite to Tickeron page
Meta:
@name Check Invite to Tickeron page
Given I logged in during maintenance with %{username} and %{password}
When I open ADVISORS menu
And I open Invite Advisors to Tickeron menu
And I wait until service ready
Then I see page header with css selector .ac-title is: Invite to Tickeron
And I see second page header with css selector div.col-xs-8:nth-child(1) > h3:nth-child(1) is: Invite an Advisor to Tickeron

Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password

Scenario: Check advisor clients functionality on client side as inremediate
GivenStories:
    stories/2production/advisor_client/clients.story#{name:Check Find Advisor page},
    stories/2production/advisor_client/clients.story#{name:Check Current Advisor page},
    stories/2production/advisor_client/clients.story#{name:Check Request Form page},
    stories/2production/advisor_client/clients.story#{name:Check 1-on-1 page},
    stories/2production/advisor_client/clients.story#{name:Check Invite to Tickeron page}
Given Do nothing

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario: Check advisor clients functionality on client side as expert
GivenStories:
    stories/2production/advisor_client/clients.story#{name:Check Find Advisor page},
    stories/2production/advisor_client/clients.story#{name:Check Current Advisor page},
    stories/2production/advisor_client/clients.story#{name:Check Request Form page},
    stories/2production/advisor_client/clients.story#{name:Check 1-on-1 page},
    stories/2production/advisor_client/clients.story#{name:Check Invite to Tickeron page}
Given Do nothing
