Story: Community -> Your page -> Products in mall

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate _Opinion_ + UUID and put it to test param opinonGeneratedName

Scenario:
Check page products in mall
GivenStories:
    stories/mall/opinion/cred_opinion.story#{name:Create opinion},
    stories/mall/opinion/cred_opinion.story#{name:Publish opinion}
Given Do nothing

Scenario:
Setup params. Set user to account admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
Given Set test param password value from property param.accountadmin.password
Given Set test param itemType with value Opinion
Given Set test param productTitle with value %{opinonGeneratedName}



Scenario: Login to admin interface as account admin
Meta:
@name Login to admin interface as account admin
GivenStories:
    stories/mall/model_portfolio/cred_model_portfolio.story#{name:Approve Portfolio model in MALL}
Given Do nothing

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Check page products in mall
Given I logged in with %{username} and %{password}
When I open COMMUNITY menu
And I click on Products in MALL with css selector #community__menu__products-in-mall-link
And I execute javascript $(".form-control").val("number:0")
And I execute javascript $(".form-control").change()
Then I see title with css selector .community-mall-card__header contains: %{opinonGeneratedName}


