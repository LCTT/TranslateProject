[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A visual guide to Lens: A new way to see Kubernetes)
[#]: via: (https://opensource.com/article/20/7/kubernetes-lens)
[#]: author: (Jessica Cherry https://opensource.com/users/cherrybomb)

A visual guide to Lens: A new way to see Kubernetes
======
Navigate advanced Kubernetes administration without the command line
with Lens, the "Kubernetes IDE."
![Cat wearing glasses][1]

There are many [Kubernetes][2] administration tools to choose from, whether you prefer a command-line utility or a graphical user interface. I recently covered [k9s][3], a text-based interface that many day-to-day Kubernetes administrators enjoy, but you have to navigate through many Kubernetes-specific terms to use it. A lot of people who use Kubernetes less often would rather have a colorful, clean visual guide. This is where [Lens][4], an open source integrated development environment (IDE) tool for administering Kubernetes clusters, comes in.

### Install Lens

You can download Lens for Linux, macOS, or Windows from either its [GitHub][5] page or its [website][4]. Linux installs are offered through AppImage, and [this tutorial][6] walks you through the installation process. After installation, Lens appeared in my applications list (the blue box with the L in the center).

![Lens app icon][7]

(Jess Cherry, [CC BY-SA 4.0][8])

### Add a cluster

Managing Kubernetes means keeping an eye on one or more clusters. To add a cluster to Lens, click the large **+** sign, choose your cluster from the drop-down list, and click **Add Cluster**. Environments are automatically picked up from your `~/.kube/config` file.

![Adding a cluster in Lens][9]

(Jess Cherry, [CC BY-SA 4.0][8])

### Explore Lens' menus

Lens gives you all the information you need about a cluster it manages. To help you get started, I'll explore the Lens menu sections with screenshots to show you what information and options they offer.

If you need a refresher on Kubernetes terminology, [_A beginner's guide to Kubernetes container orchestration_][10] is a good place to read about it.

#### Nodes menu

First, look at the **Nodes**. A node can be a virtual machine or physical (bare metal) machine depending on the cluster. Each node contains the services necessary to run Pods, managed by the control plane. We can start by checking if our nodes are up and running in a Ready state. If there were an issue, this page would provide details as to what is wrong with the node.

![Lens Nodes menu][11]

(Jess Cherry, [CC BY-SA 4.0][8])

#### Workloads menu

The **Workloads** section provides a lot of information about your cluster. You can access its subsections with either the menu on the left or at the top of the pane—both work the same way.

##### Overview

Click **Overview** to see the events happening in the cluster, as well as how many Pods, Deployments, StatefulSets, DaemonSets, Jobs, and CronJobs are running in it. You can select each Overview item to see details about it.

![Lens Workloads Overview menu][12]

(Jess Cherry, [CC BY-SA 4.0][8])

##### Pods

Click **Pods** to see a list of the pods in the cluster.

![Lens Workloads Pods menu][13]

(Jess Cherry, [CC BY-SA 4.0][8])

Click on a pod name in the **Pods** section of **Workloads**, and it will bring up a details pane on the right with a ton of things you can do really quickly.

![Lens Workloads Pod details][14]

(Jess Cherry, [CC BY-SA 4.0][8])

Open the pod's logs by clicking on the multi-line button (the second icon from the left) on the top-right of the pod detail window.

![Lens Workloads Pod logs][15]

(Jess Cherry, [CC BY-SA 4.0][8])

If you need to shell into a pod, Lens has a terminal built into it. Access it by clicking the terminal button (the left-most icon) above the pod detail.

![Shelling into a pod in Lens][16]

(Jess Cherry, [CC BY-SA 4.0][8])

A terminal will open.

![Shelling into a pod in Lens][17]

(Jess Cherry, [CC BY-SA 4.0][8])

##### Deployments

**Deployments** shows what Deployments are in the cluster.

![Lens Workloads Deployments menu][18]

(Jess Cherry, [CC BY-SA 4.0][8])

#### Configuration menu

**Configuration** shows ConfigMaps, Secrets, Resource Quotas, and Horizontal Pod Autoscalers (HPA).

![Lens ConfigMaps menu][19]

(Jess Cherry, [CC BY-SA 4.0][8])

#### Network menu

**Network** includes options for managing your network services, endpoints, ingresses, and network policies.

##### Network Services

![Lens Network Services menu][20]

(Jess Cherry, [CC BY-SA 4.0][8])

If you see a pencil icon (like the one in the top-right corner above), clicking it will open a terminal window where you can edit the configurations.

![Editing configurations in Lens][21]

(Jess Cherry, [CC BY-SA 4.0][8])

#### Storage menu

Storage options, including PersistentVolumes and StorageClasses, are also navigable.

![Lens StorageClasses menu][22]

(Jess Cherry, [CC BY-SA 4.0][8])

#### Namespaces menu

**Namespaces** shows a list of your namespaces.

![Lens Namespaces menu][23]

(Jess Cherry, [CC BY-SA 4.0][8])

#### Apps menu

Lens' crown jewel is its one-click (OK, more like three-click) process for installing apps with [Helm charts][24]. I would suggest using this only on your local cluster, but it's still a nice add-on in Lens.

To install a chart, click **Apps** in the left navigation and click **Charts**. A list of all the charts available through Helm (and its stable repository) appears.

![Helm charts in Lens' Apps menu][25]

(Jess Cherry, [CC BY-SA 4.0][8])

You can also find a chart using **Search**. Click on the chart you want, and a window will open on the right with a large **Install** button.

![Searching for Helm charts in Lens' Apps menu][26]

(Jess Cherry, [CC BY-SA 4.0][8])

Click **Install** and a terminal will open at the bottom with another **Install** button in the lower-right. Click it.

![Installing a Helm chart in Lens][27]

(Jess Cherry, [CC BY-SA 4.0][8])

It installs the Helm chart and tells you when it's finished.

![Installing a Helm chart in Lens][28]

(Jess Cherry, [CC BY-SA 4.0][8])

You can double-check that the Helm chart is installed in your cluster by looking in the **Pods** section under **Workloads**.

![Confirming Helm chart in Lens][29]

(Jess Cherry, [CC BY-SA 4.0][8])

The Helm install takes under a minute and, because Lens has an edit function in each detail window, you can manually configure the apps you install. In my opinion, this is the only downfall of this function—I prefer to use my own values because it's hard to track manual changes. Why do I consider this a problem? If you're working with a repo with versioned helm charts and need to run a manual change without checking in the changed values, you quickly run into code drift.

#### Access Control menu

The **Access Control** section includes Service Accounts, Roles, Role Bindings, and Pod Security Policies, so you can visualize and edit the security you have in place (as you can see in the following screenshots). Service Accounts are the equivalent of Linux user accounts, but they are intended for processes running in a cluster. Running applications are attached to Roles, which have Role Bindings to the cluster to allow pods to access certain administrative permissions. Pod Security Policies are a more glandular level of security for the pods to have access to resources like certain volume types or to set seccomp profiles used by containers. 

##### Service Accounts

![Lens Access Control Service Accounts menu][30]

(Jess Cherry, [CC BY-SA 4.0][8])

##### Role Bindings

![Lens Access Control RoleBindings menu][31]

(Jess Cherry, [CC BY-SA 4.0][8])

##### Roles

![Lens Access Control Roles menu][32]

(Jess Cherry, [CC BY-SA 4.0][8])

#### Final notes

Lens is a beautiful and powerful alternative to managing Kubernetes from the command line. There are some times when you'll want to use the command line, mostly due to the drawbacks of manually editing charts before launching them or for tracking environmental changes. If you have good log-keeping practices in your cluster, this may not be a problem. If you are a visual person, Lens is a great way to explore your Kubernetes cluster and handle 95% of your administrative tasks.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/kubernetes-lens

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cat-glasses-read.png?itok=BigdrxUU (Cat wearing glasses)
[2]: https://opensource.com/resources/what-is-kubernetes
[3]: https://opensource.com/article/20/5/kubernetes-administration
[4]: https://k8slens.dev/
[5]: https://github.com/lensapp/lens
[6]: https://opensource.com/article/20/6/kubernetes-cluster-lens
[7]: https://opensource.com/sites/default/files/uploads/lens_1_homescreen.png (Lens app icon)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://opensource.com/sites/default/files/uploads/lens_2-addcluster.png (Adding a cluster in Lens)
[10]: https://opensource.com/article/20/6/container-orchestration
[11]: https://opensource.com/sites/default/files/uploads/lens_3-nodes.png (Lens Nodes menu)
[12]: https://opensource.com/sites/default/files/uploads/lens_4-overview.png (Lens Workloads Overview menu)
[13]: https://opensource.com/sites/default/files/uploads/lens_5-pods.png (Lens Workloads Pods menu)
[14]: https://opensource.com/sites/default/files/uploads/lens_7-poddetails.png (Lens Workloads Pod details)
[15]: https://opensource.com/sites/default/files/uploads/lens_8-podlogs.png (Lens Workloads Pod logs)
[16]: https://opensource.com/sites/default/files/uploads/lens_9-podshelling1.png (Shelling into a pod in Lens)
[17]: https://opensource.com/sites/default/files/uploads/lens_10-podshelling2.png (Shelling into a pod in Lens)
[18]: https://opensource.com/sites/default/files/uploads/lens_6-deployments.png (Lens Workloads Deployments menu)
[19]: https://opensource.com/sites/default/files/uploads/lens_12-configmaps.png (Lens ConfigMaps menu)
[20]: https://opensource.com/sites/default/files/uploads/lens_14-networkservices2.png (Lens Network Services menu)
[21]: https://opensource.com/sites/default/files/uploads/lens_15-editconfig.png (Editing configurations in Lens)
[22]: https://opensource.com/sites/default/files/uploads/lens_18-storageclass3.png (Lens StorageClasses menu)
[23]: https://opensource.com/sites/default/files/uploads/lens_11-namespaces.png (Lens Namespaces menu)
[24]: https://opensource.com/article/20/5/helm-charts
[25]: https://opensource.com/sites/default/files/uploads/lens_22_apps.png (Helm charts in Lens' Apps menu)
[26]: https://opensource.com/sites/default/files/uploads/lens_23_searchapps.png (Searching for Helm charts in Lens' Apps menu)
[27]: https://opensource.com/sites/default/files/uploads/lens_24_installapps.png (Installing a Helm chart in Lens)
[28]: https://opensource.com/sites/default/files/uploads/lens_25_helminstall.png (Installing a Helm chart in Lens)
[29]: https://opensource.com/sites/default/files/uploads/lens_26_confirminstall.png (Confirming Helm chart in Lens)
[30]: https://opensource.com/sites/default/files/uploads/lens_19-accesscontrol.png (Lens Access Control Service Accounts menu)
[31]: https://opensource.com/sites/default/files/uploads/lens_20_rolebindings.png (Lens Access Control RoleBindings menu)
[32]: https://opensource.com/sites/default/files/uploads/lens_21_roles.png (Lens Access Control Roles menu)
