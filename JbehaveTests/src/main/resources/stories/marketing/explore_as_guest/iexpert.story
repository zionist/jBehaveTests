Story: Check functionality of iExpert page

Scenario:
iExpert
Meta:
@name iExpert
Given Browser ready
When I open EXPLORE AS GUEST menu
And I wait small timeout
Then I see header with xpath selector //span[text()='LEARN'] contains: LEARN
!-- Open iExpert
When I execute javascript $("a[href='/app/academy#!/overview']")[0].click()
!-- When I click on Academy tab with xpath selector //a[@href='/app/academy#!/overview']
And I wait small timeout
Then I see page header with css selector .explore-as-guest__intro-page-container__left-info-plate-title is: Academy
!-- When I start recording action
!-- And I will move in action to 01 element with css selector div.col-lg-6:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1)
!-- And I will move in action to 02 element with css selector div.col-xs-12:nth-child(2) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1)
!-- And I click on 02 with css selector div.col-xs-12:nth-child(2) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1) > span:nth-child(1)
!-- And I click on Open button with css selector div.col-xs-12:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(5) > a:nth-child(1)
When I execute javascript $("a[href='/app/academy#!/iexpert/index']")[0].click()
Then I see header with css selector .iexpert-index-page__header_artiles contains: Top articles
!-- Click Ask Expert
When I click on Ask Expert button with css selector button.btn:nth-child(3)
Then I see sign up pop-up window and close it
And I wait small timeout
!-- Open chapters list
When I click on Chapters button with css selector #iexpert__to-chapters-button
And I wait until service ready
Then I see header with css selector .iexpert-chapters-list__page-header contains: Chapters
When I click on Chapters back button with css selector .iexpert-chapters-list__arrow-back
And I wait small timeout
Then I see header with css selector .iexpert-index-page__header_artiles contains: Top articles
!-- Search
When I type Who establishes a 401(k)? into search field with xpath selector //input[@placeholder='Type your question...']
And I wait small timeout
And I wait small timeout
And I click on on found article with containsText selector Who Establishes a 401(k)?
And I wait small timeout
Then I see header with css selector .iexpert-article__header contains: Who Establishes a 401(k)?
!-- Back
!-- TODO: Where are checks?
!-- When I click on Back breadcrumb with xpath selector //button[@ng-click='back()']
!-- And I wait small timeout
!-- Then I see header with css selector .iexpert-search-result-block > h1:nth-child(2) contains: Search Results