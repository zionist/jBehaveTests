Story: Private notes in portfolio

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated
And I generate Some text for private note + UUID and put it to test param someText

Scenario: Private notes in portfolio
GivenStories:
   stories/functional/test/portfolio/create_non_diversified_trading_portfolio.story#{name:Create non diversified trading porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Notes with css selector .social-menu__icon_notes
And I wait until service ready
Then I see header with css selector .portfolio_page_title > div:nth-child(1) is: Private Notes
And I wait small timeout
When I execute javascript CKEDITOR.instances.editor1.setData("%{someText}")
And I wait small timeout
When I execute javascript scroll(1050, 700)
And I click on Save button with css selector input.btn:nth-child(2)
Then I see entered text with css selector pre.ng-binding > p:nth-child(1) is: %{someText}
And I wait small timeout
When I will refresh the page
When I open HOME menu
And I wait until service ready
And I open notes block
Then I see header with css selector .text-xs-left contains: All Private Notes
Then I see text message with css selector .cx-note-list-item-name contains: %{portfolioGenerated}
When I click on portfolio with css selector .col-xs-4 > span:nth-child(1) > span:nth-child(2)
And I wait until service ready
Then I see text with css selector pre.ng-binding > p:nth-child(1) contains: %{someText}
When I click on X button with css selector .cx-note-close-icon
