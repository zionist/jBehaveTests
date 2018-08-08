Story: Check expert Personal Profile menus

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario:
Check and edit Professional information
Meta:
@name Check and edit Professional information
Given I logged in with %{username} and %{password}
!-- Open Advisor Profile page
When I open Personal Profile menu
And I click on expert profile with xpath selector //a[@href='#!/editProfile/expert-profile']
And I wait until service ready
Then I see header with css selector .h1 is Expert Public Profile
!-- edit
When I click on edit icon with css selector .cx-btn-profile-edit
And I wait small timeout
And I clear the Introduction with css selector #introduction
And I type Intro into field with css selector #introduction
!-- Other profile
And I type http://web.com into field with css selector .edit-expert-profile__link > ng-form:nth-child(1) > input:nth-child(1)
And I wait small timeout
And I execute javascript $(".cx-add-social-profile-btn").click()
And I clear the Company name with css selector #companyName
And I type MyCompany into field with css selector #companyName
!-- And I clear the Company site with css selector #companyWebsite
!-- And I type http://web.com into field with css selector #companyWebsite
And I clear the Certificates name with css selector #certifications
And I type MyCertificate into field with css selector #certifications
!-- Articles
!-- And I type MyArticle into field with css selector div.row:nth-child(7) > div:nth-child(2) > input:nth-child(1)
!-- And I type http://tickeron.com into field with css selector div.col-xs-offset-2:nth-child(3) > ng-form:nth-child(1) > input:nth-child(1)
And I click on Save button with containsText selector Save
Then I see toaster with css selector .toast-message contains: Saved!
!-- Check
Then I see element attribute other profile with css selector div.form-group:nth-child(3) > div:nth-child(2) > a:nth-child(1) has attribute href with value http://w
!-- Then I see article title with xpath selector //a[text()='MyArticle'] contains: MyArticle
!-- Then I see element attribute article title with css selector div.profile-group__text:nth-child(1) > a:nth-child(1) has attribute href with value http://tickeron.com

