Story: Connect client to advisor

Scenario:
Setup params. Set user to beginner
Given Set test param client_username value from property param.beginner.username
Given Set test param client_password value from property param.beginner.password
Given Set test param advisor_username value from property param.advisor.username
Given Set test param advisor_password value from property param.advisor.password
Given Set test param clientName with value Quan Public
Given Set test param advisorName with value James Adv.
And I generate Personal + UUID and put it to test param portfolioGenerated
And I generate UUID + @catch01.tickerontest.com and put it to test param generatedEmail
And I generate _Title + UUID and put it to test param titleGenerated
!-- Set params for client

Given Set test param username with value %{client_username}
Given Set test param password with value %{client_password}

Scenario:
Make client visible for advisors
Meta:
@name Make client visible for advisors
GivenStories:
    stories/functional/test/portfolio/create_investement_portfolio.story#{name:Create investment porfolio}
Given I connect card as client for %{client_username} with %{client_password}
And I logged in with %{client_username} and %{client_password}
!-- Add portfolio to list aviable to adviser
When Adviser client. Make me visible with portfolio %{portfolioGenerated}

Given Set test param username with value %{advisor_username}
Given Set test param password with value %{advisor_password}

Scenario:
Login as Advisor and click on Connect
Meta:
@name Login as Advisor and click on Connect
GivenStories:
    stories/advisor-client/t&c_create_edit_delete.story#{name:TandC create}
!-- Open Advisor/Client menu
When I wait until service ready
And I click on Add potential Clients menu with containsText selector Find Clients
And I wait until service ready
And I type %{clientName} into search field with css selector .col-xs-9 > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1)
And I wait small timeout
And I click on clients name with containsText selector %{clientName}
And I wait until service ready
Then I see "Not Connected" on head of page with css selector .cx-adv-bid-state__text > div:nth-child(1) contains: Not
When I click on connect button with css selector div.cx-adv-plate:nth-child(2) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(3) > div:nth-child(1) > span:nth-child(1) > button:nth-child(1)
And I wait until service ready
And I wait small timeout
Then I see "Connected" on head of page with css selector .cx-adv-bid-state__text > div:nth-child(1) contains: Connected

Scenario:
As client confirm connection
Meta:
@name As client confirm connection
Given I logged in with %{client_username} and %{client_password}
!-- Open Advisor/Client menu
When I open ADVISORS menu
And I wait until service ready
And I click on Find Advisor menu with containsText selector Find Advisor
And I wait until service ready
And I wait small timeout
And I click on tab connection with css selector .tabs-right > li:nth-child(2)
And I wait until service ready
And I wait small timeout
And I click on advisor with containsText selector %{advisorName}
And I wait until service ready
Then I see "Connected" on head of page with css selector .cx-adv-bid-state__text > div:nth-child(1) contains: Connected
When I wait small timeout
And I click on connect button with xpath selector //button[contains(., 'Request Bid')]
And I wait until service ready
Then I see "Bid request sent" on head of page with css selector .cx-adv-bid-state__text > div:nth-child(1) contains: Bid request sent

Scenario:
As Advisor send a bid
Meta:
@name As Advisor send a bid
!-- Open Advisor/Client menu
Given I connect card as client for %{advisor_username} with %{advisor_password}
Given I connect stripe as seller for %{advisor_username} with %{advisor_password}
And I logged in with %{advisor_username} and %{advisor_password}
When I wait until service ready
And I open CLIENTS menu
And I wait until service ready
And I click on tab connections with css selector .tabs-left > li:nth-child(2)
And I wait until service ready
And I wait small timeout
And I click on clients name with containsText selector %{clientName}
And I wait until service ready
And I click on Bid button with xpath selector //button[contains(., 'Bid')]
And I wait big timeout
When I execute javascript $("input[name*='isAgreeWithTickeron']").click()
And I type Text to client from Advisor into text area with css selector textarea.form-control
And I wait small timeout
And I click on Submit button with xpath selector //button[contains(., 'Submit')]
And I wait until service ready
And I wait small timeout
Then I see Cancel Bid button with xpath selector //button[contains(., 'Cancel Bid')] contains: Cancel Bid

