Story: Check friands


Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
!-- As friend #1 (i1) send sharing request, as friend #2 (b1) decline then accept request. Checking chat between friends. As friends stop sharing
Given Set test param password value from property param.intermediate.password
And I generate Personal + UUID and put it to test param portfolioGenerated

!-- As friend #1 create portfolio and send sharing request
Scenario:
As Friend #1 create portfolio and send sharing request
Meta:
@name create portfolio and send sharing request
GivenStories:
      stories/functional/test/portfolio/create_investement_portfolio.story#{name:Create investment porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Share+ btn with css selector #topPlate_dropdownMenu
When I click on Share portfolio w a friend with css selector li.col-xs-12:nth-child(1) > a:nth-child(1) > div:nth-child(1) > div:nth-child(2) > span:nth-child(2)
When I click on Share btn with css selector span.ng_portfolio_topplate_animation:nth-child(5) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(3) > a:nth-child(1)
When I type b1@catch01.tickerontest.com into email input with css selector .form-control
And I wait until service ready
When I click on Next btn with css selector button[type="submit"]
And I wait until service ready
Then I see 'You have sent a sharing invitation..' with css selector p.ng-binding:nth-child(1) contains: You have sent a sharing invitation to Quan Public <b1@catch01.tickerontest.com>, but the user hasn't responded

!-- As Friend #2 decline request
Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario:
As friend #2 decline sharing request
Meta:
@name As friend #2 decline sharing request
Given I logged in with %{username} and %{password}
When I open COMMUNITY menu
When I click on Friends  with css selector #community__menu__friends-link
And I wait until service ready
When I click on Requests btn with css selector button.btn-secondary:nth-child(1)
When I click on From friends tab with css selector li.nav-item:nth-child(2) > a:nth-child(1)
!-- When I click on Decline btn with css selector button.btn-link:nth-child(1)
When I click on Decline btn with css selector div.col-xs-2:nth-child(4) > button:nth-child(1)
Then I see toastr with css selector .toast-message contains: Declined

!-- As friend #1 send one more sharing request , as friend #2 accept request (check event and chat)
Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password

Scenario:
As friend #1 send one more sharing request
Meta:
@name Accept sharing request
Given I logged in with %{username} and %{password}
!-- When I open portfolios block
!-- When I click on portfolio title with xpath selector //h3[text()='%{portfolioGenerated}']
When Portfolio. I find portfolio %{portfolioGenerated}
And I wait until service ready
When I click on Share btn with css selector span.ng_portfolio_topplate_animation:nth-child(5) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(3) > a:nth-child(1)
When I type b1@catch01.tickerontest.com into email input with css selector .form-control
When I click on Next btn with css selector button[type="submit"]
And I wait small timeout


!-- As Friend #2 accept request (and other checking)
Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario:
As friend #2 check notification about sharing and accept request, check 'Share portfolio' button, check chat.
Meta:
@name Accept sharing request
!-- Check notification about sharing request
Given I logged in with %{username} and %{password}
When I click on Event more with css selector .cx-home-screen-more-events > a:nth-child(2)
And I wait until service ready
Then I see Events header with css selector .col-sm-6 > h1:nth-child(1) contains: Notifications
Then I see event with css selector tr.ng-scope:nth-child(1) > td:nth-child(3) > span:nth-child(1) contains: Mike In. invites you to share a portfolio

!-- Accept request
When I open COMMUNITY menu
When I click on Friends  with css selector #community__menu__friends-link
And I wait until service ready
When I click on Requests btn with css selector button.btn-secondary:nth-child(1)
When I click on From friends tab with css selector li.nav-item:nth-child(2) > a:nth-child(1)
When I click on Accept btn with css selector #requestToShareModal > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(4) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > button:nth-child(1)

!-- check that friend appears
Then I see friend's name with css selector div.col-xs-3:nth-child(1) > h3:nth-child(2) > a:nth-child(1) contains: Mike In.
!-- check 'Share portfolio' button
When I wait small timeout
And I click on 'Share portfolio' btn with css selector div.text-xs-right:nth-child(2) > button:nth-child(2)
!-- Then I see popup with css selector h4.modal-title:nth-child(3) contains: You have no portfolios
When I click on Cancel btn with css selector .modal-dialog-sm > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(5) > button:nth-child(2)
And I wait small timeout
Then I see page header with css selector div.col-xs-6:nth-child(1) > h1:nth-child(1) contains: Friends
!-- Send chat message.
When I will execute javascript $("button[ng-click^='connection.UnreadMessages']").click()
And I wait small timeout
Then I see Chat header with css selector .cx-chat-default-header-title contains: PRIVATE CHAT
When I send chat message with text Hello Friend

!-- As friend #1 make some checking (in comments below) and unshare portfolio
Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password

Scenario:
As friend #1  unshare portfolio (and other checking)
Meta:
@name Unshare portfolio
!-- check notification about request accepted
Given I logged in with %{username} and %{password}
When I click on Event more with css selector .cx-home-screen-more-events > a:nth-child(2)
And I wait until service ready
Then I see event with css selector tr.ng-scope > td:nth-child(3) > span:nth-child(1) contains: Quan Public Accepted your Portfolio Sharing Request
!-- check friend appears in Friends module
When I open COMMUNITY menu
When I click on Friends  with css selector #community__menu__friends-link
And I wait until service ready
Then I see friend's name with css selector div.col-xs-3:nth-child(1) > h3:nth-child(2) > a:nth-child(1) contains: Quan Public
!-- Check chat message from friend #2
When I will execute javascript $("button[ng-click^='connection.UnreadMessages']").click()
And I wait small timeout
Then I see message with css selector pre.ng-binding contains: Hello Friend
!-- Write own message
When I type Hello Friend-2 into chat input field with css selector .cx-chat-default__new-message__textarea
And I click on Send button with css selector .btn-secondary-sm
And I wait small timeout
Then I see html code own message with css selector #cxChatScrollPanel > div:nth-child(2) contains: Hello Friend-2
When I click on Close icon with css selector .cx-chat-close-icon
!-- Unshare portfolio
When I click on chevron-down with css selector #dropdownPortfolios
When I click on portfolio title with css selector .select-dropdown > div:nth-child(2) > div:nth-child(2) > a:nth-child(1) > span:nth-child(1)
And I wait until service ready
When I click on Unshare btn with css selector div.cx_portfolio_topplate_inner_action_link:nth-child(1) > a:nth-child(1)
And I wait until service ready
When I click on Stop sharing btn with css selector span.btn-primary
!-- Check, that friend disappear in Friend module
When I open COMMUNITY menu
When I click on Friends  with css selector #community__menu__friends-link
!-- And I wait until service ready
!-- Then I see placeholdern with css selector div.text-muted:nth-child(4) contains: You don't have any shared portfolios.

!--/*
!-- As friend #2 check that portfolio has become personal.
Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario:
As friend #2 check that friend #1 disappear
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
!-- TODO: As friend #2 check that portfolio has become personal.

!-- When I open COMMUNITY menu
!-- When I click on Friends  with css selector #community__menu__friends-link
!-- And I wait until service ready
!-- Then I see placeholdern with css selector div.text-muted:nth-child(4) contains: You don't have any shared portfolios.


!-- Stas
!-- 4. Log in -> create portfolio -> send sharing request to non-member of tickeron -> open email of non-member of tickeron -> check email (Stas)



!--*/


