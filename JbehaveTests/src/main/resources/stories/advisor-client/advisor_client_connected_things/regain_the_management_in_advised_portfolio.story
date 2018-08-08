Story: Regain the management in advised portfolio


Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Adv_managed + UUID and put it to test param portfolioGenerated
And I generate Some text for private note + UUID and put it to test param someText
Given Set test param clientName with value Mike In.
Given Set test param advisorName with value James Adv.

Scenario: Create new portfolio to client
GivenStories:
    stories/advisor-client/advisor_client_connected_things/create_advisor_managed_portfolio_first_way.story#{name:as advisor create portfolio for client and make draft in Investment portfolio},
Given Do nothing

Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password

Scenario: Client transfers control to Advisor
Meta:
@name Client transfers control to Advisor
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
!-- Press on toggle in top plate (“Advisor will fully control my portfolio”)
When I click on toggle with css selector .cx-portfolio-topplate-toggle
And I click on button "Yes" with xpath selector //button[contains(., 'Yes')]
And I wait small timeout
Then I see element attribute on button with css selector .cx-portfolio-topplate-toggle has attribute class with value cx-portfolio-topplate-toggle
And I wait small timeout
Then I see plate "Managed by Advisor" with css selector .cx-portfolio-topplate-managed-by > div:nth-child(2) > span:nth-child(2) contains: Advisor will fully
And I wait small timeout
!-- When I click on menu "Settings" with css selector .social-menu__icon_setting
!-- And I wait until service ready
!-- !-- Press on checkbox (“Advisor will manage my portfolio”)
!-- When I click on checkbox with css selector .fa-check-square-o
!-- And I click on button "Save" with css selector button.btn-primary-sm:nth-child(2)
!-- And I wait until service ready
When I click on menu "Summary" with css selector .social-menu__icon_summary
And I wait until service ready
Then I see button "Request Advice" with css selector .portfolio_topplate__v_divider > div:nth-child(2) > div:nth-child(1) > button:nth-child(2) is: REQUEST ADVICE

