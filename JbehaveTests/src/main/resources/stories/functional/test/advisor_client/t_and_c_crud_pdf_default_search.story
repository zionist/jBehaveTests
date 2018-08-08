Story: Functional CRUD T&C, search, make default

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate _Title + UUID and put it to test param titleGenerated
And I generate _Title + UUID and put it to test param titleGeneratedNotDefault
And I generate _Title_Edit + UUID and put it to test param titleGeneratedEdit
And Set test param TermsText with value Test terms sample text
And Set test param TermsComment with value Comment for test terms
And Set test param TermsTextEdit with value Test terms sample text after edit
And Set test param TermsCommentEdit with value Comment for test terms after edit


Scenario:
Login as Advisor
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing

Scenario: Create TandC default
Meta:
@name Create TandC default
Given request body:
{
  "terms": {
    "DocumentType": "PlainText",
    "IsDefault": true,
    "UploadKey": null,
    "Attachment": null,
    "Title": "%{titleGenerated}",
    "Comment": "%{TermsComment}",
    "DocumentContent": "%{TermsText}"
  }
}
When I perform POST request to api/CxAdvisorTermsAndConditions/SaveTermsAndConditions
Then response has status 200
And I save JSON field value using groovy query it["Id"] into variable TermsId
Given Do nothing


Scenario: Get TandC
Meta:
@name Get TandC
Given request body:
{
  "termsId": %{TermsId}
}
When I perform POST request to api/CxAdvisorTermsAndConditions/GetTermsAndConditions
Then response has status 200
And I save JSON field value using groovy query it["LastEditTime"] into variable LastEditTime
And I save JSON field value using groovy query it["SubscriptionsCount"] into variable SubscriptionsCount
And I save JSON field value using groovy query it["Attachment"] into variable Attachment
And I save JSON field value using groovy query it["Attachment"]["Name"] into variable AttachmentName
And I save JSON field value using groovy query it["Attachment"]["ContentType"] into variable AttachmentContentType
And I save JSON field value using groovy query it["Attachment"]["Url"] into variable AttachmentUrl
And I save JSON field value using groovy query it["Attachment"]["AttachmentUrl"] into variable AttachmentAttachmentUrl
And I save JSON field value using groovy query it["DocumentType"] into variable DocumentType
And I save JSON field value using groovy query it["IsDefault"] into variable IsDefault
And response JSON body is:
{
  "Id": %{TermsId},
  "Title": "%{titleGenerated}",
  "Comment": "%{TermsComment}",
  "LastEditTime": "%{LastEditTime}",
  "SubscriptionsCount": 0,
  "BidsCount": 0,
  "Attachment": {
    "ServiceName": "terms_and_conditions",
    "Id": "%{TermsId}",
     "Name": "%{AttachmentName}",
     "ContentType": "%{AttachmentContentType}",
     "Content": null,
     "Url": "%{AttachmentUrl}",
     "AttachmentUrl": "%{AttachmentAttachmentUrl}",
     "Title": "%{titleGenerated}"
     },
  "DocumentContent": "%{TermsText}",
  "DocumentType": "%{DocumentType}",
  "IsDefault": %{IsDefault}
}

Scenario: Update TandC
Meta:
@name Update TandC
Given request body:
{
  "terms": {
    "Id": %{TermsId},
    "Title": "%{titleGeneratedEdit}",
    "Comment": "%{TermsCommentEdit}",
    "LastEditTime": "%{LastEditTime}",
    "SubscriptionsCount": %{SubscriptionsCount},
    "BidsCount": 0,
    "Attachment": {
        "ServiceName": "terms_and_conditions",
        "Id": "%{TermsId}",
        "Name": "%{AttachmentName}",
        "ContentType": "%{AttachmentContentType}",
        "Content": null,
        "Url": "%{AttachmentUrl}",
        "AttachmentUrl": "%{AttachmentAttachmentUrl}",
        "Title": "%{titleGenerated}"
        },
    "DocumentContent": "%{TermsTextEdit}",
    "DocumentType": "%{DocumentType}",
    "IsDefault": %{IsDefault}
  }
}
When I perform POST request to api/CxAdvisorTermsAndConditions/SaveTermsAndConditions
Then response has status 200
And I save JSON field value using groovy query it["LastEditTime"] into variable LastEditTime
Given Do nothing

