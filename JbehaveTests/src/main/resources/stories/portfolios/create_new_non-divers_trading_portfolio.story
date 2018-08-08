Story: create new non-diversified trading portfolio

Narrative:
As a user

I want to create a new non-diversified trading portfolio

Scenario:
Setup params set user to advisor
Given Set test param username value from property param.expert.username
And Set test param password value from property param.expert.password
And I generate Personal + UUID and put it to test param portfolioGenerated


Scenario: create a new non-diversified trading portfolio
Meta:
@name create a new non-diversified trading portfolio
Given I logged in with %{username} and %{password}
When I open HOME menu
And I open portfolios block
And I wait until service ready
And I click on Create New button with css selector a.btn
And I wait until service ready
Then I see Create portfolio page header with css selector .cx-create-portfolio-title-block contains: Create Portfolio
When I type %{portfolioGenerated} into Portfolio title with css selector #input_title
!-- Next -> next -> next
And I click on NEXT button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait small timeout
And I click on NEXT button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait until service ready
Then I see pop up window with css selector h3.modal-title > b:nth-child(1) contains: Attention! For retirement accounts
When I click on Proceed as is with css selector button.btn-primary:nth-child(2)
And I wait until service ready
And I click on NEXT button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait small timeout
!-- CLick
And I click on Less than 3 month with css selector .cx-portfolio-edit-settings__strategy-trading > label:nth-child(1) > span:nth-child(2)
!-- Let's fill wizard
And I type Not Important into Diversification  with css selector .cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > select:nth-child(1)
And I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > select:nth-child(1)").change()
And I type Non-retirement into type with css selector .cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(4) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)
And I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(4) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)").change()
And I wait small timeout
And I type AK, Alaska into type with css selector .cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)
And I execute javascript $(".cx-portfolio-edit-settings > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > cx-portfolio-create-edit-header:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(2) > span:nth-child(1) > select:nth-child(1)").change()
And I wait small timeout

!-- Press finish button
And I click on finish button with css selector div.cx-idea__header_btn:nth-child(3)
And I wait until service ready
Then I see Portfolio title with css selector p.cx-breadcrumbs:nth-child(2) > span:nth-child(3) > a:nth-child(1) is %{portfolioGenerated}
Then I see  Non-Diversified ― Trading strategy with css selector h6.col-xs-12 is Non-Diversified ― Trading
Then I see Portfolio is Personal with css selector h3.portfolio_page_topplate_zero contains: Personal Portfolio


