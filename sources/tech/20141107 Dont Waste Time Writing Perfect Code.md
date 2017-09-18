Don't Waste Time Writing Perfect Code
============================================================ 


A system can last for 5 or 10 or even 20 or more years. But the life of specific lines of code, even of designs, is often much shorter: months or days or even minutes when you’re iterating through different approaches to a solution.

### Some code matters more than other code

Researching [how code changes over time][4], Michael Feathers has identified [a power curve in code bases][5]. Every system has code, often a lot of it, that is written once and is never changed. But a small amount of code, including the code that is most important and useful, is changed over and over again, refactored or rewritten from scratch several times.

As you get more experience with a system, or with a problem domain or an architectural approach, it should get easier to know and to predict what code will change all the time, and what code will never change: what code matters, and what code doesn’t.

### Should we try to write Perfect Code?

We know that we should write [clean code][6], code that is consistent, obvious and as simple as possible.

Some people take this to extremes, and push themselves to write code that is [as beautiful][7] and elegant and as close to [perfect][8] as they can get, [obsessively refactoring][9] and agonizing over each detail.

But if code is only going to be written once and never changed, or at the other extreme if it is changing all the time, isn’t writing perfect code as wasteful and unnecessary (and impossible to achieve) as trying to write perfect requirements or trying to come up with a perfect design upfront?

> You Can't Write Perfect Software. Did that hurt? It shouldn't. Accept it as an axiom of life. Embrace it. Celebrate it. Because perfect software doesn't exist. No one in the brief history of computing has ever written a piece of perfect software. It's unlikely that you'll be the first. And unless you accept this as a fact, you'll end up wasting time and energy chasing an impossible dream.”  
> Andrew Hunt,  [The Pragmatic Programmer: from Journeyman to Master][10]

Code that is written once doesn’t need to be beautiful and elegant. It has to be correct. It has to be understandable – because code that is never changed may still be read many times over the life of the system. It doesn't have to be clean and tight – just clean enough. [Copy and paste][11] and other short cuts in this code can be allowed, at least up to a point. This is code that never needs to be polished. This is code that doesn't need to be refactored (until and unless you need to change it), even if other code around it is changing. This is code that isn't worth spending extra time on.

What about the code that you are changing all of the time? Agonizing over style and coming up with the most elegant solution is a waste of time, because this code will probably be changed again, maybe even rewritten, in a few days or weeks. And so is [obsessively refactoring][12] code each time that you make a change, or refactoring code that you aren't changing because it could be better. Code can always be better. But that’s not important.

What matters is: Does the code do what it is supposed to do – is it correct and usable and efficient? Can it [handle errors and bad data][13] without crashing – or at least [fail safely][14]? Is it easy to debug? Is it easy and safe to change? These aren't subjective aspects of beauty. These are practical measures that make the difference between success and failure.

### Pragmatic Coding and Refactoring

The core idea of Lean Development is: don’t waste time on things that aren't important. This should inform how we write code, and how we refactor it, how we review it, how we test it.

Only [refactor what you need to][15], in order to get the job done - what [Martin Fowler][16] calls opportunistic refactoring (comprehension, cleanup, [Boy Scout rule][17] stuff) and preparatory refactoring. Enough to make a change easier and safer, and no more. If you’re not changing the code, it doesn't really matter what it looks like.

In code reviews, focus [only on what is important][18]. Is the code correct? Is it defensive? Is it secure? Can you follow it? Is it safe to change?

Forget about style (unless style gets in the way of understandability). Let your IDE take care of formatting. No arguments over whether the code could be “more OO”. It doesn’t matter if it properly follows this or that pattern as long as it makes sense. It doesn't matter if you like it or not. Whether you could have done it in a nicer way isn’t important – unless you’re teaching someone who is new to the platform and the language, and you’re expected to do some mentoring as part of code review.

Write tests that matter. Tests that cover the main paths and the important exception cases. Tests that give you the most information and the most confidence with the least amount of work. [Big fat tests, or small focused tests][19] – it doesn't matter, and it doesn't matter if you write the tests before you write the code or after, as long as they do the job.

### It’s not (Just) About the Code

The architectural and engineering metaphors have never been valid for software. We aren’t designing and building bridges or skyscrapers that will stay essentially the same for years or generations. We’re building something much more plastic and abstract, more ephemeral. Code is written to be changed – that is why it’s called “software”.

