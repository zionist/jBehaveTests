Story: Check Sharing Validation. Users with all levels try to share with other users


!-- As Beginner create portfolio and share it with all other levels (Himself, Other Beginner, Intermediate, Expert, Advisor)
Scenario:
Setup params. Set user to beginner
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario:
As Beginner create portfolio and send sharing request to other levels
GivenStories:
      stories/functional/test/portfolio/create_investement_portfolio.story#{name:Create investment porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
!-- with Himself
When I click on Share+ btn with css selector #topPlate_dropdownMenu
When I click on Share portfolio with a friend with css selector li.col-xs-12:nth-child(1) > a:nth-child(1) > div:nth-child(1) > div:nth-child(2) > span:nth-child(2)
When I click on Share btn with css selector span.ng_portfolio_topplate_animation:nth-child(5) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(3) > a:nth-child(1)
When I type b1@catch01.tickerontest.com into email input with css selector .form-control
When I click on Next btn with css selector button[type="submit"]
Then I see TickerOn pop-up with css selector .cx-modal-dafault > div:nth-child(1) contains: You can't send invitation to yourself
When I click on OK btn with css selector button.ng-binding
!-- with Other Beginner
When I type b1_at@catch01.tickerontest.com into email input with css selector .form-control
And I wait small timeout
When I click on Next btn with xpath selector //*[@id="pageMenuContainer"]/div[2]/div[2]/div/div[2]/div/div/div/div/div/div/div[3]/div[2]/div/div/div[2]/div[2]/div/button
Then I see toaster with css selector .toast-message is Portfolio '%{portfolioGenerated}' has been offered for sharing to  Beginner AT
When I click on Stop sharing btn with css selector span.btn-primary
And I will refresh the page
!-- with Intermediate
When I type i1@catch01.tickerontest.com into email input with css selector .form-control
And I wait small timeout
When I click on Next btn with xpath selector //*[@id="pageMenuContainer"]/div[2]/div[2]/div/div[2]/div/div/div/div/div/div/div[3]/div[2]/div/div/div[2]/div[2]/div/button
Then I see toaster with css selector .toast-message is Portfolio '%{portfolioGenerated}' has been offered for sharing to  Mike In.
When I click on Stop sharing btn with css selector span.btn-primary
And I will refresh the page
!-- with Expert
When I type e1@catch01.tickerontest.com into email input with css selector .form-control
When I click on Next btn with xpath selector //*[@id="pageMenuContainer"]/div[2]/div[2]/div/div[2]/div/div/div/div/div/div/div[3]/div[2]/div/div/div[2]/div[2]/div/button
Then I see TickerOn pop-up with css selector .cx-modal-dafault > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) contains: You can’t share a portfolio with this user because portfolios cannot be shared between Beginner and Expert for compliance reasons
When I click on OK btn with css selector button.ng-binding
!-- with Advisor
When I type a1@catch01.tickerontest.com into email input with css selector .form-control
When I click on Next btn with xpath selector //*[@id="pageMenuContainer"]/div[2]/div[2]/div/div[2]/div/div/div/div/div/div/div[3]/div[2]/div/div/div[2]/div[2]/div/button
Then I see TickerOn pop-up with css selector .cx-modal-dafault > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) contains: You can’t share a portfolio with this user because portfolios cannot be shared between Beginner and Advisor for compliance reasons
When I click on OK btn with css selector button.ng-binding
And I wait small timeout
!-- Cancel sharing and check that portfolio has Personal status
When I click on Cancel btn with css selector span.ng_portfolio_topplate_animation:nth-child(5) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(3) > a:nth-child(1)
When I click on Cancel btn with css selector button.ng-scope:nth-child(2)
Then I see Personal Portfolio status with css selector h3.portfolio_page_topplate_zero contains: Personal Portfolio

!-- As Intermediate create investment portfolio and share it with all other levels (Himself, Beginner, other Intermediate, Expert, Advisor)
Scenario:
Setup params. Set user to Intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario:
As Intermediate create investment portfolio and send sharing request to other levels
GivenStories:
      stories/functional/test/portfolio/create_investement_portfolio.story#{name:Create investment porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
