Story: Production Check GET DIVSCORE page

Scenario:
GET DIVSCORE page
Meta:
@name GET DIVSCORE page
Given Browser ready
And I wait small timeout
When I click on Get DivScore link with css selector .header-menu > li:nth-child(2) > a:nth-child(1)
And I wait small timeout
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Calculate your
And I wait small timeout
When I click on logo with css selector .top-menu-logo
And I wait big timeout