Story: Functional Chat between advisor-client in connected and subscribed mode

Scenario:
Setup params. Set user to Intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password
And Set test param IntermMessageText with value Test interm message
And Set test param AdvisorMessageText with value Test advisor message
And Set test param IntermMessageText2nd with value Test second interm message
And Set test param AdvisorMessageText2nd with value Test second advisor message


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


Scenario: Perform action as advisor
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
    stories/functional/test/advisor_client/t_and_c_crud_pdf_default_search.story#{name:Create TandC default},
    stories/functional/test/advisor_client/full_connection.story#{name:GetSubscription},
    stories/functional/test/advisor_client/full_connection.story#{name:Click on Select},
    stories/functional/test/advisor_client/full_connection.story#{name:Send connection. As Advisor click on "Connect" button},
Given Do nothing


Scenario:
Setup params. Set user to Intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password


Scenario: Perform action as intermediate
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
    stories/functional/test/advisor_client/full_connection.story#{name:Accept connection account as client},
Given Do nothing


Scenario: Perform action as intermediate
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing

Scenario: Send chat message as client
Meta:
@name Send chat message as client
Given request body:
{
  "message": {
    "Text": "%{IntermMessageText}",
    "Date": "2016-03-07T10:39:57.747Z",
    "From": {
      "Id": 22,
      "UserId": 160,
      "Name": "Mike In.",
      "IsOwner": false,
      "Avatar": {
        "Mode": "Image",
        "ImageUrl": "\/storedimage\/834",
        "BaseColorHex": "#7FCC8C",
        "DarkColorHex": "#41A452",
        "Initials": "M"
      }
    },
    "To": {
      "Id": 23,
      "UserId": 159,
      "Name": "James Adv.",
      "IsOwner": false,
      "Avatar": {
        "Mode": "Image",
        "ImageUrl": "\/storedimage\/207",
        "BaseColorHex": "#CC857F",
        "DarkColorHex": "#A44841",
        "Initials": "J"
      }
    }
  },
  "contextType": "AdvisorClient",
  "contextId": 3
}
When I perform POST request to api/CxChat/SendMessage
Then response has status 200
And I save JSON field value using groovy query it["Id"] into variable IntermedMessageId
And I save JSON field value using groovy query it["Date"] into variable IntermedMessageDate
Given Do nothing


Scenario: Get dialog model as client
Meta:
@name Get dialog model as client
Given request body:
{
  "contextType": "AdvisorClient",
  "contextId": 3
}
When I perform POST request to api/CxChat/GetDialogModel
Then response has status 200
And response JSON body satisfies condition:
it["Title"] == "Advisor: James Adv." &&
it["MessageContainer"]["Messages"][0]["Id"] == "%{IntermedMessageId}" &&
it["MessageContainer"]["Messages"][0]["Text"] == "%{IntermMessageText}" &&
it["MessageContainer"]["Messages"][0]["Date"] == "%{IntermedMessageDate}" &&
it["MessageContainer"]["Messages"][0]["From"]["UserId"] == 160 &&
it["MessageContainer"]["Messages"][0]["From"]["Name"] == "Mike In." &&
it["MessageContainer"]["Messages"][0]["To"]["UserId"] == 159 &&
it["MessageContainer"]["Messages"][0]["To"]["Name"] == "James Adv."
Given Do nothing


Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario:
Login as advisor
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing


Scenario: Get dialog model as advisor
Meta:
@name Get dialog model as advisor
Given request body:
{
  "contextType": "AdvisorClient",
  "contextId": 3
}
When I perform POST request to api/CxChat/GetDialogModel
Then response has status 200
And response JSON body satisfies condition:
it["Title"] == "User: Mike In." &&
it["MessageContainer"]["Messages"][0]["Id"] == "%{IntermedMessageId}" &&
it["MessageContainer"]["Messages"][0]["Text"] == "%{IntermMessageText}" &&
it["MessageContainer"]["Messages"][0]["Date"] == "%{IntermedMessageDate}" &&
it["MessageContainer"]["Messages"][0]["From"]["UserId"] == 160 &&
it["MessageContainer"]["Messages"][0]["From"]["Name"] == "Mike In." &&
it["MessageContainer"]["Messages"][0]["To"]["UserId"] == 159 &&
it["MessageContainer"]["Messages"][0]["To"]["Name"] == "James Adv."
Given Do nothing


Scenario: Send chat message as advisor
Meta:
@name Send chat message as advisor
Given request body:
{
  "message": {
    "Text": "%{AdvisorMessageText}",
    "Date": "2016-03-04T14:50:55.852Z",
    "From": {
      "Id": 23,
      "UserId": 159,
      "Name": "James Adv.",
      "IsOwner": false,
      "Avatar": {
        "Mode": "Image",
        "ImageUrl": "\/storedimage\/207",
        "BaseColorHex": "#CC857F",
        "DarkColorHex": "#A44841",
        "Initials": "J"
      }
    },
    "To": {
      "Id": 22,
      "UserId": 160,
      "Name": "Mike In.",
      "IsOwner": false,
      "Avatar": {
        "Mode": "Image",
        "ImageUrl": "\/storedimage\/834",
        "BaseColorHex": "#7FCC8C",
        "DarkColorHex": "#41A452",
        "Initials": "M"
      }
    }
  },
  "contextType": "AdvisorClient",
  "contextId": 3
}
When I perform POST request to api/CxChat/SendMessage
Then response has status 200
And I save JSON field value using groovy query it["Id"] into variable AdvisorMessageId
And I save JSON field value using groovy query it["Date"] into variable AdvisorMessageDate
Given Do nothing


