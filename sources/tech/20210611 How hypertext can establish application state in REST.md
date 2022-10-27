[#]: subject: (How hypertext can establish application state in REST)
[#]: via: (https://opensource.com/article/21/6/hateoas)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How hypertext can establish application state in REST
======
The Hypertext As The Engine Of Application State architectural style
supports non-brittle, resilient systems that enable risk-free changes.
![diagram of planning a cloud][1]

HATEOAS is a difficult-to-pronounce acronym that stands for "[Hypertext As The Engine Of Application State][2]." Invented by [Roy Fielding][3] in the year 2000, HATEOAS was proposed as an architectural style for network-based software systems.

The central concept of this architectural style is [hypertext][4]. With hypertext, we have encoded content that may also imply action. Each action, in turn, implies a change of state. HATEOAS represents the mechanism that can be used to control the transition from one application state to another application state. Its name contains the word Engine, based on the assumption that hypertext could drive the transitions from state to state.

### Why HATEOAS?

There are several reasons why HATEOAS may be a desirable architectural style. Two main reasons are:

  1. Late binding
  2. Uniform interface



#### 1\. Late binding

Brittle systems are invariably a sign of shoddy engineering. When we discover a brittle system, usually we learn that its constituent components and subsystems are tightly coupled (almost welded together). That tight coupling creates a lot of friction that produces a lot of "heat." No wonder such brittle systems are notorious for defective behavior, which is often perceived as malfunctioning. And those defects are typically very hard to troubleshoot and fix.

But what causes tight coupling? In most cases, it is early binding. We sometimes refer to early binding as premature optimization (which, as the saying goes, is the root of all evil). So, to avoid designing and building brittle systems, we ought to avoid tight coupling, which in practical terms means we should avoid early binding or premature optimization.

HATEOAS is a prime example of the extreme late-binding design style. Systems built with HATEOAS style are completely decoupled and not prematurely optimized, which gives them the flexibility to be changed safely at a drop of a hat.

#### 2\. Uniform interface

Interfaces between the client and the server act as a unifying agent that obfuscates the need for a client to assume or understand the resource structure. A uniform interface relieves clients from having to understand anything about the servers.

Also, a uniform interface fully separates identification from interaction. In a uniform interface, a resource that is implemented on the backend is identified by a unique resource identifier (URI). A client interested in the services rendered by the back-end resource only needs to know the starting endpoint (the home URI). A client need not know any details about how to interact with the resource.

As is also the case with late binding, a uniform interface provides resilient, non-brittle solutions. A system built with HATEOAS style retains the freedom to radically revamp its structure without disturbing its clients in the least.

### In-band and out-of-band information

Another important concept related to HATEOAS is in-band vs. out-of-band access to information. If a caller (e.g., a client) needs to manipulate a resource (e.g., a server), the client's intention must somehow be translated into the implementation. If the client knows WHAT they want to do or accomplish, their next concern becomes: HOW to do it.

There are two ways that this knowledge of how to do something could be implemented:

  * Client needs to go out of their way to obtain the how-to information (out-of-band)
  * Client is given the how-to information by the resource (in-band) following the just-in-time communications model



Because HATEOAS is a late-bound, uniform-interface style of design, it serves the how-to information in-band. This means a calling client need not learn any details of how to interact with the resource before initiating the interaction.

In contrast, a traditional remote procedure call (RPC) design hinges on the out-of-band arrangement—a calling client must obtain details needed to interact with the server before initiating the interaction. In other words, it is not sufficient for the calling client to know how to begin the interaction with the server; the client is also expected to know all the necessary details before making precise calls needed for obtaining desired services.

This upfront knowledge that the calling client must possess before making any calls to the server renders the system extremely brittle. Clients and the server are tightly coupled; the server is not at liberty to modify its API at will and must go the extra mile to maintain backward compatibility.

Part of the in-band design philosophy of HATEOAS is self-descriptive messages. Clients do not have to know anything about the server state; a self-descriptive message represents the important points that the client needs to continue interacting with the server.

That arrangement further loosens any possible coupling between the client (the caller) and the server.

### How does HATEOAS work?

There is no difference between how the HTML works and how HATEOAS works. When we browse the web, we start from an entry point—a URL. The first step in web browsing consists of instructing the web browser to send the HTTP GET request to the specified URL.

Upon receiving that HTTP GET request, the back-end resource (the server) replies with an HTTP response. That HTTP response contains both the data and possibly (and most likely) the network operations that can be enacted on that data. These network operations are encoded as hypertext links. If we then click on one of those links, we enact a network operation: the browser sends, on our behalf, another HTTP request (it could be a GET request, or a POST request, etc.).

The salient point in this description of the mundane web-browsing experience is that we, the clients, don't have to know anything in advance about the structure implemented on the server. All we know is the hypertext links that the server sends to us in the form of a resource representation (the HTML document).

Replace a web browser with a computer program, and you get the picture of how HATEOAS works. A client (e.g., a computer program) obtains the entry point of the resource (the endpoint of the API). The client then programmatically sends the HTTP GET request to the resource and receives the HTTP response. In the response, the client will find one or more hypertext links. It is those hypertext links that enable the calling program to make the change in the application state. The client makes that change by sending another HTTP request using the in-band details found in the resource representation—the HTML document.

Step-by-step, the interaction between the client and the server continues in this fashion.

### What are the advantages of HATEOAS?

In addition to the above advantages (a non-brittle, resilient system that invites risk-free changes), HATEOAS enables building systems that are:

  * Performant
  * Scalable
  * Reliable
  * Simple to understand
  * Transparent
  * Portable



These advantages are made possible by the stateless nature of the systems built using the HATEOAS style.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/hateoas

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BIZ_darwincloud_520x292_0311LL.png?itok=74DLgd8Q (diagram of planning a cloud)
[2]: https://en.wikipedia.org/wiki/HATEOAS
[3]: https://en.wikipedia.org/wiki/Roy_Fielding
[4]: https://en.wikipedia.org/wiki/Hypertext
