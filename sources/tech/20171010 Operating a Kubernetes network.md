**translating by [erlinux](https://github.com/erlinux)**
Operating a Kubernetes network
============================================================

I’ve been working on Kubernetes networking a lot recently. One thing I’ve noticed is, while there’s a reasonable amount written about how to **set up** your Kubernetes network, I haven’t seen much about how to **operate** your network and be confident that it won’t create a lot of production incidents for you down the line.

In this post I’m going to try to convince you of three things: (all I think pretty reasonable :))

*   Avoiding networking outages in production is important

*   Operating networking software is hard

*   It’s worth thinking critically about major changes to your networking infrastructure and the impact that will have on your reliability, even if very fancy Googlers say “this is what we do at Google”. (google engineers are doing great work on Kubernetes!! But I think it’s important to still look at the architecture and make sure it makes sense for your organization.)

I’m definitely not a Kubernetes networking expert by any means, but I have run into a few issues while setting things up and definitely know a LOT more about Kubernetes networking than I used to.

### Operating networking software is hard

Here I’m not talking about operating physical networks (I don’t know anything about that), but instead about keeping software like DNS servers & load balancers & proxies working correctly.

I have been working on a team that’s responsible for a lot of networking infrastructure for a year, and I have learned a few things about operating networking infrastructure! (though I still have a lot to learn obviously). 3 overall thoughts before we start:

*   Networking software often relies very heavily on the Linux kernel. So in addition to configuring the software correctly you also need to make sure that a bunch of different sysctls are set correctly, and a misconfigured sysctl can easily be the difference between “everything is 100% fine” and “everything is on fire”.

*   Networking requirements change over time (for example maybe you’re doing 5x more DNS lookups than you were last year! Maybe your DNS server suddenly started returning TCP DNS responses instead of UDP which is a totally different kernel workload!). This means software that was working fine before can suddenly start having issues.

*   To fix a production networking issues you often need a lot of expertise. (for example see this [great post by Sophie Haskins on debugging a kube-dns issue][1]) I’m a lot better at debugging networking issues than I was, but that’s only after spending a huge amount of time investing in my knowledge of Linux networking.

I am still far from an expert at networking operations but I think it seems important to:

1.  Very rarely make major changes to the production networking infrastructure (because it’s super disruptive)

2.  When you  _are_  making major changes, think really carefully about what the failure modes are for the new network architecture are

3.  Have multiple people who are able to understand your networking setup

Switching to Kubernetes is obviously a pretty major networking change! So let’s talk about what some of the things that can go wrong are!

### Kubernetes networking components

The Kubernetes networking components we’re going to talk about in this post are:

*   Your overlay network backend (like flannel/calico/weave net/romana)

*   `kube-dns`

*   `kube-proxy`

*   Ingress controllers / load balancers

*   The `kubelet`

If you’re going to set up HTTP services you probably need all of these. I’m not using most of these components yet but I’m trying to understand them, so that’s what this post is about.

### The simplest way: Use host networking for all your containers

Let’s start with the simplest possible thing you can do. This won’t let you run HTTP services in Kubernetes. I think it’s pretty safe because there are less moving parts.

If you use host networking for all your containers I think all you need to do is:

1.  Configure the kubelet to configure DNS correctly inside your containers

2.  That’s it

If you use host networking for literally every pod you don’t need kube-dns or kube-proxy. You don’t even need a working overlay network.

In this setup your pods can connect to the outside world (the same way any process on your hosts would talk to the outside world) but the outside world can’t connect to your pods.

This isn’t super important (I think most people want to run HTTP services inside Kubernetes and actually communicate with those services) but I do think it’s interesting to realize that at some level all of this networking complexity isn’t strictly required and sometimes you can get away without using it. Avoiding networking complexity seems like a good idea to me if you can.

### Operating an overlay network

The first networking component we’re going to talk about is your overlay network. Kubernetes assumes that every pod has an IP address and that you can communicate with services inside that pod by using that IP address. When I say “overlay network” this is what I mean (“the system that lets you refer to a pod by its IP address”).

All other Kubernetes networking stuff relies on the overlay networking working correctly. You can read more about the [kubernetes networking model here][10].

The way Kelsey Hightower describes in [kubernetes the hard way][11] seems pretty good but it’s not really viable on AWS for clusters more than 50 nodes or so, so I’m not going to talk about that.

There are a lot of overlay network backends (calico, flannel, weaveworks, romana) and the landscape is pretty confusing. But as far as I’m concerned an overlay network has 2 responsibilities:

1.  Make sure your pods can send network requests outside your cluster

2.  Keep a stable mapping of nodes to subnets and keep every node in your cluster updated with that mapping. Do the right thing when nodes are added & removed.

