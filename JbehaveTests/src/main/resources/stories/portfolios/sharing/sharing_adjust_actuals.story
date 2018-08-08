Story: Check adjust actuals in shared portfolio


Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate &Personal + UUID and put it to test param portfolioGenerated

Scenario:
As Exert create portfolio and share it
GivenStories:
       stories/functional/test/portfolio/create_non_diversified_trading_portfolio.story#{name:Create non diversified trading porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
!-- Share portfolio as Friend 1
When I click on Share+ btn with css selector #topPlate_dropdownMenu
When I click on Share portfolio w. a friend with css selector li.col-xs-12:nth-child(1) > a:nth-child(1) > div:nth-child(1) > div:nth-child(2) > span:nth-child(2)
When I click on Share btn with css selector span.ng_portfolio_topplate_animation:nth-child(5) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(3) > a:nth-child(1)
When I type e1_at@catch01.tickerontest.com into email input with css selector .form-control
When I click on Next btn with css selector button[type="submit"]
And I wait big timeout

!-- Accept invitation as Friend 2
Scenario:
Setup params. Set user to Expert AT
Given Set test param username value from property param.atexpertat.username
Given Set test param password value from property param.atexpertat.password

Scenario:
As Friend #2 accept sharing request
Given I logged in with %{username} and %{password}
When I open COMMUNITY menu
When I click on Friends  with css selector #community__menu__friends-link
And I wait until service ready
When I click on Requests btn with css selector button.btn-secondary:nth-child(1)
When I click on From friends tab with css selector li.nav-item:nth-child(2) > a:nth-child(1)
When I click on CONFIRM with css selector div.col-xs-2:nth-child(3) > button:nth-child(1)
!-- Open shared portfolio
!-- When I click on chevron-down with css selector #dropdownPortfolios
And I wait small timeout
And I execute javascript $("#dropdownPortfolios").click()
And I execute javascript $(".cx-friends-share-dropdown > ul:nth-child(1) > li:nth-child(2) > a:nth-child(1)").click()
And I wait until service ready
And I execute javascript $("span:contains('&Personal')")[0].click()
And I wait until service ready
Then I see Header 'Summary' with css selector .col-sm-9 > h1:nth-child(1) is: Summary
!-- Verifications on Settings page (missing Edit btn)
When I click on Settings with css selector .social-menu__icon_setting
And I wait small timeout
Then I see Header with css selector h1.ng-scope > span:nth-child(1) contains: Settings
Then I see there is no Edit btn with css selector button[ng-click="onEdit(true)"]
!-- Compare with a friend -> Check allocations  in ‘Percentage’ mode
When I click on Summary with css selector .social-menu__icon_summary
And I wait small timeout
When I click on Compare w a friend with css selector .col-sm-3 > a:nth-child(1)
And I wait small timeout
Then I see Header Details with css selector .cx-idea-preview__details > h1:nth-child(1) contains: Details
Then I see You (actual) with css selector td.value-col:nth-child(5) > b:nth-child(3) contains: 100.00%
Then I see Friend (actual) with css selector td.value-col:nth-child(9) > b:nth-child(3) contains: 100.00%
And I wait small timeout
When I execute javascript scroll(1050, 0)
When I click on Done btn with css selector .btn-join
And I wait small timeout

!-- Make changes on Adjust page (Add ticker)
And I wait small timeout
When I execute javascript scroll(1050, 0)
When I click on Adjust Actual Positions with css selector .social-menu__icon_adjust
And I wait small timeout
Then I see head  with css selector .text-xs-left > h1:nth-child(1) contains: Adjust Actual Positions
Then I see text placeholder  with css selector .cx-misc-info-panel__text > span:nth-child(1) is: This portfolio is a Portfolio shared with Friend portfolio and Adjustments are not available.
!--/*
!-- According to new logic
!-- Add tickers One by One
When I add ticker HAL with css selector #chb34435 in module(choose one of MALL/Start here/Portfolio/Article/Blog): Portfolio

And I click on Done button with css selector button.btn-primary-sm
And I wait until service ready
!-- Verify changes on 'Compare with friend' page
When I click on Summary with css selector .social-menu__icon_summary
And I wait small timeout
When I click on Compare w a friend with css selector .col-sm-3 > a:nth-child(1)
And I wait small timeout
Then I see ticker HAL with css selector tr.ng-scope:nth-child(3) > td:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > b:nth-child(1) contains: HAL
!--*/

