[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Install a Kubernetes load balancer on your Raspberry Pi homelab with MetalLB)
[#]: via: (https://opensource.com/article/20/7/homelab-metallb)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)

Install a Kubernetes load balancer on your Raspberry Pi homelab with MetalLB
======
Assign real IPs from your home network to services running in your
cluster and access them from other hosts on your network.
![Science lab with beakers][1]

Kubernetes is designed to integrate with major cloud providers' load balancers to provide public IP addresses and direct traffic into a cluster. Some professional network equipment manufacturers also offer controllers to integrate their physical load-balancing products into Kubernetes installations in private data centers. For an enthusiast running a Kubernetes cluster at home, however, neither of these solutions is very helpful.

Kubernetes does not have a built-in network load-balancer implementation. A bare-metal cluster, such as a [Kubernetes cluster installed on Raspberry Pis for a private-cloud homelab][2], or really any cluster deployed outside a public cloud and lacking expensive professional hardware, needs another solution. [MetalLB][3] fulfills this niche, both for enthusiasts and large-scale deployments.

MetalLB is a network load balancer and can expose cluster services on a dedicated IP address on the network, allowing external clients to connect to services inside the Kubernetes cluster. It does this via either [layer 2 (data link)][4] using [Address Resolution Protocol][5] (ARP) or [layer 4 (transport)][6] using [Border Gateway Protocol][7] (BGP).

While Kubernetes does have something called [Ingress][8], which allows HTTP and HTTPS traffic to be exposed outside the cluster, it supports _only_ HTTP or HTTPS traffic, while MetalLB can support any network traffic. It is more of an apples-to-oranges comparison, however, because MetalLB provides resolution of an unassigned IP address to a particular cluster node and assigns that IP to a Service, while Ingress uses a specific IP address and internally routes HTTP or HTTPS traffic to a Service or Services based on routing rules.

MetalLB can be set up in just a few steps, works especially well in private homelab clusters, and within Kubernetes clusters, it behaves the same as public cloud load-balancer integrations. This is great for education purposes (i.e., learning how the technology works) and makes it easier to "lift-and-shift" workloads between on-premises and cloud environments.

### ARP vs. BGP

As mentioned, MetalLB works via either ARP or BGP to resolve IP addresses to specific hosts. In simplified terms, this means when a client attempts to connect to a specific IP, it will ask "which host has this IP?" and the response will point it to the correct host (i.e., the host's MAC address).

With ARP, the request is broadcast to the entire network, and a host that knows which MAC address has that IP address responds to the request; in this case, MetalLB's answer directs the client to the correct node.

With BGP, each "peer" maintains a table of routing information directing clients to the host handling a particular IP for IPs and the hosts the peer knows about, and it advertises this information to its peers. When configured for BGP, MetalLB peers each of the nodes in the cluster with the network's router, allowing the router to direct clients to the correct host.

In both instances, once the traffic has arrived at a host, Kubernetes takes over directing the traffic to the correct pods.

For the following exercise, you'll use ARP. Consumer-grade routers don't (at least easily) support BGP, and even higher-end consumer or professional routers that do support BGP can be difficult to set up. ARP, especially in a small home network, can be just as useful and requires no configuration on the network to work. It is considerably easier to implement.

### Install MetalLB

Installing MetalLB is straightforward. Download or copy two manifests from [MetalLB's GitHub repository][9] and apply them to Kubernetes. These two manifests create the namespace MetalLB's components will be deployed to and the components themselves: the MetalLB controller, a "speaker" daemonset, and service accounts.

#### Install the components

Once you create the components, a random secret is generated to allow encrypted communication between the speakers (i.e., the components that "speak" the protocol to make services reachable).

(Note: These steps are also available on MetalLB's website.)

The two manifests with the required MetalLB components are:

  * <https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml>
  * <https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml>



They can be downloaded and applied to the Kubernetes cluster using the `kubectl apply` command, either locally or directly from the web:


```
# Verify the contents of the files, then download and pipe then to kubectl with curl
# (output omitted)
$ kubectl apply -f <https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml>
$ kubectl apply -f <https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml>
```

After applying the manifests, create a random Kubernetes secret for the speakers to use for encrypted communications:


```
# Create a secret for encrypted speaker communications
$ kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
```

Completing the steps above will create and start all the MetalLB components, but they will not do anything until they are configured. To configure MetalLB, create a configMap that describes the pool of IP addresses the load balancer will use.

#### Configure the address pools

MetalLB needs one last bit of setup: a configMap with details of the addresses it can assign to the Kubernetes Service LoadBalancers. However, there is a small consideration. The addresses in use do not need to be bound to specific hosts in the network, but they must be free for MetalLB to use and not be assigned to other hosts.

In my home network, IP addresses are assigned by the DHCP server my router is running. This DHCP server should not attempt to assign the addresses that MetalLB will use. Most consumer routers allow you to decide how large your subnet will be and can be configured to assign only a subset of IPs in that subnet to hosts via DHCP.

In my network, I am using the subnet `192.168.2.1/24`, and I decided to give half the IPs to MetalLB. The first half of the subnet consists of IP addresses from `192.168.2.1` to `192.168.2.126`. This range can be represented by a `/25` subnet: `192.168.2.1/25`. The second half of the subnet can similarly be represented by a `/25` subnet: `192.168.2.128/25`. Each half contains 126 IPs—more than enough for the hosts and Kubernetes services. Make sure to decide on subnets appropriate to your own network and configure your router and MetalLB appropriately.

After configuring the router to ignore addresses in the `192.168.2.128/25` subnet (or whatever subnet you are using), create a configMap to tell MetalLB to use that pool of addresses:


```
# Create the config map
$ cat &lt;&lt;EOF | kubectl create -f -
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: address-pool-1
      protocol: layer2
      addresses:
      - 192.168.2.128/25
EOF
```

The example configMap above uses [CIDR][10] notation, but the list of addresses can also be specified as a range:


```
addresses:
 - 192.168.2.128-192.168.2.254
```

Once the configMap is created, MetalLB will be active. Time to try it out!

### Test MetalLB

You can test the new MetalLB configuration by creating an example web service, and you can use one from a [previous article][2] in this series: Kube Verify. Use the same image to test that MetalLB is working as expected: `quay.io/clcollins/kube-verify:01`. This image contains an Nginx server listening for requests on port 8080. You can [view the Containerfile][11] used to create the image. If you want, you can instead build your own container image from the Containerfile and use that for testing.

If you previously created a Kubernetes cluster on Raspberry Pis, you may already have a Kube Verify service running and can [skip to the section][12] on creating a LoadBalancer-type of service.

#### If you need to create a kube-verify namespace

If you do not already have a `kube-verify` namespace, create one with the `kubectl` command:


```
# Create a new namespace
$ kubectl create namespace kube-verify
# List the namespaces
$ kubectl get namespaces
NAME              STATUS   AGE
default           Active   63m
kube-node-lease   Active   63m
kube-public       Active   63m
kube-system       Active   63m
metallb-system    Active   21m
kube-verify       Active   19s
```

With the namespace created, create a deployment in that namespace:


```
# Create a new deployment
$ cat &lt;&lt;EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kube-verify
  namespace: kube-verify
  labels:
    app: kube-verify
spec:
  replicas: 3
  selector:
    matchLabels:
      app: kube-verify
  template:
    metadata:
      labels:
        app: kube-verify
    spec:
      containers:
      - name: nginx
        image: quay.io/clcollins/kube-verify:01
        ports:
        - containerPort: 8080
EOF
deployment.apps/kube-verify created
```

#### Create a LoadBalancer-type Kubernetes service

Now expose the deployment by creating a LoadBalancer-type Kubernetes service. If you already have a service named `kube-verify`, this will replace that one:


```
# Create a LoadBalancer service for the kube-verify deployment
cat &lt;&lt;EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: kube-verify
  namespace: kube-verify
spec:
  selector:
    app: kube-verify
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
  type: LoadBalancer
EOF
```

You could accomplish the same thing with the `kubectl expose` command:


```
`kubectl expose deployment kube-verify -n kube-verify --type=LoadBalancer --target-port=8080 --port=80`
```

MetalLB is listening for services of type LoadBalancer and immediately assigns an external IP (an IP chosen from the range you selected when you set up MetalLB). View the new service and the external IP address MetalLB assigned to it with the `kubectl get service` command:


```
# View the new kube-verify service
$ kubectl get service kube-verify -n kube-verify
NAME          TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)        AGE
kube-verify   LoadBalancer   10.105.28.147   192.168.2.129   80:31491/TCP   4m14s

# Look at the details of the kube-verify service
$ kubectl describe service kube-verify -n kube-verify
Name:                     kube-verify
Namespace:                kube-verify
Labels:                   app=kube-verify
Annotations:              &lt;none&gt;
Selector:                 app=kube-verify
Type:                     LoadBalancer
IP:                       10.105.28.147
LoadBalancer Ingress:     192.168.2.129
Port:                     &lt;unset&gt;  80/TCP
TargetPort:               8080/TCP
NodePort:                 &lt;unset&gt;  31491/TCP
Endpoints:                10.244.1.50:8080,10.244.1.51:8080,10.244.2.36:8080
Session Affinity:         None
External Traffic Policy:  Cluster
Events:
  Type    Reason        Age    From                Message
  ----    ------        ----   ----                -------
  Normal  IPAllocated   5m55s  metallb-controller  Assigned IP "192.168.2.129"
  Normal  nodeAssigned  5m55s  metallb-speaker     announcing from node "gooseberry"
```

In the output from the `kubectl describe` command, note the events at the bottom, where MetalLB has assigned an IP address (yours will vary) and is "announcing" the assignment from one of the nodes in your cluster (again, yours will vary). It also describes the port, the external port you can access the service from (80), the target port inside the container (port 8080), and a node port through which the traffic will route (31491). The end result is that the Nginx server running in the pods of the `kube-verify` service is accessible from the load-balanced IP, on port 80, from anywhere on your home network.

For example, on my network, the service was exposed on `http://192.168.2.129:80`, and I can `curl` that IP from my laptop on the same network:


```
# Verify that you receive a response from Nginx on the load-balanced IP
$ curl 192.168.2.129
&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "[http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"\&gt;][13]

&lt;html xmlns="<http://www.w3.org/1999/xhtml>" xml:lang="en" lang="en"&gt;
&lt;head&gt;
  &lt;title&gt;Test Page for the HTTP Server on Fedora&lt;/title&gt;
(further output omitted)
```

### MetalLB FTW

MetalLB is a great load balancer for a home Kubernetes cluster. It allows you to assign real IPs from your home network to services running in your cluster and access them from other hosts on your home network. These services can even be exposed outside the network by port-forwarding traffic through your home router (but please be careful with this!). MetalLB easily replicates cloud-provider-like behavior at home on bare-metal computers, Raspberry Pi-based clusters, and even virtual machines, making it easy to "lift-and-shift" workloads to the cloud or just familiarize yourself with how they work. Best of all, MetalLB is easy and convenient and makes accessing the services running in your cluster a breeze.

Have you used MetalLB, or do you use another load-balancer solution? Are you primarily using Nginx or HAProxy Ingress? Let me know in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/homelab-metallb

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/science_experiment_beaker_lab.png?itok=plKWRhlU (Science lab with beakers)
[2]: https://opensource.com/article/20/6/kubernetes-raspberry-pi
[3]: https://metallb.universe.tf/
[4]: https://en.wikipedia.org/wiki/Data_link_layer
[5]: https://en.wikipedia.org/wiki/Address_Resolution_Protocol
[6]: https://en.wikipedia.org/wiki/Transport_layer
[7]: https://en.wikipedia.org/wiki/Border_Gateway_Protocol
[8]: https://kubernetes.io/docs/concepts/services-networking/ingress/
[9]: https://github.com/metallb/metallb
[10]: https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing
[11]: https://github.com/clcollins/homelabCloudInit/blob/master/simpleCloudInitService/data/Containerfile
[12]: tmp.A4L9yD76e5#loadbalancer
[13]: http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"\>
