完全指南：在容器中运行 Jenkins 构建
======

> 容器应用程序平台能够动态地启动具有资源限制的独立容器，从而改变了运行 CI/CD 任务的方式。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_scale_performance.jpg?itok=R7jyMeQf)

现今，由于 [Docker][1] 和 [Kubernetes][2]（K8S）提供了可扩展、可管理的应用平台，将应用运行在容器中的实践已经被企业广泛接受。近些年势头很猛的[微服务架构][3]也很适合用容器实现。

容器应用平台可以动态启动指定资源配额、互相隔离的容器，这是其最主要的优势之一。让我们看看这会对我们运行<ruby>持续集成/持续部署<rt>continuous integration/continuous development</rt></ruby>（CI/CD）任务的方式产生怎样的改变。

构建并打包应用需要一定的环境，要求能够下载源代码、使用相关依赖及已经安装构建工具。作为构建的一部分，运行单元及组件测试可能会用到本地端口或需要运行第三方应用（如数据库及消息中间件等）。另外，我们一般定制化多台构建服务器，每台执行一种指定类型的构建任务。为方便测试，我们维护一些实例专门用于运行第三方应用（或者试图在构建服务器上启动这些第三方应用），避免并行运行构建任务导致结果互相干扰。为 CI/CD 环境定制化构建服务器是一项繁琐的工作，而且随着开发团队使用的开发平台或其版本变更，会需要大量的构建服务器用于不同的任务。

一旦我们有了容器管理平台（自建或在云端），将资源密集型的 CI/CD 任务在动态生成的容器中执行是比较合理的。在这种方案中，每个构建任务运行在独立启动并配置的构建环境中。构建过程中，构建任务的测试环节可以任意使用隔离环境中的可用资源；此外，我们也可以在辅助容器中启动一个第三方应用，只在构建任务生命周期中为测试提供服务。

听上去不错，让我们在现实环境中实践一下。

注：本文基于现实中已有的解决方案，即一个在 [Red Hat OpenShift][4] v3.7 集群上运行的项目。OpenShift 是企业级的 Kubernetes 版本，故这些实践也适用于 K8S 集群。如果愿意尝试，可以下载 [Red Hat CDK][5]，运行 `jenkins-ephemeral` 或 `jenkins-persistent` [模板][6]在 OpenShift 上创建定制化好的 Jenkins 管理节点。

### 解决方案概述

在 OpenShift 容器中执行 CI/CD 任务（构建和测试等） 的方案基于[分布式 Jenkins 构建][7]，具体如下：

  * 我们需要一个 Jenkins 主节点；可以运行在集群中，也可以是外部提供
  * 支持 Jenkins 特性和插件，以便已有项目仍可使用 
  * 可以用 Jenkins GUI 配置、运行任务或查看任务输出
  * 如果你愿意编码，也可以使用 [Jenkins Pipeline][8]

从技术角度来看，运行任务的动态容器是 Jenkins 代理节点。当构建启动时，首先是一个新节点启动，通过 Jenkins 主节点的 JNLP（5000 端口） 告知就绪状态。在代理节点启动并提取构建任务之前，构建任务处于排队状态。就像通常 Jenkins 代理服务器那样，构建输出会送达主节点；不同的是，构建完成后代理节点容器会自动关闭。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/1_running_jenkinsincontainers.png?itok=fR4ntnn8)

不同类型的构建任务（例如 Java、 NodeJS、 Python等）对应不同的代理节点。这并不新奇，之前也是使用标签来限制哪些代理节点可以运行指定的构建任务。启动用于构建任务的 Jenkins 代理节点容器需要配置参数，具体如下：

  * 用于启动容器的 Docker 镜像
  * 资源限制
  * 环境变量
  * 挂载的卷

这里用到的关键组件是 [Jenkins Kubernetes 插件][9]。该插件（通过使用一个服务账号） 与 K8S 集群交互，可以启动和关闭代理节点。在插件的配置管理中，多种代理节点类型表现为多种 Kubernetes pod 模板，它们通过项目标签对应。

这些[代理节点镜像][10]以开箱即用的方式提供（也有 [CentOS7][11] 系统的版本）：

  * [jenkins-slave-base-rhel7][12]：基础镜像，启动与 Jenkins 主节点连接的代理节点；其中 Java 堆大小根据容器内容设置
  * [jenkins-slave-maven-rhel7][13]：用于 Maven 和 Gradle 构建的镜像（从基础镜像扩展）
  * [jenkins-slave-nodejs-rhel7][14]：包含 NodeJS4 工具的镜像（从基础镜像扩展）

