[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Kubernetes on Fedora IoT with k3s)
[#]: via: (https://fedoramagazine.org/kubernetes-on-fedora-iot-with-k3s/)
[#]: author: (Lennart Jern https://fedoramagazine.org/author/lennartj/)

Kubernetes on Fedora IoT with k3s
======

![][1]

Fedora IoT is an upcoming Fedora edition targeted at the Internet of Things. It was introduced last year on Fedora Magazine in the article [How to turn on an LED with Fedora IoT][2]. Since then, it has continued to improve together with Fedora Silverblue to provide an immutable base operating system aimed at container-focused workflows.

Kubernetes is an immensely popular container orchestration system. It is perhaps most commonly used on powerful hardware handling huge workloads. However, it can also be used on lightweight devices such as the Raspberry Pi 3. Read on to find out how.

### Why Kubernetes?

While Kubernetes is all the rage in the cloud, it may not be immediately obvious to run it on a small single board computer. But there are certainly reasons for doing it. First of all it is a great way to learn and get familiar with Kubernetes without the need for expensive hardware. Second, because of its popularity, there are [tons of applications][3] that comes pre-packaged for running in Kubernetes clusters. Not to mention the large community to provide help if you ever get stuck.

Last but not least, container orchestration may actually make things easier, even at the small scale in a home lab. This may not be apparent when tackling the the learning curve, but these skills will help when dealing with any cluster in the future. It doesn’t matter if it’s a single node Raspberry Pi cluster or a large scale machine learning farm.

#### K3s – a lightweight Kubernetes

A “normal” installation of Kubernetes (if such a thing can be said to exist) is a bit on the heavy side for IoT. The recommendation is a minimum of 2 GB RAM per machine! However, there are plenty of alternatives, and one of the newcomers is [k3s][4] – a lightweight Kubernetes distribution.

K3s is quite special in that it has replaced etcd with SQLite for its key-value storage needs. Another thing to note is that k3s ships as a single binary instead of one per component. This diminishes the memory footprint and simplifies the installation. Thanks to the above, k3s should be able to run k3s with just 512 MB of RAM, perfect for a small single board computer!

### What you will need

  1. Fedora IoT in a virtual machine or on a physical device. See the excellent getting started guide [here][5]. One machine is enough but two will allow you to test adding more nodes to the cluster.
  2. [Configure the firewall][6] to allow traffic on ports 6443 and 8472. Or simply disable it for this experiment by running “systemctl stop firewalld”.



### Install k3s

Installing k3s is very easy. Simply run the installation script:

```
curl -sfL https://get.k3s.io | sh -
```

This will download, install and start up k3s. After installation, get a list of nodes from the server by running the following command:

```
kubectl get nodes
```

Note that there are several options that can be passed to the installation script through environment variables. These can be found in the [documentation][7]. And of course, there is nothing stopping you from installing k3s manually by downloading the binary directly.

While great for experimenting and learning, a single node cluster is not much of a cluster. Luckily, adding another node is no harder than setting up the first one. Just pass two environment variables to the installation script to make it find the first node and avoid running the server part of k3s

```
curl -sfL https://get.k3s.io | K3S_URL=https://example-url:6443 \
  K3S_TOKEN=XXX sh -
```

The example-url above should be replaced by the IP address or fully qualified domain name of the first node. On that node the token (represented by XXX) is found in the file /var/lib/rancher/k3s/server/node-token.

### Deploy some containers

Now that we have a Kubernetes cluster, what can we actually do with it? Let’s start by deploying a simple web server.

```
kubectl create deployment my-server --image nginx
```

This will create a [Deployment][8] named “my-server” from the container image “nginx” (defaulting to docker hub as registry and the latest tag). You can see the Pod created by running the following command.

```
kubectl get pods
```

In order to access the nginx server running in the pod, first expose the Deployment through a [Service][9]. The following command will create a Service with the same name as the deployment.

```
kubectl expose deployment my-server --port 80
```

The Service works as a kind of load balancer and DNS record for the Pods. For instance, when running a second Pod, we will be able to _curl_ the nginx server just by specifying _my-server_ (the name of the Service). See the example below for how to do this.

```
# Start a pod and run bash interactively in it
kubectl run debug --generator=run-pod/v1 --image=fedora -it -- bash
# Wait for the bash prompt to appear
curl my-server
# You should get the "Welcome to nginx!" page as output
```

### Ingress controller and external IP

By default, a Service only get a ClusterIP (only accessible inside the cluster), but you can also request an external IP for the service by setting its type to [LoadBalancer][10]. However, not all applications require their own IP address. Instead, it is often possible to share one IP address among many services by routing requests based on the host header or path. You can accomplish this in Kubernetes with an [Ingress][11], and this is what we will do. Ingresses also provide additional features such as TLS encryption of the traffic without having to modify your application.

Kubernetes needs an ingress controller to make the Ingress resources work and k3s includes [Traefik][12] for this purpose. It also includes a simple service load balancer that makes it possible to get an external IP for a Service in the cluster. The [documentation][13] describes the service like this:

> k3s includes a basic service load balancer that uses available host ports. If you try to create a load balancer that listens on port 80, for example, it will try to find a free host in the cluster for port 80. If no port is available the load balancer will stay in Pending.
>
> k3s README

The ingress controller is already exposed with this load balancer service. You can find the IP address that it is using with the following command.

```
$ kubectl get svc --all-namespaces
NAMESPACE     NAME         TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)                      AGE
 default       kubernetes   ClusterIP      10.43.0.1               443/TCP                      33d
 default       my-server    ClusterIP      10.43.174.38            80/TCP                       30m
 kube-system   kube-dns     ClusterIP      10.43.0.10              53/UDP,53/TCP,9153/TCP       33d
 kube-system   traefik      LoadBalancer   10.43.145.104   10.0.0.8      80:31596/TCP,443:31539/TCP   33d
```

Look for the Service named traefik. In the above example the IP we are interested in is 10.0.0.8.

### Route incoming requests

Let’s create an Ingress that routes requests to our web server based on the host header. This example uses [xip.io][14] to avoid having to set up DNS records. It works by including the IP adress as a subdomain, to use any subdomain of 10.0.0.8.xip.io to reach the IP 10.0.0.8. In other words, my-server.10.0.0.8.xip.io is used to reach the ingress controller in the cluster. You can try this right now (with your own IP instead of 10.0.0.8). Without an ingress in place you should reach the “default backend” which is just a page showing “404 page not found”.

We can tell the ingress controller to route requests to our web server Service with the following Ingress.

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: my-server
spec:
  rules:
    - host: my-server.10.0.0.8.xip.io
      http:
        paths:
          - path: /
            backend:
              serviceName: my-server
              servicePort: 80
```

Save the above snippet in a file named _my-ingress.yaml_ and add it to the cluster by running this command:

```
kubectl apply -f my-ingress.yaml
```

You should now be able to reach the default nginx welcoming page on the fully qualified domain name you chose. In my example this would be my-server.10.0.0.8.xip.io. The ingress controller is routing the requests based on the information in the Ingress. A request to my-server.10.0.0.8.xip.io will be routed to the Service and port defined as backend in the Ingress (my-server and 80 in this case).

### What about IoT then?

Imagine the following scenario. You have dozens of devices spread out around your home or farm. It is a heterogeneous collection of IoT devices with various hardware capabilities, sensors and actuators. Maybe some of them have cameras, weather or light sensors. Others may be hooked up to control the ventilation, lights, blinds or blink LEDs.

In this scenario, you want to gather data from all the sensors, maybe process and analyze it before you finally use it to make decisions and control the actuators. In addition to this, you may want to visualize what’s going on by setting up a dashboard. So how can Kubernetes help us manage something like this? How can we make sure that Pods run on suitable devices?

The simple answer is labels. You can label the nodes according to capabilities, like this:

```
kubectl label nodes <node-name> <label-key>=<label-value>
# Example
kubectl label nodes node2 camera=available
```

Once they are labeled, it is easy to select suitable nodes for your workload with [nodeSelectors][15]. The final piece to the puzzle, if you want to run your Pods on _all_ suitable nodes is to use [DaemonSets][16] instead of Deployments. In other words, create one DaemonSet for each data collecting application that uses some unique sensor and use nodeSelectors to make sure they only run on nodes with the proper hardware.

The service discovery feature that allows Pods to find each other simply by Service name makes it quite easy to handle these kinds of distributed systems. You don’t need to know or configure IP addresses or custom ports for the applications. Instead, they can easily find each other through named Services in the cluster.

#### Utilize spare resources

With the cluster up and running, collecting data and controlling your lights and climate control you may feel that you are finished. However, there are still plenty of compute resources in the cluster that could be used for other projects. This is where Kubernetes really shines.

You shouldn’t have to worry about where exactly those resources are or calculate if there is enough memory to fit an extra application here or there. This is exactly what orchestration solves! You can easily deploy more applications in the cluster and let Kubernetes figure out where (or if) they will fit.

Why not run your own [NextCloud][17] instance? Or maybe [gitea][18]? You could also set up a CI/CD pipeline for all those IoT containers. After all, why would you build and cross compile them on your main computer if you can do it natively in the cluster?

The point here is that Kubernetes makes it easier to make use of the “hidden” resources that you often end up with otherwise. Kubernetes handles scheduling of Pods in the cluster based on available resources and fault tolerance so that you don’t have to. However, in order to help Kubernetes make reasonable decisions you should definitely add [resource requests][19] to your workloads.

### Summary

While Kubernetes, or container orchestration in general, may not usually be associated with IoT, it certainly makes a lot of sense to have an orchestrator when you are dealing with distributed systems. Not only does is allow you to handle a diverse and heterogeneous fleet of devices in a unified way, but it also simplifies communication between them. In addition, Kubernetes makes it easier to utilize spare resources.

Container technology made it possible to build applications that could “run anywhere”. Now Kubernetes makes it easier to manage the “anywhere” part. And as an immutable base to build it all on, we have Fedora IoT.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/kubernetes-on-fedora-iot-with-k3s/

作者：[Lennart Jern][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/lennartj/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/k3s-1-816x345.png
[2]: https://fedoramagazine.org/turnon-led-fedora-iot/
[3]: https://hub.helm.sh/
[4]: https://k3s.io
[5]: https://docs.fedoraproject.org/en-US/iot/getting-started/
[6]: https://github.com/rancher/k3s#open-ports--network-security
[7]: https://github.com/rancher/k3s#systemd
[8]: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
[9]: https://kubernetes.io/docs/concepts/services-networking/service/
[10]: https://kubernetes.io/docs/concepts/services-networking/service/#loadbalancer
[11]: https://kubernetes.io/docs/concepts/services-networking/ingress/
[12]: https://traefik.io/
[13]: https://github.com/rancher/k3s/blob/master/README.md#service-load-balancer
[14]: http://xip.io/
[15]: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/
[16]: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
[17]: https://nextcloud.com/
[18]: https://gitea.io/en-us/
[19]: https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/
