Story: Production Check user test level

Scenario:
click on What's your level? link
Meta:
@name click on What's your level? link
Given Browser ready
And I wait small timeout
When I click on What's your level? link  with css selector .prelogin-marketing__level_link
And I wait small timeout
Then I see What's your level? pop-up with css selector .cx-marketing-modal__title contains: What's your level?
And I wait small timeout
!-- Click on Yes->Yes buttons
When I click on Yes button with css selector div.container-fluid:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(1) > span:nth-child(2)
And I click on Yes button with css selector div.container-fluid:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(1) > span:nth-child(2)
Then I see Advisor result with css selector .prelogin-marketing-level-test-selected-level contains: advisor
When I click on Start over button with css selector div.row:nth-child(6) > div:nth-child(1) > span:nth-child(1)
And I wait small timeout
!-- Click on Yes->No buttons
When I click on Yes button with css selector div.container-fluid:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(1) > span:nth-child(2)
And I click on No button with css selector div.container-fluid:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(1) > span:nth-child(1)
Then I see Advisor result with css selector .prelogin-marketing-level-test-selected-level contains: expert
When I click on Start over button with css selector div.row:nth-child(6) > div:nth-child(1) > span:nth-child(1)
And I wait small timeout
!-- Click on No->Yes buttons
When I click on No button with css selector div.container-fluid:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(1) > span:nth-child(1)
And I click on Yes button with css selector div.container-fluid:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(1) > span:nth-child(2)
Then I see Advisor result with css selector .prelogin-marketing-level-test-selected-level contains: intermediate
When I click on Start over button with css selector div.row:nth-child(6) > div:nth-child(1) > span:nth-child(1)
And I wait small timeout
!-- Click on No->No buttons
When I click on No button with css selector div.container-fluid:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(1) > span:nth-child(1)
And I click on No button with css selector div.container-fluid:nth-child(2) > div:nth-child(1) > div:nth-child(5) > div:nth-child(1) > span:nth-child(1)
Then I see Advisor result with css selector .prelogin-marketing-level-test-selected-level contains: beginner
When I click on See details button with css selector div.row:nth-child(6) > div:nth-child(1) > span:nth-child(2)
And I wait small timeout
Then I see beginners tab with css selector div.text-center:nth-child(1) contains: BEGINNERS
And I wait small timeout
When I click on lable with css selector .prelogin-marketing-panel-top-menu > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > img:nth-child(1)
And I wait big timeout