Story: check home pages for expert and advisor

Narrative:
As a user
I want to check home page

Scenario:
Setup params. Set user to expert
Meta:
@basic
Given Set test param username value from property param.expert.username
And Set test param password value from property param.expert.password



Scenario: check home page
Meta:
@name check home page
Given I logged in with %{username} and %{password}
When I wait until service ready
Then I see More with css selector .cx-home-screen-more-events > a:nth-child(2) contains: More
And I wait small timeout

!-- Check chats block
When I open chats block
And I wait until service ready
Then I see head with css selector .text-xs-left contains: All Chats
And I wait small timeout
!-- Go HOME
When I open HOME menu
When I wait until service ready
Then I see More with css selector .cx-home-screen-more-events > a:nth-child(2) contains: More
And I wait small timeout

!-- Check notes block
When I open notes block
And I wait until service ready
Then I see head with css selector .text-xs-left contains: All Private Notes
And I wait small timeout
!-- Go HOME
When I open HOME menu
When I wait until service ready
Then I see More with css selector .cx-home-screen-more-events > a:nth-child(2) contains: More
And I wait small timeout

!-- Check friends block
When I open Friends page
And I wait until service ready
Then I see head with css selector div.col-xs-6:nth-child(1) > h1:nth-child(1) contains: Friends
And I wait small timeout
!-- Go HOME
When I open HOME menu
When I wait until service ready
Then I see More with css selector .cx-home-screen-more-events > a:nth-child(2) contains: More
And I wait small timeout

!-- Check Community Trend Predictions block
!-- When I open community trend predictions block
!-- And I wait until service ready
!-- Then I see head with css selector .col-md-4 > h1:nth-child(1) contains: Community Trend Predictions
!-- And I wait small timeout
!-- Go HOME
!-- When I open HOME menu
!-- When I wait until service ready
!-- Then I see More with css selector .cx-home-screen-more-events > a:nth-child(2) contains: More
!-- And I wait small timeout

!-- Check Purchases block
When I open purchases block
And I wait until service ready
Then I see head with css selector .h1 contains: Purchases
And I wait small timeout
!-- Go HOME
When I open HOME menu
When I wait until service ready
Then I see More with css selector .cx-home-screen-more-events > a:nth-child(2) contains: More
And I wait small timeout

!-- Check Listings block
When I open Listings page
And I wait until service ready
Then I see head with css selector .h1 contains: Listings
And I wait small timeout
!-- Go HOME
When I open HOME menu
When I wait until service ready
Then I see More with css selector .cx-home-screen-more-events > a:nth-child(2) contains: More
And I wait small timeout

!-- Check Portfolios block
When I open portfolios block
And I wait until service ready
Then I see head with css selector div.col-sm-6:nth-child(1) > div:nth-child(1) > h1:nth-child(1) contains: Portfolios
And I wait small timeout
!-- Go HOME
When I open HOME menu
When I wait until service ready
Then I see More with css selector .cx-home-screen-more-events > a:nth-child(2) contains: More
And I wait small timeout

!-- Check Start here with block
When I open starts here wizard
And I wait until service ready
Then I see head with css selector h1.text-center > span:nth-child(2) contains: Start here with Wizards
And I wait small timeout
!-- Go HOME
When I open HOME menu
When I wait until service ready
Then I see More with css selector .cx-home-screen-more-events > a:nth-child(2) contains: More
And I wait small timeout

!-- Check My public page block
When I open My public page
And I wait until service ready
Then I see head with css selector .cx-breadcrumbs .ng-scope contains: My public page
And I wait small timeout
!-- Go HOME
When I open HOME menu
When I wait until service ready
Then I see More with css selector .cx-home-screen-more-events > a:nth-child(2) contains: More
And I wait small timeout

!-- Check A. I. Pattern Recognition block
When I open AI patterns recognition block
And I wait until service ready
Then I see head with css selector .col-lg-5 > h1:nth-child(1) contains: A. I. Pattern Recognition
And I wait small timeout
!-- Go HOME
When I open HOME menu
When I wait until service ready
Then I see More with css selector .cx-home-screen-more-events > a:nth-child(2) contains: More
And I wait small timeout

!-- Check A.I. Trend Predictions block
!-- When I open AI trend predictions block
!-- And I wait until service ready
!-- Then I see head with css selector .col-md-4 > h1:nth-child(1) contains: A.I. Trend Predictions:
!-- And I wait small timeout
!-- Go HOME
!-- When I open HOME menu
!-- When I wait until service ready
!-- Then I see More with css selector .cx-home-screen-more-events > a:nth-child(2) contains: More
!-- And I wait small timeout

!-- Check Payments block
When I open Payments page
And I wait until service ready
Then I see head with css selector .h1 contains: Payments
And I wait small timeout
!-- Go HOME
When I open HOME menu
When I wait until service ready
Then I see More with css selector .cx-home-screen-more-events > a:nth-child(2) contains: More
And I wait small timeout

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Login with email and password as Advisor User
GivenStories:
    stories/home_page/home_page_exp_adv.story#{name:check home page}
Given Do nothing