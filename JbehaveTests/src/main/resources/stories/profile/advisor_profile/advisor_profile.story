Story: Check advisor Personal Profile menus

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario:
Check and edit Professional information
Meta:
@name Check and edit Professional information
Given I logged in with %{username} and %{password}
!-- Open Advisor Profile page
When I open Personal Profile menu
And I click on advisor profile with css selector .cx-cursor-pointer
And I click on Professional with xpath selector //li[@href='#!/editProfile/advisor-profile']
And I wait until service ready
Then I see header with css selector .h1 is Professional Information
!-- Edit info
When I click on edit icon with css selector .cx-btn-profile-edit
And I wait small timeout
And I clear the Introduction with css selector #shortInfo
And I clear the Languages with css selector #languages
And I type Intro into field with css selector #shortInfo
And I type Many Languges into field with css selector #languages
And I click on Insurance lic with xpath selector //span[text()='Insurance License']
And I click on certificate with xpath selector //span[text()='Associate, Society of Actuaries']
And I click on Save button with containsText selector Save
Then I see toaster with css selector .toast-message contains: Information updated!


Scenario:
Check and edit Company
Meta:
@name Check and edit Company
Given I logged in with %{username} and %{password}
!-- Open Advisor Profile page
When I open Personal Profile menu
And I click on advisor profile with css selector .cx-cursor-pointer
And I click on Company with xpath selector //li[@href='#!/editProfile/advisor-company']
And I wait until service ready
Then I see header with css selector .h1 is Company Information
!-- edit
When I click on edit icon with css selector .cx-btn-profile-edit
And I wait small timeout
And I clear the Name with css selector #companyName
And I clear the Address with css selector #companyAddress
And I clear the Website with css selector #companyWebsite
And I clear the RIA with css selector #ria
And I clear the SEC with css selector #sec
And I clear the phone with css selector #companyPhone
!-- enter data
And I type NewCompanyName into field with css selector #companyName
And I type NewCompanyAdress into field with css selector #companyAddress
And I type http://web.com into field with css selector #companyWebsite
And I type NewRIA into field with css selector #ria
And I type NewSEC into field with css selector #sec
And I type 1-234-555-5555 into field with css selector #companyPhone
And I click on Save button with containsText selector Save
Then I see toaster with css selector .toast-message contains: Information updated!


Scenario:
Check and edit Professional Responsibilities
Meta:
@name Check and edit Professional Responsibilities
Given I logged in with %{username} and %{password}
!-- Open Advisor Profile page
When I open Personal Profile menu
And I click on advisor profile with css selector .cx-cursor-pointer
And I click on Company with xpath selector //li[@href='#!/editProfile/advisor-expertise']
And I wait until service ready
Then I see header with css selector .h1 is Job Qualifications
!-- edit
When I click on edit icon with css selector .cx-btn-profile-edit
And I wait small timeout
And I type Au into Job Title with css selector select.form-control
And I execute javascript $("select.form-control").change()
And I click on Derivatives with xpath selector //span[text()='Derivatives']
And I clear the Buy side with xpath selector //textarea[@name='buySide']
And I clear the Sell side with xpath selector //textarea[@name='sellSide']
And I type NewBuy into field with xpath selector //textarea[@name='buySide']
And I type NewSell into field with xpath selector //textarea[@name='sellSide']
And I click on Save button with containsText selector Save
Then I see toaster with css selector .toast-message contains: Information updated!


Scenario:
Check and edit Work history
Meta:
@name Check and edit Work history
Given I logged in with %{username} and %{password}
!-- Open Advisor Profile page
When I open Personal Profile menu
And I click on advisor profile with css selector .cx-cursor-pointer
And I click on Work history with xpath selector //li[@href='#!/editProfile/advisor-work']
And I wait until service ready
Then I see header with css selector .h1 is Work History
!-- edit
When I click on Add work with containsText selector Add Work History
And I wait small timeout
Then I see pop-up window header with xpath selector //h4[text()='Work History Info'] contains: Work History Info
When I type NewFirm into field with css selector #name
And I type 2000 into field with css selector #assetsUnderManagement
And I type 5000 into field with css selector #averageAccountSize
And I type 3 into field with css selector input.ng-pristine
And I select 2012 ByVisibleText from Select element with css selector #startYear
And I select 2014 ByVisibleText from Select element with css selector #endYear
And I click on Save button with containsText selector Save
And I wait until service ready
Then I see toaster with css selector .toast-message contains: Work history was successfully added!


Scenario:
Check and edit Education
Meta:
@name Check and edit Education
Given I logged in with %{username} and %{password}
!-- Open Advisor Profile page
When I open Personal Profile menu
And I click on advisor profile with css selector .cx-cursor-pointer
When I click on Education with xpath selector //li[@href='#!/editProfile/advisor-education']
And I wait until service ready
Then I see header with css selector .h1 is Education
!-- edit
When I click on Add Education with containsText selector Add Education
And I wait small timeout
Then I see pop-up window header with xpath selector //h4[text()='Education Info'] contains: Education Info
When I type MyUniversity into field with xpath selector //input[@ng-model='education.University']
And I type MySpeciality into field with xpath selector //input[@ng-model='education.Specialty']
And I select Master ByVisibleText from Select element with xpath selector //select[@ng-model='education.Degree.Id']
And I select Graduate ByVisibleText from Select element with xpath selector //select[@ng-model='education.Type.Id']
And I select 2005 ByVisibleText from Select element with xpath selector //select[@ng-model='education.StartYear']
And I select 2007 ByVisibleText from Select element with xpath selector //select[@ng-model='education.EndYear']
And I click on Save button with containsText selector Save
And I wait until service ready
Then I see toaster with css selector .toast-message contains: Education was successfully added!