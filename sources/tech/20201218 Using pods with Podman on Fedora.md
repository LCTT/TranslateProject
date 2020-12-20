[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using pods with Podman on Fedora)
[#]: via: (https://fedoramagazine.org/podman-pods-fedora-containers/)
[#]: author: (Darshna Das https://fedoramagazine.org/author/climoiselle/)

Using pods with Podman on Fedora
======

![Using Pods with Podman][1]

Photo by [Dick Martin][2] on [Unsplash][3]

This article shows the reader how easy it is to get started using pods with Podman on Fedora. But what is Podman? Well, we will start by saying that Podman is a container engine developed by Red Hat, and yes, if you thought about Docker when reading container engine, you are on the right track. A whole new revolution of containerization started with Docker, and Kubernetes added the concept of pods in the area of container orchestration when dealing with containers that share some common resources. But hold on! Do you really think it is worth sticking with Docker alone by assuming it’s the only effective way of containerization? Podman can also manage pods on Fedora as well as the containers used in those pods.

> [Podman][4] is a daemonless, open source, Linux native tool designed to make it easy to find, run, build, share and deploy applications using Open Containers Initiative ([OCI][5]) [Containers][6] and [Container Images][7].
>
> From the official Podman documentation at <http://docs.podman.io/en/latest/>

### Why should we switch to Podman?

Podman is a daemonless container engine for developing, managing, and running OCI Containers on your Linux System. Containers can either be run as root or in rootless mode. Podman directly interacts with an image registry, containers and image storage.

### Install Podman:

```
sudo dnf -y install podman
```

### Creating a Pod:

To start using the pod we first need to create it and for that we have a basic command structure
```

```

$ podman pod create
```

```

![][8]

The command above contains no arguments and hence it will create a pod with a randomly generated name. You might however, want to give your pod a relevant name. For that you just need to modify the above command a bit.
```

```

$ podman pod create --name climoiselle
```

```

![][9]

The pod will be created and will report back to you the ID of the pod. In the example shown the pod was given the name ‘climoiselle’. To view the newly created pod is easy by using the command shown below:
```

```

$ podman pod list
```

```

![Newly created pods have been deployed][10]

As you can see, there are two pods listed here, one named darshna and the one created from the example named climoiselle. No doubt you notice that both pods already include one container, yet we sisn’t deploy a container to the pods yet. What is that extra container inside the pod? This randomly generated container is an infra container. Every podman pod includes this infra container and in practice these containers do nothing but go to sleep. Their purpose is to hold the namespaces associated with the pod and to allow Podman to connect other containers to the pod. The other purpose of the infra container is to allow the pod to keep running when all associated containers have been stopped.

You can also view the individual containers within a pod with the command:
```

```

$ podman ps -a --pod
```

```

![][11]

### Add a container

The cool thing is, you can add more containers to your newly deployed pod. Always remember the name of your pod. It’s important as you’ll need that name in order to deploy the container in that pod. We’ll use the official ubuntu image and deploy a container using it running the top command.
```

```

$ podman run -dt --pod climoiselle ubuntu top
```

```

![][12]

### Everything in a Single Command:

Podman has an agile characteristic when it comes to deploying a container in a pod which you created. You can create a pod and deploy a container to the said pod with a single command using Podman. Let’s say you want to deploy an NGINX container, exposing external port 8080 to internal port 80 to a new pod named test_server.
```

```

$ podman run -dt --pod new:test_server -p 8080:80 nginx
```

```

![Created a new pod and deployed a container together][13]

Let’s check all pods that have been created and the number of containers running in each of them …
```

```

$ podman pod list
```

```

![List of the containers, their state and number of containers running into them][14]

Do you want to know a detailed configuration of the pods which are running? Just type in the command shown below:
```

```

podman pod inspect [pod's name/id]
```

```

![][15]

### Make it stop!

To stop the pods, we need to use the name or ID of the pod. With the information from podman’s pod list command, we can view the pods and their infra id. Simply use podman with the command stop and give the particular name/infra id of the pod.
```

```

$ podman pod stop climoiselle
```

```

![][16]

### Hey take a look!

![My pod climoiselle stopped][17]

After following this short tutorial, you can see how quickly you can use pods with podman on fedora. It’s an easy and convenient way to use containers that share resources and interact together.

### Further reading

The fedora Classrom article <https://fedoramagazine.org/fedora-classroom-containers-101-podman/>. A good starting point for beginners <https://developers.redhat.com/blog/2018/02/22/container-terminology-practical-introduction/>. An article on capabilities and podman <https://fedoramagazine.org/podman-with-capabilities-on-fedora/>. Podman’s documentation site <http://docs.podman.io/en/latest/>.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/podman-pods-fedora-containers/

作者：[Darshna Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/climoiselle/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/12/using-pods-w-podman-816x346.png
[2]: https://unsplash.com/@dick42420?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/seals-in-canada?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: http://podman.io
[5]: https://www.opencontainers.org/
[6]: https://developers.redhat.com/blog/2018/02/22/container-terminology-practical-introduction/#h.j2uq93kgxe0e
[7]: https://developers.redhat.com/blog/2018/02/22/container-terminology-practical-introduction/#h.dqlu6589ootw
[8]: https://fedoramagazine.org/wp-content/uploads/2020/12/Podman0-1-1-1024x328.png
[9]: https://fedoramagazine.org/wp-content/uploads/2020/12/Podman1-1-1024x355.png
[10]: https://fedoramagazine.org/wp-content/uploads/2020/12/podman3-1024x334.png
[11]: https://fedoramagazine.org/wp-content/uploads/2020/12/podman4-1-1024x221.png
[12]: https://fedoramagazine.org/wp-content/uploads/2020/12/podman8-1024x739.png
[13]: https://fedoramagazine.org/wp-content/uploads/2020/12/podman9-1024x348.png
[14]: https://fedoramagazine.org/wp-content/uploads/2020/12/podman10-1024x341.png
[15]: https://fedoramagazine.org/wp-content/uploads/2020/12/podman5-808x1024.png
[16]: https://fedoramagazine.org/wp-content/uploads/2020/12/podman11-1024x279.png
[17]: https://fedoramagazine.org/wp-content/uploads/2020/12/podman12-1024x362.png
