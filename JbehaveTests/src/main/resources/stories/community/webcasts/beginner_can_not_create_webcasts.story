Story: Academy -> Webcasts -> check that beginner can not create webcasts

Scenario:
Setup params. Set user to Beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario:
Create webcast
Meta:
@name Create webcast
Given I logged in with %{username} and %{password}
When I open WEBCASTS menu
And I wait until service ready
Then I see there is no Create new webcast  with css selector #community__webcasts__create-button