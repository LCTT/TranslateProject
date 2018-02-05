Your instant Kubernetes cluster
============================================================


This is a condensed and updated version of my previous tutorial [Kubernetes in 10 minutes][10]. I've removed just about everything I can so this guide still makes sense. Use it when you want to create a cluster on the cloud or on-premises as fast as possible.

### 1.0 Pick a host

We will be using Ubuntu 16.04 for this guide so that you can copy/paste all the instructions. Here are several environments where I've tested this guide. Just pick where you want to run your hosts.

*   [DigitalOcean][1] - developer cloud

*   [Civo][2] - UK developer cloud

*   [Packet][3] - bare metal cloud

*   2x Dell Intel i7 boxes - at home

> Civo is a relatively new developer cloud and one thing that I really liked was how quickly they can bring up hosts - in about 25 seconds. I'm based in the UK so I also get very low latency.

### 1.1 Provision the machines

You can get away with a single host for testing but I'd recommend at least three so we have a single master and two worker nodes.

Here are some other guidelines:

*   Pick dual-core hosts with ideally at least 2GB RAM

*   If you can pick a custom username when provisioning the host then do that rather than root. For example Civo offers an option of `ubuntu`, `civo` or `root`.

Now run through the following steps on each machine. It should take you less than 5-10 minutes. If that's too slow for you then you can use my utility script [kept in a Gist][11]:

```
$ curl -sL https://gist.githubusercontent.com/alexellis/e8bbec45c75ea38da5547746c0ca4b0c/raw/23fc4cd13910eac646b13c4f8812bab3eeebab4c/configure.sh | sh

```

### 1.2 Login and install Docker

Install Docker from the Ubuntu apt repository. This will be an older version of Docker but as Kubernetes is tested with old versions of Docker it will work in our favour.

```
$ sudo apt-get update \
  && sudo apt-get install -qy docker.io

```

### 1.3 Disable the swap file

This is now a mandatory step for Kubernetes. The easiest way to do this is to edit `/etc/fstab` and to comment out the line referring to swap.

To save a reboot then type in `sudo swapoff -a`.

> Disabling swap memory may appear like a strange requirement at first. If you are curious about this step then [read more here][4].

### 1.4 Install Kubernetes packages

```
$ sudo apt-get update \
  && sudo apt-get install -y apt-transport-https \
  && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

$ echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" \
  | sudo tee -a /etc/apt/sources.list.d/kubernetes.list \
  && sudo apt-get update 

$ sudo apt-get update \
  && sudo apt-get install -y \
  kubelet \
  kubeadm \
  kubernetes-cni

```

### 1.5 Create the cluster

At this point we create the cluster by initiating the master with `kubeadm`. Only do this on the master node.

> Despite any warnings I have been assured by [Weaveworks][5] and Lucas (the maintainer) that `kubeadm` is suitable for production use.

```
$ sudo kubeadm init

```

If you missed a step or there's a problem then `kubeadm` will let you know at this point.

Take a copy of the Kube config:

```
mkdir -p $HOME/.kube  
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config  
sudo chown $(id -u):$(id -g) $HOME/.kube/config  

```

Make sure you note down the join token command i.e.

```
$ sudo kubeadm join --token c30633.d178035db2b4bb9a 10.0.0.5:6443 --discovery-token-ca-cert-hash sha256:<hash>

```

### 2.0 Install networking

Many networking providers are available for Kubernetes, but none are included by default, so let's use Weave Net from [Weaveworks][12] which is one of the most popular options in the Kubernetes community. It tends to work out of the box without additional configuration.

```
$ kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

```

If you have private networking enabled on your host then you may need to alter the private subnet that Weavenet uses for allocating IP addresses to Pods (containers). Here's an example of how to do that:

```
$ curl -SL "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')&env.IPALLOC_RANGE=172.16.6.64/27" \
| kubectl apply -f -

```

> Weave also have a very cool visualisation tool called Weave Cloud. It's free and will show you the path traffic is taking between your Pods. [See here for an example with the OpenFaaS project][6].

### 2.2 Join the worker nodes to the cluster

Now you can switch to each of your workers and use the `kubeadm join` command from 1.5\. Once you run that log out of the workers.

### 3.0 Profit

That's it - we're done. You have a cluster up and running and can deploy your applications. If you need to setup a dashboard UI then consult the [Kubernetes documentation][13].

```
$ kubectl get nodes
NAME        STATUS    ROLES     AGE       VERSION  
openfaas1   Ready     master    20m       v1.9.2  
openfaas2   Ready     <none>    19m       v1.9.2  
openfaas3   Ready     <none>    19m       v1.9.2  

```

If you want to see my running through creating a cluster step-by-step and showing you how `kubectl` works then checkout my video below and make sure you subscribe


You can also get an "instant" Kubernetes cluster on your Mac for development using Minikube or Docker for Mac Edge edition. [Read my review and first impressions here][14].


--------------------------------------------------------------------------------

via: https://blog.alexellis.io/your-instant-kubernetes-cluster/

作者：[Alex Ellis ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.alexellis.io/author/alex/
[1]:https://www.digitalocean.com/
[2]:https://www.civo.com/
[3]:https://packet.net/
[4]:https://github.com/kubernetes/kubernetes/issues/53533
[5]:https://weave.works/
[6]:https://www.weave.works/blog/openfaas-gke
[7]:https://blog.alexellis.io/tag/kubernetes/
[8]:https://blog.alexellis.io/tag/k8s/
[9]:https://blog.alexellis.io/tag/cloud-native/
[10]:https://www.youtube.com/watch?v=6xJwQgDnMFE
[11]:https://gist.github.com/alexellis/e8bbec45c75ea38da5547746c0ca4b0c
[12]:https://weave.works/
[13]:https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
[14]:https://blog.alexellis.io/docker-for-mac-with-kubernetes/
[15]:https://blog.alexellis.io/your-instant-kubernetes-cluster/#