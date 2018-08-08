Story: Check Patterns Subscription view

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario:
Patterns Subscribe
Meta:
@name Patterns Subscribe
Given I connect card as client for %{username} with %{password}
And I logged in with %{username} and %{password}
!-- Go to Patterns page
When I open AI patterns recognition block
And I wait small timeout
Then I see header with xpath selector //div[h1/text()='A. I. Pattern Recognition'] contains: A. I. Pattern Recognition
!-- Subscribe
When I execute javascript $("input.ng-pristine:nth-child(1)").click()
When I click on Subscribe button with containsText selector Subscribe for
Then I see toaster with css selector .toast-message contains: Successfully subscribed!
When I wait big timeout

Scenario:
Patterns check functionality
!-- On/Off alerts
When I click on alerts switch with css selector div.pull-right
Then I see toaster with css selector .toast-message contains: Alerts turned off
When I wait big timeout
And I click on alerts switch with css selector div.pull-right
Then I see toaster with css selector .toast-message contains: Alerts turned on
!-- inbox
When I click on inbox with xpath selector //a[@href='#!/patterns/subscriptions_result']
And I wait until service ready
Then I see header with css selector h1.col-xs-6 contains: Inbox
!-- bookmarked
When I click on bookmarked with xpath selector //a[@href='#!/patterns/bookmarked']
And I wait until service ready
Then I see header with css selector h1.col-xs-6 contains: Bookmarked
!-- alerts
When I click on bookmarked with xpath selector //a[@href='#!/patterns/subscriptions_alert_setup']
And I wait until service ready
Then I see header with css selector h1.col-xs-12 contains: Pattern Alert Setup
!-- slider


!-- add alerts
When I execute javascript $("a[href*='#!/patterns/subscriptions_add_pattern']").click()
And I wait until service ready
Then I see header with css selector .col-xs-9 contains: Select Pattern Types
When I click on 1st pattern with xpath selector //span[text()='Broadening Bottom']
!-- move to bearish
And I click on tab beearish with css selector li.ng-binding:nth-child(2)
And I click on broadening bottom with css selector div.cx-patterns-groups-selection:nth-child(5) > div:nth-child(2) > div:nth-child(1) > img:nth-child(1)
!-- And I click on Next
And I click on Next with css selector button.btn-secondary:nth-child(1)
And I wait small timeout
And I click on Categories with css selector  .tabs-left > li:nth-child(2)
And I wait small timeout
When I click on Communications with xpath selector //span[text()='Communications']
!-- Add ticker
When I click on individual tickers with css selector .tabs-left > li:nth-child(1)
And I type ABC into field with css selector #filterInput
And I will wait until ticker element element with css selector #chb33267 will be visible
When I start recording action
And I will move in action to ABC ticker element with css selector #chb33267
And I will click in action on ABC ticker element with css selector #chb33267
Then I perform previously recorded action
When I click on Add button with css selector .btn-add-ticker
And I wait small timeout
Then I see ABC ticker in column with css selector strong.ng-binding is ABC
!-- Remove ticker
When I click on Remove icon  with css selector .btn-delete-icon

!-- Add ABC again
When I click on individual tickers with css selector .tabs-left > li:nth-child(1)
And I type ABC into field with css selector #filterInput
And I will wait until ticker element element with css selector #chb33267 will be visible
When I start recording action
And I will move in action to ABC ticker element with css selector #chb33267
And I will click in action on ABC ticker element with css selector #chb33267
Then I perform previously recorded action
When I click on Add button with css selector .btn-add-ticker
And I wait small timeout
Then I see ABC ticker in column with css selector strong.ng-binding is ABC
!-- Finish
When I click on Done  with css selector .text-right > button:nth-child(1)
And I wait until service ready
Then I see toaster with css selector .toast-message contains: Pattern alert setup completed.
Then I see header with css selector h1.col-xs-12 contains: Pattern Alert Setup
!-- Remove all alerts
When Patterns. I remove all set up alerts


Scenario:
Patterns Unsubscribe
Meta:
@name Patterns Unsubscribe
Given I logged in with %{username} and %{password}
When I open Personal Profile menu
And I execute javascript $("a[href*='#!/editProfile/subscriptions']").click()
And I wait until service ready
Then I see header with css selector .h1 contains: Subscriptions
When I execute javascript $("button.btn:nth-child(3)").click()
And I wait small timeout
When I execute javascript $("button:contains('Unsubscribe')").click()
And I wait big timeout
And I click on Unsubscribe button with css selector div.modal-footer:nth-child(2) > div:nth-child(1) > div:nth-child(2) > button:nth-child(1)
Then I see toaster with css selector .toast-message contains: Unsubscribed!
