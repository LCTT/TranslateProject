[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Some Useful Probability Facts for Systems Programming)
[#]: via: (https://theartofmachinery.com/2020/01/27/systems_programming_probability.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

Some Useful Probability Facts for Systems Programming
======

Probability problems come up a lot in systems programming, and I’m using that term loosely to mean everything from operating systems programming and networking, to building large online services, to creating virtual worlds like in games. Here’s a bunch of rough-and-ready probability rules of thumb that are deeply related and have many practical applications when designing systems.

## (\frac{1}{N}) chance tried (N) times

Retries are everywhere in systems programming. For example, imagine you’re designing a world for a roleplaying game. When monsters in one particular forest are defeated, they have a small chance of dropping some special item. Suppose that chance is (\frac{1}{10}). Basic probability says that players are expected to need 10 victories before gaining a special item. But in probability, “expected value” is just a kind of average value, and there’s no guarantee that players will get the item even if they do win 10 battles.

What’s a player’s chance of getting at least one special item after 10 battles? Let’s just try getting a computer to calculate the probability of getting at least one success for (N) tries at a (\frac{1}{N}) chance, for a range of values of (N):

![Plot of probability of at least one success after trying a 1/N chance N times. The probability starts at 100% and drops, but quickly flattens out to a value just below 65%.][1]

Eyeballing the graph, it looks like the probability is roughly constant for (N) greater than about 3. In fact, it converges on (1 - e^{- 1}), where (e) is Euler’s constant, 2.718281828459… This number (along with (e^{- 1})) is extremely common in engineering, so here’s a table of practical values:

exp(-1.0) | 1.0-exp(-1.0)
---|---
36.7% | 63.2%
A bit over a third | A bit under two thirds

So, if you don’t need an exact answer (and you often don’t) you could just say that if the drop probability is (\frac{1}{10}), most players will get a special item within 10 battles, but (close enough) about a third won’t. Because the monster battles are statistically independent, we can make a rough guess that about 1 in 9 players still won’t have a special item after 20 battles. Also, roughly 60% won’t after 5 battles because (0.6 \times 0.6 = 0.36), so 60% is close to the square root of 36.7%.

> If you have (\frac{1}{N}) chance of success, then you’re more likely than not to have succeeded after (N) tries, but the probability is only about two thirds (or your favourite approximation to (1 - e^{- 1})). The value of (N) doesn’t affect the approximation much as long as it’s at least 3.

Here’s the proof: The chance of the player failing to get a special item after all (10) battles is ((\frac{9}{10})^{10} = .349), so the chance of getting at least one is (1 - .349 = .651). More generally, the chance of succeeding at least once is (1 - (1 - \frac{1}{N})^{N}), which converges on (1 - e^{- 1}) (by [one of the definitions of (e)][2]).

By the way, this rule is handy for quick mental estimates in board games, too. Suppose a player needs to get at least one 6 from rolling 8 six-sided dice. What’s probability of failure? It’s about (\frac{1}{3}) for the first 6 dice, and (\frac{5}{6} \times \frac{5}{6}) for the remaining two, so all up it’s about (\frac{1}{3} \times \frac{25}{36} \approx \frac{8}{36} \approx \frac{1}{4}). A calculator says ((\frac{5}{6})^{8} = .233), so the rough approximation was good enough for gameplay.

## (N) balls in (N) buckets

I’ll state this one up front:

> Suppose you throw (N) balls randomly (independently and one at a time) into (N) buckets. On average, a bit over a third ((e^{- 1})) of the buckets will stay empty, a bit over a third ((e^{- 1}) again) will have exactly one ball, and the remaining quarter or so ((1 - 2e^{- 1})) will contain multiple balls.

The balls-and-buckets abstract model has plenty of concrete engineering applications. For example, suppose you have a load balancer randomly assigning requests to 12 backends. If 12 requests come in during some time window, on average about 4 of the backends will be idle, only about 4 will have a balanced single-request load, and the remaining (average) 3 or 4 will be under higher load. Of course, all of these are averages, and there’ll be fluctuations in practice.

As another example, if a hash table has (N) slots, then if you put (N) different values into it, about a third of the slots will still be empty and about a quarter of the slots will have collisions.

If an online service has a production incident once every 20 days on average, then (assuming unrelated incidents) just over a third of 20-day periods will be dead quiet, just over a third will have the “ideal” single incident, while a quarter of 20-day periods will be extra stressful. In the real world, production incidents are even more tightly clustered because they’re not always independent.

This rule of thumb also hints at why horizontally scaled databases tend to have hot and cold shards, and why low-volume businesses (like consulting) can suffer from feast/famine patterns of customer demand.

Random allocation is much more unbalanced than we intuitively expect. A famous example comes from World War II when, late in the war, the Germans launched thousands of V-1 and V-2 flying bombs at London. Hitting a city with a rocket from across the Channel already required pushing 1940s technology to new limits, but several British analysts looked at maps of bomb damage and concluded that the Germans were somehow targetting specific areas of London, implying an incredible level of technological advancement. In 1946, however, an actuary did the proper statistical analysis and said that, no, [the clustering of bomb damage was simply what you’d expect from random chance][3]. (That analysis is based on the [Poisson distribution][4], and the ratios in the rule for (N) balls and (N) buckets can be calculated from a Poisson distribution with (\lambda = \frac{N}{N} = 1).)

![25 points uniformly randomly placed on a 5x5 grid, showing spurious clustering. 8 boxes are empty, 10 boxes contain one point and 7 boxes contain two or more points.][5]

Random allocation only balances out when the number of “balls” is much larger than the number of “buckets”, i.e., when averaging over a large number of items, or a long time period. That’s one of the many reasons that engineering solutions that work well for large-scale FAANG companies can be problematic when used by companies that are orders of magnitude smaller.

Proving the third-third-quarter rule is pretty easy if you look at just one bucket. Each of the (N) balls represents a (\frac{1}{N}) chance of adding a ball to the bucket, so the chance of the bucket staying empty is just the (e^{- 1} \approx 36.7%) from the first rule. Linearity of expectation means we can combine the results for each bucket and say that 36.7% of _all_ buckets are expected to be empty, even though the bucket counts aren’t independent. Also, there are (N) possible ways of exactly one ball landing in the bucket, and each way requires one ball to fall in (with probability (\frac{1}{N})) and the other (N - 1) balls to miss (with probability (1 - \frac{1}{N})). So the probably of exactly one ball falling in is (\left. N \times \frac{1}{N} \times (1 - \frac{1}{N})^{N - 1}\rightarrow e^{- 1} \right.).

### Fixed points of random permutations

I don’t think this rule has as many practical applications as the (N) balls/buckets rule, but it’s kind of a freebie.

Think of a battle game in which 6 players start from 6 spawn/home points. If the players play a second round, what’s the chance that someone starts from the same point? Mathematically, that’s asking about the chance of a random permutation having a “fixed point”.

> If a group of things are randomly shuffled, a bit of over a third ((e^{- 1})) of the time there’ll be no fixed points, a bit of over a third ((e^{- 1})) of the time there’ll be just one fixed point, and the remaining quarter or so of the time there’ll be two or more.

The number of fixed points in a random shuffle happens to approximate the same distribution as the number of balls in the buckets before, which can be [proven from first principles using the inclusion-exclusion principle][6]. But there’s an even simpler proof for a related fact:

> A random permutation has exactly one fixed point on average, regardless of size.

If there are (N) things, each one has a (\frac{1}{N}) chance of ending up in its original location after the shuffle, so on average there’ll be (N \times \frac{1}{N} = 1) fixed points. Note that it’s impossible to get exactly one fixed point by shuffling a two element set (try it!) but 1 is still the average of 2 and 0. (“Average” doesn’t always mean what we want it to mean.)

That proof might seem too simple, but it’s a demonstration of how powerful linearity of expectation is. Trying to calculate statistics for permutations can be tricky because the places any item can go depend on the places all the other items have gone. Linearity of expectation means we don’t have to care about all the interactions as long as we only need to know the average. The average isn’t always the most useful statistic to calculate, but it’s often the easiest by far.

## The coupon collector’s problem

Let’s look at [the common “loot box” mechanism][7]. Specifically, suppose there are 10 collector items (say, one for each hero in a franchise) that are sold in blind boxes. Let’s take the fairest case in which there are no rare items and each item has an equal (\frac{1}{10}) chance of being in a given box. How many boxes will a collector buy on average before getting a complete set? This is the called the coupon collector’s problem, and for 10 items the answer is about 29.

> The answer to the coupon collector’s problem is a bit more than (N\ln N) (add (\frac{N}{2}) for some more accuracy).

((\ln N) is (\log) base (e), or just `log(N)` in most programming languages.)

The coupon collector’s problem hints at why the loot box mechanism is so powerful. The (N) balls in (N) buckets rule tells us that the collector will have about two thirds of the items after buying 10 boxes. It feels like the collector is most of the way there, and it would be a shame to give up and let so much progress go to waste, but actually 10 boxes is only about a third of the expected number of boxes needed. That’s a simplistic model, but item rarity, variation of box type and (in computer games) making some items “unlockable” by completing sets of other items (or fulfilling other dependencies) only make it easier to get collectors to buy more than they originally expect.

The (N\ln N) rule is very rough, so here’s a plot for comparison:

![Plot of approximations to the coupon collector's problem. N ln N underestimates significantly, but has the right growth rate. N ln N + N/2 still underestimates slightly, but the error is less than 10%. The 1:1 slope N is also included to show that, beyond small values of N, multiple times N purchases are needed to get all items on average.][8]

The exact value is rarely needed, but it’s useful to know that you’ll quickly need multiple times (N) trials to get all (N) hits. Any application of the (N) balls/buckets rule naturally extends to a coupon collector’s problem (e.g., on average you’ll need to put over (N\ln N) items into a hash table before all (N) slots are full) but the coupon collector’s problem comes up in other places, too. Often it’s tempting to use randomness to solve a problem statelessly, and then you find yourself doing a coupon collector problem. A cool example is [the FizzleFade effect in the classic 90s first-person shooter Wolfenstein 3D][9]. When the player character died, the screen would fill up with red pixels in what looks like random order. A simple and obvious way to implement that would be to plot red pixels at random coordinates in a loop, but filling the screen that way would be boring. With (320 \times 200 = 64000) pixels, most (~63.2%) of the screen would be filled red after 64000 iterations, but then the player would have to wait over (\ln(64000) \approx 11) times longer than that watching the last patches of screen fade away. The developers of Wolfenstein had to come up with a way to calculate a pseudo-random permutation of pixels on the screen, without explicitly storing the permutation in memory.

Here’s a loose explanation of where the (\ln N) factor comes from: We know already that any pixel has approximately (\frac{1}{e}) chance of not being coloured by any batch of (N) pixel plots. So, after a batch of (N) pixel plots, the number of unfilled pixels goes down by a factor of (e) on average. If we assume we can multiply the average because it’s close enough to the geometric mean, the number of unfilled pixels will drop from (N) to something like (\frac{N}{e^{k}}) after (k) batches. That means the number of batches needed to go from (N) unfilled pixels to 1 is something like (\ln N), from the basic definition of logarithms.

In the computer age it’s easy to get an answer once we know we have a specific probability problem to solve. But rough rules like the ones in this post are still useful during the design phase, or for getting an intuitive understanding for why a system behaves the way it does.

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2020/01/27/systems_programming_probability.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://theartofmachinery.com/images/systems_programming_probability/one_on_n_tried_n_times.svg
[2]: https://en.wikipedia.org/wiki/Characterizations_of_the_exponential_function#Characterizations
[3]: https://www.cambridge.org/core/journals/journal-of-the-institute-of-actuaries/article/an-application-of-the-poisson-distribution/F75111847FDA534103BD4941BD96A78E
[4]: https://en.wikipedia.org/wiki/Poisson_distribution
[5]: https://theartofmachinery.com/images/systems_programming_probability/london_v1_simulation.svg
[6]: https://golem.ph.utexas.edu/category/2019/11/random_permutations_part_1.html
[7]: https://www.pcgamer.com/au/the-evolution-of-loot-boxes/
[8]: https://theartofmachinery.com/images/systems_programming_probability/coupon_collector.svg
[9]: http://fabiensanglard.net/fizzlefade/index.php
