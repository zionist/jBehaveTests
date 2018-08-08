Story: Functional- full connection

Scenario:
Setup params. Set user to begginer
Given Set test param username value from property param.beginner.username
Given Set test param password value from property param.beginner.password

Scenario: Connect credit card
GivenStories:
    stories/1stripe/connect_cc_to_stripe.story#{name:Connect credit card},
Given Do nothing

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario: Connect Stripe account
GivenStories:
    stories/1stripe/connect_cc_to_stripe.story#{name:Connect Stripe account},
Given Do nothing

Scenario:
Setup params. Set user to Beginner
Given Set test param username value from property param.beginner.username
And Set test param password value from property param.beginner.password

Scenario: Make visible
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
    stories/functional/test/advisor_client/client_visible_for_advisor.story#{name:View and edit request form},
    stories/functional/test/advisor_client/client_visible_for_advisor.story#{name:Visible for advisor},
Given Do nothing

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate _Title + UUID and put it to test param titleGenerated
And I generate _Title_Edit + UUID and put it to test param titleGeneratedEdit
And Set test param TermsText with value Test terms sample text
And Set test param TermsComment with value Comment for test terms
And Set test param TermsTextEdit with value Test terms sample text after edit
And Set test param TermsCommentEdit with value Comment for test terms after edit

Scenario: Login Create TandC
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
    stories/functional/test/advisor_client/t_and_c_crud_pdf_default_search.story#{name:Create TandC default},
Given Do nothing


Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario: api/CxMember/GetSubscription
Meta:
@name GetSubscription
Given request body:
{
  "targetId": 146
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



Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario: Login
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing

Scenario: Click on Select
Meta:
@name Click on Select
Given request body:
{
  "user1Id": %{user1Id},
  "user2Id": %{User2Id}
}
When I perform POST request to api/CxAdvisorClientNew/GetConnection
Then response has status 200

Scenario: Send connection. As Advisor click on "Connect" button
Meta:
@name Send connection. As Advisor click on "Connect" button
!-- %{User2Id}
Given request body:
{
  "toId": %{User2Id},
  "isExternal": false
}
When I perform POST request to api/CxAdvisorClientNew/SendConnectionRequest
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

Scenario:
Setup params. Set user to Beginner
Given Set test param username value from property param.beginner.username
And Set test param password value from property param.beginner.password

Scenario: Overview page
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing

Scenario: Accept connection account as client
Meta:
@name Accept connection account as client
Given request body:
{"connectionId":%{connectionId}}
When I perform POST request to api/CxAdvisorClientNew/AcceptConnectionRequest
Then response has status 200
And I save JSON field value using groovy query it["LastActionInitiatorId"] into variable user2Id
And I save JSON field value using groovy query it["UpdatedOn"] into variable UpdatedOn
!-- And I save JSON field value using groovy query it["StripePlanId"] into variable StripePlanId

And response JSON body satisfies condition:
it["SearchingMember"] == null &&
it["Id"] == %{connectionId} &&
it["Status"] == "Connected" &&
it["SearchingMemberId"] == %{SearchingMemberId} &&
it["AdvisorId"] == %{user1Id} &&
it["BidId"] == null &&
it["LastActionInitiatorId"] == %{user2Id} &&
it["UpdatedOn"] == "%{UpdatedOn}" &&
it["TermsId"] == null


Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario: Overview page
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing

Scenario: As advisor send a bid
Meta:
@name As advisor send a bid
Given request body:
{
  "request": {
    "subscriptionPortfoliosAmount": %{connectionId},
    "subscriptionMothlyFee": 20,
    "managementUpTo": 10000,
    "managementAnnualFee": %{SearchingMemberId},
    "reviewRequestId": 8,
    "connectionId": %{connectionId}
  }
}
When I perform POST request to api/CxAdvisorClientNew/SendBid
Then response has status 200
And I save JSON field value using groovy query it["BidId"] into variable BidId
And I save JSON field value using groovy query it["TermsId"] into variable TermsId
And I save JSON field value using groovy query it["UpdatedOn"] into variable UpdatedOn
And response JSON body satisfies condition:

it["SearchingMember"] == null &&
it["Id"] == %{connectionId} &&
it["Status"] == "BidSent" &&
it["SearchingMemberId"] == %{SearchingMemberId} &&
it["AdvisorId"] == %{user1Id} &&
it["BidId"] == %{BidId} &&
it["LastActionInitiatorId"] == %{user1Id} &&
it["UpdatedOn"] == "%{UpdatedOn}" &&
it["TermsId"] == %{TermsId} &&
it["StripePlanId"] == null


Scenario:
Setup params. Set user to Beginner
Given Set test param username value from property param.beginner.username
And Set test param password value from property param.beginner.password

Scenario: Login
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing

Scenario: As client subscribe
Meta:
@name As client subscribe
Given request body:
{
  "connectionId": %{connectionId},
  "connectionBidId": %{BidId}
}
When I perform POST request to api/CxAdvisorClientNew/Subscribe
Then response has status 200
!-- And I save JSON field value using groovy query it["BidId"] into variable BidId
And I save JSON field value using groovy query it["TermsId"] into variable TermsId
And I save JSON field value using groovy query it["Date"] into variable Date
And response JSON body satisfies condition:

it["ConnectionId"] == %{connectionId} &&
it["IsAccepted"] == true &&
it["BidId"] == %{BidId} &&
it["Date"] == "%{Date}" &&
it["TermsId"] == %{TermsId}


Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.beginner.username
And Set test param password value from property param.beginner.password

Scenario: Make visible
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
    stories/functional/test/advisor_client/client_visible_for_advisor.story#{name:invisible for advisor},
Given Do nothing


Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario: Delete TandC
Meta:
@name Delete TandC
Given request body:
{
    "termsId": %{TermsId}
}
When I perform POST request to api/CxAdvisorTermsAndConditions/DeleteTermsAndConditions
Then response has status 204