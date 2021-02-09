[#]: collector: (lujun9972)
[#]: translator: (Morisun029)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11628-1.html)
[#]: subject: (Demystifying Kubernetes)
[#]: via: (https://opensourceforu.com/2019/11/demystifying-kubernetes/)
[#]: author: (Abhinav Nath Gupta https://opensourceforu.com/author/abhinav-gupta/)

揭开 Kubernetes 的神秘面纱
======

![][2]

> Kubernetes 是一款生产级的开源系统，用于容器化应用程序的自动部署、扩展和管理。本文关于使用 Kubernetes 来管理容器。

 “容器”已成为最新的流行语之一。但是，这个词到底意味着什么呢？说起“容器”，人们通常会把它和 Docker 联系起来，Docker 是一个被定义为软件的标准化单元容器。该容器将软件和运行软件所需的环境封装到一个易于交付的单元中。
 
容器是一个软件的标准单元，用它来打包代码及其所有依赖项，这样应用程序就可以从一个计算环境到另一个计算环境快速可靠地运行。容器通过创建类似于 ISO 镜像的方式来实现此目的。容器镜像是一个轻量级的、独立的、可执行的软件包，其中包含运行应用程序所需的所有信息，包括代码、运行时、系统工具、系统库和设置。

容器镜像在运行时变成容器，对于 Docker 容器，镜像在 Docker 引擎上运行时变成容器。容器将软件与环境隔离开来，确保不同环境下的实例，都可以正常运行。

###什么是容器管理？

容器管理是组织、添加或替换大量软件容器的过程。容器管理使用软件来自动化创建、部署和扩展容器。这一过程就需要容器编排，容器编排是一个自动对基于容器的应用程序进行部署、管理、扩展、联网和提供可用性的工具。

### Kubernetes

Kubernetes 是一个可移植的、可扩展的开源平台，用于管理容器化的工作负载和服务，它有助于配置和自动化。它最初由 Google 开发，拥有一个庞大且快速增长的生态系统。Kubernetes 的服务、技术支持和工具得到广泛应用。

Google 在 2014 年开源了 Kubernetes 项目。Kubernetes 建立在 Google 十五年大规模运行生产工作负载的经验基础上，并结合了社区中最好的想法和实践以及声明式句法的使用。

下面列出了与Kubernetes生态系统相关的一些常用术语。

**Pod**：Pod 是 Kubernetes 应用程序的基本执行单元，是你创建或部署的 Kubernetes 对象模型中的最小和最简单的单元。Pod 代表在 Kubernetes 集群上运行的进程。

Pod 将运行中的容器、存储、网络 IP（唯一）和控制容器应如何运行的命令封装起来。它代表 Kubernetes 生态系统内的单个部署单元，代表一个应用程序的单个实例，该程序可能包含一个或多个紧密耦合并共享资源的容器。

Kubernetes 集群中的 Pod 有两种主要的使用方式。第一种是运行单个容器。即“一个容器一个 Pod”，这种方式是最常见的。第二种是运行多个需要一起工作的容器。

Pod 可能封装一个由紧密关联且需要共享资源的多个同位容器组成的应用程序。

<ruby>副本集<rt>ReplicaSet</rt></ruby>：副本集的目的是维护在任何给定时间运行的一组稳定的副本容器集。 副本集包含有关一个特定 Pod 应该运行多少个副本的信息。为了创建多个 Pod 以匹配副本集条件，Kubernetes 使用 Pod 模板。副本集与其 Pod 的链接是通过后者的 `metas.ownerReferences` 字段实现，该字段指定哪个资源拥有当前对象。

<ruby>服务<rt>Services</rt></ruby>：服务是一种抽象，用来公开一组 Pod 功能。使用 Kubernetes，你无需修改应用程序即可使用陌生服务发现机制。Kubernetes 给 Pod 提供了其自己的 IP 地址和一组 Pod 的单个 DNS 名称，并且可以在它们之间负载平衡。

服务解决的一个主要问题是 Web 应用程序前端和后端的集成。由于 Kubernetes 将幕后的 IP 地址提供给 Pod，因此当 Pod 被杀死并复活时，IP 地址会更改。这给给定的后端 IP 地址连接到相应的前端 IP 地址带来一个大问题。服务通过在 Pod 上提供抽象来解决此问题，类似于负载均衡器。

<ruby>卷<rt>Volumes</rt></ruby>： Kubernetes 卷具有明确的生命周期，与围绕它的 Pod 相同。 因此，卷超过了 Pod 中运行的任何容器的寿命，并且在容器重新启动后保留了数据。当然，当 Pod 不存在时，该卷也将不再存在。也许比这更重要的是 Kubernetes 支持多种类型的卷，并且 Pod 可以同时使用任意数量的卷。

卷的核心只是一个目录，其中可能包含一些数据，Pod 中的容器可以访问该目录。该目录是如何产生的，它后端基于什么存储介质，其中的数据内容是什么，这些都由使用的特定卷类型来决定的。

### 为什么选择 Kubernetes？

容器是捆绑和运行应用程序的好方法。在生产环境中，你需要管理运行应用程序的容器，并确保没有停机时间。例如，如果一个容器发生故障，则需要启动另一个容器。如果由系统自动实现这一操作，岂不是更好？ Kubernetes 就是来解决这个问题的！Kubernetes 提供了一个框架来弹性运行分布式系统。该框架负责扩展需求、故障转移、部署模式等。例如，Kubernetes 可以轻松管理系统的金丝雀部署。

Kubernetes 为用户提供了:

1. 服务发现和负载平衡
2. 存储编排
3. 自动退出和回退
4. 自动打包
5. 自我修复
6. 秘密配置管理

### Kubernetes 可以做什么？

在本文中，我们将会看到一些从头构建 Web 应用程序时如何使用 Kubernetes 的代码示例。我们将在 Python 中使用 Flask 创建一个简单的后端服务器。

对于那些想从头开始构建 Web 应用程序的人，有一些前提条件，即：

1. 对 Docker、Docker 容器和 Docker 镜像的基本了解。可以访问[这里][8]快速了解。
2. 系统中应该安装 Docker。
3. 系统中应该安装 Kubernetes，有关如何在本地计算机上安装的说明，请访问[这里][9]。

现在，创建一个目录，如下代码片段所示：

```
mkdir flask-kubernetes/app && cd flask-kubernetes/app
```

接下来，在 `flask-kubernetes/app` 目录中，创建一个名为 `main.py` 的文件，如下面的代码片段所示：

```
touch main.py
```

在新创建的 `main.py` 文件中，粘贴下面代码： 

```
from flask import Flask
app = Flask(__name__)
 
@app.route("/")
def hello():
    return "Hello from Kubernetes!"
 
if __name__ == "__main__":
    app.run(host='0.0.0.0')
```

使用下面命令在本地安装 Flask：

```
pip install Flask==0.10.1
```

Flask 安装后，执行下面的命令：

```
python app.py
```

应该在本地 5000 端口运行 Flask 服务器，这是 Flask 应用程序的默认端口，并且你可以在 http://localhost:5000 上看到输出 “Hello from Kubernetes!”。服务器在本地运行之后，我们创建一个供 Kubernetes 使用的 Docker 镜像。创建一个名为 `Dockerfile` 的文件，并将以下代码片段粘贴到其中：

```
FROM python:3.7
 
RUN mkdir /app
WORKDIR /app
ADD . /app/
RUN pip install -r requirements.txt
 
EXPOSE 5000
CMD ["python", "/app/main.py"]
```

`Dockerfile` 文件的说明如下：

1. Docker 将从 DockerHub 获取 Python 3.7 镜像。
2. 将在镜像中创建一个应用程序目录。
3. 它将一个 `/app` 目录设置为工作目录。
4. 将内容从主机中的应用程序目录复制到镜像应用程序目录。
5. 发布端口 5000。
6. 最后，它运行命令，启动 Flask 服务器。

接下来，我们将使用以下命令创建 Docker 镜像：

```
docker build -f Dockerfile -t flask-kubernetes:latest .
```

创建 Docker 镜像后，我们可以使用以下命令在本地运行该镜像进行测试：

```
docker run -p 5001:5000 flask-kubernetes
```

通过运行容器在本地完成测试之后，我们需要在 Kubernetes 中部署它。我们将首先使用 `kubectl` 命令验证 Kubernetes 是否正在运行。如果没有报错，则说明它正在工作。如果有报错，请参考[该信息][9]。

接下来，我们创建一个部署文件。这是一个 Yaml 文件，其中包含有关 Kubernetes 的说明，该说明涉及如何以声明性的方式创建 Pod 和服务。因为我们有 Flask Web 应用程序，我们将创建一个 `deployment.yaml` 文件，并在其中包含 Pod 和服务声明。

创建一个名为 `deployment.yaml` 的文件并向其中添加以下内容，然后保存：

```
apiVersion: v1
kind: Service
metadata:
  name: flask-kubernetes -service
spec:
  selector:
    app: flask-kubernetes
  ports:
  - protocol: "TCP"
    port: 6000
    targetPort: 5000
  type: LoadBalancer

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: flask-kubernetes
spec:
  replicas: 4
  template:
    metadata:
      labels:
        app: flask-kubernetes
    spec:
      containers:
      - name: flask-kubernetes
        image: flask-kubernetes:latest
        imagePullPolicy: Never
        ports:
        - containerPort: 5000
```

使用以下命令将 yaml 文件发送到 Kubernetes：

```
kubectl apply -f deployment.yaml
```

如果执行以下命令，你会看到 Pod 正在运行：

```
kubectl get pods
```

现在，导航至 http://localhost:6000，你应该会看到 “Hello from Kubernetes!”消息。成功了！ 该应用程序现在正在 Kubernetes 中运行！

### Kubernetes 做不了什么？

Kubernetes 不是一个传统的，包罗万象的 PaaS（平台即服务）系统。 由于 Kubernetes 运行在容器级别而非硬件级别，因此它提供了 PaaS 产品共有的一些普遍适用功能，如部署、扩展、负载平衡、日志记录和监控。Kubernetes 为开发人员平台提供了构建块，但在重要的地方保留了用户的选择和灵活性。

* Kubernetes 不限制所支持的应用程序的类型。如果应用程序可以在容器中运行，那么它应该可以在 Kubernetes 上更好地运行。
* 它不部署和构建源代码。
* 它不决定日志记录、监视或警报解决方案。
* 它不提供或不要求配置语言/系统。它提供了一个声明式的 API 供所有人使用。
* 它不提供或不采用任何全面的机器配置、维护、管理或自我修复系统。

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/11/demystifying-kubernetes/

作者：[Abhinav Nath Gupta][a]
选题：[lujun9972][b]
译者：[Morisun029](https://github.com/Morisun029)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/abhinav-gupta/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Gear-kubernetes.jpg?resize=696%2C457&ssl=1 (Gear kubernetes)
[2]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Gear-kubernetes.jpg?fit=800%2C525&ssl=1
[3]: https://secure.gravatar.com/avatar/f65917facf5f28936663731fedf545c4?s=100&r=g
[4]: https://opensourceforu.com/author/abhinav-gupta/
[5]: mailto:abhi.aec89@gmail.com
[6]: http://opensourceforu.com/wp-content/uploads/2013/10/assoc.png
[7]: https://feedburner.google.com/fb/a/mailverify?uri=LinuxForYou&loc=en_US
[8]: https://www.docker.com/sites/default/files/Docker_CheatSheet_08.09.2016_0.pdf
[9]: https://kubernetes.io/docs/setup/learning-environment/minikube/
