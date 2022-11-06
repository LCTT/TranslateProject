[#]: subject: "Get started with Java serverless functions"
[#]: via: "https://opensource.com/article/21/6/java-serverless-functions"
[#]: author: "Daniel Oh https://opensource.com/users/daniel-oh"
[#]: collector: "lkxed"
[#]: translator: "cool-summer-021"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15111-1.html"

Java 无服务器函数入门
======

![](https://img.linux.net.cn/data/attachment/album/202210/06/154731xejvfcai8e0auimh.jpg)

> Quarkus 令你可以使用类似 Java 的技术开发无服务器的工作负载。

对 [无服务器 Java][2] 的研究始于函数 —— 就是按需求运行的一小段代码。这一阶段并没有持续很长时间。虽然在 1.0 阶段，基于虚拟机架构的函数使这种范式变得很流行，但它仍然有局限性，例如执行时间、协议和糟糕的本地开发体验，都不太理想，如下图所示。

开发者随后意识到，可以把同样的无服务器特性应用于微服务和 Linux 容器，带来的好处也是一样的。由此进入 1.5 阶段，在这个阶段，一些无服务器容器完全抽象化了 [Kubernetes][3]，通过 [Knative][4] 或其它位于它之上的抽象层来提供无服务器的体验。

在 2.0 阶段，无服务器开始处理更复杂的编排和集成模式，并结合某些层级的状态管理。更重要的是，开发者关注的是能否在旧的系统中使用熟悉的 Java 应用程序运行时来组合运行无服务器和非无服务器的工作负载。

![The serverless Java journey][5]

Java 开发者开始进行无服务器函数开发之前，第一步是要选择一种新的云原生 Java 框架，从而能够以快于传统单体应用程序的速度和较小的内存占用运行 Java 函数。这在各种基础设施环境中，包括物理服务器、虚拟机、多云或混合云环境中的容器，都是适用的。

开发者也有可能固执地选择 Spring 框架中的 [Spring 云函数][6] 来进行命令式和反应式函数的开发。Spring 也支持将 Java 函数部署到可安装的无服务器平台，比如 [Kubeless][7]、[Apache OpenWhisk][8]、[Fission][9] 和 [Project Riff][10]。然而，人们担心 Spring 的启动慢、响应时间长以及内存占用大的问题。在诸如 Kubernetes 这种可扩展的容器环境中运行 Java 函数，这些问题可能会更严重。

[Quarkus][11] 是一个新推出的开源云原生 Java 框架，它有助于解决这些问题。它的作用是设计无服务器应用程序，以及编写运行于云基础设施（例如 Kubernetes）的云原生微服务。

Quarkus 重新审视了 Java，它使用了封闭的方法构建和运行 Java 程序。它把 Java 转变为一种可与 Go 相媲美的运行时。Quarkus 也包含 100 多种扩展功能，集成了企业级能力，例如数据库访问、无服务器集成、消息、安全、可观察性和业务自动化。

这里有一个简单例子，展现如何使用 Quarkus 创建一个 Java 无服务器项目的框架。 

### 1、基于 Maven 创建一个 Quarkus 无服务器项目

安装一个本地 Kubernetes 集群，开发者有多种选择，包括 [Minikube][12] 和 [OKD][13]。因为使用 OKD 在 Knative 和 DevOps 工具上安装无服务器相关功能较方便，本文使用 OKD 安装集群。这些关于 [OKD 安装][14] 和 [Knative 操作员安装][15] 的相关指南中提供了更多的设置资料。

下面的命令创建了一个 Quarkus 项目（例如 `quarkus-serverless-restapi`），对外暴露一个简单的 REST API，并下载 `quarkus-openshift` 扩展，用于 Knative 服务的部署：

```
$ mvn io.quarkus:quarkus-maven-plugin:1.13.4.Final:create \
       -DprojectGroupId=org.acme \
       -DprojectArtifactId=quarkus-serverless-restapi \
       -Dextensions="openshift" \
       -DclassName="org.acme.getting.started.GreetingResource"
```

### 2、在本地运行无服务器功能

使用 Quarkus 开发模式运行程序，检查 REST API 是否有效，稍稍调整一下代码：

```
$ ./mvnw quarkus:dev
```

输出如下内容：

```
__  ____  __  _____   ___  __ ____  ______ 
 --/ __ \/ / / / _ | / _ \/ //_/ / / / __/ 
 -/ /_/ / /_/ / __ |/ , _/ ,< / /_/ /\ \   
--\___\_\____/_/ |_/_/|_/_/|_|\____/___/   
INFO  [io.quarkus] (Quarkus Main Thread) quarkus-serverless-restapi 1.0.0-SNAPSHOT on JVM (powered by Quarkus xx.xx.xx.) started in 2.386s. Listening on: http://localhost:8080
INFO  [io.quarkus] (Quarkus Main Thread) Profile dev activated. Live Coding activated.
INFO  [io.quarkus] (Quarkus Main Thread) Installed features: [cdi, kubernetes, resteasy]
```

> **注意**: 保持 Quarkus 应用程序运行，需要使用<ruby>热部署<rt>Live Coding</rt></ruby>。这样，当代码修改后，你就不必重新构建、重新部署以及重启运行时。 

现在，你可以使用一个 `curl` 命令快速访问 REST API。输出结果应当是 `Hello RESTEasy`:

```
$ curl localhost:8080/hello
Hello RESTEasy
```

在 `GreetingResource.java` 中修改返回值：

```
public String hello() {
        return "Quarkus Function on Kubernetes";
    }
```

再次访问 REST API，输出信息也会相应更新：

```
$ curl localhost:8080/hello
Quarkus Function on Kubernetes
```

普通的微服务跟无服务器函数之间的差别并不大。使用 Quarkus 的好处在于：开发者可以使用任何微服务，将 Kubernetes 部署为无服务器函数。

### 3、在 Knative 服务中部署相关的函数

如果你还没有创建命名空间，就在你的 OKD 集群上 [创建命名空间][16]（例如 `quarkus-serverless-restapi`），用来部署 Java 无服务器函数。

Quarkus 令开发者可以通过在 `src/main/resources/application.properties` 中添加以下变量，创建 Knative 和 Kubernetes 资源：

```
quarkus.container-image.group=quarkus-serverless-restapi <1>
quarkus.container-image.registry=image-registry.openshift-image-registry.svc:5000 <2>
quarkus.kubernetes-client.trust-certs=true <3>
quarkus.kubernetes.deployment-target=knative <4>
quarkus.kubernetes.deploy=true <5>
quarkus.openshift.build-strategy=docker <6>
```

说明:

- <1> 在你部署无服务器应用程序的位置定义项目名
- <2> 使用容器注册中心
- <3> 在这个简单例子中，使用自签名证书，以便通过相关信任机制
- <4> 允许创建 Knative 资源
- <5> 指示在构建容器映像之后将扩展部署到 OpenShift 
- <6> 设置 Docker 构建策略

执行以下命令，构建应用程序，并直接部署到 OKD 集群：

```
$ ./mvnw clean package -DskipTests
```

> **注意:** 应该提前使用 `oc login` 命令，确保登录到正确的项目（例如`quarkus-serverless-restapi`）。

输出结果应该以 `BUILD SUCCESS` 结束。

在对于 Knative 服务执行的 `oc` 命令中，加上标签:

```
$ oc label rev/quarkus-serverless-restapi-00001 
app.openshift.io/runtime=quarkus --overwrite
```

然后访问 OKD 网页控制台，就能进入 [开发人员透视图中的拓扑视图][17]。你可能会看到你的<ruby>容器荚<rt>Pod</rt></ruby>（无服务器函数）已经缩小为零（白线圈）。

![Topology view][18]

### 4、在 Kubernetes 环境下测试函数

运行如下 `oc` 命令，搜索含有无服务器函数的路由：

```
$ oc get rt/quarkus-serverless-restapi
[...]
NAME                      URL                             READY   REASON
quarkus-serverless[...]   http://quarkus[...].SUBDOMAIN   True
```

使用 `curl` 命令访问搜索到的路由：

```
$ curl http://quarkus-serverless-restapi-quarkus-serverless-restapi.SUBDOMAIN/hello
```

过几秒钟，你可以得到跟在本地相同的结果：

```
Quarkus Function on Kubernetes
```

当你回到 OKD 集群内的拓扑图，Knative 服务会自动扩展。

![Scaling the Knative Function][19]

由于 Knative 服务的默认设置，其 pod 在 30 秒后会再次下降至零。

### 下一步呢？

无服务器不断地在演变，始于运行于虚拟机的函数，到后来的无服务器容器，并与企业原有系统集成。在此过程中，企业开发者借助 Quarkus，仍然可以使用自己熟悉的技术（比如 Java）创建一个项目，然后构建并部署到 Kubernetes。

本系列的下一篇文章将指导你优化 Kubernetes 中的 Java 无服务器函数，从而令程序启动更快，内存占用更小。

*文内图像来自：Daniel Oh, CC BY-SA 4.0*

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/java-serverless-functions

作者：[Daniel Oh][a]
选题：[lkxed][b]
译者：[cool-summer-021](https://github.com/cool-summer-021)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png
[2]: https://linux.cn/article-13429-1.html
[3]: https://opensource.com/article/19/6/reasons-kubernetes
[4]: https://cloud.google.com/knative/
[5]: https://opensource.com/sites/default/files/uploads/serverless-journey.png
[6]: https://spring.io/serverless
[7]: https://kubeless.io/
[8]: https://openwhisk.apache.org/
[9]: https://fission.io/
[10]: https://projectriff.io/
[11]: https://quarkus.io/
[12]: https://minikube.sigs.k8s.io/docs/start/
[13]: https://docs.okd.io/latest/welcome/index.html
[14]: https://docs.okd.io/latest/installing/index.html
[15]: https://knative.dev/docs/install/knative-with-operators/
[16]: https://docs.okd.io/latest/applications/projects/configuring-project-creation.html
[17]: https://docs.okd.io/latest/applications/application_life_cycle_management/odc-viewing-application-composition-using-topology-view.html
[18]: https://opensource.com/sites/default/files/uploads/topologyview.png
[19]: https://opensource.com/sites/default/files/uploads/scale-up-knative-function.png
