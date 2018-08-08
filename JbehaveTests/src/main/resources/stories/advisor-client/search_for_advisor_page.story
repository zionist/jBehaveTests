Story: Check the Search for advisor page

Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password
Given Set test param advisorName with value Advisor AT
Given Set test param advisor2Name with value James Adv.

Scenario:
Check the Search for advisor page
Meta:
@name Check the Search for advisor page
Given I logged in with %{username} and %{password}
When I open ADVISORS menu
And I wait until service ready
And I type %{advisorName} into search field with css selector input.form-control
And I wait small timeout
Then I see Zip code with css selector tr.ng-scope > td:nth-child(4) > span:nth-child(1) is 12312
And I wait small timeout
When I execute javascript scroll(1050, 700)
And I wait small timeout
When I click on Advisor with containsText selector %{advisorName}
And I wait until service ready
And I click on ACWA page with css selector .cx-content-menu__icon__member
And I wait until service ready
Then I see ZIP code with xpath selector //table[@class='table table-ac']//td[@ng-bind='::mdl.adv.StateZip'] contains: 12312
And I wait small timeout
When I click on follow  with css selector #community__members__follow-button
And I wait until service ready
When I execute javascript $("input[id*='community__members__published-in-blog-entry-checkbox']").click()
And I wait big timeout
When I open ADVISORS menu
When I execute javascript scroll(1050, 700)
And I wait small timeout
And I click on checkbox only those I follow with xpath selector //label[@class='cx-checkbox'][contains(., 'Only those I follow')]
And I wait small timeout
Then I see Advisor AT with css selector .table-ac__user contains: %{advisorName}
When I wait small timeout
And I click on uncheck I follow with xpath selector //label[@class='cx-checkbox'][contains(., 'Only those I follow')]
And I wait small timeout
!-- Check Areas of expertise
When I click on 1st checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Commodities')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1608
When I click on uncheck 1st checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Commodities')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1611

When I click on 2nd checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Derivatives')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1608
When I click on uncheck 1st checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Derivatives')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1611

When I click on 3rd checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Equities')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1608
When I click on uncheck 1st checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Equities')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1611

When I click on 5th checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Fixed Income')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1608
When I click on uncheck 1st checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Fixed Income')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1611

When I click on 6th checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Foreign Currency')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1608
When I click on uncheck 1st checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Foreign Currency')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1611

When I click on 7th checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Hedge Funds')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1608
When I click on uncheck 1st checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Hedge Funds')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1611

When I click on on drop-down menu with css selector select.form-control
!-- And I start recording action
!-- And I will move in action to CA, California element with containsText selector CA, California
!-- And I will click in action on CA, California element with containsText selector CA, California
!-- Then I perform previously recorded action
When I wait small timeout
And I type CA, California into State with css selector select.form-control
And I execute javascript $("select.form-control").change()
And I wait small timeout
Then I see Zip code with css selector tr.ng-scope:nth-child(2) > td:nth-child(4) > span:nth-child(1) > span:nth-child(1) contains: CA
Given Do nothing


!-- Do the same as intermediate
Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password
Given Set test param advisorName with value Advisor AT

Scenario:
Check the Search for advisor page as intermediate
Meta:
@name Check the Search for advisor page for Intermediate
Given I logged in with %{username} and %{password}
When I open ADVISORS menu
And I wait until service ready
And I type %{advisorName} into search field with css selector input.form-control
And I wait small timeout
Then I see Zip code with css selector tr.ng-scope > td:nth-child(4) > span:nth-child(1) is 12312
And I wait small timeout
When I execute javascript scroll(1050, 700)
And I wait small timeout
When I click on Advisor with containsText selector %{advisorName}
And I wait until service ready
And I click on ACWA page with css selector .cx-content-menu__icon__member
And I wait until service ready
Then I see ZIP code with xpath selector //table[@class='table table-ac']//td[@ng-bind='::mdl.adv.StateZip'] contains: 12312
And I wait small timeout
When I open ADVISORS menu
When I execute javascript scroll(1050, 700)
And I wait small timeout
And I click on checkbox only those I follow with xpath selector //label[@class='cx-checkbox'][contains(., 'Only those I follow')]
And I wait small timeout
Then I see empty list with css selector h3.text-muted contains: No advisors found. Add advisors you know to Tickeron.
When I wait small timeout
And I click on uncheck I follow with xpath selector //label[@class='cx-checkbox'][contains(., 'Only those I follow')]
And I wait small timeout
!-- Check Areas of expertise
When I click on 1st checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Commodities')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1608
When I click on uncheck 1st checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Commodities')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1611

When I click on 2nd checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Derivatives')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1608
When I click on uncheck 1st checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Derivatives')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1611

When I click on 3rd checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Equities')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1608
When I click on uncheck 1st checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Equities')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1611

When I click on 5th checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Fixed Income')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1608
When I click on uncheck 1st checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Fixed Income')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1611

When I click on 6th checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Foreign Currency')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1608
When I click on uncheck 1st checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Foreign Currency')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1611

When I click on 7th checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Hedge Funds')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1608
When I click on uncheck 1st checkbox with xpath selector //label[@class='cx-checkbox'][contains(., 'Hedge Funds')]
And I wait small timeout
Then I see number in green point with css selector .cx-items-counter contains: 1611

When I click on on drop-down menu with css selector select.form-control
!-- And I start recording action
!-- And I will move in action to CA, California element with containsText selector CA, California
!-- And I will click in action on CA, California element with containsText selector CA, California
!-- Then I perform previously recorded action
When I wait small timeout
And I type CA, California into State with css selector select.form-control
And I execute javascript $("select.form-control").change()
And I wait small timeout
Then I see Zip code with css selector tr.ng-scope:nth-child(2) > td:nth-child(4) > span:nth-child(1) > span:nth-child(1) contains: CA
Given Do nothing


!-- Do the same as Expert
Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
Given Set test param advisorName with value Advisor AT
Given Set test param advisor2Name with value James Adv.


Scenario: Check the Search for advisor page as expert
GivenStories:
    stories/advisor-client/search_for_advisor_page.story#{name:Check the Search for advisor page}
Given Do nothing

