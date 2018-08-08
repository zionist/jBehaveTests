Story: Make sure that Search For Advisors page works correctly.

Scenario:
Setup params. Set user to Expert
Given Set test param username value from property param.expert.username
Given Set test param password value from property param.expert.password

Scenario:
Login as Expert

GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing

Scenario: Find Advisors
Meta:
@name Find Advisors
Given request body:
{
  "request": {
    "onlyThooseIFollow": false,
    "state": null,
    "investmentTypes": [

    ],
    "text": "james adv",
    "offset": 0,
    "pageSize": 11
  }
}
When I perform POST request to api/CxAdvisorClientNew/FindAdvisors
Then response has status 200
And I save JSON field value using groovy query it["Name"] into variable userName
And response JSON body satisfies condition:
[
    [
        "Id": 159,
        "Name": "James Adv.",
        "Email": "catch01.tickerontest.com",
        "FirstName": "James",
        "LastName": "Advisor123",
        "Level": "Advisor",
        "Company": "123",
        "State": "CO",
        "Zip": "94089",
        "Avatar": [
          "Mode": "Image",
          "ImageUrl": "/storedimage/207",
          "BaseColorHex": "#CC857F",
          "DarkColorHex": "#A44841",
          "Initials": "J"
        ],
        "IsExternal": false,
        "IsFollowed": true
    ]
] == it