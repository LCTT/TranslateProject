[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12766-1.html)
[#]: subject: (Automate your container orchestration with Ansible modules for Kubernetes)
[#]: via: (https://opensource.com/article/20/9/ansible-modules-kubernetes)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 Ansible 的 Kubernetes 模块实现容器编排自动化
======

> 将 Kubernetes 与 Ansible 结合实现云端自动化。此外，还可以参照我们的 Ansible 的 k8s 模块速查表。

![](https://img.linux.net.cn/data/attachment/album/202010/28/211747jhlttlf3f81xrffi.jpg)

[Ansible][2] 是实现自动化工作的优秀工具，而 [Kubernetes][3] 则是容器编排方面的利器，要是把两者结合起来，会有怎样的效果呢？正如你所猜测的，Ansible + Kubernetes 的确可以实现容器编排自动化。

### Ansible 模块

实际上，Ansible 本身只是一个用于解释 YAML 文件的框架。它真正强大之处在于它[丰富的模块][4]，所谓<ruby>模块<rt>module</rt></ruby>，就是在 Ansible <ruby>剧本<rt>playbook</rt></ruby> 中让你得以通过简单配置就能调用外部应用程序的一些工具。

Ansible 中有模块可以直接操作 Kubernetes，也有对一些相关组件（例如 [Docker][5] 和 [Podman][6]）实现操作的模块。学习使用一个新模块的过程和学习新的终端命令、API 一样，可以先从文档中了解这个模块在调用的时候需要接受哪些参数，以及这些参数在外部应用程序中产生的具体作用。

### 访问 Kubernetes 集群

在使用 Ansible Kubernetes 模块之前，先要有能够访问 Kubernetes 集群的权限。在没有权限的情况下，可以尝试使用一个短期在线试用账号，但我们更推荐的是按照 Kubernetes 官网上的指引，或是参考 Braynt Son 《[入门 Kubernetes][8]》的教程安装 [Minikube][7]。Minikube 提供了一个单节点 Kubernetes 实例的安装过程，你可以像使用一个完整集群一样对其进行配置和交互。

- 下载 [Ansible k8s 速记表][9]（需注册）

在安装 Minikube 之前，你需要确保你的环境支持虚拟化并安装 `libvirt`，然后对 `libvirt` 用户组授权：

```
$ sudo dnf install libvirt
$ sudo systemctl start libvirtd
$ sudo usermod --append --groups libvirt `whoami`
$ newgrp libvirt
```

#### 安装 Python 模块

为了能够在 Ansible 中使用 Kubernetes 相关的模块，你需要安装以下这些 Python 模块：

```
$ pip3.6 install kubernetes --user
$ pip3.6 install openshift --user
```

#### 启动 Kubernetes

如果你使用的是 Minikube 而不是完整的 Kubernetes 集群，请使用 `minikube` 命令在本地创建一个最精简化的 Kubernetes 实例：

```
$ minikube start --driver=kvm2 --kvm-network default
```

然后等待 Minikube 完成初始化，这个过程所需的时间会因实际情况而异。

### 获取集群信息

集群启动以后，通过 `cluster-info` 选项就可以获取到集群相关信息了：

```
$ kubectl cluster-info
Kubernetes master is running at https://192.168.39.190:8443
KubeDNS is running at https://192.168.39.190:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```

### 使用 k8s 模块

Ansible 使用 `k8s` 这个模块来实现对 Kubernetes 的操作，在剧本中使用 `k8s` 模块就可以对 Kuvernetes 对象进行管理。这个模块描述了 `kubectl` 命令的最终状态，例如对于以下这个使用 `kubectl` 创建新的[命名空间][10]的操作：

```
$ kubectl create namespace my-namespace
```

这是一个很简单的操作，而对这个操作的最终状态用 YAML 文件来描述是这样的：

```
- hosts: localhost
  tasks:
    - name: create namespace
      k8s:
        name: my-namespace
        api_version: v1
        kind: Namespace
        state: present
```

如果你使用的是 Minikube，那么主机名（`hosts`）应该定义为 `localhost`。需要注意的是，所使用的模块也定义了可用参数的语法（例如 `api_version` 和 `kind` 参数）。

在运行这个剧本之前，先通过 `yamllint` 命令验证是否有错误：

```
$ yamllint example.yaml
```

确保没有错误之后，运行剧本：

```
$ ansible-playbook ./example.yaml
```

可以验证新的命名空间是否已经被创建出来：

```
$ kubectl get namespaces
NAME              STATUS   AGE
default           Active   37h
kube-node-lease   Active   37h
kube-public       Active   37h
kube-system       Active   37h
demo              Active   11h
my-namespace      Active   3s
```

### 使用 Podman 拉取容器镜像

容器是个 Linux 系统，几乎是最小化的，可以由 Kubernetes 管理。[LXC 项目][11]和 Docker 定义了大部分的容器规范。最近加入容器工具集的是 Podman，它不需要守护进程就可以运行，为此受到了很多用户的欢迎。

通过 Podman 可以从 Docker Hub 或者 Quay.io 等存储库拉取容器镜像。这一操作对应的 Ansible 语法也很简单，只需要将存储库网站提供的镜像路径写在剧本中的相应位置就可以了：

```
   - name: pull an image
      podman_image:
        name: quay.io/jitesoft/nginx
```

使用 `yamllint` 验证：

```
$ yamllint example.yaml
```

运行剧本：

```
$ ansible-playbook ./example.yaml
[WARNING]: provided hosts list is empty, only localhost is available.
Note that the implicit localhost does not match 'all'

PLAY [localhost] ************************

TASK [Gathering Facts] ************************
ok: [localhost]

TASK [create k8s namespace] ************************
ok: [localhost]

TASK [pull an image] ************************
changed: [localhost]

PLAY RECAP ************************
localhost: ok=3 changed=1 unreachable=0 failed=0
           skipped=0 rescued=0 ignored=0
```

### 使用 Ansible 实现部署

Ansible 除了可以执行小型维护任务以外，还可以通过剧本实现其它由 `kubectl` 实现的功能，因为两者的 YAML 文件之间只有少量的差异。在 Kubernetes 中使用的 YAML 文件只需要稍加改动，就可以在 Ansible 剧本中使用。例如下面这个用于使用 `kubectl` 命令部署 Web 服务器的 YAML 文件：

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-webserver
spec:
  selector:
    matchLabels:
      run: my-webserver
  replicas: 1
  template:
    metadata:
      labels:
        run: my-webserver
    spec:
      containers:
      - name: my-webserver
        image: nginx
        ports:
        - containerPort: 80
```

如果你对其中的参数比较熟悉，你只要把 YAML 文件中的大部分内容放到剧本中的 `definition` 部分，就可以在 Ansible 中使用了：

```
   - name: deploy a web server
      k8s:
        api_version: v1
        namespace: my-namespace
        definition:
          kind: Deployment
          metadata:
            labels:
              app: nginx
            name: nginx-deploy
          spec:
            replicas: 1
            selector:
              matchLabels:
                app: nginx
            template:
              metadata:
                labels:
                  app: nginx
              spec:
                containers:
                  - name: my-webserver
                    image: quay.io/jitesoft/nginx
                    ports:
                      - containerPort: 80
                        protocol: TCP
```

执行完成后，使用 `kubectl` 命令可以看到预期中的的<ruby>部署<rt>deployment</rt></ruby>：

```
$ kubectl -n my-namespace get pods
NAME                      READY  STATUS
nginx-deploy-7fdc9-t9wc2  1/1    Running
```

### 在云上使用模块

随着现在越来越多的开发和部署工作往云上转移的趋势，我们必须了解如何在云上实现自动化。其中 `k8s` 和 `podman_image` 这两个模块只是云开发中的其中一小部分。你可以在你的工作流程中寻找一些需要自动化的任务，并学习如何使用 Ansible 让你在这些任务上事半功倍。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/ansible-modules-kubernetes

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://opensource.com/resources/what-ansible
[3]: https://opensource.com/resources/what-is-kubernetes
[4]: https://docs.ansible.com/ansible/latest/modules/modules_by_category.html
[5]: https://opensource.com/resources/what-docker
[6]: http://podman.io
[7]: https://kubernetes.io/docs/tasks/tools/install-minikube
[8]: https://opensource.com/article/18/10/getting-started-minikube
[9]: https://opensource.com/downloads/ansible-k8s-cheat-sheet
[10]: https://opensource.com/article/19/10/namespaces-and-containers-linux
[11]: https://www.redhat.com/sysadmin/exploring-containers-lxc
