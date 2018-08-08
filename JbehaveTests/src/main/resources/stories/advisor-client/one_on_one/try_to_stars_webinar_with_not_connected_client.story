Story: Try to start 1-on-1 meeting with not subcribed user

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

Scenario: full connection intermediate to advisor in 1-on-1
GivenStories:
    stories/advisor-client/full_connection_client_advisor.story#{name:Make client visible for advisors},
Given Do nothing

!-- Set params for client
Given Set test param username with value %{advisor_username}
Given Set test param password with value %{advisor_password}

Scenario: full connection intermediate to advisor2 in 1-on-1
GivenStories:
    stories/advisor-client/full_connection_client_advisor.story#{name:Login as Advisor and click on Connect},
    stories/advisor-client/full_connection_client_advisor.story#{name:As client confirm connection},
Given Do nothing

Scenario:
Try to start 1-on-1 meeting with not subcribed user
Meta:
@name Try to start 1-on-1 meeting with not subcribed user
!-- Open Advisor/Client menu
Given I connect stripe as seller for %{advisor_username} with %{advisor_password}
And I logged in with %{advisor_username} and %{advisor_password}
When I wait until service ready
And I open CLIENTS menu
And I wait until service ready
And I open 1-on-1 menu on Advisor side
And I type %{clientName} into John Exp. with css selector .form-control
And I click on Add button with css selector button.btn-secondary:nth-child(1)
And I wait small timeout
Then I see Please, select slots with css selector div.text-danger:nth-child(2) contains: Please, select slots
Then I see Please, select a client with css selector div.text-danger:nth-child(3) contains: Please, select a client
And I wait small timeout
When I open CLIENTS menu
And I wait until service ready
And I click on tab connections with css selector .tabs-left > li:nth-child(2)
And I wait until service ready
And I wait small timeout
And I click on clients name with containsText selector %{clientName}
And I wait until service ready
And I click on disconnect button with xpath selector //button[contains(., 'Reject Request')]
And I wait until service ready
And I click on disconnect button with xpath selector //button[contains(., 'Disconnect')]
And I wait until service ready
And I wait small timeout
Then I see Connect button with css selector a.btn contains: Connect
And I wait small timeout
!-- Given I unsubscribe and disconnect from client/advisor



Scenario:
Setup params. Set user to beginner
Given Set test param client_username value from property param.expert.username
Given Set test param client_password value from property param.expert.password
Given Set test param advisor_username value from property param.advisor.username
Given Set test param advisor_password value from property param.advisor.password
Given Set test param clientName with value John Exp.
Given Set test param advisorName with value James Adv.

Scenario:
As client disconnect from advisor and make himself invisible in 1-on-1
GivenStories:
    stories/advisor-client/full_connection_client_advisor.story#{name:Make myself invisible}
Given Do nothing




