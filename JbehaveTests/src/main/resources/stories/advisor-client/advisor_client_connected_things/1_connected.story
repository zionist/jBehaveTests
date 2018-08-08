Story: Connect advisor with client in portfolio

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


Scenario: full connection intermediate to advisor in advisor_client_connected_things
GivenStories:
    stories/advisor-client/full_connection_client_advisor.story#{name:Make client visible for advisors},
Given Do nothing

!-- Set params for client
Given Set test param username with value %{advisor_username}
Given Set test param password with value %{advisor_password}


Scenario: full connection intermediate to advisor2 in advisor_client_connected_things
GivenStories:
    stories/advisor-client/full_connection_client_advisor.story#{name:Login as Advisor and click on Connect},
    stories/advisor-client/full_connection_client_advisor.story#{name:As client confirm connection},
    stories/advisor-client/full_connection_client_advisor.story#{name:As Advisor send a bid},
    stories/advisor-client/full_connection_client_advisor.story#{name:As client end subscription},
Given Do nothing