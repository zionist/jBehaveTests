Story: Create, edit and delete question and answer1234

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate _Question + UUID and put it to test param questionGenerated
And I generate Some text + UUID and put it to test param textGenerated


Scenario:
Create question
Meta:
@name Create question
Given I logged in with %{username} and %{password}
!-- Open IExpert menu
When I open IEXPERT menu
!-- And I execute javascript $("a[href*='/app/academy#!/iexpert/index']").click()
!-- Click on "Ask an expert now" button
And I click on button 'Ask an expert now' with css selector button.btn:nth-child(3)
And I wait until service ready
And I clear the field question title with css selector #question
And I type %{questionGenerated} into field question title with css selector #question
!-- Add some text
And I execute javascript CKEDITOR.instances.questionText.setData("%{textGenerated}");
And I wait until service ready
And I execute javascript $("button[ng-click='postQuestion()']").click()
And I wait until service ready
Then I see question title with css selector h1.col-sm-8 is %{questionGenerated}

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.contentadmin.username
Given Set test param password value from property param.contentadmin.password

Scenario:
As CONTENT ADMIN Approve question
Meta:
@name As CONTENT ADMIN Approve question
!-- Open blog page
Given I logged in with %{username} and %{password}
When I open CONTENT ADMIN menu
And I click on Moderate user content with css selector li.list-group-item:nth-child(7) > a:nth-child(1)
And I wait until service ready
Then I see header of page with css selector h1.ng-binding contains: Moderate
When I click on moderate icon with css selector button.btn-link
And I wait until service ready
!-- And I click on button Approve with containsText selector Approve
And I click on button Approve with css selector button[ng-click='approve()']
Then I see toaster with css selector .toast-message contains: Done!

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Edit question
Meta:
@name Edit question
!-- Edit question
Given I logged in with %{username} and %{password}
When I open COMMUNITY menu
!-- Open blog page
When I click on blog left menu with css selector #community__menu__qa-link
And I click on second tab with css selector .nav-tabs > li:nth-child(2) > a:nth-child(1)
And I click on question with containsText selector %{questionGenerated}
When I click on edit link with css selector .btn-edit-icon
And I wait until service ready
And I will refresh the page
And I wait until service ready
And I clear the field question title with css selector #question
And I type Edited title %{questionGenerated} into field question title with css selector #question
And I wait small timeout
And I execute javascript CKEDITOR.instances.questionText.setData("Edited text");
And I wait small timeout
And I wait until service ready
And I execute javascript $("button[ng-click='updateQuestion(askForm)']").click()
!-- And I click on button 'Ask now' with css selector .rich-text-editor > div:nth-child(4) > button:nth-child(1)
And I wait until service ready
Then I see No answers with css selector h2.ng-scope contains: No answers
!-- Then I see edited title with css selector h1.col-sm-8 contains: Edited
!-- Then I see edited title with css selector h1.col-sm-8 contains: %{questionGenerated}


Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.contentadmin.username
Given Set test param password value from property param.contentadmin.password

Scenario:
As CONTENT ADMIN Approve edited question
Meta:
@name As CONTENT ADMIN Approve edited question
!-- Open blog page
Given I logged in with %{username} and %{password}
When I open COMMUNITY menu
And I open CONTENT ADMIN menu
And I click on Moderate user content with css selector li.list-group-item:nth-child(7) > a:nth-child(1)
And I wait until service ready
Then I see header of page with css selector h1.ng-binding contains: Moderate
When I click on moderate icon with css selector button.btn-link
And I wait until service ready
!-- And I click on button Approve with containsText selector Approve
And I click on button Approve with css selector button[ng-click='approve()']
Then I see toaster with css selector .toast contains: Done!

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario:
Create answer
Meta:
@name Create answer
!-- Create answer
Given I logged in with %{username} and %{password}
When I open COMMUNITY menu
!-- Open blog page
When I click on blog left menu with css selector #community__menu__qa-link
And I click on second tab with css selector .nav-tabs > li:nth-child(2) > a:nth-child(1)
And I click on blog with containsText selector Edited title %{questionGenerated}
When I click on button answer with css selector .member-qa-answer-button > button:nth-child(1)
And I wait until service ready
And I execute javascript CKEDITOR.instances.answerHtml.setData("New Answer")
And I click on 'Add answer' button with css selector div.form-group:nth-child(3) > button:nth-child(1)
And I wait until service ready
Then I see new answer with css selector .question-view__col-answer-content > div:nth-child(2) > div:nth-child(1) is New Answer


