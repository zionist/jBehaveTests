Story: Send iexpert article problem report from pre-login

Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password
Given I generate test_ + UUID and put it to test param messageText
Given Set test param reason with value Other

Scenario:
Send iexpert article problem report from pre-login
Meta:
@name iexpert article problem report from pre-login
Given Browser ready
When I open EXPLORE AS GUEST menu
And I wait small timeout
Then I see header with xpath selector //span[text()='LEARN'] contains: LEARN
!-- Open iExpert
When I execute javascript $("a[href='/app/academy#!/overview']")[0].click()
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: Academy
When I execute javascript $("a[href='/app/academy#!/iexpert/index']")[0].click()
Then I see header with css selector .iexpert-index-page__header_artiles contains: Top articles
And I wait small timeout
When I click on 1st article with css selector div.media:nth-child(3) > div:nth-child(2) > a:nth-child(1) > h4:nth-child(1)
!-- And I wait small timeout
And Zendesk. iExpert. Open Report problem dialog
And I wait small timeout
And I click on login here link with css selector .cx-login-block__actions-login
And I submit %{username} and %{password} into open Log in form
And I wait until service ready
And I click on Report a problem with css selector .btn-link-problem
And Zendesk. iExpert. Send report with reason %{reason} and text %{messageText}


Scenario:
Check zendesk last ticket
Meta:
@name Check zendesk last ticket
Given I check in zendesk sent message and subject with text %{messageText} and subject %{reason}
When Zendesk. Submit ticket as solved
Then I check that zendesk ticket with User Mike In. reported an issue regarding %{reason} have status is(choose one of solved/open/pending): solved
Given Do nothing
