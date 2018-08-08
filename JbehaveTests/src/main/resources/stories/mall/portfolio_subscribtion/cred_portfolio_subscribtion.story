Story: Mall -> CRED portfolio subscribtion

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate M_portfolio + UUID and put it to test param portfolioGenerated


Scenario: Create portfolio subscribtion
Meta:
@name Create portfolio subscribtion
GivenStories:
    stories/functional/test/portfolio/create_non_diversified_trading_portfolio.story#{name:Create non diversified trading porfolio}
Given I connect stripe as seller for %{username} with %{password}
Given I logged in with %{username} and %{password}
When I open MALL menu
And I wait until service ready

!--  Go  to SELL button in MALL
When Mall. Open sell subscription portfolio
!-- Find created portfolio via label
And I click on portfolio selector with css selector #portfolio
And I wait small timeout
And I execute javascript $('span:contains("%{portfolioGenerated}")').click()
And I wait small timeout
When I type 22 into price with css selector #price
And I execute javascript CKEDITOR.instances.text.setData("test descr")
And I click on Save and Previw button with css selector button.btn-primary:nth-child(2)
And I wait until service ready

!-- Check preview page
Then I see page header with css selector .cx-container > div:nth-child(1) > div:nth-child(2) > h1:nth-child(1) is Preview
Then I see portfolio title with css selector table.table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(2) > div:nth-child(1) is %{portfolioGenerated}
Then I see price with css selector td.cx-mall-table__text-large:nth-child(8) > span:nth-child(1) is $22.00
Then I see description with css selector .cx-break-word is test descr

Scenario: Publish portfolio subscribtion
Meta:
@name Publish portfolio subscribtion
When I wait big timeout
When I execute javascript $("input.ng-pristine:nth-child(1)").click()
When I click on Publish in mall with css selector .cx-opinion-publish__btn
And I wait small timeout
And I click on Agree button with css selector button.ng-binding:nth-child(2)
And I wait small timeout
Then I see popup with css selector h4.modal-title:nth-child(1) contains: Tickeron
When I click on ok button with css selector button.ng-binding
!-- Then I see toaster with css selector .toast-message is You have published the product in MALL
!--/*
!-- Check portfolio subscription
When Portfolio. I find portfolio %{portfolioGenerated}
And I click on Porfolio subscribtion link with css selector span.ng_portfolio_topplate_animation:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > a:nth-child(1)
Then I see page header with css selector .pull-left is %{portfolioGenerated}
Then I see price with css selector .cx-mall-item__price-num is $22.00
!--*/
!-- Then I see description with css selector p.ng-binding > p:nth-child(1) is test descr


Scenario:
Setup params. Set user to account admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
Given Set test param password value from property param.accountadmin.password
Given Set test param itemType with value Portfolio subscription
Given Set test param productTitle with value %{portfolioGenerated}

Scenario: Login to admin interface as account admin
Meta:
@name Login to admin interface as account admin
GivenStories:
    stories/mall/model_portfolio/cred_model_portfolio.story#{name:Approve Portfolio model in MALL}
Given Do nothing

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario: Delete portfolio subscribtion
Meta:
@name  Delete portfolio subscribtion
Given I logged in with %{username} and %{password}
When Mall. Find item %{portfolioGenerated} in Mall list
And I click on chevron with css selector .cx-arrow-down-icon
And I click on trash icon with css selector .cx-trash-btn
And I click on Yes button with css selector button.ng-binding:nth-child(1)
Then I see toaster with css selector .toast-message is Portfolio subscription deleted!
When Mall. Find item %{portfolioGenerated} in Mall list
Then I see empty the table with css selector div.text-xs-center:nth-child(1) is: We couldn't find any of your items

