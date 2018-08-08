Story: List - Publish model

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated
And Set test param priceValue with value 5

Scenario: Attach Seller account
Given I connect stripe as seller for %{username} with %{password}
Given Do nothing

Scenario: Create portfolio
GivenStories:
      stories/functional/test/portfolio/create_investement_portfolio.story#{name:Create investment porfolio}
Given Do nothing

Scenario:
Publish investment portfolio in MALL
Meta:
@name Publish investment portfolio in MALL
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
When I click on Share button with css selector #topPlate_dropdownMenu
And I click on Sell Model Portfolio in Mall with xpath selector //span[@class='top-plate-dropdown-item_title'][text() = 'Sell Model Portfolio in Mall']
And I wait small timeout
And I click on Start with css selector a[href^='/app/mallnew#!/create-model-portfolio?portfolioId=']
And I wait until service ready
Then I see header with css selector .h1 contains: Create Model Portfolio
!-- enter price and description
When I type %{priceValue} into price with css selector #price
And I execute javascript CKEDITOR.instances.text.setData("Portfolio description")
And I click on save and preview with css selector button[ng-click='save()']
And I wait until service ready
Then I see header with css selector .cx-container > div:nth-child(1) > div:nth-child(2) > h1:nth-child(1) is Preview
!-- check portfolio status
When I open HOME menu
And I open portfolios block
And I click on portfolio with xpath selector //a/h3[text()='%{portfolioGenerated}']
And I wait until service ready
Then I see status with xpath selector //div/span[@ng-show='stateIn([329])'] is Listed / Not Published
Then I see there is no Settings with css selector a[href^='#!/portfolio/edit/']
And I wait small timeout
When I click on Adjust actual positins with css selector .social-menu__icon_adjust
Then I see modal window text with css selector .cx-modal-dafault > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) contains: published in mall
When I click on Ok button with css selector button.ng-binding
And I wait small timeout
Then I see there is no Alerts with css selector a[href^='#!/portfolio/alert_setup/']
!-- Publish
When I click on Publish with xpath selector //button[text()='Publish']
And I wait until service ready
Then I see header with css selector .cx-container > div:nth-child(1) > div:nth-child(2) > h1:nth-child(1) is Preview
When I execute javascript angular.element('[ng-controller=CxPreviewModelPortfolioCtrl]').scope().mdl.agreeWithTerms = true
And I wait small timeout
When I click on List butoon with css selector button[ng-click='publish()']
And I wait until service ready
When I click on Agree button with css selector button.ng-binding:nth-child(2)
Then I see header with css selector .h1 contains: Listings
!-- check portfolio status
When I open HOME menu
And I open portfolios block
And I click on portfolio with xpath selector //a/h3[text()='%{portfolioGenerated}']
And I wait until service ready
Then I see status with xpath selector //div/span[@ng-show='stateIn([309])'] contains: in MALL
When I will wait until sold counter element with css selector div.col-xs-12:nth-child(3) > div:nth-child(1) > div:nth-child(2) will be visible


Scenario: Unpublish from Mall
GivenStories:
   stories/mall/model_portfolio/cred_model_portfolio.story#{name:Delete model portfolio}
Given Do nothing

Scenario: Delete created portfolio
When I open HOME menu
And I open portfolios block
And I click on portfolio with xpath selector //a/h3[text()='%{portfolioGenerated}']
And I wait until service ready
And I remove portfolio
And I wait until service ready
Then I see header with css selector div.col-sm-6:nth-child(1) > div:nth-child(1) > h1:nth-child(1) contains: Portfolios





