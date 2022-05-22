[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Review of Container-to-Container Communications in Kubernetes)
[#]: via: (https://www.linux.com/news/review-of-container-to-container-communications-in-kubernetes/)
[#]: author: (LF Training https://training.linuxfoundation.org/announcements/review-of-container-to-container-communications-in-kubernetes/)

Review of Container-to-Container Communications in Kubernetes
======

This article was originally posted at [TheNewStack][1].

_By Matt Zand and Jim Sullivan_

Kubernetes is a containerized solution. It provides virtualized runtime environments called Pods, which house one or more containers to provide a virtual runtime environment. An important aspect of Kubernetes is container communication within the Pod. Additionally, an important area of managing the Kubernetes network is to forward container ports internally and externally to make sure containers within a Pod communicate with one another properly. To manage such communications, Kubernetes offers the following four networking models:

  * Container-to-Container communications
  * Pod-to-Pod communications
  * Pod-to-Service communications
  * External-to-Internal communications



In this article, we dive into Container-to-Container communications, by showing you ways in which containers within a pod can network and communicate.

### Communication Between Containers in a Pod

Having multiple containers in a single Pod makes it relatively straightforward for them to communicate with each other. They can do this using several different methods. In this article, we discuss two methods: i- Shared Volumes and ii-Inter-Process Communications in more detail.

#### **I- Shared Volumes in a Kubernetes Pod**

In Kubernetes, you can use a shared Kubernetes Volume as a simple and efficient way to share data between containers in a Pod. For most cases, it is sufficient to use a directory on the host that is shared with all containers within a Pod.

Kubernetes Volumes enables data to survive container restarts, but these volumes have the same lifetime as the Pod. This means that the volume (and the data it holds) exists exactly as long as that Pod exists. If that Pod is deleted for any reason, even if an identical replacement is created, the shared Volume is also destroyed and created from scratch.

A standard use case for a multicontainer Pod with a shared Volume is when one container writes logs or other files to the shared directory, and the other container reads from the shared directory. For example, we can create a Pod like so:

![][2]

In this example, we define a volume named html. Its type is emptyDir, which means that the Volume is first created when a Pod is assigned to a node and exists as long as that Pod is running on that node; as the name says, it is initially empty. The first container runs the Nginx server and has the shared Volume mounted to the directory /usr/share/nginx/html. The second container uses the Debian image and has the shared Volume mounted to the directory /html. Every second, the second container adds the current date and time into the index.html file, which is located in the shared Volume. When the user makes an HTTP request to the Pod, the Nginx server reads this file and transfers it back to the user in response to the request. [Here][3] is a good article for reading more on similar Kubernetes topics.

<https://cdn.thenewstack.io/media/2020/11/d5362cd2-image1.png>

You can check that the pod is working either by exposing the nginx port and accessing it using your browser, or by checking the shared directory directly in the containers:

#### **![][4]**

#### **II- Inter-Process Communications (IPC)**

Containers in a Pod share the same IPC namespace, which means they can also communicate with each other using standard inter-process communications such as SystemV semaphores or POSIX shared memory. Containers use the strategy of the localhost hostname for communication within a pod.

In the following example, we define a Pod with two containers. We use the same Docker image for both. The first container is a producer that creates a standard Linux message queue, writes a number of random messages, and then writes a special exit message. The second container is a consumer which opens that same message queue for reading and reads messages until it receives the exit message. We also set the restart policy to “Never”, so the Pod stops after the termination of both containers.

![][5]

To check this out, create the pod using kubectl create and watch the Pod status:

![][6]

Now you can check logs for each container and verify that the second container received all messages from the first container, including the exit message:

![][7]

<https://cdn.thenewstack.io/media/2020/11/6517d90b-image2.png>

There is one major problem with this Pod, however, and it has to do with how containers start up.

### **Conclusion**

The primary reason that Pods can have multiple containers is to support helper applications that assist a primary application. Typical examples of helper applications are data pullers, data pushers and proxies. An example of this pattern is a web server with a helper program that polls a git repository for new updates.

The Volume in this exercise provides a way for containers to communicate during the life of the Pod. If the Pod is deleted and recreated, any data stored in the shared Volume is lost. In this article, we also discussed the concept of Inter-Process Communications among containers within a Pod, which is an alternative to shared Volume concepts. Now that you learn how containers inside a Pod can communicate and exchange data, you can move on to learn other Kubernetes networking models — such as Pod-to-Pod or Pod-to-Service communications. [Here][8] is a good article for learning more advanced topics on Kubernetes development.

### **About the Authors**

**Matt Zand**

Matt is is a serial entrepreneur and the founder of three successful tech startups: DC Web Makers, Coding Bootcamps and High School Technology Services. He is a leading author of Hands-on Smart Contract Development with Hyperledger Fabric book by O’Reilly Media.

**Jim Sullivan**

Jim has a bachelor’s degree in Electrical Engineering and a Master’s Degree in Computer Science. Jim also holds an MBA. Jim has been a practicing software engineer for 18 years. Currently, Jim leads an expert team in Blockchain development, DevOps, Cloud, application development, and the SAFe Agile methodology. Jim is an IBM Master Instructor.

The post [Review of Container-to-Container Communications in Kubernetes][9] appeared first on [Linux Foundation – Training][10].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/review-of-container-to-container-communications-in-kubernetes/

作者：[LF Training][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://training.linuxfoundation.org/announcements/review-of-container-to-container-communications-in-kubernetes/
[b]: https://github.com/lujun9972
[1]: https://thenewstack.io/review-of-container-to-container-communications-in-kubernetes/
[2]: https://training.linuxfoundation.org/wp-content/uploads/2020/12/fig1-300x243.png
[3]: https://myhsts.org/tutorial-review-of-17-essential-topics-for-mastering-kubernetes.php
[4]: https://training.linuxfoundation.org/wp-content/uploads/2020/12/fig2-300x54.png
[5]: https://training.linuxfoundation.org/wp-content/uploads/2020/12/fig3-300x130.png
[6]: https://training.linuxfoundation.org/wp-content/uploads/2020/12/fig4-300x54.png
[7]: https://training.linuxfoundation.org/wp-content/uploads/2020/12/fig5-300x129.png
[8]: https://blockchain.dcwebmakers.com/blog/advance-topics-for-deploying-and-managing-kubernetes-containers.html
[9]: https://training.linuxfoundation.org/announcements/review-of-container-to-container-communications-in-kubernetes/
[10]: https://training.linuxfoundation.org/
