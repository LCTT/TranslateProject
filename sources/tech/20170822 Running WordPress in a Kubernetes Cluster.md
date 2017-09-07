translating by StdioA

Running WordPress in a Kubernetes Cluster
============================================================

![](https://cdn.deliciousbrains.com/content/uploads/2017/08/10131149/db-WPKubernetesCluster-1440x699.jpg)

As a developer I try to keep my eye on the progression of technologies that I might not use every day, but are important to understand as they might indirectly affect my work. For example the recent rise of containerization, [popularized by Docker][8], used for hosting web apps at scale. I’m not technically a devops person but as I build web apps on a daily basis it’s good for me to keep my eye on how these technologies are progressing.

A good example of this progression is the rapid development of container orchestration platforms that allow you to easily deploy, scale and manage containerized applications. The main players at the moment seem to be [Kubernetes (by Google)][9], [Docker Swarm][10] and [Apache Mesos][11]. If you want a good intro to each of these technologies and their differences I recommend giving [this article][12] a read.

In this article, we’re going to start simple and take a look at the Kubernetes platform and how you can set up a WordPress site on a single node cluster on your local machine.

### Installing Kubernetes

The [Kubernetes docs][13] have a great interactive tutorial that covers a lot of this stuff but for the purpose of this article I’m just going to cover installation and usage on macOS.

The first thing we need to do is install Kubernetes on your local machine. We’re going to use a tool called [Minikube][14] which is specifically designed to make it easy to set up a Kubernetes cluster on your local machine for testing.

As per the Minikube docs, there are a few prerequisites before we get going. Make sure you have a Hypervisor installed (‘m going to use Virtualbox). Next we need to [install the Kubernetes command-line tool][15] (known as `kubectl`). If you use Homebrew this is as simple as running:

```
$ brew install kubectl

```

Now we can actually [install Minikube][16]:

```
$ curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.21.0/minikube-darwin-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

```

Finally we want to [start Minikube][17] which will create a virtual machine which will act as our single-node Kubernetes cluster. At this point I should state that, although we’re running things locally in this article, most of the following concepts will apply when running a full Kubernetes cluster on [real servers][18]. On a multi-node cluster a “master” node would be responsible for managing the other worker nodes (VM’s or physical servers) and Kubernetes would automate the distribution and scheduling of application containers across the cluster.

```
$ minikube start --vm-driver=virtualbox

```

### Installing Helm

At this point we should now have a (single node) Kubernetes cluster running on our local machine. We can now interact with Kubernetes in any way we want. I found [kubernetesbyexample.com][19] to be a good introduction to Kubernetes concepts and terms if you want to start playing around.

While we could set things up manually, we’re actually going to use a separate tool to install our WordPress application to our Kubernetes cluster. [Helm][20] is labelled as a “package manager for Kubernetes” and works by allowing you to easily deploy pre-built software packages to your cluster, known as “Charts”. You can think of a Chart as a group of container definitions and configs that are designed for a specific application (such as WordPress). First let’s install Helm on our local machine:

```
$ brew install kubernetes-helm

```

Next we need to install Helm on our cluster. Thankfully this is as simple as running:

```
$ helm init

```

### Installing WordPress

Now that Helm is running on our cluster we can install the [WordPress chart][21] by running:

```
$ helm install --namespace wordpress --name wordpress --set serviceType=NodePort stable/wordpress  

```

The will install and run WordPress in a container and MariaDB in a container for the database. This is known as a “Pod” in Kubernetes. A [Pod][22] is basically an abstraction that represents a group of one or more application containers and some shared resources for those containers (e.g. storage volumes, networking etc.).

We give the release a namespace and a name to keep things organized and make them easy to find. We also set the `serviceType` to `NodePort`. This is important because, by default, the service type will be set to `LoadBalancer` and, as we currently don’t have a load balancer for our cluster, we wouldn’t be able to access our WordPress site from outside the cluster.

In the last part of the output from this command you will notice some helpful instructions on how to access your WordPress site. Run these commands to get the external IP address and port for our WordPress site:

```
$ export NODE_PORT=$(kubectl get --namespace wordpress -o jsonpath="{.spec.ports[0].nodePort}" services wordpress-wordpress)
$ export NODE_IP=$(kubectl get nodes --namespace wordpress -o jsonpath="{.items[0].status.addresses[0].address}")
$ echo http://$NODE_IP:$NODE_PORT/admin

```

You should now be able to visit the resulting URL (ignoring the `/admin` bit) and see WordPress running on your very own Kubernetes cluster!

### Scaling WordPress

One of the great things about container orchestration platforms such as Kubernetes is that it makes scaling and managing your application really simple. Let’s check the status of our deployments:

```
$ kubectl get deployments --namespace=wordpress

```

 [![kubectl get deployments](https://cdn.deliciousbrains.com/content/uploads/2017/08/07120711/image4.png)][23] 

We should see that we have 2 deployments, one for the Mariadb database and one for WordPress itself. Now let’s say your WordPress site is starting to see a lot of traffic and we want to split the load over multiple instances. We can scale our `wordpress-wordpress` deployment by running a simple command:

```
$ kubectl scale --replicas 2 deployments wordpress-wordpress --namespace=wordpress

```

If we run the `kubectl get deployments` command again we should now see something like this:

 [![kubectl get deployments](https://cdn.deliciousbrains.com/content/uploads/2017/08/07120710/image2.png)][24] 

You’ve just scaled up your WordPress site! Easy peasy, right? There are now multiple WordPress containers that traffic can be load-balanced across. For more info on Kubernetes scaling check out [this tutorial][25].

### High Availability

Another great feature of platforms such as Kubernetes is the ability to not only scale easily, but to provide high availability by implementing self-healing components. Say one of your WordPress deployments fails for some reason. Kubernetes will automatically replace the deployment instantly. We can simulate this by deleting one of the pods running in our WordPress deployment.

First get a list of pods by running:

```
$ kubectl get pods --namespace=wordpress

```

 [![kubectl get pods](https://cdn.deliciousbrains.com/content/uploads/2017/08/07120711/image3.png)][26] 

Then delete one of the pods:

```
$ kubectl delete pod {POD-ID} --namespace=wordpress

```

If you run the `kubectl get pods` command again you should see Kubernetes spinning up the replacement pod straight away.

 [![kubectl get pods](https://cdn.deliciousbrains.com/content/uploads/2017/08/07120709/image1.png)][27] 

### Going Further

We’ve only really scratched the surface of what Kubernetes can do. If you want to delve a bit deeper, I would recommend having a look at some of the following features:

*   [Horizontal scaling][2]

*   [Self healing][3]

*   [Automated rollouts and rollbacks][4]

*   [Secret management][5]

Have you ever run WordPress on a container platform? Have you ever used Kubernetes (or another container orchestration platform) and got any good tips? How do you normally scale your WordPress sites? Let us know in the comments.

--------------------------------------------------------------------------------

作者简介：

Gilbert loves to build software. From jQuery scripts to WordPress plugins to full blown SaaS apps, Gilbert has been creating elegant software his whole career. Probably most famous for creating the Nivo Slider.


--------


via: https://deliciousbrains.com/running-wordpress-kubernetes-cluster/

作者：[ Gilbert Pellegrom][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://deliciousbrains.com/author/gilbert-pellegrom/
[1]:https://deliciousbrains.com/author/gilbert-pellegrom/
[2]:https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/
[3]:https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/#what-is-a-replicationcontroller
[4]:https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#what-is-a-deployment
[5]:https://kubernetes.io/docs/concepts/configuration/secret/
[6]:https://deliciousbrains.com/running-wordpress-kubernetes-cluster/
[7]:https://deliciousbrains.com/running-wordpress-kubernetes-cluster/
[8]:http://www.zdnet.com/article/what-is-docker-and-why-is-it-so-darn-popular/
[9]:https://kubernetes.io/
[10]:https://docs.docker.com/engine/swarm/
[11]:http://mesos.apache.org/
[12]:https://mesosphere.com/blog/docker-vs-kubernetes-vs-apache-mesos/  
[13]:https://kubernetes.io/docs/tutorials/kubernetes-basics/
[14]:https://kubernetes.io/docs/getting-started-guides/minikube/
[15]:https://kubernetes.io/docs/tasks/tools/install-kubectl/
[16]:https://github.com/kubernetes/minikube/releases
[17]:https://kubernetes.io/docs/getting-started-guides/minikube/#quickstart
[18]:https://kubernetes.io/docs/tutorials/kubernetes-basics/
[19]:http://kubernetesbyexample.com/
[20]:https://docs.helm.sh/
[21]:https://kubeapps.com/charts/stable/wordpress
[22]:https://kubernetes.io/docs/tutorials/kubernetes-basics/explore-intro/
[23]:https://cdn.deliciousbrains.com/content/uploads/2017/08/07120711/image4.png
[24]:https://cdn.deliciousbrains.com/content/uploads/2017/08/07120710/image2.png
[25]:https://kubernetes.io/docs/tutorials/kubernetes-basics/scale-intro/
[26]:https://cdn.deliciousbrains.com/content/uploads/2017/08/07120711/image3.png
[27]:https://cdn.deliciousbrains.com/content/uploads/2017/08/07120709/image1.png
