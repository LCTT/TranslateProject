Performance made easy with Linux containers
============================================================

 ![Performance made easy with Linux containers](https://opensource.com/sites/default/files/styles/image-full-size/public/containers_scale_performance.jpg?itok=A9RwUOXA "Performance made easy with Linux containers") 
Image credits : CC0 Public Domain

Performance for an application determines how quickly your software can complete the intended task. It answers questions about the application, such as:

*   Response time under peak load
*   Ease of use, supported functionality, and use cases compared to an alternative
*   Operational costs (CPU usage, memory needs, data throughput, bandwidth, etc.)

The value of this performance analysis extends beyond the estimation of the compute resources needed to serve the load or the number of application instances needed to meet the peak demand. Performance is clearly tied to the fundamentals of a successful business. It informs the overall user experience, including identifying what slows down customer-expected response times, improving customer stickiness by designing content delivery optimized to their bandwidth, choosing the best device, and ultimately helping enterprises grow their business.

### The problem

Of course, this is an oversimplification of the value of performance engineering for business services. To understand the challenges behind accomplishing what I've just described, let's make this real and just a little bit complicated.

 ![Cloud scale performance](https://opensource.com/sites/default/files/cloud_scale_performance.jpg "Cloud scale performance") 

Real-world applications are likely hosted on the cloud. An application could avail to very large (or conceptually infinite) amounts of compute resources. Its needs in terms of both hardware and software would be met via the cloud. The developers working on it would use the cloud-offered features for enabling faster coding and deployment. Cloud hosting doesn't come free, but the cost overhead is proportional to the resource needs of the application.

Outside of Search as a Service (SaaS), Platform as a Service (PaaS), Infrastructure as a Service (IaaS), and Load Balancing as a Service (LBaaS), which is when the cloud takes care of traffic management for this hosted app, a developer probably may also use one or more of these fast-growing cloud services:

*   Security as a Service (SECaaS), which meets security needs for software and the user
*   Data as a Service (DaaS), which provides a user's data on demand for application
*   Logging as a Service (LaaS), DaaS's close cousin, which provides analytic metrics on delivery and usage of logs
*   Search as a Service (SaaS), which is for the analytics and big data needs of the app
*   Network as a Service (NaaS), which is for sending and receiving data across public networks

Cloud-powered services are also growing exponentially because they make writing complex apps easier for developers. In addition to the software complexity, the interplay of all these distributed components becomes more involved. The user base becomes more diverse. The list of requirements for the software becomes longer. The dependencies on other services becomes larger. Because of these factors, the flaws in this ecosystem can trigger a domino effect of performance problems.

For example, assume you have a well-written application that follows secure coding practices, is designed to meet varying load requirements, and is thoroughly tested. Assume also that you have the infrastructure and analytics work in tandem to support the basic performance requirements. What does it take to build performance standards into the implementation, design, and architecture of your system? How can the software keep up with evolving market needs and emerging technologies? How do you measure the key parameters to tune a system for optimal performance as it ages? How can the system be made resilient and self-recovering? How can you identify any underlying performance problems faster and resolved them sooner?

### Enter containers

Software [containers][2] backed with the merits of [microservices][3] design, or Service-oriented Architecture (SoA), improves performance because a system comprising of smaller, self-sufficient code blocks is easier to code and has cleaner, well-defined dependencies on other system components. It is easier to test and problems, including those around resource utilization and memory over-consumption, are more easily identified than in a giant monolithic architecture.

When scaling the system to serve increased load, the containerized applications replicate fast and easy. Security flaws are better isolated. Patches can be versioned independently and deployed fast. Performance monitoring is more targeted and the measurements are more reliable. You can also rewrite and "facelift" resource-intensive code pieces to meet evolving performance requirements.

Containers start fast and stop fast. They enable efficient resource utilization and far better process isolation than Virtual Machines (VMs). Containers do not have idle memory and CPU overhead. They allow for multiple applications to share a machine without the loss of data or performance. Containers make applications portable, so developers can build and ship apps to any server running Linux that has support for container technology, without worrying about performance penalties. Containers live within their means and abide by the quotas (examples include storage, compute, and object count quotas) as imposed by their cluster manager, such as Cloud Foundry's Diego, [Kubernetes][4], Apache Mesos, and Docker Swarm.

While containers show merit in performance, the coming wave of "serverless" computing, also known as Function as a Service (FaaS), is set to extend the benefits of containers. In the FaaS era, these ephemeral or short-lived containers will drive the benefits beyond application performance and translate directly to savings in overhead costs of hosting in the cloud. If the container does its job faster, then it lives for a shorter time, and the computation overload is purely on demand.

--------------------------------------------------------------------------------

作者简介：

Garima is a Engineering Manager at Red Hat focussed on OpenShift Container Platform. Prior to Red Hat, Garima helped fuel innovation at Akamai Technologies & MathWorks Inc.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/2/performance-container-world

作者：[Garima][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/garimavsharma
[1]:https://opensource.com/article/17/2/performance-container-world?rate=RozKaIY39AZNxbayqFkUmtkkhoGdctOVuGOAJqVJII8
[2]:https://opensource.com/resources/what-are-linux-containers
[3]:https://opensource.com/resources/what-are-microservices
[4]:https://opensource.com/resources/what-is-kubernetes
[5]:https://opensource.com/user/109286/feed
[6]:https://opensource.com/article/17/2/performance-container-world#comments
[7]:https://opensource.com/users/garimavsharma
