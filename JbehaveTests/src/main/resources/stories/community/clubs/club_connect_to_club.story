Story: Community -> Clubs -> Connect to club as member

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Club + UUID and put it to test param clubTitleGenerated
And I generate UUID + _desciption and put it to test param clubDescriptionGenerated
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario: Create club for connection
GivenStories:
   stories/community/clubs/cred_club.story#{name:create club}
Given Do nothing
!-- check chat
When I wait big timeout
And I click on chats with css selector .ti
And I wait until service ready
And I send chat message with text Hi, clubers!
Then I see Manage Club header with css selector .community__header contains: Manage Club
!-- And I type Hi, clubers! into message with css selector .cx-chat__new-message__textarea
!-- And I click on send button with css selector .btn-secondary-sm
!-- Then I see sent message with css selector .cx-chat__dialog__message__text_mine > pre:nth-child(2) contains: Hi, clubers!


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
And I click on join to club with css selector .btn-join
And I wait small timeout
!-- Then I see Request sent with css selector .btn-join contains: Request sent


Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario:
Community -> Clubs -> Connect to club approve connection
Meta:
@name Community -> Clubs -> Connect to club approve connection
Given I logged in with %{username} and %{password}
When I open First notification on Notification page
And I execute javascript $(".club-members__accept-button").click()
!-- Check there are two members in club
Then I see members count label with css selector #community__clubs__member-count-link is 2 members

Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario:
Community -> Clubs -> Connect to club as member and send a chat
Meta:
@name Community -> Clubs -> Connect to club as member and send a chat
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio My version of %{clubDescriptionGenerated} portfolio
When Community. Find club %{clubDescriptionGenerated} in Clubs
!-- check chat
When I click on chats with css selector .ti
And I wait until service ready
And I send chat message with text Hi, clubers too!
Then I see title with css selector h1.ng-binding contains: %{clubTitleGenerated}
!-- And I type Hi, clubers too! into message with css selector .cx-chat__new-message__textarea
!-- And I click on send button with css selector .btn-secondary-sm
!-- Then I see sent message with css selector .cx-chat__dialog__message__text_mine > pre:nth-child(2) contains: Hi, clubers too!
