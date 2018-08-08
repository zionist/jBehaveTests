Story: Admin can edit advisor profile

Meta:

Narrative:
As a user admin
I want to create and edit user profile

Scenario:
Setup params. Set user to account admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
And Set test param password value from property param.accountadmin.password
!-- And I generate Full_name_ + UUID and put it to test param adviserUserGeneratedName
And I generate Modif-namel_ + UUID and put it to test param adviserUserGeneratedNameModified
And I generate Advisor-Full_ + UUID and put it to test param adviserUserGeneratedName
And I generate UUID + @portfoliodirect.com and put it to test param adviserUserGeneratedTestMail


Scenario: Create admin Account
Meta:
@name Create user as account admin
GivenStories:
    stories/login/admin_login.story#{name:Login to admin interface as account admin}
Given Do nothing
And I wait small timeout
!-- create a new advisor
When I click on Users top menu with css selector #admin__menu__user
And I click on manage user accounts with link selector Manage user accounts
And I wait small timeout
When I click on create user button with css selector a.btn
And I wait small timeout
When I type %{adviserUserGeneratedTestMail} into E-mail input field with css selector #email
And I wait small timeout
When I type %{adviserUserGeneratedName} into Public name input field with css selector #publicName
And I wait small timeout
And I type First name  into field with css selector #firstName
And I type Last name into field  with css selector #lastName
And I type Advisor into drop-down with css selector #level
And I wait small timeout
!-- And I type 30-59 into the drop-down Age with xpath selector .//*[@id='age']
And I type Qwerty12345 into Password with css selector #password
And I type Qwerty12345 into Retype Pass with css selector #passwordVerify
And I wait small timeout
And I execute javascript $(".btn").attr("disabled", false)
And I click on Save with css selector .btn
And I wait small timeout
Then I see toaster with xpath selector .//*[@id='toast-container']/div is: User account was successfully created!

When I wait small timeout
!-- edit advisor info
Scenario: Edit advisor Account
Meta:
@name Edit advisor Account
!-- need to add drop avatar
When I type %{adviserUserGeneratedName} into search field with css selector #publicName
And I wait small timeout
And I click on edit icon  with css selector .fa-edit
And I wait small timeout
!-- general info
And I type %{adviserUserGeneratedNameModified} into public name with css selector #publicName
And I type First name+1  into field with css selector #firstName
And I type Last name+1 into field  with css selector #lastName
!-- And I type 60+ into the drop-down Age with css selector #ageGroup
And I type company name into company field with css selector #company
And I click on Save-button with css selector button.btn:nth-child(1)
And I wait big timeout
!-- location info
And I click on location left side with css selector .col-sm-3 > ul:nth-child(2) > li:nth-child(2) > a:nth-child(1)
And I type Street info into srteet field with css selector #street
And I type city info into city with css selector #city
And I type CA, California into state with css selector #state
And I type 90210 into ZIP with css selector #zip
And I type 1-111-111-1111 into phone with css selector #phone
And I click on Save with css selector button.btn:nth-child(1)
And I wait big timeout
!-- advisor profile
And I click on Advisor left side with css selector .col-sm-3 > ul:nth-child(2) > li:nth-child(3) > a:nth-child(1)
!-- general advisor
Then I see header with css selector .col-md-10 > h1:nth-child(1) is: Advisor general information
When I type Instroduction into field with css selector #shortinfo
And I type https://www.test.com/  into other profile with css selector div.form-group:nth-child(3) > div:nth-child(2) > div:nth-child(1) > ng-form:nth-child(1) > input:nth-child(1)
And I type Languages into field with css selector #languages
And I click on Series 1 with css selector div.form-group:nth-child(9) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > input:nth-child(1)
And I click on Series 65 with css selector div.form-group:nth-child(9) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(6) > input:nth-child(1)
And I click on Certificate 1  with css selector div.form-group:nth-child(10) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > input:nth-child(1)
And I click on Certificate 2 with css selector div.form-group:nth-child(10) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(6) > input:nth-child(1)
And I click on Save button with css selector button.btn:nth-child(1)
And I wait big timeout
!-- company info
When I click on company info  with css selector .user-second-level-menu > li:nth-child(2) > a:nth-child(1)
Then I see header with css selector .col-md-10 > h1:nth-child(1) contains: Company information
When I type companyName into company field  with css selector #companyName
When I type companyAddress into company field with css selector #companyAddress
When I type 1-111-111-1111 into company phone with css selector #companyPhone
!-- When I type site@company.com into e-mail with css selector #companyEmail
When I type https://www.test.com/ into site with css selector #companyWebsite
When I type RIA into field with css selector #ria
When I type SEC into field with css selector #sec
And I click on Save button with css selector button.btn:nth-child(1)
And I wait big timeout
!-- Areas of expertise
When I click on areas of expertise with xpath selector .//*[@id='wrapper']/div/div/ui-view/div/div[1]/ul/li[3]/ul/li[3]/a
And I wait big timeout
Then I see header with css selector .col-md-10 > h1:nth-child(1) is: Areas of expertise
When I type Trader into job title with css selector #jobTitle
When I click on checkbox with css selector div.checkbox:nth-child(2) > input:nth-child(1)
And I type Buy info into buy field with css selector #buySide
And I wait small timeout
And I type Sell Info into Sell field with css selector #sellSide
And I wait small timeout
And I click on Save with css selector button.btn:nth-child(1)
And I wait big timeout