!-- Log in as Friend #1 and check changes
Scenario:
Setup params. Set user to Expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario:
As Friend #1 check changes made by Friend #2
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Compare w a friend with css selector .col-sm-3 > a:nth-child(1)
And I wait until service ready
Then I see ticker AAPL with css selector b.ng-binding:nth-child(1) contains: AAPL
!-- Verify that Friend #1 can see 'Edit' btn
When I execute javascript scroll(1050, 0)
When I click on Done btn with css selector .btn-join
And I wait until service ready
When I click on Settings with css selector .social-menu__icon_setting
And I wait small timeout
When I will wait until Edit btn element with css selector button[ng-click="onEdit(true)"] will be visible
!-- Add ticker on 'Adjust Actual Positions' page
When I click on Adjust Actual Positions  with css selector .social-menu__icon_adjust
And I wait small timeout
When I add ticker INTC with css selector #chb34574 in module(choose one of MALL/Start here/Portfolio/Article/Blog): Portfolio
When I click on Done btn with css selector button.btn-primary-sm
And I wait until service ready

!-- As Friend #2 check changes
Scenario:
Setup params. Set user to Expert AT
Given Set test param username value from property param.atexpertat.username
Given Set test param password value from property param.atexpertat.password

Scenario:
As Friend #2 check changes made by Friend 1
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Compare w a friend with css selector .col-sm-3 > a:nth-child(1)
And I wait until service ready
!-- Then I see HAL ticker with css selector tr.ng-scope:nth-child(3) > td:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > b:nth-child(1) contains: HAL
!-- And I see HAL ticker allocations user 2 with css selector tr.ng-scope:nth-child(3) > td:nth-child(5) > span:nth-child(3) is: 0%
!-- And I see HAL ticker allocations user 1 with css selector tr.ng-scope:nth-child(3) > td:nth-child(9) > span:nth-child(1) is: N/A
Then I see INTC ticker with css selector tr.ng-scope:nth-child(4) > td:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > b:nth-child(1) contains: INTC
!-- And I see INTC ticker allocations user 2 with css selector tr.ng-scope:nth-child(5) > td:nth-child(5) > span:nth-child(1) is: N/A
And I see INTC ticker allocations user 1 with css selector tr.ng-scope:nth-child(4) > td:nth-child(9) > span:nth-child(3) is: 0%
When I execute javascript scroll(1050, 0)
When I click on Done btn with css selector .btn-join
And I wait until service ready
When I click on Unshare btn with css selector div.cx_portfolio_topplate_inner_action_link:nth-child(1) > a:nth-child(1)
When I click on Stop sharing btn with css selector span.btn-primary
And I wait until service ready
Then I see Confirm popup with css selector h4.modal-title:nth-child(1) contains: Confirm
When I click on yes button with css selector button.ng-binding:nth-child(1)
And I wait until service ready
Then I see Information popup with css selector h4.modal-title:nth-child(1) contains: Information
When I click on Ok button with css selector button.ng-binding
And I wait small timeout
Then I see Personal Portfolio in top plushka with css selector h3.portfolio_page_topplate_zero contains: Personal Portfolio


!-- As Friend #1 remove shared portfolio
Scenario:
Setup params. Set user to Expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario:
As Friend #1 remove shared portfolio
Meta:
@name As friend #1 remove shared portfolio
Given I logged in with %{username} and %{password}
When Portfolio. I remove in list portfolio %{portfolioGenerated}

