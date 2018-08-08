Story: Audit trail basic check

Narrative:
As a user
I want to perform basic check for audit trail functionality

Scenario: Setup params. Set user to expert
Given Set test param username value from property param.expert.username
And Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario: Check audit trail
GivenStories:
       stories/functional/test/portfolio/create_investement_portfolio.story#{name:Create investment porfolio}
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on top right corner username (profile) with css selector .cx-page-header__first-level__username
And I click on Audit trail menu with css selector a.dropdown-item:nth-child(3)
And I wait until service ready
And I clear the from date with css selector #fromDate
And I clear the to date with css selector #toDate
And I type January 01, 2010 into target date range from with css selector #fromDate
And I type January 01, 2020 into target date range to with css selector #toDate
And I click using js on User selector with css selector div.col-xs-4:nth-child(5) > h5:nth-child(1) > label:nth-child(1) > input:nth-child(1)
And I wait small timeout
And I click using js on search button with css selector .btn-block
And I wait until service ready
And I click on first chevron with css selector tr.ng-scope:nth-child(1) > td:nth-child(4) > i:nth-child(1)
And I wait small timeout
Then I see user email with css selector div.row:nth-child(6) > div:nth-child(1) > div:nth-child(2) is: e1@catch01.tickerontest.com


