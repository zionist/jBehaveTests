Story: Functional - Login as ContentAdmin

Scenario:
Setup params. Set user to advisor

Scenario: Login as ConentAdmin
Given Set test param username value from property param.accountadmin.username
And Set test param password value from property param.accountadmin.password
And request body:
{
  "login": "%{username}",
  "password": "%{password}",
  "rememberMe": true
}
When I perform POST request to api/CxAdminAuth/Login
Then response has status 204
