Story: Production Check Membership page

Scenario:
Membership page
Meta:
@name Membership page
Given Browser ready
And I wait small timeout
When I click on Membership page with css selector .header-menu > li:nth-child(4) > a:nth-child(1)
And I wait small timeout
Then I see header with css selector .page-header-name contains: Membership
!-- Click on SELECT PLAN button for beginner
And I wait small timeout
When I will refresh the page
And I wait until service ready
When I click on Choose plan with css selector li.page-pricing-card:nth-child(1) > a:nth-child(4)
And I wait small timeout
Then I see sign up pop-up window and close it
!-- Then I see sign up pop-up window and header with css selector .cx-marketing-modal__title contains: Get Started Absolutely
!-- And I wait small timeout
!-- When I click on close crist with css selector .close
!-- And I wait small timeout
!-- Click on SELECT PLAN button for Intermediate
And I wait small timeout
When I click on SELECT PLAN button with css selector a.page-pricing-card-button:nth-child(5)
And I wait small timeout
Then I see sign up pop-up window and close it
And I wait small timeout
!-- Click on SELECT PLAN button for expert
And I wait small timeout
When I click on SELECT PLAN button with css selector li.page-pricing-card:nth-child(3) > a:nth-child(4)
And I wait small timeout
!-- Then I see email catch pop-up window and close it
Then I see sign up pop-up window and close it
And I wait small timeout
!-- Click on SELECT PLAN button for advisor
And I wait small timeout
When I click on SELECT PLAN button with css selector li.page-pricing-card:nth-child(4) > a:nth-child(5)
And I wait small timeout
Then I see email catch pop-up window and close it
!-- Then I see sign up pop-up window and close it
And I wait small timeout
When I click on orange lable with css selector .page-header-banner
And I wait big timeout
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Generate
