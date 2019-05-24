How technology changes the rules for doing agile
======

![](https://enterprisersproject.com/sites/default/files/styles/620x350/public/images/CIO%20Containers%20Ecosystem.png?itok=lDTaYXzk)

More companies are trying agile and [DevOps][1] for a clear reason: Businesses want more speed and more experiments - which lead to innovations and competitive advantage. DevOps helps you gain that speed. But doing DevOps in a small group or startup and doing it at scale are two very different things. Any of us who've worked in a cross-functional group of 10 people, come up with a great solution to a problem, and then tried to apply the same patterns across a team of 100 people know the truth: It often doesn't work. This path has been so hard, in fact, that it has been easy for IT leaders to put off agile methodology for another year.

But that time is over. If you've tried and stalled, it's time to jump back in.

Until now, DevOps required customized answers for many organizations - lots of tweaks and elbow grease. But today, [Linux containers ][2]and Kubernetes are fueling standardization of DevOps tools and processes. That standardization will only accelerate. The technology we are using to practice the DevOps way of working has finally caught up with our desire to move faster.

Linux containers and [Kubernetes][3] are changing the way teams interact. Moreover, on the Kubernetes platform, you can run any application you now run on Linux. What does that mean? You can run a tremendous number of enterprise apps (and handle even previously vexing coordination issues between Windows and Linux.) Finally, containers and Kubernetes will handle almost all of what you'll run tomorrow. They're being future-proofed to handle machine learning, AI, and analytics workloads - the next wave of problem-solving tools.

**[ See our related article,[4 container adoption patterns: What you need to know. ] ][4]**

Think about machine learning, for example. Today, people still find the patterns in much of an enterprise's data. When machines find the patterns (think machine learning), your people will be able to act on them faster. With the addition of AI, machines can not only find but also act on patterns. Today, with people doing everything, three weeks is an aggressive software development sprint cycle. With AI, machines can change code multiple times per second. Startups will use that capability - to disrupt you.

Consider how fast you have to be to compete. If you can't make a leap of faith now to DevOps and a one week cycle, think of what will happen when that startup points its AI-fueled process at you. It's time to move to the DevOps way of working now, or get left behind as your competitors do.

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
译者：[译者ID](https://github.com/译者ID)
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
