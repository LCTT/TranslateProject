Microservices Explained
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/cloud-microservices.jpg?itok=GpoWiDeG)
Microservices is not a new term. Like containers, the concept been around for a while, but it’s become a buzzword recently as many companies embark on their cloud native journey. But, what exactly does the term microservices mean? Who should care about it? In this article, we’ll take a deep dive into the microservices architecture.

### Evolution of microservices

Patrick Chanezon, Chief Developer Advocate for Docker provided a brief history lesson during our conversation: In the late 1990s, developers started to structure their applications into monoliths where massive apps hadall features and functionalities baked into them. Monoliths were easy to write and manage. Companies could have a team of developers who built their applications based on customer feedback through sales and marketing teams. The entire developer team would work together to build tightly glued pieces as an app that can be run on their own app servers. It was a popular way of writing and delivering web applications.

There is a flip side to the monolithic coin. Monoliths slow everything and everyone down. It’s not easy to update one service or feature of the application. The entire app needs to be updated and a new version released. It takes time. There is a direct impact on businesses. Organizations could not respond quickly to keep up with new trends and changing market dynamics. Additionally, scalability was challenging.

Around 2011, SOA (Service Oriented Architecture) became popular where developers could cram multi-tier web applications as software services inside a VM (virtual machine). It did allow them to add or update services independent of each other. However, scalability still remained a problem.

“The scale out strategy then was to deploy multiple copies of the virtual machine behind a load balancer. The problems with this model are several. Your services can not scale or be upgraded independently as the VM is your lowest granularity for scale. VMs are bulky as they carry extra weight of an operating system, so you need to be careful about simply deploying multiple copies of VMs for scaling,” said Madhura Maskasky, co-founder and VP of Product at Platform9.

Some five years ago when Docker hit the scene and containers became popular, SOA faded out in favor of “microservices” architecture. “Containers and microservices fix a lot of these problems. Containers enable deployment of microservices that are focused and independent, as containers are lightweight. The Microservices paradigm, combined with a powerful framework with native support for the paradigm, enables easy deployment of independent services as one or more containers as well as easy scale out and upgrade of these,” said Maskasky.

### What’s are microservices?

Basically, a microservice architecture is a way of structuring applications. With the rise of containers, people have started to break monoliths into microservices. “The idea is that you are building your application as a set of loosely coupled services that can be updated and scaled separately under the container infrastructure,” said Chanezon.

“Microservices seem to have evolved from the more strictly defined service-oriented architecture (SOA), which in turn can be seen as an expression object oriented programming concepts for networked applications. Some would call it just a rebranding of SOA, but the term “microservices” often implies the use of even smaller functional components than SOA, RESTful APIs exchanging JSON, lighter-weight servers (often containerized, and modern web technologies and protocols,” said Troy Topnik, SUSE Senior Product Manager, Cloud Application Platform.

Microservices provides a way to scale development and delivery of large, complex applications by breaking them down that allows the individual components to evolve independently from each other.

“Microservices architecture brings more flexibility through the independence of services, enabling organizations to become more agile in how they deliver new business capabilities or respond to changing market conditions. Microservices allows for using the ‘right tool for the right task’, meaning that apps can be developed and delivered by the technology that will be best for the task, rather than being locked into a single technology, runtime or framework,” said Christian Posta, senior principal application platform specialist, Red Hat.

### Who consumes microservices?

“The main consumers of microservices architecture patterns are developers and application architects,” said Topnik. As far as admins and DevOps engineers are concerned their role is to build and maintain the infrastructure and processes that support microservices.

“Developers have been building their applications traditionally using various design patterns for efficient scale out, high availability and lifecycle management of their applications. Microservices done along with the right orchestration framework help simplify their lives by providing a lot of these features out of the box. A well-designed application built using microservices will showcase its benefits to the customers by being easy to scale, upgrade, debug, but without exposing the end customer to complex details of the microservices architecture,” said Maskasky.

### Who needs microservices?

Everyone. Microservices is the modern approach to writing and deploying applications more efficiently. If an organization cares about being able to write and deploy its services at a faster rate they should care about it. If you want to stay ahead of your competitors, microservices is the fastest route. Security is another major benefit of the microservices architecture, as this approach allows developers to keep up with security and bug fixes, without having to worry about downtime.

“Application developers have always known that they should build their applications in a modular and flexible way, but now that enough of them are actually doing this, those that don’t risk being left behind by their competitors,” said Topnik.

If you are building a new application, you should design it as microservices. You never have to hold up a release if one team is late. New functionalities are available when they're ready, and the overall system never breaks.

“We see customers using this as an opportunity to also fix other problems around their application deployment -- such as end-to-end security, better observability, deployment and upgrade issues,” said Maskasky.

Failing to do so means you would be stuck in the traditional stack, which means microservices won’t be able to add any value to it. If you are building new applications, microservices is the way to go.

Learn more about cloud-native at [KubeCon + CloudNativeCon Europe][1], coming up May 2-4 in Copenhagen, Denmark.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/4/microservices-explained

作者：[SWAPNIL BHARTIYA][a]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://events.linuxfoundation.org/events/kubecon-cloudnativecon-europe-2018/attend/register/
