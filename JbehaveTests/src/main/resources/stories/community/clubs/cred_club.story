Story: Community - Clubs - Create club

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Club + UUID and put it to test param clubTitleGenerated
And I generate UUID + _desciption and put it to test param clubDescriptionGenerated
And I generate Personal + UUID and put it to test param portfolioGenerated


Scenario: create club
Meta:
@name create club
GivenStories:
    stories/functional/test/portfolio/create_investement_portfolio.story#{name:Create investment porfolio},
Given I logged in with %{username} and %{password}
When I open COMMUNITY - Clubs menu
When I click on create club button with css selector button.btn-secondary:nth-child(1)
And I wait until service ready
Then I see head with css selector .community__header is: Create Investors Club
And I wait small timeout
When I type %{clubTitleGenerated} into Club Title with css selector #title
And I type %{portfolioGenerated} into Select field with css selector #portfolio
And I execute javascript $("#portfolio").change()
And I wait small timeout
And I type %{clubDescriptionGenerated} into description with css selector #description
And I wait small timeout
And I click on upload file with css selector .club-create__avatar-editor > div:nth-child(1) > a:nth-child(3) > strong:nth-child(1)
And I wait small timeout
And I click on close window with css selector button.btn-secondary:nth-child(1)
And I wait small timeout
When I execute javascript scroll(1050, 700)
And I wait small timeout
When I click on create club with css selector .col-xs-offset-3 > button:nth-child(1)
And I wait until service ready
Then I see H1 Manage Club with css selector .community__header contains: Manage Club



Scenario: update club
Meta:
@name update club
Given I logged in with %{username} and %{password}
!-- Open clubs page
When I open COMMUNITY - Clubs menu
!-- Find club
Then I see head with css selector .cx-misc-tooltip-activator > span:nth-child(1) > span:nth-child(1) contains: Clubs
And I wait small timeout
When I click on filter mine with css selector label.cx-checkbox:nth-child(2) > span:nth-child(2)
And I wait small timeout
And I type %{clubDescriptionGenerated} into Clubs saerch input with css selector #community__clubs__search-by-title-input
And I wait small timeout
!-- Open club. Update it
And I click on club title with css selector .club-card__header
And I wait until service ready
And I click on Manage club menu item with css selector #community__clubss__manage-club-link
And I wait until service ready
And Set test param clubTitleGenerated with value changed_%{clubTitleGenerated}
And I clear the Club title input with css selector #title
And I type %{clubTitleGenerated} into Club title input with css selector #title
And I wait small timeout
And Set test param clubDescriptionGenerated with value changed_%{clubDescriptionGenerated}
And I execute javascript CKEDITOR.instances.description.setData("%{clubDescriptionGenerated}")
And I click on private radio with css selector .club-create__form-radio_border > label:nth-child(3) > span:nth-child(2)
And I click on owner only radio with css selector div.row:nth-child(5) > div:nth-child(2) > label:nth-child(3) > span:nth-child(2)
When I click on save button with css selector .club-manage__underline > button:nth-child(1)
And I wait small timeout
And I click on portfolio grey title link with css selector .cx-breadcrumbs > a:nth-child(3)
And I wait until service ready
!-- Check club is updated
Then I see Club title with css selector h1.ng-binding contains: %{clubTitleGenerated}
And I see Club desciption with css selector p.ng-binding > p:nth-child(1) is: %{clubDescriptionGenerated}

Scenario: remove club
Meta:
@name remove club
Given I logged in with %{username} and %{password}
When I open COMMUNITY - Clubs menu
Then I see head with css selector .cx-misc-tooltip-activator > span:nth-child(1) > span:nth-child(1) contains: Clubs
And I wait small timeout
When I click on filter mine with css selector label.cx-checkbox:nth-child(2) > span:nth-child(2)
And I wait small timeout
!-- And I click on club title with link selector %{clubTitleGenerated}
And I type %{clubDescriptionGenerated} into Clubs saerch input with css selector #community__clubs__search-by-title-input
And I wait small timeout
And I click on club title with css selector .club-card__header
When I wait until service ready
And I click on manage club in left side menu with css selector .cx-content-menu__icon__manage
Then I see head with css selector .community__header contains: Manage Club
When I click on remove button with css selector .btn-delete
And I wait small timeout
And I click on yes with css selector button.ng-binding:nth-child(1)



