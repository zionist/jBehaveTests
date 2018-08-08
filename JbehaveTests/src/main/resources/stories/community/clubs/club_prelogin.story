Story: Community -> Clubs -> Prelogin

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
!-- And Set test param clubName with value ClubAutoTest
And I generate Club + UUID and put it to test param clubTitleGenerated
And I generate UUID + _desciption and put it to test param clubDescriptionGenerated
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario: Create club for connection
GivenStories:
   stories/community/clubs/cred_club.story#{name:create club}
Given Do nothing
And I logged OUT

Scenario: Check prelogin for club
Meta:
@name Check prelogin for club
!-- Open prelogin clubs page
Given Browser ready
When I execute javascript $("a[href='/app/guest#!/']")[0].click()
And I wait until service ready
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
!-- Find club
When I type %{clubTitleGenerated} into Clubs saerch input with css selector #community__clubs__search-by-title-input
And I wait small timeout
!-- Open one club (see clubname variable)
And I click on club with containsText selector %{clubDescriptionGenerated}
And I wait until service ready
!-- Check club page
Then I see Club title with css selector .col-sm-9 > h1:nth-child(1) is %{clubTitleGenerated}
Then I see join button with css selector .btn-join is JOIN THE CLUB
!-- Click on join button. Check dialog window appears
When I click on join button with css selector .btn-join
Then I see login dialog window header with css selector .cx-marketing-modal__title contains: Get Started for FREE







