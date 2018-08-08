Story: Make sure that chapters redirects to the articles

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario:
Chapters
Meta:
@name Chapters
Given I logged in with %{username} and %{password}
!-- Open IExpert menu
When I open IEXPERT menu
!-- click the icon "Chapters"
And I click on icon "Chapters" with css selector #iexpert__to-chapters-button
!-- select Introduction
And I click on firts item with css selector div.col-xs-3:nth-child(1) > a:nth-child(1) > div:nth-child(1) > p:nth-child(4)
And I wait until service ready
!-- select article "What is the S&P 500?"
And I click on second item with css selector div.iexpert-chapter-page__article:nth-child(2) > div:nth-child(2) > a:nth-child(1) > span:nth-child(1)
And I wait until service ready
Then I see article title with css selector .iexpert-article__header contains: What
!-- first related article
When I click on first related article with css selector a.ng-binding:nth-child(5)
And I wait small timeout
Then I see article title with css selector .iexpert-article__header contains: What
Given Do nothing