!-- with Himself
When I click on Share+ btn with css selector #topPlate_dropdownMenu
When I click on Share portfolio with a friend with css selector li.col-xs-12:nth-child(1) > a:nth-child(1) > div:nth-child(1) > div:nth-child(2) > span:nth-child(2)
When I click on Share btn with css selector span.ng_portfolio_topplate_animation:nth-child(5) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(3) > a:nth-child(1)
When I type i1@catch01.tickerontest.com into email input with css selector .form-control
When I click on Next btn with css selector button[type="submit"]
Then I see TickerOn pop-up with css selector .cx-modal-dafault > div:nth-child(1) contains: You can't send invitation to yourself
When I click on OK btn with css selector button.ng-binding
!-- with Beginner
When I type b1@catch01.tickerontest.com into email input with css selector .form-control
And I wait small timeout
When I click on Next btn with css selector button[type="submit"]
Then I see toaster with css selector .toast-message is Portfolio '%{portfolioGenerated}' has been offered for sharing to  Quan Public
When I click on Stop sharing btn with css selector span.btn-primary
Then I see Want to Share wth Friends?  inscription with css selector .cx_portfolio_topplate_inner_link > div:nth-child(1) contains: Your friend will see your portfolio allocation excluding dollar market value. He/she can share with you their opinion on re-allocations.
!-- with other Intermediate
When I type i1_at@catch01.tickerontest.com into email input with css selector .form-control
And I wait small timeout
When I click on Next btn with xpath selector //*[@id="pageMenuContainer"]/div[2]/div[2]/div/div[2]/div/div/div/div/div/div/div[3]/div[2]/div/div/div[2]/div[2]/div/button
Then I see toaster with css selector .toast-message is Portfolio '%{portfolioGenerated}' has been offered for sharing to  Interm AT
Then I see Request pending status with css selector div.cx_portfolio_topplate_inner_action_link:nth-child(2) > div:nth-child(1) contains: Request pending
When I click on Stop sharing btn with css selector span.btn-primary
!-- with Expert
When I type e1@catch01.tickerontest.com into email input with css selector .form-control
When I click on Next btn with xpath selector //*[@id="pageMenuContainer"]/div[2]/div[2]/div/div[2]/div/div/div/div/div/div/div[3]/div[2]/div/div/div[2]/div[2]/div/button
Then I see TickerOn pop-up with css selector .cx-modal-dafault > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) contains: You can’t share a portfolio with this user because portfolios cannot be shared between Intermediate and Expert for compliance reasons
When I click on OK btn with css selector button.ng-binding
!-- with Advisor
When I type a1@catch01.tickerontest.com into email input with css selector .form-control
When I click on Next btn with xpath selector //*[@id="pageMenuContainer"]/div[2]/div[2]/div/div[2]/div/div/div/div/div/div/div[3]/div[2]/div/div/div[2]/div[2]/div/button
Then I see TickerOn pop-up with css selector .cx-modal-dafault > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) contains: You can’t share a portfolio with this user because portfolios cannot be shared between Intermediate and Advisor for compliance reasons
When I click on OK btn with css selector button.ng-binding
And I wait small timeout
!-- Cancel sharing and check that portfolio has Personal status
When I click on Cancel btn with css selector span.ng_portfolio_topplate_animation:nth-child(5) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(3) > a:nth-child(1)
When I click on Cancel btn with css selector button.ng-scope:nth-child(2)
Then I see Personal Portfolio status with css selector h3.portfolio_page_topplate_zero contains: Personal Portfolio

!-- As Expert create diversified-trading portfolio and share it with all other levels (Himself, Beginner, Intermediate, other Expert, Advisor)
Scenario:
Setup params. Set user to Expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario:
As Expert create diversified-trading portfolio and send sharing request to other levels
GivenStories:
      stories/functional/test/portfolio/create_diversified_trading_portfolio.story#{name:Create diversified trading porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
!-- with Himself
When I click on Share+ btn with css selector #topPlate_dropdownMenu
When I click on Share portfolio with a friend with css selector li.col-xs-12:nth-child(1) > a:nth-child(1) > div:nth-child(1) > div:nth-child(2) > span:nth-child(2)
When I click on Share btn with css selector span.ng_portfolio_topplate_animation:nth-child(5) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(3) > a:nth-child(1)
When I type e1@catch01.tickerontest.com into email input with css selector .form-control
When I click on Next btn with css selector button[type="submit"]
Then I see TickerOn pop-up with css selector .cx-modal-dafault > div:nth-child(1) contains: You can't send invitation to yourself
When I click on OK btn with css selector button.ng-binding
!-- with Beginner
When I type b1@catch01.tickerontest.com into email input with css selector .form-control
And I wait small timeout
When I click on Next btn with xpath selector //*[@id="pageMenuContainer"]/div[2]/div[2]/div/div[2]/div/div/div/div/div/div/div[3]/div[2]/div/div/div[2]/div[2]/div/button
Then I see TickerOn pop-up with css selector .cx-modal-dafault > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) contains: You can’t share a portfolio with this user because portfolios cannot be shared between Expert and Beginner for compliance reasons
When I click on OK btn with css selector button.ng-binding
!-- with Intermediate
When I type i1@catch01.tickerontest.com into email input with css selector .form-control
And I wait small timeout
When I click on Next btn with xpath selector //*[@id="pageMenuContainer"]/div[2]/div[2]/div/div[2]/div/div/div/div/div/div/div[3]/div[2]/div/div/div[2]/div[2]/div/button
Then I see TickerOn pop-up with css selector .cx-modal-dafault > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) contains: You can’t share a portfolio with this user because portfolios cannot be shared between Expert and Intermediate for compliance reasons
When I click on OK btn with css selector button.ng-binding
!-- with other Expert
When I type ca_e@catch01.tickerontest.com into email input with css selector .form-control
When I click on Next btn with xpath selector //*[@id="pageMenuContainer"]/div[2]/div[2]/div/div[2]/div/div/div/div/div/div/div[3]/div[2]/div/div/div[2]/div[2]/div/button
Then I see toaster with css selector .toast-message is Portfolio '%{portfolioGenerated}' has been offered for sharing to  ContAdmin_Expert
When I click on Stop sharing btn with css selector span.btn-primary
!-- with Advisor
When I type a1@catch01.tickerontest.com into email input with css selector .form-control
When I click on Next btn with xpath selector //*[@id="pageMenuContainer"]/div[2]/div[2]/div/div[2]/div/div/div/div/div/div/div[3]/div[2]/div/div/div[2]/div[2]/div/button
Then I see TickerOn pop-up with css selector .cx-modal-dafault > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) contains: You can’t share a portfolio with this user because portfolios cannot be shared between Expert and Advisor for compliance reasons
When I click on OK btn with css selector button.ng-binding
And I wait small timeout
!-- Cancel sharing and check that portfolio has Personal status
When I click on Cancel btn with css selector span.ng_portfolio_topplate_animation:nth-child(5) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(3) > a:nth-child(1)
When I click on Cancel btn with css selector button.ng-scope:nth-child(2)
Then I see Personal Portfolio status with css selector h3.portfolio_page_topplate_zero contains: Personal Portfolio

