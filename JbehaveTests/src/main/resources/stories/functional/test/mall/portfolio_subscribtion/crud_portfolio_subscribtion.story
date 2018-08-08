Story: Mall Functional CRUD opinion

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Functional_P + UUID and put it to test param portfolioGenerated
And I generate Title + UUID and put it to test param portfolioTitle
And I generate Title2 + UUID and put it to test param portfolioTitle2

Scenario: Create portfolio
GivenStories:
    stories/functional/test/portfolio/create_non_diversified_trading_portfolio.story#{name:Create non diversified trading porfolio}
Given Do nothing

Scenario: Create porfolio subscribtion
Given request body:
{
  "request": {
    "Id": null,
    "PortfolioId": %{portfolioId},
    "Fee": 199,
    "Description": "%{portfolioTitle}"
  }
}
When I perform POST request to api/CxMallNew/ManageSubscription
Then response has status 200
And I wait for 2001 milliseconds
And I save result to variable subscribtionPortfolioId

Scenario: Search portfolio subscribtion
Given request body:
{
  "request": {
    "Id": "%{subscribtionPortfolioId}",
    "PageIndex": 1,
    "PageSize": 1
  }
}
When I perform POST request to api/CxMallNew/SearchPortfolioSubscriptions
Then response has status 200
Then I save JSON field value using groovy query it["Items"][0]["GroupId"] into variable GroupId
Then I save JSON field value using groovy query it["Items"][0]["PublishedAt"] into variable PublishedAt
And response JSON body is:
{
  "Total": 1,
  "Items": [
    {
      "Id": %{subscribtionPortfolioId},
      "PortfolioId": %{portfolioId},
      "GroupId": %{GroupId},
      "Name": "%{portfolioGenerated}",
      "ReturnSinceInception": 0.0,
      "DaysSinceInception": 0,
      "Reallocations": 0,
      "Positions": 0,
      "Seller": {
        "Id": 159,
        "Name": "James Adv.",
        "Level": "Advisor",
        "ShortInfo": "123",
        "AvatarMode": "Initials",
        "AvatarColorHue": 0,
        "AvatarImageId": null
      },
      "Fee": 199.0000,
      "Description": "%{portfolioTitle}",
      "PublishedAt": "%{PublishedAt}",
      "IsBookmarked": false,
      "Preview": {
        "PortfolioId": %{portfolioId},
        "MarketValue": 0,
        "Labels": [
          "Cash"
        ],
        "Data": [
          100.0
        ]
      },
      "IsBought": false,
      "IsOwner": true,
      "IsArchivedAt": null
    }
  ]
}

Scenario: Get portfolio perfomance
Given request body:
{id: "%{subscribtionPortfolioId}"}
When I perform POST request to api/CxMallNew/GetPortfolioPerformance
Then I save JSON field value using groovy query it["Dates"][0] into variable Dates
Then response has status 200
And response JSON body is:
{
  "CounterPartAllocName": null,
  "Dates": [
    "%{Dates}"
  ],
  "YourTotal": [
    {
      "AmountFund": 0.0,
      "AmountCash": 100.0,
      "GroupSpread": [
        100.0
      ],
      "CategorySpread": [
        100.0
      ]
    }
  ],
  "ComputerTotal": null,
  "CounterPartTotal": null,
  "NoTradeRulesTotal": null,
  "Details": null,
  "CompareWithTotal": null,
  "Groups": [
    "Cash"
  ],
  "FundGroups": [
    {
      "Id": -1,
      "Title": "Cash",
      "Value": 0.0,
      "ValueTxt": "0.00"
    }
  ],
  "Categories": [
    "Money Market"
  ],
  "PerformanceByFund": null,
  "NoPriceFunds": null
}

Scenario: Get portfolio subscribtion allocations
Given request body:
{id: "%{subscribtionPortfolioId}"}
When I perform POST request to api/CxMallNew/GetSubscriptionAllocations
Then I save JSON field value using groovy query it[0]["Id"] into variable Id
Then I save JSON field value using groovy query it[0]["Date"] into variable Date
Then I save JSON field value using groovy query it[0]["GroupId"] into variable GroupId
Then response has status 200
And response JSON body is:
[
  {
    "Id": %{Id},
    "GroupId": %{GroupId},
    "Date": "%{Date}",
    "Positions": 0
  }
]

Scenario: Get subscribtion details
Given request body:
{portfolioId: %{portfolioId}}
When I perform POST request to api/CxMallNew/GetSubscriptionDetails
Then response has status 200
And response JSON body is:
{
  "InvestmentStrategy": false,
  "AlertFrequency": "Monthly",
  "AllocQualityIsOn": false,
  "AllocQualityPct": 0.0,
  "SecurityRequires": 0,
  "SecurityRequiresPercent": 1.0,
  "CategoriesRequires": 0,
  "CategoriesRequiresPercent": 1.0,
  "ReturnSinceInception": 0.0,
  "ReallocationsCount": 0,
  "Positions": 0,
  "HasAlerts": false,
  "Robotrader": false,
  "RobotraderAutoReallocOn": false,
  "RobotraderInResponseAlertOn": false,
  "RobotraderDurationTimes": 1,
  "RobotraderFrequency": 0,
  "SecurityIsOn": false,
  "CategoriesIsOn": false
}

Scenario: Update portolio subscribtion
!-- TODO: Make update after https://tickeron.atlassian.net/browse/TMA-5682 fix
Given Do nothing

Scenario: Delete portfolio subscribtion
Given request body:
{id: %{subscribtionPortfolioId}}
When I perform POST request to api/CxMallNew/DeletePortfolio
Then response has status 204
And I wait for 2001 milliseconds

Scenario: Search portfolio subscribtion after delete
Given request body:
{
  "request": {
    "Id": "%{subscribtionPortfolioId}",
    "PageIndex": 1,
    ShowDeleted: true,
    "PageSize": 1
  }
}
When I perform POST request to api/CxMallNew/SearchPortfolioSubscriptions
Then response has status 200
Then I save JSON field value using groovy query it["Items"][0]["GroupId"] into variable GroupId
Then I save JSON field value using groovy query it["Items"][0]["PublishedAt"] into variable PublishedAt
And response JSON body is:
{
  "Total": 1,
  "Items": [
    {
      "Id": %{subscribtionPortfolioId},
      "PortfolioId": %{portfolioId},
      "GroupId": %{GroupId},
      "Name": "%{portfolioGenerated}",
      "ReturnSinceInception": 0.0,
      "DaysSinceInception": 0,
      "Reallocations": 0,
      "Positions": 0,
      "Seller": {
        "Id": 159,
        "Name": "James Adv.",
        "Level": "Advisor",
        "ShortInfo": "123",
        "AvatarMode": "Initials",
        "AvatarColorHue": 0,
        "AvatarImageId": null
      },
      "Fee": 199.0000,
      "Description": "%{portfolioTitle}",
      "PublishedAt": "%{PublishedAt}",
      "IsBookmarked": false,
      "Preview": {
        "PortfolioId": %{portfolioId},
        "MarketValue": 0,
        "Labels": [
          "Cash"
        ],
        "Data": [
          100.0
        ]
      },
      "IsBought": false,
      "IsOwner": true,
      "IsArchivedAt": null
    }
  ]
}
