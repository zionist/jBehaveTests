Story: Production - check portfolio

Scenario:
Setup params. Set user to Expert
Given Set test param username value from property param.expert.username
And Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated
!-- And Set test param portfolioGenerated with value Personalfba316bd-579f-47cc-a590-7d801d3949f6

Scenario: Create portfolio
Meta:
@name Create portfolio
GivenStories:
       stories/functional/test/portfolio/create_investement_portfolio.story#{name:Create investment porfolio}
Then I see page header with css selector h3.portfolio_page_topplate_zero is: Personal Portfolio

Scenario:
Check Next Steps
Meta:
@ Next Step
!-- Open just created portfolio
Given I logged in during maintenance with %{username} and %{password}
When I open HOME menu
And I open portfolios block
And Portfolio. I find portfolio %{portfolioGenerated}
Then I see head of page with css selector h1.ng-binding is: Summary
When I wait until service ready


Scenario:
Check Share with a friend
When I click on Share link with css selector #topPlate_dropdownMenu
And I wait small timeout
And I click on Share portfolio with friend link with css selector li.col-xs-12:nth-child(1) > a:nth-child(1) > div:nth-child(1) > div:nth-child(2)
And I wait small timeout
Then I see small page header with css selector .cx_portfolio_topplate_inner_link > div:nth-child(1) contains: Want to Share with Friends?
When I click on Cansel button with css selector button.ng-scope:nth-child(2)
And I wait small timeout
Then I see page header with css selector h3.portfolio_page_topplate_zero is: Personal Portfolio

Scenario:
Check Investment ideas
!-- Investment ideas
When I click on Investment ideas Step with css selector .cx-portfolio-menu__trade-idea > span:nth-child(2) > span:nth-child(1)
And I wait until service ready
Then I see head of page with css selector div.portfolio_page_title:nth-child(2) > div:nth-child(1) > h1:nth-child(1) is: Investment Ideas
!-- My own ideas
When I click on Ny own ideas -> Enter draft ... with css selector div.cx-idea-main__task-block:nth-child(3) > div:nth-child(2) > span:nth-child(1)
Then I see page header with css selector div.portfolio_page_title:nth-child(3) > div:nth-child(1) > h1:nth-child(1) is: Start a Draft of your Next Investment from:
When I click on Actuals with css selector div.cx-idea-main__from_block:nth-child(1) > div:nth-child(1) > div:nth-child(2)
And I wait until service ready
Then I see page header with css selector h1.col-xs-6 > span:nth-child(1) is: Review Draft

!-- Edit draft
When I click on EDIT button with css selector button.btn-join:nth-child(2)
And I wait until service ready

!-- Edit selection page
When I click on modify button with css selector div.dropdown:nth-child(2) > button:nth-child(1)
And I click on Edit Manually menu item with css selector div.dropdown:nth-child(2) > ul:nth-child(2) > li:nth-child(1) > a:nth-child(1)
And I wait small timeout
Then I see page header with css selector h1.col-xs-6 > span:nth-child(2) is: Edit Selection Manually
!-- # Add tickers. Wait until tickers list will be loaded
When I click on ticker selection input with css selector #filterInput
And I will wait until ticker element element with css selector #chb34108 will be visible
!-- # Tickers list appears. Add ticker
And I start recording action
And I will move in action to A ticker checkbox element with css selector #chb34108
And I will click in action on A ticker checkbox element with css selector #chb34108
And I will click in action on Add button element with css selector div.col-xs-10:nth-child(3) > div:nth-child(3) > button:nth-child(1)
Then I perform previously recorded action
!--  Wait until tickers list disappears
And I wait small timeout
When I click on save and done button with css selector .cx-idea-edit__btn-line > div:nth-child(2) > div:nth-child(1) > button:nth-child(2)
And I wait until service ready
Then I see Added ticker with css selector .last-row > td:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > b:nth-child(1) is: A
When I click on Next button with css selector div.col-xs-2:nth-child(3) > div:nth-child(1) > button:nth-child(1)
And I wait until service ready

