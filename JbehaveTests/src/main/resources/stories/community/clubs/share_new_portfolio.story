Story: Community -> Clubs -> Share new Portfolio

Scenario:
Setup params. Set user to advisor
!-- Logged user must be owner of club %{clubName}
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Club + UUID and put it to test param clubTitleGenerated
And I generate UUID + _desciption and put it to test param clubDescriptionGenerated
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario:
Create club
GivenStories:
    stories/community/clubs/cred_club.story#{name:create club}
Given Do nothing

Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario:
Create club
GivenStories:
    stories/community/clubs/club_connect_to_club.story#{name:Community -> Clubs -> Connect to club as member}
Given Do nothing


Scenario:
Setup params. Set user to advisor

Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Create club
GivenStories:
     stories/community/clubs/club_connect_to_club.story#{name:Community -> Clubs -> Connect to club approve connection}
Given Do nothing



Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate _Personal + UUID and put it to test param portfolioGenerated

Scenario:
Share new portfolio
GivenStories:
      stories/functional/test/portfolio/create_investement_portfolio.story#{name:Create investment porfolio}
Given I logged in with %{username} and %{password}
When I open COMMUNITY - Clubs menu
!-- Find club
And I type %{clubDescriptionGenerated} into Clubs saerch input with css selector #community__clubs__search-by-title-input
And I wait small timeout
!-- Open one club (see clubname variable)
When Community. Find club %{clubDescriptionGenerated} in Clubs
!-- And I click on club title with containsText selector %{clubTitleGenerated}
!-- Open your club member profile link
And I click on yor club member profile link with css selector #community__clubs__your-club-member-profile-link
And I wait until service ready
!-- Share previously created portfolio
And I click on Share portfolio button with css selector .btn-secondary
And I wait until service ready
!-- Check I on share porfolio page
Then I see Page header with css selector h1.ng-scope is Select a Portfolio to share
!-- Click on previously create portfolio Publish button
When I click on Publish button with css selector div.btn
And I wait until service ready
Then I see toaster with css selector .toast-message is Portfolio was successfully published!
Then I see title with css selector .club-profile__other__item__header contains: %{portfolioGenerated}









