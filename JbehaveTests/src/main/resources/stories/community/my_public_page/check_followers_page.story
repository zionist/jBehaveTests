Story: Community -> Your page -> Check followers page

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario:
Community -> Your page -> Check followers page

Given I logged in with %{username} and %{password}
When I open COMMUNITY menu
Then I see head with css selector .hide-on-less-than-1280px contains: James Adv.
When I click on No follows with css selector cx-member-info.ng-scope > div:nth-child(1) > div:nth-child(2) > a:nth-child(4) > span:nth-child(1)
And I wait until service ready
Then I see Followers of with css selector .member-followers__header > span:nth-child(1) contains: Followers of
Then I see No data found with css selector span.ng-isolate-scope contains: No data found
