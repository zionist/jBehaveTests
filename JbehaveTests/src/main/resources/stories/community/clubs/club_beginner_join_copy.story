Story: Community -> Clubs -> As beginner join to club (as owner reject first request) and make copy of club portfolio, check it

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Club + UUID and put it to test param clubTitleGenerated
And I generate UUID + description and put it to test param clubDescriptionGenerated
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario: Create club
GivenStories:
   stories/community/clubs/cred_club.story#{name:create club}
Given Do nothing


Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario:
Community -> Clubs -> Connect to club as member
Meta:
@name Community -> Clubs -> Connect to club as member
Given I logged in with %{username} and %{password}
When Community. Find club %{clubDescriptionGenerated} in Clubs
And I wait until service ready
Then I see head with css selector h1.ng-binding is %{clubTitleGenerated}
When I click on join to club with css selector .btn-join
Then I see toaster with css selector .toast-message contains: Your request was sent
When I wait small timeout


Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario:
Community -> Clubs -> Connect to club reject connection
Meta:
@name Community -> Clubs -> Connect to club reject connection
Given I logged in with %{username} and %{password}
When Community. Find club %{clubDescriptionGenerated} in Clubs
Then I see head with css selector h1.ng-binding is %{clubTitleGenerated}
When I click on Members menu item with css selector #community__clubss__members-link
And I wait until service ready
Then I see head with css selector .social-title > h1:nth-child(1) contains: Club Members
When I click on INQUIRIES radiobutton with xpath selector //label[@class='cx-radio']/span[text()='INQUIRIES']
And I start recording action
And I will move in action to Member element with css selector .member-card__header
!-- And I wait small timeout
And I will move in action to reject element with css selector .club-members__reject-button
!-- And I wait small timeout
And I will click in action on reject element with css selector .club-members__reject-button
Then I perform previously recorded action
!-- And I click on reject with css selector .club-members__reject-button
!-- Then I see toaster with css selector .toast-message contains: Member applicantion was successfully rejected
And I see no clients with css selector span.ng-isolate-scope is No pending members found


Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password


Scenario: Connect to club as member
GivenStories:
   stories/community/clubs/club_beginner_join_copy.story#{name:Community -> Clubs -> Connect to club as member}
Given Do nothing


Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario:
Community -> Clubs -> Connect to club approve connection
Meta:
@name Community -> Clubs -> Connect to club approve connection
Given I logged in with %{username} and %{password}
When Community. Find club %{clubDescriptionGenerated} in Clubs
Then I see head with css selector h1.ng-binding is %{clubTitleGenerated}
When I click on Members menu item with css selector #community__clubss__members-link
And I wait until service ready
Then I see head with css selector .social-title > h1:nth-child(1) contains: Club Members
When I click on INQUIRIES radiobutton with xpath selector //label[@class='cx-radio']/span[text()='INQUIRIES']
And I start recording action
And I will move in action to Member element with css selector .member-card__header
!-- And I wait small timeout
And I will move in action to accept element with css selector .club-members__accept-button
!-- And I wait small timeout
And I will click in action on accept element with css selector .club-members__accept-button
Then I perform previously recorded action
!-- And I click on reject with css selector .club-members__reject-button
!-- Then I see toaster with css selector .toast-message contains: Member applicantion was successfully accepted
Then I see club menbers count with css selector #community__clubs__member-count-link is 2 members


Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password


Scenario:
Community -> Clubs -> Copy club portfolio
Meta:
@name Community -> Clubs -> Copy club portfolio
Given I logged in with %{username} and %{password}
When Community. Find club %{clubDescriptionGenerated} in Clubs
Then I see head with css selector h1.ng-binding is %{clubTitleGenerated}
When I click on Club portfolio menu item with css selector #community__clubs__club-portfolio-link
And I wait until service ready
Then I see head with css selector h1.ng-scope contains: Club Portfolio
When I click on Copy portfolio with css selector button.btn-secondary-sm
When I execute javascript $("li[ng-click*='copyToPersonal()']").click()
Then I see toaster with css selector .toast-message contains: New personal portfolio
!-- Check that portfolio appears in my list of portfolios
When I click on Click here with link selector Click here
And I wait until service ready
Then I see header with css selector .col-sm-9 > h1:nth-child(1) contains: Summary





