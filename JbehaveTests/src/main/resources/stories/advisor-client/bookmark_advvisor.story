Story: Bookmark advisor

Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password
Given Set test param advisorName with value Advisor AT
Given Set test param advisor2Name with value James Adv.

Scenario:
Bookmark advisor
Meta:
@name Bookmark advisor
Given I logged in with %{username} and %{password}
When I open ADVISORS menu
And I type %{advisorName} into search field with css selector input.form-control
And I wait small timeout
When I click on bookmark icon with css selector .btn-bookmark-icon
Then I see toastr with css selector .toast-message is: Bookmarked!
And I wait small timeout
When I click on Bookmark tab with css selector .tabs-right > li:nth-child(3)
And I wait until service ready
Then I see head2 with css selector .col-xs-9 > h2:nth-child(1) > span:nth-child(1) contains: Bookmarked
Then I see Advisor in list of bookmarks with css selector .table-ac__user contains: %{advisorName}
When I click on first tab with css selector .tabs-right > li:nth-child(1)
And I wait until service ready
And I type %{advisor2Name} into search field with css selector input.form-control
And I wait small timeout
When I click on bookmark icon with css selector .btn-bookmark-icon
Then I see toastr with css selector .toast-message is: Bookmarked!
And I wait small timeout
When I click on Bookmark tab with css selector .tabs-right > li:nth-child(3)
And I wait until service ready
Then I see head2 with css selector .col-xs-9 > h2:nth-child(1) > span:nth-child(1) contains: Bookmarked
Then I see Advisor in list of bookmarks with css selector .table-ac__user contains: %{advisorName}
Then I see Advisor in list of bookmarks with css selector tr.ng-scope:nth-child(3) > td:nth-child(2) > span:nth-child(1) contains: %{advisor2Name}
And I wait small timeout
When I click on X icon with css selector tr.ng-scope:nth-child(2) > td:nth-child(6) > button:nth-child(1)
Then I see toastr with css selector .toast-message is: Bookmark removed!
And I wait small timeout
When I click on X icon with css selector .btn-x-icon
Then I see toastr with css selector .toast-message is: Bookmark removed!
Then I see empty page with css selector h3.text-muted contains: No advisors found. Bookmark advisors to see them here.


!-- Do the same as Expert
Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
Given Set test param advisorName with value Advisor AT
Given Set test param advisor2Name with value James Adv.


Scenario: Bookmark expert
GivenStories:
    stories/advisor-client/bookmark_advvisor.story#{name:Bookmark advisor}
Given Do nothing

!-- Do the same as Intermed
Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password
Given Set test param advisorName with value Advisor AT
Given Set test param advisor2Name with value James Adv.


Scenario: Bookmark intermediate
GivenStories:
    stories/advisor-client/bookmark_advvisor.story#{name:Bookmark advisor}
Given Do nothing
