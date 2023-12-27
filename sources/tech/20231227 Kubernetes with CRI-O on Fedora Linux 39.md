[#]: subject: "Kubernetes with CRI-O on Fedora Linux 39"
[#]: via: "https://fedoramagazine.org/kubernetes-with-cri-o-on-fedora-linux-39/"
[#]: author: "Roman Gherta https://fedoramagazine.org/author/romangherta/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Kubernetes with CRI-O on Fedora Linux 39
======

![][1]

Photo by [Christian Pfeifer][2] on [Unsplash][3] (cropped)

[Kubernetes][4] is a self-healing and scalable container orchestration platform. It abstracts away the underlying infrastructure and makes life easier for administrators and developers by improving productivity, deployment lifecycle, and by streamlining devops processes. The goal of this article is to show how to deploy a Kubernetes cluster on Fedora Linux 39 machines using CRI-O as a container engine.

### 1\. Preparing the cluster nodes

Both master and worker nodes must be prepared before installing Kubernetes. Preparations ensure proper capabilities, proper kernel modules are loaded, swap, cgroups version and other prerequisites to installing the cluster.

#### Kernel modules

Kubernetes, in its standard configuration, requires the following kernel modules and configuration values for bridging network traffic, overlaying filesystems, and forwarding network packets. An adequate size for user and pid namespaces for userspace containers is also provided in the below configuration example.

```

    [user@fedora ~]$ sudo cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
    overlay
    br_netfilter
    EOF

    [user@fedora ~]$ systemctl restart systemd-modules-load.service

    [user@fedora ~]$  cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
    net.bridge.bridge-nf-call-iptables  = 1
    net.bridge.bridge-nf-call-ip6tables = 1
    net.ipv4.ip_forward                 = 1
    user.max_pid_namespaces             = 1048576
    user.max_user_namespaces            = 1048576
    EOF

    [user@fedora ~]$  sudo sysctl --system

```

#### Installing CRI-O

Container Runtime Interface OCI is an opensource container engine dedicated to Kubernetes. The engine implements the Kubernetes grpc protocol (CRI) and is compatible with any low-level OCI container runtime. All supported runtimes must be installed separately on the host. It is important to note that CRI-O is version-locked with Kubernetes. We will deploy cri-o:1.27 with kubernetes:1.27 on fedora-39.

```

    [user@fedora ~] sudo dnf install -y cri-o cri-tools

```

To check what the package installed:

```

    [user@fedora ~]$ rpm -qRc cri-o
    config(cri-o) = 0:1.27.1-2.fc39conmon >= 2.0.2-1
    container-selinux
    containers-common >= 1:0.1.31-14
    libseccomp.so.2()(64bit)
    /etc/cni/net.d/100-crio-bridge.conflist
    /etc/cni/net.d/200-loopback.conflist
    /etc/crictl.yaml
    /etc/crio/crio.conf
    ...

```

Notice it uses _conmon_ for monitoring and _container-selinux_ policies. Also, the main configuration file is _crio.conf_ and it added some default networking plugins to /etc/cni. For networking, this guide will not rely on the default CRI-O plugins; though it is possible to use them.

```

    [user@fedora ~]$ sudo rm -rf /etc/cni/net.d/*

```

Besides the above configuration files, CRI-O uses the same image and storage libraries as Podman. So you can use the same configuration files for registries and signature verification policies as you would when using Podman. See the CRI-O [README][5] for examples.

#### Cgroups v2

Recent versions of Fedora Linux have cgroups v2 enabled by default. Cgroups v2 brings better control over memory and CPU resource management. With cgroups v1, a pod would receive a kill signal when a container exceeds the memory limit. With cgroups v2, memory allocation is “throttled” by systemd. See the cgroupfsv2 docs for more details about the changes.

```

    [user@fedora ~]$ stat -f /sys/fs/cgroup/
      File: "/sys/fs/cgroup/"
        ID: 0        Namelen: 255     Type: cgroup2fs

```

#### Additional runtimes

In Fedora Linux, systemd is both the init system and the default cgroups driver/manager. While checking _crio.conf_ we notice this version already uses systemd. If no other cgroups driver is explicitly passed to kubeadm, then kubelet will also use systemd by default in version 1.27. We will set systemd explicitly, nonetheless, and change the default runtime to _crun_ which is faster and has a smaller memory footprint. We will also define each new runtime block as shown below. We will use configuration drop-in files and make sure the files are labeled with the proper selinux context.

```

    [user@fedora ~]$ sudo dnf install -y crun

    [user@fedora ~]$ sudo sed -i 's/# cgroup_manager/cgroup_manager/g' /etc/crio/crio.conf
    [user@fedora ~]$ sudo sed -i 's/# default_runtime = "runc"/default_runtime = "crun"/g' /etc/crio/crio.conf

    [user@fedora ~]$ sudo mkdir /etc/crio/crio.conf.d
    [user@fedora ~]$ sudo tee -a /etc/crio/crio.conf.d/90-crun <<CRUN
    [crio.runtime.runtimes.crun]
    runtime_path = "/usr/bin/crun"
    runtime_type = "oci"
    CRUN


    [user@fedora ~]$ echo "containers:1000000:1048576" | sudo tee -a /etc/subuid
    [user@fedora ~]$ echo "containers:1000000:1048576" | sudo tee -a /etc/subgid
    [user@fedora ~]$ sudo tee -a /etc/crio/crio.conf.d/91-userns <<USERNS
    [crio.runtime.workloads.userns]
    activation_annotation = "io.kubernetes.cri-o.userns-mode"
    allowed_annotations = ["io.kubernetes.cri-o.userns-mode"]
    USERNS

    [user@fedora ~]$ sudo chcon -R --reference=/etc/crio/crio.conf  /etc/crio/crio.conf.d/

    [user@fedora ~]$ sudo ls -laZ /etc/crio/crio.conf.d/
    root root system_u:object_r:container_config_t:s0  70 Nov  1 19:26 .
    root root system_u:object_r:container_config_t:s0  40 Nov  1 11:12 ..
    root root system_u:object_r:container_config_t:s0  81 Nov  1 11:14 90-crun
    root root system_u:object_r:container_config_t:s0 148 Dec 11 13:20 91-user

```

_crio.conf_ respects the [TOML][6] format and is easily managed and maintained. The help/man pages are also detailed. After you change the configuration, enable the service.

```

    [user@fedora ~]$ sudo systemctl daemon-reload
    [user@fedora ~]$ sudo systemctl enable crio --now

```

#### Disable swap

The latest Fedora Linux versions enable [swap-on-zram][7] by default. zram creates an emulated device that uses RAM as storage and compresses memory pages. It is faster than traditional disk partitions. You can use _zramctl_ to inspect and configure your zram device(s). However, the device’s initialization and mounting are performed by systemd on system startup as configured in the _zram-generator.conf_ file.

```

    [user@fedora ~]$ lsblk
    NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    zram0  251:0    0  3.8G  0 disk [SWAP]
    vda    252:0    0   15G  0 disk

    [user@fedora ~]$ sudo swapoff -a
    [user@fedora ~]$ sudo zramctl --reset /dev/zram0
    [user@fedora ~]$ sudo dnf -y remove zram-generator-defaults

```

#### Firewall rules

Keep the firewall enabled and open only the necessary ports in accordance with the official [docs][8]. We have a set of rules for the Control Planes nodes.

```

    [user@fedora ~]$ sudo firewall-cmd --set-default-zone=internal
    [user@fedora ~]$ sudo firewall-cmd --permanent \
    --add-port=6443/tcp --add-port=2379-2380/tcp \
    --add-port=10250/tcp --add-port=10259/tcp \
    --add-port=10257/tcp
    [user@fedora ~]$ sudo firewall-cmd --reload

```

For Worker nodes, the following configuration must be used given the default service port range.

```

    [user@fedora ~]$ sudo firewall-cmd --set-default-zone=internal
    [user@fedora ~]$ sudo firewall-cmd --permanent  \
    --add-port=10250/tcp --add-port=30000-32767/tcp
    [user@fedora ~]$ sudo firewall-cmd --reload

```

Please note we did not discuss network topology. In such discussions, control plane nodes and worker nodes are on different subnets. Each subnet has a interface that connects all hosts. VMs could have multiple interfaces and/or the administrator might want to associate a specific interface with a specific zone and open ports on that interface. In such cases you will explicitly provide the zone argument to the above commands.

#### The DNS service

Fedora Linux 39 comes with systemd-resolved configured as its DNS resolver. In this configuration the user has access to a local stub file that contains a 127.0.0.53 entry that directs local DNS clients to systemd-resolved.

```

    lrwxrwxrwx. 1 root root 39 Sep 11  2022 /etc/resolv.conf -> ../run/systemd/resolve/stub-resolv.conf

```

The reference to 127.0.0.53 triggers a coredns loop plugin error in Kubernetes. A list of next-hop DNS servers is maintained by systemd in /run/systemd/resolve/resolv.conf. According to the systemd-resolved man page, the /etc/resolv.conf file can be symlinked to /run/systemd/resolve/resolv.conf so that local DNS clients will bypass systemd-resolved and talk directly to the DNS servers. For some DNS clients, however, bypassing systemd-resolved might not be desirable.

A better approach is to configure kubelet to use the resolv.conf file. Configuring kubelet to reference the alternate resolv.conf will be demonstrated in the following sections.

#### Kubernetes packages

We will use kubeadm that is a mature package to easily and quickly install production-grade Kubernetes.

```

    [user@fedora ~]$ sudo dnf install -y kubernetes-kubeadm kubernetes-client

```

kubernetes-kubeadm generates a kubelet drop-in file at / _etc/systemd/system/kubelet.service.d/kubeadm.conf_. This file can be used to configure instance-specific kubelet configurations. However, the recommended approach is to use kubeadm configuration files. For example, kubeadm creates /var/lib/kubelet/kubeadm-flags.env that is referenced by the above mentioned kubelet drop-in file.

The kubelet will be started automatically by kubeadm. For now we will enable it so it persists across restarts.

```

    [user@fedora ~]$ sudo systemctl enable kubelet

```

### 2\. Initialize the Control Plane

For the installation, we pass some cluster wide configuration to kubeadm like pod and service [CIDR][9]s. For more details refer to [kubeadm configuration docs ][10] and [kubelet config docs][11].

```

    [user@fedora ~]$ cat <<CONFIG > kubeadmin-config.yaml
    ---
    apiVersion: kubeadm.k8s.io/v1beta3
    kind: InitConfiguration
    nodeRegistration:
      name: master1
      criSocket: "unix:///var/run/crio/crio.sock"
      imagePullPolicy: "IfNotPresent"
      kubeletExtraArgs:
        cgroup-driver: "systemd"
        resolv-conf: "/run/systemd/resolve/resolv.conf"
        max-pods: "4096"
        max-open-files: "20000000"
    ---
    apiVersion: kubeadm.k8s.io/v1beta3
    kind: ClusterConfiguration
    kubernetesVersion: "1.27.0"
    networking:
      podSubnet: "10.32.0.0/16"
      serviceSubnet: "172.16.16.0/22"
    controllerManager:
      extraArgs:
        node-cidr-mask-size: "20"
        allocate-node-cidrs: "true"
    ---
    CONFIG

```

In the above configuration, we have chosen different IP classes for pods and services. This is useful when debugging. Make sure they do not overlap with your node’s CIDR. To summarize the IP ranges:

  * services “172.16.16.0/22” – 1024 services cluster wide
  * pods “10.32.0.0/16” – 65536 pods cluster wide, max 4096 pods per kubelet and 20 mln open files per kubelet. For other important kubelet parameters refer to [kubelet config docs][11]. Kubelet is an important component running on the worker nodes so make sure you read the config docs carefully.



kube-controller-manager has a component called nodeipam that splits the podcidr into smaller ranges and allocates these ranges to each node via the ( _node.spec.podCIDR_ / _node.spec.podCIDRs)_ properties. Controller Manager property _‐‐node-cidr-mask-size_ defines the size of this range. By default it is /24, but if you have enough resources you can make it larger; in our case /20. This will result in 4096 pods per node with a maximum of 65536/4096=16 nodes. Adjust these properties to fit the capacity of your bare-metal server.

```

    [user@fedora ~]$ hostnamectl set-hostname master1
    [user@master1 ~]$ sudo kubeadm init --skip-token-print=true --config=kubeadmin-config.yaml

    [user@master1 ~]$ mkdir -p $HOME/.kube
    [user@master1 ~]$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    [user@master1 ~]$ sudo chown $(id -u):$(id -g) $HOME/.kube/config

```

There are newer networking plugins that leverage ebpf kernel capabilities or ovn. However, installing such plugins requires uninstalling kube-proxy and we want to maintain the deployment as standard as possible. Some of the networking plugins read the _kubeadm-config_ configmap and set up the corect CIDR values without the need to read a lot of documentation.

```

    [user@master1 ~]$ kubectl create -f https://github.com/antrea-io/antrea/releases/download/v1.14.0/antrea.yml

```

Antrea, OVN-Kubernetes are interesting CNCF projects; especially for bare-metal clusters where network speed becomes a bottleneck. It also has support for some high-speed Mellanox network cards. Check pods and svc health and whether a correct IP address was assigned.

```

    [user@master1 ~]$ kubectl get pods -A -o wide
    NAME                                 READY  IP              NODE
    antrea-agent-x2j7r                   2/2    192.168.122.3   master1
    antrea-controller-5f7764f86f-8xgkc   1/1    192.168.122.3   master1
    coredns-787d4945fb-55pdq             1/1    10.32.0.2       master1
    coredns-787d4945fb-ndn78             1/1    10.32.0.3       master1
    etcd-master1                         1/1    192.168.122.3   master1
    kube-apiserver-master1               1/1    192.168.122.3   master1
    kube-controller-manager-master1      1/1    192.168.122.3   master1
    kube-proxy-mx7ns                     1/1    192.168.122.3   master1
    kube-scheduler-master1               1/1    192.168.122.3   master1

    [user@master1 ~]$ kubectl get svc -A
    NAMESPACE     NAME         TYPE        CLUSTER-IP
    default       kubernetes   ClusterIP   172.16.16.1
    kube-system   antrea       ClusterIP   172.16.18.214
    kube-system   kube-dns     ClusterIP   172.16.16.10

    [user@master1 ~]$ kubectl describe node master1 | grep PodCIDR
    PodCIDR:                      10.32.0.0/20
    PodCIDRs:                     10.32.0.0/20

```

All pods should be running and healthy. Notice how the static pods and the daemonsets have the same IP address as the node. CoreDNS is also reading directly from the /run/systemd/resolve/resolv.conf file and not crashing.

Generate a token for joining the worker node.

```

    [user@master1 ~]$ kubeadm token create --ttl=30m --print-join-command

```

The output of this command contains details for joining the worker node.

### 3\. Join a Worker Node

We need to set the hostname and _kubeadm join_. Kubelet on this node also requires configuration. Do this at the systemd level or by using a kubeadm config file with placeholders. Replace the placeholders with the values from the previous command. The kubelet args respect the same convention as [kubelet params][12], but without leading dashes.

```

    [user@fedora ~]$ hostnamectl set-hostname worker1

    [user@worker1 ~]$ cat <<CONFIG > join-config.yaml
    ---
    apiVersion: kubeadm.k8s.io/v1beta3
    kind: JoinConfiguration
    discovery:
      bootstrapToken:
        token: <TOKEN>
        apiServerEndpoint: <MASTER-IP:PORT>
        caCertHashes: ["<HASH>"]
        timeout: 5m
    nodeRegistration:
      name: worker1
      criSocket: "unix:///var/run/crio/crio.sock"
      imagePullPolicy: "IfNotPresent"
      kubeletExtraArgs:
        cgroup-driver: "systemd"
        resolv-conf: "/run/systemd/resolve/resolv.conf"
        max-pods: "4096"
        max-open-files: "20000000"
    ---
    CONFIG

    [user@worker1 ~]$ sudo kubeadm join --config=join-config.yaml

```

From master node check the range allocated by nodeipam to both nodes:

```

    [user@master1 ~]$ kubectl describe node worker1 | grep PodCIDR
    PodCIDR:                      10.32.16.0/20
    PodCIDRs:                     10.32.16.0/20

```

Notice the cluster-wide pod CIDR — 10.32.0.0/16 — was split by Controller Manager into 10.32.0.0/20 for the first node and 10.32.16.0/20 for the second node with non-overlapping segments of 4096 IP addresses each.

### 4\. Security considerations

Run three sample pods to test the setup.

```

    [user@master1 ~]$ kubectl apply -f - <<EOF
    ---
    apiVersion: v1
    kind: Pod
    metadata:
      name: test-pod
    spec:
      containers:
      - name: fedora
        image: fedora/fedora:latest
        args: ["sleep", "infinity"]
    ---
    apiVersion: v1
    kind: Pod
    metadata:
      name: test-pod-userns-1
      annotations:
        io.kubernetes.cri-o.userns-mode: "auto:size=256"
    spec:
      containers:
      - name: fedora
        image: fedora/fedora:latest
        args: ["sleep", "infinity"]
    ---
    apiVersion: v1
    kind: Pod
    metadata:
      name: test-pod-userns-2
      annotations:
        io.kubernetes.cri-o.userns-mode: "auto:size=256"
    spec:
      containers:
      - name: fedora
        image: fedora/fedora:latest
        args: ["sleep", "infinity"]
    ---
    EOF

```

#### 4.1 Discretionary Access Control

By default, Linux’s security model is based on Discretionary Access Control (DAC). This security model is based on user identity and the filesystem ownership and permissions associated with that user.

Since containers are Linux processes, you can watch them by running the _ps_ command on your host server. Start a container process and check it using ps. The kubelet is the worker node main process and, by default, it runs as _root_ (uid=0). There is a feature gate — KubeletInUserNamespace — but it is currently in an alpha stage of development. All the other containers will run as user id **0** as well. To properly function, all the containers must mount the _/proc_ and _/sys_ pseudofilesystems and have access to some processes on the host. Under these circumstances, a rogue container process running as root could assume elevated privileges on the host. This should explain the need for isolating processes by running them as underprivileged users.

This “soft” isolation can be done via kubernetes’ spec.securityContext.(RunAsUser|RunAsGroup|fsGroup), but this method requires additional administrative work like creating and maintaining users and groups etc. This can be automated via Admission Controllers, but we discuss below a different approach using user namespaces.

User namespaces are a Linux feature that is part of the same basic DAC security model. They are enabled by default in the latest Linux versions and you might have encountered them while working with [Podman][13] or [Singularity][14].

CRI-O schedules userns workloads via the _io.kubernetes.cri-o.userns-mode: “auto:size=n”_ annotation. This annotation can be added manually to YAML files as demonstrated in the above example or automatically via an admission controller. The annotation based behavior might change. You will need to follow the version updates for Kubernetes and CRI-O.

```

    user@worker1:~$ cat /etc/subuid
    user:524288:65536
    containers:1000000:1048576

    user@worker1:~$ ps -eo pid,uid,gid,args,label | grep -E 'kubelet|sleep'
      2980      0 0 kubelet system_u:system_r:kubelet_t:s0-s0:c0.c1023
      13067     0 0 sleep   system_u:system_r:container_t:s0:c483,c911
      13078 1000000 1000000 sleep system_u:system_r:container_t:s0:c508,c675
      13105 1000256 1000256 sleep system_u:system_r:container_t:s0:c300,c755

```

Notice _kubelet_ and the _test-pod_ are running as root on the host while both _test-pod-userns_ are running as temporary dynamic user from the range “containers” defined in _/etc/subuid_ . CRI-O uses the [containers/storage][15] plugin and therefore looks for default user _containers_ to map subuid and subgids. According to current /etc/subuid file, the dynamic users will begin at UID 1000000 with a maximum of 1048576 users. The annotation assigns a range of 256 UIDs to each container. To change the defaults and mappings refer to _containers-storage.conf_ man page.

#### 4.2 Mandatory Access Control

SELinux is enabled on Fedora Linux in enforcing mode by default and it implements the Mandatory Access Control (MAC) security model. This model requires explicit rules that allow a labeled source context (process) to access a labeled target context (files|ports).

The labels have the following format as shown in the above examples:

```

    user:role:type:sensitivity-level:category-levels

```

CRI-O requires the _containers-selinux_ package. We installed Kubernetes while keeping SELinux in enforcing mode, but there are a few general scenarios that might require additional SELinux configuration:

  * Binding ports
  * Mounting storage
  * Sharing storage



##### Binding ports

Create a sample pod binding to a privileged host port. This is useful, for example, when creating ingress controllers. You will notice the rootless container was able to bind to the privileged port.

```

    [user@master1 -A ~]$ kubectl apply -f - <<EOF
    apiVersion: v1
    kind: Pod
    metadata:
      name: test-hostport
      annotations:
        io.kubernetes.cri-o.userns-mode: "auto:size=256"
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
          hostPort: 80
    EOF

    user@worker1:~$ sudo semanage port -l
    http_port_t tcp 80, 443 ...

    user@worker1:~$ sudo ss -plntZ
    Address:Port Process
    0.0.0.0:80 "crio",proc_ctx=system_u:system_r:container_runtime_t:s0

```

Port 80 (target context) is labeled _http_port_t_ and the process trying to access it (source context) is labeled _container_runtime_t_. To check specific rules that allow this and to debug potential issues, use _sesearch_. Although, in this specific example, container_t process was allowed to assume container_runtime_t domain and to bind eventually to port 80, this might not always be desirable.

```

    user@worker1:~$ sesearch -A -s container_runtime_t -t http_port_t -c tcp_socket

```

##### Mounting storage

The process _container_t_ is MCS constrained which means every new container will receive **two new random categories**. At the moment, when mounting a volume, Kubernetes is not automatically re-labelling files with these two categories. There is a community effort via features like SELinuxMountReadWriteOncePod, but you will have to follow the progress in the future versions. For this demo, we will label the files manually.

The categories cannot have any value. They are defined in the _setrans.conf_ file as shown below. Refer to the SELinux documentation for details about modifying the sizes of the MCS ranges.

```

    user@worker1:~$ cat /etc/selinux/targeted/setrans.conf
    s0=SystemLow
    s0-s0:c0.c1023=SystemLow-SystemHigh
    s0:c0.c1023=SystemHigh

```

The DAC permissions are enforced in parallel with the MAC permissions, so [the Linux mode bits][16] must be set to grant sufficient access in addition to the SELinux labels. We also need to set the proper label _container_file_t_ and the category level as well. With **s0** level all the containers will be able to write to the volume. To restrict access to them, we need to label them with process categories.

```

    user@worker1:~$ sudo mkdir -m=777 /data
    user@worker1:~$ sudo semanage fcontext -a -t container_file_t /data
    user@worker1:~$ sudo restorecon -R -v /data
    user@worker1:~$ mkdir -m=777 /data/folder{1..2}
    user@worker1:~$ ls -laZ /data
    drwxrwxrwx. root root unconfined_u:object_r:container_file_t:s0 .
    drwxrwxrwx. user user unconfined_u:object_r:container_file_t:s0 folder1
    drwxrwxrwx. user user unconfined_u:object_r:container_file_t:s0 folder2

```

The _semanage fcontext_ command cannot assign category labels so we will have to use _chcat_ :

```

    user@worker1:~$ chcat -- +c800 /data/folder1
    user@worker1:~$ chcat -- +c801 /data/folder2
    user@worker1:~$ ls -laZ /data
    drwxrwxrwx. unconfined_u:object_r:container_file_t:s0      .
    drwxrwxrwx. unconfined_u:object_r:container_file_t:s0:c800 folder1
    drwxrwxrwx. unconfined_u:object_r:container_file_t:s0:c801 folder2

```

With the configuration shown above, the container process must have category c800 to access folder1, and c801 is required to access folder2. To avoid random labeling, pass the spec.securityContext.seLinuxOptions object.

```

    [user@master1 ~]$ kubectl apply -f - <<EOF
    apiVersion: v1
    kind: Pod
    metadata:
      name: test-hostpath1
      annotations:
        io.kubernetes.cri-o.userns-mode: "auto:size=256"
    spec:
      securityContext:
        seLinuxOptions:
          level: "s0:c800"
      containers:
      - name: test
        image: fedora/fedora:latest
        args: ["sleep", "infinity"]
        volumeMounts:
        - mountPath: /test
          name: test-volume
      volumes:
      - name: test-volume
        hostPath:
          path: /data
    ---
    apiVersion: v1
    kind: Pod
    metadata:
      name: test-hostpath2
      annotations:
        io.kubernetes.cri-o.userns-mode: "auto:size=256"
    spec:
      securityContext:
        seLinuxOptions:
          level: "s0:c801"
      containers:
      - name: test
        image: fedora/fedora:latest
        args: ["sleep", "infinity"]
        volumeMounts:
        - mountPath: /test
          name: test-volume
      volumes:
      - name: test-volume
        hostPath:
          path: /data
    EOF

```

Next, try to write to these folders. Notice the process labels, file labels, and the file ownership.

```

    user@master1:~$ kubectl exec test-hostpath1 -- touch /test/folder1/testfile
    user@master1:~$ kubectl exec test-hostpath1 -- touch /test/folder2/testfile
    touch: cannot touch '/test/folder2/testfile': Permission denied

    user@master1:~$ kubectl exec test-hostpath2 -- touch /test/folder2/testfile
    user@master1:~$ kubectl exec test-hostpath2 -- touch /test/folder1/testfile
    touch: cannot touch '/test/folder1/testfile': Permission denied

    user@worker1:~$ ps -eo pid,uid,gid,args,label | grep -E 'sleep'
    40475 1000512 1000512 sleep system_u:system_r:container_t:s0:c801
    40500 1000256 1000256 sleep system_u:system_r:container_t:s0:c800

    user@worker1:~$ ls -laZ /data/folder1
    drwxrwxrwx. user   unconfined_u:object_r:container_file_t:s0:c800 .
    -rw-r--r--. 1000256 system_u:object_r:container_file_t:s0:c800     testfile

    user@worker1:~$ ls -laZ /data/folder2
    drwxrwxrwx. user   unconfined_u:object_r:container_file_t:s0:c801 .
    -rw-r--r--. 1000512 system_u:object_r:container_file_t:s0:c801     testfile

```

##### Sharing storage

In the above examples, the containers share storage that has the same group and categories or storage with the most permissive **s0** level. In production environments you will most likely deal with dynamic storage provisioners that will have to automatically relabel directories and files with whatever random category labels were assigned by Kubernetes. This means the storage provisioner must be SELinux aware and you need to read the configuration settings carefully for anything SELinux-specific.

Proper file permissions achieve a lot of security. SELinux simply adds a layer of security on top of the base file permissions.

##### More Security

We have touched on the basics of Fedora Linux’s security models. Securing Kubernetes is a broad field of study and it requires significant effort to come to a full understanding of how it all works. To review the best practices and tools beyond what this article has covered, refer to the SELinux docs and the Linux Foundation CKS learning track.

### Conclusion

In this article, we have achieved a small, bare-metal Kubernetes setup running on Fedora Linux. CRI-O is a versatile CNCF graduated project that supports user namespaces and any OCI-compliant runtime. Just like Fedora, Kubernetes is continuously improving and can only benefit from Fedora Linux’s advanced security model and features. Follow the [Kubernetes QuickDocs][17] to stay apprised of the latest changes. Thanks to all the hard working people maintaining the above mentioned packages.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/kubernetes-with-cri-o-on-fedora-linux-39/

作者：[Roman Gherta][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/romangherta/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/12/kubernetes-with-cri-o-816x345.jpg
[2]: https://unsplash.com/@sailingaroundtheworld?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[3]: https://unsplash.com/photos/white-and-gray-rock-formation-on-blue-sea-under-blue-sky-during-daytime-l6OraG-v0d8?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[4]: https://kubernetes.io/
[5]: https://github.com/cri-o/cri-o
[6]: https://en.wikipedia.org/wiki/TOML
[7]: https://fedoraproject.org/wiki/Changes/SwapOnZRAM
[8]: https://kubernetes.io/docs/reference/networking/ports-and-protocols/
[9]: https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing
[10]: https://kubernetes.io/docs/reference/config-api/kubeadm-config.v1beta3/
[11]: https://v1-27.docs.kubernetes.io/docs/reference/config-api/kubelet-config.v1beta1/
[12]: https://v1-27.docs.kubernetes.io/docs/reference/command-line-tools-reference/kubelet/
[13]: https://podman.io/
[14]: https://docs.sylabs.io/guides/3.5/user-guide/introduction.html#why-use-singularity
[15]: https://github.com/containers/storage
[16]: https://fedoramagazine.org/command-line-quick-tips-permissions/
[17]: https://docs.fedoraproject.org/en-US/quick-docs/using-kubernetes/
