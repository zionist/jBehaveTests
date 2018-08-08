Story: Production Check Futers page

Scenario:
Futers
Given Browser ready
And I wait small timeout
When Main page. Click on Beginner rectangle
And I wait small timeout
!-- Click on contact us selector
And I execute javascript $("dl.page-footer-menu:nth-child(1) > dd:nth-child(2) > ul:nth-child(1) > li:nth-child(1) > a:nth-child(1)").click()
And I wait small timeout
Then I see header with css selector .page-header-name contains: Contact us
And I wait small timeout
!-- Click about us
When I execute javascript $("dl.page-footer-menu:nth-child(1) > dd:nth-child(2) > ul:nth-child(1) > li:nth-child(2) > a:nth-child(1)").click()
And I wait small timeout
!-- Why tickeron
Then I see header with css selector .page-header-name contains: Why Tickeron?
And I wait small timeout
!-- click on Privocy policy
!-- TODO: force same window
!-- When I execute javascript $(".prelogin-marketing-bottom-links > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(3) > td:nth-child(2) > a:nth-child(1)")[0].click()
!-- And I wait small timeout
!-- Then I see header with css selector .prelogin-legal__header contains: Privacy Policy
!-- And I wait small timeout

!-- tickeron.atlassian.net/browse/TMA-2016
!-- When I click on Memberships
When I execute javascript $("dl.page-footer-menu:nth-child(1) > dd:nth-child(2) > ul:nth-child(1) > li:nth-child(3) > a:nth-child(1)")[0].click()
And I wait small timeout
Then I see header with css selector .page-header-name contains: Membership
And I wait small timeout
!-- click on jobs
When I execute javascript var o = $("a[href='/app/legal#!/?article=jobs']")[0]; o.setAttribute('target', '_self'); o.click()
And I wait small timeout
Then I see header with css selector div.ng-scope:nth-child(6) contains: Jobs
And I wait small timeout
!-- Terms Of User
When I execute javascript var o = $(".cx-page-footer-links > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(2) > a:nth-child(1)")[0]; o.setAttribute('target', '_self'); o.click()
And I wait until service ready
Then I see Terms And Conditions with css selector .prelogin-legal__header contains: Terms of Use
And I wait small timeout
!-- Pricing policy
!-- When I execute javascript var o = $(".cx-page-footer-links > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(3) > td:nth-child(2) > a:nth-child(1)")[0]; o.setAttribute('target', '_self'); o.click()
!-- And I wait small timeout
!-- Then I see Pricing Policy with css selector div.ng-scope:nth-child(2) > h1:nth-child(4) contains: Pricing Policy
!-- And I wait small timeout
!-- When I click on Refund Policy with css selector .cx-page-footer-links > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(4) > td:nth-child(2) > a:nth-child(1)
!-- And I wait small timeout
!-- Then I see Refund Policy with css selector div.ng-scope:nth-child(2) > h1:nth-child(4) contains: Refund Policy
And I wait small timeout
!-- Privacy policy
When I execute javascript var o = $(".cx-page-footer-links > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(3) > td:nth-child(2) > a:nth-child(1)")[0]; o.setAttribute('target', '_self'); o.click()
And I wait small timeout
Then I see Privacy Policy with css selector div.ng-scope:nth-child(6) contains: Privacy Policy
And I wait small timeout
!-- Client Agreement
When I execute javascript var o = $(".cx-page-footer-links > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(4) > td:nth-child(2) > a:nth-child(1)")[0]; o.setAttribute('target', '_self'); o.click()
And I wait small timeout
Then I see Client Agreement with css selector div.ng-scope:nth-child(6) contains: Tickeron's Client Account Agreement
And I wait small timeout
!-- Disclosures
!-- When I execute javascript $(".cx-page-footer-links > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(7) > td:nth-child(2) > a:nth-child(1)").click()
!-- And I wait small timeout
!-- Then I see Disclosures with css selector div.ng-scope:nth-child(2) > h1:nth-child(4) contains: Disclosures
!-- And I wait small timeout
!-- When I click on lable with css selector .top-menu-logo
!-- And I wait small timeout



