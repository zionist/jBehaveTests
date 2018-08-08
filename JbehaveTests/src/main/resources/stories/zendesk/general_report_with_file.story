Story: General report a problem with file

Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
Given Set test param mailusername value from property catchmail.catch01.username
Given Set test param mailpassword value from property catchmail.catch01.password
Given I generate test_ + UUID and put it to test param messageText
Given Set test param reason with value Using website
!-- Given Set test param messageText with value test

Scenario:
Send General problem report
Meta:
@name Send General problem report
Given I logged in with %{username} and %{password}
When I send General Report with file cat.jpeg with reason %{reason} and with text %{messageText}

Scenario:
Check zendesk last ticket
Meta:
@name Check zendesk last ticket
!-- Given I logged in to Zendesk
Given I check in zendesk sent message and subject with text %{messageText} and subject using website
Given Do nothing