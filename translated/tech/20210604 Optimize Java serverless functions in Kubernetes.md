[#]: subject: (Optimize Java serverless functions in Kubernetes)
[#]: via: (https://opensource.com/article/21/6/java-serverless-functions-kubernetes)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)
[#]: collector: (lujun9972)
[#]: translator: (cool-summer-021)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

优化 Kubernetes 中的 Java 无服务器函数
======

在 Kubernetes 中以更快的启动速度和更小的内存占用运行无服务器函数
![Ship captain sailing the Kubernetes seas][1]

由于运行上千个应用程序集群所耗费的资源多，令它实现较少工作节点和资源占用所需成本也较高，所以在使用 [Kubernetes][2] 时，快速启动和较少的内存占用是至关重要的。在 Kubernetes 平台运行容器化微服务时，内存占用是比吞吐量更重要的考量因素，这是因为：

  * 由于需要持续运行，所以耗费资源更多（不同于 CPU 周期）
  * 微服务令管理成本成倍增加
  * 一个庞大的应用程序变为若干个微服务的情况（例如20个微服务占用的存储空间一共有20GB）



这些情况极大影响了无服务器函数的发展和 Java 部署模型。到目前为止，许多企业开发人员选择 Go、Python 或 Node.js 这些替代方案来解决性能瓶颈，直到出现了 [Quarkus][3] 这种基于 kubernetes 的原生 Java 堆栈，才有所改观。本文介绍如何在使用了 Quarkus 的 kubernetes 平台上进行性能优化，以便运行无服务器函数。 

### 容器优先的设计理念

由于 Java 生态系统中传统的框架都要进行框架的初始化，包括配置文件的处理、classpath 的扫描、类加载、注解的处理以及构建元模型，这些过程都是必不可少的，所以它们都比较耗费资源。如果使用了几种不同的框架，所耗费的资源也是成倍增加。

Quarkus 通过“向左移动”，把所有的资源开销大的操作都转移到构建阶段，解决了这些 Java 性能问题。在构建阶段进行代码和框架分析、字节码转换和动态元模型生成，而且只有一次，结果是：运行时可执行文件经过高度优化，启动非常快，不需要经过那些传统的启动过程，全过程只在构建阶段执行一次。

![Quarkus Build phase][4]

(Daniel Oh, [CC BY-SA 4.0][5])

更重要的是：Quarkus 支持构建原生可执行文件，它具有良好性能，包括快速启动和极小的 RSS 内存占用，跟传统的云原生 Java 栈相比，具备即时扩展的能力和高密度的内存利用。

![Quarkus RSS and Boot Time Metrics][7]

(Daniel Oh, [CC BY-SA 4.0][5])

这里有个例子，展示如何使用 Quarkus 将一个 [Java 无服务器][8]项目构建为本地可执行文件。

### 1\. 使用 Quarkus 创建无服务器 Maven 项目

以下命令生成一个 Quarkus 项目，（例如`quarkus-serverless-native`）以此创建一个简单的函数：


```
$ mvn io.quarkus:quarkus-maven-plugin:1.13.4.Final:create \
       -DprojectGroupId=org.acme \
       -DprojectArtifactId=quarkus-serverless-native \
       -DclassName="org.acme.getting.started.GreetingResource"
```

### 2\. 构建一个本地可执行文件

你需要使用 GraalVM 为 Java 程序构建一个本地可执行文件。你可以选择 GraalVM 的任何发行版，例如 [Oracle GraalVM Community Edition (CE)][9] 或 [Mandrel][10]（Oracle GraalVM CE 的下游发行版）。Mandrel 是为支持 OpenJDK 11 上的 Quarkus-native 可执行文件的构建而设计的。

打开 `pom.xml`，你将发现其中的 `native` 设置。你将使用它来构建本地可执行文件。


```
<profiles>
    <profile>
        <id>native</id>
        <properties>
            <quarkus.package.type>native</quarkus.package.type>
        </properties>
    </profile>
</profiles>
```

> **注意:** 你可以在本地安装 GraalVM 或 Mandrel 发行版。你也可以下载 Mandrel 容器映像来构建它（像我那样），因此你还需要在本地运行一个容器引擎（例如 Docker）。

假设你已经打开了容器运行时，此时需要运行一下 Maven 命令：

使用 [Docker][11] 作为容器引擎


```
$ ./mvnw package -Pnative \
-Dquarkus.native.container-build=true \
-Dquarkus.native.container-runtime=docker
```

使用 [Podman][12] 作为容器引擎


```
$ ./mvnw package -Pnative \
-Dquarkus.native.container-build=true \
-Dquarkus.native.container-runtime=podman
```

输出信息结尾应当是 `BUILD SUCCESS`。

![Native Build Logs][13]

(Daniel Oh, [CC BY-SA 4.0][5])

不借助 JVM 直接运行本地可执行文件：


```
`$ target/quarkus-serverless-native-1.0.0-SNAPSHOT-runner`
```

输出信息类似于：


```
__  ____  __  _____   ___  __ ____  ______
 --/ __ \/ / / / _ | / _ \/ //_/ / / / __/
 -/ /_/ / /_/ / __ |/ , _/ ,&lt; / /_/ /\ \  
\--\\___\\_\\____/_/ |_/_/|_/_/|_|\\____/___/  
INFO  [io.quarkus] (main) quarkus-serverless-native 1.0.0-SNAPSHOT native
(powered by Quarkus xx.xx.xx.) Started in 0.019s. Listening on: <http://0.0.0.0:8080>
INFO [io.quarkus] (main) Profile prod activated.
INFO [io.quarkus] (main) Installed features: [cdi, kubernetes, resteasy]
```

简直是超音速！启动只花了 19 毫秒。你的运行时间可能稍有不同。

使用 Linux 的 `ps` 工具检测一下，结果内存占用还是很低。检测的方法是：在应用程序运行期间，另外打开一个终端，运行如下命令：


```
`$ ps -o pid,rss,command -p $(pgrep -f runner)`
```

输出结果类似于：


```
  PID    RSS COMMAND
10246  11360 target/quarkus-serverless-native-1.0.0-SNAPSHOT-runner
```

该进程只占 11MB 内存。非常小！

> **注意:** 各种应用程序（包括 Quarkus）的驻留集大小和内存占用，都因运行环境而异，并随着应用程序载入而上升。


你也可以使用 REST API 访问这个函数。输出结果应该是 `Hello RESTEasy`:

```
$ curl localhost:8080/hello
Hello RESTEasy
```

### 3\. 把函数部署到 Knative 服务

如果你还没有创建命名空间，现在就在 [OKD][15] (OpenShift Kubernetes 发行版)[创建一个命名空间][14]（例如 `quarkus-serverless-native`），进而把这个本地可执行文件部署为无服务器函数。然后添加 `quarkus-openshift` 扩展：


```
`$ ./mvnw -q quarkus:add-extension -Dextensions="openshift"`
```

向 `src/main/resources/application.properties` 文件中添加以下内容，配置 Knative 和 Kubernetes 的相关资源：


```
quarkus.container-image.group=quarkus-serverless-native
quarkus.container-image.registry=image-registry.openshift-image-registry.svc:5000
quarkus.native.container-build=true
quarkus.kubernetes-client.trust-certs=true
quarkus.kubernetes.deployment-target=knative
quarkus.kubernetes.deploy=true
quarkus.openshift.build-strategy=docker
```

构建本地可执行文件，并把它直接部署到 OKD 集群：


```
`$ ./mvnw clean package -Pnative`
```

> **Note:** 提前使用 `oc login` 命令，确保登录的是正确的项目（例如 `quarkus-serverless-native`）。

输出信息结尾应当是 `BUILD SUCCESS`。完成一个本地二进制文件的构建并部署为 Knative 服务需要花费几分钟。成功创建服务后，使用 `kubectl` 或 `oc` 命令工具，可以查看 Knative 服务和版本信息：


```
$ kubectl get ksvc
NAME                        URL   [...]
quarkus-serverless-native   <http://quarkus-serverless-native-\[...\].SUBDOMAIN>  True

$ kubectl get rev
NAME                              CONFIG NAME                 K8S SERVICE NAME                  GENERATION   READY   REASON
quarkus-serverless-native-00001   quarkus-serverless-native   quarkus-serverless-native-00001   1            True
```

### 4\. 访问本地可执行函数

运行 `kubectl` 命令，搜索无服务器函数的节点：


```
`$ kubectl get rt/quarkus-serverless-native`
```

输出信息类似于：


```
NAME                         URL                                                                                                          READY   REASON
quarkus-serverless-native   <http://quarkus-serverless-restapi-quarkus-serverless-native.SUBDOMAIN>   True
```

用 `curl` 命令访问上述信息中的 `URL` 字段：


```
`$ curl http://quarkus-serverless-restapi-quarkus-serverless-native.SUBDOMAIN/hello`
```

过了不超过一秒钟，你也会得到跟本地操作一样的结果：


```
`Hello RESTEasy`
```

当你在 OKD 群集中访问 Quarkus 运行中的节点的日志，你会发现本地可执行文件正在以 Knative 服务的形式运行。

![Native Quarkus Log][16]

(Daniel Oh, [CC BY-SA 4.0][5])

### 下一步呢？

你可以借助 GraalVM 发行版优化 Java 无服务器函数，从而在 Knative 中使用 Kubernetes 将它们部署为无服务器函数。Quarkus 支持在普通的微服务中使用简易配置进行性能优化。

本系列的下一篇文章将指导你在不更改代码的情况下跨多个无服务器平台实现可移植函数。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/java-serverless-functions-kubernetes

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://opensource.com/article/19/6/reasons-kubernetes
[3]: https://quarkus.io/
[4]: https://opensource.com/sites/default/files/uploads/quarkus-build.png (Quarkus Build phase)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://quarkus.io/blog/runtime-performance/
[7]: https://opensource.com/sites/default/files/uploads/quarkus-boot-metrics.png (Quarkus RSS and Boot Time Metrics)
[8]: https://opensource.com/article/21/5/what-serverless-java
[9]: https://www.graalvm.org/community/
[10]: https://github.com/graalvm/mandrel
[11]: https://www.docker.com/
[12]: https://podman.io/
[13]: https://opensource.com/sites/default/files/uploads/native-build-logs.png (Native Build Logs)
[14]: https://docs.okd.io/latest/applications/projects/configuring-project-creation.html
[15]: https://docs.okd.io/latest/welcome/index.html
[16]: https://opensource.com/sites/default/files/uploads/native-quarkus-log.png (Native Quarkus Log)
