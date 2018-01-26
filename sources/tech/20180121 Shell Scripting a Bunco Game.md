translating by wenwensnow
Shell Scripting a Bunco Game  脚本编程之骰子游戏
======
我已经有段时间没有编写游戏了，所以我觉得现在正是做一些这方面事情的时候。起初，我想 " 用脚本编一个Halo? " (Halo:微软的光晕系列游戏)，但我后来意识到这不太可能。来编一个叫Bunco的简单骰子游戏。你也许没有听说过，不过你母亲绝对知道 - 当一群年轻女孩聚在当地的酒吧或者小酒馆的时候，这是个很受欢迎的游戏。

I haven't dug into any game programming for a while, so I thought it was high time to do something in that realm. At first, I thought "Halo as a shell script?", but then I came to my senses. Instead, let's look at a simple dice game called Bunco. You may not have heard of it, but I bet your Mom has—it's a quite popular game for groups of gals at a local pub or tavern.

游戏一共六轮，有三个骰子，规则很简单。每次投三个骰子，投出的点数要和当前的轮数数字一致。如果三个骰子都和当前的轮数一致，(比如，在第三轮三个骰子都是3)，你这一轮的分数就是21。 如果三个骰子点数都相同但和轮数数字不同，你会得到最低的Bunco分数，只有5分。如果你投出的点数两者都不是，每一个和当前轮数相同的骰子得1分。
Played in six rounds with three dice, the game is simple. You roll all three dice and have to match the current round number. If all three dice match the current round number (for example, three 3s in round three), you score 21\. If all three match but aren't the current round number, it's a Mini Bunco and worth five points. Failing both of those, each die with the same value as the round number is worth one point.

要想玩这个游戏，它还涉及到团队，每一队(包括赢得那队)，每个人都付5美元现金，或为赢家设立其他类似现金奖励，并规定什么样的情况下才是赢了，例如"most Buncos" or "most points"。在这里我会跳过这些，只关注投骰子这一部分。
Played properly, the game also involves teams, multiple tables including a winner's table, and usually cash prizes funded by everyone paying $5 or similar to play and based on specific winning scenarios like "most Buncos" or "most points". I'll skip that part here, however, and just focus on the dice part.

### Let's Do the Math  

在专注于编程这方面的事之前，我先简单说说游戏背后的数学逻辑。要是有一个适当重量的骰子投骰子会变得很容易，任意一个值出现概率都是 1/6。
Before I go too far into the programming side of things, let me talk briefly about the math behind the game. Dice are easy to work with because on a properly weighted die, the chance of a particular value coming up is 1:6.

完全随机小提示：不确定你的骰子是否每个面都是一样重量? 把它们扔进盐水里然后转一下。YouTube上，有很多科学界的有趣视频向你展示怎么来做这个测试。
Random tip: not sure whether your dice are balanced? Toss them in salty water and spin them. There are some really interesting YouTube videos from the D&D world showing how to do this test.

所以三个骰子点数一样的几率有多大? 第一个骰子100%会有一个值 (这儿没什么可说的)，所以很简单。第二个则有16.66%的概率和第一个骰子的值一样，接下来第三个骰子也是一样。 但当然，总概率是三个概率相乘的结果，所以最后，三个骰子值相等的概率是2.7%。

So what are the odds of three dice having the same value? The first die has a 100% chance of having a value (no leaners here), so that's easy. The second die has a 16.66% chance of being any particular value, and then the third die has the same chance of being that value, but of course, they multiply, so three dice have about a 2.7% chance of all having the same value.

接下来，每个骰子和当前轮数数字相同的概率都是16.66%。从数学角度来说：0.166 * 0.166 * 0.166 = 0.00462。
Then, it's a 16.66% chance that those three dice would be the current round's number—or, in mathematical terms: 0.166 * 0.166 * 0.166 = 0.00462.

换句话说，你有0.46%的可能性投出Bunco
In other words, you have a 0.46% chance of rolling a Bunco, which is a bit less than once out of every 200 rolls of three dice.

It could be tougher though. If you were playing with five dice, the chance of rolling a Mini Bunco (or Yahtzee) is 0.077%, and if you were trying to accomplish a specific value, say just sixes, then it's 0.00012% likely on any given roll—which is to say, not bloody likely!

### And So into the Coding

As with every game, the hardest part is really having a good random number generator that generates truly random values. That's actually hard to affect in a shell script though, so I'm going to sidestep this entire issue and assume that the shell's built-in random number generator will be sufficient.

What's nice is that it's super easy to work with. Just reference $RANDOM, and you'll have a random value between 0 and MAXINT (32767):

```

$ echo $RANDOM $RANDOM $RANDOM
10252 22142 14863

```

To constrain that to values between 1–6 use the modulus function:

```

$ echo $(( $RANDOM % 6 ))
3
$ echo $(( $RANDOM % 6 ))
0

```

Oops! I forgot to shift it one. Here's another try:

