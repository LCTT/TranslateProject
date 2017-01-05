Reactive programming vs. Reactive systems
============================================================

>Landing on a set of simple reactive design principles in a sea of constant confusion and overloaded expectations.

 ![Micro Fireworks](https://d3tdunqjn7n0wj.cloudfront.net/360x240/micro_fireworks-db2d0a45f22f348719b393dd98ebefa2.jpg) 

Download Konrad Malawski's free ebook "[Why Reactive? Foundational Principles for Enterprise Adoption][5]" to dive deeper into the technical aspects and benefits of Reactive.

Since co-authoring the "[Reactive Manifesto][23]" in 2013, we’ve seen the topic of reactive go from being a virtually unacknowledged technique for constructing applications—used by only fringe projects within a select few corporations—to become part of the overall platform strategy in numerous big players in the middleware field. This article aims to define and clarify the different aspects of reactive by looking at the differences between writing code in a _reactive programming_ style, and the design of _reactive systems_ as a cohesive whole.

### Reactive is a set of design principles

One recent indicator of success is that "reactive" has become an overloaded term and is now being associated with several different things to different people—in good company with words like "streaming," "lightweight," and "real-time."

Consider the following analogy: When looking at an athletic team (think: baseball, basketball, etc.) it’s not uncommon to see it composed of exceptional individuals, yet when they come together something doesn’t click and they lack the synergy to operate effectively as a team and lose to an "inferior" team.From the perspective of this article, reactive is a set of design principles, a way of thinking about systems architecture and design in a distributed environment where implementation techniques, tooling, and design patterns are components of a larger whole—a system.

This analogy illustrates the difference between a set of reactive applications put together without thought—even though _individually_ they’re great—and a reactive system. In a reactive system, it’s the _interaction between the individual parts_ that makes all the difference, which is the ability to operate individually yet act in concert to achieve their intended result.

_A reactive system_ is an architectural style that allows multiple individual applications to coalesce as a single unit, reacting to its surroundings, while remaining aware of each other—this could manifest as being able to scale up/down, load balancing, and even taking some of these steps proactively.

It’s possible to write a single application in a reactive style (i.e. using reactive programming); however, that’s merely one piece of the puzzle. Though each of the above aspects may seem to qualify as "reactive," in and of themselves they do not make a _system_ reactive.

When people talk about "reactive" in the context of software development and design, they generally mean one of three things:

*   Reactive systems (architecture and design)
*   Reactive programming (declarative event-based)
*   Functional reactive programming (FRP)

We’ll examine what each of these practices and techniques mean, with emphasis on the first two. More specifically, we’ll discuss when to use them, how they relate to each other, and what you can expect the benefits from each to be—particularly in the context of building systems for multicore, cloud, and mobile architectures.

Let’s start by talking about functional reactive programming, and why we chose to exclude it from further discussions in this article.

### Functional reactive programming (FRP)

_Functional reactive programming_, commonly called _FRP_, is most frequently misunderstood. FRP was very [precisely defined][24] 20 years ago by Conal Elliott. The term has most recently been used incorrectly[1][8] to describe technologies like Elm, Bacon.js, and Reactive Extensions (RxJava, Rx.NET, RxJS) amongst others. Most libraries claiming to support FRP are almost exclusively talking about _reactive programming_ and it will therefore not be discussed further.

### Reactive programming

_Reactive programming_, not to be confused with _functional reactive programming_, is a subset of asynchronous programming and a paradigm where the availability of new information drives the logic forward rather than having control flow driven by a thread-of-execution.

It supports decomposing the problem into multiple discrete steps where each can be executed in an asynchronous and non-blocking fashion, and then be composed to produce a workflow—possibly unbounded in its inputs or outputs.

[Asynchronous][25] is defined by the Oxford Dictionary as “not existing or occurring at the same time,” which in this context means that the processing of a message or event is happening at some arbitrary time, possibly in the future. This is a very important technique in reactive programming since it allows for [non-blocking][26] execution—where threads of execution competing for a shared resource don’t need to wait by blocking (preventing the thread of execution from performing other work until current work is done), and can as such perform other useful work while the resource is occupied. Amdahl’s Law[2][9] tells us that contention is the biggest enemy of scalability, and therefore a reactive program should rarely, if ever, have to block.

Reactive programming is generally _event-driven_, in contrast to reactive systems, which are _message-driven_—the distinction between event-driven and message-driven is clarified later in this article.

The application program interface (API) for reactive programming libraries are generally either:

*   Callback-based—where anonymous side-effecting callbacks are attached to event sources, and are being invoked when events pass through the dataflow chain.
*   Declarative—through functional composition, usually using well-established combinators like _map_, _filter_, _fold_etc.

Most libraries provide a mix of these two styles, often with the addition of stream-based operators like windowing, counts, triggers, etc.

It would be reasonable to claim that reactive programming is related to [dataflow programming][27], since the emphasis is on the _flow of data_ rather than the _flow of control_.

Examples of programming abstractions that support this programming technique are:

*   [Futures/Promises][10]—containers of a single value, many-read/single-write semantics where asynchronous transformations of the value can be added even if it is not yet available.
*   Streams—as in [reactive streams][11]: unbounded flows of data processing, enabling asynchronous, non-blocking, back-pressured transformation pipelines between a multitude of sources and destinations.
*   [Dataflow variables][12]—single assignment variables (memory-cells) which can depend on input, procedures and other cells, so that they are automatically updated on change. A practical example is spreadsheets—where the change of the value in a cell ripples through all dependent functions, producing new values downstream.

Popular libraries supporting the reactive programming techniques on the JVM include, but are not limited to, Akka Streams, Ratpack, Reactor, RxJava, and Vert.x. These libraries implement the reactive streams specification, which is a standard for interoperability between reactive programming libraries on the JVM, and according to its own description is “...an initiative to provide a standard for asynchronous stream processing with non-blocking back pressure.”

The primary benefits of reactive programming are: increased utilization of computing resources on multicore and multi-CPU hardware; and increased performance by reducing serialization points as per Amdahl’s Law and, by extension, Günther’s Universal Scalability Law[3][13].

A secondary benefit is one of developer productivity as traditional programming paradigms have all struggled to provide a straightforward and maintainable approach to dealing with asynchronous and non-blocking computation and I/O. Reactive programming solves most of the challenges here since it typically removes the need for explicit coordination between active components.

Where reactive programming shines is in the creation of components and composition of workflows. In order to take full advantage of asynchronous execution, the inclusion of [back-pressure][28] is crucial to avoid over-utilization, or rather unbounded consumption of resources.

Even though reactive programming is a very useful piece when constructing modern software, in order to reason about a system at a higher level one has to use another tool: _reactive architecture_—the process of designing reactive systems. Furthermore, it is important to remember that there are many programming paradigms and reactive programming is but one of them, so just as with any tool, it is not intended for any and all use-cases.

### Event-driven vs. message-driven

As mentioned previously, reactive programming—focusing on computation through ephemeral dataflow chains—tend to be _event-driven_, while reactive systems—focusing on resilience and elasticity through the communication, and coordination, of distributed systems—is [_message-driven_][29][4][14](also referred to as _messaging_).

The main difference between a message-driven system with long-lived addressable components, and an event-driven dataflow-driven model, is that messages are inherently directed, events are not. Messages have a clear (single) destination, while events are facts for others to observe. Furthermore, messaging is preferably asynchronous, with the sending and the reception decoupled from the sender and receiver respectively.

The glossary in the Reactive Manifesto [defines the conceptual difference as][30]:

> A message is an item of data that is sent to a specific destination. An event is a signal emitted by a component upon reaching a given state. In a message-driven system addressable recipients await the arrival of messages and react to them, otherwise lying dormant. In an event-driven system notification listeners are attached to the sources of events such that they are invoked when the event is emitted. This means that an event-driven system focuses on addressable event sources while a message-driven system concentrates on addressable recipients.

Messages are needed to communicate across the network and form the basis for communication in distributed systems, while events on the other hand are emitted locally. It is common to use messaging under the hood to bridge an event-driven system across the network by sending events inside messages. This allows maintaining the relative simplicity of the event-driven programming model in a distributed context and can work very well for specialized and well-scoped use cases (e.g., AWS Lambda, Distributed Stream Processing products like Spark Streaming, Flink, Kafka, and Akka Streams over Gearpump, and distributed Publish Subscribe products like Kafka and Kinesis).

However, it is a trade-off: what one gains in abstraction and simplicity of the programming model, one loses in terms of control. Messaging forces us to embrace the reality and constraints of distributed systems—things like partial failures, failure detection, dropped/duplicated/reordered messages, eventual consistency, managing multiple concurrent realities, etc.—and tackle them head on instead of hiding them behind a leaky abstraction—pretending that the network is not there—as has been done too many times in the past (e.g. EJB, [RPC][31], [CORBA][32], and [XA][33]).

These differences in semantics and applicability have profound implications in the application design, including things like _resilience_, _elasticity_, _mobility_, _location transparency,_ and _management_ of the complexity of distributed systems, which will be explained further in this article.

In a reactive system, especially one which uses reactive programming, both events and messages will be present—as one is a great tool for communication (messages), and another is a great way of representing facts (events).

### Reactive systems and architecture

_Reactive systems_—as defined by the Reactive Manifesto—is a set of architectural design principles for building modern systems that are well prepared to meet the increasing demands that applications face today.

The principles of reactive systems are most definitely not new, and can be traced back to the '70s and '80s and the seminal work by Jim Gray and Pat Helland on the [Tandem System][34] and Joe Armstrong and Robert Virding on [Erlang][35]. However, these people were ahead of their time and it is not until the last 5-10 years that the technology industry have been forced to rethink current best practices for enterprise system development and learn to apply the hard-won knowledge of the reactive principles on today’s world of multicore, cloud computing, and the Internet of Things.

The foundation for a reactive system is _message-passing_, which creates a temporal boundary between components that allows them to be decoupled in _time_—this allows for concurrency—and _space_—which allows for distribution and mobility. This decoupling is a requirement for full [isolation][36]between components, and forms the basis for both _resilience_ and _elasticity_.

### From programs to systems

The world is becoming increasingly interconnected. We are no longer building _programs_—end-to-end logic to calculate something for a single operator—as much as we are building _systems_.

Systems are complex by definition—each consisting of a multitude of components, who in and of themselves also can be systems—which mean software is increasingly dependent on other software to function properly.

The systems we create today are to be operated on computers small and large, few and many, near each other or half a world away. And at the same time users’ expectations have become harder and harder to meet as everyday human life is increasingly dependent on the availability of systems to function smoothly.

In order to deliver systems that users—and businesses—can depend on, they have to be _responsive_, for it does not matter if something provides the correct response if the response is not available when it is needed. In order to achieve this, we need to make sure that responsiveness can be maintained under failure (_resilience_) and under load (_elasticity_). To make that happen, we make these systems _message-driven_, and we call them _reactive systems_.

### The resilience of reactive systems

Resilience is about responsiveness _under failure_ and is an inherent functional property of the system, something that needs to be designed for, and not something that can be added in retroactively. Resilience is beyond fault-tolerance—it’s not about graceful degradation—even though that is a very useful trait for systems—but about being able to fully recover from failure: to _self-heal_. This requires component isolation and containment of failures in order to avoid failures spreading to neighbouring components—resulting in, often catastrophic, cascading failure scenarios.

So the key to building resilient, self-healing systems is to allow failures to be: contained, reified as messages, sent to other components (that act as supervisors), and managed from a safe context outside the failed component. Here, being message-driven is the enabler: moving away from strongly coupled, brittle, deeply nested synchronous call chains that everyone learned to suffer through, or ignore. The idea is to decouple the management of failures from the call chain, freeing the client from the responsibility of handling the failures of the server.

### The elasticity of reactive systems

[Elasticity][37] is about _responsiveness under load_—meaning that the throughput of a system scales up or down (as well as in or out) automatically to meet varying demand as resources are proportionally added or removed. It is the essential element needed to take advantage of the promises of cloud computing: allowing systems to be resource efficient, cost-efficient, environment-friendly and pay-per-use.

Systems need to be adaptive—allow intervention-less auto-scaling, replication of state and behavior, load-balancing of communication, failover, and upgrades, without rewriting or even reconfiguring the system. The enabler for this is _location transparency_: the ability to scale the system in the same way, using the same programming abstractions, with the same semantics, _across all dimensions of scale_—from CPU cores to data centers.

As the Reactive Manifesto [puts it][38]:

> One key insight that simplifies this problem immensely is to realize that we are all doing distributed computing. This is true whether we are running our systems on a single node (with multiple independent CPUs communicating over the QPI link) or on a cluster of nodes (with independent machines communicating over the network). Embracing this fact means that there is no conceptual difference between scaling vertically on multicore or horizontally on the cluster. This decoupling in space [...], enabled through asynchronous message-passing, and decoupling of the runtime instances from their references is what we call Location Transparency.

So no matter where the recipient resides, we communicate with it in the same way. The only way that can be done semantically equivalent is via messaging.

### The productivity of reactive systems

As most systems are inherently complex by nature, one of the most important aspects is to make sure that a system architecture will impose a minimal reduction of productivity, in the development and maintenance of components, while at the same time reducing the operational _accidental complexity_ to a minimum.

This is important since during the lifecycle of a system—if not properly designed—it will become harder and harder to maintain, and require an ever-increasing amount of time and effort to understand, in order to localize and to rectify problems.

Reactive systems are the most _productive_ systems architecture that we know of (in the context of multicore, cloud and mobile architectures):

*   Isolation of failures offer [bulkheads][15] between components, preventing failures to cascade, which limits the scope and severity of failures.
*   Supervisor hierarchies offer multiple levels of defenses paired with self-healing capabilities, which remove a lot of transient failures from ever incurring any operational cost to investigate.
*   Message-passing and location transparency allow for components to be taken offline and replaced or rerouted without affecting the end-user experience, reducing the cost of disruptions, their relative urgency, and also the resources required to diagnose and rectify.
*   Replication reduces the risk of data loss, and lessens the impact of failure on the availability of retrieval and storage of information.
*   Elasticity allows for conservation of resources as usage fluctuates, allowing for minimizing operational costs when load is low, and minimizing the risk of outages or urgent investment into scalability as load increases.

Thus, reactive systems allows for the creation systems that cope well under failure, varying load and change over time—all while offering a low cost of ownership over time.

### How does reactive programming relate to reactive systems?

Reactive programming is a great technique for managing internal logic and dataflow transformation, locally within the components, as a way of optimizing code clarity, performance and resource efficiency. Reactive systems, being a set of architectural principles, puts the emphasis on distributed communication and gives us tools to tackle resilience and elasticity in distributed systems.

One common problem with only leveraging reactive programming is that its tight coupling between computation stages in an event-driven callback-based or declarative program makes _resilience_ harder to achieve as its transformation chains are often ephemeral and its stages—the callbacks or combinators—are anonymous, i.e. not addressable.

This means that they usually handle success or failure directly without signaling it to the outside world. This lack of addressability makes recovery of individual stages harder to achieve as it is typically unclear where exceptions should, or even could, be propagated. As a result, failures are tied to ephemeral client requests instead of to the overall health of the component—if one of the stages in the dataflow chain fails, then the whole chain needs to be restarted, and the client notified. This is in contrast to a message-driven reactive system which has the ability to self-heal, without necessitating notifying the client.

Another contrast to the reactive systems approach is that pure reactive programming allows decoupling in _time_, but not _space_ (unless leveraging message-passing to distribute the dataflow graph under the hood, across the network, as discussed previously). As mentioned, decoupling in time allows for _concurrency_, but it is decoupling in space that allows for _distribution_, and _mobility_—allowing for not only static but also dynamic topologies—which is essential for _elasticity_.

A lack of location transparency makes it hard to scale out a program purely based on reactive programming techniques adaptively in an elastic fashion and therefore requires layering additional tools, such as a message bus, data grid, or bespoke network protocols on top. This is where the message-driven programming of reactive systems shines, since it is a communication abstraction that maintains its programming model and semantics across all dimensions of scale, and therefore reduces system complexity and cognitive overhead.

A commonly cited problem of callback-based programming is that while writing such programs may be comparatively easy, it can have real consequences in the long run.

For example, systems based on anonymous callbacks provide very little insight when you need to reason about them, maintain them, or most importantly figure out what, where, and why production outages and misbehavior occur.

Libraries and platforms designed for reactive systems (such as the [Akka][39] project and the [Erlang][40] platform) have long learned this lesson and are relying on long-lived addressable components that are easier to reason about in the long run. When failures occurs, the component is uniquely identifiable along with the message that caused the failure. With the concept of addressability at the core of the component model, monitoring solutions have a _meaningful_ way to present data that is gathered—leveraging the identities that are propagated.

The choice of a good programming paradigm, one that enforces things like addressability and failure management, has proven to be invaluable in production, as it is designed with the harshness of reality in mind, to _expect and embrace failure_ rather than the lost cause of trying to prevent it.

All in all, reactive programming is a very useful implementation technique, which can be used in a reactive architecture. Remember that it will only help manage one part of the story: dataflow management through asynchronous and nonblocking execution—usually only within a single node or service. Once there are multiple nodes, there is a need to start thinking hard about things like data consistency, cross-node communication, coordination, versioning, orchestration, failure management, separation of concerns and responsibilities etc.—i.e. system architecture.

Therefore, to maximize the value of reactive programming, use it as one of the tools to construct a reactive system. Building a reactive system requires more than abstracting away OS-specific resources and sprinkling asynchronous APIs and [circuit breakers][41] on top of an existing, legacy, software stack. It should be about embracing the fact that you are building a distributed system comprising multiple services—that all need to work together, providing a consistent and responsive experience, not just when things work as expected but also in the face of failure and under unpredictable load.

### Summary

Enterprises and middleware vendors alike are beginning to embrace reactive, with 2016 witnessing a huge growth in corporate interest in adopting reactive. In this article, we have described reactive systems as being the end goal—assuming the context of multicore, cloud and mobile architectures—for enterprises, with reactive programming serving as one of the important tools.

Reactive programming offers productivity for developers—through performance and resource efficiency—at the component level for internal logic and dataflow transformation. Reactive systems offer productivity for architects and DevOps practitioners—through resilience and elasticity—at the system level, for building _cloud native_ and other large-scale distributed systems. We recommend combining the techniques of reactive programming within the design principles of reactive systems.

```
1 According to Conal Elliott, the inventor of FRP, in [this presentation][16][↩][17]
2 [Amdahl’s Law][18] shows that the theoretical speedup of a system is limited by the serial parts, which means that the system can experience diminishing returns as new resources are added. [↩][19]
3 Neil Günter’s [Universal Scalability Law][20] is an essential tool in understanding the effects of contention and coordination in concurrent and distributed systems, and shows that the cost of coherency in a system can lead to negative results, as new resources are added to the system.[↩][21]
4 Messaging can be either synchronous (requiring the sender and receiver to be available at the same time) or asynchronous (allowing them to be decoupled in time). Discussing the semantic differences is out scope for this article.[↩][22]
```
--------------------------------------------------------------------------------

via: https://www.oreilly.com/ideas/reactive-programming-vs-reactive-systems

作者：[Jonas Bonér][a] , [Viktor Klang][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.oreilly.com/people/e0b57-jonas-boner
[b]:https://www.oreilly.com/people/f96106d4-4ce6-41d9-9d2b-d24590598fcd
[1]:https://www.flickr.com/photos/pixel_addict/2301302732
[2]:http://conferences.oreilly.com/oscon/oscon-tx?intcmp=il-prog-confreg-update-ostx17_new_site_oscon_17_austin_right_rail_cta
[3]:https://www.oreilly.com/people/e0b57-jonas-boner
[4]:https://www.oreilly.com/people/f96106d4-4ce6-41d9-9d2b-d24590598fcd
[5]:http://www.oreilly.com/programming/free/why-reactive.csp?intcmp=il-webops-free-product-na_new_site_reactive_programming_vs_reactive_systems_text_cta
[6]:http://conferences.oreilly.com/oscon/oscon-tx?intcmp=il-prog-confreg-update-ostx17_new_site_oscon_17_austin_right_rail_cta
[7]:http://conferences.oreilly.com/oscon/oscon-tx?intcmp=il-prog-confreg-update-ostx17_new_site_oscon_17_austin_right_rail_cta
[8]:https://www.oreilly.com/ideas/reactive-programming-vs-reactive-systems#dfref-footnote-1
[9]:https://www.oreilly.com/ideas/reactive-programming-vs-reactive-systems#dfref-footnote-2
[10]:https://en.wikipedia.org/wiki/Futures_and_promises
[11]:http://reactive-streams.org/
[12]:https://en.wikipedia.org/wiki/Oz_(programming_language)#Dataflow_variables_and_declarative_concurrency
[13]:https://www.oreilly.com/ideas/reactive-programming-vs-reactive-systems#dfref-footnote-3
[14]:https://www.oreilly.com/ideas/reactive-programming-vs-reactive-systems#dfref-footnote-4
[15]:http://skife.org/architecture/fault-tolerance/2009/12/31/bulkheads.html
[16]:https://begriffs.com/posts/2015-07-22-essence-of-frp.html
[17]:https://www.oreilly.com/ideas/reactive-programming-vs-reactive-systems#ref-footnote-1
[18]:https://en.wikipedia.org/wiki/Amdahl%2527s_law
[19]:https://www.oreilly.com/ideas/reactive-programming-vs-reactive-systems#ref-footnote-2
[20]:http://www.perfdynamics.com/Manifesto/USLscalability.html
[21]:https://www.oreilly.com/ideas/reactive-programming-vs-reactive-systems#ref-footnote-3
[22]:https://www.oreilly.com/ideas/reactive-programming-vs-reactive-systems#ref-footnote-4
[23]:http://www.reactivemanifesto.org/
[24]:http://conal.net/papers/icfp97/
[25]:http://www.reactivemanifesto.org/glossary#Asynchronous
[26]:http://www.reactivemanifesto.org/glossary#Non-Blocking
[27]:https://en.wikipedia.org/wiki/Dataflow_programming
[28]:http://www.reactivemanifesto.org/glossary#Back-Pressure
[29]:http://www.reactivemanifesto.org/glossary#Message-Driven
[30]:http://www.reactivemanifesto.org/glossary#Message-Driven
[31]:https://christophermeiklejohn.com/pl/2016/04/12/rpc.html
[32]:https://queue.acm.org/detail.cfm?id=1142044
[33]:https://cs.brown.edu/courses/cs227/archives/2012/papers/weaker/cidr07p15.pdf
[34]:http://www.hpl.hp.com/techreports/tandem/TR-86.2.pdf
[35]:http://erlang.org/download/armstrong_thesis_2003.pdf
[36]:http://www.reactivemanifesto.org/glossary#Isolation
[37]:http://www.reactivemanifesto.org/glossary#Elasticity
[38]:http://www.reactivemanifesto.org/glossary#Location-Transparency
[39]:http://akka.io/
[40]:https://www.erlang.org/
[41]:http://martinfowler.com/bliki/CircuitBreaker.html
