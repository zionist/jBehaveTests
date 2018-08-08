Story: Check functionality of Mall page

Scenario:
Mall
Meta:
@name Mall
Given Browser ready
And I wait small timeout
When I open EXPLORE AS GUEST menu
And I wait small timeout
Then I see header with xpath selector //span[text()='HUMAN INTELLIGENCE'] contains: HUMAN INTELLIGENCE
When Explore as guest. Click on Mall block and check header
!-- Buy Model portfolio
When Mall. Open buy model portfolio
And I wait small timeout
Then I see header with css selector .pull-left contains: Model Portfolios
!-- Click advanced search
When I execute javascript $(".btn-block").click()
And I wait small timeout
Then I see Search in Mall button with css selector .cx-search-in-mall-btn contains: Search in MALL
!-- Back
When I click on back with xpath selector //a[@href='#!']
And I wait small timeout
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: MALL
When I wait until service ready
!-- Sell Model Portfolio
!-- When Mall. Open sell model portfolio
!-- When I execute javascript $("div.col-lg-4:nth-child(2) > div:nth-child(2) > div:nth-child(2) > div:nth-child(4) > a:nth-child(2)").click()
!-- And I wait small timeout
!-- Then I see header with css selector .page-header-name contains: Membership

!-- Buy Portfolio Subscriptions
!-- When I open EXPLORE AS GUEST menu
When I click on EXPLORE AS GUEST with css selector #prelogin_page_menu__guest
And I wait small timeout
Then I see header with xpath selector //span[text()='HUMAN INTELLIGENCE'] contains: HUMAN INTELLIGENCE
When Explore as guest. Click on Mall block and check header
When Mall. Open buy subscription portfolio
And I wait small timeout
Then I see header with css selector .pull-left contains: Portfolio Subscriptions
!-- Click advanced search
When I execute javascript $(".btn-block").click()
And I wait small timeout
Then I see Search in Mall button with css selector .cx-search-in-mall-btn contains: Search in MALL
!-- Back
When I click on back with xpath selector //a[@href='#!']
And I wait small timeout
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: MALL
!-- Sell Portfolio Subscriptions
!-- When Mall. Open sell subscription portfolio
!-- When I execute javascript $("div.col-lg-4:nth-child(2) > div:nth-child(3) > div:nth-child(2) > div:nth-child(4) > a:nth-child(2)").click()
!-- And I wait small timeout
!-- Then I see header with css selector .page-header-name contains: Membership

!-- Buy Newsletters
When I click on EXPLORE AS GUEST with css selector #prelogin_page_menu__guest
And I wait small timeout
Then I see header with xpath selector //span[text()='HUMAN INTELLIGENCE'] contains: HUMAN INTELLIGENCE
When Explore as guest. Click on Mall block and check header
When Mall. Open buy newsletter
And I wait small timeout
Then I see header with css selector .pull-left contains: Newsletters
!-- Click advanced search
When I execute javascript $(".btn-block").click()
And I wait small timeout
Then I see Search in Mall button with css selector .cx-search-in-mall-btn contains: Search in MALL
!-- Back
When I click on back with xpath selector //a[@href='#!']
And I wait small timeout
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: MALL
!-- Sell Newsletters
!-- When Mall. Open sell newsletter
!-- And I wait small timeout
!-- Then I see header with css selector .page-header-name contains: Membership

!-- Buy Opinions
When I click on EXPLORE AS GUEST with css selector #prelogin_page_menu__guest
And I wait small timeout
Then I see header with xpath selector //span[text()='HUMAN INTELLIGENCE'] contains: HUMAN INTELLIGENCE
When Explore as guest. Click on Mall block and check header
When Mall. Open buy opinion
And I wait small timeout
Then I see header with css selector .pull-left contains: Opinions
!-- Click advanced search
When I execute javascript $(".btn-block").click()
And I wait small timeout
Then I see Search in Mall button with css selector .cx-search-in-mall-btn contains: Search in MALL
!-- Back
When I click on back with xpath selector //a[@href='#!']
And I wait small timeout
Then I see header with css selector .explore-as-guest__intro-page-container__left-info-plate-title contains: MALL
!-- Sell Opinions
!-- When Mall. Open sell opinion
!-- And I wait small timeout
!-- Then I see header with css selector .page-header-name contains: Membership

!-- Trend Predictions Start for free
!--/*
When I click on EXPLORE AS GUEST with css selector #prelogin_page_menu__guest
And I wait small timeout
Then I see header with xpath selector //span[text()='HUMAN INTELLIGENCE'] contains: HUMAN INTELLIGENCE
When Explore as guest. Click on Mall block and check header
When Mall. Open AI tred prediction. Start for free
And I wait small timeout
Then I see header with xpath selector //div[h1/text()='A.I. Trend Predictions:'] contains: A.I. Trend Predictions:
!--*/
!-- Pattern Recognition Start for free
When I click on EXPLORE AS GUEST with css selector #prelogin_page_menu__guest
And I wait small timeout
Then I see header with xpath selector //span[text()='HUMAN INTELLIGENCE'] contains: HUMAN INTELLIGENCE
When Explore as guest. Click on Mall block and check header
When Mall. Open AI pattern recoginition. Start for free
And I wait small timeout
Then I see header with xpath selector //div[h1/text()='A. I. Pattern Recognition'] contains: A. I. Pattern Recognition

!-- Patterns a-la carte
When I click on EXPLORE AS GUEST menu with css selector #prelogin_page_menu__guest
And I wait small timeout
Then I see header with xpath selector //span[text()='HUMAN INTELLIGENCE'] contains: HUMAN INTELLIGENCE
When Explore as guest. Click on Mall block and check header
When Mall. Open buy AI pattern recoginition a-la carte
And I wait small timeout
Then I see header with css selector .h1 contains: Stock Patterns (one at time)
When I save text from first pattern detected element with css selector tr.cx-mall-patterns-search__pattern:nth-child(1) > td:nth-child(4) > span:nth-child(1) to variable detectDate
And I click on first pattern in list with css selector tr.cx-mall-patterns-search__pattern:nth-child(1) > td:nth-child(2) > a:nth-child(1)
And I wait until service ready
Then I see detect date with css selector span.ng-binding:nth-child(3) contains: %{detectDate}

