Story: Functional CRUD question

Scenario:
Setup params. Set user to Beginner
Given Set test param username value from property param.beginner.username
And Set test param password value from property param.beginner.password
And I generate Q_ + UUID and put it to test param questionTitle

Scenario: Login as Beginner
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing

Scenario: Create question
Meta:
@name Create question
Given request body:
{"request": {QuestionTitle: "%{questionTitle}", QuestionHtml: "<p>Plain text</p>↵"}}
When I perform POST request to api/CxQuestionsAndAnswers/PostQuestion
Then response has status 200
And I save JSON field value using groovy query it["QuestionId"] into variable QuestionId

Scenario:
Setup params. Set user to ca
Given Set test param username value from property param.contentadmin.username
And Set test param password value from property param.contentadmin.password

Scenario: Login as cont admin
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing

Scenario: Approve question
Meta:
@name Approve question
Given request body:
{"Type":"Question","Id":%{QuestionId}}
When I perform POST request to api/CxModeration/Approve
Then response has status 204

Scenario:
Setup params. Set user to Beginner
Given Set test param username value from property param.beginner.username
And Set test param password value from property param.beginner.password

Scenario: Login as Beginner
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing

Scenario: Get question
Given request body:
{questionId: "%{QuestionId}"}
When I perform POST request to api/CxQuestionsAndAnswers/GetQuestion
Then response has status 200
And I save JSON field AskedAtTime value into variable AskedAtTime
And response JSON body is:
{
  "Id": %{QuestionId},
  "Title": "%{questionTitle}",
  "AuthorId": 146,
  "AskedAtTime": "%{AskedAtTime}",
  "Html": "<p>Plain text</p>↵",
  "AnswersCount": 0,
  "Answers": []
}

Scenario: Edit question
Given request body:
{request: {QuestionId: %{QuestionId}, NewTitle: "Question #2", NewHtml: "<p>New plain text after update</p>↵"}}
When I perform POST request to api/CxQuestionsAndAnswers/UpdateQuestion
Then response has status 204

Scenario: Get quetion after edit
Given request body:
{questionId: "%{QuestionId}"}
When I perform POST request to api/CxQuestionsAndAnswers/GetQuestion
Then response has status 200
And I save JSON field AskedAtTime value into variable AskedAtTime
And response JSON body is:
{
  "Id": %{QuestionId},
  "Title": "Question #2",
  "AuthorId": 146,
  "AskedAtTime": "%{AskedAtTime}",
  "Html": "<p>New plain text after update</p>↵",
  "AnswersCount": 0
}

Scenario: Get last questions
Meta:
@name Get last questions
Given request body:
{
    "request":{"Offset":0,"PageSize":10}
}
When I perform POST request to api/CxIExpert/GetLatestQuestions
Then response has status 200
And response JSON body satisfies condition:
it.size() > 0

Scenario: Delete question
Meta:
@name Delete question
Given request body:
{questionId: %{QuestionId}}
When I perform POST request to api/CxQuestionsAndAnswers/DeleteQuestion
Then response has status 204
