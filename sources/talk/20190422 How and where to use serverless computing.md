[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How and where to use serverless computing)
[#]: via: (https://www.networkworld.com/article/3390116/how-and-where-to-use-serverless-computing.html#tk.rss_all)
[#]: author: (Bob Violino )

How and where to use serverless computing
======
Serverless computing is designed to automate infrastructure provisioning and eliminate the burden of server management.
![Getty Images][1]

Is your organization ready to go serverless? The trend toward [serverless computing][2] is clearly on the rise, but that doesn’t mean it works ideally for every scenario or organization.

Serverless computing is a software architecture model in which a cloud service provider runs the server for a customer and dynamically manages the allocation of computing resources. The term “serverless” is a misnomer, in the sense that servers are still involved in the process.

**Learn more about serverless computing**

  * [Serverless: The next generation of cloud infrastructure][2]
  * [What is Amazon's Lambda and why is it a big deal?][3]
  * [This startup runs its app without servers or virtual machines][4]
  * [Solving for serverless: How do you manage something that’s not there?][5]



Pricing for these types of services is based on the actual amount of resources an application consumes rather than on pre-purchased units of capacity.

The serverless architecture market totaled an estimated $4.25 billion in 2018 and is expected to reach $14.93 billion by 2023, a compound annual growth rate (CAGR) of 29% during the forecast period, according to a 2018 report by research firm [Markets and Markets][6]. North America is expected to account for the largest market share during the forecast period, due in part to the early adoption of cloud services.

The major factors expected to drive growth of the market include the elimination of the need to manage servers, which reduces infrastructure costs and eases deployment, management, and execution. Also helping to drive growth is the proliferation of microservices architectures.

Automation and integration services play a major role in the deployment of serverless architecture, according to Markets and Markets. Automation services help efficiently manage microservices—deployed on hybrid IT platforms—to provide faster response along with optimum use of computing resources.

Gartner is also bullish on serverless computing; the research firm included serverless computing as one of its top 10 trends impacting infrastructure and operations for 2019, and it says the emerging software architecture model promises to eliminate the need for infrastructure provisioning and management.

### Appeal of serverless computing for IT administrators

Serverless has a great attraction not just for application developers, but also for systems operations personnel, says Ken Corless, principal in the cloud practice at Deloitte Consulting.

Whether offered by hyperscale cloud providers or implemented on-premise with various solutions on the market, the goal of serverless computing is the same: “ruthless automation and self-service to speed the software development lifecycle,” Corless says.

For IT administrators, serverless reduces the “request-response” cycle of ticket-based workloads and allows administrators to focus on higher-level tasks such as infrastructure design or creating more automation, Corless says.

There are two main use cases that Corless is seeing. One is in application development for creating modern, loosely coupled services-based applications. Both function-as-a-service (FaaS) and backend-as-a-service (BaaS)—two cloud-enabled services that achieve serverless computing—can dramatically improve the productivity of a software delivery team by keeping teams small, he says.

The other big use case is by system administrators. “The very automation they seek can be implemented quickly, easily, and incrementally with serverless technologies,” Corless says. For example, in Deloitte’s Cloud Managed Services business, the firm uses serverless extensively to automate operation of the offering.

Just as with cloud services, however, there are scenarios where serverless can cost more than paying for virtual machines, Corless says. An application that currently runs on virtual machines with consistent 80% usage on a continuous basis will probably cost more in a serverless environment, he says.

“The real promise of serverless, though, is having fewer people doing some of the mundane tasks of IT,” such as software patching and backup, Corless says. This drives two benefits. First, the people doing those mundane tasks can focus on creating value elsewhere in IT or in the enterprise.

“Nobody is thrilled to be the person whose job it is to make [DNS][7] [domain name system] changes,” Corless says. “These people can be repurposed to develop new capabilities. Driving more automation is the number one thing I see happening.”

The second benefit is the ability, even in a large corporation, for smaller teams to be more self-deterministic. “As the expertise and guiderails of infrastructure management get automated, teams can self-serve, and do it safely,” Corless says. “However, this typically takes some investment to automate the standards and guiderails, as what we see from the serverless offerings are often not ‘safe’ enough to use without some type of guardrail/constraint.”

Anytime an application can take advantage of event-driven computing with decoupled services, it is ideal for the serverless platform, says Larry Carvalho, research director, platform as a service, at International Data Corp. (IDC).

The most common use cases are Internet of Things (IoT) applications and mobile backends that need event-driven processing, Carvalho says. Other use cases are batch processing or stream processing for real-time reaction to events.

### Serverless computing best practices

So how can organizations help ensure success with serverless? Here are some suggested practices from experts.

_Bring the serverless product's constraints into the design process._

Engineering teams converting to serverless often forget that stringent constraints exist in even the most flexible products, says Daniel Smith, IoT platform architect at [Cordial Inc.][8], a provider of marketing technology.

“Remembering serverless is just someone else's server or container, with its own design constraints, will go a long way” toward success with serverless, Smith says. “The line delineating responsibility is much higher in the stack with serverless, so constraints like total run time, CPU time consumed, or total memory used need to be considered during design and implementation.”

Cordial started exploring serverless technologies in 2015, with the goal of having a predictable cost model during a time of unpredictable resource use. “As a startup, having a predictable, demand-based cost structure was attractive,” Smith says.

In May 2018 the company began using Cloudflare's Workers technology as a replacement for some of its systems. As a business-to-business company that serves consumers on behalf of its clients, Cordial's interactions with consumers need to be as fast as possible.

“This often demands moving the workload as geographically close to the consumer as possible,” which serverless provides, Smith says.

Because Cordial has been able to shrink the size of microservices, it’s been willing to experiment with programming languages it wouldn't have otherwise deployed, allowing the company to deliver more efficient products faster and with more confidence.

_Design finite workloads._

Organizations should think of a serverless architecture as an execution engine for a single method or function, Smith says.

“Further refining that goal, the input and output of the function should be the smallest possible data that can be worked on,” Smith says. “Instead of using a serverless function to process a data file, send each row of data to a separate execution.”

By reducing the size of each unit of work, the narrative begins shifting to how quickly the network can move data between services. “For in-flight data, we can begin to think of the network as a kind of volatile storage where every clock-second affords us 10 [gigabytes] of storage per network interface,” Smith says. “Disk, the slowest system component, is therefore avoided until a final output must be stored persistently.”

_Make functions as stateless as possible._

Global variables common in monolithic applications don’t work with serverless because the global state might not be persistent between invocations, says Daniel Dyla, a software engineer at [Dynatrace][9], an application performance software provider.

“To combat this, serverless functions should be stateless wherever possible,” Dyla says. “If state is required, it is better to have one function that gathers state from an outside [database] and calls another stateless function which does the actual data processing. This way, you can keep stateful interactions quarantined to designated places where they are easier to manage.”

Dynatrace has been using serverless technology for the last couple of years, attracted by the low cost, ability to scale, and event-driven invocations, Dyla says. The company is using serverless computing for polling systems that need to be operating continuously for batch processing.

“The primary benefit we’ve seen is the low cost,” Dyla says. “Our serverless functions tend to be small snippets of code with burst loads that can scale up from zero and back very quickly.”

_Automate deployment and testing._

While there are tools that make the manual deployment of serverless computing easy, automating the deployment allows you to have a consistent implementation with no room for human error, says Hristo Papazov, senior software engineer at [Relativity][10], a provider of e-discovery software.

Automation “also allows other teams within your organization to easily adopt these technologies,” Papazov says.

Relativity is using serverless technology from Microsoft’s Azure cloud service, as part of an effort to improve customer experience with its e-discovery platform by ensuring its core components are up and running. The company leverages serverless for its internal monitoring tools, enabling users to process large amounts of telemetry data to quickly detect and resolve issues, Papazov says.

With the increasing complexity of serverless applications, unit testing becomes a critical part of the development cycle, and automation helps with that as well, Papazov says. “When Microsoft introduced Azure Functions a while back, unit testing was very difficult if not almost possible,” he says. “Things have come a long way since then and now adding unit tests to a project is very easy.”

_Understand modern application architecture._

Managers should aim to break up applications into short running, independent and decoupled services, Carvalho says. “Architect a stateless application while taking advantage of supporting services like API management for communications and security features for user identity,” he says.

For example, a Web application server running continuously to process incoming transactions could be broken up by extracting the business logic and running them as microservices in a serverless framework, Carvalho says. “This removes the cost of continuously running the server while ­handing the headache of failover to the cloud provider.”

_Make cyber security a priority._

Although with serverless companies might not have to worry about patching their servers or running anti-virus software, a serverless offering that is based on application programming interfaces (APIs) “radically multiplies the endpoints of your solution,” Corless says. “And if your APIs are used by your customers [or] partners, it gets even hairier.”

As a result, companies might need to rethink their approach to firewall rules, “as you can quickly create an unmanageable mess,” Corless says.

Join the Network World communities on [Facebook][11] and [LinkedIn][12] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3390116/how-and-where-to-use-serverless-computing.html#tk.rss_all

作者：[Bob Violino][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/cloud_comput_connect_blue-100787048-large.jpg
[2]: https://www.networkworld.com/article/3187093/serverless-explainer-the-next-generation-of-cloud-infrastructure.html
[3]: https://www.networkworld.com/article/3053111/what-is-amazon-cloud-s-lambda-and-why-is-it-a-big-deal.html
[4]: http://preview-app1.usw.www.idgesg.networkworld.com/article/3017135/startup-runs-its-app-without-servers-or-virtual-machines.html
[5]: https://www.networkworld.com/article/3287648/solving-for-serverless-how-do-you-manage-something-that-s-not-there.html
[6]: https://www.marketsandmarkets.com/
[7]: https://www.networkworld.com/article/3268449/what-is-dns-and-how-does-it-work.html
[8]: https://cordial.com/
[9]: https://www.dynatrace.com/
[10]: https://www.relativity.com/
[11]: https://www.facebook.com/NetworkWorld/
[12]: https://www.linkedin.com/company/network-world
