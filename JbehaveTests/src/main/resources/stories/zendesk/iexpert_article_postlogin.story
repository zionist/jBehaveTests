Story: Send iexpert article problem report from post-login

Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password
Given I generate test_ + UUID and put it to test param messageText
Given Set test param reason with value Other

Scenario:
Send iexpert article problem report from post-login
Meta:
@name Send iexpert article problem report from post-login
Given I logged in with %{username} and %{password}
!-- Open iExpert
When I open IEXPERT menu
And I click on 1st article with css selector div.media:nth-child(3) > div:nth-child(2) > a:nth-child(1) > h4:nth-child(1)
!-- And I wait small timeout
And Zendesk. iExpert. Open Report problem dialog
And I wait small timeout
And Zendesk. iExpert. Send report with file cat.jpeg with reason %{reason} and with text %{messageText}


Scenario:
Check zendesk last ticket
Meta:
@name Check zendesk last ticket
Given I check in zendesk sent message and subject with text %{messageText} and subject %{reason}
When Zendesk. Submit ticket as open
Then I check that zendesk ticket with User Mike In. reported an issue regarding Other in have status is(choose one of solved/open/pending): open
Given Do nothing