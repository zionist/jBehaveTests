Story: Community -> Tickers -> Blogs page

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Some text + UUID and put it to test param textGenerated
And I generate Blog_ + UUID and put it to test param blogGeneratedTitle


Scenario:
Check overview -> Tickers -> Blogs
Meta:
@Name Check overview -> Tickers -> Blogs
GivenStories:
   stories/iexpert/create_edit_delete_blog.story#{name:Create blog}
Given Do nothing

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.contentadmin.username
Given Set test param password value from property param.contentadmin.password

Scenario: As CONTENT ADMIN Approve blog
GivenStories:
    stories/iexpert/create_edit_delete_blog.story#{name:As CONTENT ADMIN Approve blog},
Given Do nothing

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Check overview -> Tickers -> Blogs
Meta:
@Name Check overview -> Tickers -> Blogs
GivenStories:
Given I logged in with %{username} and %{password}
When I open COMMUNITY menu
When I click on Tickers  with css selector #community__menu__tickers-link
And I wait until service ready
Then I see Tickers page header with css selector .social-title > h1:nth-child(1) is: List of tickers
And I wait small timeout
When I type AA into searching field with css selector #community__tickers__search-input
And I wait big timeout
When I click on AA with css selector .tickers-list > table:nth-child(6) > tbody:nth-child(2) > tr:nth-child(1)
And I wait until service ready
When I click on blogs in left menu with css selector #community__tickers__menu__in-blogs-link
And I wait until service ready
Then I see blog with css selector .social-article__title contains: %{blogGeneratedTitle}