Okay! So! What can go wrong with your overlay network?

*   The overlay network is responsible for setting up iptables rules (basically `iptables -A -t nat POSTROUTING -s $SUBNET -j MASQUERADE`) to ensure that containers can make network requests outside Kubernetes. If something goes wrong with this rule then your containers can’t connect to the external network. This isn’t that hard (it’s just a few iptables rules) but it is important. I made a [pull request][2] because I wanted to make sure this was resilient

*   Something can go wrong with adding or deleting nodes. We’re using the flannel hostgw backend and at the time we started using it, node deletion [did not work][3].

*   Your overlay network is probably dependent on a distributed database (etcd). If that database has an incident, this can cause issues. For example [https://github.com/coreos/flannel/issues/610][4] says that if you have data loss in your flannel etcd cluster it can result in containers losing network connectivity. (this has now been fixed)

*   You upgrade Docker and everything breaks

*   Probably more things!

I’m mostly talking about past issues in Flannel here but I promise I’m not picking on Flannel – I actually really **like** Flannel because I feel like it’s relatively simple (for instance the [vxlan backend part of it][12] is like 500 lines of code) and I feel like it’s possible for me to reason through any issues with it. And it’s obviously continuously improving. They’ve been great about reviewing pull requests.

My approach to operating an overlay network so far has been:

*   Learn how it works in detail and how to debug it (for example the hostgw network backend for Flannel works by creating routes, so you mostly just need to do `sudo ip route list` to see whether it’s doing the correct thing)

*   Maintain an internal build so it’s easy to patch it if needed

*   When there are issues, contribute patches upstream

I think it’s actually really useful to go through the list of merged PRs and see bugs that have been fixed in the past – it’s a bit time consuming but is a great way to get a concrete list of kinds of issues other people have run into.

It’s possible that for other people their overlay networks just work but that hasn’t been my experience and I’ve heard other folks report similar issues. If you have an overlay network setup that is a) on AWS and b) works on a cluster more than 50-100 nodes where you feel more confident about operating it I would like to know.

### Operating kube-proxy and kube-dns?

Now that we have some thoughts about operating overlay networks, let’s talk about

There’s a question mark next to this one because I haven’t done this. Here I have more questions than answers.

Here’s how Kubernetes services work! A service is a collection of pods, which each have their own IP address (like 10.1.0.3, 10.2.3.5, 10.3.5.6)

1.  Every Kubernetes service gets an IP address (like 10.23.1.2)

2.  `kube-dns` resolves Kubernetes service DNS names to IP addresses (so my-svc.my-namespace.svc.cluster.local might map to 10.23.1.2)

3.  `kube-proxy` sets up iptables rules in order to do random load balancing between them. Kube-proxy also has a userspace round-robin load balancer but my impression is that they don’t recommend using it.

So when you make a request to `my-svc.my-namespace.svc.cluster.local`, it resolves to 10.23.1.2, and then iptables rules on your local host (generated by kube-proxy) redirect it to one of 10.1.0.3 or 10.2.3.5 or 10.3.5.6 at random.

Some things that I can imagine going wrong with this:

*   `kube-dns` is misconfigured

*   `kube-proxy` dies and your iptables rules don’t get updated

*   Some issue related to maintaining a large number of iptables rules

Let’s talk about the iptables rules a bit, since doing load balancing by creating a bajillion iptables rules is something I had never heard of before!

kube-proxy creates one iptables rule per target host like this: (these rules are from [this github issue][13])

```
-A KUBE-SVC-LI77LBOOMGYET5US -m comment --comment "default/showreadiness:showreadiness" -m statistic --mode random --probability 0.20000000019 -j KUBE-SEP-E4QKA7SLJRFZZ2DD[b][c]  
-A KUBE-SVC-LI77LBOOMGYET5US -m comment --comment "default/showreadiness:showreadiness" -m statistic --mode random --probability 0.25000000000 -j KUBE-SEP-LZ7EGMG4DRXMY26H  
-A KUBE-SVC-LI77LBOOMGYET5US -m comment --comment "default/showreadiness:showreadiness" -m statistic --mode random --probability 0.33332999982 -j KUBE-SEP-RKIFTWKKG3OHTTMI  
-A KUBE-SVC-LI77LBOOMGYET5US -m comment --comment "default/showreadiness:showreadiness" -m statistic --mode random --probability 0.50000000000 -j KUBE-SEP-CGDKBCNM24SZWCMS 
-A KUBE-SVC-LI77LBOOMGYET5US -m comment --comment "default/showreadiness:showreadiness" -j KUBE-SEP-RI4SRNQQXWSTGE2Y 

```

