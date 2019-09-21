技术如何改变敏捷的规则
======

![](https://enterprisersproject.com/sites/default/files/styles/620x350/public/images/CIO%20Containers%20Ecosystem.png?itok=lDTaYXzk)

越来越多的公司正因为一个非常明显的原因开始尝试敏捷和[DevOps][1]: 企业需要借助更快的速度和更多的实验来提供创新和竞争性优势。而DevOps将帮助我们得到所想要达到的创新速度。但是，在小团队或初创企业中实践DevOps和进行大规模实践完全是两码事。我们都明白这样的一个事实，那就是在10人的跨职能团队中能够很好地解决问题的方案，当将同样的模式应用到100人的团队中时就可能无法奏效。这条道路是如此艰难，以至于IT领导者很容易将敏捷方法的推行再推迟一年。

但那样的时代已经结束了。如果你已经尝试过，但是没有成功，那么现在是时候重新开始了。

直到现在，DevOps需要为许多组织提供个性化的解决方案，因此往往需要进行大量的调整以及额外的工作。但在今天，[Linux容器][2]和Kubernetes正在推动DevOps工具和过程的标准化。而这样的标准化将会加速整个软件开发过程。因此，我们用来实践DevOps工作方式的技术最终能够满足我们加快软件开发速度的愿望。

Linux容器和[Kubernetes][3]正在改变团队交互的方式。此外，你可以在Kubernetes平台上运行任何能够在Linux运行的应用程序。这意味着什么呢？你可以运行大量的企业及应用程序(甚至可以解决以前令人烦恼的Windows和Linux之间的协调问题)。最后，容器和Kubernetes将能够满足未来所有运行内容的需求。它们正在经受着未来的考验，以应对机器学习、人工智能和分析工作等下一代解决问题工具。

**[ 参考相关文章,[4 container adoption patterns: What you need to know. ] ][4]**

让我们以机器学习为例来思考一下。今天，人们可以在大量的企业数据中找到一些模式。当机器发现这些模式时(想想机器学习)，你的员工就能更快地采取行动。随着人工智能的加入，机器不仅可以发现模式，还可以对模式进行操作。如今，三个星期已经成为了一个积极的软件开发冲刺周期。有了人工智能，机器每秒可以多次修改代码。创业公司会利用这种能力来“打扰你”。

考虑一下你需要多快才能参与到竞争当中。如果你对于无法对于DevOps和每周一个迭代周期充满信心，那么考虑一下当那个创业公司将AI驱动的过程指向你时会发生什么？现在是时候转向DevOps的工作方式了，否认就会像你的竞争对手一样被甩在后面。

### How are containers changing how teams work?

DevOps has frustrated many groups trying to scale this way of working to a bigger group. Many IT (and business) people are suspicious of agile: They've heard it all before - languages, frameworks, and now models (like DevOps), all promising to revolutionize application development and IT process.

**[ Want DevOps advice from other CIOs? See our comprehensive resource, [DevOps: The IT Leader's Guide][5]. ]**

It's not easy to "sell" quick development sprints to your stakeholders, either. Imagine if you bought a house this way. You're not going to pay a fixed amount to your builder anymore. Instead, you get something like: "We'll pour the foundation in 4 weeks and it will cost x. Then we'll frame. Then we'll do electrical. But we only know the timing on the foundation right now." People are used to buying homes with a price up front and a schedule.

The challenge is that building software is not like building a house. The same builder builds thousands of houses that are all the same. Software projects are never the same. This is your first hurdle to get past.

Dev and operations teams really do work differently: I know because I've worked on both sides. We incent them differently. Developers are rewarded for changing and creating, while operations pros are rewarded for reducing cost and ensuring security. We put them in different groups and generally minimize interaction. And the roles typically attract technical people who think quite differently. This situation sets IT up to fail. You have to be willing to break down these barriers.

Think of what has traditionally happened. You throw pieces over the wall, then the business throws requirements over the wall because they are operating in "house-buying" mode: "We'll see you in 9 months." Developers build to those requirements and make changes as needed for technical constraints. Then they throw it over the wall to operations to "figure out how to run this." Operations then works diligently to make a slew of changes to align the software with their infrastructure. And what's the end result?

More often than not, the end result isn't even recognizable to the business when they see it in its final glory.  We've watched this pattern play out time and time again in our industry for the better part of two decades. It's time for a change.

It's Linux containers that truly crack the problem - because containers close the gap between development and operations. They allow both teams to understand and design to all of the critical requirements, but still uniquely fulfill their team's responsibilities. Basically, we take out the telephone game between developers and operations. With containers, we can have smaller operations teams, even teams responsible for millions of applications, but development teams that can change software as quickly as needed. (In larger organizations, the desired pace may be faster than humans can respond on the operations side.)

With containers, you're separating what is delivered from where it runs. Your operations teams are responsible for the host that will run the containers and the security footprint, and that's all. What does this mean?

First, it means you can get going on DevOps now, with the team you have. That's right. Keep teams focused on the expertise they already have: With containers, just teach them the bare minimum of the required integration dependencies.

If you try and retrain everyone, no one will be that good at anything. Containers let teams interact, but alongside a strong boundary, built around each team's strengths. Your devs know what needs to be consumed, but don't need to know how to make it run at scale. Ops teams know the core infrastructure, but don't need to know the minutiae of the app. Also, Ops teams can update apps to address new security implications, before you become the next trending data breach story.

Teaching a large IT organization of say 30,000 people both ops and devs skills? It would take you a decade. You don't have that kind of time.

When people talk about "building new, cloud-native apps will get us out of this problem," think critically. You can build cloud-native apps in 10-person teams, but that doesn't scale for a Fortune 1000 company. You can't just build new microservices one by one until you're somehow not reliant on your existing team: You'll end up with a siloed organization. It's an alluring idea, but you can't count on these apps to redefine your business. I haven't met a company that could fund parallel development at this scale and succeed. IT budgets are already constrained; doubling or tripling them for an extended period of time just isn't realistic.

### When the remarkable happens: Hello, velocity

Linux containers were made to scale. Once you start to do so, [orchestration tools like Kubernetes come into play][6] - because you'll need to run thousands of containers. Applications won't consist of just a single container, they will depend on many different pieces, all running on containers, all running as a unit. If they don't, your apps won't run well in production.

Think of how many small gears and levers come together to run your business: The same is true for any application. Developers are responsible for all the pulleys and levers in the application. (You could have an integration nightmare if developers don't own those pieces.) At the same time, your operations team is responsible for all the pulleys and levers that make up your infrastructure, whether on-premises or in the cloud.  With Kubernetes as an abstraction, your operations team can give the application the fuel it needs to run - without being experts on all those pieces.

Developers get to experiment. The operations team keeps infrastructure secure and reliable. This combination opens up the business to take small risks that lead to innovation. Instead of having to make only a couple of bet-the-farm size bets, real experimentation happens inside the company, incrementally and quickly.

In my experience, this is where the remarkable happens inside organizations: Because people say "How do we change planning to actually take advantage of this ability to experiment?" It forces agile planning.

For example, KeyBank, which uses a DevOps model, containers, and Kubernetes, now deploys code every day. (Watch this [video][7] in which John Rzeszotarski, director of Continuous Delivery and Feedback at KeyBank, explains the change.) Similarly, Macquarie Bank uses DevOps and containers to put something in production every day.

Once you push software every day, it changes every aspect of how you plan - and [accelerates the rate of change to the business][8]. "An idea can get to a customer in a day," says Luis Uguina, CDO of Macquarie's banking and financial services group. (See this [case study][9] on Red Hat's work with Macquarie Bank).

### The right time to build something great

The Macquarie example demonstrates the power of velocity. How would that change your approach to your business? Remember, Macquarie is not a startup. This is the type of disruptive power that CIOs face, not only from new market entrants but also from established peers.

The developer freedom also changes the talent equation for CIOs running agile shops. Suddenly, individuals within huge companies (even those not in the hottest industries or geographies) can have great impact. Macquarie uses this dynamic as a recruiting tool, promising developers that all new hires will push something live within the first week.

At the same time, in this day of cloud-based compute and storage power, we have more infrastructure available than ever. That's fortunate, considering the [leaps that machine learning and AI tools will soon enable][10].

This all adds up to this being the right time to build something great. Given the pace of innovation in the market, you need to keep building great things to keep customers loyal. So if you've been waiting to place your bet on DevOps, now is the right time. Containers and Kubernetes have changed the rules - in your favor.

**Want more wisdom like this, IT leaders? [Sign up for our weekly email newsletter][11].**

--------------------------------------------------------------------------------

via: https://enterprisersproject.com/article/2018/1/how-technology-changes-rules-doing-agile

作者：[Matt Hicks][a]
译者：[JayFrank](https://github.com/JayFrank)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://enterprisersproject.com/user/matt-hicks
[1]:https://enterprisersproject.com/tags/devops
[2]:https://www.redhat.com/en/topics/containers?intcmp=701f2000000tjyaAAA
[3]:https://www.redhat.com/en/topics/containers/what-is-kubernetes?intcmp=701f2000000tjyaAAA
[4]:https://enterprisersproject.com/article/2017/8/4-container-adoption-patterns-what-you-need-know?sc_cid=70160000000h0aXAAQ
[5]:https://enterprisersproject.com/devops?sc_cid=70160000000h0aXAAQ
[6]:https://enterprisersproject.com/article/2017/11/how-enterprise-it-uses-kubernetes-tame-container-complexity
[7]:https://www.redhat.com/en/about/videos/john-rzeszotarski-keybank-red-hat-summit-2017?intcmp=701f2000000tjyaAAA
[8]:https://enterprisersproject.com/article/2017/11/dear-cios-stop-beating-yourselves-being-behind-transformation
[9]:https://www.redhat.com/en/resources/macquarie-bank-case-study?intcmp=701f2000000tjyaAAA
[10]:https://enterprisersproject.com/article/2018/1/4-ai-trends-watch
[11]:https://enterprisersproject.com/email-newsletter?intcmp=701f2000000tsjPAAQ
