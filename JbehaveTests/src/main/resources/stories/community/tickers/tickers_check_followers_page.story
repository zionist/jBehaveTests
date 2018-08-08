Story: Community - Tickers - Check followers page

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario:
Community - open ticker
Meta:
@name Community - open ticker - check followers page
Given I logged in with %{username} and %{password}
!-- Select ticker AAPL
When I open COMMUNITY - Tickers menu
And I wait until service ready
Then I see page header with css selector .social-title > h1:nth-child(1) contains: List of tickers
When I type AAPL into searching form  with css selector #community__tickers__search-input
And I wait big timeout
And I click on AAPL with css selector .tickers-list > table:nth-child(6) > tbody:nth-child(2) > tr:nth-child(1)
And I wait until service ready
When I click on No follows with css selector #community__tickers__followers-link
And I wait until service ready
Then I see Followers of with css selector .tickers__page-header contains: AAPL followers
Then I see No data found with css selector .community-no-data-found-label contains: No one follows AAPL right now
When I click on Follow button with css selector #community__tickers__follow-button
And I wait small timeout
When I execute javascript $("input[id*='community__tickers__a-mall-has-been-published-checkbox']").click()
When I execute javascript $("input[id*='community__tickers__blog-article-has-been-published-checkbox']").click()
And I wait small timeout
When I will refresh the page
And I wait until service ready
Then I see James Adv. with css selector .member-card__header contains: James Adv.