Scenario:
As client end subscription
Meta:
@name As client end subscription
Given I connect card as client for %{client_username} with %{client_password}
And I logged in with %{client_username} and %{client_password}
!-- Open Advisor/Client menu
When I open ADVISORS menu
And I wait until service ready
And I click on tab connection with css selector .tabs-right > li:nth-child(2)
And I wait until service ready
And I click on advisor with containsText selector %{advisorName}
And I wait until service ready
And I click on Subscribe button with xpath selector //button[contains(., 'Review Bid')]
And I wait until service ready
When I execute javascript $("input[name*='isAgreeWithAdvisor']").click()
When I execute javascript $("input[name*='isAgreeWithTickeron']").click()
And I wait small timeout
And I click on Subscribe button with css selector div.col-xs-12:nth-child(3) > div:nth-child(1) > button:nth-child(1)
And I wait until service ready
Then I see Unsubscribe button with xpath selector //button[contains(., 'Unsubscribe')] contains: Unsubscribe
!-- Check chat
When I click on note button with css selector .cx-notes2__label
And I send note message with text bla-la la
And I wait small timeout
And I click on Chats button with css selector .ti-chat
And I send chat message with text Some text

Scenario:
as advisor check chat
Meta:
@name as advisor check chat
Given I logged in with %{advisor_username} and %{advisor_password}
When I wait until service ready
And I open CLIENTS menu
And I wait until service ready
And I click on tab connections with css selector .tabs-left > li:nth-child(2)
And I wait until service ready
And I wait small timeout
And I click on clients name with containsText selector %{clientName}
And I wait until service ready
!-- Check chat
When I click on note button with css selector .cx-notes2__label
And I send note message with text bla-la la
And I wait until service ready
And I click on Chats button with css selector .ti-chat
And I send chat message with text Some text


Scenario:
Setup params. Set user to beginner
Given Set test param client_username value from property param.beginner.username
Given Set test param client_password value from property param.beginner.password
Given Set test param advisor_username value from property param.advisor.username
Given Set test param advisor_password value from property param.advisor.password
Given Set test param clientName with value Quan Public
Given Set test param advisorName with value James Adv.


Scenario:
As client unsubscription disconnect
Meta:
@name As client unsubscription disconnect
Given I logged in with %{client_username} and %{client_password}
!-- Open Advisor/Client menu
When I open ADVISORS menu
And I wait until service ready
And I click on tab connection with css selector .tabs-right > li:nth-child(2)
And I wait until service ready
And I click on advisor with containsText selector %{advisorName}
And I wait until service ready
And I click on unsubscribe button with xpath selector //button[contains(., 'Unsubscribe')]
And I wait big timeout
And I click on Yes button with xpath selector //button[contains(., 'Yes')]
And I wait until service ready
And I click on disconnect button with xpath selector //button[contains(., 'Disconnect')]
And I wait until service ready
And I wait small timeout
Then I see Connect button with css selector a.btn contains: Connect
And I wait small timeout

Scenario: Make myself invisible
Meta:
@name Make myself invisible
Given I logged in with %{client_username} and %{client_password}
!-- make myself invisible
When I open ADVISORS menu
And I wait until service ready
And I click on make myself invisible with css selector .ac-let__toggle
And I wait small timeout
Then I see element attribute on off visibilit button with css selector .ac-let__toggle has attribute class with value cx-toggle-on-off_off

