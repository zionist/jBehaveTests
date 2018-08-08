Story: Create webcast, edit and delete it

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Webcast_ + UUID and put it to test param webCastGeneratedName
Given Set test param dateOfWebcast with value 05/03/2019
Given Set test param dateOfWebcastEdited with value 03/07/2019

Scenario:
Create webcast
Meta:
@name Create webcast
Given I logged in with %{username} and %{password}
When I open WEBCASTS menu
And I wait until service ready
And I click on add new webcast with css selector button.btn-secondary:nth-child(1)
And I wait until service ready
Then I see page header with css selector .social-title > h1:nth-child(2) is: Create Your Own Webcast
!-- When I click on title with css selector input.ng-invalid
When I click on title with css selector input[name='title']
And I type %{webCastGeneratedName} into title with css selector input[name='title']
And I wait small timeout
!-- And I clear the date-piker with css selector .common-date-picker-input
!-- And I type %{dateOfWebcast} into date with css selector .common-date-picker-input
And I type webcast description 1 into description textarea with css selector textarea.form-control
And I wait small timeout
And Webcast. Select free time
And I wait small timeout
When I execute javascript $("input.ng-pristine:nth-child(1)").click()
And I click on button "Save and next" with css selector button.btn:nth-child(3)
And I wait small timeout
Then I see page header with css selector .social-title > h1:nth-child(1) contains: Invite Participants
When I type i1@catch01.tickerontest.com into invite intermediate_at with css selector .webcasts__container > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > textarea:nth-child(1)
And I wait small timeout
When I click on button "Invite and Continue" with css selector div.row:nth-child(5) > div:nth-child(1) > button:nth-child(1)
And I wait until service ready

Scenario:
Edit webcast
Meta:
@name Edit webcast
Given I logged in with %{username} and %{password}
When I open WEBCASTS menu
And I wait until service ready
And I type %{webCastGeneratedName} into title of webcast with css selector #community__webcasts__search-input
And I wait small timeout
When I execute javascript scroll(1050, 700)
And I wait small timeout
And I click on button "Edit" with css selector .col-xs-offset-4 > span:nth-child(2) > button:nth-child(1)
And I wait until service ready
And Set test param webCastGeneratedName with value changed_%{webCastGeneratedName}
And I clear the Webcast title input with css selector input.ng-valid-maxlength
When I click on title with css selector input[name='title']
And I type %{webCastGeneratedName} into title with css selector input[name='title']
And I wait small timeout
!-- And I clear the date-piker with css selector .common-date-picker-input
!-- And I type %{dateOfWebcastEdited} into date with css selector .common-date-picker-input
And I wait until service ready
And I clear the Webcast description with css selector textarea.form-control
And I type webcast description 2 into description textarea with css selector textarea.form-control
And I wait small timeout
!-- And Webcast. Select free time
And I wait until service ready
And I click on button save with containsText selector Save
And I wait until service ready
And I click on Skip and continue with containsText selector Skip and continue
And I wait until service ready
Then I see Webcasts with css selector .social-title > h1:nth-child(1) contains: Webcasts

Scenario:
Delete webcast
Meta:
@name Delete webcast
Given I logged in with %{username} and %{password}
When I open WEBCASTS menu
And I wait until service ready
And I type %{webCastGeneratedName} into title of webcast with css selector #community__webcasts__search-input
And I wait small timeout
When I execute javascript scroll(1050, 700)
And I wait small timeout
And I click on button "Edit" with css selector .col-xs-offset-4 > span:nth-child(2) > button:nth-child(1)
And I wait until service ready
And I click on button "Delete" with css selector button.btn:nth-child(3)
And I wait small timeout
Then I see text with css selector div.ng-binding:nth-child(2) contains: Do you really want to delete this webcast?
And I wait small timeout
When I click on No with css selector button.ng-binding:nth-child(2)
And I wait small timeout
And I click on button "Delete" with css selector button.btn:nth-child(3)
Then I see text with css selector div.ng-binding:nth-child(2) contains: Do you really want to delete this webcast?
And I wait small timeout
When I click on Yes with css selector button.ng-binding:nth-child(1)
!-- Check that webcast deleted
And I wait until service ready
And I type %{webCastGeneratedName} into title of webcast with css selector #community__webcasts__search-input
And I wait small timeout
Then I see empty page with css selector .well > p:nth-child(1) > span:nth-child(1) is: No webcasts
