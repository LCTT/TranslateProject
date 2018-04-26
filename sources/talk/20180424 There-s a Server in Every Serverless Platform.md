There’s a Server in Every Serverless Platform
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/servers.jpg?itok=i_gyObMP)
Serverless computing or Function as a Service (FaaS) is a new buzzword created by an industry that loves to coin new terms as market dynamics change and technologies evolve. But what exactly does it mean? What is serverless computing?

Before getting into the definition, let’s take a brief history lesson from Sirish Raghuram, CEO and co-founder of Platform9, to understand the evolution of serverless computing.

“In the 90s, we used to build applications and run them on hardware. Then came virtual machines that allowed users to run multiple applications on the same hardware. But you were still running the full-fledged OS for each application. The arrival of containers got rid of OS duplication and process level isolation which made it lightweight and agile,” said Raghuram.

Serverless, specifically, Function as a Service, takes it to the next level as users are now able to code functions and run them at the granularity of build, ship and run. There is no complexity of underlying machinery needed to run those functions. No need to worry about spinning containers using Kubernetes. Everything is hidden behind the scenes.

“That’s what is driving a lot of interest in function as a service,” said Raghuram.

### What exactly is serverless?

There is no single definition of the term, but to build some consensus around the idea, the [Cloud Native Computing Foundation (CNCF)][1] Serverless Working Group wrote a [white paper][2] to define serverless computing.

According to the white paper, “Serverless computing refers to the concept of building and running applications that do not require server management. It describes a finer-grained deployment model where applications, bundled as one or more functions, are uploaded to a platform and then executed, scaled, and billed in response to the exact demand needed at the moment.”

Ken Owens, a member of the Technical Oversight Committee at CNCF said that the primary goal of serverless computing is to help users build and run their applications without having to worry about the cost and complexity of servers in terms of provisioning, management and scaling.

“Serverless is a natural evolution of cloud-native computing. The CNCF is advancing serverless adoption through collaboration and community-driven initiatives that will enable interoperability,” [said][3] Chris Aniszczyk, COO, CNCF.

### It’s not without servers

First things first, don’t get fooled by the term “serverless.” There are still servers in serverless computing. Remember what Raghuram said: all the machinery is hidden; it’s not gone.

The clear benefit here is that developers need not concern themselves with tasks that don’t add any value to their deliverables. Instead of worrying about managing the function, they can dedicate their time to adding featured and building apps that add business value. Time is money and every minute saved in management goes toward innovation. Developers don’t have to worry about scaling based on peaks and valleys; it’s automated. Because cloud providers charge only for the duration that functions are run, developers cut costs by not having to pay for blinking lights.

But… someone still has to do the work behind the scenes. There are still servers offering FaaS platforms.

In the case of public cloud offerings like Google Cloud Platform, AWS, and Microsoft Azure, these companies manage the servers and charge customers for running those functions. In the case of private cloud or datacenters, where developers don’t have to worry about provisioning or interacting with such servers, there are other teams who do.

The CNCF white paper identifies two groups of professionals that are involved in the serverless movement: developers and providers. We have already talked about developers. But, there are also providers that offer serverless platforms; they deal with all the work involved in keeping that server running.

That’s why many companies, like SUSE, refrain from using the term “serverless” and prefer the term function as a service, because they offer products that run those “serverless” servers. But what kind of functions are these? Is it the ultimate future of app delivery?

### Event-driven computing

Many see serverless computing as an umbrella that offers FaaS among many other potential services. According to CNCF, FaaS provides event-driven computing where functions are triggered by events or HTTP requests. “Developers run and manage application code with functions that are triggered by events or HTTP requests. Developers deploy small units of code to the FaaS, which are executed as needed as discrete actions, scaling without the need to manage servers or any other underlying infrastructure,” said the white paper.

Does that mean FaaS is the silver bullet that solves all problems for developing and deploying applications? Not really. At least not at the moment. FaaS does solve problems in several use cases and its scope is expanding. A good use case of FaaS could be the functions that an application needs to run when an event takes place.

Let’s take an example: a user takes a picture from a phone and uploads it to the cloud. Many things happen when the picture is uploaded - it’s scanned (exif data is read), a thumbnail is created, based on deep learning/machine learning the content of the image is analyzed, the information of the image is stored in the database. That one event of uploading that picture triggers all those functions. Those functions die once the event is over. That’s what FaaS does. It runs code quickly to perform all those tasks and then disappears.

That’s just one example. Another example could be an IoT device where a motion sensor triggers an event that instructs the camera to start recording and sends the clip to the designated contant. Your thermostat may trigger the fan when the sensor detects a change in temperature. These are some of the many use cases where function as a service make more sense than the traditional approach. Which also says that not all applications (at least at the moment, but that will change as more organizations embrace the serverless platform) can be run as function as service.

According to CNCF, serverless computing should be considered if you have these kinds of workloads:

  * Asynchronous, concurrent, easy to parallelize into independent units of work

  * Infrequent or has sporadic demand, with large, unpredictable variance in scaling requirements

  * Stateless, ephemeral, without a major need for instantaneous cold start time

  * Highly dynamic in terms of changing business requirements that drive a need for accelerated developer velocity




### Why should you care?

Serverless is a very new technology and paradigm, just the way VMs and containers transformed the app development and delivery models, FaaS can also bring dramatic changes. We are still in the early days of serverless computing. As the market evolves, consensus is created and new technologies evolve, and FaaS may grow beyond the workloads and use cases mentioned here.

What is becoming quite clear is that companies who are embarking on their cloud native journey must have serverless computing as part of their strategy. The only way to stay ahead of competitors is by keeping up with the latest technologies and trends.

It’s about time to put serverless into servers.

For more information, check out the CNCF Working Group's serverless whitepaper [here][2]. And, you can learn more at [KubeCon + CloudNativeCon Europe][4], coming up May 2-4 in Copenhagen, Denmark.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/4/theres-server-every-serverless-platform

作者：[SWAPNIL BHARTIYA][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.cncf.io/
[2]:https://github.com/cncf/wg-serverless/blob/master/whitepaper/cncf_serverless_whitepaper_v1.0.pdf
[3]:https://www.cncf.io/blog/2018/02/14/cncf-takes-first-step-towards-serverless-computing/
[4]:https://events.linuxfoundation.org/events/kubecon-cloudnativecon-europe-2018/attend/register/