!-- Edit allocation page
When I click on modify button with css selector div.dropdown:nth-child(2) > button:nth-child(1)
When I click on Edit manually with css selector div.dropdown:nth-child(2) > ul:nth-child(2) > li:nth-child(1) > a:nth-child(1)
And I wait until service ready
And I click on Positions in draft for A ticker with css selector tr.last-row:nth-child(3) > td:nth-child(12) > div:nth-child(5) > div:nth-child(2)
Then I see modal header tittle for A ticker with css selector span.text-muted is: (Agilent Technologies, Inc.)
When I type 50 into procent input with css selector input.form-control:nth-child(2)
And I wait small timeout
And I click on Apply button with css selector #allocationEditorPopup > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > span:nth-child(1) > input:nth-child(2)
And I click on Save and done with css selector .cx-idea-edit__btn-line > div:nth-child(2) > div:nth-child(1) > button:nth-child(2)
And I wait small timeout
Then I see Allocation for A ticker with css selector .last-row > td:nth-child(12) > span:nth-child(3) is: 50.00%
!-- And I see A ticker name with css selector tr.last-row:nth-child(2) > td:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > b:nth-child(1) is A
When I click on Next button with css selector div.col-xs-2:nth-child(3) > div:nth-child(1) > button:nth-child(1)
Then I see page header with css selector h1.col-xs-6 > span:nth-child(1) is: Preview Next Investment
And I see A ticker name with css selector tr.ng-scope:nth-child(3) > td:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > b:nth-child(1) is: A
And I see Allocation for A ticker with css selector tr.ng-scope:nth-child(3) > td:nth-child(9) > span:nth-child(3) is: 50.00%
!-- Next trade
When I click on Apply button with css selector div.col-xs-2:nth-child(3) > div:nth-child(1) > span:nth-child(2) > button:nth-child(1)
Then I see page header with css selector div.text-xs-left > h1:nth-child(2) is: Next Trade
When I click on Percentages radio button with css selector label.cx-radio:nth-child(2) > span:nth-child(2)
!-- Then I see A ticker allocations with css selector .cx-portfolio-table > tbody:nth-child(2) > tr:nth-child(3) > td:nth-child(9) > span:nth-child(3) is 50.00%
Then I see A ticker name with css selector .cx-portfolio-table > tbody:nth-child(2) > tr:nth-child(3) > td:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > b:nth-child(1) is: A
!-- Open summary and cancel next trade
When I click on Summary link with css selector div.cx-portfolio-summary-tips:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > a:nth-child(1)
And I wait until service ready
When I click on Cancel next investent with css selector .cx-cancel-next-trade-btn
Then I see Toaster item with css selector .toast-message is: Your new allocations have been cancelled


Scenario:
Check Settings page
When I click on Settings page with css selector .social-menu__icon_setting
And I click on Edit icon with css selector .btn-edit-circle
And I click on Less than 3 months radio with css selector .cx-portfolio-edit-settings__strategy-trading > label:nth-child(1) > span:nth-child(2)
Then I see portfolio style description with css selector .cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(2) contains: Diversified ― Trading
When I click on Greater than 3 months radio with css selector .cx-portfolio-edit-settings__strategy-investment > label:nth-child(1)
Then I see portfolio style description with css selector .investment > span:nth-child(2) contains: Diversified ― Investment


Scenario:
Check Adjust actuals +Portfolio performance
When I click on Adjust Actual Positions with css selector .social-menu__icon_adjust
And I wait until service ready
Then I see Header with css selector div.portfolio_page_title:nth-child(4) > div:nth-child(1) > h1:nth-child(1) contains: Adjust
!-- # Add ticker. Wait until tickers list will be loaded
When I click on ticker selection input with css selector #filterInput
And I will wait until ticker element element with css selector #chb34108 will be visible
!-- # Tickers list appears. Add ticker
And I start recording action
And I will move in action to A ticker checkbox element with css selector #chb34108
And I will click in action on A ticker checkbox element with css selector #chb34108
And I will click in action on Add button element with css selector .btn-follow-lg
Then I perform previously recorded action
When I wait small timeout
And I click on Percentages raidio with css selector label.cx-radio:nth-child(2) > span:nth-child(2)
And I wait small timeout
When I execute javascript scroll(1050, 700)
And I click on A ticker allocation with css selector div.cx-misc-currency-display:nth-child(2)
And I wait small timeout
And I type 50 into percentages input with css selector input.form-control:nth-child(2)
And I click on Apply button with css selector input.btn-primary
Then I see Added ticker with css selector tr.ng-scope:nth-child(2) > td:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > b:nth-child(1) is: AAPL
And I see Added ticker allocation with css selector tr.ng-scope:nth-child(2) > td:nth-child(4) > span:nth-child(2) > div:nth-child(2) > span:nth-child(2) is: 50.00
When I click on done button with css selector button.btn-primary-sm
Then I see Toaster item with css selector .toast-message is: Allocations have been saved
And I wait small timeout


