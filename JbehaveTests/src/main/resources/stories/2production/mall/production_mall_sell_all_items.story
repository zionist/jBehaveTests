Story: Mall -> Production tests

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
When Mall. Open sell model portfolio
Then I see Page headers with css selector .h1 is Create Model Portfolio
And I see Page second header headers with css selector h3.h3:nth-child(1) is General Information

!-- portfolio subscribtion
When I open MALL menu
And I wait until service ready
When Mall. Open sell subscription portfolio
Then I see Page headers with css selector .h1 is Create Portfolio Subscription
And I see Page second header headers with css selector h3.h3:nth-child(1) is General Information

!-- newsletter
When I open MALL menu
And I wait until service ready
When Mall. Open sell newsletter
Then I see Page headers with css selector .h1 is Create Newsletter
And I see Page second header headers with css selector h3.h3:nth-child(1) is General Information

!-- opinion
When I open MALL menu
And I wait until service ready
When Mall. Open sell opinion
Then I see Page headers with css selector .h1 is Create Opinion
And I see Page second header headers with css selector h3.h3:nth-child(1) is General Information
