Story: Production - Check Predictions

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Production check AI trend predictions
Meta:
@name Production AI trend predictions
Given I logged in during maintenance with %{username} and %{password}
When I click on Trend Predictions (A.I.) with css selector a.cx-home-screen-icon:nth-child(13) > cx-home-shortcut-item-base:nth-child(1) > div:nth-child(1) > div:nth-child(1) > img:nth-child(1)
And I wait until service ready
Then I see main page header with css selector .col-xs-4 > h1:nth-child(1) is A.I. Trend Predictions:
!-- Click READ MODE
When I click on READ  with css selector .btn-more
Then I see Pupup window header with css selector div.in:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > h1:nth-child(1) is Introduction to Predictions
When I click on close icon with css selector button.close:nth-child(2)
And I wait small timeout
!-- Click on subscribe
When I execute javascript scroll(1050, 0)
When I click on Subscribe button with css selector button.btn:nth-child(6)
And I click on No button with css selector button.ng-binding:nth-child(2)
And I wait small timeout
!-- Click on prediction types
When I click on Bullish weekly with css selector a.cx-predictions-link:nth-child(1)
And I wait until service ready
Then I see page header with css selector h1.ng-binding is Bullish Weekly
And I see second page header with css selector .cx-predictions-page__description > div:nth-child(2) > strong:nth-child(1) is General Description
!-- TODO: make all other type then predictions will work


Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password

Scenario:
Production check AI pattern recognition from intermed
GivenStories:
    stories/2production/trade_ideas/predictions.story#{name:Production AI trend predictions}
Given Do nothing

Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario:
Production check AI pattern recognition from beginner
GivenStories:
    stories/2production/trade_ideas/predictions.story#{name:Production AI trend predictions}
Given Do nothing


