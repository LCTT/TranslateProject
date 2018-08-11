在 Kubernetes 上运行一个 Python 应用程序
============================================================

> 这个分步指导教程教你通过在 Kubernetes 上部署一个简单的 Python 应用程序来学习部署的流程。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/build_structure_tech_program_code_construction.png?itok=nVsiLuag)

Kubernetes 是一个具备部署、维护和可伸缩特性的开源平台。它在提供可移植性、可扩展性以及自我修复能力的同时，简化了容器化 Python 应用程序的管理。

不论你的 Python 应用程序是简单还是复杂，Kubernetes 都可以帮你高效地部署和伸缩它们，在有限的资源范围内滚动升级新特性。

在本文中，我将描述在 Kubernetes 上部署一个简单的 Python 应用程序的过程，它包括：

*   创建 Python 容器镜像
*   发布容器镜像到镜像注册中心
*   使用持久卷
*   在 Kubernetes 上部署 Python 应用程序

### 必需条件

你需要 Docker、`kubectl` 以及这个 [源代码][10]。

Docker 是一个构建和承载已发布的应用程序的开源平台。可以参照 [官方文档][11] 去安装 Docker。运行如下的命令去验证你的系统上运行的 Docker：

```
$ docker info
Containers: 0
Images: 289
Storage Driver: aufs
 Root Dir: /var/lib/docker/aufs
 Dirs: 289
Execution Driver: native-0.2
Kernel Version: 3.16.0-4-amd64
Operating System: Debian GNU/Linux 8 (jessie)
WARNING: No memory limit support
WARNING: No swap limit support
```

`kubectl` 是在 Kubernetes 集群上运行命令的一个命令行界面。运行下面的 shell 脚本去安装 `kubectl`：

```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
```

部署到 Kubernetes 的应用要求必须是一个容器化的应用程序。我们来回顾一下 Python 应用程序的容器化过程。

### 一句话了解容器化

容器化是指将一个应用程序所需要的东西打包进一个自带操作系统的容器中。这种完整机器虚拟化的好处是，一个应用程序能够在任何机器上运行而无需考虑它的依赖项。

我们以 Roman Gaponov 的 [文章][12] 为参考，来为我们的 Python 代码创建一个容器。

### 创建一个 Python 容器镜像

为创建这些镜像，我们将使用 Docker，它可以让我们在一个隔离的 Linux 软件容器中部署应用程序。Docker 可以使用来自一个 Dockerfile 中的指令来自动化构建镜像。

这是我们的 Python 应用程序的 Dockerfile：

```
FROM python:3.6
MAINTAINER XenonStack

# Creating Application Source Code Directory
RUN mkdir -p /k8s_python_sample_code/src

# Setting Home Directory for containers
WORKDIR /k8s_python_sample_code/src

# Installing python dependencies
COPY requirements.txt /k8s_python_sample_code/src
RUN pip install --no-cache-dir -r requirements.txt

# Copying src code to Container
COPY . /k8s_python_sample_code/src/app

# Application Environment variables
ENV APP_ENV development

# Exposing Ports
EXPOSE 5035

# Setting Persistent data
VOLUME ["/app-data"]

# Running Python Application
CMD ["python", "app.py"]
```

这个 Dockerfile 包含运行我们的示例 Python 代码的指令。它使用的开发环境是 Python 3.5。

### 构建一个 Python Docker 镜像

现在，我们可以使用下面的这个命令按照那些指令来构建 Docker 镜像：

```
docker build -t k8s_python_sample_code .
```

这个命令为我们的 Python 应用程序创建了一个 Docker 镜像。

### 发布容器镜像

我们可以将我们的 Python 容器镜像发布到不同的私有/公共云仓库中，像 Docker Hub、AWS ECR、Google Container Registry 等等。本教程中我们将发布到 Docker Hub。

在发布镜像之前，我们需要给它标记一个版本号：

```
docker tag k8s_python_sample_code:latest k8s_python_sample_code:0.1
```

### 推送镜像到一个云仓库

如果使用一个 Docker 注册中心而不是 Docker Hub 去保存镜像，那么你需要在你本地的 Docker 守护程序和 Kubernetes Docker 守护程序上添加一个容器注册中心。对于不同的云注册中心，你可以在它上面找到相关信息。我们在示例中使用的是 Docker Hub。

运行下面的 Docker 命令去推送镜像：

```
docker push k8s_python_sample_code
```

### 使用 CephFS 持久卷

Kubernetes 支持许多的持久存储提供商，包括 AWS EBS、CephFS、GlusterFS、Azure Disk、NFS 等等。我在示例中使用 CephFS 做为 Kubernetes 的持久卷。

