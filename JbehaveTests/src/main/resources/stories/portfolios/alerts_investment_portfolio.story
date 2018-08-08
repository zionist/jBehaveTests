Story: Check Alerts in portfolio with Investment Style

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated

!-- Create Investment portfolio and check Alerts
Scenario: Check Alerts in Investment Portfolio
GivenStories:
      stories/functional/test/portfolio/create_investement_portfolio.story#{name:Create investment porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
!-- Need to type some tickers and make allocation to increase DivScore (because impossible to turn on alerts when divscore 500)
When I click on Adjust Actual Positions with css selector .social-menu__icon_adjust
And I wait small timeout
When I click on Select tickers by employer with css selector .cx-portfolios-add-remove-tickers__settings_radio-buttons > div:nth-child(3) > label:nth-child(1) > span:nth-child(2)
And I type I into search field with css selector #cxCompanyTickers_Input
And I wait small timeout
And I will move in action to INOVA Health system element with css selector div.cx-company-tickers__list__item:nth-child(1)
And I click on INOVA Health system with css selector div.cx-company-tickers__list__item:nth-child(1)
And I click on Add all btn with css selector a.btn:nth-child(2)
!-- Percentages
And I execute javascript $("label.cx-radio:nth-child(2) > input:nth-child(1)")
And I wait small timeout
And I execute javascript $("tr.ng-scope:nth-child(2) > td:nth-child(4) > span:nth-child(2) > div:nth-child(2)")[0].click()
When I clear the %input with css selector input.form-control:nth-child(2)
And I type 15 into %input with css selector input.form-control:nth-child(2)
When I click on Apply btn with css selector input.btn:nth-child(2)
When I click on Done btn with css selector button.btn-primary-sm:nth-child(1)
And I wait until service ready
!-- Then I see Warning! with css selector h4.modal-title:nth-child(1) contains: Warning!
!-- When I click on Ignore button with css selector button.ng-binding:nth-child(2)
!-- And I wait until service ready
!-- Alerts
When I click on Alerts with css selector .social-menu__icon_alerts
And I wait small timeout
Then I see Header with css selector h1.col-xs-9:nth-child(1) is  Allocation  Alert Settings
When I type Weekly into Alert me input with css selector div.form-group:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(2) > span:nth-child(1) > select:nth-child(1)
And I wait small timeout
!-- Divscore
When I clear the My DivScore ® deviates by input with css selector div.form-group:nth-child(2) > div:nth-child(1) > span:nth-child(1) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1)
When I type 1 into My DivScore ® deviates by input with css selector div.form-group:nth-child(2) > div:nth-child(1) > span:nth-child(1) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1)
!-- Notify me about my next portfolio review on
When I execute javascript $("#Alert_SheduledDate").val("Feb 11, 2018")
And I execute javascript $("#Alert_SheduledDate").change()
And I wait small timeout
!-- Securities
When I select 5 ByVisibleText from Select element with css selector div.form-group:nth-child(4) > div:nth-child(1) > span:nth-child(1) > span:nth-child(2) > select:nth-child(1)
When I clear the "requires more than a" input with css selector div.form-group:nth-child(4) > div:nth-child(1) > span:nth-child(2) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1)
When I type 4 into "requires more than a" with css selector div.form-group:nth-child(4) > div:nth-child(1) > span:nth-child(2) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1)
!-- Categories
When I select 5 ByVisibleText from Select element with css selector div.form-group:nth-child(5) > div:nth-child(1) > span:nth-child(1) > span:nth-child(2) > select:nth-child(1)
When I clear the "requires more than a" input with css selector div.form-group:nth-child(5) > div:nth-child(1) > span:nth-child(2) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1)
When I type 4 into "requires more than a" input with css selector div.form-group:nth-child(5) > div:nth-child(1) > span:nth-child(2) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1)
!-- Turn on alerts
When I click on toggle 1(Divscore) with css selector div.form-group:nth-child(2) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1)
When I click on toggle 2(Notify me) with css selector div.form-control-static > i:nth-child(1)
When I click on toggle 3(Securities) with css selector div.form-group:nth-child(4) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1)
When I click on toggle 4(Categories) with css selector div.form-group:nth-child(5) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1)
When I click on Update Rules btn with css selector div.btn-primary
And I wait until service ready
Then I see toastr with css selector .toast-message is Alert settings have been updated
And I wait small timeout
!-- Go to Summary, than back to Alert and check all changes have been saved
When I click on Summary with css selector .social-menu__icon_summary
Then I see Header with css selector .col-sm-9 > h1:nth-child(1) is: Summary
And I wait small timeout
When I click on Alerts with css selector .social-menu__icon_alerts
And I wait small timeout
!-- Check Alerts ON -> Left side menu
Then I see Alerts ON with css selector .social-menu__icon_on-off > span:nth-child(1) contains: on
!-- Check date is correct.
Then I see element property date with css selector #Alert_SheduledDate has property value with value Feb 11, 2018
!-- Check # of Securities and Categories
Then I see element property 1 with css selector div.form-group:nth-child(2) > div:nth-child(1) > span:nth-child(1) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1) has property value with value 1
Then I see 5 with css selector div.form-group:nth-child(4) > div:nth-child(1) > span:nth-child(1) > span:nth-child(2) > select:nth-child(1) contains: 5
Then I see element property 4 with css selector div.form-group:nth-child(4) > div:nth-child(1) > span:nth-child(2) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1) has property value with value 4
Then I see 5 with css selector div.form-group:nth-child(5) > div:nth-child(1) > span:nth-child(1) > span:nth-child(2) > select:nth-child(1) contains: 5
Then I see element property 4 with css selector div.form-group:nth-child(5) > div:nth-child(1) > span:nth-child(2) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1) has property value with value 4
!-- Check toggles ON
Then I see element My divscore toggle ON with css selector div.form-group:nth-child(2) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1) has class on
Then I see element Notify me ON with css selector .on has class on
Then I see element Securities toggle ON with css selector div.form-group:nth-child(4) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1) has class on
Then I see element Categories toggle ON with css selector div.form-group:nth-child(5) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1) has class on




