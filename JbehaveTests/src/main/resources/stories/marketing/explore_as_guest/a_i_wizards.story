Story: Check functionality of A.I. Wizards page

Scenario:
A.I. Wizards
Meta:
@name A.I. Wizards
Given Browser ready
And I wait small timeout
When I open EXPLORE AS GUEST menu
And I wait small timeout
Then I see header with xpath selector //span[text()='ARTIFICIAL INTELLIGENCE'] contains: ARTIFICIAL INTELLIGENCE
!-- Open A.I. Wizards page
When I execute javascript $("a[href='/app/guest#!/a_i_wizard']")[0].click()
!-- When I click on A.I. Wizards tab with xpath selector //a[@href='/app/guest#!/a_i_wizard']
And I wait small timeout
Then I see header with xpath selector //div[text()='A.I. Wizards'] contains: A.I. Wizards
!-- Click on Calculate my DivScore
When I click on Calculate my DivScore with xpath selector //span[contains(., 'To calculate my Diversification Score')]
And I wait small timeout
Then I see sign up pop-up window and close it
And I wait small timeout
!-- Investment ideas
When I click on Investment Ideas with xpath selector //span[contains(., 'Investment ideas')]
And I wait small timeout
Then I see sign up pop-up window and close it
And I wait small timeout
!-- Allocation Ideas
When I click on Allocation Ideas with xpath selector //span[contains(., 'Allocation ideas')]
And I wait small timeout
Then I see sign up pop-up window and close it
And I wait small timeout