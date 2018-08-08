Story: Mall -> CRED model portfolio

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate M_portfolio + UUID and put it to test param portfolioGenerated


Scenario: Create model portfolio
Meta:
@name Create model portfolio
GivenStories:
       stories/functional/test/portfolio/create_investement_portfolio.story#{name:Create investment porfolio}
Given I connect stripe as seller for %{username} with %{password}
And I logged in with %{username} and %{password}
When I open MALL menu
And Mall. Open sell model portfolio

!-- Find created portfolio via label
And I click on portfolio selector with css selector #portfolio
And I wait small timeout
And I execute javascript $('span:contains("%{portfolioGenerated}")').click()
And I wait small timeout

When I type 22 into price with css selector #price
And I execute javascript CKEDITOR.instances.text.setData("test descr")
And I wait small timeout
And I click on Save and Previw button with css selector button.btn-primary:nth-child(2)
And I wait big timeout

!-- Check preview page
Then I see page header with css selector .cx-container > div:nth-child(1) > div:nth-child(2) > h1:nth-child(1) is Preview
Then I see portfolio title with css selector table.table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(2) > div:nth-child(1) is %{portfolioGenerated}
Then I see price with css selector td.cx-mall-table__text-large:nth-child(8) > span:nth-child(1) is $22.00

Scenario: Publish model portfolio
Meta:
@name Publish model portfolio
When I execute javascript $("input.ng-pristine:nth-child(1)").click()
When I click on List in mall with css selector .cx-opinion-publish__btn
!-- And I click on Agree button with css selector button.ng-binding:nth-child(2)
And I wait small timeout
When I click on Agree button with css selector button.ng-binding:nth-child(2)
And I wait small timeout
Then I see popup with css selector h4.modal-title:nth-child(1) contains: Tickeron
When I click on ok button with css selector button.ng-binding
And I wait small timeout
!-- Check model portfolio
When Mall. Find item %{portfolioGenerated} in Mall list
And Portfolio. I find portfolio %{portfolioGenerated}
And I click on model portofolio titile with css selector span.ng_portfolio_topplate_animation:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > a:nth-child(1)
Then I see page header with css selector .pull-left is %{portfolioGenerated}
Then I see price with css selector .cx-mall-item__price-num is $22.00
Then I see description with css selector p.ng-binding > p:nth-child(1) is test descr

Scenario:
Setup params. Set user to account admin
Meta:
@basic
Given Set test param username value from property param.accountadmin.username
Given Set test param password value from property param.accountadmin.password
Given Set test param itemType with value Portfolio model
Given Set test param productTitle with value %{portfolioGenerated}

Scenario: Approve Portfolio model in MALL
Meta:
@name Approve Portfolio model in MALL
GivenStories:
     stories/login/admin_login.story#{name:Login to admin interface as account admin}
Given Do nothing
!-- Go to Mall
When I click on MALL menu tab with link selector Mall
Then I see page header with css selector .col-md-12 > h1:nth-child(1) is: Manage mall items
And I wait small timeout
!-- Open list of products
When MALL. I approve mall product with %{productTitle} which has a product type (Portfolio model/Portfolio subscription/Newsletter/Opinion): %{itemType}
!-- And I click on Search button with css selector #admin__maill__search-button
!-- And I wait small timeout
!-- Then I see product item with css selector div.row:nth-child(7) > div:nth-child(2) > p:nth-child(1) is: %{productTitle}
!-- When I click on View Details Button with css selector a.btn
!-- When I wait until service ready
!--!-- Approve MALL product
!-- When I click on Approve button with css selector button[ng-click='approve(mdl.item)']
!-- And I wait small timeout
!-- Then I see Toaster item with css selector .toast-message is: Item Published!

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario: Delete model portfolio
Meta:
@name Delete model portfolio
Given I logged in with %{username} and %{password}
When Mall. Find item %{portfolioGenerated} in Mall list
And I click on chevron with css selector .cx-arrow-down-icon
And I click on trash icon with css selector .cx-trash-btn
And I click on Yes button with css selector button.ng-binding:nth-child(1)
Then I see toaster with css selector .toast-message is Model Portfolio deleted!
!-- Check that portfolio was deleted
When Mall. Find item %{portfolioGenerated} in Mall list
Then I see empty the table with css selector div.text-xs-center:nth-child(1) is: We couldn't find any of your items
