Story: Mutual Funds story

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Mutual Funds
Meta:
@name Mutual Funds
Given I logged in with %{username} and %{password}
!-- Open Tickers page
When I open COMMUNITY menu
When I click on Tickers  with css selector #community__menu__tickers-link
And I wait until service ready
Then I see Tickers page header with css selector .social-title > h1:nth-child(1) is: List of tickers
!-- Choose Ticker AAANX
When I type AAANX into tickers input fields with css selector #community__tickers__search-input
And I wait big timeout
And I click on AAANX ticker with css selector .tickers-list > table:nth-child(6) > tbody:nth-child(2) > tr:nth-child(1)
And I wait until service ready
Then I see Ticker page header with css selector .social-title > h1:nth-child(1) is: Horizon Shs -N- Active Asset Allocation Fund
!-- Choose Fundamentals menu
When I click on Fundamentals left menu item with css selector #community__tickers__menu__fundamentals-link
And I wait until service ready
Then I see Fundamentals page header with css selector h1.ng-scope is: AAANX fundamentals
!-- Check, that 6 categories  are present
Then I see Categories Net Assets with css selector div.col-xs-6:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) is: Net Assets
!-- Then I see Categories Fund Existence with css selector div.col-xs-6:nth-child(2) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) is: Fund Existence
!-- Then I see Categories Turnover with css selector div.col-xs-6:nth-child(3) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) is: Turnover
!-- Then I see Categories Total Expence Ratio with css selector div.col-xs-6:nth-child(4) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) contains: Total Expence Ratio
Then I see Categories Min. Initial Investment with css selector div.col-xs-6:nth-child(2) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) is: Min. Initial Investment
Then I see Categories Morningstar Category with css selector div.col-xs-6:nth-child(3) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) is: Morningstar Category


!-- Choose all Categories from Customize display of Mutual Funds
When I click on customize display  with  css selector button.btn-secondary-sm:nth-child(2)
And I wait small timeout
When I will execute javascript $('label:contains("Manager Tenure")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Front Load")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Manager")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Administrative Fee")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Annual Report Gross Expense Ratio")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Assets in Top Ten Holdings")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Average Credit Quality")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Average Effective Duration")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Average Effective Maturity")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Fund Share Class Net Assets")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Fund Type")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Investment Style")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Management Fee")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Modified Duration")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Fund of Funds")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Index Fund")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("No Load Fund")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Number of Long Holdings")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Number of Net Holdings")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Number of Short Holdings")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Prospectus Acquired Expense Ratio")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Weighting Top Ten Holdings")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Select all")').children('input').click()
And I wait small timeout
And I click on crost "X" with xpath selector //button[contains(., 'Apply')]
And I wait small timeout
And I wait until service ready
!-- Check, that 4 categories  are present
Then I see Categories Total Expence Ratio with css selector div.col-xs-6:nth-child(4) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) is: Total Expence Ratio
Then I see Categories Front Load with css selector div.col-xs-6:nth-child(5) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) is: Front Load
Then I see Categories Manager with css selector div.col-xs-6:nth-child(6) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) is: Manager
Then I see Prospectus Manager Tenure with css selector div.col-xs-6:nth-child(7) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) is: Manager Tenure

!-- Unchoose all previously choosed Categories from Customize display of Mutual Funds
When I click on customize display  with  css selector button.btn-secondary-sm:nth-child(2)
And I wait small timeout
When I will execute javascript $('label:contains("Front Load")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Manager")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Administrative Fee")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Annual Report Gross Expense Ratio")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Assets in Top Ten Holdings")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Average Credit Quality")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Average Effective Duration")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Average Effective Maturity")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Fund Share Class Net Assets")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Fund Type")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Investment Style")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Management Fee")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Modified Duration")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Fund of Funds")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Index Fund")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("No Load Fund")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Number of Long Holdings")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Number of Net Holdings")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Number of Short Holdings")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Prospectus Acquired Expense Ratio")').children('input').click()
And I wait small timeout
And I will execute javascript $('label:contains("Weighting Top Ten Holdings")').children('input').click()
And I wait small timeout
And I click on crost "X" with xpath selector //button[contains(., 'Apply')]
And I wait until service ready
Given Do nothing
!--/*
Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario: Work with Mutual Funds ticker as expert user
GivenStories:
    stories/community/tickers/fundamentals/mutual_funds.story#{name:Mutual Funds}
Given Do nothing

Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password

Scenario: Work with Mutual Funds ticker as intermediat user
GivenStories:
    stories/community/tickers/fundamentals/mutual_funds.story#{name:Mutual Funds}
Given Do nothing

Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario: Work with Mutual Funds ticker as beginner user
GivenStories:
   stories/community/tickers/fundamentals/mutual_funds.story#{name:Mutual Funds}
Given Do nothing
!--*/