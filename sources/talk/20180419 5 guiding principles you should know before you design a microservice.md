5 guiding principles you should know before you design a microservice
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BIZ_OpenInnovation.png?itok=l29msbql)
One of the biggest challenges for teams starting off with microservices is adhering to the Goldilocks Principle: Not too big, not too small, and not too tightly coupled. Part of this challenge arises from confusion about what, exactly, constitutes a well-designed microservice.

Dozens of CTOs shared their experiences through interviews, and those conversations illuminated five characteristics of well-designed microservices. This article will help guide teams as they design microservices. (For more information, check out the upcoming book [Microservices for Startups][1]). This article will briefly touch on microservice boundaries and arbitrary "rules" to avoid before diving into the five characteristics to guide your design of microservices.

### Microservice boundaries

One of the [core benefits of developing new systems with microservices][2] is that the architecture allows developers to build and modify individual components independently—but problems can arise when it comes to minimizing the number of callbacks between each API. The solution, according to Chris McFadden, VP of engineering at [SparkPost][3] , is to apply the appropriate service boundaries.

With respect to boundaries, in contrast to the sometimes difficult-to-grasp and abstract concept of domain-driven design (DDD)—a framework for microservices—this article focuses on practical principles for creating well-defined microservice boundaries with some of our industry's top CTOs.

### Avoid arbitrary "rules"

If you read enough advice about designing and creating a microservice, you're bound to come across some of the "rules" below. Although it's tempting to use them as guideposts for creating microservices, adhesion to these arbitrary rules is not a principled way to determine thoughtful boundaries for microservices.

#### "A microservice should have X lines of code"

Let's get one thing straight: There are no limitations on how many lines of code there are in a microservice. A microservice doesn't suddenly become a monolith just because you write a few lines of extra code. The key is ensuring there is high cohesion for the code within a service (more on this later).

#### "Turn each function into a microservice"

If a function computes something based on three input values and returns a result, is it a good candidate for a microservice? Should it be a separately deployable application of its own? This really depends on what the function is and how it serves to the entire system. Turning each function into a microservice simply might not make sense in your context.

Other arbitrary rules include those that don't take into account your entire context, such as the team's experience, DevOps capacity, what the service is doing, and availability needs of the data.

### 5 characteristics of a well-designed service

If you've read about microservices, you've no doubt come across advice on what makes a well-designed service. Simply put, high cohesion and loose coupling. There are [many][4] [articles][5] on these concepts to review if you're not familiar with them. And while they offer sound advice, these concepts are quite abstract. Below, based on conversations with experienced CTOs, are key characteristics to keep in mind when creating well-designed microservices.

#### #1: It doesn't share database tables with another service

In the early days of SparkPost, Chris McFadden and his team had to solve a problem that every SaaS business faces: They needed to provide basic services like authentication, account management, and billing.

To tackle this, they created two microservices: a Users API and an Accounts API. The Users API would handle user accounts, API keys, and authentication, while the Accounts API would handle all of the billing-related logic. A very logical separation—but before long, they spotted a problem.

"We had one service that was called the User API, and we had another one called the Account API. The problem was that they were actually having several calls back and forth between them. So you would do something in accounts and have a call and endpoint in users or vice versa," McFadden explained.

The two services were too tightly coupled.

When it comes to designing a microservice, it's a red flag if you have multiple services referencing the same table, as it likely means your DB is a source of coupling.

It is really about how the service relates to the data, which is exactly what Oleksiy Kovrin, head of [Swiftype SRE, Elastic][6], told me. "One of the main foundational principles we use when developing new services is that they should not cross database boundaries. Each service should rely on its own set of underlying data stores. This allows us to centralize access controls, audit logging, caching logic, etc.," he said.

Kovyrin went on to explain that if a subset of your database tables "have no or very little connections to the rest of the dataset, it is a strong signal that component could be isolated into a separate API or a separate service."

Darby Frey, co-founder of [Lead Honestly][7], echoed this sentiment: "Each service should have its own tables [and] should never share database tables."

#### #2: It has a minimal amount of database tables

The ideal size of a microservice is small enough, but no smaller. And the same goes for the number of database tables per service.

Steven Czerwinski, head of engineering, [Scaylr][8], explained during an interview that the sweet spot for Scaylr is "one or two database tables for a service."

SparkPost's Chris McFadden agreed: "We have a suppression microservices, and it handles, keeps track of, millions and billions of entries around suppressions, but it's all very focused just around suppression, so there's really only one or two tables there. The same goes for other services like webhooks."

#### #3: It's thoughtfully stateful or stateless

When designing your microservice, you need to ask yourself whether it requires access to a database or whether it's going to be a stateless service processing terabytes of data like emails or logs.

Julien Lemoine, CTO of [Algolia][9], explained, "We define the boundaries of a service by defining its input and output. Sometimes a service is a network API, but it can also be a process consuming files and producing records in a database (this is the case of our log-processing service)."

Be clear about statefulness up front and it will lead to a better-designed service.

