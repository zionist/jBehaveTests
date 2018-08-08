Story: Academy. Webcasts. Invite user to webcast

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Webcast_ + UUID and put it to test param webCastGeneratedName
Given Set test param dateOfWebcast with value 05/07/2020


Scenario: Create Webcast
GivenStories:
   stories/community/webcasts/cred_webcasts.story#{name:Create webcast}
Given Do nothing

Scenario:
Setup params. Set user to Intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password

Scenario: Invite to webcast
Meta:
@name Invite to webcast
Given I logged in with %{username} and %{password}
!-- click on the first event
When I open First notification on Notification page
!-- And I click on register to webcast with css selector button[ng-click='register(webcast)']
!-- And I wait small timeout
!-- According to Dima remove this logic
!-- Then I see Terms & Conditions with css selector h4.modal-title:nth-child(1) contains: Terms & Conditions
!-- And I wait small timeout
!-- When I click on Agree with css selector button.ng-binding:nth-child(2)
!-- And I wait small timeout
!-- And I click on button "No" with css selector button.ng-binding:nth-child(2)
Then I see counter increases by 1 with css selector .cx-items-counter is: 1
Then I see counter increases by 1 with css selector .wc-participants__name > a:nth-child(1) is:  Mike In.
When I wait small timeout
When I click on title with css selector a.cx-second-level-menu-item:nth-child(1)
And I wait until service ready
When I type %{webCastGeneratedName} into title with css selector #community__webcasts__search-input
And I wait small timeout
And I will execute javascript $(".link_black").click()
Then I see register member name with css selector .wc-participants__name > a:nth-child(1) is: Mike In.
When I click on Unregister with css selector span.ng-isolate-scope > button:nth-child(1)
And I click on chevron Back with css selector .cx-breadcrumbs > a:nth-child(1)
And I wait until service ready
When I type %{webCastGeneratedName} into title with css selector #community__webcasts__search-input
When I wait small timeout
Then I see  register button has text with css selector .col-xs-offset-4 > span:nth-child(2) > button:nth-child(1) contains: Register

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario: Delete Webcast
GivenStories:
   stories/community/webcasts/cred_webcasts.story#{name:Delete webcast}
Given Do nothing
