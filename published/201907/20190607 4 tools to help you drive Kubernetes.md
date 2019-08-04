[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11101-1.html)
[#]: subject: (4 tools to help you drive Kubernetes)
[#]: via: (https://opensource.com/article/19/6/tools-drive-kubernetes)
[#]: author: (Scott McCarty https://opensource.com/users/fatherlinux/users/fatherlinux/users/fatherlinux/users/fatherlinux)

帮助你驾驭 Kubernetes 的 4 个工具
======

> 学习如何驾驭 Kubernetes 比如何建造它更重要，这些工具可以帮助你更快上路。

![Tools in a workshop][1]

在本系列的第三篇文章中，[Kubernetes 基础：首先学习如何使用][2]，我强调你应该学会使用 Kubernetes，而不是建造它。我还解释说，在 Kubernetes 中，你必须学习最小的一组原语来建模应用程序。我想强调这一点：你需要学习的这组原语是最简单的原语集，你可以通过它们学习如何实现生产级的应用程序部署（即高可用性 [HA]、多容器、多应用程序）。换句话说，学习 Kubernetes 内置的原语集比学习集群软件、集群文件系统、负载平衡器、让人发疯的 Apache 和 Nginx 的配置、路由器、交换机、防火墙和存储后端更容易 —— 这些是你在传统的 IT 环境（虚拟机或裸机）中建模简单的 HA 应用程序所需要的东西。

在这第四篇文章中，我将分享一些有助于你学习快速驾驭 Kubernetes 的工具。

### 1、Katacoda

无疑，[Katacoda][3] 是试驾 Kubernetes 集群的最简单方法。只需单击一下，五秒钟后就可以将基于 Web 的终端直接连接到正在运行的 Kubernetes 集群中。这对于使用和学习来说非常棒。我甚至将它用于演示和测试新想法。Katacoda 提供了一个完整的临时环境，在你使用完毕后可以回收利用。

![OpenShift Playground][4]

*[OpenShift Playground][5]*

![Kubernetes Playground][6]

*[Kubernetes Playground][7]*

Katacoda 提供了一个临时的环境和更深入的实验室环境。例如，我最近三四年主讲的 [Linux Container Internals Lab][3] 是在 Katacoda 中构建的。

Katacoda 在其主站点上维护了若干 [Kubernetes 和云教程][8]并与 Red Hat 合作以支持了一个 [OpenShift 的专用学习门户][9]。了解一下，它们是极好的学习资源。

当你第一次学习驾驶翻斗车时，最好先观察一下其他人的驾驶方式。

### 2、Podman generate kube

`podman generate kube` 命令是一个很棒的子命令，可以帮助用户自然地从运行简单容器的简单容器引擎转换到运行许多容器的集群用例（正如我在[上篇文章][2]中所描述的那样）。[Podman][10] 通过让你启动一个新的容器，然后导出这个可工作的 Kube YAML，并在 Kubernetes 中启动它来实现这一点。看看这个（你可以在 [Katacoda lab][3] 中运行它，它已经有了 Podman 和 OpenShift）。

首先，请注意运行容器的语法与 Docker 非常相似：

```
podman run -dtn two-pizza quay.io/fatherlinux/two-pizza
```

不过这个是其它容器引擎所没有的：

```
podman generate kube two-pizza
```

输出：

```
# Generation of Kubernetes YAML is still under development!
#
# Save the output of this file and use kubectl create -f to import
# it into Kubernetes.
#
# Created with podman-1.3.1
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: "2019-06-07T08:08:12Z"
  labels:
    app: two-pizza
  name: two-pizza
spec:
  containers:
  - command:
    - /bin/sh
    - -c
    - bash -c 'while true; do /usr/bin/nc -l -p 3306 < /srv/hello.txt; done'
    env:
    - name: PATH
      value: /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    - name: TERM
      value: xterm
    - name: HOSTNAME
    - name: container
      value: oci
    image: quay.io/fatherlinux/two-pizza:latest
    name: two-pizza
    resources: {}
    securityContext:
      allowPrivilegeEscalation: true
      capabilities: {}
      privileged: false
      readOnlyRootFilesystem: false
    tty: true
    workingDir: /
status: {}
---
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: "2019-06-07T08:08:12Z"
  labels:
    app: two-pizza
  name: two-pizza
spec:
  selector:
    app: two-pizza
  type: NodePort
status:
  loadBalancer: {}
```

你现在有了一些可以的工作 Kubernetes YAML，你可以用它作为练习的起点来学习、调整等等。`-s` 标志可以为你创造一项服务。[Brent Baude][11] 甚至致力于[添加卷/持久卷断言][12]等新功能。如果想进一步深入，请在 Brent 的博客文章《[Podman 现在可以轻松过渡到 Kubernetes 和 CRI-O][13]》中了解他的工作。

### 3、oc new-app

`oc new-app` 命令非常强大。它是特定于 OpenShift 的，所以它在默认的 Kubernetes 中不可用，但是当你开始学习 Kubernetes 时它非常有用。让我们从快速命令开始创建一个相当复杂的应用程序：

```
oc new-project -n example
oc new-app -f https://raw.githubusercontent.com/openshift/origin/master/examples/quickstarts/cakephp-mysql.json
```

使用 `oc new-app`，你可以从 OpenShift 开发人员那里偷取模板，并在开发原语来描述你自己的应用程序时拥有一个已知良好的起点。运行上述命令后，你的 Kubernetes 命名空间（在 OpenShift 中）将由若干新的已定义资源填充。

```
oc get all
```

输出：

```
NAME                                READY     STATUS      RESTARTS   AGE
pod/cakephp-mysql-example-1-build   0/1       Completed   0          4m
pod/cakephp-mysql-example-1-gz65l   1/1       Running     0          1m
pod/mysql-1-nkhqn                   1/1       Running     0          4m

NAME                                            DESIRED   CURRENT   READY     AGE
replicationcontroller/cakephp-mysql-example-1   1         1         1         1m
replicationcontroller/mysql-1                   1         1         1         4m

NAME                            TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
service/cakephp-mysql-example   ClusterIP   172.30.234.135   <none>        8080/TCP   4m
service/mysql                   ClusterIP   172.30.13.195    <none>        3306/TCP   4m

NAME                                                       REVISION   DESIRED   CURRENT   TRIGGERED BY
deploymentconfig.apps.openshift.io/cakephp-mysql-example   1          1         1         config,image(cakephp-mysql-example:latest)
deploymentconfig.apps.openshift.io/mysql                   1          1         1         config,image(mysql:5.7)

NAME                                                   TYPE      FROM      LATEST
buildconfig.build.openshift.io/cakephp-mysql-example   Source    Git       1

NAME                                               TYPE      FROM          STATUS     STARTED         DURATION
build.build.openshift.io/cakephp-mysql-example-1   Source    Git@47a951e   Complete   4 minutes ago   2m27s

NAME                                                   DOCKER REPO                                                      TAGS      UPDATED
imagestream.image.openshift.io/cakephp-mysql-example   docker-registry.default.svc:5000/example/cakephp-mysql-example   latest    About aminute ago

NAME                                             HOST/PORT                                                                         PATH   SERVICES                PORT      TERMINATION   WILDCARD
route.route.openshift.io/cakephp-mysql-example   cakephp-mysql-example-example.2886795271-80-rhsummit1.environments.katacoda.com   cakephp-mysql-example   <all>                   None
```

这样做的好处是你可以删除 Pod，观察复制控制器如何重新创建它们，缩放 Pod 等等。你可以使用模板并将其更改为其他应用程序（这是我第一次启动时所做的）。

### 4、Visual Studio Code

我把我最喜欢的放在最后。我的大部分工作都使用 [vi][14]，但我从来没有为 Kubernetes 找到一个好的语法高亮器和代码补完插件（如果有的话，请告诉我）。相反，我发现微软的 [VS Code][15] 有一套杀手级的插件，可以完成 Kubernetes 资源的创建并提供样板。

![VS Code plugins UI][16]

首先，安装上图中显示的 Kubernetes 和 YAML 插件。

![Autocomplete in VS Code][17]

然后，你可以从头开始创建新的 YAML 文件，并自动补完 Kubernetes 资源。上面的示例显示了一个服务。

![VS Code autocomplete filling in boilerplate for an object][18]

当你使用自动补完并选择服务资源时，它会填充该对象的一些模板。当你第一次学习使用 Kubernetes 时，这非常棒。你可以构建 Pod、服务、复制控制器、部署等。当你从头开始构建这些文件甚至修改你使用 `podman generate kube` 创建的文件时，这是一个非常好的功能。

### 总结

这四个工具（如果算上两个插件，则为六个）将帮助你学习驾驭 Kubernetes，而不是构造或装备它。在本系列的最后一篇文章中，我将讨论为什么 Kubernetes 如此适合运行这么多不同的工作负载。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/tools-drive-kubernetes

作者：[Scott McCarty][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux/users/fatherlinux/users/fatherlinux/users/fatherlinux
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_workshop_blue_mechanic.jpg?itok=4YXkCU-J (Tools in a workshop)
[2]: https://linux.cn/article-11036-1.html
[3]: https://learn.openshift.com/subsystems/container-internals-lab-2-0-part-1
[4]: https://opensource.com/sites/default/files/uploads/openshift-playground.png (OpenShift Playground)
[5]: https://learn.openshift.com/playgrounds/openshift311/
[6]: https://opensource.com/sites/default/files/uploads/kubernetes-playground.png (Kubernetes Playground)
[7]: https://katacoda.com/courses/kubernetes/playground
[8]: https://katacoda.com/learn
[9]: http://learn.openshift.com/
[10]: https://podman.io/
[11]: https://developers.redhat.com/blog/author/bbaude/
[12]: https://github.com/containers/libpod/issues/2303
[13]: https://developers.redhat.com/blog/2019/01/29/podman-kubernetes-yaml/
[14]: https://en.wikipedia.org/wiki/Vi
[15]: https://code.visualstudio.com/
[16]: https://opensource.com/sites/default/files/uploads/vscode_-_kubernetes_red_hat_-_plugins.png (VS Code plugins UI)
[17]: https://opensource.com/sites/default/files/uploads/vscode_-_kubernetes_service_-_autocomplete.png (Autocomplete in VS Code)
[18]: https://opensource.com/sites/default/files/uploads/vscode_-_kubernetes_service_-_boiler_plate.png (VS Code autocomplete filling in boilerplate for an object)
