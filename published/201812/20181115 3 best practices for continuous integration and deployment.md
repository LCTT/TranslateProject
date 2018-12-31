持续集成与部署的 3 个最佳实践
======

> 了解自动化，使用 Git 存储库以及参数化 Jenkins 管道。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/innovation_lightbulb_gears_devops_ansible.png?itok=TSbmp3_M)

本文涵盖了三个关键主题：自动化 CI/CD 配置、使用 Git 存储库处理常见的 CI/CD 工件、参数化 Jenkins 管道。

### 术语

首先，我们定义一些术语。**CI/CD**  是允许团队快速自动化测试、打包、部署其应用程序的实践。它通常通过利用名为 [Jenkins][1] 的服务器来实现，该服务器充当 CI/CD 协调器。Jenkins 侦听特定输入（通常是代码签入后的 Git 挂钩），并在触发时启动一个管道。

<ruby>管道<rt>pipeline</rt></ruby> 由开发和/或运营团队编写的代码组成，这些代码指导 Jenkins 在 CI/CD 过程中采取哪些操作。这个流水线通常类似于“构建我的代码，然后测试我的代码，如果这些测试通过，则把我的应用程序部署到下一个最高环境（通常是开发、测试或生产环境）”。组织通常具有更复杂的管道，并入了诸如工件存储库和代码分析器之类的工具，这里提供了一个高级示例。

现在我们了解了关键术语，让我们深入研究一些最佳实践。

### 1、自动化是关键

要在 PaaS 上运行 CI/CD，需要在集群上配置适当的基础设施。在这个例子中，我将使用 [OpenShift][2]。

“Hello, World” 的实现很容易实现。简单地运行 `oc new-app jenkins-<persistent/ephemeral>`，然后，你就有了一个已经就绪的运行中的 Jenkins 服务器了。然而，在企业中的使用要复杂得多。除了 Jenkins 服务器之外，管理员通常还需要部署代码分析工具（如 SonarQube）和工件库（如 Nexus）。然后，它们必须创建管道来执行 CI/CD 和 Jenkins 从服务器，以减少主服务器的负载。这些实体中的大多数都由 OpenShift 资源支持，需要创建这些资源来部署所需的 CI/CD 基础设施。

最后，部署 CI/CD 组件所需要的手动步骤可能是需要重复进行的，而且你可能不想成为执行那些重复步骤的人。为了确保结果能够像以前一样快速、无错误和准确地产生，应该在创建基础设施的方式中结合自动化方法。这可以是一个 Ansible 剧本、一个 Bash 脚本，或者任何您希望自动化 CI/CD 基础设施部署的其它方式。我已经使用 [Ansible][3] 和 [OpenShift-Applier][4] 角色来自动化我的实现。您可能会发现这些工具很有价值，或者您可能会发现其他一些对您和组织更有效的工具。无论哪种方式，您都将发现自动化显著地减少了重新创建 CI/CD 组件所需的工作量。

#### 配置 Jenkins 主服务器

除了一般的“自动化”之外，我想单独介绍一下 Jenkins 主服务器，并讨论管理员如何利用 OpenShift 来自动化配置 Jenkins。来自 [Red Hat Container Catalog][5] 的 Jenkins 镜像已经安装了 [OpenShift-Sync plugin][6]。在 [该视频][7] 中，我们将讨论如何使用这个插件来创建 Jenkins 管道和从设备。

要创建 Jenkins 管道，请创建一个类似于下面的 OpenShift BuildConfig：

```
apiVersion: v1
kind: BuildConfig
...
spec:  
  source:      
    git:  
      ref: master      
      uri: <repository-uri>  
  ...  
  strategy:    
    jenkinsPipelineStrategy:    
      jenkinsfilePath: Jenkinsfile      
    type: JenkinsPipeline
```

OpenShift-Sync 插件将注意到已经创建了带有 `jenkinsPipelineStrategy` 策略的 BuildConfig，并将其转换为 Jenkins 管道，从 Git 源指定的 Jenkinsfile 中提取。也可以使用内联 Jenkinsfile，而不是从 Git 存储库中提取。有关更多信息，请参阅[文档][8]。

要创建 Jenkins 从站，请创建一个 OpenShift ImageStream，它从以下定义开始：

```
apiVersion: v1
kind: ImageStream
metadata:
  annotations:
    slave-label: jenkins-slave
    labels:
      role: jenkins-slave
...
```

注意在这个 ImageStream 中定义的元数据。OpenShift-Sync 插件将把带有标签 `role: jenkins-slave` 的任何 ImageStream 转换为 Jenkins 从站。Jenkins 从站将以 `slave-label` 注释中的值命名。

