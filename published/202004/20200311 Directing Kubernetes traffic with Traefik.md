[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12049-1.html)
[#]: subject: (Directing Kubernetes traffic with Traefik)
[#]: via: (https://opensource.com/article/20/3/kubernetes-traefik)
[#]: author: (Lee Carpenter https://opensource.com/users/carpie)

使用 Traefik 引导 Kubernetes 流量
======

> 将流量引入 Kubernetes 树莓派集群的分步指南。

![Digital creative of a browser on the internet][1]

在本文中，我们将部署几个简单的网站，并学习如何使用 Traefik 将来自外部世界的流量引入到我们的集群中。之后，我们还将学习如何删除 Kubernetes 资源。让我们开始吧！

- [video](https://img.linux.net.cn/static/video/Ingressing%20with%20k3s-QcC-5fRhsM8.mp4)

### 准备

要继续阅读本文，你只需要我们在上一篇文章中构建的 [k3s 树莓派集群][2]。由于你的集群将从网络上拉取镜像，因此该集群需要能够访问互联网。

出于解释目的，本文将显示一些配置文件和示例 HTML 文件。所有示例文件都可以在[此处][3]下载。

### 部署一个简单的网站

之前，我们使用 `kubectl` 进行了直接部署。但是，这不是典型的部署方法。一般情况都会使用 YAML 配置文件，这也是我们要在本文中使用的配置文件。我们将从顶部开始，并以自顶向下的方式创建该配置文件。

### 部署配置

首先是部署配置。配置如下所示，并在下面进行说明。我通常以 [Kubernetes 文档][4]中的示例为起点，然后根据需要对其进行修改。例如，下面的配置是复制了[部署文档][5]中的示例后修改的。

创建一个文件 `mysite.yaml`，其内容如下：

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysite-nginx
  labels:
    app: mysite-nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mysite-nginx
  template:
    metadata:
      labels:
        app: mysite-nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
```

其中大部分是样板。重要的部分，我们会将该部署命名为 `mysite-nginx`，并为其加上同名的 `app` 标签。我们指定了一个<ruby>副本<rt>replica</rt></ruby>，这意味着将只创建一个 Pod。我们还指定了一个容器，我们将其命名为 `nginx`。我们将<ruby>镜像<rt>image</rt></ruby>指定为 `nginx`。这意味着在部署时，k3s 将从 DockerHub 下载 `nginx` 镜像并从中创建一个 Pod。最后，我们指定了<ruby>容器端口<rt>containerPort</rt></ruby>为 `80`，这只意味着在容器内部 Pod 会监听 `80` 端口。

我在上面强调了“在容器内部”，因为这是一个重要的区别。由于我们是按容器配置的，因此只能在容器内部访问它，并且进一步将其限制为内部网络。这对于允许多个容器在同一容器端口上监听所是必要的。换句话说，通过这种配置，其他一些 Pod 也可以在其容器端口 80 上侦听，并且不会与此容器冲突。为了提供对该 Pod 的正式访问权限，我们需要一个<ruby>服务<rt>service</rt></ruby>配置。

### 服务配置

在 Kubernetes 中，<ruby>服务<rt>service</rt></ruby>是一种抽象。它提供了一种访问 Pod 或 Pod 集合的方法。当连接到服务时，服务会路由到单个 Pod，或者如果定义了多个 Pod 副本，会通过负载均衡路由到多个 Pod。

可以在同一配置文件中指定该服务，这就是我们将在此处要做的。用 `---` 分隔配置区域，将以下内容添加到 `mysite.yaml` 中：

```
---
apiVersion: v1
kind: Service
metadata:
  name: mysite-nginx-service
spec:
  selector:
    app: mysite-nginx
  ports:
    - protocol: TCP
      port: 80
```

在此配置中，我们将服务命名为 `mysite-nginx-service`。我们提供了一个<ruby>选择器<rt>selector</rt></ruby>：`app: mysite-nginx`。这是服务选择其路由到的应用程序容器的方式。请记住，我们为容器提供了 `app` 标签：`mysite-nginx` 。这就是服务用来查找我们的容器的方式。最后，我们指定服务协议为 `TCP`，在端口 `80` 上监听。

### 入口配置

<ruby>入口<rt>Ingress</rt></ruby>配置指定了如何将流量从集群外部传递到集群内部的服务。请记住，k3s 预先配置了 Traefik 作为入口控制器。因此，我们将编写特定于 Traefik 的入口配置。将以下内容添加到 `mysite.yaml` 中（不要忘了用 `---` 分隔）：

```
---
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: mysite-nginx-ingress
  annotations:
    kubernetes.io/ingress.class: "traefik"
spec:
  rules:
  - http:
      paths:
      - path: /
        backend:
          serviceName: mysite-nginx-service
          servicePort: 80
```

在此配置中，我们将入口记录命名为 `mysite-nginx-ingress`。我们告诉 Kubernetes，我们希望 `traefik` 成为我们的入口控制器，再加上 `kubernetes.io/ingress.class` 的注解。

在<ruby>规则<rt>rules</rt></ruby>部分中，我们基本上是说，当 `http` 流量进入时，并且 `path` 匹配 `/`（或其下的任何内容），将其路由到由 `serviceName mysite-nginx-service` 指定的<ruby>后端<rt>backend</rt></ruby>服务中，并将其路由到 `servicePort 80`。这会将传入的 HTTP 流量连接到我们之前定义的服务。

### 需要部署的东西

就配置而言，就是这样了。如果我们现在部署，我们将获得默认的 nginx 页面，但这不是我们想要的。让我们创建一些简单但可自定义的部署方式。创建具有以下内容的文件 `index.html`：

```
<html>
<head><title>K3S!</title>
  <style>
    html {
      font-size: 62.5%;
    }
    body {
      font-family: sans-serif;
      background-color: midnightblue;
      color: white;
      display: flex;
      flex-direction: column;
      justify-content: center;
      height: 100vh;
    }
    div {
      text-align: center;
      font-size: 8rem;
      text-shadow: 3px 3px 4px dimgrey;
    }
  </style>
</head>
<body>
  <div>Hello from K3S!</div>
</body>
</html>
```

我们尚未介绍 Kubernetes 中的存储机制，因此在这里我们偷懒一下，仅将该文件存储在 Kubernetes 配置映射中。这不是我们推荐的部署网站的方式，但对于我们的目的来说是可行的。运行以下命令：

```
kubectl create configmap mysite-html --from-file index.html
```

该命令从本地文件 `index.html` 创建名为 `mysite-html` 的<ruby>配置映射<rt>configmap</rt></ruby>资源。这实际上是在 Kubernetes 资源中存储一个文件（或一组文件），我们可以在配置中调出该文件。它通常用于存储配置文件（因此而得名），我们在这里稍加滥用。在以后的文章中，我们将讨论 Kubernetes 中适当的存储解决方案。

创建配置映射后，让我们将其挂载在我们的 `nginx` 容器中。我们分两个步骤进行。首先，我们需要指定一个<ruby>卷<rt>volume</rt></ruby>来调出配置映射。然后我们需要将该卷挂载到 `nginx` 容器中。通过在 `mysite.yaml` 中的 `container` 后面的 `spec` 标签下添加以下内容来完成第一步：

```
      volumes:
      - name: html-volume
        configMap:
          name: mysite-html
```

这告诉 Kubernetes 我们要定义一个名为 `html-volume` 的卷，并且该卷应包含名为 `html-volume`（我们在上一步中创建的）的配置映射的内容。

接下来，在 `nginx` 容器规范中的<ruby>端口<rt>ports</rt></ruby>下方，添加以下内容：

```
        volumeMounts:
        - name: html-volume
          mountPath: /usr/share/nginx/html
```

这告诉 Kubernetes，对于 `nginx` 容器，我们想在容器中的 `/usr/share/nginx/html` 路径上挂载名为 `html-volume` 的卷。 为什么要使用 `/usr/share/nginx/html`？那个位置就是 `nginx` 镜像提供 HTML 服务的地方。通过在该路径上挂载卷，我们用该卷内容替换了默认内容。

作为参考，配置文件的 `deployment` 部分现在应如下所示：

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysite-nginx
  labels:
    app: mysite-nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mysite-nginx
  template:
    metadata:
      labels:
        app: mysite-nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
        volumeMounts:
        - name: html-volume
          mountPath: /usr/share/nginx/html
      volumes:
      - name: html-volume
        configMap:
          name: mysite-html
```

### 部署它！

现在我们准备部署！ 我们可以这样做：

```
kubectl apply -f mysite.yaml
```

你应该看到类似于以下内容：

```
deployment.apps/mysite-nginx created
service/mysite-nginx-service created
ingress.networking.k8s.io/mysite-nginx-ingress created
```

这意味着 Kubernetes 为我们指定的三个配置分别创建了资源。使用以下方法检查 Pod 的状态：

```
kubectl get pods
```

如果看到状态为 `ContainerCreating`，请给它一些时间并再次运行 `kubectl get pods`。通常，第一次会花一些时间，因为 k3s 必须下载 `nginx` 镜像来创建 Pod。一段时间后，你应该看到 `Running` 的状态。

### 尝试一下！

Pod 运行之后，就该尝试了。打开浏览器，然后在地址栏中输入 `kmaster`。

![][6]

恭喜你！你已经在 k3s 集群上部署了一个网站！

### 另一个

因此，现在我们有了一个运行单个网站的整个 k3s 集群。但是我们可以有更多的网站！如果我们要在同一集群中提供另一个网站怎么办？让我们看看如何做到这一点。

同样，我们需要部署一些东西。碰巧我的狗有一条她想让全世界都知道的信息，她想了好久了。因此，我专门为她制作了一些 HTML（可从示例 zip 文件中获得）。同样，我们将使用配置映射的技巧来托管这些 HTML。这次我们将把整个目录（`html` 目录）放到配置映射中，但是调用是相同的。

```
kubectl create configmap mydog-html --from-file html
```

现在，我们需要为此站点创建一个配置文件。它几乎与用于 `mysite.yaml` 的完全相同，因此首先将 `mysite.yaml` 复制为 `mydog.yaml`。现在将 `mydog.yaml` 修改为：

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mydog-nginx
  labels:
    app: mydog-nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mydog-nginx
  template:
    metadata:
      labels:
        app: mydog-nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
        volumeMounts:
        - name: html-volume
          mountPath: /usr/share/nginx/html
      volumes:
      - name: html-volume
        configMap:
          name: mydog-html
---
apiVersion: v1
kind: Service
metadata:
  name: mydog-nginx-service
spec:
  selector:
    app: mydog-nginx
  ports:
    - protocol: TCP
      port: 80
---
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: mydog-nginx-ingress
  annotations:
    kubernetes.io/ingress.class: "traefik"
    traefik.frontend.rule.type: PathPrefixStrip
spec:
  rules:
  - http:
      paths:
      - path: /mydog
        backend:
          serviceName: mydog-nginx-service
          servicePort: 80
```

我们只需进行搜索并将 `mysite` 替换为 `mydog`即可完成大多数修改。其他两个修改在入口部分中。我们将 `path` 更改为 `/mydog`，并添加了一个注解 `traefik.frontend.rule.type: PathPrefixStrip`。

`/mydog` 路径的规范指示 Traefik 将以 `/mydog` 路径开头的所有传入请求路由到 `mydog-nginx-service`。任何其他路径将继续路由到 `mysite-nginx-service`。

新的注解 `PathPrefixStrip` 告诉 Traefik 在将请求发送到 `mydog-nginx-service` 之前先去除前缀 `/mydog`。我们这样做是因为 `mydog-nginx` 应用程序不需要前缀。这意味着我们可以简单地通过更改入口记录中的前缀来更改挂载的服务的位置。

现在我们可以像以前一样进行部署：

```
kubectl apply -f mydog.yaml
```

现在，我的狗的消息应该可以在 <http://kmaster/mydog/> 上找到。

![][7]


呼！消息发出去了！也许今晚我们都可以睡一觉。

因此，现在，我们有了一个 k3s 集群，该集群托管了两个网站，Traefik 根据路径名决定将请求传递给哪个服务！但是，不仅限于基于路径的路由，我们也可以使用基于主机名的路由，我们将在以后的文章中进行探讨。

另外，我们刚刚托管的网站是标准的未加密 HTML 网站，而如今的所有内容都使用 SSL/TLS 加密。在我们的下一篇文章中，我们将为 k3s 集群添加支持以托管 SSL/TLS HTTPS 站点！

### 清理

在开始之前，由于本文主要涉及的是示例站点，因此我想向你展示如何删除内容，以防万一你不希望将这些示例丢在集群中。

对于大多数配置，只需使用与部署时使用的相同配置文件运行 `delete` 命令即可撤消配置。因此，让我们同时清理 `mysite` 和 `mydog`。

```
kubectl delete -f mysite.yaml
kubectl delete -f mydog.yaml
```

由于我们是手动创建配置映射的，因此我们也需要手动删除它们。

```
kubectl delete configmap mysite-html
kubectl delete configmap mydog-html
```

现在，如果我们执行 `kubectl get pods`，我们应该看到我们的 nginx Pod 不存在了。

```
$ kubectl get pods
No resources found in default namespace.
```

一切都清理了。

请在下面的评论中告诉我你对这个项目有什么想法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/kubernetes-traefik

作者：[Lee Carpenter][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/carpie
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://linux.cn/article-12049-1.html
[3]: https://gitlab.com/carpie/ingressing_with_k3s/-/archive/master/ingressing_with_k3s-master.zip
[4]: https://kubernetes.io/docs/
[5]: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#creating-a-deployment
[6]: https://opensource.com/sites/default/files/uploads/mysite.jpg
[7]: https://opensource.com/sites/default/files/uploads/mydog.jpg
