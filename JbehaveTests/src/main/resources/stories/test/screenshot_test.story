Story: make screenshot

Scenario:
Test make screenshot
Meta:
@basic
Given Browser ready
!-- When Make screenshot in file screenshot_test/test1
When I wait small timeout
When Make/Compare screenshot to/with file screenshot_test/test1