为使用 CephFS 存储 Kubernetes 的容器数据，我们将创建两个文件：

`persistent-volume.yml` ：

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: app-disk1
  namespace: k8s_python_sample_code
spec:
  capacity:
  storage: 50Gi
  accessModes:
  - ReadWriteMany
  cephfs:
  monitors:
    - "172.17.0.1:6789"
  user: admin
  secretRef:
    name: ceph-secret
  readOnly: false
```

`persistent_volume_claim.yaml`：

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: appclaim1
  namespace: k8s_python_sample_code
spec:
  accessModes:
  - ReadWriteMany
  resources:
  requests:
    storage: 10Gi
```

现在，我们将使用 `kubectl` 去添加持久卷并声明到 Kubernetes 集群中：

```
$ kubectl create -f persistent-volume.yml
$ kubectl create -f persistent-volume-claim.yml
```

现在，我们准备去部署 Kubernetes。

### 在 Kubernetes 上部署应用程序

为管理部署应用程序到 Kubernetes 上的最后一步，我们将创建两个重要文件：一个服务文件和一个部署文件。

使用下列的内容创建服务文件，并将它命名为 `k8s_python_sample_code.service.yml`：

```
apiVersion: v1
kind: Service
metadata:
  labels:
  k8s-app: k8s_python_sample_code
  name: k8s_python_sample_code
  namespace: k8s_python_sample_code
spec:
  type: NodePort
  ports:
  - port: 5035
  selector:
  k8s-app: k8s_python_sample_code
```

使用下列的内容创建部署文件并将它命名为 `k8s_python_sample_code.deployment.yml`：

```
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: k8s_python_sample_code
  namespace: k8s_python_sample_code
spec:
  replicas: 1
  template:
  metadata:
    labels:
    k8s-app: k8s_python_sample_code
  spec:
    containers:
    - name: k8s_python_sample_code
      image: k8s_python_sample_code:0.1
      imagePullPolicy: "IfNotPresent"
      ports:
      - containerPort: 5035
      volumeMounts:
        - mountPath: /app-data
          name: k8s_python_sample_code
     volumes: 
         - name: <name of application>
           persistentVolumeClaim:
             claimName: appclaim1
```

最后，我们使用 `kubectl` 将应用程序部署到 Kubernetes：

```
$ kubectl create -f k8s_python_sample_code.deployment.yml $ kubectl create -f k8s_python_sample_code.service.yml
```

现在，你的应用程序已经成功部署到 Kubernetes。

你可以通过检查运行的服务来验证你的应用程序是否在运行：

```
kubectl get services
```

或许 Kubernetes 可以解决未来你部署应用程序的各种麻烦！

 _想学习更多关于 Python 的知识？Nanjekye 的书，[和平共处的 Python 2 和 3][7] 提供了完整的方法，让你写的代码在 Python 2 和 3 上完美运行，包括如何转换已有的 Python 2 代码为能够可靠运行在 Python 2 和 3 上的代码的详细示例。_ 


### 关于作者

 [![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/joannah-nanjekye.jpg?itok=F4RqEjoA)][13] Joannah Nanjekye - Straight Outta 256，只要结果不问原因，充满激情的飞行员，喜欢用代码说话。[关于我的更多信息][8]

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/running-python-application-kubernetes

作者：[Joannah Nanjekye][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/nanjekyejoannah
[1]:https://opensource.com/resources/python?intcmp=7016000000127cYAAQ
[2]:https://opensource.com/resources/python/ides?intcmp=7016000000127cYAAQ
[3]:https://opensource.com/resources/python/gui-frameworks?intcmp=7016000000127cYAAQ
[4]:https://opensource.com/tags/python?intcmp=7016000000127cYAAQ
[5]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ
[6]:https://opensource.com/article/18/1/running-python-application-kubernetes?rate=D9iKksKbd9q9vOVb92Mg-v0Iyqn0QVO5fbIERTbSHz4
[7]:https://www.apress.com/gp/book/9781484229545
[8]:https://opensource.com/users/nanjekyejoannah
[9]:https://opensource.com/user/196386/feed
[10]:https://github.com/jnanjekye/k8s_python_sample_code/tree/master
[11]:https://docs.docker.com/engine/installation/
[12]:https://hackernoon.com/docker-tutorial-getting-started-with-python-redis-and-nginx-81a9d740d091
[13]:https://opensource.com/users/nanjekyejoannah
[14]:https://opensource.com/users/nanjekyejoannah
[15]:https://opensource.com/users/nanjekyejoannah
[16]:https://opensource.com/tags/python
[17]:https://opensource.com/tags/kubernetes
