Story: Production Check on right-side "circles"

Scenario:
click on right-side "circles"
Meta:
@name click on right-side "circles"
Given Browser ready
And I wait big timeout
When I click on 1st cercle with css selector .homepage-pager > span:nth-child(1)
When I click on 1st cercle with css selector .homepage-pager > span:nth-child(1)
Then I see head of page with css selector article.homepage-slide:nth-child(3) > div:nth-child(2) > div:nth-child(2) contains: All levels of experience are welcome.
And I wait small timeout
When I click on 2nd cercle with css selector .homepage-pager > span:nth-child(2)
Then I see head of page with css selector article.homepage-slide:nth-child(4) > div:nth-child(2) > div:nth-child(2) contains: Use our Artificial Intelligence (A.I.) to find out.
And I wait small timeout
When I click on 3rd cercle with css selector .homepage-pager > span:nth-child(3)
Then I see head of page with css selector article.homepage-slide:nth-child(5) > div:nth-child(2) > div:nth-child(2) contains: Compare your allocation strategy to those generated by
And I wait small timeout
When I click on 4th cercle with css selector .homepage-pager > span:nth-child(4)
Then I see head of page with css selector article.homepage-slide:nth-child(6) > div:nth-child(2) > div:nth-child(2) contains: Monetize your ideas through our marketplace (MALL)
And I wait small timeout
When I click on 5th cercle with css selector .homepage-pager > span:nth-child(5)
Then I see head of page with css selector article.homepage-slide:nth-child(7) > div:nth-child(2) > div:nth-child(2) contains: Many of our members activate the "Let Advisor find me" function,