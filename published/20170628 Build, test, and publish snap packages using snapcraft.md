使用 Snapcraft 构建、测试并发布 Snap 软件包
================================

snapcraft 是一个正在为其在 Linux 中的地位而奋斗的包管理系统，它为你重新设想了分发软件的方式。这套新的跨发行版的工具可以用来帮助你构建和发布 snap 软件包。接下来我们将会讲述怎么使用 CircleCI 2.0 来加速这个过程以及一些在这个过程中的可能遇到的问题。

### snap 软件包是什么？snapcraft 又是什么？

snap 是用于 Linux 发行版的软件包，它们在设计的时候吸取了像 Android 这样的移动平台和物联网设备上分发软件的经验教训。snapcraft 这个名字涵盖了 snap 和用来构建它们的命令行工具、这个 [snapcraft.io][1] 网站，以及在这些技术的支撑下构建的几乎整个生态系统。

snap 软件包被设计成用来隔离并封装整个应用程序。这些概念使得 snapcraft 提高软件安全性、稳定性和可移植性的目标得以实现，其中可移植性允许单个 snap 软件包不仅可以在 Ubuntu 的多个版本中安装，而且也可以在 Debian、Fedora 和 Arch 等发行版中安装。snapcraft 网站对其的描述如下：

> 为每个 Linux 桌面、服务器、云端或设备打包任何应用程序，并且直接交付更新。

### 在 CircleCI 2.0 上构建 snap 软件包

在 CircleCI 上使用 [CircleCI 2.0 语法][2] 来构建 snap 和在本地机器上基本相同。在本文中，我们将会讲解一个示例配置文件。如果您对 CircleCI 还不熟悉，或者想了解更多有关 2.0 的入门知识，您可以从 [这里][3] 开始。

### 基础配置

```
version: 2
jobs:
  build:
    machine: true
    working_directory: ~/project
    steps:
      - checkout
      - run:
          command: |
            sudo apt update && sudo apt install -y snapd
            sudo snap install snapcraft --edge --classic
            /snap/bin/snapcraft
```

这个例子使用了 `machine` 执行器来安装用于管理运行 snap 的可执行程序 `snapd` 和制作 snap 的 `snapcraft` 工具。

由于构建过程需要使用比较新的内核，所以我们使用了 `machine` 执行器而没有用 `docker` 执行器。在这里，Linux v4.4 已经足够满足我们的需求了。

### 用户空间的依赖关系

上面的例子使用了 `machine` 执行器，它实际上是一个内核为 Linux v4.4 的 [Ubuntu 14.04 (Trusty) 虚拟机][4]。如果 Trusty 仓库可以满足你的 project/snap 构建依赖，那就没问题。如果你的构建依赖需要其他版本，比如 Ubuntu 16.04 (Xenial)，我们仍然可以在 `machine` 执行器中使用 Docker 来构建我们的 snap 软件包 。

```
version: 2
jobs:
  build:
    machine: true
    working_directory: ~/project
    steps:
      - checkout
      - run:
          command: |
            sudo apt update && sudo apt install -y snapd
            docker run -v $(pwd):$(pwd) -t ubuntu:xenial sh -c "apt update -qq && apt install snapcraft -y && cd $(pwd) && snapcraft"

```

这个例子中，我们再次在 `machine` 执行器的虚拟机中安装了 `snapd`，但是我们决定将 snapcraft 安装在 Ubuntu Xenial 镜像构建的 Docker 容器中，并使用它来构建我们的 snap。这样，在 `snapcraft` 运行的过程中就可以使用在 Ubuntu 16.04 中可用的所有 `apt` 包。

### 测试

