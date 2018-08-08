Story: alerts_in_published_portfolio_subscription

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario: Publish portfolio subscribtion
Meta:
name Publish portfolio subscribtion
GivenStories:
      stories/functional/test/portfolio/create_diversified_trading_portfolio.story#{name:Create diversified trading porfolio}
!-- Go to autopilot menu
Given I connect stripe as seller for %{username} with %{password}
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Tools with css selector div.cx-portfolios-action-menu-group__title:nth-child(2) > div:nth-child(1) > div:nth-child(1)
!--/*
And I click on Autopilot with css selector .social-menu__icon_autopilot
And I wait until service ready
Then I see header with css selector h3.modal-title contains: AutoPilot Trading Rules
!-- set first checkbox
When I click on In response to  Alerts with css selector div.row:nth-child(7) > div:nth-child(1) > label:nth-child(1) > span:nth-child(2)
And I click on Every 1 days  with css selector div.row:nth-child(6) > div:nth-child(1) > label:nth-child(1) > span:nth-child(2)
And I click on Save button with css selector button.ng-binding
And I wait until service ready
Then I see new window with css selector div.cx-modal-dafault:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) contains: Portfolio alerts are currently disabled
When I click on Enable Alerts with css selector div.cx-modal-dafault:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > button:nth-child(1)
When I wait until service ready
!-- check alerts page when autopilot on
Then I see autopilot on with css selector div.cx-portfolios-action-menu-group:nth-child(4) > span:nth-child(1) > li:nth-child(1) > a:nth-child(1) > span:nth-child(3) > span:nth-child(1) contains: on

!--*/
!-- Turn on Alerts
When I click on Alerts with css selector .social-menu__icon_alerts
And I wait small timeout
Then I see Header with css selector h1.col-xs-9:nth-child(1) is  Allocation  Alert Settings
When I click on toggle 2(Notify me) with css selector .cx-alert-setup > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1)
When I click on toggle 3(Securities) with css selector .cx-alert-setup > div:nth-child(2) > div:nth-child(3) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1)
When I click on toggle 4(Categories) with css selector div.form-group:nth-child(4) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1)
When I click on Update Rules btn with css selector div.btn-primary
And I wait until service ready
Then I see toastr with css selector .toast-message is Alert settings have been updated
And I wait small timeout
!-- Turn on Autopilot
When I click on Autopilot with css selector .social-menu__icon_autopilot
And I wait until service ready
And I click on every 1 day with css selector div.row:nth-child(6) > div:nth-child(1) > label:nth-child(1) > span:nth-child(2)
And I click on Save button with xpath selector //button[contains(., 'Save')]
Then I see Toaster item with css selector .toast-message contains: Autopilot reallocations settings have been updated
When I wait until service ready
When I click on press "Share+" with css selector #topPlate_dropdownMenu
And I click on Sell Portfolio Subscription in Mall with css selector li.col-xs-12:nth-child(4) > a:nth-child(1) > div:nth-child(1) > div:nth-child(2) > span:nth-child(2)
And I click on press "Start" with css selector div.col-xs-4:nth-child(4) > div:nth-child(1) > span:nth-child(1) > a:nth-child(1)
When I wait until service ready
!-- Check that autopilot and alerts settings are switched on
Then I see AutoPilot with css selector .cx-mall-create-subcription__strategy > span:nth-child(1) contains: On
And I wait small timeout
When I type 22 into price with css selector #price
And I execute javascript CKEDITOR.instances.text.setData("test descr")
And I click on Save and Previw button with css selector button.btn-primary:nth-child(2)
And I wait until service ready
And Portfolio. I find portfolio %{portfolioGenerated}
Then I see Subscription with css selector span.ng_portfolio_topplate_animation:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > a:nth-child(1) contains: Subscription
Then I see Listed / Not Published with css selector span.ng_portfolio_topplate_animation:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(3) > span:nth-child(1) contains: Listed / Not Published

!-- Make sure that subscription has a state ‘Portfolio subscription (unpublished)’
!--/*
!-- Make this checking when the step "When Portfolios. I check status with text $text and $identificator" will be finish
When I open HOME menu
And I open portfolios block
And I wait big timeout
Then I see state with css selector div.cx-cell:nth-child(5) contains: Portfolio Subscription (unpublished)
!--*/
When Portfolio. I find portfolio %{portfolioGenerated}
And I wait small timeout
Then I see plate with css selector span.ng_portfolio_topplate_animation:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(3) > span:nth-child(1) contains: Listed / Not Published
!-- Make sure that  left menus ‘Settings’, ‘Adjust Actual Positions’, ‘Alerts’ and ‘Next trade’ are available.
When I click on Settings with css selector .social-menu__icon_setting
And I click on Adjust Actual Positions with css selector .social-menu__icon_adjust
Then I see Warning with css selector div.ng-binding:nth-child(2) contains: Portfolio i
When I click on Ok button with css selector button.ng-scope
And I wait until service ready
And I click on Alerts with css selector .social-menu__icon_alerts
And I click on Publish with css selector div.col-xs-4:nth-child(4) > div:nth-child(1) > button:nth-child(2)
And I wait until service ready
When I execute javascript angular.element('[ng-controller=CxPreviewSubscriptionCtrl]').scope().mdl.agreeWithTerms = true
And I wait small timeout
And I click on List in MALL with css selector .cx-opinion-publish__btn
And I wait until service ready
And I click on Agree with css selector button.ng-binding:nth-child(2)
And I wait until service ready
!-- Then I see toastr with css selector .toast-message contains: Congratulations!
!-- Make sure that on the ‘List of Portfolios’ page portfolio has state  ‘Portfolio Subscription in MALL’
!--/*
!-- Make this checking when the step "When Portfolios. I check status with text $text and $identificator" will be finish
When I open HOME menu
And I open portfolios block
And I wait big timeout
Then I see state with css selector div.cx-cell:nth-child(5) contains: Portfolio Subscription in MALL
When I execute javascript $(String.format("$(\"h3[title='%s']\").parent().children(\"button\").click()", Portfolio Subscription in MALL));
And I wait small timeout
!--*/
When Portfolio. I find portfolio %{portfolioGenerated}
And I wait until service ready
Then I see plate with css selector span.ng_portfolio_topplate_animation:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > a:nth-child(1) contains: Subscription
Then I see plate with css selector span.ng_portfolio_topplate_animation:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(3) > span:nth-child(2) contains: in MALL
Then I see quantity of a ‘Subscriber's with css selector div.col-xs-12:nth-child(3) > div:nth-child(1) > div:nth-child(2) contains: 0
And I wait small timeout
When I click on Settings with css selector .social-menu__icon_setting
And I wait until service ready
Then I see there is no button "Edit" with css selector .btn-edit-circle
And I wait small timeout
When I click on Adjust Actual Positions with css selector .social-menu__icon_adjust
And I wait until service ready
Then I see Warning with css selector div.ng-binding:nth-child(2) contains: Portfolio i
When I click on Ok button with css selector button.ng-scope
And I wait until service ready