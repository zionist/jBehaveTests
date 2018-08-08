Story: Make sure that advisor after sending Connection Request can cancel it

Scenario:
Setup params. Set user to Advisor
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

Scenario: Overview page
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
    stories/functional/test/advisor_client/t_and_c_crud_pdf_default_search.story#{name:Create TandC default},
    stories/functional/test/advisor_client/full_connection.story#{name:api/CxMember/GetSubscription},
    stories/functional/test/advisor_client/full_connection.story#{name:Click on Select},
    stories/functional/test/advisor_client/full_connection.story#{name:Send connection. As Advisor click on "Connect" button},
Given Do nothing

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password

Scenario: Cancel Request
Given request body:
{
  "toId": %{User2Id},
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
