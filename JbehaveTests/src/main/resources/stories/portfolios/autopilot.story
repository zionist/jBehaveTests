Story: Autopilot in portfolio

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated
And I generate Some text for private note + UUID and put it to test param someText

Scenario: Autopilot in portfolio
GivenStories:
   stories/functional/test/portfolio/create_non_diversified_trading_portfolio.story#{name:Create non diversified trading porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
!-- Go to autopilot menu
When I click on Tools with css selector div.cx-portfolios-action-menu-group__title:nth-child(2) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > span:nth-child(2) > span:nth-child(1)
When I click on Autopilot with css selector .social-menu__icon_autopilot
And I wait until service ready
Then I see header with css selector h3.modal-title contains: AutoPilot Trading Rules
!-- set first checkbox
When I click on In response to  Alerts with css selector div.row:nth-child(7) > div:nth-child(1) > label:nth-child(1) > span:nth-child(2)
And I wait until service ready
And I click on Save button with xpath selector //button[contains(., 'Save')]
And I wait until service ready
Then I see new window with css selector div.cx-modal-dafault:nth-child(3) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) contains: Portfolio alerts are currently disabled.
When I click on Ok button with css selector button.ng-scope:nth-child(1)
!-- When I click on Enable Alerts with css selector body > div:nth-child(2) > div > div > div.modal-footer > button.btn.ng-binding.ng-scope.btn-secondary
And I wait small timeout
And I click on every 1 day with css selector div.row:nth-child(6) > div:nth-child(1) > label:nth-child(1) > span:nth-child(2)
And I click on Save button with xpath selector //button[contains(., 'Save')]
And I wait until service ready
Then I see new window with css selector div.cx-modal-dafault:nth-child(3) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) contains: Portfolio alerts are currently disabled
When I click on Ok button with css selector button.ng-scope:nth-child(1)
And I wait until service ready
And I execute javascript  $("button.btn:nth-child(3)").click()
And I wait until service ready
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
!-- check alerts page when autopilot on
Then I see autopilot on with css selector div.cx-portfolios-action-menu-group:nth-child(4) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > span:nth-child(3) > span:nth-child(1) contains: on
When I click on Alerts page with css selector .social-menu__icon_alerts
And I wait until service ready
When I execute javascript if ($("div.form-group:nth-child(2) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1)").attr("class").indexOf("on")!=-1 !=true) { throw ("Test failed") }
When I execute javascript if ($("div.form-group:nth-child(3) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1)").attr("class").indexOf("on")!=-1 !=true) { throw ("Test failed") }
When I execute javascript if ($("div.form-group:nth-child(4) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1)").attr("class").indexOf("on")!=-1 !=true) { throw ("Test failed") }
!-- remove first checkbox
And I wait small timeout
When I execute javascript scroll(1050, 700)
And I click on Autopilot with css selector .social-menu__icon_autopilot
And I wait until service ready
Then I see header with css selector h3.modal-title contains: AutoPilot Trading Rules
When I click on In response to  Alerts with css selector div.row:nth-child(7) > div:nth-child(1) > label:nth-child(1) > span:nth-child(2)
And I click on Save button with css selector div.ng-dirty > div:nth-child(3) > button:nth-child(1)
And I wait until service ready
Then I see Toaster item with css selector .toast-message contains: Autopilot reallocations settings have been updated
And I wait small timeout
!-- set second checkbox
Then I see autopilot off with css selector div.cx-portfolios-action-menu-group:nth-child(4) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > span:nth-child(3) > span:nth-child(1) contains: on
When I click on Autopilot with css selector .social-menu__icon_autopilot
And I wait until service ready
Then I see header with css selector h3.modal-title contains: AutoPilot Trading Rules
When I click on Every... in accordance wwith A.I. algorithms with css selector div.row:nth-child(6) > div:nth-child(1) > label:nth-child(1) > span:nth-child(2)
And I type weeks into weeks with css selector div.row:nth-child(6) > div:nth-child(1) > span:nth-child(3) > select:nth-child(1)
And I click on Save button with css selector div.ng-dirty > div:nth-child(3) > button:nth-child(1)
And I wait until service ready
Then I see Toaster item with css selector .toast-message contains: Autopilot reallocations settings have been updated
When I wait until service ready
!-- check alerts page when autopilot on
Then I see autopilot on with css selector div.cx-portfolios-action-menu-group:nth-child(4) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > span:nth-child(3) > span:nth-child(1) contains: on
When I click on Alerts page with css selector .social-menu__icon_alerts
And I wait until service ready
When I execute javascript if ($("div.form-group:nth-child(2) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1)").attr("class").indexOf("on")!=-1 !=true) { throw ("Test failed") }
When I execute javascript if ($("div.form-group:nth-child(3) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1)").attr("class").indexOf("on")!=-1 !=true) { throw ("Test failed") }
When I execute javascript if ($("div.form-group:nth-child(4) > div:nth-child(2) > div:nth-child(1) > i:nth-child(1)").attr("class").indexOf("on")!=-1 !=true) { throw ("Test failed") }






