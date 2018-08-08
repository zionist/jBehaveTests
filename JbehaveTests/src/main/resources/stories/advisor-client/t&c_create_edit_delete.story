Story: create, edit, delete T&C

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate __Title + UUID and put it to test param titleGenerated
And I generate __Title_Edit + UUID and put it to test param titleGeneratedEdit


Scenario:
T&C: check chevrons back cancel
Meta:
@name T&C: check chevrons back cancel
Given I logged in with %{username} and %{password}
!-- Open Advisor/Client menu
When I open CLIENTS menu
And I open Manage Terms & Conditions menu
!-- And I click on Terms And Conditions menu with containsText selector Manage Terms & Conditions
And I wait until service ready
Then I see Page header with css selector .col-xs-9 > h1:nth-child(1) is Terms and Conditions
!-- Checking chevrons
!-- Back
When I click on "Create new" button with containsText selector Create new
And I wait until service ready
Then I see Page header with css selector .ac-title > div:nth-child(1) > div:nth-child(1) > h1:nth-child(2) is Create Terms and Conditions
When I click on chevron "Back" with containsText selector Back
And I wait until service ready
Then I see Page header with css selector .col-xs-9 > h1:nth-child(1) is Terms and Conditions
!-- Cancel
When I click on "Create new" button with containsText selector Create new
And I wait until service ready
Then I see Page header with css selector .ac-title > div:nth-child(1) > div:nth-child(1) > h1:nth-child(2) is Create Terms and Conditions
When I click on button "Cancel" with css selector .btn-transparent
And I wait until service ready
Then I see Page header with css selector .col-xs-9 > h1:nth-child(1) is Terms and Conditions

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate __Title + UUID and put it to test param titleGenerated
And I generate __Title_Edit + UUID and put it to test param titleGeneratedEdit


Scenario:
TandC create
Meta:
@name TandC create
Given I logged in with %{username} and %{password}
!-- Open Advisor/Client menu
When I open CLIENTS menu
And I open Manage Terms & Conditions menu
!-- And I click on Terms And Conditions menu with containsText selector Manage Terms & Conditions
And I wait until service ready
Then I see Page header with css selector .col-xs-9 > h1:nth-child(1) is Terms and Conditions
!-- Create
When I click on "Create new" button with containsText selector Create new
And I wait until service ready
And I type %{titleGenerated} into title field with css selector input.form-control
And I wait small timeout
When I type Contract Text... into input field with css selector #text
And I wait small timeout
And I click on "Save" button with containsText selector Save
Then I see toastr with css selector .toast-message is: Terms and Conditions successfully created
When I wait until service ready

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password



Scenario:
T&C edit
Meta:
@name T&C: edit
Given I logged in with %{username} and %{password}
!-- Open Advisor/Client menu
When I open CLIENTS menu
!-- And I click on Terms And Conditions menu with containsText selector Manage Terms & Conditions
And I open Manage Terms & Conditions menu
And I wait until service ready
Then I see Page header with css selector .col-xs-9 > h1:nth-child(1) is Terms and Conditions
!-- Edit
When I wait big timeout
And I click on title  with link selector %{titleGenerated}
And I wait until service ready
And I click on "Edit" button with containsText selector Edit
Then I see Page Header with css selector .ac-title > div:nth-child(1) > div:nth-child(1) > h1:nth-child(2) contains: Edit Terms and Conditions
And I wait small timeout
When I click on title field with css selector input.form-control
And I wait small timeout
When I clear the title with css selector input.form-control
And I wait small timeout
And I type %{titleGeneratedEdit} into title field with css selector input.form-control
And I wait small timeout
And I type Edit Text into input field with css selector #text
And I wait small timeout
And I click on "Save" button with containsText selector Save
Then I see toastr with css selector .toast-message is: Terms and Conditions successfully updated
When I wait until service ready

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario:
T&C delete
Meta:
@name T&C delete
Given I logged in with %{username} and %{password}
!-- Open Advisor/Client menu
When I open CLIENTS menu
And I open Manage Terms & Conditions menu
!-- And I click on Terms And Conditions menu with containsText selector Manage Terms & Conditions
And I wait until service ready
Then I see Page header with css selector .col-xs-9 > h1:nth-child(1) is Terms and Conditions
!-- Delete
When I wait big timeout
And I click on title  with link selector %{titleGeneratedEdit}
And I wait until service ready
And I click on "Remove" button with containsText selector Remove
Then I see Warning modal with css selector h4.modal-title:nth-child(1) contains: Warning
When I click on "Yes" button with containsText selector Yes
Then I see Page header with css selector .col-xs-9 > h1:nth-child(1) is Terms and Conditions
