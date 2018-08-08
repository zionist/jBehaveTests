Story: Functional CRUD comments

Scenario:
Setup params. Set user to Expert
Given Set test param username value from property param.expert.username
And Set test param password value from property param.expert.password
And I generate blog_ + UUID and put it to test param blogGeneratedName
And I generate alias_ + UUID and put it to test param blogGeneratedAlias
And I generate comment_ + UUID and put it to test param comment
And I generate updated_comment + UUID and put it to test param updated_comment

Scenario:
Login as Expert
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing

Scenario: Create blog
GivenStories:
    stories/functional/test/iexpert/crud_blog.story#{name:Create blog},
Given Do nothing

Scenario: Create comment to blog
Given request body:
{request: {ParentId: null, Text: "%{comment}", PostId: %{blogPostId}}}
Then response has status 200
When I perform POST request to api/CxForumAdmin/SaveComment
Then response has status 200
And I save JSON field Id value into variable CommentId

Scenario: Update blog comment
Given request body:
    {request: {Id: %{CommentId}, Text: "%{updated_comment}"}}
When I perform POST request to api/CxForumAdmin/UpdateComment
Then response has status 200
And I save JSON field CreatedOn value into variable CreatedOn
And I save JSON field CreatedBy value into variable CreatedBy
And I save JSON field ModifiedOn value into variable ModifiedOn
And response JSON body is:
{
  "Comments": null,
  "CreatedByUser": null,
  "BlogPost": null,
  "Parent": null,
  "Id": %{CommentId},
  "ParentId": null,
  "BlogPostId": %{blogPostId},
  "Body": "%{updated_comment}",
  "CreatedOn": "%{CreatedOn}",
  "CreatedBy": %{CreatedBy},
  "ModifiedOn": "%{ModifiedOn}",
  "IsDeleted": false
}

Scenario: Delete blog comment
Given request body:
{
"id":%{CommentId}
}
When I perform POST request to api/CxForumAdmin/DeleteComment
Then response has status 204
And response body is empty
Scenario: Delete Blog
GivenStories:
    stories/functional/test/iexpert/crud_blog.story#{name:Delete Blog},
Given Do nothing









