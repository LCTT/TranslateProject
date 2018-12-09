[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (3 implications of serverless)
[#]: via: (https://opensource.com/article/18/12/serverless-podcast-command-line-heros)
[#]: author: (Jen Wike Huger https://opensource.com/users/remyd)
[#]: url: ( )

3 implications of serverless
======
Plus, when to go serverless and when to not?
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR)

If you strip away all of the modern conveniences and features that make up your internet experience today, what you're left with is the client-server model. This distributed network was what the internet was built on in the beginning, and that part hasn't changed. You could say, it is still serving us well.

So, when people talk about serverless, what does it mean? Well, it doesn't mean servers are GONE. Of course not: That "client-server model" is still the backbone of how things are getting done.

Serverless refers to a developer's ability to code, deploy, and create applications without having to know how to do the rest of it, like rack the servers, patch the operating system, and create container images.

### Top 3 implications of serverless

  1. People who might not have been before are becoming developers now. Why? They have to learn less of that kind of stuff and get to do more of the creative stuff.
  2. Developers don't have the recreate the wheel. Why? They let serverless providers do what they do best: run and maintain the servers, patch the operating systems, and build containers.
  3. Reality check: Someone on your team still has to think about the big picture, about operations. Why? Because when your server crashes or any decision at all needs to be made about the server-side of your project or product, your phone will ring and someone has to pick up. Preferably someone who knows the gameplan, your strategy for going serverless.



### When to serverless and when to not?

So, serverless is great, right? But, the truth is it isn't always the right call. What are the factors that should be considered?

  1. Cost
  2. Scale
  3. Time
  4. Control



The last one, control, is where things get interesting. Projects like [Apache OpenWhisk][1] have developed processes and tools to make it possible for you, as a developer, to operate and control your serverless computing environments.

### Why open source serverless?

For more on this, check out conversations with leading serverless thinkers and host Saron Yitbarek in [Episode 7 of Command Line Heroes podcast][2].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/serverless-podcast-command-line-heros

作者：[Jen Wike Huger][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/remyd
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/11/developing-functions-service-apache-openwhisk
[2]: https://www.redhat.com/en/command-line-heroes
