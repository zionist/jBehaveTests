Story: Check Alerts in portfolio with Non-Diversified Trading Style

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated

!-- Create Non-Diversified Trading portfolio and check Alerts
Scenario: Check Alerts in Non-Diversified Trading Portfolio
GivenStories:
   stories/functional/test/portfolio/create_non_diversified_trading_portfolio.story#{name:Create non diversified trading porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
!-- Turn ON all kind of alerts
When I click on Alerts with css selector .social-menu__icon_alerts
And I wait small timeout
Then I see Header with css selector h1.col-xs-9:nth-child(1) is  Allocation  Alert Settings
!-- Allocation Quality
When I select Daily ByVisibleText from Select element with css selector .cx-alert-setup > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(2) > span:nth-child(1) > select:nth-child(1)
When I clear the Allocation Quality input with css selector div.form-group:nth-child(2) > div:nth-child(1) > span:nth-child(1) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1)
Then I see warning with css selector .has-error > div:nth-child(1) > p:nth-child(2) > span:nth-child(1) is Please enter correct number
When I type 10 into Allocation Quality input with css selector div.form-group:nth-child(2) > div:nth-child(1) > span:nth-child(1) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1)
When I click on Allocation Quality toggle with css selector div.form-group:nth-child(2) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1)
!-- Securities
When I select 3 ByVisibleText from Select element with css selector div.form-group:nth-child(3) > div:nth-child(1) > span:nth-child(1) > span:nth-child(2) > select:nth-child(1)
When I clear the "requires more than a" input with css selector div.form-group:nth-child(3) > div:nth-child(1) > span:nth-child(2) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1)
When I type 3 into "requires more than a" with css selector div.form-group:nth-child(3) > div:nth-child(1) > span:nth-child(2) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1)
When I click on Securities toggle with css selector div.form-group:nth-child(3) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1)
!-- Categories
When I select 3 ByVisibleText from Select element with css selector div.form-group:nth-child(4) > div:nth-child(1) > span:nth-child(1) > span:nth-child(2) > select:nth-child(1)
When I clear the "requires more than a" input with css selector div.form-group:nth-child(4) > div:nth-child(1) > span:nth-child(2) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1)
When I type 3 into "requires more than a" input with css selector div.form-group:nth-child(4) > div:nth-child(1) > span:nth-child(2) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1)
When I click on Categories toggle with css selector div.form-group:nth-child(4) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1)
!-- Update Alerts and make checking of all settings
When I click on Update Rules btn with css selector div.btn-primary
And I wait until service ready
Then I see toastr with css selector .toast-message is Alert settings have been updated
!-- Go to Summary, than back to Alert and check all changes have been saved
When I click on Summary with css selector .social-menu__icon_summary
Then I see Header with css selector .col-sm-9 > h1:nth-child(1) is: Summary
And I wait small timeout
When I click on Alerts with css selector .social-menu__icon_alerts
And I wait small timeout
Then I see Alerts ON with css selector .social-menu__icon_on-off > span:nth-child(1) contains: on
!-- All previous settings correct -> Alert me: Daily / Allocation Quality: 10 / Securities: 3-3 / categories: 3-3
Then I see Daily with css selector .cx-alert-setup > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(2) > span:nth-child(1) > select:nth-child(1) contains: Daily
Then I see element property 10 with css selector div.form-group:nth-child(2) > div:nth-child(1) > span:nth-child(1) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1) has property value with value 10
Then I see 3 with css selector div.form-group:nth-child(3) > div:nth-child(1) > span:nth-child(1) > span:nth-child(2) > select:nth-child(1) contains: 2
Then I see element property 3 with css selector div.form-group:nth-child(3) > div:nth-child(1) > span:nth-child(2) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1) has property value with value 3
Then I see 3 with css selector div.form-group:nth-child(4) > div:nth-child(1) > span:nth-child(1) > span:nth-child(2) > select:nth-child(1) contains: 2
Then I see element property 3 with css selector div.form-group:nth-child(4) > div:nth-child(1) > span:nth-child(2) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1) has property value with value 3
!-- Check toggles turn ON
Then I see element Allocation Quality toggle ON with css selector div.form-group:nth-child(2) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1) has class on
Then I see element Securities toggle ON with css selector div.form-group:nth-child(3) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1) has class on
Then I see element Categories toggle ON with css selector div.form-group:nth-child(4) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1) has class on
