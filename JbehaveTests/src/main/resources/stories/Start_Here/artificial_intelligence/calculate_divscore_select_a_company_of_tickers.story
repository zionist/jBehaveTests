Story: Starts Here. Artificial intelligence. Calculate Divscore


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
When I click on Calculate div score with css selector div.row:nth-child(4) > div:nth-child(2) > div:nth-child(1)
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: How do you want to enter positions in your portfolio?
When I click on Select your company 401(k) with css selector .cx-start-here-page-content > div:nth-child(3) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1)
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: Add Tickers
!-- # Add tickers.
When I click on ticker selection input with css selector #cxCompanyTickers_Input
And I type FACEBOOK into search fild with css selector #cxCompanyTickers_Input
And I wait small timeout
And I click on FACEBOOK INC with css selector div.cx-company-tickers__list__item:nth-child(1)
And I wait small timeout
And I click on Add selected with containsText selector Add Selected
And I wait small timeout
!-- Ok next
When I click on ok next with css selector div.row:nth-child(5) > div:nth-child(1) > div:nth-child(4) > div:nth-child(2) > button:nth-child(1)
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: How would you like to enter allocations ?
!-- Select US Dollar
When I click on US Dollar with css selector div.col-xs-4:nth-child(1) > div:nth-child(1)
Then I see page header with css selector .spinner-container > h1:nth-child(1) is: Enter Your Actual Allocation
When I click on ok next with css selector .cx-start-here-page-content > div:nth-child(3) > div:nth-child(1) > div:nth-child(2) > button:nth-child(1)
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
And I click on portfolio title with css selector #inpName
And I wait small timeout
And I click on Save button with css selector button.btn-primary:nth-child(2)
And I wait until service ready
Then I see page header with css selector .cx-container > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > h1:nth-child(1) contains: Your Diversification Score
When I click on Finish button with css selector div.text-center:nth-child(4) > button:nth-child(1)
And I click on Ok button with css selector button.ng-binding
And I wait until service ready
Then I see portfolio title with css selector p.cx-breadcrumbs:nth-child(2) > span:nth-child(3) > a:nth-child(1) is %{portfolioGenerated}
And I see page header with css selector .col-sm-9 > h1:nth-child(1) is Summary