Scenario: Get dialog model as advisor
Meta:
@name Get dialog model as advisor
Given request body:
{
  "contextType": "AdvisorClient",
  "contextId": 3
}
When I perform POST request to api/CxChat/GetDialogModel
Then response has status 200
And response JSON body satisfies condition:
it["Title"] == "User: Mike In." &&
it["MessageContainer"]["Messages"][0]["Id"] == "%{AdvisorMessageId}" &&
it["MessageContainer"]["Messages"][0]["Text"] == "%{AdvisorMessageText}" &&
it["MessageContainer"]["Messages"][0]["Date"] == "%{AdvisorMessageDate}" &&
it["MessageContainer"]["Messages"][0]["From"]["UserId"] == 159 &&
it["MessageContainer"]["Messages"][0]["From"]["Name"] == "James Adv." &&
it["MessageContainer"]["Messages"][0]["To"]["UserId"] == 160 &&
it["MessageContainer"]["Messages"][0]["To"]["Name"] == "Mike In."
Given Do nothing


Scenario:
Setup params. Set user to Intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password


Scenario:
Login as intermediate
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing


Scenario: Get dialog model as intermediate
Meta:
@name Get dialog model as intermediate
Given request body:
{
  "contextType": "AdvisorClient",
  "contextId": 3
}
When I perform POST request to api/CxChat/GetDialogModel
Then response has status 200
And response JSON body satisfies condition:
it["Title"] == "Advisor: James Adv." &&
it["MessageContainer"]["Messages"][0]["Id"] == "%{AdvisorMessageId}" &&
it["MessageContainer"]["Messages"][0]["Text"] == "%{AdvisorMessageText}" &&
it["MessageContainer"]["Messages"][0]["Date"] == "%{AdvisorMessageDate}" &&
it["MessageContainer"]["Messages"][0]["From"]["UserId"] == 159 &&
it["MessageContainer"]["Messages"][0]["From"]["Name"] == "James Adv." &&
it["MessageContainer"]["Messages"][0]["To"]["UserId"] == 160 &&
it["MessageContainer"]["Messages"][0]["To"]["Name"] == "Mike In."
Given Do nothing





Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario: Perform action as advisor
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
    stories/functional/test/advisor_client/full_connection.story#{name:As advisor send a bid},
Given Do nothing


Scenario:
Setup params. Set user to Intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password


Scenario: Perform action as intermediate
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
    stories/functional/test/advisor_client/full_connection.story#{name:As client subscribe},
Given Do nothing


Scenario:
Setup params. Set user to Intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password


Scenario:
Login as intermediate
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing


Scenario: Send chat message as client
Meta:
@name Send chat message as client
Given request body:
{
  "message": {
    "Text": "%{IntermMessageText2nd}",
    "Date": "2016-03-07T13:03:26.821Z",
    "From": {
      "Id": 22,
      "UserId": 160,
      "Name": "Mike In.",
      "IsOwner": false,
      "Avatar": {
        "Mode": "Image",
        "ImageUrl": "\/storedimage\/834",
        "BaseColorHex": "#7FCC8C",
        "DarkColorHex": "#41A452",
        "Initials": "M"
      }
    },
    "To": {
      "Id": 23,
      "UserId": 159,
      "Name": "James Adv.",
      "IsOwner": false,
      "Avatar": {
        "Mode": "Image",
        "ImageUrl": "\/storedimage\/207",
        "BaseColorHex": "#CC857F",
        "DarkColorHex": "#A44841",
        "Initials": "J"
      }
    }
  },
  "contextType": "AdvisorClient",
  "contextId": 3
}
When I perform POST request to api/CxChat/SendMessage
Then response has status 200
And I save JSON field value using groovy query it["Id"] into variable IntermedMessageId
And I save JSON field value using groovy query it["Date"] into variable IntermedMessageDate
Given Do nothing

Scenario: Get dialog model as client
Meta:
@name Get dialog model as client
Given request body:
{
  "contextType": "AdvisorClient",
  "contextId": 3
}
When I perform POST request to api/CxChat/GetDialogModel
Then response has status 200
And response JSON body satisfies condition:
it["Title"] == "Advisor: James Adv." &&
it["MessageContainer"]["Messages"][0]["Id"] == "%{IntermedMessageId}" &&
it["MessageContainer"]["Messages"][0]["Text"] == "%{IntermMessageText2nd}" &&
it["MessageContainer"]["Messages"][0]["Date"] == "%{IntermedMessageDate}" &&
it["MessageContainer"]["Messages"][0]["From"]["UserId"] == 160 &&
it["MessageContainer"]["Messages"][0]["From"]["Name"] == "Mike In." &&
it["MessageContainer"]["Messages"][0]["To"]["UserId"] == 159 &&
it["MessageContainer"]["Messages"][0]["To"]["Name"] == "James Adv."
Given Do nothing

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password


