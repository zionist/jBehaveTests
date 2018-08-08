Story: Functional - example of admin CRU

Scenario:
Setup params. Set user to AccountAdmin
Given Set test param username value from property param.accountadmin.username
And Set test param password value from property param.accountadmin.password
And I generate admin_ + UUID and put it to test param adminGeneratedName

Scenario: Login as AccountAdmin
Given request body:
{
  "login": "%{username}",
  "password": "%{password}",
  "rememberMe": true
}
When I perform POST request to api/CxAdminAuth/Login
Then response has status 204

Scenario: Create admin
Given request body:
{
  "request": {
    "FullName": "%{adminGeneratedName}",
    "Email": "%{adminGeneratedName}@test.com",
    "Password": "1Qwertyu",
    "Roles": {
      "IsContentAdmin": true,
      "IsSystemAdmin": true,
      "IsUserAdmin": true,
      "IsDataAdmin": true,
      "IsMallAdmin": true,
      "IsFinancialAdmin": true,
      "IsAdminAccountsAdmin": true
    }
  }
}
When I perform POST request to api/CxAdminAccounts/CreateAdminAccount
Then response has status 200
And I save result to variable adminUserId
And response body is: %{adminUserId}

Scenario: Search created admin
Given request body:
{
  "request": {
    "SearchString": "%{adminGeneratedName}",
    "Offset": 0,
    "PageSize": 90
  }
}
When I perform POST request to api/CxAdminAccounts/SearchAdminAccounts
Then response has status 200
And response JSON body is:
[
  {
    "Id": %{adminUserId},
    "Email": "%{adminGeneratedName}@test.com",
    "FullName": "%{adminGeneratedName}",
    "Roles": {
      "IsContentAdmin": true,
      "IsSystemAdmin": true,
      "IsUserAdmin": true,
      "IsDataAdmin": true,
      "IsFinancialAdmin": true,
      "IsAdminAccountsAdmin": true,
      "IsMallAdmin": true
    }
  }
]

Scenario: Update admin
Given request body:
{
  "request": {
    "Id": %{adminUserId},
    "Email": "%{adminGeneratedName}@test_updated.com",
    "FullName": "%{adminGeneratedName}_updated",
    "Roles": {
      "IsContentAdmin": false,
      "IsSystemAdmin": false,
      "IsUserAdmin": false,
      "IsDataAdmin": false,
      "IsFinancialAdmin": false,
      "IsAdminAccountsAdmin": false,
      "IsMallAdmin": false
    }
  }
}
When I perform POST request to api/CxAdminAccounts/UpdateAdminAccount
Then response has status 204
!-- check admin is updated
Given request body:
{
  "request": {
    "SearchString": "%{adminGeneratedName}_updated",
    "Offset": 0,
    "PageSize": 90
  }
}
When I perform POST request to api/CxAdminAccounts/SearchAdminAccounts
Then response has status 200
And response JSON body is:
[
  {
    "Id": %{adminUserId},
    "Email": "%{adminGeneratedName}@test_updated.com",
    "FullName": "%{adminGeneratedName}_updated",
    "Roles": {
      "IsContentAdmin": false,
      "IsSystemAdmin": false,
      "IsUserAdmin": false,
      "IsDataAdmin": false,
      "IsFinancialAdmin": false,
      "IsAdminAccountsAdmin": false,
      "IsMallAdmin": false
    }
  }
]
