Story: Disconnect client from adviser and make client invisible

Scenario:
Setup params. Set user to beginner
Given Set test param client_username value from property param.intermediate.username
Given Set test param client_password value from property param.intermediate.password
Given Set test param advisor_username value from property param.advisor.username
Given Set test param advisor_password value from property param.advisor.password
Given Set test param clientName with value Mike In.
Given Set test param advisorName with value James Adv.

Scenario:
As client disconnect from advisor and make himself invisible in advisor_client_connected_things
GivenStories:
    stories/advisor-client/full_connection_client_advisor.story#{name:As client unsubscription disconnect},
    stories/advisor-client/full_connection_client_advisor.story#{name:Make myself invisible}
Given Do nothing