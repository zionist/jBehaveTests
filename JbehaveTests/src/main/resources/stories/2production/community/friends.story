Story: Check friands page

Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario: Check empty Friends page
Meta:
@name Friend #1 checks empty 'Friends' page
Given I logged in during maintenance with %{username} and %{password}
When I open COMMUNITY menu
When I click on Friends  with css selector #community__menu__friends-link
And I wait until service ready
Then I see placeholdern with css selector div.text-muted:nth-child(4) contains: You don't have any shared portfolios.

