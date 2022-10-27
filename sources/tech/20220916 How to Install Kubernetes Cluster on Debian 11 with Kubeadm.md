[#]: subject: "How to Install Kubernetes Cluster on Debian 11 with Kubeadm"
[#]: via: "https://www.linuxtechi.com/install-kubernetes-cluster-on-debian/"
[#]: author: "Pradeep Kumar https://www.linuxtechi.com/author/pradeep/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Kubernetes Cluster on Debian 11 with Kubeadm
======
Are you looking for an easy guide for installing Kubernetes Cluster on Debian 11 (Bullseye)?

The step-by-step guide on this page will demonstrate you how to install Kubernetes cluster on Debian 11 with Kubeadm utility.

Kubernetes (k8s) cluster contains master and worker nodes which are used to run containerized applications. Master node works as control plan and worker nodes offers environment for actual workload.

##### Prerequisites

* Minimal Installed Debian 11
* 2 CPU / vCPU
* 2 GB RAM
* 20 GB free disk space
* Sudo User with Admin rights
* Stable Internet Connectivity

##### Lab Setup

For the demonstration, I am using three Debian 11 systems with following details,

* Master Node (k8s-master) – 192.168.1.236
* Worker Node 1 (k8s-worker1) – 192.168.1.237
* Worker Node 2 (k8s-worker2) – 192.168.1.238

Without any further delay, let’s jump into the installation steps.

### 1 ) Set Host Name and update /etc/hosts file

Use hostnamectl command to set the hostname on master and worker nodes.

```
$ sudo hostnamectl set-hostname "k8s-master"       // Run on master node
$ sudo hostnamectl set-hostname "k8s-worker1"      // Run on 1st worker node
$ sudo hostnamectl set-hostname "k8s-worker2"      // Run on 2nd worker node
```

Add the following entries in /etc/hosts file on all the nodes,

```
192.168.1.236       k8s-master
192.168.1.237       k8s-worker1
192.168.1.238       k8s-worker2
```

### 2) Disable Swap on all nodes

For kubelet to work smoothly, it is recommended to disable swap. Run following commands on master and worker nodes to turn off swap.

```
$ sudo swapoff -a
$ sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
```

### 3) Configure Firewall Rules for Kubernetes Cluster

In case, OS firewall is enabled on your debian systems then allow following ports on master and worker nodes respectively.

On Master node, run

```
$ sudo ufw allow 6443/tcp
$ sudo ufw allow 2379/tcp
$ sudo ufw allow 2380/tcp
$ sudo ufw allow 10250/tcp
$ sudo ufw allow 10251/tcp
$ sudo ufw allow 10252/tcp
$ sudo ufw allow 10255/tcp
$ sudo ufw reload
```

On Worker Nodes,

```
$ sudo ufw allow 10250/tcp
$ sudo ufw allow 30000:32767/tcp
$ sudo ufw reload
```

Note: If firewall is disabled on your Debian 11 systems, then you can skip this step.

### 4) Install Containerd run time on all nodes

Containerd is the industry standard container run time, we must install containerd on all master and worker nodes.

Before installing containerd, set the following kernel parameters on all the nodes.

```
$ cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

$ sudo modprobe overlay
$ sudo modprobe br_netfilter

$ cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-k8s.conf
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF
```

To make above changes into the effect, run

```
$ sudo sysctl --system
```

Now, install conatinerd by running following apt command on all the nodes.

```
$ sudo apt  update
$ sudo apt -y install containerd
```

Configure containerd so that it works with Kubernetes, run beneath command on all the nodes

```
$ containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
```

Set cgroupdriver to systemd on all the nodes,

Edit the file ‘/etc/containerd/config.toml’ and look for the section ‘[plugins.”io.containerd.grpc.v1.cri”.containerd.runtimes.runc.options]’ and add SystemdCgroup = true

```
$ sudo vi /etc/containerd/config.toml
```

![systemdCgroup-true-containerd-config-toml][1]

Save and close the file.

Restart and enable containerd service on all the nodes,

```
$ sudo systemctl restart containerd
$ sudo systemctl enable containerd
```

### 5) Enable Kubernetes Apt Repository

Enable Kubernetes apt repository on all the nodes, run

```
$ sudo apt install gnupg gnupg2 curl software-properties-common -y
$ curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/cgoogle.gpg
$ sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
```

### 6) Install Kubelet, Kubectl and Kubeadm on all nodes

Run the following apt commands on all the nodes to install Kubernetes cluster components like kubelet, kubectl and Kubeadm.

```
$ sudo apt update
$ sudo apt install kubelet kubeadm kubectl -y
$ sudo apt-mark hold kubelet kubeadm kubectl
```

### 7) Create Kubernetes Cluster with Kubeadm

Now, we are all set to create Kubernetes cluster, run following command only from master node,

```
$ sudo kubeadm init --control-plane-endpoint=k8s-master
```

Output,

![Kubernetes-Control-Plane-Initialization-Debian11][2]

Above output confirms that control plane has been initialized successfully. In the output, we have commands for regular user for interacting with the cluster and also the command to join any worker node to this cluster.

To start interacting with cluster, run following commands on master node,

```
$ mkdir -p $HOME/.kube
$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
$ sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

Run following kubectl command to get nodes and cluster information,

```
$ kubectl get nodes
$ kubectl cluster-info
```

Output of above commands,

![Nodes-Cluster-Info-Kubectl][3]

Join both the worker nodes to the cluster by running ‘Kubeadm join’ command.

Note: Copy the exact command from the output of ‘kubeadm init’ command. In my case, following is the command

```
$ sudo kubeadm join k8s-master:6443 --token ta622t.enl212euq7z87mgj \

   --discovery-token-ca-cert-hash sha256:2be58f54458d0e788c96b8841f811069019161f9a3dd8502a38c773e5c6ead17
```

Output from Worker Node 1,

![Worker-Node1-Join-Kunernetes-Cluster][4]

Output from Worker Nod 2 ,

![Worker-Node2-Join-Kubernetes-Cluster][5]

Check the nodes status by running following command from master node,

```
$ kubectl get nodes
NAME          STATUS     ROLES           AGE     VERSION
k8s-master    NotReady   control-plane   23m     v1.25.0
k8s-worker1   NotReady   <none>          9m27s   v1.25.0
k8s-worker2   NotReady   <none>          2m19s   v1.25.0
$
```

To make nodes status ready, we must install POD network addons like Calico or flannel.

### 8) Install Calico Pod Network Addon

On the master node, run beneath command to install calico,

```
$ kubectl apply -f https://projectcalico.docs.tigera.io/manifests/calico.yaml
```

Output,

![Install-calico-pod-network-addon-debian11][6]

Allow Calico ports in OS firewall, run beneath ufw commands on all the nodes,

```
$ sudo ufw allow 179/tcp
$ sudo ufw allow 4789/udp
$ sudo ufw allow 51820/udp
$ sudo ufw allow 51821/udp
$ sudo ufw allow 4789/udp
$ sudo ufw reload
```

Verify the status of Calico pods, run

```
$ kubectl get pods -n kube-system
```

![Calico-Pods-Status-Kuberenetes-Debian11][7]

Perfect, now check nodes status again,

![Nodes-status-after-calico-Installation][8]

Great, output above confirms that master and worker nodes are in ready status. Now, this cluster is ready for the workload.

### 9) Test Kubernetes Cluster Installation

To test Kubernetes cluster installation, let’s try to deploy nginx based application via deployment. Run beneath commands,

```
$ kubectl create deployment nginx-app --image=nginx --replicas 2
$ kubectl expose deployment nginx-app --name=nginx-web-svc --type NodePort --port 80 --target-port 80
$ kubectl describe svc nginx-web-svc
```

Output of above commands,

![Nginx-Based-App-Kubernetes-Cluster-Debian11][9]

Try to access the nginx based application using following curl command along with the nodeport 30036.

Note : In the curl command we can use either of worker node’s hostname.

```
$ curl http://k8s-worker1:30036
```

![Access-Nginx-Based-App-via-NodePort-Kubernetes-Debian11][10]

Above command’s output confirm that we are able to access our nginx based application.

That’s all from this guide, I hope you have found it informative and able to install Kubernetes cluster on Debian 11 smoothly. Kindly do post your queries and feedback in below comments section.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-kubernetes-cluster-on-debian/

作者：[Pradeep Kumar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lkxed
[1]: https://www.linuxtechi.com/wp-content/uploads/2022/09/systemdCgroup-true-containerd-config-toml.png
[2]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Kubernetes-Control-Plane-Initialization-Debian11.png
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Nodes-Cluster-Info-Kubectl.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Worker-Node1-Join-Kunernetes-Cluster.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Worker-Node2-Join-Kubernetes-Cluster.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Install-calico-pod-network-addon-debian11.png
[7]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Calico-Pods-Status-Kuberenetes-Debian11.png
[8]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Nodes-status-after-calico-Installation.png
[9]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Nginx-Based-App-Kubernetes-Cluster-Debian11.png
[10]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Access-Nginx-Based-App-via-NodePort-Kubernetes-Debian11.png
