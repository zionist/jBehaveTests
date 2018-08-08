Story: Starts Here. Artificial intelligence. Investment ideas


Scenario:
Setup params set user to beginner
Given Set test param username value from property param.beginner.username
And Set test param password value from property param.beginner.password
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario: create a new portfolio
Meta:
@name create a new portfolio as beginner from cash
Given I logged in with %{username} and %{password}
When I open starts here wizard
And I click on Artificial Intelligence with css selector div.col-xs-6:nth-child(1) > div:nth-child(1) > div:nth-child(2) > ul:nth-child(3) > li:nth-child(3)
When I click on Investemnt ideas with css selector div.row:nth-child(5) > div:nth-child(2) > div:nth-child(1)

Then I see page header with css selector .spinner-container > h1:nth-child(1) is: Can you provide the exact amount of cash in your portfolio?
When I click on No with css selector .cx-start-here-page-content > div:nth-child(3) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1)
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: What is the market value of your portfolio?
When I click on 0-25k$ with css selector div.col-xs-3:nth-child(1) > div:nth-child(1)
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: What is your Risk Tolerance Level ?
When I click on Conservative with css selector div.col-xs-4:nth-child(1) > div:nth-child(1) > div:nth-child(1)
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: How soon do you plan to withdraw funds?
When I click on 0-5 years with css selector div.col-xs-4:nth-child(1) > div:nth-child(1)
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: Do you have cash reserves for the next twelve months?
When I click on Yes with css selector div.col-xs-6:nth-child(1) > div:nth-child(1)
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: Do you plan to add money to your portfolio?
When I click on Yes with css selector div.col-xs-6:nth-child(1) > div:nth-child(1)


Then I see page header with css selector .spinner-container > h1:nth-child(1) is: Please enter a title and US state for your portfolio
When I type %{portfolioGenerated} into portfolio title with css selector #inpName
When I select AK, Alaska ByVisibleText from Select element with css selector #inpState
And I wait small timeout
And I click on U.S. State with css selector div.form-group:nth-child(2) > label:nth-child(1)
And I wait small timeout
And I click on portfolio title with css selector #inpName
And I wait small timeout
And I click on Save button with css selector button.btn-primary:nth-child(2)
And I wait until service ready
!-- And I pushAndHold on element Chata with css selector .ui-slider-handle
!-- And I wait small timeout
!-- And I move to element 4th rectangle with css selector .cx-portfolio-goal-slider__max
And I wait small timeout
And I click on Plus button with css selector button.btn:nth-child(5)
And I wait small timeout
Then I see Positions required = 1 with css selector .cx-portfolio-goal__right > h2:nth-child(1) contains: 1
When I wait until service ready
And I click on Plus button with css selector button.btn:nth-child(5)
And I wait small timeout
Then I see Positions required = 2 with css selector .cx-portfolio-goal__right > h2:nth-child(1) contains: 2
When I wait until service ready
!--/*
And I click on Plus button with css selector button.btn:nth-child(5)
And I wait small timeout
Then I see Positions required = 3 with css selector .cx-portfolio-goal__right > h2:nth-child(1) contains: 3
When I wait until service ready
And I click on Plus button with css selector button.btn:nth-child(5)
And I wait small timeout
Then I see Positions required = 4 with css selector .cx-portfolio-goal__right > h2:nth-child(1) contains: 4
When I wait until service ready
!--*/
And I click on minus button with css selector button.btn-circle:nth-child(1)
And I wait small timeout
Then I see Positions required = 1 with css selector .cx-portfolio-goal__right > h2:nth-child(1) contains: 1
And I wait small timeout
When I click on Ok, Next with css selector .cx-start-here-page-content > div:nth-child(3) > div:nth-child(3) > button:nth-child(1)
Then I see head with css selector .spinner-container > h1:nth-child(1) contains: You set up your Diversification Score
And I wait small timeout
When I click on Yes, change the goal with css selector div.col-xs-6:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1)
And I wait until service ready
And I click on Plus button with css selector button.btn:nth-child(5)
And I wait small timeout
Then I see Positions required = 1 with css selector .cx-portfolio-goal__right > h2:nth-child(1) contains: 1
When I wait until service ready
And I click on Plus button with css selector button.btn:nth-child(5)
And I wait small timeout
Then I see Positions required = 2 with css selector .cx-portfolio-goal__right > h2:nth-child(1) contains: 2
When I wait until service ready
!--/*
And I click on Plus button with css selector button.btn:nth-child(5)
And I wait small timeout
Then I see Positions required = 3 with css selector .cx-portfolio-goal__right > h2:nth-child(1) contains: 3
When I wait until service ready
And I click on Plus button with css selector button.btn:nth-child(5)
And I wait small timeout
Then I see Positions required = 4 with css selector .cx-portfolio-goal__right > h2:nth-child(1) contains: 4
And I wait small timeout
!--*/
When I click on + with css selector button.pull-right
And I wait small timeout
And I click on ETFs checkbox with css selector span.cx-fund-types__chbx:nth-child(2) > label:nth-child(1) > span:nth-child(2)
And I wait small timeout
And I click on Stocks & REITs checkbox with css selector span.cx-fund-types__chbx:nth-child(3) > label:nth-child(1) > span:nth-child(2)
And I wait small timeout
When I click on Ok, Next with css selector .cx-start-here-page-content > div:nth-child(3) > div:nth-child(3) > button:nth-child(1)
Then I see head with css selector .spinner-container > h1:nth-child(1) contains: You set up your Diversification Score
When I click on Proceed to allocator with css selector .col-xs-11 > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1)
Then I see page header with css selector .cx-container > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > h1:nth-child(1) is: A.I.dvisor created the following investment ideas and saved them to your portfolio %{portfolioGenerated}
And I wait small timeout
When I click on Ok, Next with css selector button.btn-primary:nth-child(2)
And I wait until service ready
And I click on Ok button with css selector button.ng-binding
And I wait until service ready
Then I see portfolio title with css selector p.cx-breadcrumbs:nth-child(2) > span:nth-child(3) > a:nth-child(1) is %{portfolioGenerated}
And I see page header with css selector .col-sm-9 > h1:nth-child(1) is Summary