在我们的[博客](https://circleci.com/blog/)、[文档](https://circleci.com/docs/)以及互联网上已经有很多讲述如何对软件代码进行单元测试的内容。搜索你的语言或者框架和单元测试或者 CI 可以找到大量相关的信息。在 CircleCI 上构建 snap 软件包，我们最终会得到一个 `.snap` 的文件，这意味着除了创造它的代码外我们还可以对它进行测试。

### 工作流

假设我们构建的 snap 软件包是一个 webapp，我们可以通过测试套件来确保构建的 snap 可以正确的安装和运行，我们也可以试着安装它或者使用 [Selenium][5] 来测试页面加载、登录等功能正常工作。但是这里有一个问题，由于 snap 是被设计成可以在多个 Linux 发行版上运行，这就需要我们的测试套件可以在 Ubuntu 16.04、Fedora 25 和 Debian 9 等发行版中可以正常运行。这个问题我们可以通过 CircleCI 2.0 的工作流来有效地解决。

工作流是在最近的 CircleCI 2.0 测试版中加入的，它允许我们通过特定的逻辑流程来运行离散的任务。这样，使用单个任务构建完 snap 后，我们就可以开始并行的运行 snap 的发行版测试任务，每个任务对应一个不同的发行版的 [Docker 镜像][6] (或者在将来，还会有其他可用的执行器)。

这里有一个简单的例子：

```
workflows:
  version: 2
  build-test-and-deploy:
    jobs:
      - build
      - acceptance_test_xenial:
          requires:
            - build
      - acceptance_test_fedora_25:
          requires:
            - build
      - acceptance_test_arch:
          requires:
            - build
      - publish:
          requires:
            - acceptance_test_xenial
            - acceptance_test_fedora_25
            - acceptance_test_arch

```
在这个例子中首先构建了 snap，然后在四个不同的发行版上运行验收测试。如果所有的发行版都通过测试了，那么我们就可以运行发布 `job`，以便在将其推送到 snap 商店之前完成剩余的 snap 任务。

### 留着 .snap 包

为了测试我们在工作流示例中使用的 .snap 软件包，我们需要一种在构建的时候持久保存 snap 的方法。在这里我将提供两种方法：

1. **artifact** —— 在运行 `build` 任务的时候我们可以将 snaps 保存为一个 CircleCI 的 artifact（LCTT 译注：artifact 是 `snapcraft.yaml` 中的一个 `Plugin-specific` 关键字），然后在接下来的任务中检索它。CircleCI 工作流有自己处理共享 artifact 的方式，相关信息可以在 [这里][7] 找到。
2. **snap 商店通道** —— 当发布 snap 软件包到 snap 商店时，有多种通道可供我们选择。将 snap 的主分支发布到 edge 通道以供内部或者用户测试已经成为一种常见做法。我们可以在 `build` 任务中完成这些工作，然后接下来的的任务就可以从 edge 通道来安装构建好的 snap 软件包。

第一种方法速度更快，并且它还可以在 snap 软包上传到 snap 商店供用户甚至是测试用户使用之前对 snap 进行验收测试。第二种方法的好处是我们可以从 snap 商店安装 snap，这也是 CI 运行期间的测试项之一。

### snap 商店的身份验证

[snapcraft-config-generator.py][8] 脚本可以生成商店证书并将其保存到 `.snapcraft/snapcraft.cfg` 中（注意：在运行公共脚本之前一定要对其进行检查）。如果觉得在你仓库中使用明文来保存这个文件不安全，你可以用 `base64` 编码该文件，并将其存储为一个[私有环境变量][9]，或者你也可以对文件 [进行加密][10]，并将密钥存储在一个私有环境变量中。

下面是一个示例，将商店证书放在一个加密的文件中，并在 `deploy` 环节中使用它将 snap 发布到 snap 商店中。

```
- deploy:
    name: Push to Snap Store
    command: |
      openssl aes-256-cbc -d -in .snapcraft/snapcraft.encrypted -out .snapcraft/snapcraft.cfg -k $KEY
      /snap/bin/snapcraft push *.snap

```

除了 `deploy` 任务之外，工作流示例同之前的一样， `deploy` 任务只有当验收测试任务通过时才会运行。

### 更多的信息

* Alan Pope 在 [论坛中发的帖子][11]：“popey” 是 Canonical 的员工，他在 snapcraft 的论坛上写了这篇文章，并启发作者写了这篇博文。
* [snapcraft 网站][12]： snapcraft 官方网站。
* [snapcraft 的 CircleCI Bug 报告][13]：在 Launchpad 上有一个开放的 bug 报告页面，用来改善 CircleCI 对 snapcraft 的支持。同时这将使这个过程变得更简单并且更“正式”。期待您的支持。
* 怎么使用 CircleCI 构建 [Nextcloud][14] 的 snap：这里有一篇题为 [“复杂应用的持续验收测试”][15] 的博文，它同时也影响了这篇博文。


这篇客座文章的作者是 Ricardo Feliciano —— CircleCi 的开发者传道士。如果您也有兴趣投稿，请联系 ubuntu-iot@canonical.com。原始文章可以从 [这里][18] 找到。

---

via: https://insights.ubuntu.com/2017/06/28/build-test-and-publish-snap-packages-using-snapcraft/

译者简介：

> 常年混迹于 snapcraft.io，对 Ubuntu Core、snaps 和 snapcraft 有浓厚的兴趣，并致力于将这些还在快速发展的新技术通过翻译或原创的方式介绍到中文世界。有兴趣的小伙伴也可以关注译者个人的公众号： `Snapcraft`

作者：Ricardo Feliciano
译者：[Snapcrafter](https://github.com/Snapcrafter)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出



  [1]: https://snapcraft.io/
  [2]:https://circleci.com/docs/2.0/
  [3]: https://circleci.com/docs/2.0/first-steps/
  [4]: https://circleci.com/docs/1.0/differences-between-trusty-and-precise/
  [5]:http://www.seleniumhq.org/
  [6]:https://circleci.com/docs/2.0/building-docker-images/
  [7]: https://circleci.com/docs/2.0/workflows/#using-workspaces-to-share-artifacts-among-jobs
  [8]:https://gist.github.com/3v1n0/479ad142eccdd17ad7d0445762dea755
  [9]: https://circleci.com/docs/1.0/environment-variables/#setting-environment-variables-for-all-commands-without-adding-them-to-git
  [10]: https://github.com/circleci/encrypted-files
  [11]:https://forum.snapcraft.io/t/building-and-pushing-snaps-using-circleci/789
  [12]:https://snapcraft.io/
  [13]:https://bugs.launchpad.net/snapcraft/+bug/1693451
  [14]:https://nextcloud.com/
  [15]: https://kyrofa.com/posts/continuous-acceptance-tests-for-complex-applications
  [16]:https://nextcloud.com/
  [17]:https://kyrofa.com/posts/continuous-acceptance-tests-for-complex-applications
  [18]: https://circleci.com/blog/build-test-publish-snap-packages?utm_source=insightsubuntu&utm_medium=syndicatedblogpost
  [19]:https://circleci.com/blog/build-test-publish-snap-packages?utm_source=insightsubuntu&utm_medium=syndicatedblogpost
