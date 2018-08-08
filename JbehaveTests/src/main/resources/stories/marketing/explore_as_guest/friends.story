Story: Check functionality of Community Friends page

Scenario:
Community Friends
Meta:
@name Community Friends
Given Browser ready
And I wait small timeout
When I open EXPLORE AS GUEST menu
And I wait small timeout
Then I see header with xpath selector //span[text()='HUMAN INTELLIGENCE'] contains: HUMAN INTELLIGENCE
!-- Open Community
When I execute javascript $("a[href='/app/guest#!/community']")[0].click()
!-- When I click on Community tab with xpath selector //a[@href='/app/guest#!/community']
And I wait small timeout
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Community
!-- Friends
When I execute javascript $("div[ng-click=\"GoTo('../../app/guest#!/share_with_friends')\"]")[0].click()
And I wait small timeout
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Share with friends