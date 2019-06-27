[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Kubernetes basics: Learn how to drive first)
[#]: via: (https://opensource.com/article/19/6/kubernetes-basics)
[#]: author: (Scott McCarty https://opensource.com/users/fatherlinux/users/fatherlinux/users/fatherlinux)

Kubernetes 基础：首先学习如何使用
======
放弃专注于新项目，专注于获取你的 Kubernetes 翻斗车商业驾驶执照。
![Truck steering wheel and dash][1]

在本系列的前两篇文章中，我解释了为何 Kubernetes [像翻斗车][2]并且要理解优雅、专业的工具，如 [Kubernetes][4]（和翻斗车，起重机等）总是有[学习曲线][3]的。本文是下一步：学习如何驾驶。

最近，我在 Reddit 上看到了一个关于[重要的 Kubernetes 项目][5]的帖子。人们似乎很想知道他们应该学习如何开始使用 Kubernetes。“驾驶翻斗车的类比”有助于确保问题保持正轨。帖子中的某个人提到你不应该运行自己的镜像仓库，除非你必须这样做，所以人们开始逐渐接受驱动 Kubernetes 而不是构建它。

API 是 Kubernetes 的引擎和变速器。像翻斗车的方向盘、离合器、汽油和制动踏板一样，用于构建应用程序的 YAML 或 JSON 文件是机器的主要接口。当你第一次学习 Kubernetes 时，这应该是你的主要关注点。了解你的控制部件。不要被所有最新和最大的项目所左右。当你刚学会开车时，不要尝试驾驶实验性的翻斗车。相反，专注于基础知识。

### 定义状态和实际状态

首先，Kubernetes 遵循定义状态和实际状态的原则。

![Defined state and actual state][6]

人类（开发人员/系统管理员/运维人员）使用他们提交给 Kubernetes API 的 YAML/JSON 文件指定定义的状态。然后，Kubernetes 使用控制器来分析 YAML/JSON 中定义的新状态与集群中的实际状态之间的差异。

在上面的例子中，Replication Controller 可以看到用户指定的三个 pod 之间的差异，其中一个 pod 正在运行，并调度另外两个 Pod。如果你要登录 Kubernetes 并手动杀死其中一个 Pod，它会不断启动另一个来替换它。在实际状态与定义的状态匹配之前，Kubernetes 不会停止。这是非常强大的。

### **原语**

接下来，你需要了解可以在 Kubernetes 中指定的原语。

![Kubernetes primitives][7]

它不仅仅有 Pods，还有部署 （Deployments）、持久化卷声明 （Persistent Volume Claims）、服务 （Services），路由 （routes） 等。使用支持 Kubernetes 的平台 [OpenShift][8]，你可以添加构建和 BuildConfigs。你大概需要一天左右的时间来了解这些原语。之后，当你的情况变得更加复杂时，你可以深入了解。

### 将开发者映射到传统 IT 环境

最后，考虑这该如何映射到你在传统 IT 环境中的操作。

![Mapping developer-native to traditional IT environments][9]

尽管是一个技术问题，但用户一直在尝试解决业务问题。从历史上看，我们使用诸如 playbook 之类的东西将业务逻辑与单一语言的 IT 系统绑定起来。对于运维人员来说，这很不错，但是当你尝试将其扩展到开发人员时，它会变得更加繁琐。

直到 Kubernete 出现之前，我们从未能够以开发者的方式真正同时指定一组 IT 系统应如何表现和交互。如果你考虑一下，我们正在使用在 Kubernetes 中编写的 YAML/JSON 文件以非常便携和声明的方式扩展了管理存储、网络和计算资源的能力，但它们总会映射到某处的“真实”资源。我们不必以开发者身份担心它。

因此，快放弃关注 Kubernetes 生态系统中的新项目，而是专注开始使用它。在下一篇文章中，我将分享一些可以帮助你使用 Kubernetes 的工具和工作流程。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/kubernetes-basics

作者：[Scott McCarty][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux/users/fatherlinux/users/fatherlinux
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/truck_steering_wheel_drive_car_kubernetes.jpg?itok=0TOzve80 (Truck steering wheel and dash)
[2]: https://opensource.com/article/19/6/kubernetes-dump-truck
[3]: https://opensource.com/article/19/6/kubernetes-learning-curve
[4]: https://opensource.com/resources/what-is-kubernetes
[5]: https://www.reddit.com/r/kubernetes/comments/bsoixc/what_are_the_essential_kubernetes_related/
[6]: https://opensource.com/sites/default/files/uploads/defined_state_-_actual_state.png (Defined state and actual state)
[7]: https://opensource.com/sites/default/files/uploads/new_primitives.png (Kubernetes primatives)
[8]: https://www.openshift.com/
[9]: https://opensource.com/sites/default/files/uploads/developer_native_experience_-_mapped_to_traditional.png (Mapping developer-native to traditional IT environments)
