How the four components of a distributed tracing system work together
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/touch-tracing.jpg?itok=rOmsY-nU)
Ten years ago, essentially the only people thinking hard about distributed tracing were academics and a handful of large internet companies. Today, it’s turned into table stakes for any organization adopting microservices. The rationale is well-established: microservices fail in surprising and often spectacular ways, and distributed tracing is the best way to describe and diagnose those failures.

That said, if you set out to integrate distributed tracing into your own application, you’ll quickly realize that the term “Distributed Tracing” means different things to different people. Furthermore, the tracing ecosystem is crowded with partially-overlapping projects with similar charters. This article describes the four (potentially) independent components in distributed tracing, and how they fit together.

### Distributed tracing: A mental model

Most mental models for tracing descend from [Google’s Dapper paper][1]. [OpenTracing][2] uses similar nouns and verbs, so we will borrow the terms from that project:

![Tracing][3]

  * **Trace:** The description of a transaction as it moves through a distributed system.
  * **Span:** A named, timed operation representing a piece of the workflow. Spans accept key:value tags as well as fine-grained, timestamped, structured logs attached to the particular span instance.
  * **Span context:** Trace information that accompanies the distributed transaction, including when it passes from service to service over the network or through a message bus. The span context contains the trace identifier, span identifier, and any other data that the tracing system needs to propagate to the downstream service.



If you would like to dig into a detailed description of this mental model, please check out the [OpenTracing specification][4].

### The four big pieces

From the perspective of an application-layer distributed tracing system, a modern software system looks like the following diagram:

![Tracing][5]

The components in a modern software system can be broken down into three categories:

  * **Application and business logic:** Your code.
  * **Widely shared libraries:** Other people's code.
  * **Widely shared services:** Other people’s infrastructure.



These three components have different requirements and drive the design of the Distributed Tracing systems which is tasked with monitoring the application. The resulting design yields four important pieces:

  * **A tracing instrumentation API:** What decorates application code.
  * **Wire protocol:** What gets sent alongside application data in RPC requests.
  * **Data protocol:** What gets sent asynchronously (out-of-band) to your analysis system.
  * **Analysis system:** A database and interactive UI for working with the trace data.



To explain this further, we’ll dig into the details which drive this design. If you just want my suggestions, please skip to the four big solutions at the bottom.

### Requirements, details, and explanations

Application code, shared libraries, and shared services have notable operational differences, which heavily influence the requirements for instrumenting them.

#### Instrumenting application code and business logic

In any particular microservice, the bulk of the code written by the microservice developer is the application or business logic. This is the code that defines domain-specific operations; typically, it contains whatever special, unique logic justified the creation of a new microservice in the first place. Almost by definition, **this code is usually not shared or otherwise present in more than one service.**

That said, you still need to understand it, and that means it needs to be instrumented somehow. Some monitoring and tracing analysis systems auto-instrument code using black-box agents, and others expect explicit "white-box" instrumentation. For the latter, abstract tracing APIs offer many practical advantages for microservice-specific application code:

  * An abstract API allows you to swap in new monitoring tools without re-writing instrumentation code. You may want to change cloud providers, vendors, and monitoring technologies, and a huge pile of non-portable instrumentation code would add meaningful overhead and friction to that procedure.
  * It turns out there are other interesting uses for instrumentation, beyond production monitoring. There are existing projects that use this same tracing instrumentation to power testing tools, distributed debuggers, “chaos engineering” fault injectors, and other meta-applications.
  * But most importantly, what if you wanted to extract an application component into a shared library? That leads us to:



#### Instrumenting shared libraries

The utility code present in most applications—code that handles network requests, database calls, disk writes, threading, queueing, concurrency management, and so on—is often generic and not specific to any particular application. This code is packaged up into libraries and frameworks which are then installed in many microservices, and deployed into many different environments.

This is the real difference: with shared code, someone else is the user. Most users have different dependencies and operational styles. If you attempt to instrument this shared code, you will note a couple of common issues:

  * You need an API to write instrumentation. However, your library does not know what analysis system is being used. There are many choices, and all the libraries running in the same application cannot make incompatible choices.
  * The task of injecting and extracting span contexts from request headers often falls on RPC libraries, since those packages encapsulate all network-handling code. However, a shared library cannot not know which tracing protocol is being used by each application.
  * Finally, you don’t want to force conflicting dependencies on your user. Most users have different dependencies and operational styles. Even if they use gRPC, will it be the same version of gRPC you are binding to? So any monitoring API your library brings in for tracing must be free of dependencies.



**So, an abstract API which (a) has no dependencies, (b) is wire protocol agnostic, and (c) works with popular vendors and analysis systems should be a requirement for instrumenting shared library code.**

#### Instrumenting shared services

Finally, sometimes entire services—or sets of microservices—are general-purpose enough that they are used by many independent applications. These shared services are often hosted and managed by third parties. Examples might be cache servers, message queues, and databases.

It’s important to understand that **shared services are essentially "black boxes" from the perspective of application developers.** It is not possible to inject your application’s monitoring solution into a shared service. Instead, the hosted service often runs its own monitoring solution.

### **The four big solutions**

So, an abstracted tracing API would help libraries emit data and inject/extract Span Context. A standard wire protocol would help black-box services interconnect, and a standard data format would help separate analysis systems consolidate their data. Let's have a look at some promising options for solving these problems.

