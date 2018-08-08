Story: Production - Check page "Expert Profile"

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario:
Check all pages "Profile"
Given I logged in during maintenance with %{username} and %{password}
!-- Personal Profile
When I click on Avatar with css selector .cx-page-header__first-level__username
And I click on profile with css selector a.dropdown-item:nth-child(1)
And I wait until service ready
And I click on Expert Profile with css selector li.nav-item:nth-child(2) > a:nth-child(1)
And I wait until service ready
!-- And I click on the link "Edit" with css selector .social-title__link
Then I see page header with css selector .h1 is: Expert Public Profile
Given Do nothing