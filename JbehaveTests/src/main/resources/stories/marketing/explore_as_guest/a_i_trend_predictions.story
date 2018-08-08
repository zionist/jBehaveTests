Story: Check functionality of A.I. Trend Predictions page

Scenario:
A.I. Trend Predictions
Meta:
@name A.I. Trend Predictions
Given Browser ready
And I wait small timeout
When I open EXPLORE AS GUEST menu
And I wait small timeout
Then I see header with xpath selector //span[text()='ARTIFICIAL INTELLIGENCE'] contains: ARTIFICIAL INTELLIGENCE
!-- Open A.I. Pattern Recognition
When I execute javascript $("a[href='/app/predictions']")[0].click()
!-- When I click on A.I. Trend Predictions tab with xpath selector //a[@href='/app/predictions']
And I wait small timeout
Then I see header with xpath selector //div[h1/text()='A.I. Trend Predictions:'] contains: A.I. Trend Predictions:
!-- Read more
When I click on Read more with xpath selector //button[@class='btn-more']
And I wait small timeout
Then I see header with xpath selector //div[h1/text()='Introduction to Predictions'] contains: Introduction to Predictions
When I execute javascript $(".close").click()
And I wait small timeout
Then I see header with xpath selector //div[h1/text()='A.I. Trend Predictions:'] contains: A.I. Trend Predictions:

!-- enable after return AI Predictions
!-- Open prediction overview page
!-- When I click on Bullish weekly with containsText selector Bullish weekly
!-- And I wait small timeout
!-- Then I see header with css selector h1.ng-binding contains: Bullish Weekly
!-- Click on Subscribe button
!-- When I click on Subscribe button with xpath selector //button[@ng-click='subscribe();']
!-- Then I see log in pop-up window and close it
!-- And I wait small timeout
!-- Click on Sign in Sign up buttons
!-- When I click on Sign in with containsText selector LOG IN
!-- Then I see log in pop-up window and close it
!-- And I wait small timeout
!-- When I click on Sign in with containsText selector SIGN UP
!-- Then I see sign up pop-up window and close it
!-- And I wait small timeout
!-- Back
!-- When I click on Back breadcrumb with xpath selector //a[@ng-click='goBack();']
!-- And I wait small timeout
!-- Then I see header with xpath selector //div[h1/text()='A.I. Trend Predictions:'] contains: A.I. Trend Predictions:
!-- Click on Subscribe button
!-- When I click on Subscribe button with xpath selector //button[@ng-click='subscribe();']
!-- Then I see log in pop-up window and close it
!-- And I wait small timeout