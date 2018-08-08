Story: Production - Check that all pages "Profile"

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
Given Set test param level with value Advisor

Scenario:
Check all pages "Profile"
Meta:
@name Search items
Given I generate company_ + UUID and put it to test param companyName
And I generate street_ + UUID and put it to test param streetName
And I generate city_ + UUID and put it to test param cityName
And I logged in with %{username} and %{password}
!-- Personal Profile
When I click on Avatar with css selector .cx-page-header__first-level__username
And I click on profile with css selector a.dropdown-item:nth-child(1)
And I wait until service ready
Then I see page header with css selector .h1 is: General Information
!-- Edit company name on general information
When I click on edit icon with css selector .cx-btn-profile-edit
And I clear the company input with css selector #companyName
And I type %{companyName} into company name input with css selector #companyName
And I click on save button with css selector button.btn:nth-child(3)
Then I see Toaster item with css selector .toast-message is: Profile information was successfully updated!
And I see company name with css selector div.form-group:nth-child(4) > div:nth-child(2) is %{companyName}
!-- Location page
When I click on page "Location" with css selector li.nav-item:nth-child(3) > a:nth-child(1)
When I click on edit icon with css selector .cx-btn-profile-edit
And I clear the zip input with css selector #zip
And I type 94777 into zip input with css selector #zip
!-- And I choose AL, Alabama from Select element with css selector #state
And I clear the street input with css selector #street
And I type %{streetName} into street input with css selector #street
And I clear the city unput with css selector #city
And I type %{cityName} into city input with css selector #city
And I clear the phone input with css selector #phone
And I type 111-111-1111 into phone input with css selector #phone
And I click on save button with css selector button.btn:nth-child(3)
!-- And I click on Ok button in dialog window with css selector button.ng-binding
Then I see zip code with css selector .profile-page-content > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) is: 94777
And I see street with css selector .profile-page-content > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) is: %{streetName}
And I see city with css selector  .profile-page-content > div:nth-child(2) > div:nth-child(2) > div:nth-child(3) > div:nth-child(2) is: %{cityName}
!-- And I see state with css selector .profile-page-content > div:nth-child(2) > div:nth-child(2) > div:nth-child(4) > div:nth-child(2) is: AL
And I see phone with css selector .profile-page-content > div:nth-child(2) > div:nth-child(2) > div:nth-child(5) > div:nth-child(2) is: (111)-111-1111
!-- Profile information was successfully updated
Then I see page header with css selector .h1 contains: Location Information
When I click on page "Security" with css selector li.nav-item:nth-child(4) > a:nth-child(1)
Then I see page header with css selector .h1 is: Security Information
When I click on page "Social Network Profiles" with css selector li.nav-item:nth-child(5) > a:nth-child(1)
Then I see page header with css selector .h1 is: Social Network Profiles
!-- Membership
When I click on page "Membership" with css selector li.nav-item:nth-child(6) > a:nth-child(1)
Then I see page header with css selector .h1 is: Memberships
!-- Check level
Then I see level with css selector .cx-profile-membership contains: %{level}
!-- Community
When I click on page "Community Settings" with css selector li.nav-item:nth-child(7) > a:nth-child(1)
And I wait small timeout
Then I see page header with css selector .h1 is: Community Settings
When I will execute javascript $("#displayMyTweets").click()
And I will execute javascript $("#willAswerQuestions").click()
And I click on Save with xpath selector //button[text()='Save']
Then I see Toaster item with css selector .toast-message is: Profile information was successfully updated!
!-- return settings
When I wait big timeout
And I will execute javascript $("#displayMyTweets").click()
And I will execute javascript $("#willAswerQuestions").click()
And I click on Save with xpath selector //button[text()='Save']
Then I see Toaster item with css selector .toast-message is: Profile information was successfully updated!
!-- Email options
When I click on page "Email options" with css selector li.nav-item:nth-child(8) > a:nth-child(1)
Then I see page header with css selector .h1 is: Email options
!-- change the frequency
When I select Weekly ByVisibleText from Select element with css selector .form-control
And I click on header with css selector .h1
And I wait until service ready
And I click on Save with xpath selector //button[text()='Save']
Then I see Toaster item with css selector .toast-message is: Succesfully updated!
!-- Subscriptions
When I click on page "Subscriptions" with css selector li.nav-item:nth-child(9) > a:nth-child(1)
Then I see page header with css selector .h1 is: Subscriptions
!-- Payment Profile
!-- Buyer Settings
When I click on page "Payment Profile" with css selector li.nav-item:nth-child(10) > a:nth-child(1)
And I click on page "Buyer Settings" with css selector .cx-profile-sub-menu > li:nth-child(1)
Then I see page header with css selector .h1 is: Buyer Settings
And I wait small timeout
!-- Seller Settings
When I click on page "Seller Settings" with css selector .cx-profile-sub-menu > li:nth-child(2)
Then I see page header with css selector .h1 is: Seller Settings
!-- Transactions
When I wait big timeout
And I click on Avatar with css selector #userProfileDropdownMenu
And I click on page "Transactions" with css selector a.dropdown-item:nth-child(2)
And I wait until service ready
Then I see page header with css selector .h1 contains: Payments
!-- Events
When I click on Avatar with css selector .cx-page-header__first-level__user-level
And I click on page "Events" with css selector a.dropdown-item:nth-child(3)
And I wait until service ready
Then I see page header with css selector div.col-sm-12:nth-child(1) > h1:nth-child(1) is: Audit Trail
