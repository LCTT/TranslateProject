[#]: subject: (Learn essential Kubernetes commands with a new cheat sheet)
[#]: via: (https://opensource.com/article/21/5/kubernetes-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Learn essential Kubernetes commands with a new cheat sheet
======
Start exploring kubectl, containers, pods, and more, then download our
free cheat sheet so you always have the key commands at your fingertips.
![Cheat Sheet cover image][1]

The cloud runs largely on Kubernetes, Kubernetes largely runs on Linux, and Linux runs best when it has a skilled sysadmin at the controls. Whether you consider yourself a cloud architect or just a humble sysadmin, the modern internet needs users who understand how applications and services can be created within containers, scaled on demand, and monitored and managed judiciously.

One of the first steps into the brave world of containers is learning Kubernetes and its quintessential command: `kubectl`.

### Installing kubectl

The `kubectl` command allows you to run commands on Kubernetes clusters. You use `kubectl` to deploy applications, view logs, inspect and manage cluster resources, and troubleshoot issues when they arise. The classic "problem" with `kubectl` (and Kubernetes as a whole) is that to run commands against a cluster, you first need a cluster. However, there are easy solutions.

First, you can create your own Kubernetes cluster for the cost of three Raspberry Pi boards and associated peripherals (power supplies, mostly). Once you've acquired the hardware, read Chris Collins' [_Build a Kubernetes cluster with the Raspberry Pi_][2], and you'll have your very own cluster with `kubectl` installed.

The other way to acquire a cluster is to use [Minikube][3], a practice environment for Kubernetes. Of all the methods of getting a cluster up and running, this is the easiest.

There are yet more options; for example, you can take a course on Kubernetes to gain access to a lab running a cluster, or you can buy time on a cloud. It doesn't matter how you gain access to a cluster, as long as you have a Kubernetes environment to practice on.

Once you have access to a cluster, you can start exploring the `kubectl` command.

### Understanding pods and containers

A container is a lightweight, partial Linux system dedicated to running an application or service. A container is constrained by a [kernel namespace][4], which provides it access to vital system components on its host (the computer running the container) while preventing it from sending data out to its host. Containers are kept as container images (or just _images_ for short) and defined by text files called _Containerfiles_ or _Dockerfiles_.

A pod is a formal collection of containers and an easy way for an administrator to scale, monitor, and maintain any number of containers.

Together, these are like the "apps" of Kubernetes. Creating or acquiring container images is how you run services on the cloud.

### Running a pod

Two reliable registries of container images are Docker Hub and Quay. You can search a registry website for a list of available images. There are usually official images of large projects provided by the project, as well as community images for specialized, customized, or niche projects. One of the simplest and smallest images is a [BusyBox][5] container, which provides a minimal shell environment and some common commands.

Whether you pull an image from a registry or write your own image definition and pull that into your cluster from a Git repository, the workflow is the same. When you want to start a pod in Kubernetes:

  1. Find an image you want to use on [Docker Hub][6] or [Quay][7]
  2. Pull the image
  3. Create a pod
  4. Deploy the pod



If you want to use the example BusyBox container, you can do the last three steps in a single command:


```
`$ kubectl create deployment my-busybox --image=busybox`
```

Wait for kubectl to complete the process, and in the end, you have a running BusyBox instance. The pod isn't exposed to the rest of the world. It's just quietly running on your cluster in the background.

To see what pods are running on your cluster:


```
`$ kubectl get pods --all-namespaces`
```

You can also get information about the pod deployment:


```
`$ kubectl describe deployment my-busybox`
```

### Interacting with a pod

Containers usually contain configuration files that cause them to be automated. For instance, installing the Nginx httpd server as a container should not require your interaction. You start the container running, and it just works. This is true for the first container you add to a pod and for every container thereafter.

One of the advantages of the Kubernetes model is that you can scale your services as needed. Should your web service become overwhelmed by unexpected traffic, you can start an identical container in your cloud (using the `scale` or `autoscale` subcommand), doubling your service's ability to handle incoming requests.

Even so, sometimes it's nice to see some proof that a pod is running as expected or to be able to troubleshoot something that doesn't appear to be functioning correctly. For this, you can run arbitrary commands in a container:


```
`$ kubectl exec my-busybox -- echo "hello cloud"`
```

Alternately, you can open a shell in your container, piping your standard input into it and its output to your terminal's stdout:


```
`$ kubectl exec --stdin --tty my-busybox -- /bin/sh`
```

### Exposing services

By default, pods aren't exposed to the outside world upon creation, giving you time to test and verify before going live. Assume you want to install and deploy the Nginx web server as a pod on your cluster and make it accessible. As with any service, you must point your pod to a port on your server. The `kubectl` subcommand `expose` can do this for you:


```
$ kubectl create deployment \
my-nginx --image=nginx
$ kubectl expose deployment \
my-nginx --type=LoadBalancer --port=8080
```

As long as your cluster is accessible from the internet, you can test your new web server's accessibility by opening a browser and navigating to your public IP address.

### More than just pods

Kubernetes provides a lot more than just stock images of common services. In addition to being a system for [container orchestration][8], it's also a platform for cloud development. You can write and deploy applications, manage and monitor performance and traffic, implement intelligent load balancing strategies, and much more.

Kubernetes is a powerful system, and it has quickly become the foundation for all kinds of clouds, most significantly the [open hybrid cloud][9]. Start learning Kubernetes today. And as you learn more about Kubernetes, you'll need some quick reminders of its main concepts and general syntax, so [**download our Kubernetes cheat sheet**][10] and keep it nearby.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/kubernetes-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_cheat_sheet.png?itok=lYkNKieP (Cheat Sheet cover image)
[2]: https://opensource.com/article/20/6/kubernetes-raspberry-pi
[3]: https://opensource.com/article/18/10/getting-started-minikube
[4]: https://opensource.com/article/19/10/namespaces-and-containers-linux
[5]: https://www.busybox.net/
[6]: http://hub.docker.com
[7]: http://quay.io
[8]: https://opensource.com/article/20/11/orchestration-vs-automation
[9]: https://opensource.com/article/20/10/keep-cloud-open
[10]: https://opensource.com/downloads/kubernetes-cheat-sheet
