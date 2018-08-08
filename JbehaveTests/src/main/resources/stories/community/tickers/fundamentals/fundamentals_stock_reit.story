Story: As Intermediate checks Fundamentals for the ticker AAPL (Stock $ REIT)

Scenario:
Setup params. Set user to Intermediate
Meta:
@basic
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password


Scenario: Checking Fundamentals for the ticker AAPL (Stosk $ REIT)
Meta:
@name Checking Fundamentals for the ticker AAPL (Stosk $ REIT)
Given I logged in with %{username} and %{password}


!-- Go to list of tickers and select AAPL
When I open COMMUNITY menu
When I click on Tickers  with css selector #community__menu__tickers-link
And I wait until service ready
Then I see Tickers page header with css selector .social-title > h1:nth-child(1) is: List of tickers
And I wait small timeout
When I click on Stock & REIT  with css selector label.cx-radio:nth-child(5) > span:nth-child(2)
And I wait small timeout
When I type AAPL into searching field with css selector #community__tickers__search-input
And I wait big timeout
When I click on AAPL with css selector .tickers-list > table:nth-child(6) > tbody:nth-child(2) > tr:nth-child(1)
And I wait until service ready

!-- Checking Fundamentals
Then I see Page Header with css selector .social-title > h1:nth-child(1) is Apple Inc.
When I click on Fundamentals with css selector #community__tickers__menu__fundamentals-link

!-- Click  on Customize display REITs. Mark the 5 first check boxes and verify them in the table
!-- Category ROE
When I click on Customize display REITs with css selector button.btn-secondary-sm:nth-child(2)
When I will execute javascript $('label:contains("ROE")').children('input').click()
And I wait small timeout

!-- Category Book Value
When I will execute javascript $('label:contains("Book Value")').children('input').click()
And I wait small timeout

!-- Category P/B Ratio
When I will execute javascript $('label:contains("P/B Ratio")').children('input').click()
And I wait small timeout

!-- Category Cash Flow
When I will execute javascript $('label:contains("Cash Flow")').children('input').click()
And I wait small timeout

!-- Category Earnings
When I will execute javascript $('label:contains("Earnings")').children('input').click()
And I wait small timeout

!-- Mark the other check boxes
!-- Average Daily Volume YTD
When I will execute javascript $('label:contains("Average Daily Volume YTD")').children('input').click()
And I wait small timeout
!-- Common Shares Outstanding - Security Level
When I will execute javascript $('label:contains("Common Shares Outstanding - Security Level")').children('input').click()
And I wait small timeout
!-- Current Ratio
When I will execute javascript $('label:contains("Current Ratio")').children('input').click()
And I wait small timeout
!-- Current Revenue Per Employee
When I will execute javascript $('label:contains("Current Revenue Per Employee")').children('input').click()
And I wait small timeout
!-- Dividends Per Share - Security
When I will execute javascript $('label:contains("Dividends Per Share - Security")').children('input').click()
And I wait small timeout
!-- EBITDA
When I will execute javascript $('label:contains("EBITDA")').children('input').click()
And I wait small timeout
!-- Float
When I will execute javascript $('label:contains("Float")').children('input').click()
And I wait small timeout
!-- Gross Income Margin
When I will execute javascript $('label:contains("Gross Income Margin")').children('input').click()
And I wait small timeout
!-- Float - Current
When I will execute javascript $('label:contains("Float - Current")').children('input').click()
And I wait small timeout
!-- Revenue To Assets
When I will execute javascript $('label:contains("Revenue To Assets")').children('input').click()
And I wait small timeout
!-- Shares Held By Institutions
When I will execute javascript $('label:contains("Shares Held By Institutions")').children('input').click()
And I wait small timeout
!-- Shares Outstanding - Current
When I will execute javascript $('label:contains("Shares Outstanding - Current")').children('input').click()
And I wait small timeout
!-- Total Liabilities
When I will execute javascript $('label:contains("Total Liabilities")').children('input').click()
And I wait small timeout
!-- Total Volume MTD
When I will execute javascript $('label:contains("Total Volume MTD")').children('input').click()
And I wait small timeout
And I click on crost "X" with xpath selector //button[contains(., 'Apply')]
And I wait small timeout

