Story: Starts Here. Artificial intelligence


Scenario:
Setup params set user to beginner
Given Set test param username value from property param.beginner.username
And Set test param password value from property param.beginner.password
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario: create a new portfolio as beginner from cash
Meta:
@name create a new portfolio as beginner from cash
Given I logged in with %{username} and %{password}
When I open portfolios block
And I wait until service ready
When I click on Create new with css selector a.btn
And I wait until service ready
Then I see page header with xpath selector //h1[@ng-if="titleId === 'steps.how-to-enter-tickers'"] is: How do you want to enter positions in your portfolio?
When I click on One a time with css selector div.col-xs-6:nth-child(1) > div:nth-child(1)
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: Add Tickers
!-- # Add tickers. Wait until tickers list will be loaded
!--/*
When I click on ticker selection input with css selector #filterInput
And I will wait until ticker element element with css selector #chb34108 will be visible
!-- # Tickers list appears. Add ticker
And I start recording action
And I type AAPL into input field with css selector #filterInput
And I wait small timeout
And I will move in action to A ticker checkbox element with css selector #chb33807
And I will click in action on A ticker checkbox element with css selector #chb33807
And I will click in action on Add button element with css selector .cx-start-here-tickers > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > button:nth-child(1)
Then I perform previously recorded action

!--*/
When I add ticker A with css selector #chb34108 in module(choose one of MALL/Start here/Portfolio/Article/Blog): Start here

And I wait small timeout
When I click on ok next with containsText selector Ok, Next
And I wait until service ready
Then I see pop up window with css selector h3.modal-title > b:nth-child(1) contains: Attention! For retirement accounts
When I click on Proceed as is with css selector button.btn-primary:nth-child(2)
!-- And I click on Yes with css selector button.ng-binding:nth-child(1)
And I wait small timeout
When I click on US Dollar with css selector div.col-xs-4:nth-child(1) > div:nth-child(1)
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: Enter Your Actual Allocation
When I click on ok next with containsText selector Ok, Next
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: What is your Risk Tolerance Level ?
When I click on Moderate with css selector div.col-xs-4:nth-child(2) > div:nth-child(1)
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: How soon do you plan to withdraw funds?
When I click on 0-5 years with css selector div.col-xs-4:nth-child(1) > div:nth-child(1)
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: Do you have cash reserves for the next twelve months?
When I click on Yes with css selector div.col-xs-6:nth-child(1) > div:nth-child(1)
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: Do you plan to add money to your portfolio?
When I click on Yes with css selector div.col-xs-6:nth-child(1) > div:nth-child(1)
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: Please enter a title and US state for your portfolio
When I type %{portfolioGenerated} into portfolio title with css selector #inpName
And I wait small timeout
When I select AK, Alaska ByVisibleText from Select element with css selector #inpState
And I wait small timeout
And I click on U.S. State with css selector div.form-group:nth-child(2) > label:nth-child(1)
And I wait until service ready
And I click on header with css selector .spinner-container > h1:nth-child(1)
And I click on Save button with containsText selector Save
And I wait until service ready
Then I see page header with css selector .col-sm-9 > h1:nth-child(1) is Summary

