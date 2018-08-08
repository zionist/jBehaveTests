Story: Production Check Beginner page on pre-login

Scenario:
Beginner page
Meta:
@name Beginner page
Given Browser ready
And I wait small timeout
When Main page. Click on Beginner rectangle
And I wait small timeout
Then I see header with css selector .page-header-text > p:nth-child(1) contains: Use our Artificial Intelligence (A.I.) to find out.
When I wait small timeout

!-- Calculate for free on top of page (Calculate your Diversification Score)
And I execute javascript $("a.prelogin-marketing__button-plus:nth-child(3)")[0].click()
And I wait small timeout
And I wait until service ready
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Calculate your
When I click on logo with css selector .top-menu-logo
And I wait small timeout
And Main page. Click on Beginner rectangle
And I wait small timeout

!-- Click 1st TRY FOR FREE button
!-- When I click on 1st TRY FOR FREE button with css selector div.prelogin-marketing-panel-middle__role-content:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > button:nth-child(3)
And I execute javascript $("span.page-article-button:nth-child(3)").click()
And I wait small timeout
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Asset allocation ideas
When I click on logo with css selector .top-menu-logo
And I wait small timeout
And Main page. Click on Beginner rectangle
And I wait small timeout

!-- Click 2rd TRY FOR FREE button (Find advisor)
And I execute javascript $("a.page-article:nth-child(3) > span:nth-child(4)").click()
!-- And I click on $description with css selector div.col-xs-4:nth-child(1) > button:nth-child(4)
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Find an Advisor
When I click on logo with css selector .top-menu-logo
And I wait small timeout
And Main page. Click on Beginner rectangle
And I wait small timeout

!-- Click 3th TRY FOR FREE button (Share with friend)
And I execute javascript $("a.page-article:nth-child(5) > span:nth-child(4)").click()
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Share with friends
When I click on logo with css selector .top-menu-logo
And I wait small timeout
And Main page. Click on Beginner rectangle
And I wait small timeout

!-- Click 5th TRY FOR FREE button (Join investors clubs)
And I execute javascript $("a.page-article:nth-child(7) > span:nth-child(4)").click()
And I wait small timeout
And I execute javascript $(".prelogin-marketing-panel-middle__role-content > div:nth-child(4) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > button:nth-child(3)").click()
And I wait until service ready
Then I see page header with css selector .cx-misc-tooltip-activator > span:nth-child(1) > span:nth-child(1) contains: Investors Clubs
When I click on logo with css selector .top-menu-logo
And I wait small timeout
And Main page. Click on Beginner rectangle
And I wait small timeout

!-- TRY FOR FREE button (Use Webcasts)
And I execute javascript $("span.-photo:nth-child(4)").click()
And I wait until service ready
Then I see page header with css selector .pull-xs-left > h1:nth-child(1) is: Popular Webcasts
When I click on logo with css selector .top-menu-logo
And I wait small timeout
And Main page. Click on Beginner rectangle
And I wait small timeout

!-- TRY FOR FREE button (Academy)
And I execute javascript $("a.page-article:nth-child(10) > span:nth-child(4)").click()
And I wait until service ready
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: Academy
When I click on logo with css selector .top-menu-logo
And I wait small timeout
And Main page. Click on Beginner rectangle
And I wait small timeout

!-- TRY FOR FREE button (Buy Investment and Trade Ideas in MALL)
And I execute javascript $("a.page-article:nth-child(12) > span:nth-child(4)").click()
And I wait until service ready
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: MALL
When I click on logo with css selector .top-menu-logo
And I wait small timeout
And Main page. Click on Beginner rectangle
And I wait small timeout

!-- TRY FOR FREE button (Calculate your Diversification Score)
And I execute javascript $("a.prelogin-marketing__button-plus:nth-child(1)")[0].click()
And I wait small timeout
And I wait until service ready
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Calculate your