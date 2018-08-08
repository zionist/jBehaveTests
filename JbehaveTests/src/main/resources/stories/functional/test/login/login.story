Story: Functional login

Scenario:
Setup params. Set user to Advisor
Given Set test param username value from property param.advisor.username
And Set test param password value from property param.advisor.password

Scenario: api/Account/Login
Meta:
@name Login
Given request body:
{
  "login": "%{username}",
  "password": "%{password}",
  "rememberMe": true,
  "captchaValue": null
}
When I perform POST request to api/Account/Login
Then response has status 200
