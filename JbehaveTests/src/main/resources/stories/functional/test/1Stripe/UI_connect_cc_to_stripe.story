Story: UI Connect Credit card to Stripe account for functional tests


Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario:
Connect credit card
Meta:
@name Connect credit card
Given I logged in with %{username} and %{password}
!-- Open Payment Profile page
When I click on Avatar with css selector div[model*='topMenuItems.UserAvatar']
And I click on Payment profile with link selector Payment Profile
Then I see Payment Profile with css selector .col-sm-12 > div:nth-child(1) > cx-misc-page-header-bar:nth-child(1) > div:nth-child(1) > div:nth-child(1) > h1:nth-child(1) is Payment Profile
!-- Connect Stripe
When I click on first Connect wwith Stripe button with css selector div.col-sm-offset-1:nth-child(2) > div:nth-child(4) > a:nth-child(1) > span:nth-child(1)
And I wait until service ready
And I wait big timeout
And I switch to Stripe checkout frame with css selector .stripe_checkout_app
Then I see Tickeron header with css selector .title > h1:nth-child(1) is Tickeron
!-- Input CC data
When I type %{username} into email field with css selector #email
And I type 4242 into Card Number with css selector #card_number
And I type 4242 into Card Number with css selector #card_number
And I type 4242 into Card Number with css selector #card_number
And I type 4242 into Card Number with css selector #card_number
And I type 12 into MM/YY with css selector #cc-exp
And I type 16 into MM/YY with css selector #cc-exp
And I type 111 into CVC with css selector #cc-csc
And I click on Submit button with css selector #submitButton
And I wait big timeout
Then I switch to default content
Then I see Payment Profile with css selector .col-sm-12 > div:nth-child(1) > cx-misc-page-header-bar:nth-child(1) > div:nth-child(1) > div:nth-child(1) > h1:nth-child(1) is Payment Profile
Then I see OK status with css selector table.cx-table:nth-child(3) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(2) is OK


Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Connect Stripe account
Meta:
@name Connect Stripe account
Given I logged in with %{username} and %{password}
!-- Open Payment Profile page
When I click on Avatar with css selector div[model*='topMenuItems.UserAvatar']
And I click on Payment profile with link selector Payment Profile
Then I see Payment Profile with css selector .col-sm-12 > div:nth-child(1) > cx-misc-page-header-bar:nth-child(1) > div:nth-child(1) > div:nth-child(1) > h1:nth-child(1) is Payment Profile
!-- Input Stripe account info
When I click on Connect stripe account info with css selector div.col-sm-offset-1:nth-child(2) > div:nth-child(8) > a:nth-child(1) > span:nth-child(1)
And I wait big timeout
And I click on Skip this account form with css selector #skip-account-app
And I wait big timeout

Scenario:
Setup params. Set user to begginer
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario: Connect credit card to beginner
GivenStories:
    stories/functional/test/1Stripe/UI_connect_cc_to_stripe.story#{name:Connect credit card},
Given Do nothing

Scenario:
Setup params. Set user to intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password

Scenario: Connect credit card to intermediate
GivenStories:
    stories/functional/test/1Stripe/UI_connect_cc_to_stripe.story#{name:Connect credit card},
Given Do nothing


Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario: Connect credit card to advisor
GivenStories:
    stories/functional/test/1Stripe/UI_connect_cc_to_stripe.story#{name:Connect credit card},
Given Do nothing
