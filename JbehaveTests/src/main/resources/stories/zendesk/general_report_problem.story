Story: General report a problem

Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password
Given Set test param mailusername value from property catchmail.catch01.username
Given Set test param mailpassword value from property catchmail.catch01.password
Given I generate test_ + UUID and put it to test param messageText
Given I generate userreply_ + UUID and put it to test param userReplyText
Given Set test param reason with value Other


Scenario:
Send General problem report
Meta:
@name Send General problem report
Given I logged in with %{username} and %{password}
When I send General Report with reason %{reason} and with text %{messageText}


Scenario:
Check zendesk last ticket
Meta:
@name Check zendesk last ticket
!-- Given I logged in to Zendesk
Given I check in zendesk sent message and subject with text %{messageText} and subject %{reason}
Given Do nothing


Scenario:
Check last zendesk email text and write reply
Meta:
@name Check last zendesk email text and write reply
Given I logged in to tickeronmailtest with %{mailusername} and %{mailpassword}
When CatchMail. I open last email with subject [Request received]
Then I see message with xpath selector //table/tbody/tr/td/pre contains: %{messageText}
!-- reply
When I click on reply with xpath selector //a[text()='Reply']
And I wait small timeout
And CatchMail. Get mail body and add string %{userReplyText} at the beginning
And I click on Send with css selector input[name='send']
Then I see message with xpath selector (//table/tbody/tr/td[@align='right'])[3] contains: Viewing Messages:


Scenario:
Check zendesk reply from user for last ticket
Meta:
@name Check zendesk reply from user for last ticket
Given I logged in to Zendesk
When Open Zendesk last ticket
Then I see userreply with xpath selector (//div[@class='zd-comment'])[1] contains: %{userReplyText}
When Zendesk. Submit ticket as solved
Then I check that zendesk ticket with User Mike In. have status is(choose one of solved/open/pending): solved

