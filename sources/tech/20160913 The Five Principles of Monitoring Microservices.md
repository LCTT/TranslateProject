jiajia9linuxer
The Five Principles of Monitoring Microservices
====

![](http://thenewstack.io/wp-content/uploads/2016/09/toppicsysdig.jpg)

The need for microservices can be summed up in just one word: speed. The need to deliver more functionality and reliability faster has revolutionized the way developers create software. Not surprisingly, this change has caused ripple effects within software management, including monitoring systems. In this post, we’ll focus on the radical changes required to monitor your microservices in production efficiently. We’ll lay out five guiding principles for adapting your monitoring approach for this new software architecture.

Monitoring is a critical piece of the control systems of microservices, as the more complex your software gets, the harder it is to understand its performance and troubleshoot problems. Given the dramatic changes to software delivery, however, monitoring needs an overhaul to perform well in a microservice environment. The rest of this article presents the five principles of monitoring microservices, as follows:

1. Monitor containers and what’s inside them.
2. Alert on service performance, not container performance.
3. Monitor services that are elastic and multi-location.
4. Monitor APIs.
5. Map your monitoring to your organizational structure.

Leveraging these five principles will allow you to establish more effective monitoring as you make your way towards microservices. These principles will allow you to address both the technological changes associated with microservices, in addition to the organizational changes related to them.

### The Principles of Microservice Monitoring

#### 1. Monitor Containers and What’s Running Inside Them

Containers gained prominence as the building blocks of microservices. The speed, portability, and isolation of containers made it easy for developers to embrace a microservice model. There’s been a lot written on the benefits of containers so we won’t recount it all here.

Containers are black boxes to most systems that live around them. That’s incredibly useful for development, enabling a high level of portability from development through production, from developer laptop to cloud. But when it comes to operating, monitoring and troubleshooting a service, black boxes make common activities harder, leading us to wonder: what’s running in the container? How is the application/code performing? Is it spitting out important custom metrics? From the DevOps perspective, you need deep visibility inside containers rather than just knowing that some containers exist.

![](http://thenewstack.io/wp-content/uploads/2016/09/greatfordev.jpg)

The typical process for instrumentation in a non-containerized environment — an agent that lives in the user space of a host or VM — doesn’t work particularly well for containers. That’s because containers benefit from being small, isolated processes with as few dependencies as possible.

And, at scale, running thousands of monitoring agents for even a modestly-sized deployment is an expensive use of resources and an orchestration nightmare. Two potential solutions arise for containers: 1) ask your developers to instrument their code directly, or 2) leverage a universal kernel-level instrumentation approach to see all application and container activity on your hosts. We won’t go into depth here, but each method has pros and cons.

#### 2. Leverage Orchestration Systems to Alert on Service Performance

Making sense of operational data in a containerized environment is a new challenge. The metrics of a single container have a much lower marginal value than the aggregate information from all the containers that make up a function or a service.

This particularly applies to application-level information, like which queries have the slowest response times or which URLs are seeing the most errors, but also applies to infrastructure-level monitoring, like which services’ containers are using the most resources beyond their allocated CPU shares.

Increasingly, software deployment requires an orchestration system to “translate” a logical application blueprint into physical containers. Common orchestration systems include Kubernetes, Mesosphere DC/OS and Docker Swarm. Teams use an orchestration system to (1) define your microservices and (2) understand the current state of each service in deployment. You could argue that the orchestration system is even more important than the containers. The actual containers are ephemeral — they matter only for the short time that they exist — while your services matter for the life of their usefulness.

DevOps teams should redefine alerts to focus on characteristics that get as close to monitoring the experience of the service as possible. These alerts are the first line of defense in assessing if something is impacting the application. But getting to these alerts is challenging, if not impossible unless your monitoring system is container-native.

Container-native solutions leverage orchestration metadata to dynamically aggregate container and application data and calculate monitoring metrics on a per-service basis. Depending on your orchestration tool, you might have different layers of a hierarchy that you’d like to drill into. For example, in Kubernetes, you typically have a Namespace, ReplicaSets, Pods and some containers. Aggregating at these various layers is essential for logical troubleshooting, regardless of the physical deployment of the containers that make up the service.

