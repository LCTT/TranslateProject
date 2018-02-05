Review: Algorithms to Live By
======
![](https://www.eyrie.org/~eagle/reviews/covers/1-62779-037-3.jpg)

Another read for the work book club. This was my favorite to date, apart from the books I recommended myself.

One of the foundations of computer science as a field of study is research into algorithms: how do we solve problems efficiently using computer programs? This is a largely mathematical field, but it's often less about ideal or theoretical solutions and more about making the most efficient use of limited resources and arriving at an adequate, if not perfect, answer. Many of these problems are either day-to-day human problems or are closely related to them; after all, the purpose of computer science is to solve practical problems with computers. The question asked by Algorithms to Live By is "can we reverse this?": can we learn lessons from computer science's approach to problems that would help us make day-to-day decisions?

There's a lot of interesting material in the eleven chapters of this book, but there's also an amusing theme: humans are already very good at this. Many chapters start with an examination of algorithms and mathematical analysis of problems, dive into a discussion of how we can use those results to make better decisions, then talk about studies of the decisions humans actually make... and discover that humans are already applying ad hoc versions of the best algorithms we've come up with, given the constraints of typical life situations. It tends to undermine the stated goal of the book. Thankfully, it in no way undermines interesting discussion of general classes of problems, how computer science has tackled them, and what we've learned about the mathematical and technical shapes of those problems. There's a bit less self-help utility here than I think the authors had intended, but lots of food for thought.

(That said, it's worth considering whether this congruence is less because humans are already good at this and more because our algorithms are designed from human intuition. Maybe our best algorithms just reflect human thinking. In some cases we've checked our solutions against mathematical ideals, but in other cases they're still just our best guesses to date.)

This is the sort of a book where a chapter listing is an important part of the review. The areas of algorithms discussed here are optimal stopping, explore/exploit decisions (when to go with the best thing you've found and when to look for something better), sorting, caching, scheduling, Bayes's rule (and prediction in general), overfitting when building models, relaxation (solving an easier problem than your actual problem), randomized algorithms, a collection of networking algorithms, and finally game theory. Each of these has useful insights and thought-provoking discussion of how these sometimes-theoretical concepts map surprisingly well onto daily problems. The book concludes with a discussion of "computational kindness": an encouragement to reduce the required computation and complexity penalty for both yourself and the people you interact with.

If you have a computer science background (as I do), many of these will be familiar concepts, and you might be dubious that a popularization would tell you much that's new. Give this book a shot, though; the analogies are less stretched than you might fear, and the authors are both careful and smart about how they apply these principles. This book passes with flying colors a key sanity check: the chapters on topics that I know well or have thought about a lot make few or no obvious errors and say useful and important things. For example, the scheduling chapter, which unsurprisingly is about time management, surpasses more than half of the time management literature by jumping straight to the heart of most time management problems: if you're going to do everything on a list, it rarely matters the order in which you do it, so the hardest scheduling problems are about deciding what not to do rather than deciding order.

The point in the book where the authors won my heart completely was in the chapter on Bayes's rule. Much of the chapter is about Bayesian priors, and how one's knowledge of past events is a vital part of analysis of future probabilities. The authors then discuss the (in)famous marshmallow experiment, in which children are given one marshmallow and told that if they refrain from eating it until the researcher returns, they'll get two marshmallows. Refraining from eating the marshmallow (delayed gratification, in the psychological literature) was found to be associated with better life outcomes years down the road. This experiment has been used and abused for years for all sorts of propaganda about how trading immediate pleasure for future gains leads to a successful life, and how failure in life is because of inability to delay gratification. More evil analyses have (of course) tied that capability to ethnicity, with predictably racist results.

I have [kind of a thing][1] about the marshmallow experiment. It's a topic that reliably sends me off into angry rants.

Algorithms to Live By is the only book I have ever read to mention the marshmallow experiment and then apply the analysis that I find far more convincing. This is not a test of innate capability in the children; it's a test of their Bayesian priors. When does it make perfect sense to eat the marshmallow immediately instead of waiting for a reward? When their past experience tells them that adults are unreliable, can't be trusted, disappear for unpredictable lengths of time, and lie. And, even better, the authors supported this analysis with both a follow-up study I hadn't heard of before and with the observation that some children would wait for some time and then "give in." This makes perfect sense if they were subconsciously using a Bayesian model with poor priors.

This is a great book. It may try a bit too hard in places (applicability of the math of optimal stopping to everyday life is more contingent and strained than I think the authors want to admit), and some of this will be familiar if you've studied algorithms. But the writing is clear, succinct, and very well-edited. No part of the book outlives its welcome; the discussion moves right along. If you find yourself going "I know all this already," you'll still probably encounter a new concept or neat explanation in a few more pages. And sometimes the authors make connections that never would have occurred to me but feel right in retrospect, such as relating exponential backoff in networking protocols to choosing punishments in the criminal justice system. Or the realization that our modern communication world is not constantly connected, it's constantly buffered, and many of us are suffering from the characteristic signs of buffer bloat.

I don't think you have to be a CS major, or know much about math, to read this book. There is a lot of mathematical details in the end notes if you want to dive in, but the main text is almost always readable and clear, at least so far as I could tell (as someone who was a CS major and has taken a lot of math, so a grain of salt may be indicated). And it still has a lot to offer even if you've studied algorithms for years.

The more I read of this book, the more I liked it. Definitely recommended if you like reading this sort of analysis of life.

Rating: 9 out of 10

Reviewed: 2017-10-22

--------------------------------------------------------------------------------

via: https://www.eyrie.org/~eagle/reviews/books/1-62779-037-3.html

作者：[Brian Christian;Tom Griffiths][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.eyrie.org
[1]:https://www.eyrie.org1-59184-679-X.html