!-- Check some selected categories
Then I see Categories container with css selector div.row:nth-child(8) contains: Total Volume MTD
Then I see Categories container with css selector div.row:nth-child(8) contains: Total Liabilities
Then I see Categories container with css selector div.row:nth-child(8) contains: Shares Outstanding - Current
Then I see Categories container with css selector div.row:nth-child(8) contains: Shares Held By Institutions
Then I see Categories container with css selector div.row:nth-child(8) contains: Revenue To Assets
Then I see Categories container with css selector div.row:nth-child(8) contains: Float
Then I see Categories container with css selector div.row:nth-child(8) contains: Gross Income Margin

!-- Mark the other check boxes unactive
!-- Category ROE
When I click on Customize with css selector button.btn-secondary-sm:nth-child(2)
When I wait small timeout
When I will execute javascript $('label:contains("ROE")').children('input').click()
And I wait small timeout

!-- Category Book Value
When I will execute javascript $('label:contains("Book Value")').children('input').click()
And I wait small timeout

!-- Category P/B Ratio
When I will execute javascript $('label:contains("P/B Ratio")').children('input').click()
And I wait small timeout

!-- Category Cash Flow
When I will execute javascript $('label:contains("Cash Flow")').children('input').click()
And I wait small timeout

!-- Category Earnings
When I will execute javascript $('label:contains("Earnings")').children('input').click()
And I wait small timeout

!-- Average Daily Volume YTD
When I will execute javascript $('label:contains("Average Daily Volume YTD")').children('input').click()
And I wait small timeout
!-- Common Shares Outstanding - Security Level
When I will execute javascript $('label:contains("Common Shares Outstanding - Security Level")').children('input').click()
And I wait small timeout
!-- Current Ratio
When I will execute javascript $('label:contains("Current Ratio")').children('input').click()
And I wait small timeout
!-- Current Revenue Per Employee
When I will execute javascript $('label:contains("Current Revenue Per Employee")').children('input').click()
And I wait small timeout
!-- Dividends Per Share - Security
When I will execute javascript $('label:contains("Dividends Per Share - Security")').children('input').click()
And I wait small timeout
!-- EBITDA
When I will execute javascript $('label:contains("EBITDA")').children('input').click()
And I wait small timeout
!-- Float
When I will execute javascript $('label:contains("Float")').children('input').click()
And I wait small timeout
!-- Gross Income Margin
When I will execute javascript $('label:contains("Gross Income Margin")').children('input').click()
And I wait small timeout
!-- Float - Current
When I will execute javascript $('label:contains("Float - Current")').children('input').click()
And I wait small timeout
!-- Revenue To Assets
When I will execute javascript $('label:contains("Revenue To Assets")').children('input').click()
And I wait small timeout
!-- Shares Held By Institutions
When I will execute javascript $('label:contains("Shares Held By Institutions")').children('input').click()
And I wait small timeout
!-- Shares Outstanding - Current
When I will execute javascript $('label:contains("Shares Outstanding - Current")').children('input').click()
And I wait small timeout
!-- Total Liabilities
When I will execute javascript $('label:contains("Total Liabilities")').children('input').click()
And I wait small timeout
!-- Total Volume MTD
When I will execute javascript $('label:contains("Total Volume MTD")').children('input').click()
And I wait small timeout





Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
And Set test param password value from property param.advisor.password


Scenario: Work with fundamentals as Advisor user
GivenStories:
   stories/community/tickers/fundamentals/fundamentals_stock_reit.story#{name:Checking Fundamentals for the ticker AAPL (Stosk $ REIT)},
Given Do nothing

Scenario:
Setup params. Set user to Expert
Given Set test param username value from property param.expert.username
And Set test param password value from property param.expert.password

Scenario: Work with fundamentals as Expert user
GivenStories:
    stories/community/tickers/fundamentals/fundamentals_stock_reit.story#{name:Checking Fundamentals for the ticker AAPL (Stosk $ REIT)},
Given Do nothing

Scenario:
Setup params. Set user to Beginner
Given Set test param username value from property param.beginner.username
And Set test param password value from property param.beginner.password

Scenario: Work with fundamentals as Beginner user
GivenStories:
   stories/community/tickers/fundamentals/fundamentals_stock_reit.story#{name:Checking Fundamentals for the ticker AAPL (Stosk $ REIT)},
Given Do nothing
