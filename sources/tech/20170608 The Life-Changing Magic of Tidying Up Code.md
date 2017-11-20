# The Life-Changing Magic of Tidying Up Code

I have been tidying up Facebook code this week and loving it. I’ve tidied up for thousands of hours over my career, and I have some rules for making this style of cleanup safe, fun, and efficient.Tidying up works through a series of small, safe steps. In fact, Rule #1 is If it’s hard, don’t do it. I used to do crossword puzzles at night. If I got stuck and went to sleep, the next night those same impossible clues were often easy. Instead of stressing about the big effects I want to create, I am better off just stopping when I encounter resistance.Tidying up is concave in the sense that you have a lot more to lose by a mistake than you have to win by any individual success (more on that later). Rule #2 is Start when you’re fresh and stop when you’re tired. Get up and walk around. If I don’t come back refreshed, I’m done for the day.Tidying up can happen in parallel with development, but only if you carefully track other changes (I messed this up with my latest diff). Rule #3 is Land each session’s work immediately. Unlike feature development, where it sometimes makes sense to land only when a chunk of work is done, tidying up is time based.Tidying up requires little effort for any step, so I am willing to discard any step at the first sign of trouble. For example, Rule #4 is Two reds is a revert. If I tidy, run the tests, and encounter a failed test, then if I can fix it immediately I do. If I try to fix it and fail, I immediately revert to the last known good state.Tidying up works even without a vision of the shiny new design. However, sometimes I want to see how things might play out, so Rule #5 is Practice. Perform a sequence of tidyings and revert. The second time will go much faster and you’ll be more familiar with which bumpy spots to avoid.Tidying up works only if the risk of collateral damage is low and the cost of reviewing tidying changes is also low. Rule #6 is Isolate tidying. This can be tough when you run across the chance to tidy in the midst of writing new code. Either finish and then tidy or revert, tidy, and make your changes.Try it. Move the declaration of a temp adjacent to its first use. Simplify a boolean expression (“return expression == True” anyone?). Extract a helper. Reduce the scope of logic or state to where it is actually used.

### The Rules

1.  If it’s hard, don’t do it

2.  Start when you’re fresh and stop when you’re tired

3.  Land each session’s work immediately

4.  Two reds is a revert

5.  Practice

6.  Isolate tidying

### Coda

I’ve made architectural changes strictly by tidying. I’ve extracted frameworks strictly by tidying. You can make big changes safely in this style. I think this is because, while the cost of each tidying is constant, the payoff is power-law distributed. I need both data and a model to explain this hypothesis.

--------------------------------------------------------------------------------

via: https://www.facebook.com/notes/kent-beck/the-life-changing-magic-of-tidying-up-code/1544047022294823/

作者：[KENT BECK ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.facebook.com/kentlbeck
[1]:https://www.facebook.com/notes/kent-beck/the-life-changing-magic-of-tidying-up-code/1544047022294823/?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#
[2]:https://www.facebook.com/kentlbeck
[3]:https://www.facebook.com/notes/kent-beck/the-life-changing-magic-of-tidying-up-code/1544047022294823/