!-- As Advisor create non-diversified-trading portfolio and share it with all other levels (Himself, Beginner, Intermediate, Expert, other Advisor)
Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario:
As Advisor create non-diversified-trading portfolio and send sharing request to other levels
GivenStories:
   stories/functional/test/portfolio/create_non_diversified_trading_portfolio.story#{name:Create non diversified trading porfolio}
Given Do nothing
Given I logged in with %{username} and %{password}
When Portfolio. I find portfolio %{portfolioGenerated}
!-- with Himself
When I click on Share+ btn with css selector #topPlate_dropdownMenu
When I click on Share portfolio with a friend with css selector li.col-xs-12:nth-child(1) > a:nth-child(1) > div:nth-child(1) > div:nth-child(2) > span:nth-child(2)
When I click on Share btn with css selector span.ng_portfolio_topplate_animation:nth-child(5) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(3) > a:nth-child(1)
When I type a1@catch01.tickerontest.com into email input with css selector .form-control
When I click on Next btn with xpath selector //*[@id="pageMenuContainer"]/div[2]/div[2]/div/div[2]/div/div/div/div/div/div/div[3]/div[2]/div/div/div[2]/div[2]/div/button
Then I see TickerOn pop-up with css selector .cx-modal-dafault > div:nth-child(1) contains: You can't send invitation to yourself
When I click on OK btn with css selector button.ng-binding
!-- with Beginner
When I type b1@catch01.tickerontest.com into email input with css selector .form-control
And I wait small timeout
When I click on Next btn with xpath selector .//*[@id="pageMenuContainer"]/div[2]/div[2]/div/div[2]/div/div/div/div/div/div/div[3]/div[2]/div/div/div[2]/div[2]/div/button
Then I see TickerOn pop-up with css selector .cx-modal-dafault > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) contains: You can’t share a portfolio with this user because portfolios cannot be shared between Advisor and Beginner for compliance reasons
When I click on OK btn with css selector button.ng-binding
!-- with Intermediate
When I type i1@catch01.tickerontest.com into email input with css selector .form-control
And I wait small timeout
When I click on Next btn with xpath selector //*[@id="pageMenuContainer"]/div[2]/div[2]/div/div[2]/div/div/div/div/div/div/div[3]/div[2]/div/div/div[2]/div[2]/div/button
Then I see TickerOn pop-up with css selector .cx-modal-dafault > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) contains: You can’t share a portfolio with this user because portfolios cannot be shared between Advisor and Intermediate for compliance reasons
When I click on OK btn with css selector button.ng-binding
!-- with Expert
When I type e1@catch01.tickerontest.com into email input with css selector .form-control
When I click on Next btn with xpath selector //*[@id="pageMenuContainer"]/div[2]/div[2]/div/div[2]/div/div/div/div/div/div/div[3]/div[2]/div/div/div[2]/div[2]/div/button
Then I see TickerOn pop-up with css selector .cx-modal-dafault > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) contains: You can’t share a portfolio with this user because portfolios cannot be shared between Advisor and Expert for compliance reasons
When I click on OK btn with css selector button.ng-binding
!-- with other Advisor
When I type a1_at@catch01.tickerontest.com into email input with css selector .form-control
When I click on Next btn with xpath selector //*[@id="pageMenuContainer"]/div[2]/div[2]/div/div[2]/div/div/div/div/div/div/div[3]/div[2]/div/div/div[2]/div[2]/div/button
Then I see toaster with css selector .toast-message is Portfolio '%{portfolioGenerated}' has been offered for sharing to  Advisor AT
And I wait small timeout
!-- Cancel sharing and check that portfolio has Personal status
When I click on Stop sharing btn with css selector span.btn-primary
When I click on Cancel btn with css selector span.ng_portfolio_topplate_animation:nth-child(5) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(3) > a:nth-child(1)
When I click on Cancel btn with css selector button.ng-scope:nth-child(2)
Then I see Personal Portfolio status with css selector h3.portfolio_page_topplate_zero contains: Personal Portfolio
