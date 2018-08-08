Story: Community -> Tickers -> Clubs

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Club + UUID and put it to test param clubTitleGenerated
And I generate Description + UUID and put it to test param clubDescriptionGenerated
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario:
Community - Tickers check Clubs
GivenStories:
    stories/community/clubs/cred_club.story#{name:create club}
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
When I execute javascript scroll(1050, 700)
And I wait small timeout
And I click on Investors club menu item with css selector #community__tickers__menu__in-investment-clubs-link
And I wait until service ready
!-- Click on last club in clubs list
!-- And I execute javascript $(".social-page-content > div:nth-child(3) > div.ng-scope").last().find("div.cx-avatar").click()
And I execute javascript $("div.club-card__text:contains('%{clubDescriptionGenerated}')").click()
Then I see page titile with css selector h1.ng-binding is %{clubTitleGenerated}
And I see club description with css selector p.ng-binding is %{clubDescriptionGenerated}

