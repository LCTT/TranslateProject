Minikube：使用 Kubernetes 进行本地开发
============================================================

如果你的运维团队在使用 Docker 和 Kubernetes，那么建议开发上采用相同或相似的技术。这将减少不兼容性和可移植性问题的数量，并使每个人都会认识到应用程序容器是开发和运维团队的共同责任。

![](https://cdn-images-1.medium.com/max/1000/1*3RHSw_mAFsUhObmbHyjVOg.jpeg)

这篇博客文章介绍了 Kubernetes 在开发模式中的用法，它的灵感来自于一个视频教程，你可以在“[无痛 Docker 教程][10]”中找到它。

![](https://cdn-images-1.medium.com/max/800/1*a02rarYYYvd7GalkyQ3AXg.jpeg)

Minikube 是一个允许开发人员在本地使用和运行 Kubernetes 集群的工具，从而使开发人员的生活变得轻松。

在这篇博客中，对于我测试的例子，我使用的是 Linux Mint 18，但其它 Linux 发行版在安装部分没有区别。

```
cat /etc/lsb-release 
```

```
DISTRIB_ID=LinuxMint
DISTRIB_RELEASE=18.1
DISTRIB_CODENAME=serena
DISTRIB_DESCRIPTION=”Linux Mint 18.1 Serena”
```

![](https://cdn-images-1.medium.com/max/800/1*DZzICImnejKbNV-NCa3gEg.png)

### 先决条件

为了与 Minkube 一起工作，我们应该安装 Kubectl 和 Minikube 和一些虚拟化驱动程序。

*  对于 OS X，安装 [xhyve 驱动][2]、[VirtualBox][3] 或者 [VMware Fusion][4]，然后再安装 Kubectl 和 Minkube。

	```
	curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl

	chmod +x ./kubectl

	sudo mv ./kubectl /usr/local/bin/kubectl

	curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.21.0/minikube-darwin-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
	```

*   对于 Windows，安装 [VirtualBox][6] 或者 [Hyper-V][7]，然后再安装 Kubectl 和 Minkube。

	```
	curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.7.0/bin/windows/amd64/kubectl.exe
	```

	将二进制文件添加到你的 PATH 中（这篇[文章][11]解释了如何修改 PATH）

	下载 `minikube-windows-amd64.exe`，将其重命名为 `minikube.exe`，并将其添加到你的 PATH 中。[在这][12]可以找到最新版本。

*   对于 Linux，安装 [VirtualBox][8] 或者 [KVM][9]，然后再安装 Kubectl 和 Minkube。

	```
	curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
	
	chmod +x ./kubectl

	sudo mv ./kubectl /usr/local/bin/kubectl

	curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.21.0/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
	```

### 使用 Minikube

我们先从这个 Dockerfile 创建一个镜像：

```
FROM busybox
ADD index.html /www/index.html
EXPOSE 8000
CMD httpd -p 8000 -h /www; tail -f /dev/null
```

添加你希望在 index.html 中看到的内容。

构建镜像：

```
docker build -t eon01/hello-world-web-server .
```

我们来运行容器来测试它：

```
docker run -d --name webserver -p 8000:8000 eon01/hello-world-web-server
```

这是 `docker ps` 的输出：

```
docker ps

CONTAINER ID        IMAGE                          COMMAND                  CREATED             STATUS              PORTS                    NAMES
2ad8d688d812        eon01/hello-world-web-server   "/bin/sh -c 'httpd..."   3 seconds ago       Up 2 seconds        0.0.0.0:8000->8000/tcp   webserver
```

让我们提交镜像并将其上传到公共 Docker Hub 中。你也可以使用自己的私有仓库：

```
docker commit webserver
docker push eon01/hello-world-web-server
```

删除容器，因为我们将与 Minikube 一起使用它。

```
docker rm -f webserver
```

启动 Minikube：

```
minkube start
```

检查状态：

```
minikube status
```

我们运行一个单一节点：

```
kubectl get node
```

运行 webserver：

```
kubectl run webserver --image=eon01/hello-world-web-server --port=8000
```

webserver 应该会暴露它的端口：

```
kubectl expose deployment webserver --type=NodePort
```

为了得到服务 url 输入：

```
minikube service webserver --url
```

使用下面的命令得到 Web 页面的内容：

```
curl $(minikube service webserver --url)
```

显示运行中集群的摘要：

```
kubectl cluster-info
```

更多细节：

```
kubectl cluster-info dump
```

我们还可以使用以下方式列出 pod：

```
kubectl get pods
```

使用下面的方式访问面板：

```
minikube dashboard
```

如果你想访问 Web 程序的前端，输入：

```
kubectl proxy
```

如果我们要在容器内部执行一个命令，请使用以下命令获取 pod id：

```
kubetctl get pods
```

然后像这样使用：

```
kubectl exec webserver-2022867364-0v1p9 -it -- /bin/sh
```

最后完成了，请删除所有部署：

```
kubectl delete deployments --all
```

删除所有 pod：

```
kubectl delete pods --all
```

并且停止 Minikube。

```
minikube stop
```

我希望你享受这个介绍。

### 更加深入

如果你对本文感到共鸣，您可以在[无痛 Docker 教程][13]中找到更多有趣的内容。

我们 [Eralabs][14] 将很乐意为你的 Docker 和云计算项目提供帮助，[联系我们][15]，我们将很乐意听到你的项目。

请订阅 [DevOpsLinks][16]：成千上万的 IT 专家和 DevOps 爱好者在线社区。

你可能也有兴趣加入我们的新闻订阅 [Shipped][17]，一个专注于容器，编排和无服务技术的新闻订阅。

你可以在 [Twitter][18]、[Clarity][19] 或我的[网站][20]上找到我，你也可以看看我的书：[SaltStack For DevOps][21]。

不要忘记加入我的最后一个项目 [DevOps 的职位][22]！

如果你喜欢本文，请推荐它，并与你的关注者分享。

--------------------------------------------------------------------------------

作者简介：

Aymen El Amri - 云和软件架构师、企业家、作者、www.eralabs.io 的 CEO、www.devopslinks.com 的创始人，个人页面：www.aymenelamri.com

-------------------


via: https://medium.com/devopslinks/using-kubernetes-minikube-for-local-development-c37c6e56e3db

作者：[Aymen El Amri][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@eon01
[1]:http://painlessdocker.com/
[2]:https://git.k8s.io/minikube/docs/drivers.md#xhyve-driver
[3]:https://www.virtualbox.org/wiki/Downloads
[4]:https://www.vmware.com/products/fusion
[5]:https://storage.googleapis.com/kubernetes-release/release/stable.txt%29/bin/darwin/amd64/kubectl
[6]:https://www.virtualbox.org/wiki/Downloads
[7]:https://msdn.microsoft.com/en-us/virtualization/hyperv_on_windows/quick_start/walkthrough_install
[8]:https://www.virtualbox.org/wiki/Downloads
[9]:http://www.linux-kvm.org/
[10]:http://painlessdocker.com/
[11]:https://www.windows-commandline.com/set-path-command-line/
[12]:https://github.com/kubernetes/minikube/releases
[13]:http://painlessdocker.com/
[14]:http://eralabs.io/
[15]:http://eralabs.io/
[16]:http://devopslinks.com/
[17]:http://shipped.devopslinks.com/
[18]:https://twitter.com/eon01
[19]:https://clarity.fm/aymenelamri/
[20]:http://aymenelamri.com/
[21]:http://saltstackfordevops.com/
[22]:http://jobsfordevops.com/
