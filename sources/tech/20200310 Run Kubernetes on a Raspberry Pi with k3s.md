[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Run Kubernetes on a Raspberry Pi with k3s)
[#]: via: (https://opensource.com/article/20/3/kubernetes-raspberry-pi-k3s)
[#]: author: (Lee Carpenter https://opensource.com/users/carpie)

Run Kubernetes on a Raspberry Pi with k3s
======
Create your own three-node Kubernetes cluster with these easy-to-follow
instructions.
![A ship wheel with someone steering][1]

For a long time, I've been interested in building a [Kubernetes][2] cluster out of a stack of inexpensive Raspberry Pis. Following along with various tutorials on the web, I was able to get Kubernetes installed and working in a three Pi cluster. However, the RAM and CPU requirements on the master node overwhelmed my Pi. This caused poor performance when doing various Kubernetes tasks. It also made an in-place upgrade of Kubernetes impossible.

As a result, I was very excited to see the [k3s project][3]. K3s is billed as a lightweight Kubernetes for use in resource-constrained environments. It is also optimized for ARM processors. This makes running a Raspberry Pi-based Kubernetes cluster much more feasible. In fact, we are going to create one in this article.

### Materials needed

To create the Kubernetes cluster described in this article, we are going to need:

  * At least one Raspberry Pi (with SD card and power adapter)
  * Ethernet cables
  * A switch or router to connect all our Pis together



We will be installing k3s from the internet, so they will need to be able to access the internet through the router.

### An overview of our cluster

For this cluster, we are going to use three Raspberry Pis. The first we'll name **kmaster** and assign a static IP of 192.168.0.50 (since our local network is 192.168.0.0/24). The first worker node (the second Pi), we'll name **knode1** and assign an IP of 192.168.0.51. The final worker node we'll name **knode2** and assign an IP of 192.168.0.52.

Obviously, if you have a different network layout, you may use any network/IPs you have available. Just substitute your own values anywhere IPs are used in this article.

So that we don't have to keep referring to each node by IP, let's add their host names to our **/etc/hosts** file on our PC.


```
echo -e "192.168.0.50\tkmaster" | sudo tee -a /etc/hosts
echo -e "192.168.0.51\tknode1" | sudo tee -a /etc/hosts
echo -e "192.168.0.52\tknode2" | sudo tee -a /etc/hosts
```

### Installing the master node

Now we're ready to install the master node. The first step is to install the latest Raspbian image. I am not going to explain that here, but I have a [detailed article][4] on how to do this if you need it. So please go install Raspbian, enable the SSH server, set the hostname to **kmaster**, and assign a static IP of 192.168.0.50.

Now that Raspbian is installed on the master node, let's boot our master Pi and **ssh** into it:


```
`ssh pi@kmaster`
```

Now we're ready to install **k3s**. On the master Pi, run:


```
`curl -sfL https://get.k3s.io | sh -`
```

When the command finishes, we already have a single node cluster set up and running! Let's check it out. Still on the Pi, run:


```
`sudo kubectl get nodes`
```

You should see something similar to:


```
NAME     STATUS   ROLES    AGE    VERSION
kmaster  Ready    master   2m13s  v1.14.3-k3s.1
```

### Extracting the join token

We want to add a couple of worker nodes. When installing **k3s** on those nodes we will need a join token. The join token exists on the master node's filesystem. Let's copy that and save it somewhere we can get to it later:


```
`sudo cat /var/lib/rancher/k3s/server/node-token`
```

### Installing the worker nodes

Grab some SD cards for the two worker nodes and install Raspbian on each. For one, set the hostname to **knode1** and assign an IP of 192.168.0.51. For the other, set the hostname to **knode2** and assign an IP of 192.168.0.52. Now, let's install **k3s**.

Boot your first worker node and **ssh** into it:


```
`ssh pi@knode1`
```

On the Pi, we'll install **k3s** as before, but we will give the installer extra parameters to let it know that we are installing a worker node and that we'd like to join the existing cluster:


```
curl -sfL <http://get.k3s.io> | K3S_URL=<https://192.168.0.50:6443> \
K3S_TOKEN=join_token_we_copied_earlier sh -
```

Replace **join_token_we_copied_earlier** with the token from the "Extracting the join token" section. Repeat these steps for **knode2**.

### Access the cluster from our PC

It'd be annoying to have to **ssh** to the master node to run **kubectl** anytime we wanted to inspect or modify our cluster. So, we want to put **kubectl** on our PC. But first, let's get the configuration information we need from our master node. **Ssh** into **kmaster** and run:


```
`sudo cat /etc/rancher/k3s/k3s.yaml`
```

Copy this configuration information and return to your PC. Make a directory for the config:


```
`mkdir ~/.kube`
```

Save the copied configuration as **~/.kube/config**. Now edit the file and change the line:


```
`server: https://localhost:6443`
```

to be:


```
`server: https://kmaster:6443`
```

For security purpose, limit the file's read/write permissions to just yourself:


```
`chmod 600 ~/.kube/config`
```

Now let's install **kubectl** on our PC (if you don't already have it). The Kubernetes site has [instructions][5] for doing this for various platforms. Since I'm running Linux Mint, an Ubuntu derivative, I'll show the Ubuntu instructions here:


```
sudo apt update &amp;&amp; sudo apt install -y apt-transport-https
curl -s <https://packages.cloud.google.com/apt/doc/apt-key.gpg> | sudo apt-key add -
echo "deb <https://apt.kubernetes.io/> kubernetes-xenial main" | \
sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt update &amp;&amp; sudo apt install kubectl
```

If you're not familiar, the above commands add a Debian repository for Kubernetes, grab its GPG key for security, and then update the list of packages and install **kubectl**. Now, we'll get notifications of any updates for **kubectl** through the standard software update mechanism.

Now we can check out our cluster from our PC! Run:


```
`kubectl get nodes`
```

You should see something like:


```
NAME     STATUS  ROLES   AGE   VERSION
kmaster  Ready   master  12m   v1.14.3-k3s.1
knode1   Ready   worker  103s  v1.14.3-k3s.1
knode1   Ready   worker  103s  v1.14.3-k3s.1
```

Congratulations! You have a working 3-node Kubernetes cluster!

### The k3s bonus

If you run **kubectl get pods --all-namespaces**, you will see some extra pods for [Traefik][6]. Traefik is a reverse proxy and load balancer that we can use to direct traffic into our cluster from a single entry point. Kubernetes allows for this but doesn't provide such a service directly. Having Traefik installed by default is a nice touch by Rancher Labs. This makes a default **k3s** install fully complete and immediately usable!

We're going to explore using Traefik through Kubernetes **ingress** rules and deploy all kinds of goodies to our cluster in future articles. Stay tuned!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/kubernetes-raspberry-pi-k3s

作者：[Lee Carpenter][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/carpie
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_wheel_gear_devops_kubernetes.png?itok=xm4a74Kv (A ship wheel with someone steering)
[2]: https://opensource.com/resources/what-is-kubernetes
[3]: https://k3s.io/
[4]: https://carpie.net/articles/headless-pi-with-static-ip-wired-edition
[5]: https://kubernetes.io/docs/tasks/tools/install-kubectl/
[6]: https://traefik.io/
