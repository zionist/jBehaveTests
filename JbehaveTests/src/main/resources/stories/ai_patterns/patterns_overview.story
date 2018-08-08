Story: Check Patterns overview without subscription

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.atexpertat.username
Given Set test param password value from property param.atexpertat.password

Scenario:
Patterns overview wout subscription
Given I logged in with %{username} and %{password}
!-- Overview
When I open AI patterns recognition block
And I wait small timeout
Then I see header with xpath selector //div[h1/text()='A. I. Pattern Recognition'] contains: A. I. Pattern Recognition
When Patterns. I check More pattern description on overview page
Then I see header with xpath selector //div[h1/text()='A. I. Pattern Recognition'] contains: A. I. Pattern Recognition
!-- check pattern type page
When I wait small timeout
When I click on Broadenning bottom with xpath selector //a[@href='#!/patterns/pattern/1']
Then I see header with css selector .col-xs-9 > span:nth-child(1) contains: Broadening Bottom
When I wait until service ready
When I click on Subscribe button with containsText selector Subscribe now!
And I wait until service ready
And I switch to pop-up window frame with css selector .stripe_checkout_app
And I wait until service ready
Then I see pop-up window with css selector h1[class='Header-companyName u-textTruncate'] contains: Secure card processing
When I click on close button with css selector span[class='Header-navClose']
And I wait small timeout
Then I switch to default content
When I wait until service ready
And I click on Back with xpath selector //a[@ng-click='goBack();']
Then I see header with xpath selector //div[h1/text()='A. I. Pattern Recognition'] contains: A. I. Pattern Recognition
When I click on Bearish tab with css selector .tabs-left > li:nth-child(2)
And I wait small timeout
When I click on Broadenning bottom with xpath selector //a[@href='#!/patterns/pattern/2']
And I wait until service ready
Then I see header with css selector .col-xs-9 > span:nth-child(1) contains: Broadening Bottom
When I will refresh the page
And I wait until service ready
When I click on Subscribe button with containsText selector Subscribe now!
And I wait small timeout
And I switch to pop-up window frame with css selector .stripe_checkout_app
And I wait until service ready
Then I see pop-up window with css selector h1[class='Header-companyName u-textTruncate'] contains: Secure card processing
When I click on close button with css selector span[class='Header-navClose']
And I wait small timeout
Then I switch to default content
When I wait until service ready
And I click on Back with xpath selector //a[@ng-click='goBack();']
Then I see header with xpath selector //div[h1/text()='A. I. Pattern Recognition'] contains: A. I. Pattern Recognition
When I will refresh the page
And I wait until service ready
!-- click on subscribe
When I click on Subscribe button with containsText selector Subscribe for
And I wait small timeout
And I switch to pop-up window frame with css selector .stripe_checkout_app
And I wait until service ready
Then I see pop-up window with css selector h1[class='Header-companyName u-textTruncate'] contains: Secure card processing
When I click on close button with css selector span[class='Header-navClose']
And I wait small timeout
Then I switch to default content
When I wait until service ready
Then I see header with xpath selector //div[h1/text()='A. I. Pattern Recognition'] contains: A. I. Pattern Recognition