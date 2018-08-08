Story: Fundamentals check, add to portfolio button

Narrative:
As a expert
I want to check "Add to portfolio" button in community  fundamentels

Scenario:
Setup params. Checks "Add to portfolio" button
Meta:
@basic
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate _Personal + UUID and put it to test param portfolioGenerated


Scenario: Checks "Provider funds" page
Meta:
@name Checks "Add to portfolio" button
GivenStories:
       stories/functional/test/portfolio/create_investement_portfolio.story#{name:Create investment porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
!-- Go to community -> Tickers
When I open COMMUNITY menu
When I click on Tickers  with css selector #community__menu__tickers-link
And I wait until service ready
Then I see Tickers page header with css selector .social-title > h1:nth-child(1) is: List of tickers
!-- Choose Ticker CCE
When I type CCE into tickers input fields with css selector #community__tickers__search-input
And I wait big timeout
And I click on CCE ticker with css selector .tickers-list > table:nth-child(6) > tbody:nth-child(2) > tr:nth-child(1)
And I wait until service ready
Then I see Ticker page header with css selector .social-title > h1:nth-child(1) is: Coca-Cola Enterprises, Inc.
!-- Choose fundamentals menu
And I wait small timeout
When I execute javascript scroll(1050, 700)
When I click on Fundamentals left menu item with css selector #community__tickers__menu__fundamentals-link
And I wait until service ready
Then I see Fundamentals page header with css selector h1.ng-scope is: CCE fundamentals
!-- add ticker to the portfolio
When I click on Add to potrfolio with css selector #ticker-add-to-portfolio-button-menu
And I wait until service ready
And I execute javascript $("li[title~='%{portfolioGenerated}']").click()
Then I see toaster with css selector .toast-message contains: Ticker CCE added to portfolio %{portfolioGenerated}
And I wait big timeout
!-- try to add ticker to portfolio again
When I click on Add to potrfolio with css selector #ticker-add-to-portfolio-button-menu
And I wait until service ready
And I execute javascript $("li[title~='%{portfolioGenerated}']").click()
And I wait until service ready
Then I see error window is active with css selector h4.modal-title:nth-child(1) is: Tickeron
And I wait small timeout
When I click on Ok button with css selector button.ng-binding
And I wait big timeout
!-- Remove ticker from portfolio
And I wait small timeout
When I open HOME menu
And I wait until service ready
When I open portfolios block
And I wait until service ready
And Portfolio. I find portfolio %{portfolioGenerated}
And I wait until service ready
And I click on Adjust actual location with css selector .social-menu__icon_adjust
And I wait small timeout
When I execute javascript scroll(1050, 350)
And I wait until service ready
And I click on trash icon near ticker with css selector .dsg
And I wait small timeout
And I click on Yes button with css selector button.ng-scope:nth-child(1)
And I wait small timeout
And I click on Save button with css selector button.btn-primary-sm
And I wait big timeout
!-- remove portfolio
And I click using js on remove icon with css selector .social-menu__icon_remove
And I wait until service ready
And I wait small timeout
And I click on Yes button with css selector button.ng-scope:nth-child(1)
And I wait until service ready
Then I see Portfolios page with css selector div.col-sm-6:nth-child(1) > div:nth-child(1) > h1:nth-child(1) is: Portfolios

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
And Set test param password value from property param.advisor.password

Scenario: Work with fundamentals as advisor user
GivenStories:
    stories/community/tickers/fundamentals/fundamentals_add_to_portfolio.story#{name:Checks "Add to portfolio" button},
Given Do nothing

Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password

Scenario: Work with fundamentals as intermediate user
GivenStories:
   stories/community/tickers/fundamentals/fundamentals_add_to_portfolio.story#{name:Checks "Add to portfolio" button},
Given Do nothing
