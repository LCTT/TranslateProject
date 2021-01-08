[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 serverless strategies to look for in 2021)
[#]: via: (https://opensource.com/article/21/1/devapps-strategies)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)

3 serverless strategies to look for in 2021
======
These serverless applications development and deployment approaches are
driving fast-adoption of the DevApps practice today.
![Tips and gears turning][1]

If you had at least one chance to attend business and technologies conferences recently, you probably saw lots of DevOps strategies, Agilist, and DevSecOps engineers around the digital transformation track. No matter what business you work in, it’s no secret that [DevOps][2] is a big trigger to craft new companies. It is also used to optimize existing resources, from the IT infrastructure to workflow processes and cultural changes.

While I was moderating several tracks (i.e., serverless) at [KubeCon + CloudNativeCon North America 2020][3], I had a chance to catch a very interesting trend around DevOps.The trend was more interest in cloud-native application development than deployment and provisioning with certain cloud platforms on [Kubernetes][4]. Kubernetes was unleashed upon the world back in 2014. Since then, IT ops organizations have benefited from orchestrating immutable application runtimes with service invocation and discovery, autoscaling, and resilience by using Kubernetes. In the meantime, application workloads also need to move forward to serverless functions and event-driven reactive services, along with the DevOps platform, which is a key ability to manage multi and hybrid cloud infrastructure.

In this article, I will talk about _DevApps_ more than _DevOps_ since the applications are critical to accelerate your business success, along with matured DevOps tools and technologies. The following three serverless applications development and deployment approaches are driving fast-adoption of the DevApps practice today.

### Serverless functions

The COVID-19 pandemic triggered enterprises to run business services on the managed platform. Also, developers began transforming existing microservices into [serverless][5] functions. [Cloud-Native Serverless Landscape][6] can be the first step for developers to create deployable functions across managed cloud platforms. More importantly, it’s not easy to develop traditional microservices and serverless functions on the same application runtime along the container-native way. For 10+ million Java developers worldwide, [Quarkus][7] enables them to address this complex issue without a steep learning curve for both imperative and serverless applications.

### Serverless events

Event-driven services are growing because they increase flexibility and agility. They also reduce dependencies and complexity in application development. Serverless events enable developers to maximize these benefits when they implement event publishers and exchange data across serverless platforms. [Knative Eventing][8] is built on [CloudEvents][9] to allow developers to write serverless events with late-binding features such as event creation, event sinks, and event consumption.

### Serverless workflows

With the rise in popularity to adopt [the DevOps pipeline][10], workflows definition is also becoming a key role in serverless events coordination. This is because serverless functions are also increasingly complex and composed of multiple tasks in a single event. To specify complex business workflows with serverless workloads, [Serverless Workflow][11] allows developers to define the workflow models with a vendor-neutral specification for orchestrating serverless events. The Serverless Workflow specification is an initiative project by CNCF.

### What’s next for DevApps developers?

With many different cloud-native Java frameworks in place, Quarkus gives developers more benefits from container-first design to live coding for inner loop development, imperative and reactive programming, and more Kubernetes-native pre-integration. More practical and useful guides about Quarkus are [here][12].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/devapps-strategies

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png?itok=HcN38NOk (Tips and gears turning)
[2]: https://opensource.com/resources/devops
[3]: https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwiOm66eppHtAhUCoLMKHdbDBtYYABAAGgJxbg&ae=2&ohost=www.google.com&cid=CAASE-RoewbFs9aqDAPBTaiW7zxvM74&sig=AOD64_0D6rO4CljYUjuM8RWT5cUNp_C8cg&q&adurl&ved=2ahUKEwjwtaaeppHtAhXBmeAKHbsfAtUQ0Qx6BAgJEAE
[4]: https://opensource.com/article/19/6/reasons-kubernetes
[5]: https://opensource.com/article/19/4/enabling-serverless-kubernetes
[6]: https://landscape.cncf.io/format=serverless
[7]: https://opensource.com/article/20/4/java-quarkus-vs-code
[8]: https://knative.dev/docs/eventing/
[9]: https://cloudevents.io/
[10]: https://opensource.com/article/19/4/devops-pipeline-acceptance-testing
[11]: https://github.com/serverlessworkflow
[12]: https://quarkus.io/guides/