#### #4: Its data availability needs are accounted for

When designing a microservice, keep in mind what services will rely on this new service and the system-wide impact if that data becomes unavailable. Taking that into account allows you to properly design data backup and recovery systems for this service

Steven Czerwinski mentioned that at Scaylr, critical customer row space mapping data is replicated and separated in different ways due to its importance.

In contrast, he added, "The per shard information, that's in its own little partition. It sucks if it goes down because that portion of the customer population is not going to have their logs available, but it's only impacting 5 percent of the customers rather than 100 percent of the customers."

#### #5: It's a single source of truth

Design a service to be the single source of truth for something in your system

For example, when you order something from an e-commerce site, an order ID is generated. This order ID can be used by other services to query an order service for complete information about the order. Using the [publish/subscribe pattern][10], the data that is passed around between services should be the order ID, not the attributes/information of the order itself. Only the order service has complete information and is the single source of truth for a given order.

### Considerations for larger teams

Keeping in mind the five considerations listed above, larger teams should be aware of the impacts of their organizational structure on microservice boundaries.

For larger organizations, where entire teams can be dedicated to owning a service, organizational consideration comes into play when determining service boundaries. And there are two considerations to consider: **independent release schedule** and **different uptime importance**.

"The most successful implementation of microservices we've seen is either based on a software design principle like domain-driven design, for example, and service-oriented architecture, or the ones that reflect an organizational approach," said Khash Sajadi, CEO of [Cloud66.][11]

"So [for the] payments team," Sajadi continued, "they have the payment service or credit card validation service, and that's the service they provide to the outside world. So it's not necessarily anything about software. It's mostly about the business unit [that] provides one more service to the outside world."

### The two-pizza principle

Amazon is a perfect example of a large organization with multiple teams. As mentioned in an article published in [API Evangelist][12], Jeff Bezos issued a mandate to all employees informing them that every team within the company had to communicate via API. Anyone who didn't would be fired.

This way, all the data and functionality was exposed through the interface. Bezos also managed to get every team to decouple, define what their resources are, and make them available through the API. Amazon was building a system from the ground up. This allows every team within the company to become a partner of one another.

I spoke to Travis Reeder, CTO of [Iron.io][13], about Bezos' internal initiative.

"Jeff Bezos mandated that all teams had to build API's to communicate with other teams," Reeder said. "He's also the guy who came up with the 'two-pizza' rule: A team shouldn't be larger than what two pizzas can feed.

"I think the same could apply here: Whatever a small team can develop, manage, and be productive with. If it starts to get unwieldy or starts to slow down, it's probably getting too big," Reeder told me.

### Final considerations: Is your service the right size and properly defined?

During the testing and implementation phase of your microservice system, there are indicators to keep in mind.

#### Indicator #1: Is there over-reliance between services?

If two services are constantly calling back to one another, then that's a strong indication of coupling and a signal that they might be better off combined into one service.

Going back to Chris McFadden's example where he had two API services, accounts, and users that were constantly communicating with one another, McFadden came up an idea to merge the services and decided to call it the Accuser's API. This turned out to be a fruitful strategy.

"What we started doing was eliminating these links [which were the] internal API calls between them," McFadden told me. "It's helped simplify the code."

#### Indicator #2: Does the overhead of setting up the service outweigh the benefit of having the service be independent?

Darby Frey explained, "Every app needs to have its logs aggregated somewhere and needs to be monitored. You need to set up alerting for it. You need to have standard operating procedures and run books for when things break. You have to manage SSH access to that thing. There's a huge foundation of things that have to exist in order for an app to just run."

### Key takeaways

Designing microservices can often feel more like an art than a science. For engineers, that may not sit well. There's lots of general advice out there, but at times it can be a bit too abstract. Let's recap the five specific characteristics to look for when designing your next set of microservices:

  1. It doesn't share database tables with another service
  2. It has a minimal amount of database tables
  3. It's thoughtfully stateful or stateless
  4. Its data availability needs are accounted for
  5. It's a single source of truth



Next time you're designing a set of microservices and determining service boundaries, referring back to these principles should make the task easier.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/guide-design-microservices

作者：[Jake Lumetta][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jakelumetta
[1]:https://buttercms.com/books/microservices-for-startups/
[2]:https://buttercms.com/books/microservices-for-startups/should-you-always-start-with-a-monolith
[3]:https://www.sparkpost.com/
[4]:https://thebojan.ninja/2015/04/08/high-cohesion-loose-coupling/
[5]:https://en.wikipedia.org/wiki/Single_responsibility_principle
[6]:https://www.elastic.co/solutions/site-search
[7]:https://leadhonestly.com/
[8]:https://www.scalyr.com/
[9]:https://www.algolia.com/
[10]:https://en.wikipedia.org/wiki/Publish%E2%80%93subscribe_pattern
[11]:https://www.cloud66.com/
[12]:https://apievangelist.com/2012/01/12/the-secret-to-amazons-success-internal-apis/
[13]:https://www.iron.io/
