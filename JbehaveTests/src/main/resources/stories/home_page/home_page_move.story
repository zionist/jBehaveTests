Story: Home page -> move items on home page

Scenario:
Setup params. check home page
Meta:
@basic
Given Set test param username value from property param.expert.username
And Set test param password value from property param.expert.password

Scenario: move items on home page
Meta:
@name move items on home page
Given I logged in with %{username} and %{password}
When I wait until service ready
Then I see More with css selector .cx-home-screen-more-events > a:nth-child(2) contains: More
And I wait small timeout
!-- Move chats on 4th rectangle
When I start recording action
And I click on edite with css selector button.pull-right:nth-child(1)
And I wait small timeout
And I pushAndHold on element Start here with css selector div.cx-home-screen-icon-container:nth-child(2)
And I wait small timeout
And I move to element 4th rectangle with css selector div.cx-home-screen-icon-container:nth-child(4)
When I click on save with css selector button.pull-right:nth-child(2)
Then I see Toaster item with css selector .toast-message is: Saved
When I wait small timeout
And I click on 4th icon with css selector a.cx-home-screen-icon:nth-child(4)
And I wait until service ready
Then I see head with css selector h1.text-center > span:nth-child(2) contains: Start here with Wizards
And I wait small timeout
!-- Go HOME
When I click on HOME page with css selector #page_menu__home
When I wait until service ready
Then I see More with css selector .cx-home-screen-more-events > a:nth-child(2) contains: More
And I wait small timeout
!-- move chats back to 2nd rectangle
When I start recording action
And I click on edit with css selector button.pull-right:nth-child(1)
And I wait small timeout
And I pushAndHold on element chats with css selector div.cx-home-screen-icon-container:nth-child(4)
And I wait small timeout
And I move to element 2nd rectangle with css selector div.cx-home-screen-icon-container:nth-child(2)
When I wait small timeout
And I click on save with css selector button.pull-right:nth-child(2)
Then I see Toaster item with css selector .toast-message is: Saved
