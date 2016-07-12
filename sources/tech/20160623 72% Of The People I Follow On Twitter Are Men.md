72% Of The People I Follow On Twitter Are Men
===============================================

![](https://emptysqua.re/blog/gender-of-twitter-users-i-follow/abacus.jpg)

At least, that's my estimate. Twitter does not ask users their gender, so I [have written a program that guesses][1] based on their names. Among those who follow me, the distribution is even worse: 83% are men. None are gender-nonbinary as far as I can tell.

The way to fix the first number is not mysterious: I should notice and seek more women experts tweeting about my interests, and follow them.

The second number, on the other hand, I can merely influence, but I intend to improve it as well. My network on Twitter should represent of the software industry's diverse future, not its unfair present.

### How Did I Measure It?

I set out to estimate the gender distribution of the people I follow—my "friends" in Twitter's jargon—and found it surprisingly hard. [Twitter analytics][2] readily shows me the converse, an estimate of my followers' gender:

![](https://emptysqua.re/blog/gender-of-twitter-users-i-follow/twitter-analytics.png)

So, Twitter analytics divides my followers' accounts among male, female, and unknown, and tells me the ratio of the first two groups. (Gender-nonbinary folk are absent here—they're lumped in with the Twitter accounts of organizations, and those whose gender is simply unknown.) But Twitter doesn't tell me the ratio of my friends. That [which is measured improves][3], so I searched for a service that would measure this number for me, and found [FollowerWonk][4].

FollowerWonk guesses my friends are 71% men. Is this a good guess? For the sake of validation, I compare FollowerWonk's estimate of my followers to Twitter's estimate:

**Twitter analytics**

 	          |men	    |women
:--         |:--      |:-- 	          
Followers	  |83%	    |17%

**FollowerWonk**

 	                |men	    |women
:--               |:--      |:-- 	                
Followers	        |81%	    |19%
Friends I follow	|72%	    |28%

My followers show up 81% male here, close to the Twitter analytics number. So far so good. If FollowerWonk and Twitter agree on the gender ratio of my followers, that suggests FollowerWonk's estimate of the people I follow (which Twitter doesn't analyze) is reasonably good. With it, I can make a habit of measuring my numbers, and improve them.

At $30 a month, however, checking my friends' gender distribution with FollowerWonk is a pricey habit. I don't need all its features anyhow. Can I solve only the gender-distribution problem economically?

Since FollowerWonk's numbers seem reasonable, I tried to reproduce them. Using Python and [some nice Philadelphians' Twitter][5] API wrapper, I began downloading the profiles of all my friends and followers. I immediately found that Twitter's rate limits are miserly, so I randomly sampled only a subset of users instead.

I wrote a rudimentary program that searches for a pronoun announcement in each of my friends' profiles. For example, a profile description that includes "she/her" probably belongs to a woman, a description with "they/them" is probably nonbinary. But most don't state their pronouns: for these, the best gender-correlated information is the "name" field: for example, @gvanrossum's name field is "Guido van Rossum", and the first name "Guido" suggests that @gvanrossum is male. Where pronouns were not announced, I decided to use first names to estimate my numbers.

My script passes parts of each name to the SexMachine library to guess gender. [SexMachine][6] has predictable downfalls, like mistaking "Brooklyn Zen Center" for a woman named "Brooklyn", but its estimates are as good as FollowerWonk's and Twitter's:



 	                |nonbinary	    |men	    |women	    |no gender,unknown
:--               |:--            |:--      |:--        |:--
Friends I follow	|1	            |168	    |66	        |173
 	                |0%	            |72%	    |28%	      |
Followers	        |0	            |459	    |108	      |433
 	                |0%	            |81%	    |19%	      |

(Based on all 408 friends and a sample of 1000 followers.)

### Know Your Number

I want you to check your Twitter network's gender distribution, too. So I've deployed "Proportional" to PythonAnywhere's handy service for $10 a month:

><www.proporti.onl>

The application may rate-limit you or otherwise fail, so use it gently. The [code is on GitHub][7]. It includes a command-line tool, as well.

Who is represented in your network on Twitter? Are you speaking and listening to the same unfairly distributed group who have been talking about software for the last few decades, or does your network look like the software industry of the future? Let's know our numbers and improve them.





--------------------------------------------------------------------------------

via: https://emptysqua.re/blog/gender-of-twitter-users-i-follow/

作者：[A. Jesse Jiryu Davis][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://disqus.com/by/AJesseJiryuDavis/
[1]: https://www.proporti.onl/
[2]: https://analytics.twitter.com/
[3]: http://english.stackexchange.com/questions/14952/that-which-is-measured-improves
[4]: https://moz.com/followerwonk/
[5]: https://github.com/bear/python-twitter/graphs/contributors
[6]: https://pypi.python.org/pypi/SexMachine/
[7]: https://github.com/ajdavis/twitter-gender-distribution
