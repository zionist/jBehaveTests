Story: Check Adjust Actual Positions menu

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated

!-- Create non-diversified trading portfolio and check Adjust Actual Positions
Scenario: Check Adjust Actual Positions menu
GivenStories:
   stories/functional/test/portfolio/create_non_diversified_trading_portfolio.story#{name:Create non diversified trading porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Adjust Actual Positions with css selector .social-menu__icon_adjust
And I wait small timeout
And I click on remove GOOGL with css selector tr.ng-scope:nth-child(3) > td:nth-child(6) > i:nth-child(1)
And I click on Yes with css selector button.ng-scope:nth-child(1)
And I wait until service ready
And I click on remove AAPL with css selector .dsg
And I click on Yes with css selector button.ng-scope:nth-child(1)
And I wait small timeout

!-- Add tickers One by One
When I add ticker AAPL with css selector #chb33807 in module(choose one of MALL/Start here/Portfolio/Article/Blog): Portfolio

!-- Check ‘Report a missing ticker’
When I click on tickers input field with css selector #filterInput
When I click on Report a missing ticker with css selector div.cx-report-missing-ticker:nth-child(1) > a:nth-child(1)
And I type ASDF into Ticker input with css selector input.ng-valid-pattern
And I type ASDF into Name of equity input with css selector div.form-group:nth-child(2) > div:nth-child(2) > input:nth-child(1)
And I wait small timeout
When I click on Submit btn with css selector button.btn-primary-sm:nth-child(2)
Then I see toastr with css selector .toast-message is: Ticker ASDF is successfully reported
And I wait small timeout
!-- Select tickers by employer
When I click on Select tickers by employer with css selector .cx-portfolios-add-remove-tickers__settings_radio-buttons > div:nth-child(3) > label:nth-child(1) > span:nth-child(2)
And I type I into search field with css selector #cxCompanyTickers_Input
And I wait small timeout
And I will move in action to INOVA Health system element with css selector div.cx-company-tickers__list__item:nth-child(1)
And I click on INOVA Health system with css selector div.cx-company-tickers__list__item:nth-child(1)
And I wait until service ready
And I click on remove all with css selector .bordered-table > thead:nth-child(1) > tr:nth-child(1) > th:nth-child(1) > label:nth-child(1) > span:nth-child(2)
And I wait until service ready
And I click on first ticker with css selector tr.ng-scope:nth-child(1) > td:nth-child(1) > label:nth-child(1) > span:nth-child(2)
And I wait until service ready
And I click on Add selected btn with css selector a.btn:nth-child(1)
And I wait until service ready
Then I see AAPL with css selector b.ng-isolate-scope contains: AAPL
Then I check ticker with css selector tr.ng-scope:nth-child(3) > td:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > b:nth-child(1) contains REREX or contains FSIVX
!-- Remove ticker
When I click on Trash icon with css selector tr.ng-scope:nth-child(3) > td:nth-child(6) > i:nth-child(1)
When I click on YES with css selector button.ng-scope:nth-child(1)
And I wait small timeout
When I execute javascript scroll(1050, 350)
!-- Make allocations
When I click on Percentages mode with css selector label.cx-radio:nth-child(2) > span:nth-child(2)
And I click on Edit icon with css selector tr.ng-scope:nth-child(2) > td:nth-child(4) > span:nth-child(2) > div:nth-child(2)
When I clear the %input with css selector input.form-control:nth-child(2)
And I type 50 into %input with css selector input.form-control:nth-child(2)
When I click on Apply btn with css selector input.btn-primary
And I wait small timeout
When I execute javascript scroll(1050, 0)
!-- Save changes
When I click on Done btn with css selector button.btn-primary-sm
Then I see toastr with css selector .toast-message is: Allocations have been saved
And I wait small timeout
!-- Go to Summary and return back, make sure your changes have been saved
When I click on Summary with css selector .social-menu__icon_summary
And I wait small timeout
Then I see Header with css selector .col-sm-9 > h1:nth-child(1) is: Summary
And I wait small timeout
When I click on Adjust Actual Positions with css selector .social-menu__icon_adjust
And I wait small timeout
!-- Check ticker was removed and allocations are correct
Then I see there is no FSIVX with css selector tr.ng-scope:nth-child(3) > td:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > b:nth-child(1)
Then I see 50% AAPL with css selector div.cx-misc-currency-editor:nth-child(2) contains: 50.00
!-- Add ticker -> don't save it -> check that all changes haven’t been applied
When I add ticker INTC with css selector #chb34574 in module(choose one of MALL/Start here/Portfolio/Article/Blog): Portfolio
When I click on Cancel btn with css selector .btn-cancel
And I wait until service ready
Then I see Warning! with css selector h4.modal-title:nth-child(1) contains: Warning!
When I click on Ignore button with css selector button.ng-binding:nth-child(2)
Then I see Header with css selector .col-sm-9 > h1:nth-child(1) is: Summary
Then I see there is no INTC with css selector td.cx-ticker-picker-select-item-link:nth-child(2) > span:nth-child(1) > b:nth-child(1)