So kube-proxy creates a **lot** of iptables rules. What does that mean? What are the implications of that in for my network? There’s a great talk from Huawei called [Scale Kubernetes to Support 50,000 services][14] that says if you have 5,000 services in your kubernetes cluster, it takes **11 minutes** to add a new rule. If that happened to your real cluster I think it would be very bad.

I definitely don’t have 5,000 services in my cluster, but 5,000 isn’t SUCH a bit number. The proposal they give to solve this problem is to replace this iptables backend for kube-proxy with IPVS which is a load balancer that lives in the Linux kernel.

It seems like kube-proxy is going in the direction of various Linux kernel based load balancers. I think this is partly because they support UDP load balancing, and other load balancers (like HAProxy) don’t support UDP load balancing.

But I feel comfortable with HAProxy! Is it possible to replace kube-proxy with HAProxy! I googled this and I found this [thread on kubernetes-sig-network][15] saying:

> kube-proxy is so awesome, we have used in production for almost a year, it works well most of time, but as we have more and more services in our cluster, we found it was getting hard to debug and maintain. There is no iptables expert in our team, we do have HAProxy&LVS experts, as we have used these for several years, so we decided to replace this distributed proxy with a centralized HAProxy. I think this maybe useful for some other people who are considering using HAProxy with kubernetes, so we just update this project and make it open source: [https://github.com/AdoHe/kube2haproxy][5]. If you found it’s useful , please take a look and give a try.

So that’s an interesting option! I definitely don’t have answers here, but, some thoughts:

*   Load balancers are complicated

*   DNS is also complicated

*   If you already have a lot of experience operating one kind of load balancer (like HAProxy), it might make sense to do some extra work to use that instead of starting to use an entirely new kind of load balancer (like kube-proxy)

*   I’ve been thinking about where we want to be using kube-proxy or kube-dns at all – I think instead it might be better to just invest in Envoy and rely entirely on Envoy for all load balancing & service discovery. So then you just need to be good at operating Envoy.

As you can see my thoughts on how to operate your Kubernetes internal proxies are still pretty confused and I’m still not super experienced with them. It’s totally possible that kube-proxy and kube-dns are fine and that they will just work fine but I still find it helpful to think through what some of the implications of using them are (for example “you can’t have 5,000 Kubernetes services”).

### Ingress

If you’re running a Kubernetes cluster, it’s pretty likely that you actually need HTTP requests to get into your cluster so far. This blog post is already too long and I don’t know much about ingress yet so we’re not going to talk about that.

### Useful links

A couple of useful links, to summarize:

*   [The Kubernetes networking model][6]

*   How GKE networking works: [https://www.youtube.com/watch?v=y2bhV81MfKQ][7]

*   The aforementioned talk on `kube-proxy` performance: [https://www.youtube.com/watch?v=4-pawkiazEg][8]

### I think networking operations is important

My sense of all this Kubernetes networking software is that it’s all still quite new and I’m not sure we (as a community) really know how to operate all of it well. This makes me worried as an operator because I really want my network to keep working! :) Also I feel like as an organization running your own Kubernetes cluster you need to make a pretty large investment into making sure you understand all the pieces so that you can fix things when they break. Which isn’t a bad thing, it’s just a thing.

My plan right now is just to keep learning about how things work and reduce the number of moving parts I need to worry about as much as possible.

As usual I hope this was helpful and I would very much like to know what I got wrong in this post!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2017/10/10/operating-a-kubernetes-network/

作者：[Julia Evans ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca/about
[1]:http://blog.sophaskins.net/blog/misadventures-with-kube-dns/
[2]:https://github.com/coreos/flannel/pull/808
[3]:https://github.com/coreos/flannel/pull/803
[4]:https://github.com/coreos/flannel/issues/610
[5]:https://github.com/AdoHe/kube2haproxy
[6]:https://kubernetes.io/docs/concepts/cluster-administration/networking/#kubernetes-model
[7]:https://www.youtube.com/watch?v=y2bhV81MfKQ
[8]:https://www.youtube.com/watch?v=4-pawkiazEg
[9]:https://jvns.ca/categories/kubernetes
[10]:https://kubernetes.io/docs/concepts/cluster-administration/networking/#kubernetes-model
[11]:https://github.com/kelseyhightower/kubernetes-the-hard-way/blob/master/docs/11-pod-network-routes.md
[12]:https://github.com/coreos/flannel/tree/master/backend/vxlan
[13]:https://github.com/kubernetes/kubernetes/issues/37932
[14]:https://www.youtube.com/watch?v=4-pawkiazEg
[15]:https://groups.google.com/forum/#!topic/kubernetes-sig-network/3NlBVbTUUU0
