Story: Mall Functional CRUD model portfolio

Scenario:
Setup params. Set user to advisor
Given Set test param username value from property param.advisor.username
Given Set test param password value from property param.advisor.password
And I generate Functional_P + UUID and put it to test param portfolioGenerated
And I generate Title + UUID and put it to test param modelPortfolioTitle
And I generate Title2 + UUID and put it to test param modelPortfolioTitle2

Scenario: Create portfolio
GivenStories:
    stories/functional/test/portfolio/create_investement_portfolio.story#{name:Create investment porfolio},
Given Do nothing

Scenario: Create model porfolio
Given I authenticated using JSON with username %{username} and password %{password}
Given request body:
{
  "request": {
    "Id": null,
    "PortfolioId": %{portfolioId},
    "Fee": 199,
    "Description": "%{modelPortfolioTitle}"
  }
}
When I perform POST request to api/CxMallNew/ManageModelPortfolio
Then response has status 200
And I wait for 2001 milliseconds
And I save result to variable modelPortfolioId

Scenario: Search model portfolios
Given request body:
{
  "request": {
    "Id": "%{modelPortfolioId}",
    "PageIndex": 1,
    "PageSize": 1
  }
}
When I perform POST request to api/CxMallNew/SearchModelPortfolios
Then response has status 200
Then I save JSON field value using groovy query it["Items"]["ListedOn"][0] into variable ListedOn
And response JSON body is:
{
  "Total": 1,
  "Items": [
    {
      "Id": %{modelPortfolioId},
      "Title": "%{portfolioGenerated}",
      "Description": "%{modelPortfolioTitle}",
      "SelectionQuality": 0.0,
      "ListedOn": "%{ListedOn}",
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
      "Price": 199.0000,
      "PortfolioId": %{portfolioId},
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
      "IsOwner": true
    }
  ]
}

Scenario: Get model portfolio details
Given request body:
{"portfolioId": %{portfolioId}}
When I perform POST request to api/CxMallNew/GetModelPortfolioDetails
Then response has status 200
And response JSON body is:
{
  "Positions": 0,
  "AllocationQuality": 100.00000000000001,
  "SelectionQuality": 0.0
}

Scenario: get model portfolio allocations
Given request body:
{"id":"%{modelPortfolioId}"}
When I perform POST request to api/CxMallNew/GetModelPortfolioAllocations
Then response has status 200
And response JSON body is:
[
  {
    "Price": 1.0,
    "Name": "CASH",
    "Ticker": "CASHRSV",
    "Group": "Cash",
    "Category": "Money Market",
    "Type": "Mutual",
    "Allocation": 100.0
  }
]


Scenario: Create second portfolio
Given I generate Functional_P + UUID and put it to test param portfolioGenerated

Scenario: Create second portfolio 2
GivenStories:
    stories/functional/test/portfolio/create_investement_portfolio.story#{name:Create investment porfolio},
Given Do nothing

Scenario: Update model portfolio
Given request body:
{
  "request": {
    "Id": %{modelPortfolioId},
    "PortfolioId": %{portfolioId},
    "Fee": 198,
    "Description": "%{modelPortfolioTitle2}"
  }
}
When I perform POST request to api/CxMallNew/ManageModelPortfolio
Then response has status 200
And I wait for 2001 milliseconds

Scenario: Search model portfolios after update
Given request body:
{
  "request": {
    "Id": "%{modelPortfolioId}",
    "PageIndex": 1,
    "PageSize": 1
  }
}
When I perform POST request to api/CxMallNew/SearchModelPortfolios
Then response has status 200
Then I save JSON field value using groovy query it["Items"]["ListedOn"][0] into variable ListedOn
And response JSON body is:
{
  "Total": 1,
  "Items": [
    {
      "Id": %{modelPortfolioId},
      "Title": "%{portfolioGenerated}",
      "Description": "%{modelPortfolioTitle2}",
      "SelectionQuality": 0.0,
      "ListedOn": "%{ListedOn}",
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
      "Price": 198.0000,
      "PortfolioId": %{portfolioId},
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
      "IsOwner": true
    }
  ]
}

Scenario: Delete model portfolio
Given request body:
{"id":"%{modelPortfolioId}"}
When I perform POST request to api/CxMallNew/DeletePortfolio
Then response has status 204
And I wait for 2001 milliseconds

Scenario: Search model portfolios after delete
Given request body:
{
  "request": {
    "Id": "%{modelPortfolioId}",
    "ShowDeleted":true,
    "PageIndex": 1,
    "PageSize": 1
  }
}
When I perform POST request to api/CxMallNew/SearchModelPortfolios
Then response has status 200
Then I save JSON field value using groovy query it["Items"]["ListedOn"][0] into variable ListedOn
And response JSON body is:
{
  "Total": 1,
  "Items": [
    {
      "Id": %{modelPortfolioId},
      "Title": "%{portfolioGenerated}",
      "Description": "%{modelPortfolioTitle2}",
      "SelectionQuality": 0.0,
      "ListedOn": "%{ListedOn}",
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
      "Price": 198.0000,
      "PortfolioId": %{portfolioId},
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
      "IsOwner": true
    }
  ]
}
