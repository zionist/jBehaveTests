Story: Functional CRUD answer

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
And Set test param password value from property param.advisor.password
And I generate anwser_ + UUID and put it to test param anwserGeneratedName
And I generate answerAlias_ + UUID and put it to test param anwserGeneratedAlias

Scenario:
Login
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing


Scenario: Create question
GivenStories:
    stories/functional/test/iexpert/crud_question.story#{name:Create question},
Given Do nothing

Scenario: Post answer
Given request body:
{"request":{"QuestionId":"%{QuestionId}","AnswerHtml":"<p>qweqweqwe</p>\n"}}
When I perform POST request to api/CxQuestionsAndAnswers/PostAnswer
Then response has status 204
And response body is empty

Scenario: Get answer
Given request body:
{"questionId": "%{QuestionId}"}
When I perform POST request to api/CxQuestionsAndAnswers/GetAllAnswers
Then response has status 200
And I save JSON field value using groovy query it[0]["AnsweredAtTime"] into variable AnsweredAtTime
And I save JSON field value using groovy query it[0]["Id"] into variable Id
And I save JSON field value using groovy query it[0]["Author"]["Avatar"]["ImageUrl"] into variable ImageUrl
And I save JSON field value using groovy query it[0]["Author"]["Avatar"]["BaseColorHex"] into variable BaseColorHex
And I save JSON field value using groovy query it[0]["Author"]["Avatar"]["DarkColorHex"] into variable DarkColorHex
And response JSON body is:
[
  {
    "Id": %{Id},
    "Author": {
      "Id": 159,
      "Name": "James Adv.",
      "Avatar": {
        "Mode": "Initials",
        "ImageUrl": "%{ImageUrl}",
        "BaseColorHex": "%{BaseColorHex}",
        "DarkColorHex": "%{DarkColorHex}",
        "Initials": "J"
      },
      "Level": "Advisor"
    },
    "AnsweredAtTime": "%{AnsweredAtTime}",
    "Html": "<p>qweqweqwe<\/p>\n"
  }
]


Scenario: GetMyAnswer
Given request body:
{"questionId": "%{QuestionId}"}
When I perform POST request to api/CxQuestionsAndAnswers/GetMyAnswer
Then response has status 200
And I save JSON field value using groovy query it["AnsweredAtTime"] into variable AnsweredAtTime
And I save JSON field value using groovy query it["Author"]["Avatar"]["ImageUrl"] into variable ImageUrl
And I save JSON field value using groovy query it["Author"]["Avatar"]["BaseColorHex"] into variable BaseColorHex
And I save JSON field value using groovy query it["Author"]["Avatar"]["DarkColorHex"] into variable DarkColorHex
And response JSON body is:
  {
    "Id": %{Id},
    "Author": {
      "Id": 159,
      "Name": "James Adv.",
      "Avatar": {
        "Mode": "Initials",
        "ImageUrl": "%{ImageUrl}",
        "BaseColorHex": "%{BaseColorHex}",
        "DarkColorHex": "%{DarkColorHex}",
        "Initials": "J"
      },
      "Level": "Advisor"
    },
    "AnsweredAtTime": "%{AnsweredAtTime}",
    "Html": "<p>qweqweqwe<\/p>\n"
  }


Scenario: Edit answer
Given request body:
{"request":{"QuestionId":"%{QuestionId}","AnswerHtml":"<p>qweqweqwe2</p>\n"}}
When I perform POST request to api/CxQuestionsAndAnswers/PostAnswer
Then response has status 204
And response body is empty

Scenario: get answer
Given request body:
{"questionId": "%{QuestionId}"}
When I perform POST request to api/CxQuestionsAndAnswers/GetAllAnswers
Then response has status 200
And I save JSON field value using groovy query it[0]["AnsweredAtTime"] into variable AnsweredAtTime
And I save JSON field value using groovy query it[0]["Id"] into variable Id1
And I save JSON field value using groovy query it[0]["Author"]["Id"] into variable Id2
And I save JSON field value using groovy query it[0]["Author"]["Name"] into variable Name
And I save JSON field value using groovy query it[0]["Author"]["Avatar"]["Mode"] into variable Mode
And I save JSON field value using groovy query it[0]["Author"]["Avatar"]["ImageUrl"] into variable ImageUrl
And I save JSON field value using groovy query it[0]["Author"]["Avatar"]["BaseColorHex"] into variable BaseColorHex
And I save JSON field value using groovy query it[0]["Author"]["Avatar"]["DarkColorHex"] into variable DarkColorHex
And response JSON body satisfies condition:
[
  [
    "Id": %{Id1},
    "Author": [
          "Id": %{Id2},
          "Name": "%{Name}",
          "Avatar": [
            "Mode": "%{Mode}",
            "ImageUrl": "%{ImageUrl}",
            "BaseColorHex": "%{BaseColorHex}",
            "DarkColorHex": "%{DarkColorHex}",
            "Initials": "J",
          ],
          "Level": "Advisor"
    ],
    "AnsweredAtTime": "%{AnsweredAtTime}",
    "Html": "<p>qweqweqwe2</p>\n"
  ]
] == it


Scenario: Delete Answer
Meta:
@name Delete answer
Given request body:
{"questionId":%{QuestionId}}
When I perform POST request to api/CxQuestionsAndAnswers/DeleteAnswer
Then response has status 204


Scenario: Create question
GivenStories:
    stories/functional/test/iexpert/crud_question.story#{name:Delete question},
Given Do nothing