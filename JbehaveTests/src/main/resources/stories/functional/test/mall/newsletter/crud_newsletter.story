Story: Mall Functional CRUD newsletter

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Newsletter + UUID and put it to test param newsletterName

Scenario: Post image
Given I authenticated using JSON with username %{username} and password %{password}
And query string parameters:
|name|value|
|process|attachment|
When I make multipart file upload for 2.gif request to file/upload
Then I save JSON field Url value into variable fileId
When Mall. Parse file upload url from variable fileId

Scenario: Create newsletter
Given request body:
{
  "request": {
    "Id": null,
    "Title": "%{newsletterName}",
    "Description": "11111",
    "File": null,
    "Fee": 198,
    "FileId": "%{fileId}"
  }
}
When I perform POST request to api/CxMallNew/ManageNewsletter
Then response has status 200
And I wait for 2001 milliseconds
And I save result to variable newsletterId

Scenario: Add issue
!-- TODO: make after https://tickeron.atlassian.net/browse/TMA-5694
Given Do nothing

Scenario: Get newsletter preview
Given request body:
{id: "%{newsletterId}"}
When I perform POST request to api/CxMallNew/GetNewsletterPreview
Then response has status 200
Then I save JSON field value using groovy query it[0]["Content"] into variable content
Then I save JSON field value using groovy query it[0]["Name"] into variable name
And response JSON body is:
[
  {
    "Name": "%{name}",
    "Extension": "gif",
    "Width": 270,
    "Height": 270,
    "Content": "%{content}"
  }
]

Scenario: Get Newsletter With Attachment
Given request body:
{id: "%{newsletterId}"}
When I perform POST request to api/CxMallNew/GetNewsletterWithAttachmentById
Then response has status 200
Then I save JSON field value using groovy query it["CoverAttachment"]["AttachmentContent"] into variable AttachmentContent
Then I save JSON field value using groovy query it["CoverAttachment"]["AttachmentName"] into variable AttachmentName
Then I save JSON field value using groovy query it["CoverAttachment"]["MbSize"] into variable MbSize
Then I save JSON field value using groovy query it["CoverAttachment"]["Id"] into variable CoverAttachmentId
Then I save JSON field value using groovy query it["CreationDate"] into variable CreationDate
And response JSON body is:
{
  "CoverAttachment": {
    "Previews": null,
    "Id": %{CoverAttachmentId},
    "AttachmentName": "%{AttachmentName}",
    "AttachmentExtension": "gif",
    "AttachmentContent": "%{AttachmentContent}",
    "MbSize": %{MbSize},
    "AttachmentContentType": "image/gif"
  },
  "Issues": null,
  "Seller": null,
  "Id": %{newsletterId},
  "Name": "%{newsletterName}",
  "Description": "11111",
  "IsPublished": false,
  "IsDeleted": false,
  "SellerId": 159,
  "BillingPlanId": null,
  "Fee": 198.0000,
  "CoverAttachmentId": %{CoverAttachmentId},
  "CreationDate": "%{CreationDate}",
  "PublishDate": null,
  "UnpublishDate": null
}


Scenario: Get Newsletter issues
Given request body:
{"request":{"NewsletterId":"%{newsletterId}","PageSize":5,"PageIndex":1}}
When I perform POST request to api/CxMallNew/GetNewsletterIssues
Then response has status 200
And response JSON body is:
{
  "Total": 0,
  "Items": []
}

Scenario: Update newsletter
Given request body:
{
  "request": {
    "Id": 1,
    "Title": "t111112",
    "Description": "<p>dasdasdasdasdas<\/p>\n",
    "File": null,
    "Fee": 199,
    "FileId": "2"
  }
}
When I perform POST request to api/CxMallNew/ManageNewsletter
Then response has status 200
And I wait for 2001 milliseconds

