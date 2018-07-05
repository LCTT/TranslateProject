Translating by qhwdw
Mesos and Kubernetes: It's Not a Competition
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/architecture-barge-bay-161764_0.jpg?itok=vNChG5fb)

The roots of Mesos can be traced back to 2009 when Ben Hindman was a PhD student at the University of California, Berkeley working on parallel programming. They were doing massive parallel computations on 128-core chips, trying to solve multiple problems such as making software and libraries run more efficiently on those chips. He started talking with fellow students so see if they could borrow ideas from parallel processing and multiple threads and apply them to cluster management.

“Initially, our focus was on Big Data,” said Hindman. Back then, Big Data was really hot and Hadoop was one of the hottest technologies. “We recognized that the way people were running things like Hadoop on clusters was similar to the way that people were running multiple threaded applications and parallel applications,” said Hindman.

However, it was not very efficient, so they started thinking how it could be done better through cluster management and resource management. “We looked at many different technologies at that time,” Hindman recalled.

Hindman and his colleagues, however, decided to adopt a novel approach. “We decided to create a lower level of abstraction for resource management, and run other services on top to that to do scheduling and other things,” said Hindman, “That’s essentially the essence of Mesos -- to separate out the resource management part from the scheduling part.”

It worked, and Mesos has been going strong ever since.

### The project goes to Apache

The project was founded in 2009. In 2010 the team decided to donate the project to the Apache Software Foundation (ASF). It was incubated at Apache and in 2013, it became a Top-Level Project (TLP).

There were many reasons why the Mesos community chose Apache Software Foundation, such as the permissiveness of Apache licensing, and the fact that they already had a vibrant community of other such projects.

It was also about influence. A lot of people working on Mesos were also involved with Apache, and many people were working on projects like Hadoop. At the same time, many folks from the Mesos community were working on other Big Data projects like Spark. This cross-pollination led all three projects -- Hadoop, Mesos, and Spark -- to become ASF projects.

It was also about commerce. Many companies were interested in Mesos, and the developers wanted it to be maintained by a neutral body instead of being a privately owned project.

### Who is using Mesos?

A better question would be, who isn’t? Everyone from Apple to Netflix is using Mesos. However, Mesos had its share of challenges that any technology faces in its early days. “Initially, I had to convince people that there was this new technology called ‘containers’ that could be interesting as there is no need to use virtual machines,” said Hindman.

The industry has changed a great deal since then, and now every conversation around infrastructure starts with ‘containers’ -- thanks to the work done by Docker. Today convincing is not needed, but even in the early days of Mesos, companies like Apple, Netflix, and PayPal saw the potential. They knew they could take advantage of containerization technologies in lieu of virtual machines. “These companies understood the value of containers before it became a phenomenon,” said Hindman.

These companies saw that they could have a bunch of containers, instead of virtual machines. All they needed was something to manage and run these containers, and they embraced Mesos. Some of the early users of Mesos included Apple, Netflix, PayPal, Yelp, OpenTable, and Groupon.

“Most of these organizations are using Mesos for just running arbitrary services,” said Hindman, “But there are many that are using it for doing interesting things with data processing, streaming data, analytics workloads and applications.”

One of the reasons these companies adopted Mesos was the clear separation between the resource management layers. Mesos offers the flexibility that companies need when dealing with containerization.

“One of the things we tried to do with Mesos was to create a layering so that people could take advantage of our layer, but also build whatever they wanted to on top,” said Hindman. “I think that's worked really well for the big organizations like Netflix and Apple.”

However, not every company is a tech company; not every company has or should have this expertise. To help those organizations, Hindman co-founded Mesosphere to offer services and solutions around Mesos. “We ultimately decided to build DC/OS for those organizations which didn’t have the technical expertise or didn't want to spend their time building something like that on top.”

### Mesos vs. Kubernetes?

People often think in terms of x versus y, but it’s not always a question of one technology versus another. Most technologies overlap in some areas, and they can also be complementary. “I don't tend to see all these things as competition. I think some of them actually can work in complementary ways with one another,” said Hindman.

“In fact the name Mesos stands for ‘middle’; it’s kind of a middle OS,” said Hindman, “We have the notion of a container scheduler that can be run on top of something like Mesos. When Kubernetes first came out, we actually embraced it in the Mesos ecosystem and saw it as another way of running containers in DC/OS on top of Mesos.”

Mesos also resurrected a project called [Marathon][1](a container orchestrator for Mesos and DC/OS), which they have made a first-class citizen in the Mesos ecosystem. However, Marathon does not really compare with Kubernetes. “Kubernetes does a lot more than what Marathon does, so you can’t swap them with each other,” said Hindman, “At the same time, we have done many things in Mesos that are not in Kubernetes. So, these technologies are complementary to each other.”

Instead of viewing such technologies as adversarial, they should be seen as beneficial to the industry. It’s not duplication of technologies; it’s diversity. According to Hindman, “it could be confusing for the end user in the open source space because it's hard to know which technologies are suitable for what kind of workload, but that’s the nature of the beast called Open Source.”

That just means there are more choices, and everybody wins.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/6/mesos-and-kubernetes-its-not-competition

作者：[Swapnil Bhartiya][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://mesosphere.github.io/marathon/
