Story: Check Why Tickeron? page

Scenario:
Why Tickeron? page
Meta:
@name Why Tickeron? page
Given Browser ready
!-- And I wait small timeout
When I click on Why Tickeron link with css selector .header-menu > li:nth-child(3) > a:nth-child(1)
And I wait small timeout
Then I see header with css selector .page-header-name contains: Why Tickeron?
When I click on arrow label with css selector .page-header-banner
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: Asset allocation ideas
!-- add check: click on all module icons on page