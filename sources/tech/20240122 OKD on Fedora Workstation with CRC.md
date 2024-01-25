[#]: subject: "OKD on Fedora Workstation with CRC"
[#]: via: "https://fedoramagazine.org/okd-on-fedora-workstation-with-crc/"
[#]: author: "Donald Sebastian Leung https://fedoramagazine.org/author/donaldsebleung/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

OKD on Fedora Workstation with CRC
======

![][1]

Photo by [Growtika][2] on [Unsplash][3]

This article will guide you through setting up a single-node OKD cluster on your own Fedora Linux system. OKD is the community distribution of Kubernetes. This will be done using CRC, also known as “OpenShift Local”. It will also explore how OKD works under the hood and install an application via the web console.

### Introducing OKD

Containers are ubiquitous in today’s cloud-native world and [Kubernetes][4] has become the de-facto standard for container orchestration at scale. However, Kubernetes itself falls short of being an all-rounded _container platform_. On one hand, developers must familiarize themselves with Kubernetes-specific terminology and master the _kubectl_ command line to leverage its power effectively. On the other hand, platform engineers must carefully evaluate and integrate third-party components with Kubernetes to build a customized container platform addressing specific business requirements and expend effort on the continued maintenance of that platform. So is there a solution addressing both of these challenges? Enter OKD!

OKD, also known as OpenShift Origin, is the [community distribution of Kubernetes that powers Red Hat OpenShift][5]. It is open source under the permissive Apache 2.0 license in the same spirit as upstream Kubernetes. Unlike upstream Kubernetes, it is a complete container platform, a developer and operations friendly Kubernetes distro. For developers, OKD focuses on the developer experience by providing a built-in web console and tooling such as [source-to-image (S2I)][6] which simplify the developer workflow thus enhancing developer productivity. For platform engineers, OKD provides a standardized collection of components designed to work together as a whole with automated upgrades and lifecycle management for both application and cluster-level components, thereby simplifying platform maintenance.

### CRC – Runs Containers

[CRC][7], also known as OpenShift Local, makes it easy to run OKD on a standard laptop or desktop. Its name is a recursive acronym for “CRC – Runs Containers”. This article will guide you through setting up a single-node OKD cluster on your own laptop or desktop with CRC. We will also explore how OKD works under the hood and install an application via the web console.

Before we start, ensure your system meets the following minimum requirements:

  * Fedora Workstation 38+ recommended
  * 4 physical CPU cores (8 vCPUs)
  * 16 GiB of RAM
  * At least 35 GiB of available storage



A conceptual understanding of containers is assumed. Experience with containers and Kubernetes is helpful but not required. So what are you waiting for? Let’s dive right in!

### Installing libvirt and NetworkManager dependencies for CRC

On Linux, CRC depends on libvirt and NetworkManager. If necessary, run the following command on Fedora Workstation 38+:

```

    $ sudo dnf install --refresh -y libvirt NetworkManager

```

The dependencies vary by operating system. If not using Fedora Workstation 38+, consult the [CRC documentation][8] for details.

### Downloading and installing CRC

Download and extract the latest tarball for CRC from the OpenShift mirror – no subscription required:

```

    $ wget https://developers.redhat.com/content-gateway/file/pub/openshift-v4/clients/crc/2.31.0/crc-linux-amd64.tar.xz
    $ tar xvf crc-linux-amd64.tar.xz

```

Install the _crc_ binary to your PATH:

```

    $ mkdir -p "$HOME/.local/bin/"
    $ install crc-linux-*-amd64/crc "$HOME/.local/bin/crc"

```

Log out and in again to ensure _crc_ is available in your PATH.

Now check that CRC is correctly installed:

```

    $ crc version
    CRC version: 2.31.0+6d23b6
    OpenShift version: 4.14.7
    Podman version: 4.4.4

```

### Configuring and starting CRC

CRC requests that telemetry data to be sent to Red Hat the first time it is started, unless we explicitly opt out of telemetry collection beforehand:

```

    $ crc config set consent-telemetry no

```

CRC supports the following [presets][9]:

  * _openshift_ : OpenShift Container Platform
  * _okd_ : OKD
  * _microshift_ : MicroShift
  * _podman_ : Podman container runtime



By default, the OpenShift Container Platform preset is selected. Change it to OKD with the following command:

```

    $ crc config set preset okd

```

Run the _setup_ subcommand which performs host-level configuration to ensure CRC will work correctly when started:

```

    $ crc setup

```

Now for the moment we’ve been waiting for — start the CRC VM!

```

    $ crc start

```

This takes approximately 15-30 minutes so grab a cup of ~~coffee~~ tea while OKD is spinning up.

### Exploring OKD with the _oc_ command line

_oc_ is the official command line client for OKD. While the web console provides a beginner-friendly UI for performing many common operations, some operations are only available on the command line. Using the command line enables us to better understand OKD as a Kubernetes distribution so we’ll start by interacting with our OKD cluster via the command line, introducing the basic Kubernetes concepts involved along the way. Don’t worry, we will explore the web console in a moment 🙂

CRC comes bundled with its own copy of _oc_ – make this available in our PATH:

```

    $ eval $(crc oc-env)

```

Alternatively, if desired, fetch a copy of _oc_ from the [OpenShift Mirror][10] and place it under your PATH.

#### Nodes

A Kubernetes cluster is comprised of one or more _nodes_. Each node is a physical or virtual machine. Kubernetes is responsible for scheduling workloads (containers) on the appropriate node(s) to balance application performance and node utilization. The _oc_ command shown below returns a list of all nodes in our OKD cluster.

```

    $ oc get nodes
    NAME                 STATUS   ROLES                         AGE   VERSION
    crc-d4g2s-master-0   Ready    control-plane,master,worker   44d   v1.27.6+d548052

```

_oc_ reports 1 node in our OKD cluster which is both a control plane node and a worker node.

  * The _control plane_ is the “brain” of the cluster and is responsible for managing the cluster itself. It is responsible for serving Kubernetes client requests (from _oc_ or _kubectl_ ), scheduling workloads, reconciling the state of the cluster, and maintaining the integrity of cluster metadata. It is usually comprised of 3, 5 or 7 control plane nodes for high availability, depending on the total size of the cluster.
  * Worker nodes form the “body” of the cluster and are responsible for running application workloads. Together, they form the _data plane_.



Let’s take a closer look at our node by displaying additional fields (note these lines are wrapped):

```

    $ oc get nodes -o wide
    NAME                 STATUS   ROLES                         AGE   VERSION           INTERNAL-IP      EXTERNAL-IP   OS-IMAGE                        KERNEL-VERSION          CONTAINER-RUNTIME
    crc-d4g2s-master-0   Ready    control-plane,master,worker   44d   v1.27.6+d548052   192.168.126.11   <none>        Fedora CoreOS 38.20231027.3.2   6.5.5-200.fc38.x86_64   cri-o://1.27.0

```

In particular, notice the _OS-IMAGE_ field which tells us that our node is running [Fedora CoreOS (FCOS)][11]. FCOS is a container-optimized OS designed for running containerized workloads at scale. OKD integrates deeply with FCOS and requires all control plane nodes to run FCOS while worker nodes may run [Fedora Server][12] instead. Through the deep integration with FCOS, OKD manages cluster upgrades and node lifecycle management in a fully automated manner.

#### Pods

Pods are the atomic unit of computing in Kubernetes. A pod contains a collection of 1 or more tightly coupled containers and are ephemeral in nature. Most pods run application workloads in the data plane while some pods run cluster-level components in the control plane.

Get the total number of pods running on our OKD cluster:

```

    $ oc get pods --all-namespaces --no-headers | wc -l
    69

```

This brings us to our next concept – namespaces.

#### Namespaces

Namespaces segregate Kubernetes workloads by purpose for easier categorization and access management. Think of each namespace as representing a single, coherent application or _project_. OKD defines an additional API object known as projects which are just namespaces with additional metadata, such as a project description, implemented with Kubernetes [annotations][13]. In OKD, projects and namespaces always have a 1-to-1 mapping so creating a namespace automatically creates the corresponding project and vice versa.

View existing namespaces in our OKD cluster:

```

    $ oc get namespaces
    NAME                                               STATUS   AGE
    default                                            Active   44d
    hostpath-provisioner                               Active   43d
    kube-node-lease                                    Active   44d
    kube-public                                        Active   44d
    kube-system                                        Active   44d
    openshift                                          Active   44d
    openshift-apiserver                                Active   44d
    openshift-apiserver-operator                       Active   44d
    openshift-authentication                           Active   44d
    openshift-authentication-operator                  Active   44d
    openshift-cloud-controller-manager                 Active   44d
    openshift-cloud-controller-manager-operator        Active   44d
    openshift-cloud-credential-operator                Active   44d
    openshift-cloud-network-config-controller          Active   44d
    openshift-cluster-machine-approver                 Active   44d
    openshift-cluster-samples-operator                 Active   44d
    openshift-cluster-storage-operator                 Active   44d
    openshift-cluster-version                          Active   44d
    openshift-config                                   Active   44d
    openshift-config-managed                           Active   44d
    openshift-config-operator                          Active   44d
    openshift-console                                  Active   44d
    openshift-console-operator                         Active   44d
    openshift-console-user-settings                    Active   44d
    openshift-controller-manager                       Active   44d
    openshift-controller-manager-operator              Active   44d
    openshift-dns                                      Active   44d
    openshift-dns-operator                             Active   44d
    openshift-etcd                                     Active   44d
    openshift-etcd-operator                            Active   44d
    openshift-host-network                             Active   44d
    openshift-image-registry                           Active   44d
    openshift-infra                                    Active   44d
    openshift-ingress                                  Active   44d
    openshift-ingress-canary                           Active   44d
    openshift-ingress-operator                         Active   44d
    openshift-kni-infra                                Active   44d
    openshift-kube-apiserver                           Active   44d
    openshift-kube-apiserver-operator                  Active   44d
    openshift-kube-controller-manager                  Active   44d
    openshift-kube-controller-manager-operator         Active   44d
    openshift-kube-scheduler                           Active   44d
    openshift-kube-scheduler-operator                  Active   44d
    openshift-kube-storage-version-migrator            Active   44d
    openshift-kube-storage-version-migrator-operator   Active   44d
    openshift-machine-api                              Active   44d
    openshift-machine-config-operator                  Active   44d
    openshift-marketplace                              Active   44d
    openshift-monitoring                               Active   44d
    openshift-multus                                   Active   44d
    openshift-network-diagnostics                      Active   44d
    openshift-network-node-identity                    Active   44d
    openshift-network-operator                         Active   44d
    openshift-node                                     Active   44d
    openshift-nutanix-infra                            Active   44d
    openshift-oauth-apiserver                          Active   44d
    openshift-openstack-infra                          Active   44d
    openshift-operator-lifecycle-manager               Active   44d
    openshift-operators                                Active   44d
    openshift-ovirt-infra                              Active   44d
    openshift-route-controller-manager                 Active   44d
    openshift-sdn                                      Active   44d
    openshift-service-ca                               Active   44d
    openshift-service-ca-operator                      Active   44d
    openshift-user-workload-monitoring                 Active   44d
    openshift-vsphere-infra                            Active   44d

```

4 of these namespaces are Kubernetes-reserved system namespaces:

  * _default_
  * _kube-node-lease_
  * _kube-public_
  * _kube-system_



_hostpath-provisioner_ contains a [CSI driver][14] for dynamic provisioning of storage on Kubernetes. This will not be covered in this article. The rest are namespaces starting with _openshift*_ which are OKD-reserved system namespaces.

#### Services

Services expose Pods to the rest of the cluster and to the outside world. Pods are ephemeral in nature, so external clients and other pods cannot depend on the continued existence of any particular pod for application and network-level communication. Services address this issue by providing a stable entry point for communicating with a particular application represented by its dynamic, ever-changing collection of pods.

View a list of services in the _default_ namespace (again, the follow three lines are wrapped):

```

    $ oc get services
    NAME         TYPE           CLUSTER-IP   EXTERNAL-IP                            PORT(S)   AGE
    kubernetes   ClusterIP      10.217.4.1   <none>                                 443/TCP   44d
    openshift    ExternalName   <none>       kubernetes.default.svc.cluster.local   <none>    44d

```

The _kubernetes_ service is responsible for serving the Kubernetes API within the cluster. This allows pods running within the cluster to query cluster information and even schedule new workloads on the cluster provided the appropriate privileges, in a manner similar to how _oc_ (or _kubectl_ ) interacts with the cluster. The _openshift_ service is simply an alias to _kubernetes_.

Let’s now move on to the web console which is where OKD shines. With the OperatorHub built into the web console, it’s easy to install applications with just a few clicks. We’ll also briefly touch on the concepts of [Kubernetes operators][15] implemented on OKD using the [Operator Framework][16].

### Installing the Argo CD operator on OperatorHub

On OKD, applications are managed by _operators_ which are installed via _OperatorHub_ which is available through the OKD web console. An operator is a software controller encoding human operational knowledge for managing a particular application and performing these operational tasks in a fully automated manner. This frees the cluster administrator from the mundane task of managing that particular application and allowing them to focus on tasks that deliver actual business value.

In the section to follow, we will install the [Argo CD operator][17] via the OKD web console. [Argo CD][18] is a GitOps continuous delivery tool for Kubernetes which eases modern software deployment practices such as blue-green and canary deployments. Once installed we will then leverage the operator to create an Argo CD instance effortlessly by applying an _ArgoCD_ custom resource to our cluster. For the purposes of this article we won’t focus on Argo CD itself.

#### Logging in to the web console as the cluster administrator

If you closed your terminal window from a previous step, open a new terminal window now and make _oc_ available in your PATH.

```

    $ eval $(crc oc-env)

```

The default cluster administrator on OKD is _kubeadmin_. Fetch the password for _kubeadmin_ by running the command below.

```

    $ crc console --credentials

```

Now point your browser to <https://console-openshift-console.apps-crc.testing>, ignore any certificate warnings, type in _kubeadmin_ for the username, copy the password from the output of the _crc console_ command above and click “Log in”.

![][19]

This brings up the administrator dashboard. Feel free to explore the menu items to the left before we move on. In particular, take a look at the Developer perspective as well by clicking the “Administrator” dropdown to the top left.

![][20]

* * *

#### Installing the Argo CD operator via the OKD web console

Now return to the Administrator dashboard and select “Operators > OperatorHub” from the menu on the left.

![][21]

Next, search for “Argo CD” and select the Argo CD operator as shown in the screenshot below.

![][22]

A warning appears that this is a community operator not supported by Red Hat. Acknowledge the warning and click “Continue”.

![][23]

Read through the description and click “Install”.

![][24]

Leave the options at their defaults and confirm your action by clicking “Install” once more.

![][25]

This initiates installation of the Argo CD operator on your cluster. Wait a few moments for the installation to complete, then click “View operator” to view the details of the Argo CD operator as shown below.

![][26]

As highlighted in the screenshot below, the custom resource we’ll use to create our Argo CD instance is _ArgoCD_. [Custom resource definitions (CRDs)][27] enable additional functionality on Kubernetes by extending the Kubernetes API.

![][28]

#### Deploying our Argo CD instance and logging in to the Argo CD web console

To create our _ArgoCD_ custom resource, click the plus sign to the top right of the window and type in the appropriate YAML as shown in the screenshot below, then click “Create” – we’ll create an _argocd_ namespace and deploy our Argo CD instance there.

![][29]

If it helps, here is the exact YAML to apply to our cluster:

```

    ---
    apiVersion: v1
    kind: Namespace
    metadata:
      name: argocd
    ---
    apiVersion: argoproj.io/v1beta1
    kind: ArgoCD
    metadata:
      name: argocd
      namespace: argocd

```

Here’s what you should see if the operation was successful.

![][30]

Now return to the command line and run the following command to wait for the Argo CD instance to become ready.

```

    $ oc -n argocd wait \
          --for=jsonpath='{.status.phase}'=Available \
          argocd.argoproj.io \
          argocd
    argocd.argoproj.io/argocd condition met

```

The Argo CD web console is available as the service _argocd-server_ which is a ClusterIP by default and therefore only available from within the cluster. Forward this service locally and visit <https://localhost:8443/> in your web browser. Ignore any certificate warnings raised by your browser.

```

    $ oc -n argocd port-forward service/argocd-server 8443:443

```

![][31]

This brings us to the Argo CD login page. The default Argo CD administrator is _admin_ while the password is stored in the secret _argocd-cluster_. Extract the administrator password from the _argocd-cluster_ secret by opening a new terminal window, making oc available in our PATH with the _eval $(crc oc-env)_ command and running _oc extract_ :

```

    $ oc -n argocd extract secret/argocd-cluster --to=-

```

Fill in _admin_ for the username and the extracted password as per the output of the command above, then click “Sign in” to enter the Argo CD dashboard.

![][32]

Congratulations, you have successfully set up a single-node OKD cluster on your laptop with CRC and installed Argo CD via the operator!

### Concluding remarks and going further

We hope you enjoyed this article and learned the basics of Kubernetes through setting up a minimal OKD cluster on your laptop. Learn more about OKD via the [official website][5] and play around with [Argo CD][33] by following through some of the tutorials there. In the meantime, don’t forget to check out [Fedora CoreOS][11] as well and learn by participating in the Fedora CoreOS [test days][34]!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/okd-on-fedora-workstation-with-crc/

作者：[Donald Sebastian Leung][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/donaldsebleung/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2024/01/okc_with_crc-816x345.jpg
[2]: https://unsplash.com/@growtika?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[3]: https://unsplash.com/photos/a-group-of-blue-boxes-ZfVyuV8l7WU?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[4]: https://kubernetes.io/
[5]: https://www.okd.io/
[6]: https://docs.okd.io/4.14/openshift_images/using_images/using-s21-images.html
[7]: https://crc.dev/blog/
[8]: https://crc.dev/crc/getting_started/getting_started/installing/
[9]: https://crc.dev/crc/getting_started/getting_started/using/
[10]: https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/
[11]: https://fedoraproject.org/coreos/
[12]: https://fedoraproject.org/server/
[13]: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/
[14]: https://kubernetes-csi.github.io/docs/
[15]: https://kubernetes.io/docs/concepts/extend-kubernetes/operator/
[16]: https://operatorframework.io/
[17]: https://argocd-operator.readthedocs.io/en/latest/
[18]: https://argoproj.github.io/cd/
[19]: https://fedoramagazine.org/wp-content/uploads/2024/01/00-okd-web-oauth-login-1024x559.png
[20]: https://fedoramagazine.org/wp-content/uploads/2024/01/01-okd-web-admin-dashboard-1024x559.png
[21]: https://fedoramagazine.org/wp-content/uploads/2024/01/02-okd-web-admin-operators-operatorhub-1024x559.png
[22]: https://fedoramagazine.org/wp-content/uploads/2024/01/03-okd-web-admin-argocd-operator-1-1024x559.png
[23]: https://fedoramagazine.org/wp-content/uploads/2024/01/04-okd-web-admin-community-operators-1024x559.png
[24]: https://fedoramagazine.org/wp-content/uploads/2024/01/05-okd-web-admin-install-argocd-1024x559.png
[25]: https://fedoramagazine.org/wp-content/uploads/2024/01/06-okd-web-admin-confirm-install-argocd-1024x559.png
[26]: https://fedoramagazine.org/wp-content/uploads/2024/01/07-okd-web-admin-argocd-operator-installed-1024x559.png
[27]: https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/
[28]: https://fedoramagazine.org/wp-content/uploads/2024/01/08-okd-web-console-argocd-operator-details-1024x559.png
[29]: https://fedoramagazine.org/wp-content/uploads/2024/01/09-okd-web-admin-argocd-crd-yaml-1024x559.png
[30]: https://fedoramagazine.org/wp-content/uploads/2024/01/10-okd-web-admin-argocd-instance-created-1024x559.png
[31]: https://fedoramagazine.org/wp-content/uploads/2024/01/11-okd-argocd-web-login-page-1024x559.png
[32]: https://fedoramagazine.org/wp-content/uploads/2024/01/12-okd-argocd-web-dashboard-1024x559.png
[33]: https://argo-cd.readthedocs.io/en/stable/
[34]: https://testdays.fedoraproject.org/events
