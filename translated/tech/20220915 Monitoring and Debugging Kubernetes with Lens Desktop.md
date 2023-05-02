[#]: subject: "Monitoring and Debugging Kubernetes with Lens Desktop"
[#]: via: "https://www.opensourceforu.com/2022/09/monitoring-and-debugging-kubernetes-with-lens-desktop/"
[#]: author: "Mitesh Soni https://www.opensourceforu.com/author/mitesh_soni/"
[#]: collector: "lkxed"
[#]: translator: "lxbwolf"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用 Lens Desktop 监控和调试 Kubernetes
======
*Lens Desktop 是一个令人兴奋的 Kubernetes 工作平台。它是基于 OpenLens 资源库的一个定制化发行版本。通过本文来了解下 Lens Desktop 能做什么以及它是如何工作的。*

Lens Desktop 是免费的。你可以查看 https://k8slens.dev/pricing.html 来了解更多内容。Lens Desktop 有如下优势：

* 简单高效——你无需学习 kubectl 命令
* 可视化已有的 Kubernetes 资源
* 基于开源构建
* 可观测性——实时的统计数据、事件和日志流
* 错误和警告可以直接在 Lens 仪表盘上看到
* 支持 EKS、AKS、GKE、Minikube、Rancher、k0s、k3s、OpenShift
* 强大的社区支持——共有 450000 用户，在 GitHub 上共获得 17000 星

### Minikube 安装

Minikube 是一个用于本地运行 Kubernetes 的工具。它运行一个单节点的 Kubernetes 集群，这样就可以在 Kubernetes 上进行日常软件开发的实践工作。

我们将使用 minikube 并验证 Lens 的用法。首先让我们在基于 Windows 的系统上安装 minikube。你也可以把它安装在其他操作系统、虚拟机或笔记本电脑上。

* 2 核以上 CPU
* 2GB RAM
* 20GB 空闲硬盘空间
* 能连接网络
* 容器或虚拟机管理器，如 Docker、VirtualBox

在终端或命令提示符处，运行 minikube 启动命令。

```
minikube start --driver=virtualbox
* minikube v1.12.3 on Microsoft Windows 10 Home Single Language 10.0.19044 Build 19044
* Using the virtualbox driver based on existing profile
* minikube 1.26.0 is available! Download it: https://github.com/kubernetes/minikube/releases/tag/v1.26.0
* To disable this notice, run: ‘minikube config set WantUpdateNotification false’
* Starting control plane node minikube in cluster minikube
* virtualbox “minikube” VM is missing, will recreate.
* Creating virtualbox VM (CPUs=2, Memory=3000MB, Disk=20000MB) ...
! This VM is having trouble accessing https://k8s.gcr.io
* To pull new external images, you may need to configure a proxy: https://minikube.sigs.k8s.io/docs/reference/networking/proxy/
* Preparing Kubernetes v1.18.3 on Docker 19.03.12 ...
* Verifying Kubernetes components...
* Enabled addons: default-storageclass, storage-provisioner
* Done! kubectl is now configured to use “minikube”
```

进入你的虚拟箱，并验证刚安装的 minikube 虚拟机功能正常（图 1）。

![Figure 1: Minikube virtual machine in virtual box][1]

使用 *minikube status* 命令，查看状态是否与下面的输出一致

```
C:\>minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```

然后，使用 *kubectl cluster-info* 命令查看 kubeDNS 详情。

```
kubectl cluster-info
Kubernetes master is running at https://192.168.99.103:8443
KubeDNS is running at https://192.168.99.103:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```

你可以使用 *kubectl cluster-info dump* 命令来调试和诊断集群问题。

当 minikube 安装完成后，安装 kubectl *[(https://kubernetes.io/docs/tasks/tools/)][2]*。它是一个命令行集群，用于对 Kubernetes 集群和 minikube 执行命令。

![Figure 2: Lens][3]

执行 *kubectl get nodes* 命令获取所有 <ruby>节点<rt>node</rt></ruby> 的详情，在本例中是获取 minikube 的详情。

```
C:\>kubectl get nodes
NAME       STATUS   ROLES    AGE     VERSION
minikube   Ready    master   7m57s   v1.18.3
```

使用 *kubectl get all* 命令获取默认命名空间下的所有详情。

```
C:\>kubectl get all
NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   7m58s
```

我们现在已经有一个 minikube 集群，并准备好了 kubectl。下一步是安装和配置 Lens，并用示例应用程序来验证。

### Lens 安装和配置

打开 *https://k8slens.dev/*，下载与你的操作系统匹配的安装包。

然后，参照屏幕上的教程来安装 Lens，安装完成后打开 Lens。你会发现在目录中有一个 minikube（图 3）。

![Figure 3: Lens catalogue][4]

点击 *minikube* 后，你就进入了 minikube 的世界，你会爱上它的。

点击 *<ruby>节点<rt>node</rt></ruby>* 获取有关 `kubectl get nodes` 命令输出的 <ruby>节点<rt>node</rt></ruby> 详情。

现在，你可以使用 Lens 了。

![Figure 4: Lens cluster][5]

我们现在部署 [https://github.com/GoogleCloudPlatform/microservices-demo][6]，这是一个云原生微服务 demo 应用程序。它有 11 层的微服务应用，是一个基于网络的电子商务应用。

下载这个应用程序，把它解压到与 minikube 相同的目录。

进入 *release* 目录，执行以下命令。

```
kubectl apply -f kubernetes-manifests.yaml

deployment.apps/emailservice created
service/emailservice created
deployment.apps/checkoutservice created
service/checkoutservice created
deployment.apps/recommendationservice created
service/recommendationservice created
deployment.apps/frontend created
service/frontend created
service/frontend-external created
deployment.apps/paymentservice created
service/paymentservice created
deployment.apps/productcatalogservice created
service/productcatalogservice created
deployment.apps/cartservice created
service/cartservice created
deployment.apps/loadgenerator created
deployment.apps/currencyservice created
service/currencyservice created
deployment.apps/shippingservice created
service/shippingservice created
deployment.apps/redis-cart created
service/redis-cart created
deployment.apps/adservice created
service/adservice created
```

安装过程现在应该已经开始了，不过它需要一些时间来反映出我们使用了 kubectl 命令。

![Figure 5: Lens nodes][7]

```
kubectl get pods
NAME                 READY   STATUS    RESTARTS   AGE
adservice-775d8b9bf5-cp7jr   0/1     Pending   0          8h
cartservice-79749895f5-jrq4d  1/1     Running   0         8h
checkoutservice-5645bf9c65-882m4  1/1   Running  0        8h
currencyservice-545c79d477-8rhg7  1/1  Running   0         8h
emailservice-7cc5c74b4f-hk74s     1/1  Running   0        8h
frontend-9cdf787f5-klfkh    1/1     Running   1          8h
loadgenerator-7b6874cb4c-645v9   1/1  Running   0        8h
paymentservice-5f74bc7b87-l4248  1/1  Running   0        8h
productcatalogservice-6846f59899-v4q4w  1/1  Running  0  8h
recommendationservice-d9c6c8b55-m2x9k  1/1  Running   0  8h
redis-cart-57bd646894-v7kfr    0/1   Pending   0         8h
shippingservice-8685dd9855-pmgjm  1/1  Running  0        8h
```

表 1 列出了你可以通过 kubectl 来获取信息的几个命令。

![Figure 6: Lens pods][8]

| Description | Command | 
| :- | :- |
| List one or more nodes | kubectl get node | 
| List all resources in the cluster | kubectl get all –all-namespaces | 
| List one or more deployments | kubectl get deployment | 
| Display the complete state of one or more deployments | kubectl describe deployment <deployment_name> | 
| Edit and update one or more deployments on the cluster | kubectl edit deployment <deployment_name> | 
| Delete deployments | kubectl delete deployment <deployment_name> | 
| List one or more pods | kubectl get pod | 
| Delete a pod | kubectl delete pod <pod_name> | 
| Display the complete state of a pod | kubectl describe pod <pod_name> | 
| Get a shell to a running single-container pod | kubectl exec -it <pod_name> /bin/bash | 
| List secrets | kubectl get secrets | 
| List one or more services | kubectl get services | 
| Display the complete state of a service | kubectl describe services | 
| Edit and update one or more services on the cluster | kubectl edit services / kubectl edit deployment <deployment_name> | 
| List one or more namespaces | kubectl get namespace <namespace_name> | 
| Print the logs for a pod | kubectl logs <pod_name> | 
| Print the logs for a specific container in a pod | kubectl logs -c <container_name> <pod_name> |

Lens 不仅可以帮你获取表 1 中列出的所有信息，它还可以获取指定集群的信息。我们还能用 Lens 来对 Kubernetes 资源进行编辑和删除操作。

![Figure 7: Lens deployments][9]

我们来看下是如何操作的。在 *<ruby>工作负载<rt>Workloads</rt></ruby>* 部分选择 *<ruby>容器荚<rt>Pods</rt></ruby>*（图 6），我们能通过 Lens 来编辑、删除、查看日志、访问 <ruby>容器荚<rt>Pod</rt></ruby> 的终端，这是不是很酷？

![Figure 8: Lens Replicasets][10]

你可以验证 *<ruby>工作负载<rt>Workloads</rt></ruby>* 部分的所有 *<ruby>部署<rt>deployments</rt></ruby>*（图 7），*<ruby>工作负载<rt>Workloads</rt></ruby>* 部分的所有 *<ruby>副本<rt>Replicasets</rt></ruby>* （图 8），*<ruby>配置<rt>Config</rt></ruby>* 部分的所有 *<ruby>密钥<rt>Secrets</rt></ruby>* （图 9），以及 *<ruby>网络<rt>Network</rt></ruby>* 部分的所有 *<ruby>服务<rt>Services</rt></ruby>*  是否都正常（图 10），

![Figure 9: Lens Secrets][11]

你可以看到，跳转到所有的资源以及在一个地方高效地查看所有资源就是如此轻松。我们可以用 Lens 修改 YAML 文件，在运行时应用它来查看变更。

![Figure 10: Lens Services][12]

对于配置在不同的云服务商部署的多个集群，我们仍可以用 Lens 来进行观察和故障处理。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/monitoring-and-debugging-kubernetes-with-lens-desktop/

作者：[Mitesh Soni][a]
选题：[lkxed][b]
译者：[lxbwolf](https://github.com/译者ID)
校对：[校对者ID](https://github.com/lxbwolf)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/mitesh_soni/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/08/Figure-1-Minikube-virtual-machine-in-virtual-box.jpg
[2]: https://kubernetes.io/docs/tasks/tools/
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/08/Figure-2-Lens.jpg
[4]: https://www.opensourceforu.com/wp-content/uploads/2022/08/Figure-3-Lens-catalogue.jpg
[5]: https://www.opensourceforu.com/wp-content/uploads/2022/08/Figure-4-Lens-cluster.jpg
[6]: https://github.com/GoogleCloudPlatform/microservices-demo
[7]: https://www.opensourceforu.com/wp-content/uploads/2022/08/Figure-5-Lens-nodes.jpg
[8]: https://www.opensourceforu.com/wp-content/uploads/2022/08/Figure-6-Lens-pods.jpg
[9]: https://www.opensourceforu.com/wp-content/uploads/2022/08/Figure-7-Lens-deployments-2.jpg
[10]: https://www.opensourceforu.com/wp-content/uploads/2022/08/Figure-8-Lens-Replicasets.jpg
[11]: https://www.opensourceforu.com/wp-content/uploads/2022/08/Figure-9-Lens-Secrets.jpg
[12]: https://www.opensourceforu.com/wp-content/uploads/2022/08/Figure-10-Lens-Services-1.jpg
