Story: Check Sharing Validation. Share and cancel sharing. Check different toasters warnings and statuses


Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario:
As Exert create portfolio share it and cancel sharing
GivenStories:
     stories/functional/test/portfolio/create_non_diversified_trading_portfolio.story#{name:Create non diversified trading porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
!-- Share - Cancel - Check status - Share - Check toastr and warning - Cancel - Check Status
When I click on Share+ btn with css selector #topPlate_dropdownMenu
When I click on Share portfolio w. a friend with css selector li.col-xs-12:nth-child(1) > a:nth-child(1) > div:nth-child(1) > div:nth-child(2) > span:nth-child(2)
When I click on Cancel btn with css selector button.ng-scope:nth-child(2)
Then I see Header with css selector h3.portfolio_page_topplate_zero contains: Personal Portfolio
When I click on Share+ btn with css selector #topPlate_dropdownMenu
When I click on Share portfolio w. a friend with css selector li.col-xs-12:nth-child(1) > a:nth-child(1) > div:nth-child(1) > div:nth-child(2) > span:nth-child(2)
When I click on Share btn with css selector span.ng_portfolio_topplate_animation:nth-child(5) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(3) > a:nth-child(1)
When I type e1_at@catch01.tickerontest.com into email input with css selector .form-control
When I click on Next btn with css selector button[type="submit"]
Then I see toaster with css selector .toast-message is Your invitation was successfully sent
Then I see Invitation sent to Expert AT with css selector span.ng_portfolio_topplate_animation:nth-child(5) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > a:nth-child(2) contains: Expert AT
When Portfolio left side menu. Click on Summary
!-- And I wait small timeout
When I click on Compare w a friend with css selector .col-sm-3 > a:nth-child(1)
And I wait small timeout
Then I see Header with css selector .col-xs-10 contains: Compare with a Friend
Then I see warning with css selector div.cx-portfolio-compare-with:nth-child(4) > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > h2:nth-child(1) contains: Please Note!
When I click on Done btn with css selector .btn-join
And I wait small timeout
Then I see Header 'Summary' with css selector .col-sm-9 > h1:nth-child(1) is: Summary
When I click on Cancel btn with css selector div.pull-right:nth-child(2) > a:nth-child(1)
And I wait small timeout
When I click on Stop sharing btn with css selector span.btn-primary
And I wait small timeout
When I click on Cancel btn with css selector span.ng_portfolio_topplate_animation:nth-child(5) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(3) > a:nth-child(1)
And I wait until service ready
When I click on Cancel btn with css selector button.ng-scope:nth-child(2)
And I wait small timeout
Then I see Header with css selector h3.portfolio_page_topplate_zero contains: Personal Portfolio
!-- Share portfolio one more time
When I click on Share+ btn with css selector #topPlate_dropdownMenu
When I click on Share portfolio w. a friend with css selector li.col-xs-12:nth-child(1) > a:nth-child(1) > div:nth-child(1) > div:nth-child(2) > span:nth-child(2)
When I click on Share btn with css selector span.ng_portfolio_topplate_animation:nth-child(5) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(3) > a:nth-child(1)
When I type e1_at@catch01.tickerontest.com into email input with css selector .form-control
When I click on Next btn with css selector button[type="submit"]
And I wait big timeout

!-- Log in as Friend 2 and accept sharing request
Scenario:
Setup params. Set user to Expert AT
Given Set test param username value from property param.atexpertat.username
Given Set test param password value from property param.atexpertat.password

Scenario:
As friend #2 accept sharing request
Meta:
@name As friend #2 accept sharing request
Given I logged in with %{username} and %{password}
When I open COMMUNITY menu
When I click on Friends  with css selector #community__menu__friends-link
And I wait until service ready
When I click on Requests btn with css selector button.btn-secondary:nth-child(1)
When I click on From friends tab with css selector li.nav-item:nth-child(2) > a:nth-child(1)
When I click on CONFIRM with css selector div.col-xs-2:nth-child(3) > button:nth-child(1)
!-- Go to portfolio -> Remove -> check warning
And I wait small timeout
When I click on chevron-down with css selector #dropdownPortfolios
When I click on 'shared' tabn with css selector .select-dropdown > div:nth-child(2) > ul:nth-child(1) > li:nth-child(2) > a:nth-child(1)
When I click on portfolio with css selector .select-dropdown > div:nth-child(2) > div:nth-child(3) > a:nth-child(1) > span:nth-child(1)
And I wait until service ready
Then I see Header 'Summary' with css selector .col-sm-9 > h1:nth-child(1) is: Summary
!-- Remove
When I click on Remove btn with css selector .social-menu__icon_remove
Then I see pop-up with css selector .cx-modal-dafault > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) contains: You have no rights to delete this portfolio
When I click on OK btn with css selector button.ng-binding
Then I see 'shared w John Exp.' with css selector span.ng_portfolio_topplate_animation:nth-child(5) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) contains: shared with
!-- Unshare
When I click on Unshare btn with css selector div.cx_portfolio_topplate_inner_action_link:nth-child(1) > a:nth-child(1)
And I wait small timeout
When I click on Stop sharing btn with css selector span.btn-primary
And I wait small timeout
And I click on No with css selector button.ng-binding:nth-child(2)
And I wait small timeout
Then I see Header with css selector div.col-sm-6:nth-child(1) > div:nth-child(1) > h1:nth-child(1) contains: Portfolios
!-- Then I see NO DATA FOUND with css selector span.ng-isolate-scope contains: No data found

!-- Log in as Friend 1 and remove shared portfolio
Scenario:
Setup params. Set user to Expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario:
As friend #1 remove shared portfolio
Meta:
@name As friend #1 remove shared portfolio
Given I logged in with %{username} and %{password}
When Portfolio. I remove in list portfolio %{portfolioGenerated}