```

$ echo $(( ( $RANDOM % 6 ) + 1 ))
6

```

That's the dice-rolling feature. Let's make it a function where you can specify the variable you'd like to have the generated value as part of the invocation:

```

rolldie()
{
   local result=$1
   rolled=$(( ( $RANDOM % 6 ) + 1 ))
   eval $result=$rolled
}

```

The use of the eval is to ensure that the variable specified in the invocation is actually assigned the calculated value. It's easy to work with:

```

rolldie die1

```

That will load a random value between 1–6 into the variable die1. To roll your three dice, it's straightforward:

```

rolldie die1 ; rolldie die2 ; rolldie die3

```

Now to test the values. First, let's test for a Bunco where all three dice have the same value, and it's the value of the current round too:

```

if [ $die1 -eq $die2 ] && [ $die2 -eq $die3 ] ; then
  if [ $die1 -eq $round ] ; then
    echo "BUNCO!"
    score=25
  else
    echo "Mini Bunco!"
    score=5
  fi

```

That's probably the hardest of the tests, and notice the unusual use of test in the first conditional: [ cond1 ] && [ cond2 ]. If you're thinking that you could also write it as cond1 -a cond2, you're right. As with so much in the shell, there's more than one way to get to the solution.

The remainder of the code is straightforward; you just need to test for whether the die matches the current round value:

```

if [ $die1 -eq $round ] ; then
  score=1
fi
if [ $die2 -eq $round ] ; then
  score=$(( $score + 1 ))
fi
if [ $die3 -eq $round ] ; then
  score=$(( $score + 1 ))
fi

```

The only thing to consider here is that you don't want to score die value vs. round if you've also scored a Bunco or Mini Bunco, so the entire second set of tests needs to be within the else clause of the first conditional (to see if all three dice have the same value).

Put it together and specify the round number on the command line, and here's what you have at this point:

```

$ sh bunco.sh 5
You rolled: 1 1 5
score = 1
$ sh bunco.sh 2
You rolled: 6 4 3
score = 0
$ sh bunco.sh 1
You rolled: 1 1 1
BUNCO!
score = 25

```

A Bunco so quickly? Well, as I said, there might be a slight issue with the randomness of the random number generator in the shell.

You can test it once you have the script working by running it a few hundred times and then checking to see what percentage are Bunco or Mini Bunco, but I'll leave that as an exercise for you, dear reader. Well, maybe I'll come back to it another time.

Let's finish up this script by having it accumulate score and run for all six rounds instead of specifying a round on the command line. That's easily done, because it's just a wrapper around the entire script, or, better, the big conditional statement becomes a function all its own:

```

BuncoRound()
{
   # roll, display, and score a round of bunco!
   # round is specified when invoked, score added to totalscore

   local score=0 ; local round=$1 ; local hidescore=0

   rolldie die1 ; rolldie die2 ; rolldie die3
   echo Round $round. You rolled: $die1 $die2 $die3

   if [ $die1 -eq $die2 ] && [ $die2 -eq $die3 ] ; then
     if [ $die1 -eq $round ] ; then
       echo "  BUNCO!"
       score=25
       hidescore=1
     else
       echo "  Mini Bunco!"
       score=5
       hidescore=1
     fi
   else
     if [ $die1 -eq $round ] ; then
       score=1
     fi
     if [ $die2 -eq $round ] ; then
       score=$(( $score + 1 ))
     fi
     if [ $die3 -eq $round ] ; then
       score=$(( $score + 1 ))
     fi
   fi

   if [ $hidescore -eq 0 ] ; then
     echo "  score this round: $score"
   fi

   totalscore=$(( $totalscore + $score ))
}

```

I admit, I couldn't resist a few improvements as I went along, including the addition of it showing either Bunco, Mini Bunco or a score value (that's what $hidescore does).

Invoking it is a breeze, and you'll use a for loop:

```

for round in {1..6} ; do
  BuncoRound $round
done

```

That's about the entire program at this point. Let's run it once and see what happens:

```

$ sh bunco.sh 1
Round 1\. You rolled: 2 3 3
  score this round: 0
Round 2\. You rolled: 2 6 6
  score this round: 1
Round 3\. You rolled: 1 2 4
  score this round: 0
Round 4\. You rolled: 2 1 4
  score this round: 1
Round 5\. You rolled: 5 5 6
  score this round: 2
Round 6\. You rolled: 2 1 3
  score this round: 0
Game over. Your total score was 4

```

Ugh. Not too impressive, but it's probably a typical round. Again, you can run it a few hundred—or thousand—times, just save the "Game over" line, then do some quick statistical analysis to see how often you score more than 3 points in six rounds. (With three dice to roll a given value, you should hit that 50% of the time.)

It's not a complicated game by any means, but it makes for an interesting little programming project. Now, what if they used 20-sided die and let you re-roll one die per round and had a dozen rounds?


--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/shell-scripting-bunco-game

作者：[Dave Taylor][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/users/dave-taylor
