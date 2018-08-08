Story: Starts Here. Human intelligence. Investment account or paper trade account with friend


Scenario:
Setup params set user to beginner
Given Set test param username value from property param.beginner.username
And Set test param password value from property param.beginner.password
And I generate Personal + UUID and put it to test param portfolioGenerated
And I generate UUID + @catch01.tickerontest.com and put it to test param generatedEmail

Scenario: create a new portfolio
Meta:
@name create a new portfolio as beginner from cash
Given I logged in with %{username} and %{password}
When I open starts here wizard
And I click on Human Intelligence with css selector .cx-container > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > div:nth-child(2)
When I click on Investment account -> Share with firnd with css selector div.row:nth-child(6) > div:nth-child(2) > div:nth-child(1)

Then I see page header with css selector .spinner-container > h1:nth-child(1) is: How do you want to enter positions in your portfolio?
When I click on One at time with css selector div.col-xs-6:nth-child(1) > div:nth-child(1)
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: Add Tickers

!-- # Add tickers. Wait until tickers list will be loaded
!--/*
When I click on ticker selection input with css selector #filterInput
And I will wait until ticker element element with css selector #chb34108 will be visible
!-- # Tickers list appears. Add ticker
And I start recording action
And I will move in action to A ticker checkbox element with css selector #chb34108
And I will click in action on A ticker checkbox element with css selector #chb34108
And I will click in action on Add button element with css selector .cx-start-here-tickers > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > button:nth-child(1)
Then I perform previously recorded action
!--*/
When I add ticker A with css selector #chb34108 in module(choose one of MALL/Start here/Portfolio/Article/Blog): Start here

!--  Wait until tickers list disappears
And I wait small timeout
When I click on ok next with containsText selector Ok, Next
When I click on US Dollar with css selector div.col-xs-4:nth-child(1) > div:nth-child(1)
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: Enter Your Actual Allocation
When I click on ok next with containsText selector Ok, Next
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: What is your Risk Tolerance Level ?
When I click on 0-5 years with css selector div.col-xs-4:nth-child(1) > div:nth-child(1)
And I wait small timeout
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
And I click on portfolio title with css selector #inpName
And I wait small timeout
And I click on Save button with containsText selector Save
Then I see page header with css selector .cx-container > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(4) > div:nth-child(1) > div:nth-child(1) > h1:nth-child(1) is Portfolio preview
When I click on send request with css selector div.cx-start-here-invite__colored-container:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > button:nth-child(1)
When I type %{generatedEmail} into portfolio title with css selector #inpEmail
And I wait until service ready
When I execute javascript $("button[ng-click='send()']")[0].click()
!-- And I click on Share button with css selector div.col-xs-7:nth-child(1) > button:nth-child(1)
Then I see page header with css selector .cx-container > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > h1:nth-child(1) is Invite to Tickeron
When I type %{generatedEmail} into name input with css selector #inpName
And I wait small timeout
!-- When I type %{generatedEmail} into message input with css selector #inpMessage
!-- And I wait small timeout
And I click on Send invitation with css selector button.btn-primary:nth-child(2)
And I wait until service ready
And I click on ok button with css selector button.ng-binding:nth-child(1)
And I wait until service ready
Then I see page header with css selector .col-sm-9 > h1:nth-child(1) is Summary
And I see portfolio ticker with css selector b.ng-isolate-scope is A
