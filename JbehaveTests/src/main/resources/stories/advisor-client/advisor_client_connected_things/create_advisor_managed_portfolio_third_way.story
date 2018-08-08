Story: As advisor create portfolio for client and make adjust actual positions. As client check it.



Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Adv_managed + UUID and put it to test param portfolioGenerated
And I generate Some text for private note + UUID and put it to test param someText
Given Set test param clientName with value Mike In.
Given Set test param advisorName with value James Adv.

Scenario: As advisor create portfolio for client and make adjust actual positions. As client check it.

Given I logged in with %{username} and %{password}
When I wait until service ready
And I open CLIENTS menu
And I wait until service ready
And I click on tab connections with css selector .tabs-left > li:nth-child(2)
And I wait until service ready
And I click on clients name with containsText selector %{clientName}
And I wait until service ready
And I click on Create button with css selector a.btn-secondary
And I wait until service ready
Then I see Create portfolio page header with css selector .cx-create-portfolio-title-block contains: Create Portfolio
When I type %{portfolioGenerated} into Portfolio title with css selector #input_title
And I wait until service ready
When I select Mike In. ByVisibleText from Select element with css selector #select_cxPortfoliosDupDestinationUserSelection
And I wait until service ready
!-- Next -> next -> next
And I click on NEXT button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait until service ready
And I click on NEXT button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait until service ready
Then I see pop up window with css selector h3.modal-title > b:nth-child(1) contains: Attention! For retirement accounts
When I click on Proceed as is with css selector button.btn-primary:nth-child(2)
And I wait until service ready
And I click on NEXT button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait until service ready
!-- Let's fill wizard
And I type Aggressive into Risk Level with css selector .cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)
And I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)").change()
And I wait until service ready
And I type 0 - 5 into Years till wuthdrawal with css selector .cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(3) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)
And I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(3) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)").change()
And I wait until service ready
And I type Non-retirement into Type with css selector .cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(4) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)
And I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(4) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)").change()
And I wait until service ready
And I type AK, Alaska into Us state with css selector .cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)
And I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)").change()
And I wait until service ready
And I type Less than 12 months into Cach reserves with css selector .cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(6) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)
And I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(6) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)").change()
And I wait until service ready
!-- Press finish button
And I click on finish button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait until service ready
Then I see head of page with css selector .col-sm-9 > h1:nth-child(1) is Client Portfolio Summary
Then I see Portfolio is Personal with css selector div.col-xs-8:nth-child(5) > div:nth-child(1) > div:nth-child(2) contains: Fully controlled by Advisor
Then I see client name with css selector span.ng_portfolio_topplate_animation:nth-child(4) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > a:nth-child(1) contains: %{clientName}
!-- Adjust actual allocation
When I click on Adjust Actual Positions with css selector .social-menu__icon_adjust
And I wait until service ready
!-- Add tickers One by One
And I type AAPL into search field with css selector #filterInput
And I wait until service ready
And I start recording action
And I will move in action to on ticker AAPL element with css selector #chb33807
And I click on AAPL with css selector #chb33807
And I wait until service ready
And I click on ADD button with css selector .btn-follow-lg
And I wait until service ready
!-- Select tickers by employer
When I click on Select tickers by employer with css selector .cx-portfolios-add-remove-tickers__settings_radio-buttons > div:nth-child(3) > label:nth-child(1) > span:nth-child(2)
And I type I into search field with css selector #cxCompanyTickers_Input
And I wait until service ready
And I will move in action to INOVA Health system element with css selector div.cx-company-tickers__list__item:nth-child(1)
And I click on INOVA Health system with css selector div.cx-company-tickers__list__item:nth-child(1)
And I wait until service ready
And I click on remove all with css selector .bordered-table > thead:nth-child(1) > tr:nth-child(1) > th:nth-child(1) > label:nth-child(1) > span:nth-child(2)
And I wait small timeout
And I click on first ticker with css selector .bordered-table > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(1) > label:nth-child(1)
And I wait small timeout
And I click on Add selected btn with css selector a.btn:nth-child(1)
And I wait until service ready
Then I see AAPL with css selector .cx-portfolio-table > tbody:nth-child(2) > tr:nth-child(2) > td:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > b:nth-child(1) contains: AAPL
!-- Then I see REREX with css selector .cx-portfolio-table > tbody:nth-child(2) > tr:nth-child(3) > td:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > b:nth-child(1) contains: REREX
Then I check ticker with css selector .cx-portfolio-table > tbody:nth-child(2) > tr:nth-child(3) > td:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > b:nth-child(1) contains REREX or contains FSIVX
!-- Remove ticker
When I click on Trash icon with css selector .cx-portfolio-table > tbody:nth-child(2) > tr:nth-child(3) > td:nth-child(6) > i:nth-child(1)
When I click on YES with xpath selector //button[contains(., 'Yes')]
And I wait until service ready
When I execute javascript scroll(1050, 350)
!-- Make allocations
When I click on Percentages mode with css selector label.cx-radio:nth-child(2) > span:nth-child(2)
And I click on Edit icon with css selector tr.ng-scope:nth-child(2) > td:nth-child(4) > span:nth-child(2) > div:nth-child(2)
!-- When I click on %input with css selector input.form-control:nth-child(2)
When I clear the %input with css selector input.form-control:nth-child(2)
And I type 50 into %input with css selector input.form-control:nth-child(2)
When I click on Apply btn with css selector input.btn-primary
And I wait until service ready
When I execute javascript scroll(1050, 0)
!-- Save changes
When I click on Done btn with css selector button.btn-primary-sm
Then I see toastr with css selector .toast-message is: Allocations have been saved
When I wait until service ready
!-- Go to Summary and return back, make sure your changes have been saved
When I click on Summary with css selector .social-menu__icon_summary
And I wait until service ready
Then I see Header with css selector .col-sm-9 > h1:nth-child(1) is: Client Portfolio Summary
And I wait small timeout
When I click on Adjust Actual Positions with css selector .social-menu__icon_adjust
And I wait until service ready
!-- Check ticker was removed and allocations are correct
Then I see there is no FSIVX with css selector tr.ng-scope:nth-child(3) > td:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > b:nth-child(1)
Then I see 50% AAPL with css selector div.cx-misc-currency-editor:nth-child(2) contains: 50.00
!-- Add ticker -> don't save it -> check that all changes haven’t been applied
When I type INTC into search field with css selector #filterInput
And I wait until service ready
And I start recording action
And I will move in action to on ticker INTC element with css selector #chb34574
And I click on INTC with css selector #chb34574
And I wait until service ready
And I click on ADD button with css selector .btn-follow-lg
And I wait until service ready
When I click on X btn with css selector .btn-cancel
Then I see Header with css selector .col-sm-9 > h1:nth-child(1) is: Client Portfolio Summary
Then I see there is no INTC with css selector td.cx-ticker-picker-select-item-link:nth-child(2) > span:nth-child(1) > b:nth-child(1)
And I wait small timeout


Scenario:
Setup params. Set user to intermed
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password


Scenario: Check actual positions and remove portfolio created by advisor

Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
And I wait until service ready
Then I see Managed by Advisor with css selector div.portfolio_topplate_block:nth-child(3) > div:nth-child(1) > div:nth-child(2) contains: Fully controlled by Advisor
Then I see AAPL with css selector .cx-portfolio-table > tbody:nth-child(2) > tr:nth-child(2) > td:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) contains: AAPL
Then I see  50.00% with css selector .cx-portfolio-table > tbody:nth-child(2) > tr:nth-child(2) > td:nth-child(5) > span:nth-child(3) contains: 50.00
