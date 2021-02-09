[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11546-1.html)
[#]: subject: (Building CI/CD pipelines with Jenkins)
[#]: via: (https://opensource.com/article/19/9/intro-building-cicd-pipelines-jenkins)
[#]: author: (Bryant Son https://opensource.com/users/brson)

用 Jenkins 构建 CI/CD 流水线
======

> 通过这份 Jenkins 分步教程，构建持续集成和持续交付（CI/CD）流水线。

![](https://img.linux.net.cn/data/attachment/album/201911/07/001349rbbbswpeqnnteeee.jpg)

在我的文章《[使用开源工具构建 DevOps 流水线的初学者指南][2]》中，我分享了一个从头开始构建 DevOps 流水线的故事。推动该计划的核心技术是 [Jenkins][3]，这是一个用于建立持续集成和持续交付（CI/CD）流水线的开源工具。

在花旗，有一个单独的团队为专用的 Jenkins 流水线提供稳定的主从节点环境，但是该环境仅用于质量保证（QA）、构建阶段和生产环境。开发环境仍然是非常手动的，我们的团队需要对其进行自动化以在加快开发工作的同时获得尽可能多的灵活性。这就是我们决定为 DevOps 建立 CI/CD 流水线的原因。Jenkins 的开源版本由于其灵活性、开放性、强大的插件功能和易用性而成为显而易见的选择。

在本文中，我将分步演示如何使用 Jenkins 构建 CI/CD 流水线。

### 什么是流水线？

在进入本教程之前，了解有关 CI/CD <ruby>流水线<rt>pipeline</rt></ruby>的知识会很有帮助。

首先，了解 Jenkins 本身并不是流水线这一点很有帮助。只是创建一个新的 Jenkins 作业并不能构建一条流水线。可以把 Jenkins 看做一个遥控器，在这里点击按钮即可。当你点击按钮时会发生什么取决于遥控器要控制的内容。Jenkins 为其他应用程序 API、软件库、构建工具等提供了一种插入 Jenkins 的方法，它可以执行并自动化任务。Jenkins 本身不执行任何功能，但是随着其它工具的插入而变得越来越强大。

流水线是一个单独的概念，指的是按顺序连接在一起的事件或作业组：

> “<ruby>流水线<rt>pipeline</rt></ruby>”是可以执行的一系列事件或作业。

理解流水线的最简单方法是可视化一系列阶段，如下所示：

![Pipeline example][4]

在这里，你应该看到两个熟悉的概念：<ruby>阶段<rt>Stage</rt></ruby>和<ruby>步骤<rt>Step</rt></ruby>。

* 阶段：一个包含一系列步骤的块。阶段块可以命名为任何名称；它用于可视化流水线过程。
* 步骤：表明要做什么的任务。步骤定义在阶段块内。

在上面的示例图中，阶段 1 可以命名为 “构建”、“收集信息”或其它名称，其它阶段块也可以采用类似的思路。“步骤”只是简单地说放上要执行的内容，它可以是简单的打印命令（例如，`echo "Hello, World"`）、程序执行命令（例如，`java HelloWorld`）、shell 执行命令（ 例如，`chmod 755 Hello`）或任何其他命令，只要通过 Jenkins 环境将其识别为可执行命令即可。

Jenkins 流水线以**编码脚本**的形式提供，通常称为 “Jenkinsfile”，尽管可以用不同的文件名。下面这是一个简单的 Jenkins 流水线文件的示例：
 
```
// Example of Jenkins pipeline script

pipeline {
  stages {
    stage("Build") {
      steps {
          // Just print a Hello, Pipeline to the console
          echo "Hello, Pipeline!"
          // Compile a Java file. This requires JDKconfiguration from Jenkins
          javac HelloWorld.java
          // Execute the compiled Java binary called HelloWorld. This requires JDK configuration from Jenkins
          java HelloWorld
          // Executes the Apache Maven commands, clean then package. This requires Apache Maven configuration from Jenkins
          mvn clean package ./HelloPackage
          // List the files in current directory path by executing a default shell command
          sh "ls -ltr"
      }
    }
   // And next stages if you want to define further...
  } // End of stages
} // End of pipeline
```

从此示例脚本很容易看到 Jenkins 流水线的结构。请注意，默认情况下某些命令（如 `java`、`javac`和 `mvn`）不可用，需要通过 Jenkins 进行安装和配置。 因此：

> Jenkins 流水线是一种以定义的方式依次执行 Jenkins 作业的方法，方法是将其编码并在多个块中进行结构化，这些块可以包含多个任务的步骤。

好。既然你已经了解了 Jenkins 流水线是什么，我将向你展示如何创建和执行 Jenkins 流水线。在本教程的最后，你将建立一个 Jenkins 流水线，如下所示：

![Final Result][5]

### 如何构建 Jenkins 流水线

为了便于遵循本教程的步骤，我创建了一个示例 [GitHub 存储库][6]和一个视频教程。

- [视频](https://img.linux.net.cn/static/video/_-jDPwYgDVKlg.mp4)

开始本教程之前，你需要：

* Java 开发工具包（JDK）：如果尚未安装，请安装 JDK 并将其添加到环境路径中，以便可以通过终端执行 Java 命令（如 `java jar`）。这是利用本教程中使用的 Java Web Archive（WAR）版本的 Jenkins 所必需的（尽管你可以使用任何其他发行版）。
* 基本计算机操作能力：你应该知道如何键入一些代码、通过 shell 执行基本的 Linux 命令以及打开浏览器。

让我们开始吧。

#### 步骤一：下载 Jenkins

导航到 [Jenkins 下载页面][7]。向下滚动到 “Generic Java package (.war)”，然后单击下载文件；将其保存在易于找到的位置。（如果你选择其他 Jenkins 发行版，除了步骤二之外，本教程的其余步骤应该几乎相同。）使用 WAR 文件的原因是它是个一次性可执行文件，可以轻松地执行和删除。

![Download Jenkins as Java WAR file][8]

#### 步骤二：以 Java 二进制方式执行 Jenkins

打开一个终端窗口，并使用 `cd <your path>` 进入下载 Jenkins 的目录。（在继续之前，请确保已安装 JDK 并将其添加到环境路径。）执行以下命令，该命令将 WAR 文件作为可执行二进制文件运行：

```
java -jar ./jenkins.war
```

如果一切顺利，Jenkins 应该在默认端口 8080 上启动并运行。

![Execute as an executable JAR binary][9]

#### 步骤三：创建一个新的 Jenkins 作业

打开一个 Web 浏览器并导航到 `localhost:8080`。除非你有以前安装的 Jenkins，否则应直接转到 Jenkins 仪表板。点击 “Create New Jobs”。你也可以点击左侧的 “New Item”。

![Create New Job][10]

#### 步骤四：创建一个流水线作业

在此步骤中，你可以选择并定义要创建的 Jenkins 作业类型。选择 “Pipeline” 并为其命名（例如，“TestPipeline”）。单击 “OK” 创建流水线作业。

![Create New Pipeline Job][11]

你将看到一个 Jenkins 作业配置页面。向下滚动以找到 “Pipeline” 部分。有两种执行 Jenkins 流水线的方法。一种方法是在 Jenkins 上直接编写流水线脚本，另一种方法是从 SCM（源代码管理）中检索 Jenkins 文件。在接下来的两个步骤中，我们将体验这两种方式。

#### 步骤五：通过直接脚本配置并执行流水线作业

要使用直接脚本执行流水线，请首先从 GitHub 复制该 [Jenkinsfile 示例][6]的内容。选择 “Pipeline script” 作为 “Destination”，然后将该 Jenkinsfile 的内容粘贴到 “Script” 中。花一些时间研究一下 Jenkins 文件的结构。注意，共有三个阶段：Build、Test 和 Deploy，它们是任意的，可以是任何一个。每个阶段中都有一些步骤；在此示例中，它们只是打印一些随机消息。

单击 “Save” 以保留更改，这将自动将你带回到 “Job Overview” 页面。

![Configure to Run as Jenkins Script][12]

要开始构建流水线的过程，请单击 “Build Now”。如果一切正常，你将看到第一个流水线（如下面的这个）。

![Click Build Now and See Result][13]

要查看流水线脚本构建的输出，请单击任何阶段，然后单击 “Log”。你会看到这样的消息。

![Visit sample GitHub with Jenkins get clone link][14]

#### 步骤六：通过 SCM 配置并执行流水线作业

现在，换个方式：在此步骤中，你将通过从源代码控制的 GitHub 中复制 Jenkinsfile 来部署相同的 Jenkins 作业。在同一个 [GitHub 存储库][6]中，通过单击 “Clone or download” 并复制其 URL 来找到其存储库 URL。

![Checkout from GitHub][15]

单击 “Configure” 以修改现有作业。滚动到 “Advanced Project Options” 设置，但这一次，从 “Destination” 下拉列表中选择 “Pipeline script from SCM” 选项。将 GitHub 存储库的 URL 粘贴到 “Repository URL” 中，然后在 “Script Path” 中键入 “Jenkinsfile”。 单击 “Save” 按钮保存。

![Change to Pipeline script from SCM][16]

要构建流水线，回到 “Task Overview” 页面后，单击 “Build Now” 以再次执行作业。结果与之前相同，除了多了一个称为 “Declaration: Checkout SCM” 的阶段。

![Build again and verify][17]

要查看来自 SCM 构建的流水线的输出，请单击该阶段并查看 “Log” 以检查源代码控制克隆过程的进行情况。

![Verify Checkout Procedure][18]

### 除了打印消息，还能做更多

恭喜你！你已经建立了第一个 Jenkins 流水线！

“但是等等”，你说，“这太有限了。除了打印无用的消息外，我什么都做不了。”那没问题。到目前为止，本教程仅简要介绍了 Jenkins 流水线可以做什么，但是你可以通过将其与其他工具集成来扩展其功能。以下是给你的下一个项目的一些思路：

* 建立一个多阶段的 Java 构建流水线，从以下阶段开始：从 Nexus 或 Artifactory 之类的 JAR 存储库中拉取依赖项、编译 Java 代码、运行单元测试、打包为 JAR/WAR 文件，然后部署到云服务器。
* 实现一个高级代码测试仪表板，该仪表板将基于 Selenium 的单元测试、负载测试和自动用户界面测试，报告项目的运行状况。
* 构建多流水线或多用户流水线，以自动化执行 Ansible 剧本的任务，同时允许授权用户响应正在进行的任务。
* 设计完整的端到端 DevOps 流水线，该流水线可提取存储在 SCM 中的基础设施资源文件和配置文件（例如 GitHub），并通过各种运行时程序执行该脚本。

学习本文结尾处的任何教程，以了解这些更高级的案例。

#### 管理 Jenkins

在 Jenkins 主面板，点击 “Manage Jenkins”。

![Manage Jenkins][19]

#### 全局工具配置

有许多可用工具，包括管理插件、查看系统日志等。单击 “Global Tool Configuration”。

![Global Tools Configuration][20]

#### 增加附加能力

在这里，你可以添加 JDK 路径、Git、Gradle 等。配置工具后，只需将该命令添加到 Jenkinsfile 中或通过 Jenkins 脚本执行即可。

![See Various Options for Plugin][21]

### 后继

本文为你介绍了使用酷炫的开源工具 Jenkins 创建 CI/CD 流水线的方法。要了解你可以使用 Jenkins 完成的许多其他操作，请在 Opensource.com 上查看以下其他文章：

* [Jenkins X 入门][22]
* [使用 Jenkins 安装 OpenStack 云][23]
* [在容器中运行 Jenkins][24]
* [Jenkins 流水线入门][25]
* [如何与 Jenkins 一起运行 JMeter][26]
* [将 OpenStack 集成到你的 Jenkins 工作流中][27]

你可能对我为你的开源之旅而写的其他一些文章感兴趣：

* [9 个用于构建容错系统的开源工具][28]
* [了解软件设计模式][29]
* [使用开源工具构建 DevOps 流水线的初学者指南][2]

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/intro-building-cicd-pipelines-jenkins

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/pipe-pipeline-grid.png?itok=kkpzKxKg (pipelines)
[2]: https://linux.cn/article-11307-1.html
[3]: https://jenkins.io/
[4]: https://opensource.com/sites/default/files/uploads/diagrampipeline.jpg (Pipeline example)
[5]: https://opensource.com/sites/default/files/uploads/0_endresultpreview_0.jpg (Final Result)
[6]: https://github.com/bryantson/CICDPractice
[7]: https://jenkins.io/download/
[8]: https://opensource.com/sites/default/files/uploads/2_downloadwar.jpg (Download Jenkins as Java WAR file)
[9]: https://opensource.com/sites/default/files/uploads/3_runasjar.jpg (Execute as an executable JAR binary)
[10]: https://opensource.com/sites/default/files/uploads/4_createnewjob.jpg (Create New Job)
[11]: https://opensource.com/sites/default/files/uploads/5_createpipeline.jpg (Create New Pipeline Job)
[12]: https://opensource.com/sites/default/files/uploads/6_runaspipelinescript.jpg (Configure to Run as Jenkins Script)
[13]: https://opensource.com/sites/default/files/uploads/7_buildnow4script.jpg (Click Build Now and See Result)
[14]: https://opensource.com/sites/default/files/uploads/8_seeresult4script.jpg (Visit sample GitHub with Jenkins get clone link)
[15]: https://opensource.com/sites/default/files/uploads/9_checkoutfromgithub.jpg (Checkout from GitHub)
[16]: https://opensource.com/sites/default/files/uploads/10_runsasgit.jpg (Change to Pipeline script from SCM)
[17]: https://opensource.com/sites/default/files/uploads/11_seeresultfromgit.jpg (Build again and verify)
[18]: https://opensource.com/sites/default/files/uploads/12_verifycheckout.jpg (Verify Checkout Procedure)
[19]: https://opensource.com/sites/default/files/uploads/13_managingjenkins.jpg (Manage Jenkins)
[20]: https://opensource.com/sites/default/files/uploads/14_globaltoolsconfiguration.jpg (Global Tools Configuration)
[21]: https://opensource.com/sites/default/files/uploads/15_variousoptions4plugin.jpg (See Various Options for Plugin)
[22]: https://opensource.com/article/18/11/getting-started-jenkins-x
[23]: https://opensource.com/article/18/4/install-OpenStack-cloud-Jenkins
[24]: https://linux.cn/article-9741-1.html
[25]: https://opensource.com/article/18/4/jenkins-pipelines-with-cucumber
[26]: https://opensource.com/life/16/7/running-jmeter-jenkins-continuous-delivery-101
[27]: https://opensource.com/business/15/5/interview-maish-saidel-keesing-cisco
[28]: https://opensource.com/article/19/3/tools-fault-tolerant-system
[29]: https://opensource.com/article/19/7/understanding-software-design-patterns
