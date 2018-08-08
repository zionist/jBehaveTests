Story: Check functionality of Share with friends page

Scenario:
Share with friends
Meta:
@name Share with friends
Given Browser ready
When I open EXPLORE AS GUEST menu
And I wait small timeout
Then I see header with xpath selector //span[text()='SHARE'] contains: SHARE
!-- Open Share with friends
When I execute javascript $("a[href='/app/guest#!/share_with_friends']")[0].click()
!-- When I click on Share wwith friends tab with xpath selector //a[@href='/app/guest#!/share_with_friends']
And I wait small timeout
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Share with friends
!-- Click on Share with Friends
!-- When I click on Share wwith Friends with xpath selector //a[@href='/app/starthere#!/human-intelligence/account/share-with-friend?offerUpgrade']
When I execute javascript $("a[href='/app/starthere#!/human-intelligence/account/share-with-friend?offerUpgrade']")[0].click()
And I wait small timeout
Then I see sign up pop-up window and close it