Scenario: Get TandC after update
Meta:
@name Get TandC after update
Given request body:
{
  "termsId": %{TermsId}
}
When I perform POST request to api/CxAdvisorTermsAndConditions/GetTermsAndConditions
Then response has status 200
And I save JSON field value using groovy query it["LastEditTime"] into variable LastEditTime
And I save JSON field value using groovy query it["SubscriptionsCount"] into variable SubscriptionsCount
And I save JSON field value using groovy query it["Attachment"]["Name"] into variable AttachmentName
And I save JSON field value using groovy query it["Attachment"]["ContentType"] into variable AttachmentContentType
And I save JSON field value using groovy query it["Attachment"]["Url"] into variable AttachmentUrl
And I save JSON field value using groovy query it["Attachment"]["AttachmentUrl"] into variable AttachmentAttachmentUrl
And I save JSON field value using groovy query it["DocumentType"] into variable DocumentType
And I save JSON field value using groovy query it["IsDefault"] into variable IsDefault
And response JSON body is:
{
  "Id": %{TermsId},
      "Title": "%{titleGeneratedEdit}",
      "Comment": "%{TermsCommentEdit}",
      "LastEditTime": "%{LastEditTime}",
      "SubscriptionsCount": %{SubscriptionsCount},
      "BidsCount": 0,
      "Attachment": {
          "ServiceName": "terms_and_conditions",
          "Id": "%{TermsId}",
          "Name": "%{AttachmentName}",
          "ContentType": "%{AttachmentContentType}",
          "Content": null,
          "Url": "%{AttachmentUrl}",
          "AttachmentUrl": "%{AttachmentAttachmentUrl}",
          "Title": "%{titleGeneratedEdit}"
          },
      "DocumentContent": "%{TermsTextEdit}",
      "DocumentType": "%{DocumentType}",
      "IsDefault": %{IsDefault}
}

Scenario: Create TandC not default
Meta:
@name Create TandC Create TandC not default
Given request body:
{
  "terms": {
    "DocumentType": "PlainText",
    "IsDefault": false,
    "UploadKey": null,
    "Attachment": null,
    "Title": "%{titleGeneratedNotDefault}",
    "Comment": "%{TermsComment}",
    "DocumentContent": "%{TermsText}"
  }
}
When I perform POST request to api/CxAdvisorTermsAndConditions/SaveTermsAndConditions
Then response has status 200
And I save JSON field value using groovy query it["Id"] into variable TermsNotDefaultId
Given Do nothing

Scenario: Get TandC
Meta:
@name Get TandC
Given request body:
{
  "termsId": %{TermsNotDefaultId}
}
When I perform POST request to api/CxAdvisorTermsAndConditions/GetTermsAndConditions
Then response has status 200
And response JSON body satisfies condition:
it["Id"] == %{TermsNotDefaultId} &&
it["IsDefault"] == false

Scenario: Set as default TandC
Meta:
@name Set as default TandC
Given request body:
{
  "termsId": %{TermsNotDefaultId}
}
When I perform POST request to api/CxAdvisorTermsAndConditions/SetDefaultTermsAndConditions
Then response has status 204

Scenario: Get TandC
Meta:
@name Get TandC
Given request body:
{
  "termsId": %{TermsNotDefaultId}
}
When I perform POST request to api/CxAdvisorTermsAndConditions/GetTermsAndConditions
Then response has status 200
And response JSON body satisfies condition:
it["Id"] == %{TermsNotDefaultId} &&
it["IsDefault"] == true

Scenario: Search TandCs
Meta:
@name Search TandCs
Given request body:
{
  "searchRequest": {
    "Offset": 0,
    "PageSize": 11
  }
}
When I perform POST request to api/CxAdvisorTermsAndConditions/SearchTermsAndConditions
Then response has status 200
And response JSON body satisfies condition:
it.size() == 3

Scenario: Delete TandC
Meta:
@name Delete TandC
Given request body:
{
    "termsId": %{TermsId}
}
When I perform POST request to api/CxAdvisorTermsAndConditions/DeleteTermsAndConditions
Then response has status 204

Scenario: Delete TandC
Meta:
@name Delete TandC
Given request body:
{
    "termsId": %{TermsNotDefaultId}
}
When I perform POST request to api/CxAdvisorTermsAndConditions/DeleteTermsAndConditions
Then response has status 204