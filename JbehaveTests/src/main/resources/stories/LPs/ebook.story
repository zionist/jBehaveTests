Story: General report a problem

Scenario:
Setup params. Set user to intermediate
Given Set test param password value from property param.intermediatewebhost.password
Given Set test param mailusername value from property catchmail.catch01.username
Given Set test param mailpassword value from property catchmail.catch01.password
Given Set test param username value from property param.intermediate.username
Given I generate UUID + @catch01.tickerontest.com and put it to test param newusername
Given Set test param webhost value from property dmtest.booksmart.host


Scenario:
Open Ebook page and check by Login
Meta:
@name Send General problem report
Given Browser ready with %{webhost}
When I click on download button with css selector #downloadBtn
And I click on login here link with css selector .cx-login-block__actions-login
And I submit %{username} and %{password} into open Log in form
!-- And I wait small timeout
Then I see message with css selector p contains: Thank you for your
Then I wait big timeout


Scenario:
Check last zendesk email text and write reply
Meta:
@name Check last zendesk email text and write reply
Given I logged in to tickeronmailtest with %{mailusername} and %{mailpassword}
When CatchMail. I open last email which has Stock Pattern Search Engine eBook
Then I see message with xpath selector //table/tbody/tr/td/pre contains: to get a free eBook

!--/*
Scenario:
Open Ebook page and check by Sign up
Meta:
@name Send General problem report
Given Browser ready with https://booksmart.tickerontest.com/
When I click on download button with css selector #downloadBtn
And I submit Tester and %{username} and %{password} into open Sign in form
!-- And I wait small timeout
Then I see message with css selector p contains: Thank you for your
Then I wait big timeout
!--*/