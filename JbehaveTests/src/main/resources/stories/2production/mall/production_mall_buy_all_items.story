Story: Mall -> Production tests. Buy and search all items

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Opinion_ + UUID and put it to test param opinonGeneratedName


Scenario: Check Buy all mall items
Given I logged in during maintenance with %{username} and %{password}
!-- model portfolios
When I open MALL menu
And I wait until service ready
When Mall. Open buy model portfolio
Then I see Page headers with css selector .pull-left is Model Portfolios
And I see Page headers with css selector .table > thead:nth-child(1) > tr:nth-child(1) > th:nth-child(2) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) is TITLE
And I don't see element not found selector with css selector .text-muted

!-- A.I. Pattern Recognition à la carte
When I open MALL menu
And I wait until service ready
When Mall. Open buy AI pattern recoginition a-la carte
Then I see Page headers with css selector .h1 is A.I. Pattern Recognition à la carte
Then I see Page table header with css selector .bordered-table > thead:nth-child(1) > tr:nth-child(1) > th:nth-child(2) > div:nth-child(2) > span:nth-child(1) > span:nth-child(1) is PATTERN TYPE
And I don't see element not found selector with css selector .text-muted

!-- Portfolio subscription
When I open MALL menu
And I wait until service ready
When Mall. Open buy subscription portfolio
Then I see Page headers with css selector .pull-left is Portfolio Subscriptions
And I see Page headers with css selector .table > thead:nth-child(1) > tr:nth-child(1) > th:nth-child(2) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) is TITLE
And I don't see element not found selector with css selector .text-muted

!-- AI pattern Recognition
When I open MALL menu
And I wait until service ready
When Mall. Open AI pattern recoginition. Start for free
Then I see Page headers with css selector h1.col-xs-6 contains: Inbox

!-- Newsletters
When I open MALL menu
And I wait until service ready
When Mall. Open buy newsletter
Then I see Page headers with css selector .pull-left is Newsletters
And I see Page headers with css selector .table > thead:nth-child(1) > tr:nth-child(1) > th:nth-child(2) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) is TITLE
And I don't see element not found selector with css selector .text-muted

!-- Ai trend predictions
When I open MALL menu
And I wait until service ready
When Mall. Open AI tred prediction. Start for free
Then I see Page headers with css selector h1.ng-binding contains: Inbox

!-- Opinions
When I open MALL menu
And I wait until service ready
When Mall. Open buy opinion
Then I see Page headers with css selector .pull-left is Opinions
And I see Page headers with css selector .table > thead:nth-child(1) > tr:nth-child(1) > th:nth-child(2) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1) is TITLE
And I don't see element not found selector with css selector .text-muted