Scenario:
Login as advisor
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing


Scenario: Get dialog model as advisor
Meta:
@name Get dialog model as advisor
Given request body:
{
  "contextType": "AdvisorClient",
  "contextId": 3
}
When I perform POST request to api/CxChat/GetDialogModel
Then response has status 200
And response JSON body satisfies condition:
it["Title"] == "User: Mike In." &&
it["MessageContainer"]["Messages"][0]["Id"] == "%{IntermedMessageId}" &&
it["MessageContainer"]["Messages"][0]["Text"] == "%{IntermMessageText2nd}" &&
it["MessageContainer"]["Messages"][0]["Date"] == "%{IntermedMessageDate}" &&
it["MessageContainer"]["Messages"][0]["From"]["UserId"] == 160 &&
it["MessageContainer"]["Messages"][0]["From"]["Name"] == "Mike In." &&
it["MessageContainer"]["Messages"][0]["To"]["UserId"] == 159 &&
it["MessageContainer"]["Messages"][0]["To"]["Name"] == "James Adv."
Given Do nothing


Scenario: Send chat message as advisor
Meta:
@name Send chat message as advisor
Given request body:
{
  "message": {
    "Text": "%{AdvisorMessageText2nd}",
    "Date": "2016-03-04T14:50:55.852Z",
    "From": {
      "Id": 23,
      "UserId": 159,
      "Name": "James Adv.",
      "IsOwner": false,
      "Avatar": {
        "Mode": "Image",
        "ImageUrl": "\/storedimage\/207",
        "BaseColorHex": "#CC857F",
        "DarkColorHex": "#A44841",
        "Initials": "J"
      }
    },
    "To": {
      "Id": 22,
      "UserId": 160,
      "Name": "Mike In.",
      "IsOwner": false,
      "Avatar": {
        "Mode": "Image",
        "ImageUrl": "\/storedimage\/834",
        "BaseColorHex": "#7FCC8C",
        "DarkColorHex": "#41A452",
        "Initials": "M"
      }
    }
  },
  "contextType": "AdvisorClient",
  "contextId": 3
}
When I perform POST request to api/CxChat/SendMessage
Then response has status 200
And I save JSON field value using groovy query it["Id"] into variable AdvisorMessageId
And I save JSON field value using groovy query it["Date"] into variable AdvisorMessageDate
Given Do nothing


Scenario: Get dialog model as advisor
Meta:
@name Get dialog model as advisor
Given request body:
{
  "contextType": "AdvisorClient",
  "contextId": 3
}
When I perform POST request to api/CxChat/GetDialogModel
Then response has status 200
And response JSON body satisfies condition:
it["Title"] == "User: Mike In." &&
it["MessageContainer"]["Messages"][0]["Id"] == "%{AdvisorMessageId}" &&
it["MessageContainer"]["Messages"][0]["Text"] == "%{AdvisorMessageText2nd}" &&
it["MessageContainer"]["Messages"][0]["Date"] == "%{AdvisorMessageDate}" &&
it["MessageContainer"]["Messages"][0]["From"]["UserId"] == 159 &&
it["MessageContainer"]["Messages"][0]["From"]["Name"] == "James Adv." &&
it["MessageContainer"]["Messages"][0]["To"]["UserId"] == 160 &&
it["MessageContainer"]["Messages"][0]["To"]["Name"] == "Mike In."
Given Do nothing


Scenario:
Setup params. Set user to Intermediate
Given Set test param username value from property param.intermediate.username
Given Set test param password value from property param.intermediate.password


Scenario:
Login as intermediate
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing


Scenario: Get dialog model as intermediate
Meta:
@name Get dialog model as intermediate
Given request body:
{
  "contextType": "AdvisorClient",
  "contextId": 3
}
When I perform POST request to api/CxChat/GetDialogModel
Then response has status 200
And response JSON body satisfies condition:
it["Title"] == "Advisor: James Adv." &&
it["MessageContainer"]["Messages"][0]["Id"] == "%{AdvisorMessageId}" &&
it["MessageContainer"]["Messages"][0]["Text"] == "%{AdvisorMessageText2nd}" &&
it["MessageContainer"]["Messages"][0]["Date"] == "%{AdvisorMessageDate}" &&
it["MessageContainer"]["Messages"][0]["From"]["UserId"] == 159 &&
it["MessageContainer"]["Messages"][0]["From"]["Name"] == "James Adv." &&
it["MessageContainer"]["Messages"][0]["To"]["UserId"] == 160 &&
it["MessageContainer"]["Messages"][0]["To"]["Name"] == "Mike In."
Given Do nothing