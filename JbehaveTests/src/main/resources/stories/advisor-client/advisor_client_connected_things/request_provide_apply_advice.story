Story: Request, provide, apply advice (client managed portfolio)

Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password
Given Set test param clientName with value Mike In.
Given Set test param advisorName with value James Adv.
Given Set test param adviceText with value Text
Given Set test param chatText with value Hello client


Scenario:
Request advice as client
Given I logged in with %{username} and %{password}
!-- Open ACWA page
When I open ADVISORS menu
And I click on current advisor with css selector a[href='#!/current']
And I wait until service ready
Then I see advisor name with css selector a[href='#!/members/159'] contains: %{advisorName}
!-- Open portfolio
When I click on Portfolio in list with css selector a[href^='/app/portfolios#!/portfolio/view/']
And I wait until service ready
Then I see Request advice button with css selector button[ng-click='sendRequestToAdvisor()'] contains: REQUEST ADVICE
When I click on Request advice button with css selector button[ng-click='sendRequestToAdvisor()']
And I wait small timeout
Then I see Requested with css selector #_adviceRequestedOnDate > span:nth-child(1) contains: Requested


Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario:
Provide advice
Given I logged in with %{username} and %{password}
When I open First notification on Notification page
Then I see Advice Requested with css selector div.portfolio_topplate_block__v_divider-avatar:nth-child(2) > div:nth-child(1) contains: ADVICE REQUESTED
Then I see header with css selector .col-sm-9 > h1:nth-child(1) contains: Client Portfolio Summary
!-- Provide Advice
When I click on Investment/Trade ideas with css selector .cx-portfolio-menu__trade-idea > span:nth-child(2) > span:nth-child(1)
And I wait until service ready
And I click on Enter draft with css selector div.cx-idea-main__task-block:nth-child(3) > div:nth-child(2)
And I click on Actuals with css selector div.cx-idea-main__from_block:nth-child(1)
Then I see header with css selector h1.col-xs-7 > span:nth-child(1) contains: Review Ideas From Advice
When I click on edit text with css selector .cx-idea-preview__comment_do-edit-caption > span:nth-child(1) > a:nth-child(1)
And I wait small timeout
And I clear the field with css selector .cx-idea-preview__comment_editor_on-edit
And I type %{adviceText} into field with css selector .cx-idea-preview__comment_editor_on-edit
And I click on Save with containsText selector Save
And I wait small timeout
And I click on Post with containsText selector Post
And I wait until service ready
Then I see posted with css selector div.portfolio_topplate_block__v_divider-avatar:nth-child(1) > div:nth-child(2) > div:nth-child(1) > span:nth-child(1) contains: Posted
!-- Open chat
!-- When I will execute javascript $("div.cx_portfolio_chats_icon").click()
!-- And I send chat message with text %{chatText}
!-- Then I see header with css selector .col-sm-9 > h1:nth-child(1) contains: Client Portfolio Summary


Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password


Scenario:
Apply advice as client
Given I logged in with %{username} and %{password}
When I open First notification on Notification page
Then I see header with css selector h1.col-xs-7 > span:nth-child(1) contains: Review Advice (Draft)
When I click on Back with css selector p.cx-breadcrumbs:nth-child(1) > a:nth-child(1)
And I wait until service ready
Then I see New advice with css selector div.top-plate-action-btn_advice contains: NEW ADVICE
When I will wait until Request advice element with css selector button[ng-click='sendRequestToAdvisor()'] will be visible
!-- Apply advice
And I click on Review advice with css selector div.cx-idea-main__task-block:nth-child(3) > div:nth-child(2)
Then I see header with css selector h1.col-xs-7 > span:nth-child(1) contains: Review Ideas From Advice (Draft)
Then I see element property advisor comment with css selector .cx-idea-preview__comment_editor has property value with value %{adviceText}
When I click on Apply with containsText selector Apply
And I wait until service ready
Then I see header with css selector h1.ng-scope contains: Next



