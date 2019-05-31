[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Ultimate Guide to JavaScript Fatigue: Realities of our industry)
[#]: via: (https://lucasfcosta.com/2017/07/17/The-Ultimate-Guide-to-JavaScript-Fatigue.html)
[#]: author: (Lucas Fernandes Da Costa https://lucasfcosta.com)

The Ultimate Guide to JavaScript Fatigue: Realities of our industry
======

**Complaining about JS Fatigue is just like complaining about the fact that humanity has created too many tools to solve the problems we have** , from email to airplanes and spaceships.

Last week I’ve done a talk about this very same subject at the NebraskaJS 2017 Conference and I got so many positive feedbacks that I just thought this talk should also become a blog post in order to reach more people and help them deal with JS Fatigue and understand the realities of our industry. **My goal with this post is to change the way you think about software engineering in general and help you in any areas you might work on**.

One of the things that has inspired me to write this blog post and that totally changed my life is [this great post by Patrick McKenzie, called “Don’t Call Yourself a Programmer and other Career Advice”][1]. **I highly recommend you read that**. Most of this blog post is advice based on what Patrick has written in that post applied to the JavaScript ecosystem and with a few more thoughts I’ve developed during these last years working in the tech industry.

This first section is gonna be a bit philosophical, but I swear it will be worth reading.

### Realities of Our Industry 101

Just like Patrick has done in [his post][1], let’s start with the most basic and essential truth about our industry:

Software solves business problems

This is it. **Software does not exist to please us as programmers** and let us write beautiful code. Neither it exists to create jobs for people in the tech industry. **Actually, it exists to kill as many jobs as possible, including ours** , and this is why basic income will become much more important in the next few years, but that’s a whole other subject.

I’m sorry to say that, but the reason things are that way is that there are only two things that matter in the software engineering (and any other industries):

**Cost versus Revenue**

**The more you decrease cost and increase revenue, the more valuable you are** , and one of the most common ways of decreasing cost and increasing revenue is replacing human beings by machines, which are more effective and usually cost less in the long run.

You are not paid to write code

**Technology is not a goal.** Nobody cares about which programming language you are using, nobody cares about which frameworks your team has chosen, nobody cares about how elegant your data structures are and nobody cares about how good is your code. **The only thing that somebody cares about is how much does your software cost and how much revenue it generates**.

Writing beautiful code does not matter to your clients. We write beautiful code because it makes us more productive in the long run and this decreases cost and increases revenue.

The whole reason why we try not to write bugs is not that we value correctness, but that **our clients** value correctness. If you have ever seen a bug becoming a feature you know what I’m talking about. That bug exists but it should not be fixed. That happens because our goal is not to fix bugs, our goal is to generate revenue. If our bugs make clients happy then they increase revenue and therefore we are accomplishing our goals.

Reusable space rockets, self-driving cars, robots, artificial intelligence: these things do not exist just because someone thought it would be cool to create them. They exist because there are business interests behind them. And I’m not saying the people behind them just want money, I’m sure they think that stuff is also cool, but the truth is that if they were not economically viable or had any potential to become so, they would not exist.

Probably I should not even call this section “Realities of Our Industry 101”, maybe I should just call it “Realities of Capitalism 101”.

And given that our only goal is to increase revenue and decrease cost, I think we as programmers should be paying more attention to requirements and design and start thinking with our minds and participating more actively in business decisions, which is why it is extremely important to know the problem domain we are working on. How many times before have you found yourself trying to think about what should happen in certain edge cases that have not been thought before by your managers or business people?

In 1975, Boehm has done a research in which he found out that about 64% of all errors in the software he was studying were caused by design, while only 36% of all errors were coding errors. Another study called [“Higher Order Software—A Methodology for Defining Software”][2] also states that **in the NASA Apollo project, about 73% of all errors were design errors**.

The whole reason why Design and Requirements exist is that they define what problems we’re going to solve and solving problems is what generates revenue.

> Without requirements or design, programming is the art of adding bugs to an empty text file.
>
>   * Louis Srygley
>


This same principle also applies to the tools we’ve got available in the JavaScript ecosystem. Babel, webpack, react, Redux, Mocha, Chai, Typescript, all of them exist to solve a problem and we gotta understand which problem they are trying to solve, we need to think carefully about when most of them are needed, otherwise, we will end up having JS Fatigue because:

JS Fatigue happens when people use tools they don't need to solve problems they don't have.

As Donald Knuth once said: “Premature optimization is the root of all evil”. Remember that software only exists to solve business problems and most software out there is just boring, it does not have any high scalability or high-performance constraints. Focus on solving business problems, focus on decreasing cost and generating revenue because this is all that matters. Optimize when you need, otherwise you will probably be adding unnecessary complexity to your software, which increases cost, and not generating enough revenue to justify that.

This is why I think we should apply [Test Driven Development][3] principles to everything we do in our job. And by saying this I’m not just talking about testing. **I’m talking about waiting for problems to appear before solving them. This is what TDD is all about**. As Kent Beck himself says: “TDD reduces fear” because it guides your steps and allows you take small steps towards solving your problems. One problem at a time. By doing the same thing when it comes to deciding when to adopt new technologies then we will also reduce fear.

Solving one problem at a time also decreases [Analysis Paralysis][4], which is basically what happens when you open Netflix and spend three hours concerned about making the optimal choice instead of actually watching something. By solving one problem at a time we reduce the scope of our decisions and by reducing the scope of our decisions we have fewer choices to make and by having fewer choices to make we decrease Analysis Paralysis.

Have you ever thought about how easier it was to decide what you were going to watch when there were only a few TV channels available? Or how easier it was to decide which game you were going to play when you had only a few cartridges at home?

### But what about JavaScript?

By the time I’m writing this post NPM has 489,989 packages and tomorrow approximately 515 new ones are going to be published.

And the packages we use and complain about have a history behind them we must comprehend in order to understand why we need them. **They are all trying to solve problems.**

Babel, Dart, CoffeeScript and other transpilers come from our necessity of writing code other than JavaScript but making it runnable in our browsers. Babel even lets us write new generation JavaScript and make sure it will work even on older browsers, which has always been a great problem given the inconsistencies and different amount of compliance to the ECMA Specification between browsers. Even though the ECMA spec is becoming more and more solid these days, we still need Babel. And if you want to read more about Babel’s history I highly recommend that you read [this excellent post by Henry Zhu][5].

Module bundlers such as Webpack and Browserify also have their reason to exist. If you remember well, not so long ago we used to suffer a lot with lots of `script` tags and making them work together. They used to pollute the global namespace and it was reasonably hard to make them work together when one depended on the other. In order to solve this [`Require.js`][6] was created, but it still had its problems, it was not that straightforward and its syntax also made it prone to other problems, as you can see [in this blog post][7]. Then Node.js came with `CommonJS` imports, which were synchronous, simple and clean, but we still needed a way to make that work on our browsers and this is why we needed Webpack and Browserify.

And Webpack itself actually solves more problems than that by allowing us to deal with CSS, images and many other resources as if they were JavaScript dependencies.

Front-end frameworks are a bit more complicated, but the reason why they exist is to reduce the cognitive load when we write code so that we don’t need to worry about manipulating the DOM ourselves or even dealing with messy browser APIs (another problem JQuery came to solve), which is not only error prone but also not productive.

This is what we have been doing this whole time in computer science. We use low-level abstractions and build even more abstractions on top of it. The more we worry about describing how our software should work instead of making it work, the more productive we are.

But all those tools have something in common: **they exist because the web platform moves too fast**. Nowadays we’re using web technology everywhere: in web browsers, in desktop applications, in phone applications or even in watch applications.

This evolution also creates problems we need to solve. PWAs, for example, do not exist only because they’re cool and we programmers have fun writing them. Remember the first section of this post: **PWAs exist because they create business value**.

And usually standards are not fast enough to be created and therefore we need to create our own solutions to these things, which is why it is great to have such a vibrant and creative community with us. We’re solving problems all the time and **we are allowing natural selection to do its job**.

The tools that suit us better thrive, get more contributors and develop themselves more quickly and sometimes other tools end up incorporating the good ideas from the ones that thrive and becoming even more popular than them. This is how we evolve.

By having more tools we also have more choices. If you remember the UNIX philosophy well, it states that we should aim at creating programs that do one thing and do it well.

We can clearly see this happening in the JS testing environment, for example, where we have Mocha for running tests and Chai for doing assertions, while in Java JUnit tries to do all these things. This means that if we have a problem with one of them or if we find another one that suits us better, we can simply replace that small part and still have the advantages of the other ones.

The UNIX philosophy also states that we should write programs that work together. And this is exactly what we are doing! Take a look at Babel, Webpack and React, for example. They work very well together but we still do not need one to use the other. In the testing environment, for example, if we’re using Mocha and Chai all of a sudden we can just install Karma and run those same tests in multiple environments.

### How to Deal With It

My first advice for anyone suffering from JS Fatigue would definitely be to stay aware that **you don’t need to know everything**. Trying to learn it all at once, even when we don’t have to do so, only increases the feeling of fatigue. Go deep in areas that you love and for which you feel an inner motivation to study and adopt a lazy approach when it comes to the other ones. I’m not saying that you should be lazy, I’m just saying that you can learn those only when needed. Whenever you face a problem that requires you to use a certain technology to solve it, go learn.

Another important thing to say is that **you should start from the beginning**. Make sure you have learned enough about JavaScript itself before using any JavaScript frameworks. This is the only way you will be able to understand them and bend them to your will, otherwise, whenever you face an error you have never seen before you won’t know which steps to take in order to solve it. Learning core web technologies such as CSS, HTML5, JavaScript and also computer science fundamentals or even how the HTTP protocol works will help you master any other technologies a lot more quickly.

But please, don’t get too attached to that. Sometimes you gotta risk yourself and start doing things on your own. As Sacha Greif has written in [this blog post][8], spending too much time learning the fundamentals is just like trying to learn how to swim by studying fluid dynamics. Sometimes you just gotta jump into the pool and try to swim by yourself.

And please, don’t get too attached to a single technology. All of the things we have available nowadays have already been invented in the past. Of course, they have different features and a brand new name, but, in their essence, they are all the same.

If you look at NPM, it is nothing new, we already had Maven Central and Ruby Gems quite a long time ago.

In order to transpile your code, Babel applies the very same principles and theory as some of the oldest and most well-known compilers, such as the GCC.

Even JSX is not a new idea. It E4X (ECMAScript for XML) already existed more than 10 years ago.

Now you might ask: “what about Gulp, Grunt and NPM Scripts?” Well, I’m sorry but we can solve all those problems with GNU Make in 1976. And actually, there are a reasonable number of JavaScript projects that still use it, such as Chai.js, for example. But we do not do that because we are hipsters that like vintage stuff. We use `make` because it solves our problems, and this is what you should aim at doing, as we’ve talked before.

If you really want to understand a certain technology and be able to solve any problems you might face, please, dig deep. One of the most decisive factors to success is curiosity, so **dig deep into the technologies you like**. Try to understand them from bottom-up and whenever you think something is just “magic”, debunk that myth by exploring the codebase by yourself.

In my opinion, there is no better quote than this one by Richard Feinman, when it comes to really learning something:

> What I cannot create, I do not understand

And just below this phrase, [in the same blackboard, Richard also wrote][9]:

> Know how to solve every problem that has been solved

Isn’t this just amazing?

When Richard said that, he was talking about being able to take any theoretical result and re-derive it, but I think the exact same principle can be applied to software engineering. The tools that solve our problems have already been invented, they already exist, so we should be able to get to them all by ourselves.

This is the very reason I love [some of the videos available in Egghead.io][10] in which Dan Abramov explains how to implement certain features that exist in Redux from scratch or [blog posts that teach you how to build your own JSX renderer][11].

So why not trying to implement these things by yourself or going to GitHub and reading their codebase in order to understand how they work? I’m sure you will find a lot of useful knowledge out there. Comments and tutorials might lie and be incorrect sometimes, the code cannot.

Another thing that we have been talking a lot in this post is that **you should not get ahead of yourself**. Follow a TDD approach and solve one problem at a time. You are paid to increase revenue and decrease cost and you do this by solving problems, this is the reason why software exists.

And since we love comparing our role to the ones related to civil engineering, let’s do a quick comparison between software development and civil engineering, just as [Sam Newman does in his brilliant book called “Building Microservices”][12].

We love calling ourselves “engineers” or “architects”, but is that term really correct? We have been developing software for what we know as computers less than a hundred years ago, while the Colosseum, for example, exists for about two thousand years.

When was the last time you’ve seen a bridge falling and when was the last time your telephone or your browser crashed?

In order to explain this, I’ll use an example I love.

This is the beautiful and awesome city of Barcelona:

![The City of Barcelona][13]

When we look at it this way and from this distance, it just looks like any other city in the world, but when we look at it from above, this is how Barcelona looks:

![Barcelona from above][14]

As you can see, every block has the same size and all of them are very organized. If you’ve ever been to Barcelona you will also know how good it is to move through the city and how well it works.

But the people that planned Barcelona could not predict what it was going to look like in the next two or three hundred years. In cities, people come in and people move through it all the time so what they had to do was make it grow organically and adapt as the time goes by. They had to be prepared for changes.

This very same thing happens to our software. It evolves quickly, refactors are often needed and requirements change more frequently than we would like them to.

So, instead of acting like a Software Engineer, act as a Town Planner. Let your software grow organically and adapt as needed. Solve problems as they come by but make sure everything still has its place.

Doing this when it comes to software is even easier than doing this in cities due to the fact that **software is flexible, civil engineering is not**. **In the software world, our build time is compile time**. In Barcelona we cannot simply destroy buildings to give space to new ones, in Software we can do that a lot easier. We can break things all the time, we can make experiments because we can build as many times as we want and it usually takes seconds and we spend a lot more time thinking than building. Our job is purely intellectual.

So **act like a town planner, let your software grow and adapt as needed**.

By doing this you will also have better abstractions and know when it’s the right time to adopt them.

As Sam Koblenski says:

> Abstractions only work well in the right context, and the right context develops as the system develops.

Nowadays something I see very often is people looking for boilerplates when they’re trying to learn a new technology, but, in my opinion, **you should avoid boilerplates when you’re starting out**. Of course boilerplates and generators are useful if you are already experienced, but they take a lot of control out of your hands and therefore you won’t learn how to set up a project and you won’t understand exactly where each piece of the software you are using fits.

When you feel like you are struggling more than necessary to get something simple done, it might be the right time for you to look for an easier way to do this. In our role **you should strive to be lazy** , you should work to not work. By doing that you have more free time to do other things and this decreases cost and increases revenue, so that’s another way of accomplishing your goal. You should not only work harder, you should work smarter.

Probably someone has already had the same problem as you’re having right now, but if nobody did it might be your time to shine and build your own solution and help other people.

But sometimes you will not be able to realize you could be more effective in your tasks until you see someone doing them better. This is why it is so important to **talk to people**.

By talking to people you share experiences that help each other’s careers and we discover new tools to improve our workflow and, even more important than that, learn how they solve their problems. This is why I like reading blog posts in which companies explain how they solve their problems.

Especially in our area we like to think that Google and StackOverflow can answer all our questions, but we still need to know which questions to ask. I’m sure you have already had a problem you could not find a solution for because you didn’t know exactly what was happening and therefore didn’t know what was the right question to ask.

But if I needed to sum this whole post in a single advice, it would be:

Solve problems.

Software is not a magic box, software is not poetry (unfortunately). It exists to solve problems and improves peoples’ lives. Software exists to push the world forward.

**Now it’s your time to go out there and solve problems**.


--------------------------------------------------------------------------------

via: https://lucasfcosta.com/2017/07/17/The-Ultimate-Guide-to-JavaScript-Fatigue.html

作者：[Lucas Fernandes Da Costa][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://lucasfcosta.com
[b]: https://github.com/lujun9972
[1]: http://www.kalzumeus.com/2011/10/28/dont-call-yourself-a-programmer/
[2]: http://ieeexplore.ieee.org/document/1702333/
[3]: https://en.wikipedia.org/wiki/Test_Driven_Development
[4]: https://en.wikipedia.org/wiki/Analysis_paralysis
[5]: https://babeljs.io/blog/2016/12/07/the-state-of-babel
[6]: http://requirejs.org
[7]: https://benmccormick.org/2015/05/28/moving-past-requirejs/
[8]: https://medium.freecodecamp.org/a-study-plan-to-cure-javascript-fatigue-8ad3a54f2eb1
[9]: https://www.quora.com/What-did-Richard-Feynman-mean-when-he-said-What-I-cannot-create-I-do-not-understand
[10]: https://egghead.io/lessons/javascript-redux-implementing-store-from-scratch
[11]: https://jasonformat.com/wtf-is-jsx/
[12]: https://www.barnesandnoble.com/p/building-microservices-sam-newman/1119741399/2677517060476?st=PLA&sid=BNB_DRS_Marketplace+Shopping+Books_00000000&2sid=Google_&sourceId=PLGoP4760&k_clickid=3x4760
[13]: /assets/barcelona-city.jpeg
[14]: /assets/barcelona-above.jpeg
[15]: https://twitter.com/thewizardlucas