Scenario:
Edit answer
Meta:
@name Edit answer
!-- Edit answer
When I click on 'Edit answer' icon with css selector div.social-article__time:nth-child(3) > a:nth-child(1)
And I wait until service ready
And I execute javascript CKEDITOR.instances.answerHtml.setData("Edited Answer")
And I click on 'Add answer' button with css selector div.form-group:nth-child(3) > button:nth-child(1)
And I wait until service ready
Then I see edited answer with css selector .question-view__col-answer-content > div:nth-child(2) > div:nth-child(1) is Edited Answer

Scenario:
Remove answer
Meta:
@name Remove answer
!-- Remove answer and click on NO
When I click on delete link with css selector a.btn-delete-icon:nth-child(2)
And I click on No button with css selector button.ng-binding:nth-child(2)
And I wait small timeout
!-- Remove answer and click on YES
When I click on delete link with css selector a.btn-delete-icon:nth-child(2)
And I click on Yes button with css selector button.ng-binding:nth-child(1)
And I wait big timeout
Then I see No answers with css selector h2.ng-scope contains: No answers


Scenario:
Remove question
Meta:
@name Remove question
!-- Remove Question click on NO
When I click on delete link with css selector .btn-delete-icon
And I click on No button with css selector button.ng-binding:nth-child(2)
And I wait small timeout
!-- Remove Question click on YES
When I click on delete link with css selector .btn-delete-icon
And I click on YES button with css selector button.ng-binding:nth-child(1)
And I wait until service ready
Then I see Questions & Answers with css selector .social-title > h1:nth-child(1) is Questions & Answers


Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
And Set test param password value from property param.expert.password

Scenario:
Create/edit/remove Q&A as expert user
GivenStories:
    stories/iexpert/create_edit_remove_question_answer.story#{name:Create question}
Given Do nothing

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.contentadmin.username
Given Set test param password value from property param.contentadmin.password

Scenario:
Create/edit/remove Q&A as expert user As CONTENT ADMIN Approve question
GivenStories:
    stories/iexpert/create_edit_remove_question_answer.story#{name:As CONTENT ADMIN Approve question}
Given Do nothing

Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
And Set test param password value from property param.expert.password

Scenario:
Create/edit/remove Q&A as expert user
GivenStories:
    stories/iexpert/create_edit_remove_question_answer.story#{name:Edit question}
Given Do nothing


Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.contentadmin.username
Given Set test param password value from property param.contentadmin.password

Scenario:
Create/edit/remove Q&A as expert user As CONTENT ADMIN Approve edited question
GivenStories:
    stories/iexpert/create_edit_remove_question_answer.story#{name:As CONTENT ADMIN Approve edited question}
Given Do nothing


Scenario:
Setup params. Set user to expert
Given Set test param username value from property param.expert.username
And Set test param password value from property param.expert.password

Scenario:
Create/edit/remove Q&A as expert user
GivenStories:
    stories/iexpert/create_edit_remove_question_answer.story#{name:Create answer},
    stories/iexpert/create_edit_remove_question_answer.story#{name:Edit answer},
    stories/iexpert/create_edit_remove_question_answer.story#{name:Remove answer},
    stories/iexpert/create_edit_remove_question_answer.story#{name:Remove question},
Given Do nothing
