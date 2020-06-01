[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Glico (Weighted Rock Paper Scissors))
[#]: via: (https://theartofmachinery.com/2020/05/21/glico_weighted_rock_paper_scissors.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

Glico (Weighted Rock Paper Scissors)
======

This still isn’t the blog post I said I was going to write about now, but I figured some game theory would make a good post at the moment, especially when a lot of people I know are working at home with kids who need entertaining. Here’s some stuff about a traditional Japanese kids’ game called Glico, a form of weighted Rock Paper Scissors (RPS).

### Glico

I’ll assume you’re familiar with regular RPS. It’s pretty obvious how to play well: the three plays, “rock”, “paper” and “scissors”, are equally strong, so the only trick is to play them unpredictably enough.

But what happens if the three plays have different values? Weighted RPS, under the name “Glico”, has been a well-known Japanese children’s game since at least before WWII, but let me explain an English adaptation. Traditionally it’s played starting at the bottom of a flight of stairs, and the aim is to get to the top first. Players can climb up steps by winning rounds of RPS. The trick is that the number of steps depends on the winning hand in each round. A player who wins with “rock” gets to climb up four steps by spelling out R-O-C-K, and similarly “paper” is worth five steps and “scissors” worth eight. This simple twist to the game creates whole new layers of offence and defence as players struggle to win with “scissors” as much as possible, without being too predictable and vulnerable.

(The rules for the Japanese version vary by region, but usually “rock” is worth 3 steps, while “paper” and “scissors” are worth 6. The mnemonic is that “rock”, “paper” and “scissors” are referred to as グー, パー and チョキ respectively, and the words spelled out when playing are グリコ (“Glico”, a food/confectionary brand), パイナップル (pineapple) and チョコレート (chocolate).)

Just a few notes before getting into the maths: The game works best with two players, but in the traditional rules for three or more players, each round is handled by having multiple rematches. Each time there’s a clear winning hand (e.g., two players with “paper” beating one with “rock”) the losers are eliminated until there’s one winner. That can take a long time, so cycling systematically between pairs of players might be faster for several players. (I’ll assume two players from now on.) Also, older kids sometimes add an extra challenge by requiring an exact landing at the top of the stairs to win. For example, if you’re five steps from the top, only “paper” will win; “scissors” will overshoot by three steps, and you’ll end up three steps back down from the top. Be warned: that makes gameplay a lot harder.

### Calculating the optimal strategy

Simple strategies like “just play rock” are what game theorists call “pure strategies”. By design, no pure strategy in RPS is better than all others, and an adaptive opponent can quickly learn to exploit any pure strategy (e.g., by always playing “paper” against someone who always plays “rock”). Any decent player will play RPS with something like a “mixed strategy” (selecting from the pure strategies at random, maybe with different probabilities). Game theory tells us that finite, two-player, zero-sum games always have optimal mixed strategies — i.e., a mixed strategy that’s as good or better than any other, even against an adaptive opponent. You might do better by exploiting a weak opponent, but you can’t do better against a perfect one. In plain RPS, the statistically unbeatable strategy is to play each hand with equal probability (\frac{1}{3}).

Glico is made up of multiple rounds of weighted RPS. A truly optimal player won’t just use one set of probabilities (p_{r}), (p_{p}) and (p_{s}) for playing “rock”, “paper” and “scissors” each round. The optimal probabilities will vary depending the position of both players on the stairs. For example, a player who is four steps from winning is either happy with any winning hand, or only wants “rock”, depending on the rules, and (theoretically) both players should recognise that and adapt their probabilities accordingly. However, it’s more practical to play with an optimal greedy strategy — i.e., assuming everyone is just trying to get the maximum step value each round.

I’ll calculate an optimal greedy strategy for weighted RPS in two ways. One way is longer but uses nothing but high school algebra and logical thinking, while the other way uses the power of linear programming.

#### The longer way

The greedy version of Glico has no end goal; the players are just trying to win points. It helps with solving the game if we make it zero sum — any time you win (N) points, your opponent loses (N) points, and vice versa. That just scales and shifts the score per round, so it doesn’t change the optimal strategy. Why do it? We know that optimal players can’t get any advantage over each other because the game is symmetric. If the game is zero sum, that means that no strategy can have an expected value of more than 0 points. That lets us write some equations. For example, playing “rock” might win you 4 points against “scissors”, or lose you 5 against “paper”. Against an optimal opponent, we can say

[4p_{s} - 5p_{p} \leq 0]

Is the inequality necessary? When would a pure strategy have a negative value against a non-adaptive but optimal player? Imagine if we added a fourth pure strategy, “bomb”, that simply gave 1000 points to the opponent. Obviously no optimal player would ever play “bomb”, so (p_{b} = 0). Playing “bomb” against an optimal player would have expected value -1000. We can say that some pure strategies are just _bad_: they have suboptimal value against an optimal opponent, and an optimal player will never play them. Other pure strategies have optimal value against an optimal opponent, and they’re reasonable to include in an optimal strategy.

Bad pure strategies aren’t always as obvious as “bomb”, but we can argue that none of the pure strategies in RPS are bad. “Rock” is the only way to beat “scissors”, and “paper” is the only way to beat “rock”, and “scissors” is the only way to beat “paper”. At least one must be in the optimal strategy, so we can expect them all to be. So let’s make that (\leq) into (=), and add the equations for playing “paper” and “scissors”, plus the fact that these are probabilities that add up to 1:

[\begin{matrix} {4p_{s} - 5p_{p}} &amp; {= 0} \ {5p_{r} - 8p_{s}} &amp; {= 0} \ {8p_{p} - 4p_{r}} &amp; {= 0} \ {p_{r} + p_{p} + p_{s}} &amp; {= 1} \ \end{matrix}]

That’s a system of linear equations that can be solved algorithmically using Gaussian elimination — either by hand or by using any good numerical algorithms software. I won’t go into the details, but here’s the solution:

[\begin{matrix} p_{r} &amp; {= 0.4706} \ p_{p} &amp; {= 0.2353} \ p_{s} &amp; {= 0.2941} \ \end{matrix}]

Even though it’s worth the least, an optimal player will play “rock” almost half the time to counterattack “scissors”. The rest of the time is split between “paper” and “scissors”, with a slight bias towards “scissors”.

#### The powerful way

The previous solution needed special-case analysis: it exploited the symmetry of the game, and made some guesses about how good/bad the pure strategies are. What about games that are more complex, or maybe not even symmetric (say, because one player has a handicap)? There’s a more general solution using what’s called linear programming (which dates to when “programming” just meant “scheduling” or “planning”).

By the way, linear programming (LP) has a funny place in computer science. There are some industries and academic circles where LP and generalisations like mixed integer programming are super hot. Then there are computer science textbooks that never even mention them, so there are industries where the whole topic is pretty much unheard of. It might be because it wasn’t even known for a long time if LP problems can be solved in polynomial time (they can), so LP doesn’t have the same theoretical elegance as, say, shortest path finding, even if it has a lot of practical use.

Anyway, solving weighted RPS with LP is pretty straightforward. We just need to describe the game using a bunch of linear inequalities in multiple variables, and express strategic value as a linear function that can be optimised. That’s very similar to what was done before, but this time we won’t try to guess at the values of any strategies. We’ll just assume we’re choosing values (p_{r}), (p_{p}) and (p_{s}) to play against an opponent who scores an average (v) against us each round. The opponent is smart enough to choose a strategy that’s as least as good as any pure strategy, so we can say

[\begin{matrix} {4p_{s} - 5p_{p}} &amp; {\leq v} \ {5p_{r} - 8p_{s}} &amp; {\leq v} \ {8p_{p} - 4p_{r}} &amp; {\leq v} \ \end{matrix}]

The opponent can only play some combination of “rock”, “paper” and “scissors”, so (v) can’t be strictly greater than all of them — at least one of the inequalities above must be tight. To model the gameplay fully, the only other constraints we need are the rules of probability:

[\begin{matrix} {p_{r} + p_{p} + p_{s}} &amp; {= 1} \ p_{r} &amp; {\geq 0} \ p_{p} &amp; {\geq 0} \ p_{s} &amp; {\geq 0} \ \end{matrix}]

Now we’ve modelled the problem, we just need to express what needs to be optimised. That’s actually dead simple: we just want to minimise (v), the average score the opponent can win from us. An LP solver can find a set of values for all variables that minimises (v) within the constraints, and we can read off the optimal strategy directly.

I’ve tried a few tools, and the [Julia][1] library [JuMP][2] has my current favourite FOSS API for throwaway optimisation problems. Here’s some code:

```
# You might need Pkg.add("JuMP"); Pkg.add("GLPK")
using JuMP
using GLPK

game = Model(GLPK.Optimizer)

@variable(game, 0 <= pr <= 1)
@variable(game, 0 <= pp <= 1)
@variable(game, 0 <= ps <= 1)
@variable(game, v)

@constraint(game, ptotal, pr + pp + ps == 1)
@constraint(game, rock, 4*ps - 5*pp <= v)
@constraint(game, paper, 5*pr - 8*ps <= v)
@constraint(game, scissors, 8*pp - 4*pr <= v)

@objective(game, Min, v)

println(game)
optimize!(game)

println("Opponent's value: ", value(v))
println("Rock: ", value(pr))
println("Paper: ", value(pp))
println("Scissors: ", value(ps))
```

Here’s the output:

```
Min v
Subject to
 ptotal : pr + pp + ps = 1.0
 rock : 4 ps - 5 pp - v ≤ 0.0
 paper : 5 pr - 8 ps - v ≤ 0.0
 scissors : 8 pp - 4 pr - v ≤ 0.0
 pr ≥ 0.0
 pp ≥ 0.0
 ps ≥ 0.0
 pr ≤ 1.0
 pp ≤ 1.0
 ps ≤ 1.0

Opponent's value: 0.0
Rock: 0.47058823529411764
Paper: 0.23529411764705882
Scissors: 0.29411764705882354
```

As argued in the previous solution, the best value the opponent can get against the optimal player is 0.

### What does optimality mean?

The optimal solution was calculated assuming an all-powerful opponent. It guarantees that even the best weighted RPS player can’t get an advantage over you, but it turns out you can’t get an advantage over a terrible player, either, if you insist on playing this “optimal” strategy. That’s because weighted RPS has no bad plays, in the sense that “bomb” is bad. _Any_ strategy played against the above “optimal” strategy will have expected value of 0, so it’s really a defensive, or “safe” strategy. To play truly optimally and win against a bad player, you’ll have to adapt your strategy. For example, if your opponent plays “scissors” too often and “paper” not enough, you should adapt by playing “rock” more often. Of course, your opponent might just be pretending to be weak, and could start taking advantage of your deviation from the safe strategy.

Games don’t always work out like that. For example, in theory, you could derive an optimal safe strategy for more complex games like poker. Such a strategy would tend to win against normal humans because even the best normal humans make bad poker plays. On the other hand, a “shark” at the table might be able to win against the “fish” faster by exploiting their weaknesses more aggressively. If you’re thinking of using LP to directly calculate a strategy for Texas Hold’em, though, sorry, but you’ll hit a combinatorial explosion of pure strategies as you account for all the cases like “if I’m dealt AJ on the big blind and I call a four-blind raise from the button preflop and then the flop is a rainbow 3K9…”. Only heavily simplified toy poker games are solvable with the general approach.

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2020/05/21/glico_weighted_rock_paper_scissors.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://julialang.org/
[2]: https://github.com/JuliaOpt/JuMP.jl
