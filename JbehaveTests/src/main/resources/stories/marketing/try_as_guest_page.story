Story: Production Check Try as guest page

Scenario:
Try as guest page
Given Browser ready
And I wait small timeout
When I click on TRY AS GUEST  with css selector a.icon
And I click on AI wizards with css selector .explore-as-guest-container > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(5) > a:nth-child(1) > div:nth-child(1) > div:nth-child(2)
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is A.I. Wizards
!-- Mall
Given I open root url /app/guest
And I wait small timeout
When I click on MALL block with css selector .va-bottom-flex > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(5) > a:nth-child(1) > div:nth-child(1)
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: MALL
!-- Community trend predictions
Given I open root url /app/guest
And I wait small timeout
When I click on Community trend predictions block with css selector .va-bottom-flex > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(5) > a:nth-child(2) > div:nth-child(1)
And I wait until service ready
Then I see page header with css selector .cx-patterns-overview__text > h1:nth-child(1) is: Community Trend Predictions: What is it?
!--  Ai pattern recognitions
Given I open root url /app/guest
And I wait small timeout
When I click on Ai patterns block with css selector .explore-as-guest-container > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(6) > a:nth-child(1) > div:nth-child(1)
Then I see page header with css selector .col-lg-5 > h1:nth-child(1) is: A. I. Pattern Recognition
!--  Ai trend predictions
Given I open root url /app/guest
And I wait small timeout
When I click on Ai trend predictions with css selector .explore-as-guest-container > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(6) > a:nth-child(2) > div:nth-child(1)
Then I see page header with css selector .col-xs-4 > h1:nth-child(1) is: A.I. Trend Predictions:
!--  Community
Given I open root url /app/guest
And I wait small timeout
When I click on Community with css selector .va-bottom-flex > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(6) > a:nth-child(1) > div:nth-child(1)
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: Community
!-- Academy
Given I open root url /app/guest
And I wait small timeout
When I click on Academy with css selector .explore-as-guest-container > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(7) > a:nth-child(1) > div:nth-child(1)
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: Academy
!-- Find advisors
!-- Given I open root url /app/guest
!-- And I wait small timeout
!-- When I click on Find advisors with css selector .va-bottom-flex > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(7) > a:nth-child(1) > div:nth-child(1)
!-- Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: Find an Advisor
!-- Share with friends
Given I open root url /app/guest
And I wait small timeout
When I execute javascript $("a[href='/app/guest#!/share_with_friends']")[0].click()
And I wait until service ready
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Share with friends
!-- Find clients
!-- Given I open root url /app/guest
!-- And I wait small timeout
!-- When I click on Find advisors with css selector .va-bottom-flex > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(7) > a:nth-child(3) > div:nth-child(1)
!-- Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: Find new clients
