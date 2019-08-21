[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Continuous response: The essential process we're ignoring in DevOps)
[#]: via: (https://opensource.com/article/19/3/continuous-response-devops)
[#]: author: (Randy Bias https://opensource.com/users/randybias)

Continuous response: The essential process we're ignoring in DevOps
======
You probably practice CI and CD, but if you aren't thinking about
continuous response, you aren't really doing DevOps.
![CICD with gears][1]

Continuous response (CR) is an overlooked link in the DevOps process chain. The two other major links—[continuous integration (CI) and continuous delivery (CD)][2]—are well understood, but CR is not. Yet, CR is the essential element of follow-through required to make customers happy and fulfill the promise of greater speed and agility. At the heart of the DevOps movement is the need for greater velocity and agility to bring businesses into our new digital age. CR plays a pivotal role in enabling this.

### Defining CR

We need a crisp definition of CR to move forward with breaking it down. To put it into context, let's revisit the definitions of continuous integration (CI) and continuous delivery (CD). Here are Gartner's definitions when I wrote this them down in 2017:

> [Continuous integration][3] is the practice of integrating, building, testing, and delivering functional software on a scheduled, repeatable, and automated basis.
>
> Continuous delivery is a software engineering approach where teams keep producing valuable software in short cycles while ensuring that the software can be reliably released at any time.

I propose the following definition for CR:

> Continuous response is a practice where developers and operators instrument, measure, observe, and manage their deployed software looking for changes in performance, resiliency, end-user behavior, and security posture and take corrective actions as necessary.

We can argue about whether these definitions are 100% correct. They are good enough for our purposes, which is framing the definition of CR in rough context so we can understand it is really just the last link in the chain of a holistic cycle.

![The holistic DevOps cycle][4]

What is this multi-colored ring, you ask? It's the famous [OODA Loop][5]. Before continuing, let's touch on what the OODA Loop is and why it's relevant to DevOps. We'll keep it brief though, as there is already a long history between the OODA Loop and DevOps.

#### A brief aside: The OODA Loop

At the heart of core DevOps thinking is using the OODA Loop to create a proactive process for evolving and responding to changing environments. A quick [web search][6] makes it easy to learn the long history between the OODA Loop and DevOps, but if you want the deep dive, I highly recommend [The Tao of Boyd: How to Master the OODA Loop][7].

Here is the "evolved OODA Loop" presented by John Boyd:

![OODA Loop][8]

The most important thing to understand about the OODA Loop is that it's a cognitive process for adapting to and handling changing circumstances.

The second most important thing to understand about the OODA Loop is, since it is a thought process that is meant to evolve, it depends on driving feedback back into the earlier parts of the cycle as you iterate.

As you can see in the diagram above, CI, CD, and CR are all their own isolated OODA Loops within the overall DevOps OODA Loop. The key here is that each OODA Loop is an evolving thought process for how test, release, and success are measured. Simply put, those who can execute on the OODA Loop fastest will win.

Put differently, DevOps wants to drive speed (executing the OODA Loop faster) combined with agility (taking feedback and using it to constantly adjust the OODA Loop). This is why CR is a vital piece of the DevOps process. We must drive production feedback into the DevOps maturation process. The DevOps notion of Culture, Automation, Measurement, and Sharing ([CAMS][9]) partially but inadequately captures this, whereas CR provides a much cleaner continuation of CI/CD in my mind.

### Breaking CR down

CR has more depth and breadth than CI or CD. This is natural, given that what we're categorizing is the post-deployment process by which our software is taking a variety of actions from autonomic responses to analytics of customer experience. I think, when it's broken down, there are three key buckets that CR components fall into. Each of these three areas forms a complete OODA Loop; however, the level of automation throughout the OODA Loop varies significantly.

The following table will help clarify the three areas of CR:

CR Type | Purpose | Examples
---|---|---
Real-time | Autonomics for availability and resiliency | Auto-scaling, auto-healing, developer-in-the-loop automated responses to real-time failures, automated root-cause analysis
Analytic | Feature/fix pipeline | A/B testing, service response times, customer interaction models
Predictive | History-based planning | Capacity planning, hardware failure prediction models, cost-basis analysis

_Real-time CR_ is probably the best understood of the three. This kind of CR is where our software has been instrumented for known issues and can take an immediate, automated response (autonomics). Examples of known issues include responding to high or low demand (e.g., elastic auto-scaling), responding to expected infrastructure resource failures (e.g., auto-healing), and responding to expected distributed application failures (e.g., circuit breaker pattern). In the future, we will see machine learning (ML) and similar technologies applied to automated root-cause analysis and event correlation, which will then provide a path towards "no ops" or "zero ops" operational models.

_Analytic CR_ is still the most manual of the CR processes. This kind of CR is focused primarily on observing end-user experience and providing feedback to the product development cycle to add features or fix existing functionality. Examples of this include traditional A/B website testing, measuring page-load times or service-response times, post-mortems of service failures, and so on.

_Predictive CR_ , due to the resurgence of AI and ML, is one of the innovation areas in CR. It uses historical data to predict future needs. ML techniques are allowing this area to become more fully automated. Examples include automated and predictive capacity planning (primarily for the infrastructure layer), automated cost-basis analysis of service delivery, and real-time reallocation of infrastructure resources to resolve capacity and hardware failure issues before they impact the end-user experience.

### Diving deeper on CR

CR, like CI or CD, is a DevOps process supported by a set of underlying tools. CI and CD are not Jenkins, unit tests, or automated deployments alone. They are a process flow. Similarly, CR is a process flow that begins with the delivery of new code via CD, which open source tools like [Spinnaker][10] give us. CR is not monitoring, machine learning, or auto-scaling, but a diverse set of processes that occur after code deployment, supported by a variety of tools. CR is also different in two specific ways.

First, it is different because, by its nature, it is broader. The general software development lifecycle (SDLC) process means that most [CI/CD processes][11] are similar. However, code running in production differs from app to app or service to service. This means that CR differs as well.

Second, CR is different because it is nascent. Like CI and CD before it, the process and tools existed before they had a name. Over time, CI/CD became more normalized and easier to scope. CR is new, hence there is lots of room to discuss what's in or out. I welcome your comments in this regard and hope you will run with these ideas.

### CR: Closing the loop on DevOps

DevOps arose because of the need for greater service delivery velocity and agility. Essentially, DevOps is an extension of agile software development practices to an operational mindset. It's a direct response to the flexibility and automation possibilities that cloud computing affords. However, much of the thinking on DevOps to date has focused on deploying the code to production and ends there. But our jobs don't end there. As professionals, we must also make certain our code is behaving as expected, we are learning as it runs in production, and we are taking that learning back into the product development process.

This is where CR lives and breathes. DevOps without CR is the same as saying there is no OODA Loop around the DevOps process itself. It's like saying that operators' and developers' jobs end with the code being deployed. We all know this isn't true. Customer experience is the ultimate measurement of our success. Can people use the software or service without hiccups or undue friction? If not, we need to fix it. CR is the final link in the DevOps chain that enables delivering the truest customer experience.

If you aren't thinking about continuous response, you aren't doing DevOps. Share your thoughts on CR, and tell me what you think about the concept and the definition.

* * *

_This article is based on[The Essential DevOps Process We're Ignoring: Continuous Response][12], which originally appeared on the Cloudscaling blog under a [CC BY 4.0][13] license and is republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/continuous-response-devops

作者：[Randy Bias][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/randybias
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cicd_continuous_delivery_deployment_gears.png?itok=kVlhiEkc (CICD with gears)
[2]: https://opensource.com/article/18/8/what-cicd
[3]: https://www.gartner.com/doc/3187420/guidance-framework-continuous-integration-continuous
[4]: https://opensource.com/sites/default/files/uploads/holistic-devops-cycle-smaller.jpeg (The holistic DevOps cycle)
[5]: https://en.wikipedia.org/wiki/OODA_loop
[6]: https://www.google.com/search?q=site%3Ablog.b3k.us+ooda+loop&rlz=1C5CHFA_enUS730US730&oq=site%3Ablog.b3k.us+ooda+loop&aqs=chrome..69i57j69i58.8660j0j4&sourceid=chrome&ie=UTF-8#q=devops+ooda+loop&*
[7]: http://www.artofmanliness.com/2014/09/15/ooda-loop/
[8]: https://opensource.com/sites/default/files/uploads/ooda-loop-2-1.jpg (OODA Loop)
[9]: https://itrevolution.com/devops-culture-part-1/
[10]: https://www.spinnaker.io
[11]: https://opensource.com/article/18/12/cicd-tools-sysadmins
[12]: http://cloudscaling.com/blog/devops/the-essential-devops-process-were-ignoring-continuous-response/
[13]: https://creativecommons.org/licenses/by/4.0/