Scenario:
Setup params. Set user to intermed
Given Set test param client_username value from property param.intermediate.username
Given Set test param client_password value from property param.intermediate.password
Given Set test param advisor_username value from property param.advisor.username
Given Set test param advisor_password value from property param.advisor.password
Given Set test param clientName with value Mike In.
Given Set test param advisorName with value James Adv.
And I generate Personal + UUID and put it to test param portfolioGenerated
And I generate UUID + @catch01.tickerontest.com and put it to test param generatedEmail
And I generate _Title + UUID and put it to test param titleGenerated
!-- Set params for client
Given Set test param username with value %{client_username}
Given Set test param password with value %{client_password}
!-- Do the same as intermediate

Scenario: full connection intermediate to advisor
GivenStories:
    stories/advisor-client/full_connection_client_advisor.story#{name:Make client visible for advisors},
Given Do nothing

!-- Set params for client
Given Set test param username with value %{advisor_username}
Given Set test param password with value %{advisor_password}

Scenario: full connection intermediate to advisor2
GivenStories:
    stories/advisor-client/full_connection_client_advisor.story#{name:Login as Advisor and click on Connect},
    stories/advisor-client/full_connection_client_advisor.story#{name:As client confirm connection},
    stories/advisor-client/full_connection_client_advisor.story#{name:As Advisor send a bid},
    stories/advisor-client/full_connection_client_advisor.story#{name:As client end subscription},
Given Do nothing

Scenario:
Setup params. Set user to expert
Given Set test param client_username value from property param.intermediate.username
Given Set test param client_password value from property param.intermediate.password
Given Set test param advisor_username value from property param.advisor.username
Given Set test param advisor_password value from property param.advisor.password
Given Set test param clientName with value Mike In.
Given Set test param advisorName with value James Adv.

Scenario:
As client disconnect from advisor and make himself invisible
GivenStories:
    stories/advisor-client/full_connection_client_advisor.story#{name:As client unsubscription disconnect},
    stories/advisor-client/full_connection_client_advisor.story#{name:Make myself invisible}
Given Do nothing



Scenario:
Setup params. Set user to beginner
Given Set test param client_username value from property param.expert.username
Given Set test param client_password value from property param.expert.password
Given Set test param advisor_username value from property param.advisor.username
Given Set test param advisor_password value from property param.advisor.password
Given Set test param clientName with value John Exp.
Given Set test param advisorName with value James Adv.
And I generate Personal + UUID and put it to test param portfolioGenerated
And I generate UUID + @catch01.tickerontest.com and put it to test param generatedEmail
And I generate _Title + UUID and put it to test param titleGenerated
!-- Set params for client
Given Set test param username with value %{client_username}
Given Set test param password with value %{client_password}
!-- Do the same as expert

Scenario: full connection expert to advisor
GivenStories:
    stories/advisor-client/full_connection_client_advisor.story#{name:Make client visible for advisors},
Given Do nothing

!-- Set params for client
Given Set test param username with value %{advisor_username}
Given Set test param password with value %{advisor_password}

Scenario: full connection expert to advisor2
GivenStories:
    stories/advisor-client/full_connection_client_advisor.story#{name:Login as Advisor and click on Connect},
    stories/advisor-client/full_connection_client_advisor.story#{name:As client confirm connection},
    stories/advisor-client/full_connection_client_advisor.story#{name:As Advisor send a bid},
    stories/advisor-client/full_connection_client_advisor.story#{name:As client end subscription},
Given Do nothing

Scenario:
Setup params. Set user to beginner
Given Set test param client_username value from property param.expert.username
Given Set test param client_password value from property param.expert.password
Given Set test param advisor_username value from property param.advisor.username
Given Set test param advisor_password value from property param.advisor.password
Given Set test param clientName with value John Exp.
Given Set test param advisorName with value James Adv.

Scenario:
As client disconnect from advisor and make himself invisible
GivenStories:
    stories/advisor-client/full_connection_client_advisor.story#{name:As client unsubscription disconnect},
    stories/advisor-client/full_connection_client_advisor.story#{name:Make myself invisible}
Given Do nothing
