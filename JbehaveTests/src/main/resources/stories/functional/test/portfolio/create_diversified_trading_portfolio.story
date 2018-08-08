Story: Functional CRUD portfolio

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.beginner.username
And Set test param password value from property param.beginner.password
And I generate Functional_P + UUID and put it to test param portfolioGenerated


Scenario: Create diversified trading porfolio
Meta:
@name Create diversified trading porfolio
Given I authenticated using JSON with username %{username} and password %{password}
!-- get user id
Given request body: {}
When I perform POST request to api/CxUser/GetMyselfFullInfo
Then response has status 200
And I save JSON field Id value into variable userId
!-- create portfolio
Given request body:
{
  "header": {
    "Title": "%{portfolioGenerated}",
    "CashReserves": "L",
    "RiskLevel": "2",
    "WillAddMoney": 0,
    "YearsTill": "0",
    "IsRetirement": false,
    "UsState": "AL",
    "DivScoreImportant": true,
    "IsStatic": false,
    "IsStaticApplyed": true,
    "MinPerPosition": "4.00",
    "MinPerRebalance": "4.00",
    "FundGroups": [

    ],
    "OwnerId": %{userId},
    "Volatility": 0,
    "HasBrokerageAccount": 0,
    "IsOwner": true,
    "UsePatterns": false,
    "UsePredictions": false,
    "ExternalPortfolioId": null
  },
  "funds": {
    "Amount": 10000,
    "Amounts": [
      10000
    ],
    "IsPctMode": [
      false
    ],
    "MarketValue": 0,
    "AsIf": "2016-12-28T13:07:47.182Z",
    "YouAllocation": true,
    "ComputerAllocation": false,
    "CounterPartAllocation": false,
    "CounterPartAllocName": "",
    "Funds": [
      {
        "Allocations": [
          10000
        ],
        "Price": 1,
        "Category": "Money Market",
        "Group": "Cash",
        "Id": -1,
        "Name": "CASH",
        "Ticker": "CASHRSV",
        "Type": "Mutual"
      },
      {
        "Allocations": [
          0
        ],
        "Price": 807.8,
        "IsInBoughtOnly": false,
        "IsActive": null,
        "Group": "Domestic Stock Funds",
        "Category": "Technology",
        "Name": "Alphabet Inc. Class A",
        "Ticker": "GOOGL",
        "Type": "Stock",
        "Id": 72469
      },
      {
        "Allocations": [
          0
        ],
        "Price": 116.52,
        "IsInBoughtOnly": false,
        "IsActive": null,
        "Group": "Domestic Stock Funds",
        "Category": "Technology",
        "Name": "Apple Inc.",
        "Ticker": "AAPL",
        "Type": "Stock",
        "Id": 33807
      }
    ],
    "FundsOther": [
      {
        "Allocations": [
          0
        ],
        "Price": 807.8,
        "IsInBoughtOnly": false,
        "IsActive": null,
        "Group": "Domestic Stock Funds",
        "Category": "Technology",
        "Name": "Alphabet Inc. Class A",
        "Ticker": "GOOGL",
        "Type": "Stock",
        "Id": 72469
      },
      {
        "Allocations": [
          0
        ],
        "Price": 116.52,
        "IsInBoughtOnly": false,
        "IsActive": null,
        "Group": "Domestic Stock Funds",
        "Category": "Technology",
        "Name": "Apple Inc.",
        "Ticker": "AAPL",
        "Type": "Stock",
        "Id": 33807
      }
    ],
    "MarketValues": [
      0
    ],
    "PreviousState": {
      "Amount": 10000,
      "Amounts": [
        10000
      ],
      "IsPctMode": [
        true
      ],
      "MarketValue": 0,
      "AsIf": "2016-12-28T13:07:47.182Z",
      "YouAllocation": true,
      "ComputerAllocation": false,
      "CounterPartAllocation": false,
      "CounterPartAllocName": "",
      "Funds": [
        {
          "Allocations": [
            100
          ],
          "Price": 1,
          "Category": "Money Market",
          "Group": "Cash",
          "Id": -1,
          "Name": "CASH",
          "Ticker": "CASHRSV",
          "Type": "Mutual"
        }
      ],
      "FundsOther": [
        {
          "Allocations": [
            0
          ],
          "Price": 807.8,
          "IsInBoughtOnly": false,
          "IsActive": null,
          "Group": "Domestic Stock Funds",
          "Category": "Technology",
          "Name": "Alphabet Inc. Class A",
          "Ticker": "GOOGL",
          "Type": "Stock",
          "Id": 72469
        },
        {
          "Allocations": [
            0
          ],
          "Price": 116.52,
          "IsInBoughtOnly": false,
          "IsActive": null,
          "Group": "Domestic Stock Funds",
          "Category": "Technology",
          "Name": "Apple Inc.",
          "Ticker": "AAPL",
          "Type": "Stock",
          "Id": 33807
        }
      ],
      "MarketValues": [
        0
      ],
      "PreviousState": {
        "Amount": 10000,
        "Amounts": [
          10000
        ],
        "IsPctMode": [
          false
        ],
        "MarketValue": 0,
        "AsIf": "2016-12-28T13:07:47.182Z",
        "YouAllocation": true,
        "ComputerAllocation": false,
        "CounterPartAllocation": false,
        "CounterPartAllocName": "",
        "Funds": [
          {
            "Allocations": [
              10000
            ],
            "Price": 1,
            "Category": "Money Market",
            "Group": "Cash",
            "Id": -1,
            "Name": "CASH",
            "Ticker": "CASHRSV",
            "Type": "Mutual"
          }
        ],
        "FundsOther": [
          {
            "Allocations": [
              0
            ],
            "Price": 807.8,
            "IsInBoughtOnly": false,
            "IsActive": null,
            "Group": "Domestic Stock Funds",
            "Category": "Technology",
            "Name": "Alphabet Inc. Class A",
            "Ticker": "GOOGL",
            "Type": "Stock",
            "Id": 72469
          },
          {
            "Allocations": [
              0
            ],
            "Price": 116.52,
            "IsInBoughtOnly": false,
            "IsActive": null,
            "Group": "Domestic Stock Funds",
            "Category": "Technology",
            "Name": "Apple Inc.",
            "Ticker": "AAPL",
            "Type": "Stock",
            "Id": 33807
          }
        ],
        "MarketValues": [
          0
        ],
        "PreviousState": null
      }
    }
  },
  "asPct": null
}
When I perform POST request to api/CxPortfolio/CreatePortfolio
Then response has status 200
And I save result to variable portfolioId


Scenario: Get non diversified trading porfolio
Given request body:
{id: "%{portfolioId}", getPerformance: false}
When I perform POST request to api/CxPortfolio/GetPortfolioForEditAndSummary
Then response has status 200
And response JSON body satisfies condition:
it["Header"]["Title"] == "%{portfolioGenerated}" &&
it["Funds"]["Amount"] == 10000 &&
it["Funds"]["Funds"][0]["Allocations"][0] == 10000

Scenario: Delete porfolio
Given request body:
{portfolioId: %{portfolioId}}
When I perform POST request to api/CxPortfolio/DeletePortfolio
Then response has status 204
And response body is empty
