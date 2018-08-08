Story: Change Terms remove portfolio from terms


Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password
!-- And I generate Advisor_ + UUID and put it to test param portfolioGenerated
And I generate Some text for private note + UUID and put it to test param someText
Given Set test param clientName with value Mike In.
Given Set test param advisorName with value James Adv.

Scenario: Change Terms
GivenStories:
Given I logged in with %{username} and %{password}
!-- Open ACWA page
When I open ADVISORS menu
And I open Current Advisor menu
Then I see advisor name with css selector a[href='#!/members/159'] contains: %{advisorName}
When I wait until service ready
And I wait small timeout
And I execute javascript  $("button[class*='btn btn-secondary btn-secondary-sm ac-rr-bid-dets__change ng-scope']").click()
And I wait until service ready
Then I see header with css selector .social-title > h1:nth-child(2) contains: Request for Change of Terms
When I clear the field for letter with css selector .form-control
And I type Hi, I'm want to remove one portfolio from T&C into letter to advisor with css selector .form-control
And I wait small timeout
And I execute javascript  $("button[ng-click*='addMorePortfolios()']").click()
!-- And I click on Add more with css selector .btn-secondary-sm
And I wait small timeout
And I click on previously created portfolio titile with containsText selector Advisor_
And I execute javascript $("td:contains('Advisor_')").parent().children().last().children().last().click()
And I wait small timeout
And I click on Done button with xpath selector //button[contains(., 'Done')]
And I wait big timeout
And I click on Send button with xpath selector //button[contains(., 'Send')]
Then I see Advisor-Client Private Work Area with css selector .pull-left contains: Advisor-Client Private Work Area

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario: Change Terms advisor side

Given I logged in with %{username} and %{password}
When I open First notification on Notification page
Then I see Advisor-Client Private Work Area with css selector .pull-left contains: Advisor-Client Private Work Area
When I click on Change of Terms pending with css selector table.table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(1) > a:nth-child(1) > span:nth-child(1)
And I wait until service ready
Then I see Hi, I'm want to add this portfolio to our T&C with css selector .ac-request-form__text contains: Hi, I'm want to remove one portfolio from T&C
!--/*
When I clear the $ / month with css selector form.ng-pristine > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > input:nth-child(2)
And I wait small timeout
And I type 8 into $ / month with css selector form.ng-valid-max > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > input:nth-child(2)
And I wait small timeout
When I clear the Up to, $ with css selector form.ng-valid-min > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > input:nth-child(2)
And I wait small timeout
And I type 1007 into Up to, $ with css selector form.ng-valid-max > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > input:nth-child(2)
And I wait small timeout
When I clear the Annual fee, % with css selector form.ng-valid-min > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > input:nth-child(2)
And I wait small timeout
And I type 2 into Annual fee, % with css selector form.ng-valid-max > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > input:nth-child(2)
And I wait small timeout
!--*/
When I clear the Up to, $ with css selector div.col-xs-3:nth-child(3) > div:nth-child(1) > input:nth-child(2)
And I wait until service ready
And I type 1007 into Up to, $ with css selector div.col-xs-3:nth-child(3) > div:nth-child(1) > input:nth-child(2)
And I wait until service ready
When I clear the Annual fee, % with css selector div.col-xs-3:nth-child(4) > div:nth-child(1) > input:nth-child(2)
And I wait until service ready
And I type 2 into Annual fee, % with css selector div.col-xs-3:nth-child(4) > div:nth-child(1) > input:nth-child(2)
And I wait until service ready
When I type Text to client into Text to client with css selector textarea.form-control
And I wait until service ready
When I execute javascript $("input[name*='isAgreeWithTickeron']").click()
And I wait small timeout
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
Then I see 1,007 with css selector div.col-xs-6:nth-child(3) > div:nth-child(1) > div:nth-child(1) > h1:nth-child(1) contains: 1,007
Then I see 2 with css selector div.col-xs-6:nth-child(3) > div:nth-child(1) > div:nth-child(2) > h1:nth-child(1) contains: 2
When I execute javascript $("input[name*='isAgreeWithAdvisor']").click()
When I execute javascript $("input[name*='isAgreeWithTickeron']").click()
When I click on Agree with terms with xpath selector //button[contains(., 'Agree with terms')]
And I wait until service ready
Then I see Advisor-Client Private Work Area with css selector .pull-left contains: Advisor-Client Private Work Area




