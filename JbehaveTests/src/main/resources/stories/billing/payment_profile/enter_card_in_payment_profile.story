Story: Billing, payment profile, enter card

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario: Billing, payment profile, enter card
Meta:
@name Billing, payment profile, enter card
!-- Given I connect card with 4012 8888 8888 1881 as client for %{username} with %{password}
Given I connect card with 4242 4242 4242 4242 as client for %{username} with %{password}
Then Stripe. Check card 4242 4242 4242 4242 exists for customer with %{username}



