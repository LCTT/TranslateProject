借助 minikube 上手 OpenFaaS
============================================================

本文将介绍如何借助 [minikube][4] 在 Kubernetes 1.8 上搭建 OpenFaaS（让 Serverless Function 变得更简单）。minikube 是一个 [Kubernetes][5] 分发版，借助它，你可以在笔记本电脑上运行 Kubernetes 集群，minikube 支持 Mac 和 Linux 操作系统，但是在 MacOS 上使用得更多一些。

> 本文基于我们最新的部署手册 [Kubernetes 官方部署指南][6]


![](https://cdn-images-1.medium.com/max/1600/1*C9845SlyaaT1_xrAGOBURg.png)

### 安装部署 Minikube

1、 安装 [xhyve driver][1] 或 [VirtualBox][2] ，然后在上面安装 Linux 虚拟机以部署 minikube 。根据我的经验，VirtualBox 更稳定一些。

2、 [参照官方文档][3] 安装 minikube 。

3、 使用 `brew` 或 `curl -sL cli.openfaas.com | sudo sh` 安装 `faas-cli`。

4、 通过 `brew install kubernetes-helm` 安装 `helm` 命令行。

5、 运行 minikube ：`minikube start`。

> Docker 船长小贴士：Mac 和 Windows 版本的 Docker 已经集成了对 Kubernetes 的支持。现在我们使用 Kubernetes 的时候，已经不需要再安装额外的软件了。

### 在 minikube 上面部署 OpenFaaS

1、 为 Helm 的服务器组件 tiller 新建服务账号：

```
kubectl -n kube-system create sa tiller \
 && kubectl create clusterrolebinding tiller \
 --clusterrole cluster-admin \
 --serviceaccount=kube-system:tiller
```

2、 安装 Helm 的服务端组件 tiller：

```
helm init --skip-refresh --upgrade --service-account tiller
```

3、 克隆 Kubernetes 的 OpenFaaS 驱动程序 faas-netes： 

```
git clone https://github.com/openfaas/faas-netes && cd faas-netes
```

4、 Minikube 没有配置 RBAC，这里我们需要把 RBAC 关闭：

```
helm upgrade --install --debug --reset-values --set async=false --set rbac=false openfaas openfaas/
```

（LCTT 译注：RBAC（Role-Based access control）基于角色的访问权限控制，在计算机权限管理中较为常用，详情请参考以下链接：https://en.wikipedia.org/wiki/Role-based_access_control ）

现在，你可以看到 OpenFaaS pod 已经在你的 minikube 集群上运行起来了。输入 `kubectl get pods` 以查看 OpenFaaS pod：

```
NAME                            READY     STATUS    RESTARTS   AGE
alertmanager-6dbdcddfc4-fjmrf   1/1       Running   0          1m
faas-netesd-7b5b7d9d4-h9ftx     1/1       Running   0          1m
gateway-965d6676d-7xcv9         1/1       Running   0          1m
prometheus-64f9844488-t2mvn     1/1       Running   0          1m
```

30,000ft：

该 API 网关包含了一个 [用于测试功能的最小化 UI][7]，同时开放了用于功能管理的 [RESTful API][8] 。
faas-netesd 守护进程是一种 Kubernetes 控制器，用来连接 Kubernetes API 服务器来管理服务、部署和密码。

Prometheus 和 AlertManager 进程协同工作，实现 OpenFaaS Function 的弹性缩放，以满足业务需求。通过 Prometheus 指标我们可以查看系统的整体运行状态，还可以用来开发功能强悍的仪表盘。

Prometheus 仪表盘示例：

![](https://cdn-images-1.medium.com/max/1600/1*b0RnaFIss5fOJXkpIJJgMw.jpeg)

### 构建/迁移/运行

和很多其他的 FaaS 项目不同，OpenFaaS 使用 Docker 镜像格式来进行 Function 的创建和版本控制，这意味着可以在生产环境中使用 OpenFaaS 实现以下目标：

* 漏洞扫描（LCTT 译注：此处我觉得应该理解为更快地实现漏洞补丁）
* 持续集成/持续开发
* 滚动更新

你也可以在现有的生产环境集群中利用空闲资源部署 OpenFaaS。其核心服务组件内存占用大概在 10-30MB 。

> OpenFaaS 一个关键的优势在于，它可以使用容器编排平台的 API ，这样可以和 Kubernetes 以及 Docker Swarm 进行本地集成。同时，由于使用 Docker <ruby>存储库<rt>registry</rt></ruby>进行 Function 的版本控制，所以可以按需扩展 Function，而没有按需构建 Function 的框架的额外的延时。

### 新建 Function

```
faas-cli new --lang python hello
```

以上命令创建文件 `hello.yml` 以及文件夹 `handler`，文件夹有两个文件 `handler.py`、`requirements.txt` 可用于你可能需要的 pip 模块。你可以随时编辑这些文件和文件夹，不需要担心如何维护  Dockerfile —— 我们为你通过以下方式维护：

* 分级创建
* 非 root 用户
* 以官方的 Docker Alpine Linux 版本为基础进行镜像构建 (可替换)

### 构建你的 Function

先在本地创建 Function，然后推送到 Docker 存储库。 我们这里使用 Docker Hub，打开文件 `hello.yml` 然后输入你的账号名：

```
provider:
  name: faas
  gateway: http://localhost:8080
functions:
  hello:
    lang: python
    handler: ./hello
    image: alexellis2/hello
```

现在，发起构建。你的本地系统上需要安装 Docker 。

```
faas-cli build -f hello.yml
```

把封装好 Function 的 Docker 镜像版本推送到 Docker Hub。如果还没有登录 Docker hub ，继续前需要先输入命令 `docker login` 。

```
faas-cli push -f hello.yml
```

当系统中有多个 Function 的时候，可以使用 `--parallel=N` 来调用多核并行处理构建或推送任务。该命令也支持这些选项： `--no-cache`、`--squash` 。

### 部署及测试 Function

现在，可以部署、列出、调用 Function 了。每次调用 Function 时，可以通过 Prometheus 收集指标值。

```
$ export gw=http://$(minikube ip):31112
$ faas-cli deploy -f hello.yml --gateway $gw
Deploying: hello.
No existing function to remove
Deployed.
URL: http://192.168.99.100:31112/function/hello
```

上面给到的是部署时调用 Function 的标准方法，你也可以使用下面的命令：

```
$ echo test | faas-cli invoke hello --gateway $gw
```

现在可以通过以下命令列出部署好的 Function，你将看到调用计数器数值增加。

```
$ faas-cli list --gateway $gw
Function                       Invocations     Replicas
hello                          1               1
```

_提示：这条命令也可以加上 `--verbose` 选项获得更详细的信息。_

由于我们是在远端集群（Linux 虚拟机）上面运行 OpenFaaS，命令里面加上一条 `--gateway` 用来覆盖环境变量。 这个选项同样适用于云平台上的远程主机。除了加上这条选项以外，还可以通过编辑 .yml 文件里面的 `gateway` 值来达到同样的效果。

### 迁移到 minikube 以外的环境

一旦你在熟悉了在 minikube 上运行 OpenFaaS ，就可以在任意 Linux 主机上搭建 Kubernetes 集群来部署 OpenFaaS 了。下图是由来自 WeaveWorks 的 Stefan Prodan 做的 OpenFaaS Demo ，这个 Demo 部署在 Google GKE 平台上的 Kubernetes 上面。图片上展示的是 OpenFaaS 内置的自动扩容的功能：

![](https://twitter.com/stefanprodan/status/931490255684939777/photo/1)

### 继续学习

我们的 Github 上面有很多手册和博文，可以带你轻松“上车”，把我们的页面保存成书签吧：[openfaas/faas][9][][10] 。

2017 哥本哈根 Dockercon Moby 峰会上，我做了关于 Serverless 和 OpenFaaS 的概述演讲，这里我把视频放上来，视频不长，大概 15 分钟左右。

[Youtube视频](https://youtu.be/UaReIKa2of8)

最后，别忘了关注 [OpenFaaS on Twitter][11] 这里有最潮的新闻、最酷的技术和 Demo 展示。

--------------------------------------------------------------------------------

via: https://medium.com/@alexellisuk/getting-started-with-openfaas-on-minikube-634502c7acdf

作者：[Alex Ellis][a]
译者：[mandeler](https://github.com/mandeler)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@alexellisuk?source=post_header_lockup
[1]:https://git.k8s.io/minikube/docs/drivers.md#xhyve-driver
[2]:https://www.virtualbox.org/wiki/Downloads
[3]:https://kubernetes.io/docs/tasks/tools/install-minikube/
[4]:https://kubernetes.io/docs/getting-started-guides/minikube/
[5]:https://kubernetes.io/
[6]:https://github.com/openfaas/faas/blob/master/guide/deployment_k8s.md
[7]:https://github.com/openfaas/faas/blob/master/TestDrive.md
[8]:https://github.com/openfaas/faas/tree/master/api-docs
[9]:https://github.com/openfaas/faas/tree/master/guide
[10]:https://github.com/openfaas/faas/tree/master/guide
[11]:https://twitter.com/openfaas
