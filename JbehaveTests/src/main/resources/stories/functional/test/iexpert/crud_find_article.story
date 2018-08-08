Story: Functional CRUD article

Scenario:
Setup params. Set user to AccountAdmin
Given Set test param username value from property param.contentadmin.username
And Set test param password value from property param.contentadmin.password
And I generate article_ + UUID and put it to test param articleGeneratedTitle
And I generate alias_ + UUID and put it to test param articleGeneratedAlias
And Set test param ArticleText with value Test article sample text
And Set test param TeaserText with value Teaser for test article
And Set test param FundId with value 31069

Scenario:
Login as AccountAdmin
GivenStories:
    stories/functional/test/login/login.story#{name:Login},
Given Do nothing

Scenario: Create article
Meta:
@name Create article
Given request body:
{
  "article": {
    "ArticleId": -1,
    "Title": "%{articleGeneratedTitle}",
    "Alias": "%{articleGeneratedAlias}",
    "TextInfo": {
      "Text": "%{ArticleText}"
    },
    "PublishingStatus": "NOT_PUBLISHED",
    "UnifiedContent": {
      "ContentKeywords": [
        {
          "Keyword": {
            "KeywordId": 7,
            "Alias": "tags\/economy",
            "Text": "Economy"
          }
        }
      ],
      "Levels": {
        "Level0": true,
        "Level1": true,
        "Level2": true,
        "Level3": true
      }
    },
    "ArticleTickers": [
      {
        "FundId": "%{FundId}"
      }
    ],
    "Teaser": "%{TeaserText}"
  }
}

When I perform POST request to api/CxForumAdmin/SaveGeneralArticle
Then response has status 200
And I save result to variable articleId
Given Do nothing

Scenario: Get article
Given request body:
{alias: "%{articleGeneratedAlias}"}
When I perform POST request to api/CxForum/GetArticleDetail
Then response has status 200
And response JSON body satisfies condition:
it["ShortId"] == %{articleId} &&
it["Alias"] == "%{articleGeneratedAlias}" &&
it["Title"] == "%{articleGeneratedTitle}" &&
it["Teaser"] == "%{TeaserText}" &&
it["Body"] == "%{ArticleText}" &&
it["Tickers"][0]["FundId"] == %{FundId} &&
it["Tags"][0]["Name"] == "Economy"

Scenario: Search article
Meta:
@name Search article
Given request body:
{
  "request": {
    "Text": "%{articleGeneratedTitle}",
    "SearchArticles": true,
    "SearchBlogs": false,
    "SearchQuestions": false,
    "Offset": 0,
    "PageSize": 10
  }
}
When I perform POST request to api/CxIExpertSearch/Search
Then response has status 200
And response JSON body satisfies condition:
it["SearchResults"][0]["Document"]["Kind"] == "Article" &&
it["SearchResults"][0]["Document"]["Id"] == %{articleId} &&
it["SearchResults"][0]["Document"]["Alias"] == "%{articleGeneratedAlias}" &&
it["SearchResults"][0]["Document"]["Title"] == "%{articleGeneratedTitle}"

Scenario: Delete article
Meta:
@name Delete article
Given request body:
{
    "articleId":%{articleId}
}
When I perform POST request to api/CxForumAdmin/DeleteGeneralArticle
Then response has status 204

Scenario: Get popular articles
Meta:
@name Get popular articles
Given request body:
{
    "request":{"Offset":0,"PageSize":9}
}
When I perform POST request to api/CxIExpert/GetPopularArticles
Then response has status 200
And response JSON body satisfies condition:
it.size() == 9