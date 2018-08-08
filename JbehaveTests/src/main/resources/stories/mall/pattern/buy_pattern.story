Story: Patterns a-la carte - buy in Mall

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario: Buy pattern
Meta:
@name Buy pattern
Given I connect card as client for %{username} with %{password}
And I logged in with %{username} and %{password}
When I open MALL menu
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: MALL
When Mall. Open buy AI pattern recoginition a-la carte
And I wait until service ready
Then I see header with css selector .h1 contains: Stock Patterns (one at time)
!-- Check search
When I select Pennant (Bullish) ByVisibleText from Select element with css selector select[ng-model*='mdl.query.patternId']
And I select Transportation ByVisibleText from Select element with css selector select[ng-model*='mdl.query.categoryId']
And I select Confirmed ByVisibleText from Select element with css selector select[ng-model*='mdl.query.status']
And I select 50% ByVisibleText from Select element with css selector select[ng-model*='mdl.query.confidence']
And I type Jan 01, 1968 into calendar with css selector input.form-control:nth-child(1)
And I type 27 into target price with css selector input.form-control:nth-child(2)
And I execute javascript $(".cx-search-in-mall-btn").click()
And I wait big timeout
Then I see header with css selector .h1 contains: Stock Patterns (one at time)
!-- Then I see header with css selector .cx-mall-patterns-search__search-header > span:nth-child(1) contains: Search results
!-- Buy patterns
!-- deselect category
When I select object:null ByValue from Select element with css selector select[ng-model*='mdl.query.categoryId']
And I execute javascript $(".cx-search-in-mall-btn").click()
And I wait big timeout
Then I see header with css selector .h1 contains: Stock Patterns (one at time)
!-- Then I see header with css selector .cx-mall-patterns-search__search-header > span:nth-child(1) contains: Search results
When I click on first Pennant pattenr in list with css selector tr.cx-mall-patterns-search__pattern:nth-child(1) > td:nth-child(2) > a:nth-child(1)
And I wait until service ready
Then I see header with css selector div.col-xs-6:nth-child(1) > h1:nth-child(1) contains: Pennant
!-- agree with terms
When I will execute javascript $('label:contains("I agree with")').children('input').click()
And I wait small timeout
And I click on buy broduct button with css selector .btn-primary-sm
And I wait small timeout
And I click on Buy with css selector button.ng-binding:nth-child(2)
And I wait until service ready
And I click on Ok with css selector button.ng-binding
And I wait until service ready
Then I see head with css selector .h1 contains: Purchases
!-- Find pattern
When I execute javascript $(".form-control").val("Pennant")
And I execute javascript $(".form-control").change()
And I wait small timeout
!-- open bought pattern
When I click on bought pattern link with containsText selector Pennant
And I wait until service ready
Then I see pennant header with css selector .cx-mall-pattern__description__table-container > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) > h2:nth-child(1) > span:nth-child(1) is Pennant
!-- make note
When I click on note button with css selector .cx-mall-preview__notes > span:nth-child(2)
And I send note message with text bla-la la