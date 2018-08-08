Story: Community -> Tickers -> Products in mall

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Opinion_ + UUID and put it to test param opinonGeneratedName

Scenario:
Check page products in mall in tickers
GivenStories:
    stories/mall/opinion/cred_opinion.story#{name:Create opinion},
    stories/mall/opinion/cred_opinion.story#{name:Publish opinion}
Given Do nothing

Scenario:
Setup params. Set user to account admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
Given Set test param password value from property param.accountadmin.password
Given Set test param itemType with value Opinion
Given Set test param productTitle with value %{opinonGeneratedName}



Scenario: Login to admin interface as account admin
Meta:
@name Login to admin interface as account admin
GivenStories:
    stories/mall/model_portfolio/cred_model_portfolio.story#{name:Approve Portfolio model in MALL}
Given Do nothing

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Check page products in mall
Given I logged in with %{username} and %{password}
!-- Go to list of tickers and select AAPL
When I open COMMUNITY menu
When I click on Tickers  with css selector #community__menu__tickers-link
And I wait until service ready
Then I see Tickers page header with css selector .social-title > h1:nth-child(1) is: List of tickers
And I wait small timeout
When I type AAPL into searching field with css selector #community__tickers__search-input
And I wait big timeout
When I click on AAPL with css selector .tickers-list > table:nth-child(6) > tbody:nth-child(2) > tr:nth-child(1)
And I wait until service ready
And I click on Products in MALL with css selector #community__tickers__menu__in-mall-link
And I execute javascript $(".form-control").val("number:0")
And I execute javascript $(".form-control").change()
Then I see title with css selector .community-mall-card__header contains: %{opinonGeneratedName}


