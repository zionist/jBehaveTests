Story: Academy -> Webcasts -> Create webcast, edit and delete it

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Webcast_ + UUID and put it to test param webCastGeneratedName
Given Set test param dateOfWebcast with value 05/04/2021


Scenario: Create Webcast
GivenStories:
   stories/community/webcasts/cred_webcasts.story#{name:Create webcast}
Given Do nothing

Scenario:
Setup params. Set user to Beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario:
Academy -> Webcasts -> Connect to webcast
Meta:
@name Academy -> Webcasts -> Connect to webcast
Given I logged in with %{username} and %{password}
When I open WEBCASTS menu
And I wait until service ready
When I type %{webCastGeneratedName} into title with css selector #community__webcasts__search-input
And I wait small timeout
When I execute javascript scroll(1050, 700)
And I wait small timeout
When I click on register to webcast with css selector button.ng-scope
And I wait until service ready
!-- According to Dima remove this logic
!-- Then I see Terms & Conditions with css selector h4.modal-title:nth-child(1) contains: Terms & Conditions
!-- And I wait small timeout
!-- When I click on Agree with css selector button.ng-binding:nth-child(2)
!-- And I wait small timeout
And I click on press "NO" with css selector button.ng-binding:nth-child(2)
Then I see counter increases by 1 with css selector .webcast__subs > span:nth-child(1) is: 1
When I wait small timeout
When I click on title with css selector .link_black
Then I see register member name with css selector .wc-participants__name contains: Quan Public
When I click on Unregister with css selector span.ng-isolate-scope > button:nth-child(1)
And I click on chevron Back with css selector .cx-breadcrumbs > a:nth-child(1) > span:nth-child(2)
When I wait small timeout
When I type %{webCastGeneratedName} into title with css selector #community__webcasts__search-input
And I wait small timeout
Then I see counter decreases by 1 with css selector .webcast__subs > span:nth-child(1) is: 0

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario: Delete Webcast
GivenStories:
   stories/community/webcasts/cred_webcasts.story#{name:Delete webcast}
Given Do nothing