![](http://thenewstack.io/wp-content/uploads/2016/09/servicemonitoring.jpg)

#### 3. Be Prepared for Services that are Elastic and Multi-Location

Elastic services are certainly not a new concept, but the velocity of change is much faster in container-native environments than virtualized environments. Rapidly changing environments can wreak havoc on brittle monitoring systems.

Frequently monitoring legacy systems required manual tuning of metrics and checks based on individual deployments of software. This tuning can be as specific as defining the individual metrics to be captured, or configuring collection based on what application is operating in a particular container. While that may be acceptable on a small scale (think tens of containers), it would be unbearable in anything larger. Microservice focused monitoring must be able to comfortably grow and shrink in step with elastic services, without human intervention.

For example, if the DevOps team must manually define what service a container is included in for monitoring purposes, they no doubt drop the ball as Kubernetes or Mesos spins up new containers regularly throughout the day. Similarly, if Ops were required to install a custom stats endpoint when new code is built and pushed into production, challenges may arise as developers pull base images from a Docker registry.

In production, build monitoring toward a sophisticated deployment that spans multiple data centers or multiple clouds. Leveraging, for example, AWS CloudWatch will only get you so far if your services span your private data center as well as AWS. That leads back to implementing a monitoring system that can span these different locations as well as operate in dynamic, container-native environments.

#### 4. Monitor APIs

In microservice environments, APIs are the lingua franca. They are essentially the only elements of a service that are exposed to other teams. In fact, response and consistency of the API may be the “internal SLA” even if there isn’t a formal SLA defined.

As a result, API monitoring is essential. API monitoring can take many forms but clearly, must go beyond binary up/down checks. For instance, it’s valuable to understand the most frequently used endpoints as a function of time. This allows teams to see if anything noticeable has changed in the usage of services, whether it be due to a design change or a user change.

You can also consider the slowest endpoints of your service, as these can reveal significant problems, or, at the very least, point to areas that need the most optimization in your system.

Finally, the ability to trace service calls through your system represents another critical capability. While typically used by developers, this type of profiling will help you understand the overall user experience while breaking information down into infrastructure and application-based views of your environment.

#### 5. Map Monitoring to Your Organizational Structure

While most of this post has been focused on the technological shift in microservices and monitoring, like any technology story, this is as much about people as it is about software bits.

For those of you familiar with Conway’s law, he reminds us that the design of systems is defined by the organizational structure of the teams building them. The allure of creating faster, more agile software has pushed teams to think about restructuring their development organization and the rules that govern it.

![](http://thenewstack.io/wp-content/uploads/2016/09/mapmonitoring.jpg)

So if an organization wants to benefit from this new software architecture approach, their teams must, therefore, mirror microservices themselves. That means smaller teams, loosely coupled; that can choose their direction as long as it still meets the needs of the whole. Within each team, there is more control than ever over languages used, how bugs are handled, or even operational responsibilities.

DevOps teams can enable a monitoring platform that does exactly this: allows each microservice team to isolate their alerts, metrics, and dashboards, while still giving operations a view into the global system.

### Conclusion

There’s one, clear trigger event that precipitated the move to microservices: speed. Organizations wanted to deliver more capabilities to their customers in less time. Once this happened, technology stepped in, the architectural move to micro-services and the underlying shift to containers make speed happen. Anything that gets in the way of this progress train is going to get run over on the tracks.

As a result, the fundamental principles of monitoring need to adapt to the underlying technology and organizational changes that accompany microservices. Operations teams that recognize this shift can adapt to microservices earlier and easier.

--------------------------------------------------------------------------------

via: http://linoxide.com/firewall/pfsense-setup-basic-configuration/

作者：[Apurva Dave][a] [Loris Degioanni][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://thenewstack.io/author/apurvadave/
[b]: http://thenewstack.io/author/lorisdegioanni/
