Story: Production - Check Clubs / Webcasts / Invite to Share pages in Community/Academy

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Community -> Clubs
Given I logged in during maintenance with %{username} and %{password}
When I open COMMUNITY menu
And I wait until service ready
When I click on Clubs  with css selector #community__menu__clubs-link
And I wait until service ready
Then I see page header with css selector .cx-misc-tooltip-activator > span:nth-child(1) > span:nth-child(1) contains: Clubs
When I click on mine with css selector label.cx-checkbox:nth-child(2) > span:nth-child(2)


!-- Then I see inscription with css selector span.ng-binding contains: NO CLUBS FOUND

!-- Create Club
When I click on 'Create' button with css selector #community__clubs__create-club-button
And I wait until service ready
Then I see page header with css selector .community__header is: Create Investors Club
Then I see 'Title' input with css selector div.form-group:nth-child(1) > div:nth-child(1) > label:nth-child(1) contains: Title
Then I see Club portfolio title with css selector div.form-group:nth-child(2) > div:nth-child(1) > label:nth-child(1) contains: Club Portfolio
Then I see  Description title with css selector div.form-group:nth-child(3) > div:nth-child(1) > label:nth-child(1) contains: Description

Scenario:
Community -> Webcasts
When I open WEBCASTS menu
And I wait until service ready
Then I see page header with css selector .social-title > h1:nth-child(1) is: Webcasts

!-- Create webcast
When I click on 'Create webcast' button with css selector #community__webcasts__create-button
And I wait until service ready
Then I see page header with css selector .social-title > h1:nth-child(2) is: Create Your Own Webcast
Then I see General information with css selector .webcasts__container > div:nth-child(2) > div:nth-child(1) > h3:nth-child(1) is: General Information
Then I see Text info message with css selector div.col-xs-offset-2:nth-child(2) > div:nth-child(1) is: We offer you an opportunity to have one webcast a week up to two hours long
When I click on Fee-based radio with css selector .col-xs-10 > label:nth-child(1) > span:nth-child(2)
And I wait small timeout
Then I see Text info message with css selector div.col-xs-offset-2:nth-child(2) > div:nth-child(2) is: We offer you an opportunity to have one webcast a day up to two hours long






