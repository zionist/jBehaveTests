Story: General report about missing ticker when user creating portfolio

Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password
Given Set test param messageText with value ticker missed when user creating portfolio


Scenario: report about missing ticker when user creating portfolio
GivenStories:

Given I logged in with %{username} and %{password}
When I open HOME menu
And I open portfolios block
And I wait until service ready
And I click on Create New button with css selector a.btn
And I wait until service ready
When I type some title no metter into Portfolio title with css selector #input_title
And I wait small timeout
And I click on NEXT button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait small timeout
And I report a problem about ticker TREWQ with text %{messageText}

Scenario:
Check zendesk last ticket
Meta:
@name Check zendesk last ticket
Given I check in zendesk sent message with text %{messageText}
Given Do nothing