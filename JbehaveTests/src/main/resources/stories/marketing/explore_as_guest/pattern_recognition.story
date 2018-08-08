Story: Check functionality of A.I. Pattern Recognition page

Scenario:
A.I. Pattern Recognition
Meta:
@name A.I. Pattern Recognition
Given Browser ready
And I wait small timeout
When I open EXPLORE AS GUEST menu
And I wait small timeout
Then I see header with xpath selector //span[text()='ARTIFICIAL INTELLIGENCE'] contains: ARTIFICIAL INTELLIGENCE
!-- Open A.I. Pattern Recognition
When I execute javascript $("a[href='/app/patterns']")[0].click()
!-- When I click on A.I. Pattern Recognition tab with xpath selector //a[@href='/app/patterns']
And I wait small timeout
Then I see header with xpath selector //div[h1/text()='A. I. Pattern Recognition'] contains: A. I. Pattern Recognition
!-- Read more
When Patterns. I check More pattern description on overview page
Then I see header with xpath selector //div[h1/text()='A. I. Pattern Recognition'] contains: A. I. Pattern Recognition
And I wait small timeout
!-- Open pattern overview page
When I click on Broadenning bottom with xpath selector //span[contains(., 'Broadening Bottom')]
And I wait until service ready
Then I see header with css selector .col-xs-9 contains: Broadening Bottom
!-- Click on Subscribe button
When I click on Subscribe button with xpath selector //button[@ng-click='subscribe();']
Then I see sign up pop-up window and close it
And I wait small timeout
!-- Click on Sign in Sign up buttons
!-- When I click on Sign in with xpath selector //a[@ng-click='showLogin()']
!-- When I click on Sign up with xpath selector //a[@ng-click='showRegister()']
When I click on Sign in with css selector div.cx-pattern-login-placeholder_table>a[ng-click='showLogin()']
Then I see log in pop-up window and close it
And I wait small timeout
When I click on Sign up with css selector div.cx-pattern-login-placeholder_table>a[ng-click='showRegister()']
Then I see sign up pop-up window and close it
And I wait small timeout
!-- Back
When I click on Back breadcrumb with xpath selector //a[@ng-click='goBack();']
And I wait small timeout
Then I see header with xpath selector //div[h1/text()='A. I. Pattern Recognition'] contains: A. I. Pattern Recognition
!-- Click on Subscribe button
When I click on Subscribe button with xpath selector //button[@ng-click='subscribe();']
Then I see sign up pop-up window and close it