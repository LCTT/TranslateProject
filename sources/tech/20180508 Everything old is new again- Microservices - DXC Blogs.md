Translating by qhwdw
Everything old is new again: Microservices – DXC Blogs
======
![](https://csccommunity.files.wordpress.com/2018/05/old-building-with-modern-addition.jpg?w=610)

If I told you about a software architecture in which components of an application provided services to other components via a communications protocol over a network you would say it was…

Well, it depends. If you got your start programming in the 90s, you’d say I just defined a [Service-Oriented Architecture (SOA)][1]. But, if you’re younger and cut your developer teeth on the cloud, you’d say: “Oh, you’re talking about [microservices][2].”

You’d both be right. To really understand the differences, you need to dive deeper into these architectures.

In SOA, a service is a function, which is well-defined, self-contained, and doesn’t depend on the context or state of other services. There are two kinds of services. A service consumer, which requests a service from the other type, a service provider. An SOA service can play both roles.

SOA services can trade data with each other. Two or more services can also coordinate with each other. These services carry out basic jobs such as creating a user account, providing login functionality, or validating a payment.

SOA isn’t so much about modularizing an application as it is about composing an application by integrating distributed, separately-maintained and deployed components. These components run on servers.

Early versions of SOA used object-oriented protocols to communicate with each other. For example, Microsoft’s [Distributed Component Object Model (DCOM)][3] and [Object Request Brokers (ORBs)][4] use the [Common Object Request Broker Architecture (CORBA)][5] specification.

Later versions used messaging services such as [Java Message Service (JMS)][6] or [Advanced Message Queuing Protocol (AMQP)][7]. These service connections are called Enterprise Service Buses (ESB). Over these buses, data, almost always in eXtensible Markup Language (XML) format, is transmitted and received.

[Microservices][2] is an architectural style where applications are made up from loosely coupled services or modules. It lends itself to the Continuous Integration/Continuous Deployment (CI/CD) model of developing large, complex applications. An application is the sum of its modules.

Each microservice provides an application programming interface (API) endpoint. These are connected by lightweight protocols such as [REpresentational State Transfer (REST)][8], or [gRPC][9]. Data tends to be represented by [JavaScript Object Notation (JSON)][10] or [Protobuf][11].

Both architectures stand as an alternative to the older, monolithic style of architecture where applications are built as single, autonomous units. For example, in a client-server model, a typical Linux, Apache, MySQL, PHP/Python/Perl (LAMP) server-side application would deal with HTTP requests, run sub-programs and retrieves/updates from the underlying MySQL database. These are all tied closely together. When you change anything, you must build and deploy a new version.

With SOA, you may need to change several components, but never the entire application. With microservices, though, you can make changes one service at a time. With microservices, you’re working with a true decoupled architecture.

Microservices are also lighter than SOA. While SOA services are deployed to servers and virtual machines (VMs), microservices are deployed in containers. The protocols are also lighter. This makes microservices more flexible than SOA. Hence, it works better with Agile shops.

So what does this mean? The long and short of it is that microservices are an SOA variation for container and cloud computing.

Old style SOA isn’t going away, but as we continue to move applications to containers, the microservice architecture will only grow more popular.


--------------------------------------------------------------------------------

via: https://blogs.dxc.technology/2018/05/08/everything-old-is-new-again-microservices/

作者：[Cloudy Weather][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blogs.dxc.technology/author/steven-vaughan-nichols/
[1]:https://www.service-architecture.com/articles/web-services/service-oriented_architecture_soa_definition.html
[2]:http://microservices.io/
[3]:https://technet.microsoft.com/en-us/library/cc958799.aspx
[4]:https://searchmicroservices.techtarget.com/definition/Object-Request-Broker-ORB
[5]:http://www.corba.org/
[6]:https://docs.oracle.com/javaee/6/tutorial/doc/bncdq.html
[7]:https://www.amqp.org/
[8]:https://www.service-architecture.com/articles/web-services/representational_state_transfer_rest.html
[9]:https://grpc.io/
[10]:https://www.json.org/
[11]:https://github.com/google/protobuf/
