Story: Find the article with tickers and keywords (use advanced search)

Scenario:
Setup params. Set user to content admin
Given Set test param username value from property param.contentadmin.username
And Set test param password value from property param.contentadmin.password
And I generate Article_title_ + UUID and put it to test param articleGeneratedTitle


Scenario: Create Article with tickers and keywords
Meta:
@name Create Article
GivenStories:
    stories/iexpert/article_create_edit_delete.story#{name:Create Article}
Given Do nothing


Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Advanced search
Meta:
@name Advanced search

Given I logged in with %{username} and %{password}
!-- Open IExpert menu
When I open IEXPERT menu
!-- And I execute javascript $("a[href*='/app/academy#!/iexpert/index']").click()
And I click on button "Advanced search" with css selector .btn_unstyled
And I wait small timeout
!-- Add keyword
When I type Investment Company Act of 1940 into Keywords field with css selector #ticker-picker__keywords-input
And I wait big timeout
And I click on Keywords in list with css selector .keyword-picker__item
And I wait small timeout
!-- And I click on search button with css selector .iexpert-search-bar__search-button
!-- And I wait until service ready
!-- And I click on the link "How can I invest in Hedge Funds?" with link selector How can I invest in Hedge Funds?
And I click on the link "How can I invest in Hedge Funds?" with css selector div.iexpert-search-result__card:nth-child(2) > a:nth-child(1) > div:nth-child(1) > div:nth-child(1) > h4:nth-child(1)
And I wait small timeout
Then I see article title with css selector .iexpert-article__header is: How Can I Invest in Hedge Funds?
!-- Back to the previous page
When Browser navigate back
!-- When I click on arrow "Back" with css selector .cx-breadcrumbs > button:nth-child(1)
And I wait small timeout
!-- Remove keyword
And I click on cross (remove keyword) with css selector .btn-ticker-remove
!-- Add ticker
!-- Removed in new logic
!--/*
And I click on ticker selection input with css selector #filterInput
And I will wait until ticker element element with css selector #chb34108 will be visible
!-- # Tickers list appears.
And I start recording action
And I will move in action to A ticker checkbox element with css selector #chb34108
And I will click in action on A ticker checkbox element with css selector #chb34108
Then I perform previously recorded action
And I wait small timeout
!--*/
!-- When I click on search button with css selector .iexpert-search-bar__search-button
When I type %{articleGeneratedTitle} into Search field with css selector .iexpert-search-bar__box > div:nth-child(1) > input:nth-child(1)
And I wait until service ready
When I click on article title with css selector .iexpert-search-result__title
And I wait small timeout
Then I see Article Header with css selector .iexpert-article__header is: %{articleGeneratedTitle}
Given Do nothing

Scenario:
Setup params. Set user to content admin
Given Set test param username value from property param.contentadmin.username
And Set test param password value from property param.contentadmin.password

Scenario:
Delete article
Meta:
@name Delete article

Given I logged in with %{username} and %{password}
!-- Delete article (return to Content Admin -> H.I.T. Articles menu)
When I open COMMUNITY menu
And I open CONTENT ADMIN menu
And I wait until service ready
Then I see Content Admin Panel with css selector .cx-ca-header > h1:nth-child(1) is: Content Administration Panel
When I click on H.I.T. Articles with css selector div.col-sm-3:nth-child(3) > ul:nth-child(2) > li:nth-child(1) > a:nth-child(1)
And I wait until service ready
Then I see H.I.T. Articles Header with css selector h1.ng-binding is: Manage H.I. Tickeron Articles
!-- Search necessary article
When I type %{articleGeneratedTitle} into Search field with css selector #searchText
And I wait until service ready
!-- Delete
When I click on "delete" icon with css selector tr.ng-scope:nth-child(1) > td:nth-child(4) > a:nth-child(2)
And I wait small timeout
Then I see confirmation modal with css selector h4.modal-title:nth-child(1) contains: Confirmation
When I click on "Yes" button with css selector button.ng-binding:nth-child(1)
And I wait until service ready
Then I see Inscription with css selector .well > p:nth-child(1) > span:nth-child(1) contains: No data found
Given Do nothing
