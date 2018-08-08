Story: A.I. Pattern Recognitions in Portfolio

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario: A.I. Pattern Recognitions
GivenStories:
         stories/functional/test/portfolio/create_investement_portfolio.story#{name:Create investment porfolio}
Given Do nothing
Given I connect card as client for %{username} with %{password}
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Analyze with css selector div.social-menu:nth-child(4) > div:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > span:nth-child(2) > button:nth-child(3)
And I click on more with css selector div.cx-portfolios-action-menu-group:nth-child(3) > div:nth-child(8) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > span:nth-child(1)
And I click on A.I. Pattern Recognitions with css selector div.cx-portfolios-action-menu-group:nth-child(2) > span:nth-child(2) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > span:nth-child(1)
Then I see Subscribe with css selector h4.modal-title:nth-child(1) contains: Subscribe
When I click on Subscribe with css selector button.ng-binding:nth-child(2)
And I wait until service ready
When I execute javascript $("input.ng-pristine:nth-child(1)").click()
When I click on Subscribe button with css selector .btn-primary-wiz
!-- And I wait until service ready
!-- Then I see header with css selector .col-lg-5 > h1:nth-child(1) contains: A. I. Pattern Recognition
!-- When I click on Subscribe button with css selector button.btn:nth-child(6)
And I wait until service ready
When I click on Analyze with css selector div.social-menu:nth-child(4) > div:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > span:nth-child(2) > span:nth-child(1)
And I wait until service ready
And I click on  A.I. Pattern Recognitions with css selector div.cx-portfolios-action-menu-group:nth-child(3) > span:nth-child(7) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > span:nth-child(1)
And I wait until service ready
Then I see Analyze A.I. Pattern Recognition  with css selector h1.col-xs-10 contains: Analyze A.I. Pattern Recognition
When I click on bullish with css selector .cx-portfolio-patterns-search__panel > div:nth-child(2) > label:nth-child(1) > span:nth-child(2)
And I wait small timeout
And I click on bullish with css selector .cx-portfolio-patterns-search__panel > div:nth-child(2) > label:nth-child(1) > span:nth-child(2)
And I wait small timeout
When I click on bearish with css selector div.col-xs-2:nth-child(3) > label:nth-child(1) > span:nth-child(2)
And I wait small timeout
And I click on bearish with css selector div.col-xs-2:nth-child(3) > label:nth-child(1) > span:nth-child(2)
And I wait small timeout
When I click on X button with css selector .btn-cancel
And I wait until service ready
Then I see Summary header with css selector .col-sm-9 > h1:nth-child(1) contains: Summary
And I wait small timeout
When I remove portfolio

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario: Patterns Unsubscribe in portfolio
GivenStories:
    stories/ai_patterns/patterns_subscription.story#{name:Patterns Unsubscribe}
Given Do nothing
