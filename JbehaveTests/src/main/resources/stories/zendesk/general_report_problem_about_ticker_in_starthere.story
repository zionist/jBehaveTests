Story: General report a missing ticker on Start here

Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password
Given Set test param messageText with value ticker miss on Start here


Scenario:
Send General problem report
Meta:
@name Send General problem report
Given I logged in with %{username} and %{password}
!-- Open Start here block and go to step where we have report a problem about missing ticker
When I open starts here wizard
And I wait until service ready
And I click on Artificial Intelligence with css selector #pageMenuContainer > div.cx-content-menu.row > div > div > div > div > div > div > div:nth-child(1) > div > div.cx-start-here-box__wrapper
And I click on Allocation ideas with css selector div.row:nth-child(6) > div:nth-child(2) > div:nth-child(1)
!-- Then I see page header with css selector h1.ng-scope is: How do you want to enter positions in your portfolio?
Then I see page header with xpath selector //h1[@ng-if="titleId === 'steps.how-to-enter-tickers'"] is: How do you want to enter positions in your portfolio?
When I click on One at a time with css selector div.col-xs-6:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1)
And I wait until service ready
And I report a problem about ticker ZXCVBN with text %{messageText}

Scenario:
Check zendesk last ticket
Meta:
@name Check zendesk last ticket
Given I check in zendesk sent message with text %{messageText}
Given Do nothing