注意：本解决方案与 OpenShift 中的 [Source-to-Image（S2I）][15] 构建无关，虽然后者也可以用于某些特定的 CI/CD 任务。

### 入门学习资料

有很多不错的博客和文档介绍了如何在 OpenShift 上执行 Jenkins 构建。不妨从下面这些开始：

  * [OpenShift Jenkins][29] 镜像文档及 [源代码][30]
  * 网络播客：[基于 OpenShift 的 CI/CD][31]
  * [外部 Jenkins 集成][32] 剧本

阅读这些博客和文档有助于完整的理解本解决方案。在本文中，我们主要关注具体实践中遇到的各类问题。

### 构建我的应用

作为[示例项目][16]，我们选取了包含如下构建步骤的 Java 项目：

  * **代码源：** 从一个 Git 代码库中获取项目代码
  * **使用 Maven 编译：** 依赖可从内部仓库获取，(不妨使用 Apache Nexus） 镜像自外部 Maven 仓库
  * **发布成品：** 将编译好的 JAR 上传至内部仓库

在 CI/CD 过程中，我们需要与 Git 和 Nexus 交互，故 Jenkins 任务需要能够访问这些系统。这要求参数配置和已存储凭证可以在下列位置进行管理：

  * **在 Jenkins 中：** 我们可以在 Jenkins 中添加凭证，通过 Git 插件能够对项目添加和使用文件（使用容器不会改变操作）
  * **在 OpenShift 中：** 使用 ConfigMap 和 Secret 对象，以文件或环境变量的形式附加到 Jenkins 代理容器中
  * **在高度定制化的 Docker 容器中：** 镜像是定制化的，已包含完成特定类型构建的全部特性；从一个代理镜像进行扩展即可得到。

你可以按自己的喜好选择一种实现方式，甚至你最终可能混用多种实现方式。下面我们采用第二种实现方式，即首选在 OpenShift 中管理参数配置。使用 Kubernetes 插件配置来定制化 Maven 代理容器，包括设置环境变量和映射文件等。

注意：对于 Kubernetes 插件 v1.0 版，由于 [bug][17]，在 UI 界面增加环境变量并不生效。可以升级插件，或（作为变通方案） 直接修改 `config.xml` 文件并重启 Jenkins。

### 从 Git 获取源代码

从公共 Git 仓库获取源代码很容易。但对于私有 Git 仓库，不仅需要认证操作，客户端还需要信任服务器以便建立安全连接。一般而言，通过两种协议获取源代码：

  * HTTPS：验证通过用户名/密码完成。Git 服务器的 SSL 证书必须被代理节点信任，这仅在证书被自建 CA 签名时才需要特别注意。

	```
git clone https://git.mycompany.com:443/myapplication.git
```
  * SSH：验证通过私钥完成。如果服务器的公钥指纹出现在 `known_hosts` 文件中，那么该服务器是被信任的。

	```
git clone ssh://git@git.mycompany.com:22/myapplication.git
```

对于手动操作，使用用户名/密码通过 HTTP 方式下载源代码是可行的；但对于自动构建而言，SSH 是更佳的选择。

#### 通过 SSH 方式使用 Git

要通过 SSH 方式下载源代码，我们需要保证代理容器与 Git 的 SSH 端口之间可以建立 SSH 连接。首先，我们需要创建一个私钥-公钥对。使用如下命令生成：

```
ssh keygen -t rsa -b 2048 -f my-git-ssh -N ''
```

命令生成的私钥位于 `my-git-ssh` 文件中（口令为空），对应的公钥位于 `my-git-ssh.pub` 文件中。将公钥添加至 Git 服务器的对应用户下（推荐使用“服务账号”）；网页界面一般支持公钥上传。为建立 SSH 连接，我们还需要在代理容器上配置两个文件：

  * 私钥文件位于 `~/.ssh/id_rsa`
  * 服务器的公钥位于 `~/.ssh/known_hosts`。要实现这一点，运行 `ssh git.mycompany.com` 并接受服务器指纹，系统会在 `~/.ssh/known_hosts` 文件中增加一行。这样需求得到了满足。

将 `id_rsa` 对应的私钥和 `known_hosts` 对应的公钥保存到一个 OpenShift  的 secret（或 ConfigMap） 对象中。

```
apiVersion: v1
kind: Secret
metadata:
  name: mygit-ssh
stringData:
  id_rsa: |-
    -----BEGIN RSA PRIVATE KEY-----
    ...
    -----END RSA PRIVATE KEY-----
  known_hosts: |-
    git.mycompany.com ecdsa-sha2-nistp256 AAA...
```

在 Kubernetes 插件中将 secret 对象配置为卷，挂载到 `/home/jenkins/.ssh/`，供 Maven pod 使用。secret 中的每个对象对应挂载目录的一个文件，文件名与 key 名称相符。我们可以使用 UI（管理 Jenkins / 配置 / 云 / Kubernetes），也可以直接编辑 Jenkins 配置文件 `/var/lib/jenkins/config.xml`：

```
<org.csanchez.jenkins.plugins.kubernetes.PodTemplate>
<name>maven</name>
...
  <volumes>
    <org.csanchez.jenkins.plugins.kubernetes.volumes.SecretVolume>
      <mountPath>/home/jenkins/.ssh</mountPath>
      <secretName>mygit-ssh</secretName>
    </org.csanchez.jenkins.plugins.kubernetes.volumes.SecretVolume>
  </volumes>
```

此时，在代理节点上运行的任务应该可以通过 SSH 方式从 Git 代码库获取源代码。

注：我们也可以在 `~/.ssh/config` 文件中自定义 SSH 连接。例如，如果你不想处理 `known_hosts` 或私钥位于其它挂载目录中：

```
Host git.mycompany.com
   StrictHostKeyChecking no
   IdentityFile /home/jenkins/.config/git-secret/ssh-privatekey
```

#### 通过 HTTP 方式使用 Git

如果你选择使用 HTTP 方式下载，在指定的 [Git-credential-store][18] 文件中添加用户名/密码：

  * 例如，在一个 OpenShift secret 对象中增加 `/home/jenkins/.config/git-secret/credentials` 文件对应，其中每个站点对应文件中的一行:

	```
https://username:password@git.mycompany.com
https://user:pass@github.com
```

  * 在 [git-config][19] 配置中启用该文件，其中配置文件默认路径为 `/home/jenkins/.config/git/config`：

	```
[credential]
  helper = store --file=/home/jenkins/.config/git-secret/credentials
```

如果 Git 服务使用了自有 CA 签名的证书，为代理容器设置环境变量 `GIT_SSL_NO_VERIFY=true` 是最便捷的方式。更恰当的解决方案包括如下两步：

  * 利用 ConfigMap 将自有 CA 的公钥映射到一个路径下的文件中，例如 `/usr/ca/myTrustedCA.pem`）。
  * 通过环境变量 `GIT_SSL_CAINFO=/usr/ca/myTrustedCA.pem` 或上面提到的 `git-config` 文件的方式，将证书路径告知 Git。

	```
[http "https://git.mycompany.com"]
    sslCAInfo = /usr/ca/myTrustedCA.pem
```

注：在 OpenShift v3.7 及早期版本中，ConfigMap 及 secret 的挂载点之间[不能相互覆盖][20]，故我们不能同时映射 `/home/jenkins` 和  `/home/jenkins/dir`。因此，上面的代码中并没有使用常见的文件路径。预计 OpenShift v3.9 版本会修复这个问题。

### Maven

要完成 Maven 构建，一般需要完成如下两步：

  * 建立一个社区 Maven 库（例如 Apache Nexus），充当外部库的代理。将其当作镜像使用。
  * 这个内部库可能提供 HTTPS 服务，其中使用自建 CA 签名的证书。

对于容器中运行构建的实践而言，使用内部 Maven 库是非常关键的，因为容器启动后并没有本地库或缓存，这导致每次构建时 Maven 都下载全部的 Jar 文件。在本地网络使用内部代理库下载明显快于从因特网下载。

[Maven Jenkins 代理][13]镜像允许配置环境变量，指定代理的 URL。在 Kubernetes 插件的容器模板中设置如下：

```
MAVEN_MIRROR_URL=https://nexus.mycompany.com/repository/maven-public
```

构建好的成品（JAR） 也应该保存到库中，可以是上面提到的用于提供依赖的镜像库，也可以是其它库。Maven 完成 `deploy` 操作需要在 `pom.xml` 的[分发管理][21] 下配置库 URL，这与代理镜像无关。

```
<project ...>
<distributionManagement>
 <snapshotRepository>
  <id>mynexus</id>
  <url>https://nexus.mycompany.com/repository/maven-snapshots/</url>
 </snapshotRepository>
 <repository>
  <id>mynexus</id>
  <url>https://nexus.mycompany.com/repository/maven-releases/</url>
 </repository>
</distributionManagement>
```

上传成品可能涉及认证。在这种情况下，在 `settings.xml` 中配置的用户名/密码要与 `pom.xml` 文件中的对应的服务器 `id` 下的设置匹配。我们可以使用 OpenShift secret 将包含 URL、用户名和密码的完整 `settings.xml` 映射到 Maven Jenkins 代理容器中。另外，也可以使用环境变量。具体如下：

  * 利用 secret 为容器添加环境变量：

	```
MAVEN_SERVER_USERNAME=admin
MAVEN_SERVER_PASSWORD=admin123
```

  * 利用 config map 将 `settings.xml` 挂载至 `/home/jenkins/.m2/settings.xml`：

	```
<settings ...>
 <mirrors>
  <mirror>
   <mirrorOf>external:*</mirrorOf>
   <url>${env.MAVEN_MIRROR_URL}</url>
   <id>mirror</id>
  </mirror>
 </mirrors>
 <servers>
  <server>
   <id>mynexus</id>
   <username>${env.MAVEN_SERVER_USERNAME}</username>
   <password>${env.MAVEN_SERVER_PASSWORD}</password>
  </server>
 </servers>
</settings>
```

禁用交互模式（即，使用批处理模式） 可以忽略下载日志，一种方式是在 Maven 命令中增加 `-B` 参数，另一种方式是在 `settings.xml` 配置文件中增加 `<interactiveMode>false</interactiveMode>` 配置。

如果 Maven 库的 HTTPS 服务使用自建 CA 签名的证书，我们需要使用 [keytool][22] 工具创建一个将 CA 公钥添加至信任列表的 Java KeyStore。在 OpenShift 中使用 ConfigMap 将这个 Keystore 上传。使用 `oc` 命令基于文件创建一个 ConfigMap：

```
oc create configmap maven-settings --from-file=settings.xml=settings.xml --from-
file=myTruststore.jks=myTruststore.jks
```

将这个 ConfigMap 挂载至 Jenkins 代理容器。在本例中我们使用 `/home/jenkins/.m2` 目录，但这仅仅是因为配置文件 `settings.xml` 也对应这个 ConfigMap。KeyStore 可以放置在任意路径下。

接着在容器环境变量 `MAVEN_OPTS` 中设置 Java 参数，以便让 Maven 对应的 Java 进程使用该文件：

```
MAVEN_OPTS=
-Djavax.net.ssl.trustStore=/home/jenkins/.m2/myTruststore.jks
-Djavax.net.ssl.trustStorePassword=changeit
```

### 内存使用量

这可能是最重要的一部分设置，如果没有正确的设置最大内存，我们会遇到间歇性构建失败，虽然每个组件都似乎工作正常。

如果没有在 Java 命令行中设置堆大小，在容器中运行 Java 可能导致高内存使用量的报错。JVM [可以利用全部的宿主机内存][23]，而不是使用容器内存现在并相应设置[默认的堆大小][24]。这通常会超过容器的内存资源总额，故当 Java 进程为堆分配过多内存时，OpenShift 会直接杀掉容器。

虽然 `jenkins-slave-base` 镜像包含一个内建[脚本设置堆最大为][25]容器内存的一半（可以通过环境变量 `CONTAINER_HEAP_PERCENT=0.50` 修改），但这只适用于 Jenkins 代理节点中的 Java 进程。在 Maven 构建中，还有其它重要的 Java 进程运行：

  * `mvn` 命令本身就是一个 Java 工具。
  * [Maven Surefire 插件][26] 默认派生一个 JVM 用于运行单元测试。

总结一下，容器中同时运行着三个重要的 Java 进程，预估内存使用量以避免 pod 被误杀是很重要的。每个进程都有不同的方式设置 JVM 参数：

  * 我们在上面提到了 Jenkins 代理容器堆最大值的计算方法，但我们显然不应该让代理容器使用如此大的堆，毕竟还有两个 JVM 需要使用内存。对于 Jenkins 代理容器，可以设置 `JAVA_OPTS`。 
  * `mvn` 工具被 Jenkins 任务调用。设置 `MAVEN_OPTS` 可以用于自定义这类 Java 进程。
  * Maven `surefire` 插件滋生的用于单元测试的 JVM 可以通过 Maven [argLine][27] 属性自定义。可以在 `pom.xml` 或 `settings.xml` 的某个配置文件中设置，也可以直接在 `maven` 命令参数 `MAVEN_OPS` 中增加 `-DargLine=…`。


下面例子给出 Maven 代理容器环境变量设置方法：

```
JAVA_OPTS=-Xms64m -Xmx64m
MAVEN_OPTS=-Xms128m -Xmx128m -DargLine=${env.SUREFIRE_OPTS}
SUREFIRE_OPTS=-Xms256m -Xmx256m
```

我们的测试环境是具有 1024Mi 内存限额的代理容器，使用上述参数可以正常构建一个 SpringBoot 应用并进行单元测试。测试环境使用的资源相对较小，对于复杂的 Maven 项目和对应的单元测试，我们需要更大的堆大小及更大的容器内存限额。

注：Java8 进程的实际内存使用量包括“堆大小 + 元数据 + 堆外内存”，因此内存使用量会明显高于设置的最大堆大小。在我们上面的测试环境中，三个 Java 进程使用了超过 900Mi 的内存。可以在容器内查看进程的 RSS 内存使用情况，命令如下：`ps -e -o pid,user,rss,comm,args`。

Jenkins 代理镜像同时安装了 JDK 64 位和 32 位版本。对于 `mvn` 和 `surefire`，默认使用 64 位版本 JVM。为减低内存使用量，只要 `-Xmx` 不超过 1.5 GB，强制使用 32 位 JVM 都是有意义的。

```
JAVA_HOME=/usr/lib/jvm/Java-1.8.0-openjdk-1.8.0.161–0.b14.el7_4.i386
```

注意到我们可以在 `JAVA_TOOL_OPTIONS` 环境变量中设置 Java 参数，每个 JVM 启动时都会读取该参数。`JAVA_OPTS` 和 `MAVEN_OPTS` 中的参数会覆盖 `JAVA_TOOL_OPTIONS` 中的对应值，故我们可以不使用 `argLine`，实现对 Java 进程同样的堆配置：

```
JAVA_OPTS=-Xms64m -Xmx64m
MAVEN_OPTS=-Xms128m -Xmx128m
JAVA_TOOL_OPTIONS=-Xms256m -Xmx256m
```

但缺点是每个 JVM 的日志中都会显示 `Picked up JAVA_TOOL_OPTIONS:`，这可能让人感到迷惑。

### Jenkins 流水线

完成上述配置，我们应该已经可以完成一次成功的构建。我们可以获取源代码，下载依赖，运行单元测试并将成品上传到我们的库中。我们可以通过创建一个 Jenkins 流水线项目来完成上述操作。

```
pipeline {
  /* Which container to bring up for the build. Pick one of the templates configured in Kubernetes plugin. */
  agent {
    label 'maven'
  }

  stages {
    stage('Pull Source') {
      steps {
        git url: 'ssh://git@git.mycompany.com:22/myapplication.git', branch: 'master'
      }
    }
    stage('Unit Tests') {
      steps {
        sh 'mvn test'
      }
    }
    stage('Deploy to Nexus') {
      steps {
        sh 'mvn deploy -DskipTests'
      }
    }
  }
}
```

当然，对应真实项目，CI/CD 流水线不仅仅完成 Maven 构建，还可以部署到开发环境，运行集成测试，提升至更接近于生产的环境等。上面给出的学习资料中有执行这些操作的案例。

### 多容器

一个 pod 可以运行多个容器，每个容器有单独的资源限制。这些容器共享网络接口，故我们可以从 `localhost` 访问已启动的服务，但我们需要考虑端口冲突的问题。在一个 Kubernetes pod 模板中，每个容器的环境变量是单独设置的，但挂载的卷是统一的。

当一个外部服务需要单元测试且嵌入式方案无法工作（例如，数据库、消息中间件等） 时，可以启动多个容器。在这种情况下，第二个容器会随着 Jenkins 代理容器启停。

查看 Jenkins `config.xml` 片段，其中我们启动了一个辅助的 `httpbin` 服务用于 Maven 构建：

```
<org.csanchez.jenkins.plugins.kubernetes.PodTemplate>
  <name>maven</name>
  <volumes>
    ...
  </volumes>
  <containers>
    <org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>
      <name>jnlp</name>
      <image>registry.access.redhat.com/openshift3/jenkins-slave-maven-rhel7:v3.7</image>
      <resourceLimitCpu>500m</resourceLimitCpu>
      <resourceLimitMemory>1024Mi</resourceLimitMemory>
      <envVars>
      ...
      </envVars>        
      ...
    </org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>
    <org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>
      <name>httpbin</name>
      <image>citizenstig/httpbin</image>
      <resourceLimitCpu></resourceLimitCpu>
      <resourceLimitMemory>256Mi</resourceLimitMemory>
      <envVars/>
      ...
    </org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>
  </containers>
  <envVars/>
</org.csanchez.jenkins.plugins.kubernetes.PodTemplate>
```

### 总结

作为总结，我们查看上面已描述配置的 Jenkins `config.xml` 对应创建的 OpenShift 资源以及 Kubernetes 插件的配置。

```
apiVersion: v1
kind: List
metadata: {}
items:
- apiVersion: v1
  kind: ConfigMap
  metadata:
    name: git-config
  data:
    config: |
      [credential]
          helper = store --file=/home/jenkins/.config/git-secret/credentials
      [http "http://git.mycompany.com"]
          sslCAInfo = /home/jenkins/.config/git/myTrustedCA.pem
    myTrustedCA.pem: |-
      -----BEGIN CERTIFICATE-----
      MIIDVzCCAj+gAwIBAgIJAN0sC...
      -----END CERTIFICATE-----
- apiVersion: v1
  kind: Secret
  metadata:
    name: git-secret
  stringData:
    ssh-privatekey: |-
      -----BEGIN RSA PRIVATE KEY-----
      ...
      -----END RSA PRIVATE KEY-----
    credentials: |-
      https://username:password@git.mycompany.com
      https://user:pass@github.com
- apiVersion: v1
  kind: ConfigMap
  metadata:
    name: git-ssh
  data:
    config: |-
      Host git.mycompany.com
        StrictHostKeyChecking yes
        IdentityFile /home/jenkins/.config/git-secret/ssh-privatekey
    known_hosts: '[git.mycompany.com]:22 ecdsa-sha2-nistp256 AAAdn7...'
- apiVersion: v1
  kind: Secret
  metadata:
    name: maven-secret
  stringData:
    username: admin
    password: admin123
```

基于文件创建另一个 ConfigMap：

```
oc create configmap maven-settings --from-file=settings.xml=settings.xml 
--from-file=myTruststore.jks=myTruststore.jks
```

Kubernetes 插件配置如下：

```
<?xml version='1.0' encoding='UTF-8'?>
<hudson>
...
  <clouds>
    <org.csanchez.jenkins.plugins.kubernetes.KubernetesCloud plugin="kubernetes@1.0">
      <name>openshift</name>
      <defaultsProviderTemplate></defaultsProviderTemplate>
      <templates>
        <org.csanchez.jenkins.plugins.kubernetes.PodTemplate>
          <inheritFrom></inheritFrom>
          <name>maven</name>
          <namespace></namespace>
          <privileged>false</privileged>
          <alwaysPullImage>false</alwaysPullImage>
          <instanceCap>2147483647</instanceCap>
          <slaveConnectTimeout>100</slaveConnectTimeout>
          <idleMinutes>0</idleMinutes>
          <label>maven</label>
          <serviceAccount>jenkins37</serviceAccount>
          <nodeSelector></nodeSelector>
          <nodeUsageMode>NORMAL</nodeUsageMode>
          <customWorkspaceVolumeEnabled>false</customWorkspaceVolumeEnabled>
          <workspaceVolume class="org.csanchez.jenkins.plugins.kubernetes.volumes.workspace.EmptyDirWorkspaceVolume">
            <memory>false</memory>
          </workspaceVolume>
          <volumes>
            <org.csanchez.jenkins.plugins.kubernetes.volumes.SecretVolume>
              <mountPath>/home/jenkins/.config/git-secret</mountPath>
              <secretName>git-secret</secretName>
            </org.csanchez.jenkins.plugins.kubernetes.volumes.SecretVolume>
            <org.csanchez.jenkins.plugins.kubernetes.volumes.ConfigMapVolume>
              <mountPath>/home/jenkins/.ssh</mountPath>
              <configMapName>git-ssh</configMapName>
            </org.csanchez.jenkins.plugins.kubernetes.volumes.ConfigMapVolume>
            <org.csanchez.jenkins.plugins.kubernetes.volumes.ConfigMapVolume>
              <mountPath>/home/jenkins/.config/git</mountPath>
              <configMapName>git-config</configMapName>
            </org.csanchez.jenkins.plugins.kubernetes.volumes.ConfigMapVolume>
            <org.csanchez.jenkins.plugins.kubernetes.volumes.ConfigMapVolume>
              <mountPath>/home/jenkins/.m2</mountPath>
              <configMapName>maven-settings</configMapName>
            </org.csanchez.jenkins.plugins.kubernetes.volumes.ConfigMapVolume>
          </volumes>
          <containers>
            <org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>
              <name>jnlp</name>
              <image>registry.access.redhat.com/openshift3/jenkins-slave-maven-rhel7:v3.7</image>
              <privileged>false</privileged>
              <alwaysPullImage>false</alwaysPullImage>
              <workingDir>/tmp</workingDir>
              <command></command>
              <args>${computer.jnlpmac} ${computer.name}</args>
              <ttyEnabled>false</ttyEnabled>
              <resourceRequestCpu>500m</resourceRequestCpu>
              <resourceRequestMemory>1024Mi</resourceRequestMemory>
              <resourceLimitCpu>500m</resourceLimitCpu>
              <resourceLimitMemory>1024Mi</resourceLimitMemory>
              <envVars>
                <org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>
                  <key>JAVA_HOME</key>
                  <value>/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.i386</value>
                </org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>
                <org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>
                  <key>JAVA_OPTS</key>
                  <value>-Xms64m -Xmx64m</value>
                </org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>
                <org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>
                  <key>MAVEN_OPTS</key>
                  <value>-Xms128m -Xmx128m -DargLine=${env.SUREFIRE_OPTS} -Djavax.net.ssl.trustStore=/home/jenkins/.m2/myTruststore.jks -Djavax.net.ssl.trustStorePassword=changeit</value>
                </org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>
                <org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>
                  <key>SUREFIRE_OPTS</key>
                  <value>-Xms256m -Xmx256m</value>
                </org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>
                <org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>
                  <key>MAVEN_MIRROR_URL</key>
                  <value>https://nexus.mycompany.com/repository/maven-public</value>
                </org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>
                <org.csanchez.jenkins.plugins.kubernetes.model.SecretEnvVar>
                  <key>MAVEN_SERVER_USERNAME</key>
                  <secretName>maven-secret</secretName>
                  <secretKey>username</secretKey>
                </org.csanchez.jenkins.plugins.kubernetes.model.SecretEnvVar>
                <org.csanchez.jenkins.plugins.kubernetes.model.SecretEnvVar>
                  <key>MAVEN_SERVER_PASSWORD</key>
                  <secretName>maven-secret</secretName>
                  <secretKey>password</secretKey>
                </org.csanchez.jenkins.plugins.kubernetes.model.SecretEnvVar>
              </envVars>
              <ports/>
              <livenessProbe>
                <execArgs></execArgs>
                <timeoutSeconds>0</timeoutSeconds>
                <initialDelaySeconds>0</initialDelaySeconds>
                <failureThreshold>0</failureThreshold>
                <periodSeconds>0</periodSeconds>
                <successThreshold>0</successThreshold>
              </livenessProbe>
            </org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>
            <org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>
              <name>httpbin</name>
              <image>citizenstig/httpbin</image>
              <privileged>false</privileged>
              <alwaysPullImage>false</alwaysPullImage>
              <workingDir></workingDir>
              <command>/run.sh</command>
              <args></args>
              <ttyEnabled>false</ttyEnabled>
              <resourceRequestCpu></resourceRequestCpu>
              <resourceRequestMemory>256Mi</resourceRequestMemory>
              <resourceLimitCpu></resourceLimitCpu>
              <resourceLimitMemory>256Mi</resourceLimitMemory>
              <envVars/>
              <ports/>
              <livenessProbe>
                <execArgs></execArgs>
                <timeoutSeconds>0</timeoutSeconds>
                <initialDelaySeconds>0</initialDelaySeconds>
                <failureThreshold>0</failureThreshold>
                <periodSeconds>0</periodSeconds>
                <successThreshold>0</successThreshold>
              </livenessProbe>
            </org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>
          </containers>
          <envVars/>
          <annotations/>
          <imagePullSecrets/>
        </org.csanchez.jenkins.plugins.kubernetes.PodTemplate>
      </templates>
      <serverUrl>https://172.30.0.1:443</serverUrl>
      <serverCertificate>-----BEGIN CERTIFICATE-----
MIIC6jCC...
-----END CERTIFICATE-----</serverCertificate>
      <skipTlsVerify>false</skipTlsVerify>
      <namespace>first</namespace>
      <jenkinsUrl>http://jenkins.cicd.svc:80</jenkinsUrl>
      <jenkinsTunnel>jenkins-jnlp.cicd.svc:50000</jenkinsTunnel>
      <credentialsId>1a12dfa4-7fc5-47a7-aa17-cc56572a41c7</credentialsId>
      <containerCap>10</containerCap>
      <retentionTimeout>5</retentionTimeout>
      <connectTimeout>0</connectTimeout>
      <readTimeout>0</readTimeout>
      <maxRequestsPerHost>32</maxRequestsPerHost>
    </org.csanchez.jenkins.plugins.kubernetes.KubernetesCloud>
  </clouds>

</hudson>
```

尝试愉快的构建吧！

原文发表于 [ITNext][28]，已获得翻版授权。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/running-jenkins-builds-containers

作者：[Balazs Szeti][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bszeti
[1]:https://opensource.com/resources/what-docker
[2]:https://opensource.com/resources/what-is-kubernetes
[3]:https://martinfowler.com/articles/microservices.html
[4]:https://www.openshift.com/
[5]:https://developers.redhat.com/products/cdk/overview/
[6]:https://github.com/openshift/origin/tree/master/examples/jenkins
[7]:https://wiki.jenkins.io/display/JENKINS/Distributed+builds
[8]:https://jenkins.io/doc/book/pipeline/
[9]:https://github.com/jenkinsci/kubernetes-plugin
[10]:https://access.redhat.com/containers/#/search/jenkins%2520slave
[11]:https://hub.docker.com/search/?isAutomated=0&isOfficial=0&page=1&pullCount=0&q=openshift+jenkins+slave+&starCount=0
[12]:https://github.com/openshift/jenkins/tree/master/slave-base
[13]:https://github.com/openshift/jenkins/tree/master/slave-maven
[14]:https://github.com/openshift/jenkins/tree/master/slave-nodejs
[15]:https://docs.openshift.com/container-platform/3.7/architecture/core_concepts/builds_and_image_streams.html#source-build
[16]:https://github.com/bszeti/camel-springboot/tree/master/camel-rest-complex
[17]:https://issues.jenkins-ci.org/browse/JENKINS-47112
[18]:https://git-scm.com/docs/git-credential-store/1.8.2
[19]:https://git-scm.com/docs/git-config/1.8.2
[20]:https://bugzilla.redhat.com/show_bug.cgi?id=1430322
[21]:https://maven.apache.org/pom.html#Distribution_Management
[22]:https://docs.oracle.com/javase/8/docs/technotes/tools/unix/keytool.html
[23]:https://developers.redhat.com/blog/2017/03/14/java-inside-docker/
[24]:https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/parallel.html#default_heap_size
[25]:https://github.com/openshift/jenkins/blob/master/slave-base/contrib/bin/run-jnlp-client
[26]:http://maven.apache.org/surefire/maven-surefire-plugin/examples/fork-options-and-parallel-execution.html
[27]:http://maven.apache.org/surefire/maven-surefire-plugin/test-mojo.html#argLine
[28]:https://itnext.io/running-jenkins-builds-in-containers-458e90ff2a7b
[29]:https://docs.openshift.com/container-platform/3.7/using_images/other_images/jenkins.html
[30]:https://github.com/openshift/jenkins
[31]:https://blog.openshift.com/cicd-with-openshift/
[32]:http://v1.uncontained.io/playbooks/continuous_delivery/external-jenkins-integration.html
