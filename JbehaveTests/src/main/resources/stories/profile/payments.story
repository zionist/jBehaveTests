Story: Production - Check Payments page

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Check transactions page
Meta:
@name transactions page
Given I logged in with %{username} and %{password}
!-- Personal Profile
When I click on Avatar with css selector .cx-page-header__first-level__username
And I click on transactions with css selector a.dropdown-item:nth-child(2)
And I wait until service ready
Then I see page header with css selector .h1 contains: Payments
Then I see table header with css selector .table > thead:nth-child(1) > tr:nth-child(1) > th:nth-child(2) contains: PRODUCT NAME
!-- check that search is working
When I type New Item into search field with css selector .form-control
And I wait until service ready
Then I see text in the table with css selector .text-muted contains: We couldn't find any payment
!-- Advanced Search
When I click on button Advanced with css selector .btn-block
And I wait until service ready
And I clear the date-piker with css selector #fromDate
And I type 05/01/2015 into date with css selector #fromDate
And I clear the date-piker with css selector #toDate
And I type 06/29/2015 into date with css selector #toDate
And I clear the transactions id with css selector #stripeChargeId
And I type 987654321 into transactions id with css selector #stripeChargeId
And I clear the product id with css selector #productId
And I type 123456789 into product id with css selector #productId
!-- turn off all checkbox
And I execute javascript $("span:contains('Debit')").click()
And I execute javascript $("span:contains('Credit')").click()
!-- type
And I execute javascript $("span:contains('Mall')").click()
And I execute javascript $("span:contains('Advisor-Client')").click()
And I execute javascript $("span:contains('Membership')").click()
And I execute javascript $("span:contains('Patterns')").click()
And I execute javascript $("span:contains('Webcasts')").click()
!-- status
And I execute javascript $("span:contains('Completed')").click()
And I execute javascript $("span:contains('Refund requested')").click()
And I execute javascript $("span:contains('Refund Rejected')").click()
And I execute javascript $("span:contains('Refunded')").click()
!-- Button Search
When I click on button search with css selector button.btn-primary:nth-child(2)
And I wait until service ready
Then I see text in the table with css selector .text-muted contains: We couldn't find any payment
!-- Button Reset
When I click on button reset with css selector .btn-secondary_transparent
And I wait small timeout
!-- Check element is unchecked
When I execute javascript if ($("span:contains('Mall')").parent().children()[0].checked != false) {throw "mall element is checked" }