ImageStreams 对于简单的 Jenkins 从属配置工作得很好，但是一些团队会发现有必要配置一些细节详情，比如资源限制、准备就绪和活动性探测，以及实例上限。这就是 ConfigMap 发挥作用的地方：

```
apiVersion: v1
kind: ConfigMap
metadata:
  labels:
  role: jenkins-slave
...
data:
  template1: |-
    <Kubernetes pod template>
```

注意，仍然需要角色：`jenkins-slave` 标签来将 ConfigMap 转换为 Jenkins 从站。Kubernetes pod 模板由一长段 XML 组成，它将根据组织的喜好配置每个细节。要查看此 XML，以及有关将 ImageStreams 和 ConfigMaps 转换为 Jenkins 从站的更多信息，请参阅[文档][9]。

请注意上面所示的三个示例，其中没有一个操作需要管理员对 Jenkins 控制台进行手动更改。通过使用 OpenShift 资源，可以简单的自动化方式配置 Jenkins。

### 2、分享就是关爱

第二个最佳实践是维护一个公共 CI/CD 工件的 Git 存储库。主要思想是防止团队重新发明轮子。假设您的团队需要执行到 OpenShift 环境的蓝/绿部署，作为管道 CD 阶段的一部分。负责编写管道的团队成员可能不是 OpenShift 专家，也不可能具有从头开始编写此功能的能力。幸运的是，有人已经编写了一个将此功能合并到一个公共 CI/CD 存储库中的函数，因此您的团队可以使用该函数而不是花时间编写一个函数。

为了更进一步，您的组织可能决定维护整个管道。您可能会发现团队正在编写具有相似功能的管道。对于那些团队来说，使用来自公共存储库的参数化管道要比从头开始编写自己的管道更有效。

### 3、少即是多

正如我在前一节中提到的，第三个也是最后一个最佳实践是参数化您的 CI/CD 管道。参数化将防止过多的管道，使您的 CI/CD 系统更容易维护。假设我有多个区域可以部署应用程序。如果没有参数化，我需要为每个区域设置单独的管道。

要参数化一个作为 OpenShift 构建配置编写的管道，请将 `env` 节添加到配置：

```
...
spec:
  ...
  strategy:
    jenkinsPipelineStrategy:
      env:
      - name: REGION
        value: US-West          
      jenkinsfilePath: Jenkinsfile      
    type: JenkinsPipeline
```

使用此配置，我可以传递 `REGION` 参数给管道以将我的应用程序部署到指定区域。

这有一个[视频][7]提供了一个更实质性的情况，其中参数化是必须的。一些组织决定把他们的 CI/CD 管道分割成单独的 CI 和 CD 管道，通常是因为在部署之前有一些审批过程。假设我有四个镜像和三个不同的环境要部署。如果没有参数化，我需要 12 个 CD 管道来允许所有部署可能性。这会很快失去控制。为了使 CD 流水线的维护更容易，组织会发现将镜像和环境参数化以便允许一个流水线执行多个流水线的工作会更好。

### 总结

企业级的 CI/CD 往往比许多组织预期的更加复杂。幸运的是，对于 Jenkins，有很多方法可以无缝地提供设置的自动化。维护一个公共 CI/CD 工件的 Git 存储库也会减轻工作量，因为团队可以从维护的依赖项中提取而不是从头开始编写自己的依赖项。最后，CI/CD 管道的参数化将减少必须维护的管道的数量。

如果您找到了其他不可或缺的做法，请在评论中分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/best-practices-cicd

作者：[Austin Dewey][a]
选题：[lujun9972][b]
译者：[ChiZelin](https://github.com/ChiZelin)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/adewey
[b]: https://github.com/lujun9972
[1]: https://jenkins.io/
[2]: https://www.openshift.com/
[3]: https://docs.ansible.com/
[4]: https://github.com/redhat-cop/openshift-applier
[5]: https://access.redhat.com/containers/?tab=overview#/registry.access.redhat.com/openshift3/jenkins-2-rhel7
[6]: https://github.com/openshift/jenkins-sync-plugin
[7]: https://www.youtube.com/watch?v=zlL7AFWqzfw
[8]: https://docs.openshift.com/container-platform/3.11/dev_guide/dev_tutorials/openshift_pipeline.html#the-pipeline-build-config
[9]: https://docs.openshift.com/container-platform/3.11/using_images/other_images/jenkins.html#configuring-the-jenkins-kubernetes-plug-in
