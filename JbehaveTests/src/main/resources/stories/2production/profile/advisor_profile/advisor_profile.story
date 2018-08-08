Story: Production - Check advisor profile

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Check advisor profile
Meta:
@name Check advisor profile
Given I logged in during maintenance with %{username} and %{password}
!-- Open Advisor Profile page
When I click on Avatar with css selector .cx-page-header__first-level__username
And I click on profile with css selector a.dropdown-item:nth-child(1)
And I wait until service ready
And I click on advisor profile with css selector .cx-cursor-pointer
And I wait small timeout
And I click on Professional Information with css selector .cx-profile-sub-menu > li:nth-child(1)
And I wait until service ready
Then I see header with css selector .h1 is Professional Information
!-- Check fields on General page
Then I see Introduction field with css selector div.form-group:nth-child(1) > label:nth-child(1) is Introduction
Then I see Languages field with css selector div.form-group:nth-child(2) > label:nth-child(1) is Languages
Then I see LinkedIn Profile field with css selector div.form-group:nth-child(3) > label:nth-child(1) is LinkedIn Profile
Then I see Other Profiles field with css selector div.form-group:nth-child(4) > label:nth-child(1) is Other Profiles
Then I see Licenses field with css selector div.form-group:nth-child(5) > label:nth-child(1) is Licenses
Then I see Certificates field with css selector div.form-group:nth-child(6) > label:nth-child(1) is Certificates
!-- Check fields on Company information
When I click on Company menu item with css selector .cx-profile-sub-menu > li:nth-child(2)
And I wait until service ready
Then I see header with css selector .h1 is Company Information
Then I see Company Name field with css selector div.form-group:nth-child(1) > label:nth-child(1) is Name
Then I see Company Address field with css selector div.form-group:nth-child(2) > label:nth-child(1) is Address
Then I see Company Website field with css selector div.form-group:nth-child(3) > label:nth-child(1) is Website
Then I see RIA field with css selector div.form-group:nth-child(4) > label:nth-child(1) is RIA
Then I see SEC field with css selector div.form-group:nth-child(5) > label:nth-child(1) is SEC
Then I see Company Phone field with css selector div.form-group:nth-child(6) > label:nth-child(1) is Phone
!-- Check fields on Professional Responsibilities
When I click on Job Qualifications item with css selector .cx-profile-sub-menu > li:nth-child(3)
And I wait until service ready
Then I see header with css selector .h1 is Job Qualifications
Then I see Job Title field with css selector div.form-group:nth-child(1) > label:nth-child(1) is Job Title
Then I see Investment Types field with css selector div.form-group:nth-child(2) > label:nth-child(1) is Investment Types
Then I see Buy Side field with css selector div.form-group:nth-child(3) > label:nth-child(1) is Buy Side
Then I see Sell Side field with css selector div.form-group:nth-child(4) > label:nth-child(1) is Sell Side
!-- Check fields on Work History
When I click on Work History item with css selector .cx-profile-sub-menu > li:nth-child(4)
And I wait until service ready
Then I see header with css selector .h1 is Work History
!-- Check fields on Education
When I click on Education item with css selector .cx-profile-sub-menu > li:nth-child(5)
And I wait until service ready
Then I see header with css selector .h1 is Education

