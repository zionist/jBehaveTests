Story: Production - Check that all pages "Profile"

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
Given Set test param FirstName with value NewFirst
Given Set test param LastName with value NewLast
Given Set test param Company with value NewCompanyTitle

Scenario:
Check all pages "Profile"
Meta:
@name Search items
Given I logged in during maintenance with %{username} and %{password}
!-- Personal Profile
When I click on Avatar with css selector .cx-page-header__first-level__username
And I click on profile with css selector a.dropdown-item:nth-child(1)
And I wait until service ready
Then I see page header with css selector .h1 is: General Information
When I click on page "Location" with css selector li.nav-item:nth-child(3) > a:nth-child(1)
Then I see page header with css selector .h1 contains: Location Information
When I click on page "Security" with css selector li.nav-item:nth-child(4) > a:nth-child(1)
Then I see page header with css selector .h1 is: Security Information
When I click on page "Social Network Profiles" with css selector li.nav-item:nth-child(5) > a:nth-child(1)
Then I see page header with css selector .h1 is: Social Network Profiles
When I click on page "Membership" with css selector li.nav-item:nth-child(6) > a:nth-child(1)
Then I see page header with css selector .h1 is: Membership
When I click on page "Community Settings" with css selector li.nav-item:nth-child(7) > a:nth-child(1)
Then I see page header with css selector .h1 is: Community Settings
When I click on page "Notifications" with css selector li.nav-item:nth-child(8) > a:nth-child(1)
Then I see page header with css selector .h1 is: Notifications
When I click on page "Community Settings" with css selector li.nav-item:nth-child(9) > a:nth-child(1)
Then I see page header with css selector .h1 is: Subscriptions
When I click on page "Notifications" with css selector li.nav-item:nth-child(10) > a:nth-child(1)
And I click on Buyer Settings with css selector .cx-profile-sub-menu > li:nth-child(1)
Then I see page header with css selector .h1 is: Buyer Settings
When I click on Seller Settings with css selector .cx-profile-sub-menu > li:nth-child(2)
Then I see page header with css selector .h1 is: Seller Settings
!-- Transactions
When I click on Avatar with css selector .cx-page-header__first-level__username
And I click on page "Transactions" with css selector a.dropdown-item:nth-child(2)
And I wait until service ready
Then I see page header with css selector .h1 contains: Transactions
!-- Events
When I click on Avatar with css selector .cx-page-header__first-level__username
And I click on page "Events" with css selector a.dropdown-item:nth-child(3)
And I wait until service ready
Then I see page header with css selector div.col-sm-12:nth-child(1) > h1:nth-child(1) is: Audit Trail
