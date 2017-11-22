#mandeler Translating Getting started with OpenFaaS on minikube
============================================================

本文将介绍如何借助 [minikube][4] 在 Kubernetes 1.8 上搭建 OpenFaaS（让 Serverless Function 变得更简单）。minikube 是一个 [Kubernetes][5] 发行版，借助它，你可以在笔记本电脑上运行 Kubernetes 群集，minikube 支持 Mac 和 Linux 操作系统，但是在 MacOS 上使用得更多一些。

> 本文基于我们最新的部署手册 [Official Kubernetes Deployment guide][6]

 ** 此处有Canvas,请手动处理 ** 

![](https://cdn-images-1.medium.com/max/1600/1*C9845SlyaaT1_xrAGOBURg.png)

### 安装部署 Minikube

1.  安装 [xhyve driver][1] 或 [VirtualBox][2] ，然后在上面安装 Liux 虚拟机以部署 minikube 。根据我的经验，VirtualBox更稳定一些

2.  [参照官方文档][3] 安装 minikube 

3.  安装 `faas-cli` ：

  使用 brew 安装

  ```brew install faas-cli```

  使用官方安装脚本

  ```curl -sL cli.openfaas.com | sudo sh```

4.  用 brew 安装 `helm` ：

  `brew install kubernetes-helm`

5.  运行 minikube :

  `minikube start`

> Docker Captain 的小贴士: Mac 和 Windows 版本的 Docker 已经集成了对 Kubernetes 的支持。现在我们使用 Kubernetes 的时候，已经不需要再安装额外的软件了。

### 在 minikube 上面部署 OpenFaaS

1.  给 Helm’s 服务器组件新建账号 tiller:

  ```kubectl -n kube-system create sa tiller &&  kubectl create clusterrolebinding tiller \
  --clusterrole cluster-admin \
  --serviceaccount=kube-system:tiller```

2.  安装 Helm 的服务端组件 tiller:

  `helm init --skip-refresh --upgrade --service-account tiller`

3.  Git Clone faas-netes (Kubernetes 上面的 OpenFaaS 驱动程序): 

  `git clone https://github.com/openfaas/faas-netes && cd faas-netes`

4.  Minikube 没有配置 RBAC, 这里我们需要把 RBAC 关闭:

  `helm upgrade --install --debug --reset-values --set async=false --set rbac=false openfaas openfaas/`

  译者注：RBAC（Role-Based access control）基于角色的访问权限控制，在计算机权限管理中较为常用，详情请参考以下链接：
  https://en.wikipedia.org/wiki/Role-based_access_control

现在，你可以看到 OpenFaaS pods 已经在你的 minikube 群集上运行起来了。输入 `kubectl get pods` 以查看 OpenFaaS pods:

```
NAME                            READY     STATUS    RESTARTS   AGE
```

```
alertmanager-6dbdcddfc4-fjmrf   1/1       Running   0          1m
```

```
faas-netesd-7b5b7d9d4-h9ftx     1/1       Running   0          1m
```

```
gateway-965d6676d-7xcv9         1/1       Running   0          1m
```

```
prometheus-64f9844488-t2mvn     1/1       Running   0          1m
```

30,000ft:

API gateway 进程包含了一个 [用于测试的最小化 UI][7] ，同时开放了用于功能管理的 [RESTful API][8] 。
faas-netesd 守护进程是一种 Kubernetes 控制器，用来连接 Kubernetes API 服务实现对 Kubernetes 函数、部署和密码的管理功能。
Prometheus 和 AlertManager 进程协同工作，实现 OpenFaaS 函数的弹性缩放，以满足业务需求。通过 Prometheus metrics 我们可以查看系统的整体运行状态，还可以用来开发功能强悍的仪表盘（Dashboard）。

Prometheus 仪表盘示例:

![](https://cdn-images-1.medium.com/max/1600/1*b0RnaFIss5fOJXkpIJJgMw.jpeg)

### 部署/迁移/运行

和很多其他的 FaaS 项目不同，OpenFaaS 的创建和函数版本控制使用的是 Docker 镜像格式，这意味着咱可以在生产环境中使用 OpenFaaS 实现以下目标：

*   漏洞扫描（vulnerability scanning；译者注：此处我觉得应该理解为更快地实现漏洞补丁）

*   CI/CD （Continuous integration and continuous deployment 持续集成/持续开发 ）

*   滚动更新

你也可以在现有的生产环境群集中利用空闲资源部署 OpenFaaS。每个核心服务组件内存占用大概在 10-30MB 。

> OpenFaaS 一个关键的优势在于，它可以使用容器编排平台的 API ，这样可以和 Kubernetes 以及 Docker Swarm 进行本地集成。同时，由于使用Docker registry 进行函数的版本控制，咱可以按需扩展函数。同时不会对按需开发函数的框架造成额外的延时。

### 新建 function

`faas-cli new --lang python hello`

以上命令创建文件 `hello.yml` 以及文件夹 `handler`，文件夹有两个文件 handler.py 、requirements.txt ，包含了你可能需要用到的任何 pip 模块。你可以随时编辑这些文件和文件夹，不需要担心如何维护 Dockerfile--我们为你维护，并且使用以下最佳实践：

*   分级创建版本（multi-stage builds）

*   非 root 用户（non-root users）

*   以 Docker Alpine Linux 版本为基础进行镜像构建 (可变更)

### build function

先在本地创建函数，然后 push 到 Docker registry 。 使用 Docker Hub ，打开文件 `hello.yml` 然后输入你的账号名：

```
provider:
```

```
  name: faas
```

```
  gateway: http://localhost:8080
```

```
functions:
```

```
  hello:
```

```
    lang: python
```

```
    handler: ./hello
```

```
    image: alexellis2/hello
```

现在，调用一个 build 版本。你的系统上需要安装 Docker 。

`faas-cli build -f hello.yml`

把封装好函数的 Docker 镜像版本 push 到 Docker Hub。如果还没有登录 Docker hub ，继续前需要先输入命令 `docker login` 。

`faas-cli push -f hello.yml`

当系统中有多个函数的时候，可以使用 `--parallel=N` 来调用多核并行处理 build 或 push 任务。命令也支持这些选项 /-/-/> `--no-cache`  `--squash` 。

### 部署及测试 function

现在，可以部署、列出、调用函数了。每次调用函数时，可以通过 Prometheus 收集 metric 值。

```
$ export gw=http://$(minikube ip):31112
```

```
$ faas-cli deploy -f hello.yml --gateway $gw
Deploying: hello.
```

```
No existing function to remove
```

```
Deployed.
```

```
URL: http://192.168.99.100:31112/function/hello
```

上面给到的是部署时调用函数的标准方法，你也可以使用下面的命令：

```
$ echo test | faas-cli invoke hello --gateway $gw
```

现在可以通过以下命令列出部署好的函数，你将看到调用计数器数值增加。

```
$ faas-cli list --gateway $gw
Function                       Invocations     Replicas
```

```
hello                          1               1
```

 _提示：这条命令也可以 also accepts a _  `_--verbose_`  _ flag for more information._ 

Since we are running OpenFaaS on a remote cluster (a Linux VM) we set up a `--gateway` override environmental variable. This could also be a remote host on a cloud platform. The alternative is to update the gateway value in your .yml file.

### Moving beyond minikube

Once you are familiar with OpenFaaS on minikube you can deploy to any Kubernetes cluster running on Linux hosts. Here’s an example of OpenFaaS running on Kubernetes on Google’s GKE platform by Stefan Prodan of WeaveWorks demonstrating the built-in auto-scaling capabilities:


### Keep learning

We have dozens of guides and blog available to get you up and running on the “FaaS Train” — head over to GitHub and bookmark our guides:

[openfaas/faas
faas - OpenFaaS - Serverless Functions Made Simple for Docker & Kubernetesgithub.com][9][][10]

I’ve included a short 15min video from Dockercon 2017 in Copenhagen where I gave an overview of Serverless and OpenFaaS at the Moby Summit.

Make sure to follow [OpenFaaS on Twitter][11] for all the latest Cool Hacks, demos and news.

--------------------------------------------------------------------------------

via: https://medium.com/@alexellisuk/getting-started-with-openfaas-on-minikube-634502c7acdf

作者：[Alex Ellis ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
