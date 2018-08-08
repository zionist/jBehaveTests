Story: Check functionality of Community Clubs page

Scenario:
Community Clubs
Meta:
@name Community Clubs
Given Browser ready
When I open EXPLORE AS GUEST menu
And I wait small timeout
Then I see header with xpath selector //span[text()='HUMAN INTELLIGENCE'] contains: HUMAN INTELLIGENCE
!-- Open Community
When I execute javascript $("a[href='/app/guest#!/community']")[0].click()
!-- When I click on Community tab with css selector a[href='/app/guest#!/community']
And I wait small timeout
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Community
!-- Clubs
When I execute javascript $("div[ng-click=\"GoTo('../../app/social#!/clubs/list')\"]")[0].click()
And I wait small timeout
Then I see header with xpath selector //span[text()='Investors Clubs'] contains: Investors Clubs
When I click on mine checkbox with css selector label.cx-checkbox:nth-child(2)
And I wait small timeout
Then I see sign up pop-up window and close it