!-- Work History
And I click on work history  with css selector .user-second-level-menu > li:nth-child(4) > a:nth-child(1)
Then I see info with css selector .text-muted > i:nth-child(1) is: No work history
When I click on Add work history with css selector a.btn
And I type Firm name  into field with css selector #name
And I type 10 into Assets under manager with css selector #assetsUnderManagement
And I type 2 into averageAccountSize with css selector #averageAccountSize
And I type investmentStrategiesUtilized into field with css selector #investmentStrategiesUtilized
And I type 2000 into start year with css selector #startYear
And I type 2010 into end Year with css selector #endYear
And I click on Firm name with css selector #name
And I click on Save with css selector button.btn:nth-child(1)
And I wait big timeout

!-- education
When I click on education menu item with css selector .user-second-level-menu > li:nth-child(5) > a:nth-child(1)
And I wait small timeout
And I click on add education with css selector a.btn
And I wait small timeout
And I type university name into field with css selector #university
And I wait small timeout
And I type specialty into field with css selector #specialty
And I wait small timeout
And I type Master into field with css selector #degree
And I wait small timeout
And I type Graduate into field with css selector #educationType
And I wait small timeout
And I type 2010 into field with css selector #startYear
And I wait small timeout
And I type 2014 into end Year with css selector #endYear
And I wait small timeout
And I click on field with css selector #university
And I click on Save with css selector button.btn:nth-child(1)
And I wait big timeout
!-- security
And I click on security with css selector .col-sm-3 > ul:nth-child(2) > li:nth-child(4) > a:nth-child(1)
Then I see header with css selector .col-md-10 > h1:nth-child(1) is: Security information
!-- (should be written after bug fix)
!-- social networks
When I click on social networks with css selector .col-sm-3 > ul:nth-child(2) > li:nth-child(5) > a:nth-child(1)
!-- proficiency level
When I click on proficiency level with css selector .col-sm-3 > ul:nth-child(2) > li:nth-child(6) > a:nth-child(1)
Then I see header with css selector .col-md-10 > h1:nth-child(1) is: Proficiency Level
And I see info with css selector p.ng-binding is: User's current proficiency level is Advisor
And I see info with css selector div.form-group:nth-child(2) > p:nth-child(1) is: Advisors may not change their level
And I wait big timeout
!-- Privileges
When I click on privileges/toles with css selector .col-sm-3 > ul:nth-child(2) > li:nth-child(7) > a:nth-child(1)
Then I see header with css selector .col-md-10 > h1:nth-child(1) is: User Privileges
When I click on checkbox system admin  with css selector #isContentAdmin
And I wait small timeout
And I click on Save with css selector button.btn:nth-child(1)
Then I see toaster with xpath selector .//*[@id='toast-container']/div is: User privileges were successfully updated!
And I wait big timeout
!-- community settings
When I click on comm settings with css selector div.col-sm-3:nth-child(1) > ul:nth-child(2) > li:nth-child(8) > a:nth-child(1)
Then I see header with css selector .col-md-10 > h1:nth-child(1) is: Community Settings
And I wait big timeout
!-- unmark checkboxes
!-- When I click on profileVisible with css selector #profileVisible
When I click on notifyWhenFollowsMe with css selector #notifyWhenFollowsMe
When I click on display webacst with css selector #displayBroadcastChargeWarning
When I click on canBeInvitedToClub with css selector #canBeInvitedToClub
When I click on canBeInvitedToClub with css selector #canBeInvitedToWebcast
When I click on canBeInvitedToSharePortfolio with css selector #canBeInvitedToSharePortfolio
When I click on displayMyTweets with css selector #displayMyTweets
When I click on notifyMeOfNewQuestions with css selector #willAswerQuestions
!-- mark checkboxes
!-- When I click on profileVisible with css selector #profileVisible
When I click on notifyWhenFollowsMe with css selector #notifyWhenFollowsMe
When I click on display webacst with css selector #displayBroadcastChargeWarning
When I click on canBeInvitedToClub with css selector #canBeInvitedToClub
When I click on canBeInvitedToClub with css selector #canBeInvitedToWebcast
When I click on canBeInvitedToSharePortfolio with css selector #canBeInvitedToSharePortfolio
When I click on displayMyTweets with css selector #displayMyTweets
When I click on notifyMeOfNewQuestions with css selector #willAswerQuestions
And I wait small timeout
When I click on Save with css selector button.btn:nth-child(1)
And I wait big timeout
!-- Notification
When I click on Notifications  with css selector .col-sm-3 > ul:nth-child(2) > li:nth-child(9) > a:nth-child(1)
Then I see header with css selector .col-md-10 > h1:nth-child(1) is: Notifications
When I type Daily into field with css selector #emailSchedule
And I wait small timeout
When I click on Save with css selector button.btn:nth-child(1)
And I wait big timeout





