Story: Admin can edit expert profile

Narrative:
As a user admin
I want to create and edit expert profile

Scenario:
Setup params. Set user to account admin
Given Set test param username value from property param.accountadmin.username
And Set test param password value from property param.accountadmin.password
And I generate Full_name_ + UUID and put it to test param expertGeneratedName1
And I generate Modif_namel_ + UUID and put it to test param expertGeneratedName2
And I generate UUID + @catch01.tickerontest.com and put it to test param expertGeneratedEmail


Scenario: Create expert user as account admin
Meta:
@name Create beginner user as account admin
GivenStories:
    stories/login/admin_login.story#{name:Login to admin interface as account admin}
Given Do nothing
And I wait small timeout
!-- Create a new Expert
When I click on Users top menu with css selector #admin__menu__user
And I click on manage user accounts with link selector Manage user accounts
And I wait small timeout
When I click on create user button with css selector a.btn
And I wait small timeout
When I type %{expertGeneratedEmail} into E-mail input field with css selector #email
!-- When I type %{expertGeneratedName1} into Public name input field with css selector #publicName
And I type First name  into field with css selector #firstName
And I type Last name into field  with css selector #lastName
!-- And I type Expert into drop-down with css selector #level
And I wait small timeout
And I type Qwerty12345 into Password with css selector #password
And I type Qwerty12345 into Retype Pass with css selector #passwordVerify
And I wait small timeout
And I click on Save with css selector .btn
And I execute javascript $(".btn").attr("disabled", false)
And I wait small timeout
Then I see toaster with xpath selector .//*[@id='toast-container']/div is: User account was successfully created!
When I wait small timeout
!--/*
Scenario: Edit expert user as account admin
Meta:
@name Edit expert user as account admin
!-- edit expert info
!-- need to add drop avatar
When I type %{expertGeneratedName1} into search field with css selector #publicName
And I wait small timeout
And I click on edit icon with css selector .fa-edit
And I wait small timeout
Then I see header with css selector .col-md-10 > h1:nth-child(1) is: General information
!-- general info
When I clear the Public name with css selector #publicName
!-- And I type %{expertGeneratedName2} into public name with css selector #publicName
And I clear the First name with css selector #firstName
And I type First name+1  into field with css selector #firstName
And I clear the Last name with css selector #lastName
And I type Last name+1 into field  with css selector #lastName
!-- And I type 60+ into the drop-down Age with css selector #ageGroup
And I type Company name into company field with css selector #company
And I click on Save-button with css selector button.btn:nth-child(1)
Then I see Toaster item with css selector .toast-message is: User account updated
!-- expert profile
When I click on Expert left side with css selector .nav-pills > li:nth-child(3) > a:nth-child(1)
Then I see header with css selector .expert-profile__header is: Expert Public Profile
When I type Introduction into field with css selector #introduction
And I type https://www.test.com/ into other profile with xpath selector .//*[@id='wrapper']/div/div/ui-view/div/div[2]/div/div/form/div[3]/div/div[1]/input
And I clear the Company name with css selector #companyName
And I type MyCompany into field with css selector #companyName
And I type https://www.test.com/ into field with css selector #companyWebsite
And I type Many Certificates into field with css selector #certifications
And I type First Article into field with css selector div.form-group:nth-child(11) > div:nth-child(2) > div:nth-child(1) > input:nth-child(1)
And I type https://www.test.com/ into field with css selector div.form-group:nth-child(12) > div:nth-child(1) > div:nth-child(1) > input:nth-child(1)
And I click on Save button with css selector button.btn:nth-child(1)
And I wait small timeout
Then I see Toaster item with css selector .toast-message is: Expert profile updated



!--*/
