Story: Mall Functional CRUD opinion

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Opinion_ + UUID and put it to test param opinonGeneratedName
And I generate Opinion_ + UUID and put it to test param opinonGeneratedName2

Scenario: Post image
Given I authenticated using JSON with username %{username} and password %{password}
And query string parameters:
|name|value|
|process|attachment|
When I make multipart file upload for 2.gif request to file/upload
Then I save JSON field Url value into variable url
When Mall. Parse file upload url from variable url

Scenario: Get commision
Given request body is empty
Given request body:
{"amount":199,"isSubscription":true}
When I perform POST request to api/CxMallNew/GetCommission
Then response has status 200

Scenario: Create oponion
Given request body:
{
  "request": {
    "Id": null,
    "Title": "%{opinonGeneratedName}",
    "Text": "1111",
    "File": null,
    "Price": 199,
    "Funds": [

    ],
    "FileId": "%{url}"
  }
}
When I perform POST request to api/CxMallNew/ManageOpinion
Then response has status 200
And I save result to variable opinionId
And I wait for 1001 milliseconds

Scenario: Get preview
Given request body:
{id: "%{opinionId}"}
When I perform POST request to api/CxMallNew/GetOpinionPreview
Then response has status 200

Scenario: Get
Given request body:
{id: "%{opinionId}"}
When I perform POST request to api/CxMallNew/GetOpinionById
Then response has status 200
And I save JSON field value using groovy query it["CreationDate"] into variable CreationDate
And I save JSON field value using groovy query it["Preview"]["Content"] into variable Content
And response JSON body is:
{
  "Id": %{opinionId},
  "Title": "%{opinonGeneratedName}",
  "Text": "1111",
  "PublishedDate": null,
  "CreationDate": "%{CreationDate}",
  "Price": 199.0,
  "Funds": [],
  "Preview": {
    "Name": "2_0",
    "Extension": "gif",
    "Width": 270,
    "Height": 270,
    "Content": "%{Content}"
  },
  "Seller": {
    "Id": 159,
    "Name": "James Adv.",
    "Level": "Advisor",
    "ShortInfo": "123",
    "AvatarMode": "Initials",
    "AvatarColorHue": 0,
    "AvatarImageId": null
  },
  "IsBought": false,
  "IsOwner": true,
  "IsPublished": false,
  "IsDeleted": false
}

Scenario: Search opinion
Given request body:
{"request":{"Id":"%{opinionId}","OnlyPublished":false,"PageIndex":1,"PageSize":1}}
When I perform POST request to api/CxMallNew/SearchOpinions
Then response has status 200
And I save JSON field value using groovy query it["Items"]["CreationDate"][0] into variable CreationDate
And I save JSON field value using groovy query it["Items"]["Preview"]["Content"][0] into variable Content
And response JSON body is:
{
  "Total": 1,
  "Items": [
    {
      "Id": %{opinionId},
      "Title": "%{opinonGeneratedName}",
      "Text": "1111",
      "PublishedDate": null,
      "CreationDate": "%{CreationDate}",
      "Price": 199.0,
      "Funds": [],
      "Preview": {
        "Name": "2_0",
        "Extension": "gif",
        "Width": 270,
        "Height": 270,
        "Content": "%{Content}"
      },
      "Seller": {
        "Id": 159,
        "Name": "James Adv.",
        "Level": "Advisor",
        "ShortInfo": "123",
        "AvatarMode": "Initials",
        "AvatarColorHue": 0,
        "AvatarImageId": null
      },
      "IsBought": false,
      "IsOwner": true,
      "IsPublished": false,
      "IsDeleted": false
    }
  ]
}


Scenario: Post new image for update
Given I authenticated using JSON with username %{username} and password %{password}
And query string parameters:
|name|value|
|process|attachment|
When I make multipart file upload for 1.gif request to file/upload
Then I save JSON field Url value into variable imageId
When Mall. Parse file upload url from variable imageId

Scenario: Update opinion
Given request body:
{
  "request": {
    "Id": %{opinionId},
    "Title": "%{opinonGeneratedName2}",
    "Text": "11112",
    "File": null,
    "Price": 198,
    "Funds": [

    ],
    "FileId": "%{imageId}"
  }
}
When I perform POST request to api/CxMallNew/ManageOpinion
Then response has status 200
And I wait for 1001 milliseconds

Scenario: Get after update
Given request body:
{id: "%{opinionId}"}
When I perform POST request to api/CxMallNew/GetOpinionById
Then response has status 200
And I save JSON field value using groovy query it["CreationDate"] into variable CreationDate
And I save JSON field value using groovy query it["Preview"]["Content"] into variable Content
And I save JSON field value using groovy query it["Preview"]["Name"] into variable Name
And response JSON body is:
{
  "Id": %{opinionId},
  "Title": "%{opinonGeneratedName2}",
  "Text": "11112",
  "PublishedDate": null,
  "CreationDate": "%{CreationDate}",
  "Price": 198.0,
  "Funds": [],
  "Preview": {
    "Name": "%{Name}",
    "Extension": "gif",
    "Width": 270,
    "Height": 270,
    "Content": "%{Content}"
  },
  "Seller": {
    "Id": 159,
    "Name": "James Adv.",
    "Level": "Advisor",
    "ShortInfo": "123",
    "AvatarMode": "Initials",
    "AvatarColorHue": 0,
    "AvatarImageId": null
  },
  "IsBought": false,
  "IsOwner": true,
  "IsPublished": false,
  "IsDeleted": false
}


Scenario: Search opinion after update
Given request body:
{"request":{"Id":"%{opinionId}","OnlyPublished":false,"PageIndex":1,"PageSize":1}}
When I perform POST request to api/CxMallNew/SearchOpinions
Then response has status 200
And I save JSON field value using groovy query it["Items"]["CreationDate"][0] into variable CreationDate
And I save JSON field value using groovy query it["Items"]["Preview"]["Content"][0] into variable Content
And I save JSON field value using groovy query it["Items"]["Preview"]["Name"][0] into variable Name
And response JSON body is:
{
  "Total": 1,
  "Items": [
    {
      "Id": %{opinionId},
      "Title": "%{opinonGeneratedName2}",
      "Text": "11112",
      "PublishedDate": null,
      "CreationDate": "%{CreationDate}",
      "Price": 198.0,
      "Funds": [],
      "Preview": {
        "Name": "%{Name}",
        "Extension": "gif",
        "Width": 270,
        "Height": 270,
        "Content": "%{Content}"
      },
      "Seller": {
        "Id": 159,
        "Name": "James Adv.",
        "Level": "Advisor",
        "ShortInfo": "123",
        "AvatarMode": "Initials",
        "AvatarColorHue": 0,
        "AvatarImageId": null
      },
      "IsBought": false,
      "IsOwner": true,
      "IsPublished": false,
      "IsDeleted": false
    }
  ]
}


Scenario: Delete opinion
Given request body:
{id: %{opinionId}}
When I perform POST request to api/CxMallNew/DeleteOpinion
Then response has status 204
And I wait for 1001 milliseconds

Scenario: Get after delete. Check is deleted
Given request body:
{id: "%{opinionId}"}
When I perform POST request to api/CxMallNew/GetOpinionById
Then response has status 200
And response JSON body satisfies condition: it["IsDeleted"] == true
