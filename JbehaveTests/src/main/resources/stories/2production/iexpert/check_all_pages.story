Story: Production - Check that all pages "IExpert" were opened

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Some text + UUID and put it to test param textGenerated
And I generate questionGenerated + UUID and put it to test param questionGenerated


Scenario:
Search articles, question, blog
Meta:
@name Search items
Given I logged in during maintenance with %{username} and %{password}
!-- Use search to find article
When I open IEXPERT menu
And I type How should my strategy change with age into field of search with css selector .iexpert-search-bar__box > div:nth-child(1) > input:nth-child(1)
And I click on button "Search" with css selector .iexpert-search-bar__search-button
And I wait until service ready
And I click on the title of article with link selector How Should My Strategy Change With Age?
And I wait until service ready
Then I see page header with css selector .iexpert-article__header is: How Should My Strategy Change With Age?
And I wait small timeout
When I execute javascript scroll(1050, 700)
!-- Report problem
When I click on report problem with css selector .btn-link-problem
Then I see page header with css selector #form > h4:nth-child(1) is: Report a problem
When I click on Cancel button with css selector button.btn:nth-child(7)
And I wait until service ready
And I wait big timeout
!-- click on any related article
And I click on the link related article with link selector How Fast Should My Portfolio Grow?
And I wait until service ready
Then I see page header with css selector .iexpert-article__header is: How Fast Should My Portfolio Grow?
!-- Click on Tag
!-- And I click on tag with link selector Portfolio Management
!-- click chevron “Back”
!-- When I click on chevron "Back" with css selector body > div.base > div > div.ng-scope > div.container.ng-scope > div > a > div > i
!-- open first item in the column blog
!--/*
!-- remove this !-- if in field blogs we have any blogs
When I click on first item with css selector .iexpert-teaser__blogpost-title > a:nth-child(1) > span:nth-child(1)
And I wait until service ready
And I click on chevron "Back" with css selector body > div.base > div > div.container > div > div > cx-back-plate > div > span
And I wait until service ready
!--*/
When I click on Iexpert with css selector #page_menu__iexpert
And I wait until service ready
Then I see main page IExpert with css selector .iexpert-index-page__column-articles contains: Top articles
!-- Click on button “More” at the bottom of the page -> Verify that new articles shown
!-- When I click on button “More” with css selector body > div.base > div > div.ng-scope > div.container.ng-scope > div > div > div > div.col-sm-8 > div > div.col-sm-6.iexpert__column.iexpert__column-articles > div.text-center > div > ul > li > a
Given Do nothing