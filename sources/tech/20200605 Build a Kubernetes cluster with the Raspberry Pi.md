[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Build a Kubernetes cluster with the Raspberry Pi)
[#]: via: (https://opensource.com/article/20/6/kubernetes-raspberry-pi)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)

Build a Kubernetes cluster with the Raspberry Pi
======
Install Kubernetes on several Raspberry Pis for your own "private cloud
at home" container service.
![Cartoon graphic of Raspberry Pi board][1]

[Kubernetes][2] is an enterprise-grade container-orchestration system designed from the start to be cloud-native. It has grown to be the de-facto cloud container platform, continuing to expand as it has embraced new technologies, including container-native virtualization and serverless computing.

Kubernetes manages containers and more, from micro-scale at the edge to massive scale, in both public and private cloud environments. It is a perfect choice for a "private cloud at home" project, providing both robust container orchestration and the opportunity to learn about a technology in such demand and so thoroughly integrated into the cloud that its name is practically synonymous with "cloud computing."

Nothing says "cloud" quite like Kubernetes, and nothing screams "cluster me!" quite like Raspberry Pis. Running a local Kubernetes cluster on cheap Raspberry Pi hardware is a great way to gain experience managing and developing on a true cloud technology giant.

### Install a Kubernetes cluster on Raspberry Pis

This exercise will install a Kubernetes 1.18.2 cluster on three or more Raspberry Pi 4s running Ubuntu 20.04. Ubuntu 20.04 (Focal Fossa) offers a Raspberry Pi-focused 64-bit ARM (ARM64) image with both a 64-bit kernel and userspace. Since the goal is to use these Raspberry Pis for running a Kubernetes cluster, the ability to run AArch64 container images is important: it can be difficult to find 32-bit images for common software or even standard base images. With its ARM64 image, Ubuntu 20.04 allows you to use 64-bit container images with Kubernetes.

#### AArch64 vs. ARM64; 32-bit vs. 64-bit; ARM vs. x86

Note that AArch64 and ARM64 are effectively the same thing. The different names arise from their use within different communities. Many container images are labeled AArch64 and will run fine on systems labeled ARM64. Systems with AArch64/ARM64 architecture are capable of running 32-bit ARM images, but the opposite is not true: a 32-bit ARM system cannot run 64-bit container images. This is why the Ubuntu 20.04 ARM64 image is so useful.

Without getting too deep in the woods explaining different architecture types, it is worth noting that ARM64/AArch64 and x86_64 architectures differ, and Kubernetes nodes running on 64-bit ARM architecture cannot run container images built for x86_64. In practice, you will find some images that are not built for both architectures and may not be usable in your cluster. You will also need to build your own images on an AArch64-based system or jump through some hoops to allow your regular x86_64 systems to build AArch64 images. In a future article in the "private cloud at home" project, I will cover how to build AArch64 images on your regular system.

For the best of both worlds, after you set up the Kubernetes cluster in this tutorial, you can add x86_64 nodes to it later. You can schedule images of a given architecture to run on the appropriate nodes by Kubernetes' scheduler through the use of [Kubernetes taints and tolerations][3].

Enough about architectures and images. It's time to install Kubernetes, so get to it!

#### Requirements

The requirements for this exercise are minimal. You will need:

  * Three (or more) Raspberry Pi 4s (preferably the 4GB RAM models)
  * Install Ubuntu 20.04 ARM64 on all the Raspberry Pis



To simplify the initial setup, read [_Modify a disk image to create a Raspberry Pi-based homelab_][4] to add a user and SSH authorized_keys to the Ubuntu image before writing it to an SD card and installing on the Raspberry Pi.

### Configure the hosts

Once Ubuntu is installed on the Raspberry Pis and they are accessible via SSH, you need to make a few changes before you can install Kubernetes.

#### Install and configure Docker

As of this writing, Ubuntu 20.04 ships the most recent version of Docker, v19.03, in the base repositories and can be installed directly using the `apt` command. Note that the package name is `docker.io`. Install Docker on all of the Raspberry Pis:


```
# Install the docker.io package
$ sudo apt install -y docker.io
```

After the package is installed, you need to make some changes to enable [cgroups][5] (Control Groups). Cgroups allow the Linux kernel to limit and isolate resources. Practically speaking, this allows Kubernetes to better manage resources used by the containers it runs and increases security by isolating containers from one another.

Check the output of `docker info` before making the following changes on all of the RPis:


```
# Check `docker info`
# Some output omitted
$ sudo docker info
(...)
 Cgroup Driver: cgroups
(...)
WARNING: No memory limit support
WARNING: No swap limit support
WARNING: No kernel memory limit support
WARNING: No kernel memory TCP limit support
WARNING: No oom kill disable support
```

The output above highlights the bits that need to be changed: the cgroup driver and limit support.

First, change the default cgroups driver Docker uses from `cgroups` to `systemd` to allow systemd to act as the cgroups manager and ensure there is only one cgroup manager in use. This helps with system stability and is recommended by Kubernetes. To do this, create or replace the `/etc/docker/daemon.json` file with:


```
# Create or replace the contents of /etc/docker/daemon.json to enable the systemd cgroup driver

$ sudo cat &gt; /etc/docker/daemon.json &lt;&lt;EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF
```

#### Enable cgroups limit support

Next, enable limit support, as shown by the warnings in the `docker info` output above. You need to modify the kernel command line to enable these options at boot. For the Raspberry Pi 4, add the following to the `/boot/firmware/cmdline.txt` file:

  * `cgroup_enable=cpuset`
  * `cgroup_enable=memory`
  * `cgroup_memory=1`
  * `swapaccount=1`



Make sure they are added to the end of the line in the `cmdline.txt` file. This can be accomplished in one line using `sed`:


```
# Append the cgroups and swap options to the kernel command line
# Note the space before "cgroup_enable=cpuset", to add a space after the last existing item on the line
$ sudo sed -i '$ s/$/ cgroup_enable=cpuset cgroup_enable=memory cgroup_memory=1 swapaccount=1/' /boot/firmware/cmdline.txt
```

The **sed** command matches the termination of the line (represented by the first `$`), replacing it with the options listed (it effectively appends the options to the line).

With these changes, Docker and the kernel should be configured as needed for Kubernetes. Reboot the Raspberry Pis, and when they come back up, check the output of `docker info` again. The `Cgroups driver` is now `systemd`, and the warnings are gone.

#### Allow iptables to see bridged traffic

According to the documentation, Kubernetes needs iptables to be configured to see bridged network traffic. You can do this by changing the `sysctl` config:


```
# Enable net.bridge.bridge-nf-call-iptables and -iptables6
cat &lt;&lt;EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
$ sudo sysctl --system
```

#### Install the Kubernetes packages for Ubuntu

Since you are using Ubuntu, you can install the Kubernetes packages from the Kubernetes.io Apt repository. There is not currently a repository for Ubuntu 20.04 (Focal), but Kubernetes 1.18.2 is available in the last Ubuntu LTS repository: Ubuntu 18.04 (Xenial). The latest Kubernetes packages can be installed from there.

Add the Kubernetes repo to Ubuntu's sources:


```
# Add the packages.cloud.google.com atp key
$ curl -s <https://packages.cloud.google.com/apt/doc/apt-key.gpg> | sudo apt-key add -

# Add the Kubernetes repo
cat &lt;&lt;EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb <https://apt.kubernetes.io/> kubernetes-xenial main
EOF
```

When Kubernetes adds a Focal repository—perhaps when the next Kubernetes version is released—make sure to switch to it.

With the repository added to the sources list, install the three required Kubernetes packages: kubelet, kubeadm, and kubectl:


```
# Update the apt cache and install kubelet, kubeadm, and kubectl
# (Output omitted)
$ sudo apt update &amp;&amp; sudo apt install -y kubelet kubeadm kubectl
```

Finally, use the `apt-mark hold` command to disable regular updates for these three packages. Upgrades to Kubernetes need more hand-holding than is possible with the general update process and will require manual attention:


```
# Disable (mark as held) updates for the Kubernetes packages
$ sudo apt-mark hold kubelet kubeadm kubectl
kubelet set on hold.
kubeadm set on hold.
kubectl set on hold.
```

That is it for the host configuration! Now you can move on to setting up Kubernetes itself.

### Create a Kubernetes cluster

With the Kubernetes packages installed, you can continue on with creating a cluster. Before getting started, you need to make some decisions. First, one of the Raspberry Pis needs to be designated the Control Plane (i.e., primary) node. The remaining nodes will be designated as compute nodes.

You also need to pick a network [CIDR][6] to use for the pods in the Kubernetes cluster. Setting the `pod-network-cidr` during the cluster creation ensures that the `podCIDR` value is set and can be used by the Container Network Interface (CNI) add-on later. This exercise uses the [Flannel][7] CNI. The CIDR you pick should not overlap with any CIDR currently used within your home network nor one managed by your router or DHCP server. Make sure to use a subnet that is larger than you expect to need: there are ALWAYS more pods than you initially plan for! In this example, I will use 10.244.0.0/16, but pick one that works for you.

With those decisions out of the way, you can initialize the Control Plane node. SSH or otherwise log into the node you have designated for the Control Plane.

#### Initialize the Control Plane

Kubernetes uses a bootstrap token to authenticate nodes being joined to the cluster. This token needs to be passed to the `kubeadm init` command when initializing the Control Plane node. Generate a token to use with the `kubeadm token generate` command:


```
# Generate a bootstrap token to authenticate nodes joining the cluster
$ TOKEN=$(sudo kubeadm token generate)
$ echo $TOKEN
d584xg.xupvwv7wllcpmwjy
```

You are now ready to initialize the Control Plane, using the `kubeadm init` command:


```
# Initialize the Control Plane
# (output omitted)
$ sudo kubeadm init --token=${TOKEN} --kubernetes-version=v1.18.2 --pod-network-cidr=10.244.0.0/16
```

If everything is successful, you should see something similar to this at the end of the output:


```
Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  <https://kubernetes.io/docs/concepts/cluster-administration/addons/>

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 192.168.2.114:6443 --token zqqoy7.9oi8dpkfmqkop2p5 \
    --discovery-token-ca-cert-hash sha256:71270ea137214422221319c1bdb9ba6d4b76abfa2506753703ed654a90c4982b
```

Make a note of two things: first, the Kubernetes `kubectl` connection information has been written to `/etc/kubernetes/admin.conf`. This kubeconfig file can be copied to `~/.kube/config`, either for root or a normal user on the master node or to a remote machine. This will allow you to control your cluster with the `kubectl` command.

Second, the last line of the output starting with `kubernetes join` is a command you can run to join more nodes to the cluster.

After copying the new kubeconfig to somewhere your user can use it, you can validate that the Control Plane has been installed with the `kubectl get nodes` command:


```
# Show the nodes in the Kubernetes cluster
# Your node name will vary
$ kubectl get nodes
NAME         STATUS   ROLES    AGE     VERSION
elderberry   Ready    master   7m32s   v1.18.2
```

#### Install a CNI add-on

A CNI add-on handles configuration and cleanup of the pod networks. As mentioned, this exercise uses the Flannel CNI add-on. With the `podCIDR` value already set, you can just download the Flannel YAML and use `kubectl apply` to install it into the cluster. This can be done on one line using `kubectl apply -f -` to take the data from standard input. This will create the ClusterRoles, ServiceAccounts, and DaemonSets (etc.) necessary to manage the pod networking.

Download and apply the Flannel YAML data to the cluster:


```
# Download the Flannel YAML data and apply it
# (output omitted)
$ curl -sSL <https://raw.githubusercontent.com/coreos/flannel/v0.12.0/Documentation/kube-flannel.yml> | kubectl apply -f -
```

#### Join the compute nodes to the cluster

With the CNI add-on in place, it is now time to add compute nodes to the cluster. Joining the compute nodes is just a matter of running the `kubeadm join` command provided at the end of the `kube init` command run to initialize the Control Plane node. For the other Raspberry Pis you want to join your cluster, log into the host, and run the command:


```
# Join a node to the cluster - your tokens and ca-cert-hash will vary
$ sudo kubeadm join 192.168.2.114:6443 --token zqqoy7.9oi8dpkfmqkop2p5 \
    --discovery-token-ca-cert-hash sha256:71270ea137214422221319c1bdb9ba6d4b76abfa2506753703ed654a90c4982b
```

Once you have completed the join process on each node, you should be able to see the new nodes in the output of `kubectl get nodes`:


```
# Show the nodes in the Kubernetes cluster
# Your node name will vary
$ kubectl get nodes
NAME         STATUS   ROLES    AGE     VERSION
elderberry   Ready    master   7m32s   v1.18.2
gooseberry    Ready    &lt;none&gt;   2m39s   v1.18.2
huckleberry   Ready    &lt;none&gt;   17s     v1.18.2
```

#### Validate the cluster

At this point, you have a fully working Kubernetes cluster. You can run pods, create deployments and jobs, etc. You can access applications running in the cluster from any of the nodes in the cluster using [Services][8]. You can achieve external access with a NodePort service or ingress controllers.

To validate that the cluster is running, create a new namespace, deployment, and service, and check that the pods running in the deployment respond as expected. This deployment uses the `quay.io/clcollins/kube-verify:01` image—an Nginx container listening for requests (actually, the same image used in the article [_Add nodes to your private cloud using Cloud-init_][9]). You can view the image Containerfile [here][10].

Create a namespace named `kube-verify` for the deployment:


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
kube-verify       Active   19s
```

Now, create a deployment in the new namespace:


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

Kubernetes will now start creating the deployment, consisting of three pods, each running the `quay.io/clcollins/kube-verify:01` image. After a minute or so, the new pods should be running, and you can view them with `kubectl get all -n kube-verify` to list all the resources created in the new namespace:


```
# Check the resources that were created by the deployment
$ kubectl get all -n kube-verify
NAME                               READY   STATUS              RESTARTS   AGE
pod/kube-verify-5f976b5474-25p5r   0/1     Running             0          46s
pod/kube-verify-5f976b5474-sc7zd   1/1     Running             0          46s
pod/kube-verify-5f976b5474-tvl7w   1/1     Running             0          46s

NAME                          READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/kube-verify   3/3     3            3           47s

NAME                                     DESIRED   CURRENT   READY   AGE
replicaset.apps/kube-verify-5f976b5474   3         3         3       47s
```

You can see the new deployment, a replicaset created by the deployment, and three pods created by the replicaset to fulfill the `replicas: 3` request in the deployment. You can see the internals of Kubernetes are working.

Now, create a Service to expose the Nginx "application" (or, in this case, the Welcome page) running in the three pods. This will act as a single endpoint through which you can connect to the pods:


```
# Create a service for the deployment
$ cat &lt;&lt;EOF | kubectl create -f -
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
EOF
service/kube-verify created
```

With the service created, you can examine it and get the IP address for your new service:


```
# Examine the new service
$ kubectl get -n kube-verify service/kube-verify
NAME          TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
kube-verify   ClusterIP   10.98.188.200   &lt;none&gt;        80/TCP    30s
```

You can see that the `kube-verify` service has been assigned a ClusterIP (internal to the cluster only) of `10.98.188.200`. This IP is reachable from any of your nodes, but not from outside of the cluster. You can verify the containers inside your deployment are working by connecting to them at this IP:


```
# Use curl to connect to the ClusterIP:
# (output truncated for brevity)
$ curl 10.98.188.200
&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "[http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"\&gt;][11]

