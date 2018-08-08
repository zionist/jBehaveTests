Story: Community -> Your page -> Clubs

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate _Club + UUID and put it to test param clubTitleGenerated
And I generate Discription + UUID and put it to test param clubDescriptionGenerated
And I generate Personal + UUID and put it to test param portfolioGenerated

Scenario:
Community -> Your page -> Clubs
GivenStories:
    stories/community/clubs/cred_club.story#{name:create club}
When I open COMMUNITY menu
And I click on Investors club menu item with css selector #community__menu__investment-clubs-link
And I wait until service ready
!-- Click on last club in clubs list
!-- And I execute javascript $(".social-page-content > div:nth-child(3) > div.ng-scope").first().find("div.cx-avatar").click()
And I execute javascript $("div.club-card__text:contains('%{clubDescriptionGenerated}')").click()
And I wait until service ready
Then I see page titile with css selector h1.ng-binding is %{clubTitleGenerated}
And I see club description with css selector p.ng-binding is %{clubDescriptionGenerated}

