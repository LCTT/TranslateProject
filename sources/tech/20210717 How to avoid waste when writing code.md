[#]: subject: (How to avoid waste when writing code)
[#]: via: (https://opensource.com/article/21/7/avoid-waste-coding)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to avoid waste when writing code
======
The more we can reduce waste in software development, the better off
everyone will be.
![Learning to program][1]

The long road toward quality is filled with diversions, false starts, and detours. The enemy of quality is waste, because waste is never desirable. No one pays anyone to deliver waste. We sometimes tolerate waste as part of the process of making something useful and desirable, but the more we can reduce waste while making something, the better.

In software engineering, waste can be expressed in a few ways:

  1. Defects
  2. Idling and waiting
  3. Overproduction
  4. Overprocessing
  5. Any other activity that doesn't directly put value in users' hands



Let's examine each of these five types of waste.

### Defects

There seems to be a prevailing sentiment in the software industry that bugs (defects) are inevitable. It's not if—but when and how many—bugs find their way into production.

You can fight that defeatist sentiment by reminding software engineers that each and every bug is authored. Bugs don't occur spontaneously. They're created by us, human beings trying to do the best software development we can. But nobody's perfect. Of course we don't create bugs intentionally, but they do happen. They're often a result of rushing things through, or perhaps due to inadequate education and training.

Whatever the reason, bugs are _caused_, which means we can eliminate bugs by solving the problems that cause them.

### Idling and waiting

Our business partners funding our software development efforts tend to perceive any time we're not producing shipping code as time spent idling. Why are we idling, and what are we waiting on? It's a reasonable question to ask, if you consider they're paying potentially thousands of dollars per hour to keep the team going.

Idling is wasteful. It does not contribute to the bottom line and may be a sign of confusion. If the team says they're waiting on someone to return from their leave of absence, that signals poor organizing skills. No team should ever get to the point where they paint themselves into a corner and are suffering from a single point of failure. If a team member can't participate, other members should step in and continue the work. If that's not possible, you are dealing with a very brittle, inflexible, and unreliable team.

Of course, there are many other possible reasons the team is idling. Maybe there is confusion about the current highest priority, so the team is hanging and waiting to learn about the correct priority.

There are many other [reasonable causes of idling][2], which is why this type of waste seems hardest to get on top of. Whatever the case, mature organizations take precautionary steps to minimize potential idling and waiting time.

### Overproduction

Often labeled "gold plating," overproduction is one of the most insidious forms of waste. Software engineers are notorious for their propensity to go overboard in their enthusiasm for building features and nifty capabilities. And because software, as its name implies, is very pliable and malleable, there is very little pushback against the onslaught of bloat.

This dreadful bloat creates a lot of waste. Fighting bloat is what prudent software engineering discipline is all about.

### Overprocessing

One of the biggest problems in software engineering is known as Geek-At-Keyboard (GAK). A common misconception is that software engineers spend most of their time writing code. That is far from the truth. Most of the time spent on regular daily activities (aside from attending meetings) goes toward keyboard activities unrelated to writing code: messing with configurations and environments, manually running and navigating the app, typing and retyping test data, stepping through the debugger, etc.

All those activities are waste. They don't contribute to delivering value. One of the most effective remedies for minimizing unproductive GAK time is [test-driven development][3] (TDD). Writing tests before writing code is a proven method for avoiding overprocessing. The test-first approach is a very effective way of eliminating waste.

### Other activities that don't put value in users' hands

In the early days of our profession, value was measured by the number of lines of code produced per unit of time (per day, week, month, etc.). Later, this rather ineffective way of measuring value was abandoned in favor of working code. There is no convincing correlation between the number of lines of code and working code. And once working code became the measure of value, the number of lines of code became irrelevant.

Today, we recognize that [working code][4] is also a meaningless metric. Just because code compiles, builds, and works doesn't mean it is doing anything of value. Successfully running code could be doing inane processing, such as counting from 0 to 10 and then back to 0. It is much more important to focus on code that meets end users' expectations.

Helping end users fulfill their goals when using your software product is the only measure of value. Any other activity that does not contribute to that value should be regarded as waste.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/avoid-waste-coding

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/learn-programming-code-keyboard.png?itok=xaLyptT4 (Learning to program)
[2]: https://opensource.com/article/21/2/simplicity
[3]: https://opensource.com/article/20/1/test-driven-development
[4]: https://opensource.com/article/20/7/code-tdd