> “After five years of use and modification, the source for a successful software program is often completely unrecognizable from its original form, while a successful building after five years is virtually untouched.”  
> Kevin Tate,  [Sustainable Software Development][20]

We need to look at code as a temporary artefact of our work:

> …we're led to fetishize code, sometimes in the face of more important things. Often we suffer under the illusion that the valuable thing produced in shipping a product is the code, when it might actually be an understanding of the problem domain, progress on design conundrums, or even customer feedback.  
> Dan Grover,  [Code and Creative Destruction][21]

Iterative development teaches us to experiment and examine the results of our work – did we solve the problem, if we didn’t, what did we learn, how can we improve? The software that we are building is never done. Even if the design and the code are right, they may only be right for a while, until circumstances demand that they be changed again or replaced with something else that fits better.

We need to write good code: code that is understandable, correct, safe and secure. We need to refactor and review it, and write good useful tests, all the while knowing that some of this code, or maybe all of it, could be thrown out soon, or that it may never be looked at again, or that it may not get used at all. We need to recognize that some of our work will necessarily be wasted, and optimize for this. Do what needs to be done, and no more. Don’t waste time trying to write perfect code.

--------------------------------------------------------------------------------

作者简介：

Jim Bird

I am an experienced software development manager, project manager and CTO focused on hard problems in software development and maintenance, software quality and security. For the last 15 years I have been managing teams building electronic trading platforms for stock exchanges and investment banks around the world. My special interest is how small teams can be most effective at building real software: high-quality, secure systems at the extreme limits of reliability, performance, and adaptability.

------

via: https://dzone.com/articles/dont-waste-time-writing

作者：[Jim Bird][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://dzone.com/users/722527/jim.bird.html
[1]:https://dzone.com/users/722527/jim.bird.html
[2]:https://dzone.com/users/722527/jim.bird.html
[3]:https://dzone.com/articles/dont-waste-time-writing?utm_source=wanqu.co&utm_campaign=Wanqu%20Daily&utm_medium=website#
[4]:http://www.youtube.com/watch?v=0eAhzJ_KM-Q
[5]:http://swreflections.blogspot.ca/2012/10/bad-things-happen-to-good-code.html
[6]:http://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882
[7]:http://www.makinggoodsoftware.com/2011/03/27/the-obsession-with-beautiful-code-the-refactor-syndrome/
[8]:http://stackoverflow.com/questions/1196405/how-to-keep-yourself-from-perfectionism-when-coding
[9]:http://programmers.stackexchange.com/questions/43506/is-it-bad-to-have-an-obsessive-refactoring-disorder
[10]:https://pragprog.com/the-pragmatic-programmer
[11]:http://swreflections.blogspot.com/2012/03/is-copy-and-paste-programming-really.html
[12]:http://programmers.stackexchange.com/questions/43506/is-it-bad-to-have-an-obsessive-refactoring-disorder
[13]:http://swreflections.blogspot.com/2012/03/defensive-programming-being-just-enough.html
[14]:https://buildsecurityin.us-cert.gov/articles/knowledge/principles/failing-securely
[15]:http://swreflections.blogspot.com/2012/04/what-refactoring-is-and-what-it-isnt.html
[16]:http://martinfowler.com/articles/workflowsOfRefactoring/
[17]:http://programmer.97things.oreilly.com/wiki/index.php/The_Boy_Scout_Rule
[18]:http://randomthoughtsonjavaprogramming.blogspot.com/2014/08/building-real-software-dont-waste-time.html
[19]:http://swreflections.blogspot.com/2012/08/whats-better-big-fat-tests-or-little.html
[20]:http://www.amazon.com/Sustainable-Software-Development-Agile-Perspective/dp/0321286081
[21]:http://dangrover.com/2013/07/16/code-and-creative-destruction/
[22]:https://dzone.com/devops-tutorials-tools-news
[23]:https://dzone.com/articles/dont-waste-time-writing?utm_source=wanqu.co&utm_campaign=Wanqu%20Daily&utm_medium=website#
[24]:https://dzone.com/go?i=228233&u=https%3A%2F%2Foffers.automic.com%2Fblueprint-to-continuous-delivery-with-automic-release-automation%3Futm_campaign%3DAMER%252520Online%252520Syndication%252520DZone%252520Platinum%252520Sponsorship%252520Ads%252520JULY-2017%26utm_source%3DDzone%252520Ads%26utm_medium%3DBlueprint%252520to%252520CD
