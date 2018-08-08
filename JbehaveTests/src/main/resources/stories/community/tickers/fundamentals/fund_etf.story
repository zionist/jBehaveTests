Story: Fundamentals ETF

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Check fundamentals ETF
Meta:
@Check fundamentals ETF
Given I logged in with %{username} and %{password}
!-- open SPY -> fundamentals
When I open COMMUNITY menu
When I click on Tickers  with css selector #community__menu__tickers-link
And I wait until service ready
When I type SPY into searching form  with css selector #community__tickers__search-input
And I wait big timeout
And I click on SPY with css selector .tickers-list > table:nth-child(6) > tbody:nth-child(2) > tr:nth-child(1)
And I wait small timeout
Then I see header with css selector .social-title > h1:nth-child(1) is: SPDR S&P500 ETF Trust Units
When I click on fundamentals left menu with css selector #community__tickers__menu__fundamentals-link
Then I see header with css selector h1.ng-scope is: SPY fundamentals
!-- checking default attributes
And I see Net Assets row with css selector div.col-xs-6:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) is: Net Assets
And I see Yield row with css selector div.col-xs-6:nth-child(2) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) contains: Yield
And I see Total Expence Ratio row with css selector div.col-xs-6:nth-child(3) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) is: Total Expence Ratio
!-- And I see Total Expence Ratio row with css selector div.col-xs-6:nth-child(4) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) contains: Total Expence Ratio
And I see Turnover row with css selector div.col-xs-6:nth-child(4) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) is: Turnover
And I see Investment Style row with css selector div.col-xs-6:nth-child(5) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) contains: Investment Style
And I see Capitalization row with css selector div.col-xs-6:nth-child(6) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) contains: Capitalization
And I see Risk (Beta) row with css selector div.col-xs-6:nth-child(7) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) contains: Risk (Beta)
!--/*
And I see Manager Tenure row with css selector div.col-xs-6:nth-child(9) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) contains: Manager Tenure
And I see Administrative Fee row with css selector div.col-xs-6:nth-child(10) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) contains: Administrative Fee
And I see Annual Report Gross Expense Ratio row with css selector div.col-xs-6:nth-child(11) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) contains: Annual Report Gross Expense Ratio
And I see Assets in Top Ten Holdings row with css selector div.col-xs-6:nth-child(12) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) contains: Assets in Top Ten Holdings
And I see Average Credit Quality row with css selector div.col-xs-6:nth-child(13) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) contains: Average Credit Quality
And I see Average Effective Duration row with css selector div.col-xs-6:nth-child(14) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) contains: Average Effective Duration
And I see Average Effective Maturity row with css selector div.col-xs-6:nth-child(15) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) contains: Average Effective Maturity
!--*/

!-- customize display of etf
When I click on customize display  with  css selector button.btn-secondary-sm:nth-child(2)
And I wait small timeout
!--/*
When I click on Net Assets with css selector div.ticker-fundamentals__col-checkbox:nth-child(1) > div:nth-child(1) > label:nth-child(1) > span:nth-child(2)
When I wait small timeout
When I will execute javascript $('label:contains("Yield")').children('input').click()
When I wait small timeout
When I will execute javascript $('label:contains("Fund Existence")').children('input').click()
When I wait small timeout
When I will execute javascript $('label:contains("Total Expence Ratio")').children('input').click()
When I wait small timeout
When I will execute javascript $('label:contains("Turnover")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Investment Style")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Capitalization")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Risk (Beta)")').children('input').click()
!--*/
And I wait small timeout
When I will execute javascript $('label:contains("Manager Tenure")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Administrative Fee")').children('input').click()
When I wait small timeout
When I will execute javascript $('label:contains("Annual Report Gross Expense Ratio")').children('input').click()
When I wait small timeout
When I will execute javascript $('label:contains("Assets in Top Ten Holdings")').children('input').click()
When I wait small timeout
When I will execute javascript $('label:contains("Average Credit Quality")').children('input').click()
When I wait small timeout
When I will execute javascript $('label:contains("Average Effective Duration")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Average Effective Maturity")').children('input').click()
And I wait small timeout


When I click on Fund Share Class Net Assets with css selector div.col-sm-6:nth-child(17) > div:nth-child(1) > label:nth-child(1) > span:nth-child(2)
And I wait small timeout
When I will execute javascript $('label:contains("Fund Type")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Management Fee")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Modified Duration")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Fund of Funds")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Index Fund")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("No Load Fund")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Number of Long Holdings")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Number of Net Holdings")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Number of Short Holdings")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Prospectus Acquired Expense Ratio")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Weighting Top Ten Holdings")').children('input').click()
And I wait small timeout
And I click on crost "X" with xpath selector //button[contains(., 'Apply')]
And I wait small timeout

!-- Check some categories
Then I see Categories container with css selector div.row:nth-child(8) contains: Weighting Top Ten Holdings
And I see Categories container with css selector div.row:nth-child(8) contains: Prospectus Acquired Expense Ratio
And I see Categories container with css selector div.row:nth-child(8) contains: Number of Short Holdings
And I see Categories container with css selector div.row:nth-child(8) contains: Number of Long Holdings
And I see Categories container with css selector div.row:nth-child(8) contains: No Load Fund
And I see Categories container with css selector div.row:nth-child(8) contains: Index Fund
And I see Categories container with css selector div.row:nth-child(8) contains: Fund of Funds

!-- uncheck ETF attributes
When I click on Customize with css selector button.btn-secondary-sm:nth-child(2)
When I wait small timeout
When I will execute javascript $('label:contains("Yield")').children('input').click()
When I wait small timeout
When I will execute javascript $('label:contains("Fund Existence")').children('input').click()
When I wait small timeout
When I will execute javascript $('label:contains("Total Expence Ratio")').children('input').click()
When I wait small timeout
When I will execute javascript $('label:contains("Turnover")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Investment Style")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Capitalization")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Risk (Beta)")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Manager Tenure")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Administrative Fee")').children('input').click()
When I wait small timeout
When I will execute javascript $('label:contains("Annual Report Gross Expense Ratio")').children('input').click()
When I wait small timeout
When I will execute javascript $('label:contains("Assets in Top Ten Holdings")').children('input').click()
When I wait small timeout
When I will execute javascript $('label:contains("Average Credit Quality")').children('input').click()
When I wait small timeout
When I will execute javascript $('label:contains("Average Effective Duration")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Average Effective Maturity")').children('input').click()
And I wait small timeout
When I click on Fund Share Class Net Assets with css selector div.col-sm-6:nth-child(17) > div:nth-child(1) > label:nth-child(1) > span:nth-child(2)
And I wait small timeout
When I will execute javascript $('label:contains("Fund Type")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Management Fee")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Modified Duration")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Fund of Funds")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Index Fund")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("No Load Fund")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Number of Long Holdings")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Number of Net Holdings")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Number of Short Holdings")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Prospectus Acquired Expense Ratio")').children('input').click()
And I wait small timeout
When I will execute javascript $('label:contains("Weighting Top Ten Holdings")').children('input').click()
And I wait small timeout
And I click on crost "X" with xpath selector //button[contains(., 'Apply')]
And I wait small timeout
And I will refresh the page

