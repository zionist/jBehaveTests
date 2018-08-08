Story: Check functionality of Community Webcasts page

Scenario:
Community Webcasts
Meta:
@name Community Webcasts
Given Browser ready
And I wait small timeout
When I open EXPLORE AS GUEST menu
And I wait small timeout
Then I see header with xpath selector //span[text()='LEARN'] contains: LEARN
!-- Open Academy
When I execute javascript $("a[href='/app/academy#!/overview']")[0].click()
!-- When I click on Community tab with xpath selector //a[@href='/app/academy#!/overview']
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: Academy
!-- Webcasts
When I execute javascript $("a[href='/app/academy#!/webcasts']")[0].click()
!-- When I start recording action
!-- And I will move in action to 01 element with css selector div.col-lg-6:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1)
!-- And I click on 01 with css selector div.col-lg-6:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1)
!-- And I click on Open button with css selector div.col-lg-6:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(5) > a:nth-child(1)
!-- When I execute javascript $("a[href=\"GoTo('../../app/academy#!/webcasts')\"]")[0].click()
And I wait small timeout
Then I see page header with css selector .pull-xs-left > h1:nth-child(1) is: Popular Webcasts