&lt;html xmlns="<http://www.w3.org/1999/xhtml>" xml:lang="en" lang="en"&gt;
&lt;head&gt;
```

Success! Your service is running and Nginx inside the containers is responding to your requests.

At this point, you have a running Kubernetes cluster on your Raspberry Pis with a CNI add-on (Flannel) installed and a test deployment and service running an Nginx webserver. In the large public clouds, Kubernetes has different ingress controllers to interact with different solutions, such as the recently-covered [Skipper][12] project. Similarly, private clouds have ingress controllers for interacting with hardware load balancer appliances (like F5 Networks' load balancers) or Nginx and HAProxy controllers for handling traffic coming into the nodes.

In a future article, I will tackle exposing services in the cluster to the outside world by installing your own ingress controller. I will also look at dynamic storage provisioners and StorageClasses for allocating persistent storage for applications, including making use of the NFS server you set up in a previous article, [_Turn your Raspberry Pi homelab into a network filesystem_][13], to create on-demand storage for your pods.

### Go forth, and Kubernetes

"Kubernetes" (κυβερνήτης) is Greek for pilot—but does that mean the individual who steers a ship as well as the action of guiding the ship? Eh, no. "Kubernan" (κυβερνάω) is Greek for "to pilot" or "to steer," so go forth and Kubernan, and if you see me out at a conference or something, give me a pass for trying to verb a noun. From another language. That I don't speak.

Disclaimer: As mentioned, I don't read or speak Greek, especially the ancient variety, so I'm choosing to believe something I read on the internet. You know how that goes. Take it with a grain of salt, and give me a little break since I didn't make an "It's all Greek to me" joke. However, just mentioning it, I, therefore, was able to make the joke without actually making it, so I'm either sneaky or clever or both. Or, neither. I didn't claim it was a _good_ joke.

So, go forth and pilot your containers like a pro with your own Kubernetes container service in your private cloud at home! As you become more comfortable, you can modify your Kubernetes cluster to try different options, like the aforementioned ingress controllers and dynamic StorageClasses for persistent volumes.

This continuous learning is at the heart of [DevOps][14], and the continuous integration and delivery of new services mirrors the agile methodology, both of which we have embraced as we've learned to deal with the massive scale enabled by the cloud and discovered our traditional practices were unable to keep pace.

Look at that! Technology, policy, philosophy, a _tiny_ bit of Greek, and a terrible meta-joke, all in one article!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/kubernetes-raspberry-pi

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/raspberrypi_cartoon.png?itok=m3TcBONJ (Cartoon graphic of Raspberry Pi board)
[2]: https://opensource.com/resources/what-is-kubernetes
[3]: https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/
[4]: https://opensource.com/article/20/5/disk-image-raspberry-pi
[5]: https://en.wikipedia.org/wiki/Cgroups
[6]: https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing
[7]: https://github.com/coreos/flannel
[8]: https://kubernetes.io/docs/concepts/services-networking/service/
[9]: https://opensource.com/article/20/5/create-simple-cloud-init-service-your-homelab
[10]: https://github.com/clcollins/homelabCloudInit/blob/master/simpleCloudInitService/data/Containerfile
[11]: http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"\>
[12]: https://opensource.com/article/20/4/http-kubernetes-skipper
[13]: https://opensource.com/article/20/5/nfs-raspberry-pi
[14]: https://opensource.com/tags/devops
