Story: Community -> Your page -> Q and A

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate _Question  + UUID and put it to test param questionGenerated
And I generate Some text + UUID and put it to test param textGenerated


Scenario:
Check overview -> Your page -> Q and A
Meta:
@Name Check overview -> Your page -> Q and A
GivenStories:
   stories/iexpert/create_edit_remove_question_answer.story#{name:Create question}
Given Do nothing

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.contentadmin.username
Given Set test param password value from property param.contentadmin.password

Scenario:
Approve question
Meta:
@Name Approve question
GivenStories:
   stories/iexpert/create_edit_remove_question_answer.story#{name:As CONTENT ADMIN Approve question}
Given Do nothing

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario:
Check overview -> Your page -> Q and A2
Meta:
@Name Check overview -> Your page -> Q and A2

Given I logged in with %{username} and %{password}
When I open COMMUNITY menu
!-- When I click on overview page with css selector .cx-content-menu__icon__overview
And I wait until service ready
Then I see header with css selector .hide-on-less-than-1280px contains: James Adv.
When I click on q and A menu link with css selector #community__menu__qa-link
And I wait small timeout
Then I see page header with css selector .social-title > h1:nth-child(1) is: Questions & Answers
When I click on Question asked with css selector .nav-tabs > li:nth-child(2) > a:nth-child(1)
And I wait small timeout
Then I see last question header with css selector div.social-article:nth-child(1) > div:nth-child(2) > h4:nth-child(1) is: %{questionGenerated}
Then I see last question header with css selector div.social-article:nth-child(1) > div:nth-child(2) > p:nth-child(2) is: %{textGenerated}


