Story: Make sure that client after sending Connection Request can cancel it

Scenario:
Setup params. Set user to Expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario:
Login as Expert

GivenStories:
    stories/functional/test/login/login.story#{name:Login},
    stories/functional/test/advisor_client/client_search_advisor.story#{name:Find Advisors},
Given Do nothing

Scenario: Click on Select
Given request body:
{
  "user1Id": %{user1Id},
  "user2Id": %{user2Id}
}
When I perform POST request to api/CxAdvisorClientNew/GetConnection
Then response has status 200
!-- user1Id = 161 (expert)
!-- user2Id = 159 (advisor)

Scenario: api/CxMember/GetSubscription
Given request body:
{
  "targetId": 159
}
When I perform POST request to api/CxMember/GetSubscription
Then response has status 200
And I save JSON field value using groovy query it["SourceUserId"] into variable user1Id
And I save JSON field value using groovy query it["TargetUserId"] into variable user2Id
!-- And I save JSON field value using groovy query it["Id"] into variable Id
And response JSON body satisfies condition:
[
  "Id": 0,
  "SourceUserId": %{user1Id},
  "TargetUserId": %{user2Id},
  "SourceUser": null,
  "TargetUser": null,
  "NotifyArticle": false,
  "NotifyAnswer": false,
  "NotifyBlogPost": false,
  "NotifyMall": false,
  "NotifyPrediction": false,
  "NotifyClub": false,
  "NotifyBroadcast": false
] == it

Scenario: Cancel Request
Given request body:
{
  "toId": %{user2Id},
  "isExternal": false
}
When I perform POST request to api/CxAdvisorClientNew/CancelConnectionRequest
Then response has status 200
And I save JSON field value using groovy query it["Id"] into variable connectionId
And I save JSON field value using groovy query it["SearchingMemberId"] into variable SearchingMemberId
And I save JSON field value using groovy query it["UpdatedOn"] into variable UpdatedOn
And response JSON body satisfies condition:

it["Id"] == %{connectionId} &&
it["Status"] == "ConnectionRequest" &&
it["SearchingMemberId"] == %{SearchingMemberId} &&
it["AdvisorId"] == %{user1Id} &&
it["BidId"] == null &&
it["LastActionInitiatorId"] == %{user1Id} &&
it["UpdatedOn"] == "%{UpdatedOn}" &&
it["TermsId"] == null &&
it["StripePlanId"] == null

