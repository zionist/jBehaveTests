Story: Change Terms add new portfolio in terms


Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password
And I generate Advisor_ + UUID and put it to test param portfolioGenerated
And I generate Some text for private note + UUID and put it to test param someText

Scenario: Change Terms
GivenStories:
   stories/functional/test/portfolio/create_non_diversified_trading_portfolio.story#{name:Create non diversified trading porfolio}

Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Get advice with xpath selector //button[contains(., 'Get Advice')]
And I wait until service ready
Then I see Change terms with css selector .portfolio_topplate__v_divider > div:nth-child(1) > div:nth-child(1) contains: Change terms
When I click on Change Terms with css selector a.btn:nth-child(4)
And I wait until service ready
Then I see header with css selector .social-title > h1:nth-child(2) contains: Request for Change of Terms
When I clear the field for letter with css selector .form-control
And I type Hi, I'm want to add this portfolio to our T&C into letter to advisor with css selector .form-control
And I wait small timeout
When I execute javascript scroll(1050, 700)
And I click on Add more with css selector .btn-secondary-sm
And I wait small timeout
And I click on previously created portfolio titile with containsText selector %{portfolioGenerated}
And I execute javascript $("td:contains('%{portfolioGenerated}')").parent().children().last().children().last().click()
And I wait small timeout
!-- And I click on on eye near created portfolio with css selector tr.ng-scope:nth-child(6) > td:nth-child(4) > a:nth-child(1) > span:nth-child(1)
!-- And I wait small timeout
And I click on Done button with xpath selector //button[contains(., 'Done')]
And I wait small timeout
And I click on Send button with xpath selector //button[contains(., 'Send')]
Then I see Advisor-Client Private Work Area with css selector .pull-left contains: Advisor-Client Private Work Area


Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Advisor_ + UUID and put it to test param portfolioGenerated
And I generate Some text for private note + UUID and put it to test param someText

Scenario: Change Terms advisor side

Given I logged in with %{username} and %{password}
When I open First notification on Notification page
Then I see Advisor-Client Private Work Area with css selector .pull-left contains: Advisor-Client Private Work Area
When I click on Change of Terms pending with  link selector Change of Terms pending
And I wait until service ready
Then I see Hi, I'm want to add this portfolio to our T&C with css selector .ac-request-form__text contains: Hi, I'm want to add this portfolio to our T&C

When I wait small timeout
!-- When I clear the $ / month with css selector input.ng-touched
!-- And I wait small timeout
!-- And I type 10 into $ / month with css selector input.ng-touched
And I wait until service ready
When I clear the Up to, $ with css selector div.col-xs-3:nth-child(3) > div:nth-child(1) > input:nth-child(2)
And I wait until service ready
And I type 1000 into Up to, $ with css selector div.col-xs-3:nth-child(3) > div:nth-child(1) > input:nth-child(2)
And I wait until service ready
When I clear the Annual fee, % with css selector div.col-xs-3:nth-child(4) > div:nth-child(1) > input:nth-child(2)
And I wait until service ready
And I type 3 into Annual fee, % with css selector div.col-xs-3:nth-child(4) > div:nth-child(1) > input:nth-child(2)
And I wait until service ready
When I type Text to client into Text to client with css selector textarea.form-control
And I wait until service ready
When I execute javascript $("input[name*='isAgreeWithTickeron']").click()
And I click on Submit with xpath selector //button[contains(., 'Submit')]
And I wait until service ready
Then I see Advisor-Client Private Work Area with css selector .pull-left contains: Advisor-Client Private Work Area
Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password

Scenario: Change Terms client accept

Given I logged in with %{username} and %{password}
When I open First notification on Notification page
Then I see Advisor-Client Private Work Area with css selector .pull-left contains: Advisor-Client Private Work Area
When I click on Change of Terms pending with link selector Change of Terms pending
And I wait until service ready
Then I see Text to client with css selector .ac-request-form__text contains: Text to client
Then I see $10.00 with css selector div.col-xs-12:nth-child(3) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) > h1:nth-child(1) contains: $10.00
Then I see 1,000 with css selector div.col-xs-6:nth-child(3) > div:nth-child(1) > div:nth-child(1) > h1:nth-child(1) contains: 1,000
Then I see 3 with css selector div.col-xs-6:nth-child(3) > div:nth-child(1) > div:nth-child(2) > h1:nth-child(1) contains: 3
And I wait small timeout
When I execute javascript $("input[name*='isAgreeWithAdvisor']").click()
When I execute javascript $("input[name*='isAgreeWithTickeron']").click()
When I wait until service ready
When I click on Agree wwith terms with xpath selector //button[contains(., 'Agree with terms')]
And I wait until service ready
Then I see Advisor-Client Private Work Area with css selector .pull-left contains: Advisor-Client Private Work Area