Scenario:
Check Alerts
Meta:
@ check alerts
When I click on Alerts with css selector .social-menu__icon_alerts
And I wait until service ready
Then I see header with css selector h1.col-xs-9:nth-child(1) contains: Alert Settings
And I wait small timeout
When I execute javascript scroll(1050, 700)
!-- Update rules
When I click on update rules with css selector div.btn-primary
Then I see Toaster item with css selector .toast-message is: Alert settings have been updated

!-- Failed because of tickeron.atlassian.net/browse/TMA-2020
!-- Then I see indicator with css selector .social-menu__item_active > a:nth-child(1) > div:nth-child(1) > span:nth-child(6) is: ON


Scenario:
Check Backtest
When I execute javascript $(".social-menu__icon_backtest-perf").click()
And I wait until service ready
When I click on Run Perfomance Calculator with css selector .col-xs-4 > button:nth-child(1)
And I wait big timeout
Then I see page header with css selector .cx-portfolios-stat__graph_title > h2:nth-child(1) is: Performance graph
When I click on Done button with css selector .btn-join
And I wait until service ready

Scenario:
Check Duplicate
When I execute javascript $(".social-menu__icon_duplicate").click()
And I wait small timeout
Then I see modal page header with css selector h3.modal-title is: Duplicate Portfolio
When I click on cancel button with css selector body > div.modal.fade.ng-isolate-scope.cx-modal-dafault.modal-duplicate.in > div > div > div.modal-footer.ng-scope > div > div > div > button.btn.btn-secondary

Scenario:
Check History of trades
When I execute javascript $("div.cx-portfolios-action-menu-group:nth-child(4) > span:nth-child(2) > li:nth-child(1) > a:nth-child(1)").click()
And I wait until service ready
Then I see page header with css selector h1.ng-scope is: History of Investments
Then I see search results with css selector .text-muted is: No results yet.
When I click on portfolio titile link with css selector p.cx-breadcrumbs:nth-child(2) > span:nth-child(3) > a:nth-child(1)
And I wait until service ready

Scenario:
Check private notes
When I execute javascript $(".cx-portfolio-menu__no-divider > a:nth-child(1)").click()
And I wait until service ready
Then I see $page header with css selector .portfolio_page_title > div:nth-child(1) > h1:nth-child(1) is: Private Notes
When I execute javascript CKEDITOR.instances.editor1.setData("test123")
And I wait small timeout
When I execute javascript scroll(1050, 700)
And I click on Save button with css selector input.btn:nth-child(2)
And I wait small timeout
Then I see private notes with css selector #notesContainer contains: test123

Scenario:
Check Fundamentals
When I execute javascript $(".social-menu__icon_fundamentals").click()
And I wait until service ready
Then I see A ticker name with css selector .cx-wizard-body_space > div:nth-child(1) > div:nth-child(4) > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > b:nth-child(1) is: AAPL
Then I see Table header with css selector .cx-wizard-body_space > div:nth-child(1) > div:nth-child(4) > table:nth-child(1) > thead:nth-child(1) > tr:nth-child(1) > th:nth-child(2) is: CAPITALIZATION
When I click on balance sheet with css selector .tabs-left > li:nth-child(2)
Then I see Table header with css selector .cx-wizard-body_space > div:nth-child(1) > div:nth-child(5) > table:nth-child(1) > thead:nth-child(1) > tr:nth-child(1) > th:nth-child(2) is: TOTAL CASH
When I click on Done buton with css selector .btn-join
And I wait until service ready


Scenario:
Remove portfolio
When I execute javascript $(".social-menu__icon_remove").click()
And I wait until service ready
And I wait big timeout
And I click on Yes button with css selector button.ng-scope:nth-child(1)
And I wait until service ready
