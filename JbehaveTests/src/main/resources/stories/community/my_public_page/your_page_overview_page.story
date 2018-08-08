Story: Community -> Your page -> Overview

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario: Check overview -> Your page
Given I logged in with %{username} and %{password}
When I open COMMUNITY menu
And I wait until service ready
Then I see header with css selector .hide-on-less-than-1280px contains: James Adv.
And I wait small timeout
Then I see Products in Mall header with css selector div.member-overview__block:nth-child(5) > div:nth-child(1) > h3:nth-child(1) contains: Products in MALL
And I see Investors Clubs header with css selector div.member-overview__block:nth-child(1) > div:nth-child(1) > div:nth-child(1) > h3:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) is: Investors Clubs
And I see Webcasts header with css selector div.member-overview__block:nth-child(1) > div:nth-child(2) > div:nth-child(1) > h3:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) is: Webcasts
And I see Webcasts header with css selector div.member-overview__block:nth-child(1) > div:nth-child(2) > div:nth-child(1) > h3:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) is: Webcasts
And I see Blog header with css selector div.member-overview__block:nth-child(2) > div:nth-child(1) > h3:nth-child(1) is: Blog
And I see Q&A header with css selector div.member-overview__block:nth-child(2) > div:nth-child(2) > h3:nth-child(1) is: Q&A
!-- And I see Predictions header with css selector div.member-overview__block:nth-child(3) > div:nth-child(1) > h3:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) is: Predictions
!-- And I see Number of predictions table header with css selector div.member-overview-item:nth-child(3) > strong:nth-child(1) is: Number of predictions
!-- When I click on Overview with css selector .cx-content-menu__icon__overview
!-- And I wait until service ready
!-- And I click on PREDICTION RANKINGS with css selector a.btn:nth-child(6)
!-- And I wait until service ready
!-- Then I see head with css selector .cx-misc-tooltip-activator > span:nth-child(1) > span:nth-child(1) contains: Predictions






