Story: Make sure that advisor can see correct information about client and client’s portfolios

Scenario:
Setup params. Set user to Intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password
And Set test param UserId with value 747


Scenario:
Login as advisor
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing


Scenario: GetUserInfo
Meta:
@name GetUserInfo
Given request body:
{
  "userId": %{UserId}
}
When I perform POST request to api/CxAdvisorClientNew/GetUserInfo
Then response has status 200
And response JSON body satisfies condition:
it["User"]["Id"] == %{UserId} &&
it["User"]["Email"] == "ca_e@catch01.tickerontest.com" &&
it["User"]["Name"] == "ContAdmin_Expert" &&
it["User"]["FirstName"] == "ContAdmin_Expert" &&
it["User"]["LastName"] == "ContAdmin_Expert" &&
it["User"]["Level"] == "Expert"&&

it["ReviewRequest"]["Id"] == 1 &&
it["ReviewRequest"]["Text"] == "Dear sir... Please review my portfolios" &&
it["ReviewRequest"]["NeedAdvice"] == true &&
it["ReviewRequest"]["NeedMoneyManagement"] == true &&
it["ReviewRequest"]["Date"] == "2016-02-15T10:11:44.37Z" &&
it["ReviewRequest"]["UserId"] == 747


!--/*
it["Connection"] == 1
it["Connection"]["SearchingMember"]["Id"] == 1
it["Connection"]["Status"] == "Subscribed"

it["Connection"]["SearchingMember"]["Status"] == "Subscribed" &&
it["Connection"]["SearchingMember"]["SearchingMemberId"] == 1 &&
it["Connection"]["SearchingMember"]["AdvisorId"] == 159 &&
it["Connection"]["SearchingMember"]["BidId"] == 1 &&
it["Connection"]["SearchingMember"]["LastActionInitiatorId"] == 747 &&
it["Connection"]["SearchingMember"]["TermsId"] == 3

!--*/

Given Do nothing


