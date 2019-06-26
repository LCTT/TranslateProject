[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to navigate the Kubernetes learning curve)
[#]: via: (https://opensource.com/article/19/6/kubernetes-learning-curve)
[#]: author: (Scott McCarty https://opensource.com/users/fatherlinux/users/fatherlinux)

How to navigate the Kubernetes learning curve
======
Kubernetes is like a dump truck. It's elegant for solving the problems
it's designed for, but you have to master the learning curve first.
![Dump truck rounding a turn in the road][1]

In _[Kubernetes is a dump truck][2]_, I talked about how a tool can be elegant for the problem it was designed to solve—once you learn how to use it. In part 2 of this series, I'm going a little deeper into the Kubernetes' learning curve.

The journey to [Kubernetes][3] often starts with running one container on one host. You quickly discover how easy it is to run new versions of software, how easy it is to share that software with others, and how easy it is for those users to run it the way you intended.

But then you need

  * Two containers
  * Two hosts



It's easy to fire up one web server on port 80 with a container, but what happens when you need to fire up a second container on port 80? What happens when you are building a production environment and you need the containerized web server to fail over to a second host? The short answer, in either case, is you have to move into container orchestration.

Inevitably, when you start to handle the two containers or two hosts problem, you'll introduce complexity and, hence, a learning curve. The two services (a more generalized version of a container) / two hosts problem has been around for a long time and has always introduced complexity.

Historically, this would have involved load balancers, clustering software, and even clustered file systems. Configuration logic for every service is embedded in every system (load balancers, cluster software, and file systems). Running 60 or 70 services, clustered, behind load balancers is complex. Adding another new service is also complex. Worse, decommissioning a service is a nightmare. Thinking back on my days of troubleshooting production MySQL and Apache servers with logic embedded in three, four, or five different places, all in different formats, still makes my head hurt.

Kubernetes elegantly solves all these problems with one piece of software:

  1. Two services (containers): Check
  2. Two servers (high availability): Check
  3. Single source of configuration: Check
  4. Standard configuration format: Check
  5. Networking: Check
  6. Storage: Check
  7. Dependencies (what services talk to what databases): Check
  8. Easy provisioning: Check
  9. Easy de-provisioning: Check (perhaps Kubernetes' _most_ powerful piece)



Wait, it's starting to look like Kubernetes is pretty elegant and pretty powerful. _It is._ You can model an entire miniature IT universe in Kubernetes.

![Kubernetes business model][4]

So yes, there is a learning curve when starting to use a giant dump truck (or any professional equipment). There's also a learning curve to use Kubernetes, but it's worth it because you can solve so many problems with one tool. If you are apprehensive about the learning curve, think through all the underlying networking, storage, and security problems in IT infrastructure and envision their solutions today—they're not easier. Especially when you introduce more and more services, faster and faster. Velocity is the goal nowadays, so give special consideration to the provisioning and de-provisioning problem.

But don't confuse the learning curve for building or equipping Kubernetes (picking the right mud flaps for your dump truck can be hard, LOL) with the learning curve for using it. Learning to build your own Kubernetes with so many different choices at so many different layers (container engine, logging, monitoring, service mesh, storage, networking), and then maintaining updated selections of each component every six months, might not be worth the investment—but learning to use it is absolutely worth it.

I eat, sleep, and breathe Kubernetes and containers every day, and even I struggle to keep track of all the major new projects announced literally almost every day. But there isn't a day that I'm not excited about the operational benefits of having a single tool to model an entire IT miniverse. Also, remember Kubernetes has matured a ton and will continue to do so. Like Linux and OpenStack before it, the interfaces and de facto projects at each layer will mature and become easier to select.

In the third article in this series, I'll dig into what you need to know before you drive your Kubernetes "truck."

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/kubernetes-learning-curve

作者：[Scott McCarty][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux/users/fatherlinux
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/dumptruck_car_vehicle_storage_container_road.jpg?itok=TWK0CbX_ (Dump truck rounding a turn in the road)
[2]: https://opensource.com/article/19/6/kubernetes-dump-truck
[3]: https://kubernetes.io/
[4]: https://opensource.com/sites/default/files/uploads/developer_native_experience_-_mapped_to_traditional_1.png (Kubernetes business model)
