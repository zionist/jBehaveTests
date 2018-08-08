Story: Functional CRUD blog

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
And Set test param password value from property param.advisor.password
And I generate blog_ + UUID and put it to test param blogGeneratedName
And I generate alias_ + UUID and put it to test param blogGeneratedAlias

Scenario:
Login as Advisor
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing

Scenario: Create blog
Meta:
@name Create blog
Given request body:

{
  "blogPost": {
    "Id": -1,
    "Title": "%{blogGeneratedName}",
    "Alias": "%{blogGeneratedAlias}",
    "Text": "<p>Some plain text<\/p>\n",
    "BlogPostFundReferences": [

    ]
  }
}
When I perform POST request to api/CxForumAdmin/SaveBlogPost
Then response has status 200
And I save result to variable blogPostId


Scenario: Get BlogPost
Meta:
@name Get BlogPost
Given request body:
{blogEntryId: "%{blogPostId}"}
When I perform POST request to api/CxForum/GetBlogPostDetailById
Then response has status 200
And I save JSON field DateCreated value into variable DateCreated
And I save JSON field ModifiedOn value into variable ModifiedOn
And I save JSON field PopularityCounterId value into variable PopularityCounterId
And I save JSON field value using groovy query it["Alias"] into variable Alias
And response JSON body is:
 {
      "Id": %{blogPostId},
      "AuthorId": 159,
      "Title": "%{blogGeneratedName}",
      "DateCreated": "%{DateCreated}",
      "ModifiedOn": "%{ModifiedOn}",
      "Text": "<p>Some plain text</p>\n",
      "Alias": "%{blogGeneratedAlias}",
      "PublishingStatus": "PUBLISHED",
      "Children": [],
      "ContentItemType": "blog_post",
      "CommentsCount": 0,
      "BlogPostFundReferences": [],
      "PopularityCounterId": %{PopularityCounterId}
 }


Scenario: Edit blog
Given request body:
{
  "blogPost": {
    "Id": %{blogPostId},
    "Title": "%{blogGeneratedName}",
    "Alias": "%{blogGeneratedAlias}",
    "Text": "<p>Some plain text<\/p>\n",
    "BlogPostFundReferences": [

    ]
  }
}

Scenario: Get BlogPost
Meta:
@name Get BlogPost
Given request body:
{blogEntryId: "%{blogPostId}"}
When I perform POST request to api/CxForum/GetBlogPostDetailById
Then response has status 200
And I save JSON field DateCreated value into variable DateCreated
And I save JSON field ModifiedOn value into variable ModifiedOn
And I save JSON field PopularityCounterId value into variable PopularityCounterId
And I save JSON field value using groovy query it["Alias"] into variable Alias
And I save JSON field value using groovy query it["Id"] into variable blogPostId
And response JSON body is:
 {
      "Id": %{blogPostId},
      "AuthorId": 159,
      "Title": "%{blogGeneratedName}",
      "DateCreated": "%{DateCreated}",
      "ModifiedOn": "%{ModifiedOn}",
      "Text": "<p>Some plain text</p>\n",
      "Alias": "%{blogGeneratedAlias}",
      "PublishingStatus": "PUBLISHED",
      "Children": [],
      "ContentItemType": "blog_post",
      "CommentsCount": 0,
      "BlogPostFundReferences": [],
      "PopularityCounterId": %{PopularityCounterId}
 }

Scenario: Get popular blog post
Meta:
@name Get popular blog post
Given request body:
{
    "request":{"Offset":0,"PageSize":9}
}
When I perform POST request to api/CxIExpert/GetPopularBlogPosts
Then response has status 200
And response JSON body satisfies condition:
it.size() > 0

Scenario: Delete Blog
Meta:
@name Delete Blog
Given request body:
{"id": %{blogPostId}}
When I perform POST request to api/CxForumAdmin/DeleteBlogPost
Then response has status 204