Story: Make sure that client may be visible for advisor.

Scenario:
Setup params. Set user to Expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario:
Login as Expert

GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing

Scenario: Get deafult
Meta:
@name View and edit request form
Given request body is empty
When I perform POST request to api/CxAdvisorClientNew/GetDefaultReviewRequest
Then response has status 200
And I save JSON field value using groovy query it["Id"] into variable reviewRequestId
And I save JSON field value using groovy query it["Date"] into variable Date
And I save JSON field value using groovy query it["Text"] into variable Text
And I save JSON field value using groovy query it["UserId"] into variable User2Id
And response JSON body is:
{
  "Id": %{reviewRequestId},
  "Text": "%{Text}",
  "NeedAdvice": true,
  "NeedMoneyManagement": true,
  "Date": "%{Date}",
  "UserId": %{User2Id}
}

Scenario: Client makes himself visible for advisor
Meta:
@name Visible for advisor
Given request body:
{"reviewRequestId":%{reviewRequestId},"excludeCurrentAdvisor":true}
When I perform POST request to api/CxAdvisorClientNew/MakeMeVisible
Then response has status 200

Scenario: Client makes himself invisible for advisor
Meta:
@name invisible for advisor
Given request body is empty
When I perform POST request to api/CxAdvisorClientNew/MakeMeInvisible
Then response has status 204

