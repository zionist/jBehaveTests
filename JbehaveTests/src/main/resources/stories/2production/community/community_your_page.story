Story: Production - Check Your Page in Community

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario:
Community - Your Page

Given I logged in during maintenance with %{username} and %{password}
!--Overview
When I click on Community menu with css selector #page_menu__community
And I wait until service ready
!-- Then I see page header with css selector .hide-on-less-than-1280px contains: James Adv.
!-- Check followers
When I click on 'No followers' link with css selector cx-member-info.ng-scope > div:nth-child(1) > div:nth-child(2) > a:nth-child(4) > span:nth-child(1)
And I wait until service ready
Then I see page header with css selector .member-followers__header > span:nth-child(1) contains: Followers of
!-- Check tabs
When I click on 'Overview' button with css selector #community__menu__overview-link
Then I see 1st tab header with css selector div.member-overview__block:nth-child(6) > div:nth-child(1) > h3:nth-child(1) contains: Products in MALL
And I see 3rd tab header with css selector div.member-overview__block:nth-child(1) > div:nth-child(2) > div:nth-child(1) > h3:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) contains:  Webcasts

!-- Predictions
When I click on 'Predictions' button with css selector #community__predictions-link
Then I see page header with css selector .cx-misc-tooltip-activator > span:nth-child(1) > span:nth-child(1) contains: Predictions
Then I see 1st tab header with css selector div.col-sm-6:nth-child(1) > div:nth-child(1) contains: Current Predictions
Then I see 2nd tab hearer with css selector div.col-sm-6:nth-child(2) > div:nth-child(1) contains: Previous Predictions

!-- Products in MALL
When I click on 'Products in MALL' button with css selector #community__menu__products-in-mall-link
Then I see page header with css selector .social-title > h1:nth-child(1) contains: Products in MALL
!-- check filter
When I click on 'Product types' filter with css selector .form-control
And I start recording action
And I will move in action to Newsletter element with css selector .form-control > option:nth-child(3)
And I will click in action on Newsletter element with css selector .form-control > option:nth-child(3)
Then I see inscription with css selector .community-no-data-found-label contains: No items

!-- Investors Clubs
When I click on 'Investment Clubs' button with css selector #community__menu__investment-clubs-link
Then I see page header with css selector .cx-misc-tooltip-activator > span:nth-child(1) > span:nth-child(1) contains: Clubs
!-- Then I see inscription with css selector span.ng-isolate-scope:nth-child(1) contains: NO DATA FOUND

!-- Webcasts
When I click on 'Webcasts' button with css selector .cx-content-menu__icon__webcasts
Then I see page header with css selector .cx-misc-tooltip-activator > span:nth-child(1) > span:nth-child(1) contains: Webcasts
Then I see inscription with css selector .community-no-data-found-label > span:nth-child(1) contains: You have not subscribed to a Webcast

!-- Bookmarked/Followed content
!-- When I click on 'Bookmarked/Followed content' button with css selector .fa-bookmark
!-- Then I see page header with css selector .social-title > h1:nth-child(1) > span:nth-child(1) contains: Bookmarked / Followed Articles
!-- Check tabs
!-- When I click on 'Questions' tab with css selector .nav-tabs > li:nth-child(2) > a:nth-child(1)
!-- Then I see inscription with css selector span.ng-isolate-scope contains: NO DATA FOUND
!-- When I click on 'Articles' tab with css selector .nav-tabs > li:nth-child(1) > a:nth-child(1)
!-- Then I see inscription with css selector span.ng-isolate-scope contains: NO DATA FOUND

!-- Blog
When I click on 'Blog' button with css selector #community__menu__blogs-link
Then I see page header with css selector .social-title > h1:nth-child(1) contains: Blog
When I click on 'Create post' button with containsText selector Create Post
And I wait until service ready
Then I see page headern with css selector h1.ng-binding contains: Create new post
When I click on chevron 'Your page' with link selector Blogs
And I wait until service ready
Then I see page header with css selector .social-title > h1:nth-child(1) contains: Blog

!-- Q&A
When I click on 'Q&A' button with css selector #community__menu__qa-link
Then I see page header with css selector .social-title > h1:nth-child(1) contains: Questions & Answers
When I click on 'Questions asked' tab with css selector ul.nav:nth-child(3) > li:nth-child(2) > a:nth-child(1)
Then I see inscription with css selector p.community-no-data-found-label:nth-child(5) contains: No questions found

