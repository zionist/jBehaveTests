Story: Create T&C with PDF

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate _Title + UUID and put it to test param titleGenerated
And I generate Some text + UUID and put it to test param textGenerated


Scenario:
Create T&C with PDF
Meta:
@name Create T&C with PDF
GivenStories:
!-- Given I connect stripe as seller for %{username} with %{password}
Given I logged in with %{username} and %{password}
When I open CLIENTS menu
And I wait until service ready
And I open Manage Terms & Conditions menu
And I wait until service ready
Then I see Page header with css selector .col-xs-9 > h1:nth-child(1) is Terms and Conditions
!-- Click on create new
When I click on "Create new" button with containsText selector Create new
And I wait until service ready
Then I see Page header with css selector .ac-title > div:nth-child(1) > div:nth-child(1) > h1:nth-child(2) is Create Terms and Conditions
When I type %{titleGenerated} into title field with css selector input.form-control
And I wait small timeout
And I click on radiobutton "PDF document" with css selector label.cx-radio:nth-child(2)
And I wait small timeout
!-- And I upload file sample.pdf using input element with xpath selector //input[@type='file']
And Mall. I upload file sample.pdf using input element with css selector input[type='file']
And I wait big timeout
When I execute javascript scroll(1050, 700)
And I wait small timeout
And I click on "Save" button with containsText selector Save
And I wait until service ready
Then I see Page header with css selector .col-xs-9 > h1:nth-child(1) is Terms and Conditions
And I see html code of list of terms and conditions with css selector .table > tbody:nth-child(1) contains %{titleGenerated}

