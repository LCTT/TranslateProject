#mandeler Translating Getting started with OpenFaaS on minikube
============================================================

本文将介绍如何借助 minikube [4] 在 Kubernetes 1.8 上搭建 OpenFaaS-Serverless Functions Made Simple。minikube 是一个 [Kubernetes][5] 发行版，借助它，你可以在笔记本电脑上运行 Kubernetes 群集，minikube 支持 Mac 和 Linux ，但是在 MacOS 上使用得多一些。

> This post is based upon our [Official Kubernetes Deployment guide][6]

 ** 此处有Canvas,请手动处理 ** 

![](https://cdn-images-1.medium.com/max/1600/1*C9845SlyaaT1_xrAGOBURg.png)

### 安装部署 Minikube

1.  安装 [xhyve driver][1] 或 [VirtualBox][2] ，然后在上面安装 Liux 虚拟机以部署 minikube 。根据我的经验，VirtualBox更稳定一些

2.  参照官方文档  [3] 安装 minikube 

3.  安装 `faas-cli` ：
 # 使用 brew 安装
  `brew install faas-cli`
 # 使用官方安装脚本
  `curl -sL cli.openfaas.com | sudo sh`

4.  用 brew 安装 `helm` ：
  `brew install kubernetes-helm`

5.  运行 minikube :
  `minikube start`

> Docker Captain 的小贴士: Docker Inc 从某个时候开始（译者注：Moby 项目开源的时候） Mac 和 Windows 版本就继承了 Kubernetes 的支持。这样我们在使用 Kubernetes 的时候，就不需要再安装额外的软件了。

### 在 minikube 上面部署 OpenFaaS

1.  给 Helm’s 服务器组件新建账号 tiller:
  `kubectl -n kube-system create sa tiller 
  && kubectl create clusterrolebinding tiller \
  --clusterrole cluster-admin \
  --serviceaccount=kube-system:tiller`

2.  安装 Helm 的服务端组件 tiller:
  `helm init --skip-refresh --upgrade --service-account tiller`

3.  Git Clone faas-netes (Kubernetes 上面的 OpenFaaS 驱动程序): 
  `git clone https://github.com/openfaas/faas-netes && cd faas-netes`

4.  Minikube 没有配置 RBAC, 这里我们需要把 RBAC 关闭:
  `helm upgrade --install --debug --reset-values --set async=false --set rbac=false openfaas openfaas/`
 # 译者注：RBAC（Role-Based access control）基于角色的访问权限控制，在计算机权限管理中较为常用，详情请参考以下链接：
   https://en.wikipedia.org/wiki/Role-based_access_control

现在，你可以看到 OpenFaaS 实例（ 原文为 pods ）已经在你的 minikube 群集上运行起来了。输入 `kubectl get pods` 以查看 OpenFaaS 实例:

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

API gateway 进程包含了一个 [用于测试的最小化 UI] [7] ，同时开放了用于功能管理的 [RESTful API][8] 。
faas-netesd 守护进程是一种 Kubernetes 控制器，用来连接 Kubernetes API 服务实现对 Kubernetes 服务、部署和密码的管理功能。
Prometheus 和 AlertManager 进程协同工作，实现 OpenFaaS 功能的弹性缩放，以满足业务需求。通过 Prometheus metrics 我们可以查看系统的整体运行状态，还可以用来开发功能强悍的控制面板（Dashboard）。

Prometheus dashboard example:

![](https://cdn-images-1.medium.com/max/1600/1*b0RnaFIss5fOJXkpIJJgMw.jpeg)

### Build/ship/run

OpenFaaS uses the Docker image format for the creation and versioning of functions which means that unlike many other FaaS projects you can use this in production to do:

*   vulnerability scanning

*   CI/CD

*   rolling upgrades

You can also deploy OpenFaaS to your existing production cluster and make use of spare capacity. The core services require around 10–30MB of RAM each.

> A key advantage of OpenFaaS is that it works with the container orchestration platform’s API, which means we integrate natively with both Kubernetes and Docker Swarm. Also, since our functions are properly versioned within a Docker registry, we can scale our functions on demand without any additional latency associated with frameworks that build functions on demand.

### Scaffold a new function

`faas-cli new --lang python hello`

This will create `hello.yml` along with a `handler` folder containing your handler.py file and requirements.txt for any pip modules you may need. You can edit these at any time without worrying about maintaining a Dockerfile — we do that and use best practices:

*   multi-stage builds

*   non-root users

*   Official Docker Alpine Linux builds for the base (this is swappable)

### Build your function

Your function will be built on your local machine and then pushed to a Docker registry. Let’s use the Docker Hub — just edit the `hello.yml` file and enter your user account name:

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

Now invoke a build. You will need Docker on your local system.

`faas-cli build -f hello.yml`

Push the versioned Docker image which contains your function up to the Docker Hub. If you’ve not logged into the Docker hub then type in `docker login` before carrying on.

`faas-cli push -f hello.yml`

Once you have multiple functions you can use the `--parallel=N` flag to build or push with multiple cores at once. The CLI also supports options such as `--no-cache` and `--squash`.

### Deploy and test your function

Now you can deploy your function, see it listed and invoke it. Each time you invoke the function we collect metrics which are made available through Prometheus.

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

You are given a standard route for invoking the function in the deployment message, but can also use the CLI to save on typing:

```
$ echo test | faas-cli invoke hello --gateway $gw
```

Now list the functions deployed and you will see the invocation count has gone up.

```
$ faas-cli list --gateway $gw
Function                       Invocations     Replicas
```

```
hello                          1               1
```

 _Note: this command also accepts a _  `_--verbose_`  _ flag for more information._ 

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
