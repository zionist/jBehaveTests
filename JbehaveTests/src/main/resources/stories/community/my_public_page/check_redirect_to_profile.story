Story: Community -> Your page -> Check redirect to profile

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario:
Community -> Your page -> Check redirect to profile

Given I logged in with %{username} and %{password}
When I open COMMUNITY menu
Then I see head with css selector .hide-on-less-than-1280px contains: James Adv.
When I click on Profile with css selector .member-info__personal-profile-link
And I wait until service ready
Then I see General Information with css selector .h1 contains: General Information

