Story: Data admin check System Settings page

Narrative:
I am a Data admin
I want to check "System Settings" page

Scenario:
Setup params. Checks "System Settings" page as data admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
And Set test param password value from property param.accountadmin.password

Scenario: Checks "System Settings" page
Meta:
@name Checks "System Settings" page
GivenStories:
  stories/login/admin_login.story#{name:Login to admin interface as account admin}
Given Do nothing
!-- Go to System Settings page
When I click on Data menu with link selector Data
And I click on System Settings menu  with link selector System settings
Then I see top of page with css selector h1.ng-scope is: System Settings
And I wait small timeout
!-- Change date
When I clear the Data field with css selector #fromDate
And I clear the Data field with css selector #toDate
And I type 12/15/2015 into User field with css selector #toDate
And I type 12/15/2010 into User field with css selector #fromDate
And I wait small timeout
And I click on radiobutton Table with css selector .fa-dot-circle-o
!-- Choose ticker
And I click on field tickers with css selector #filterInput
And I type AAPL into ticker field with css selector #filterInput
And I will wait until ticker element element with css selector #chb33807 will be visible
!-- Tickers list appears. Add AAPL ticker
And I start recording action
And I will move in action to AAPL ticker checkbox element with css selector #chb33807
And I will click in action on AAPL ticker checkbox element with css selector #chb33807
And I will move in action to Show button element with css selector div.col-sm-2:nth-child(3) > input:nth-child(1)
And I will click in action on Show button element with css selector div.col-sm-2:nth-child(3) > input:nth-child(1)
Then I perform previously recorded action
And I wait big timeout
!-- checked, what selected ticker is AAPL
Then I see above the table with css selector div.ng-scope:nth-child(5) > div:nth-child(2) > p:nth-child(1) is: Selected ticker is AAPL
!-- Click on radio button "Chart "
When I click on radiobutton Chart with css selector .fa-circle-o
And I wait small timeout
!-- checked, what table chart is visible
When I will wait until table element with css selector .amcharts-chart-div > svg:nth-child(1) > g:nth-child(2) > path:nth-child(2) will be visible
Then Do nothing