#### Tracing API: The OpenTracing project

#### As shown above, in order to instrument application code, a tracing API is required. And in order to extend that instrumentation to shared libraries, where most of the Span Context injection and extraction occurs, the API must be abstracted in certain critical ways.

The [OpenTracing][2] project aims to solve this problem for library developers. OpenTracing is a vendor-neutral tracing API which comes with no dependencies, and is quickly gaining support from a large number of monitoring systems. This means that, increasingly, if libraries ship with native OpenTracing instrumentation baked in, tracing will automatically be enabled when a monitoring system connects at application startup.

Personally, as someone who has been writing, shipping, and operating open source software for over a decade, it is profoundly satisfying to work on the OpenTracing project and finally scratch this observability itch.

In addition to the API, the OpenTracing project maintains a growing list of contributed instrumentation, some of which can be found [here][6]. If you would like to get involved, either by contributing an instrumentation plugin, natively instrumenting your own OSS libraries, or just want to ask a question, please find us on [Gitter][7] and say hi.

#### Wire Protocol: The trace-context HTTP headers

In order for monitoring systems to interoperate, and to mitigate migration issues when changing from one monitoring system to another, a standard wire protocol is needed for propagating Span Context.

The [w3c Distributed Trace Context Community Group][8] is hard at work defining this standard. Currently, the focus is on defining a set of standard HTTP headers. The latest draft of the specification can be found [here][9]. If you have questions for this group, the [mailing list][10] and [Gitter chatroom][11] are great places to go for answers.

#### Data protocol (Doesn't exist yet!!)

For black-box services, where it is not possible to install a tracer or otherwise interact with the program, a data protocol is needed to export data from the system.

Work on this data format and protocol is currently at an early stage, and mostly happening within the context of the w3c Distributed Trace Context Working Group. There is particular interest is in defining higher-level concepts, such as RPC calls, database statements, etc, in a standard data schema. This would allow tracing systems to make assumptions about what kind of data would be available. The OpenTracing project is also working on this issue, by starting to define a [standard set of tags][12]. The plan is for these two efforts to dovetail with each other.

Note that there is a middle ground available at the moment. For “network appliances” that the application developer operates, but does not want to compile or otherwise perform code modifications to, dynamic linking can help. The primary examples of this are service meshes and proxies, such as Envoy or NGINX. For this situation, an OpenTracing-compliant tracer can be compiled as a shared object, and then dynamically linked into the executable at runtime. This option is currently provided by the [C++ OpenTracing API][13]. For Java, an OpenTracing [Tracer Resolver][14] is also under development.

These solutions work well for services that support dynamic linking, and are deployed by the application developer. But in the long run, a standard data protocol may solve this problem more broadly.

#### Analysis system: A service for extracting insights from trace data

Last but not least, there is now a cornucopia of tracing and monitoring solutions. A list of monitoring systems known to be compatible with OpenTracing can be found [here][15], but there are many more options out there. I would encourage you to research your options, and I hope you find the framework provided in this article to be useful when comparing options. In addition to rating monitoring systems based on their operational characteristics (not to mention whether you like the UI and features), make sure you think about the three big pieces above, their relative importance to you, and how the tracing system you are interested in provides a solution to them.

### Conclusion

In the end, how important each piece is depends heavily on who you are and what kind of system you are building. For example, open source library authors are very interested in the OpenTracing API, while service developers tend to be more interested in the Trace-Context specification. When someone says one piece is more important than the other, they usually mean “one piece is more important to me than the other."

However, the reality is this: Distributed Tracing has become a necessity for monitoring modern systems. In designing the building blocks for these systems, the age-old approach—"decouple where you can"—still holds true. Cleanly decoupled components are the best way to maintain flexibility and forwards-compatibility when building a system as cross-cutting as a distributed monitoring system.

Thanks for reading! Hopefully, now when you're ready to implement tracing in your own application, you have a guide to understanding which pieces they are talking about, and how they fit together.

Want to learn more? Sign up to attend [KubeCon EU][16] in May or [KubeCon North America][17] in December.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/distributed-tracing

作者：[Ted Young][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/tedsuo
[1]:https://research.google.com/pubs/pub36356.html
[2]:http://opentracing.io/
[3]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/uploads/tracing1_0.png?itok=dvDTX0JJ (Tracing)
[4]:https://github.com/opentracing/specification/blob/master/specification.md
[5]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/uploads/tracing2_0.png?itok=yokjNLZk (Tracing)
[6]:https://github.com/opentracing-contrib/
[7]:https://gitter.im/opentracing/public
[8]:https://www.w3.org/community/trace-context/
[9]:https://w3c.github.io/distributed-tracing/report-trace-context.html
[10]:http://lists.w3.org/Archives/Public/public-trace-context/
[11]:https://gitter.im/TraceContext/Lobby
[12]:https://github.com/opentracing/specification/blob/master/semantic_conventions.md
[13]:https://github.com/opentracing/opentracing-cpp
[14]:https://github.com/opentracing-contrib/java-tracerresolver
[15]:http://opentracing.io/documentation/pages/supported-tracers
[16]:https://events.linuxfoundation.org/kubecon-eu-2018/
[17]:https://events.linuxfoundation.org/events/kubecon-cloudnativecon-north-america-2018/
