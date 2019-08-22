[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10973-1.html)
[#]: subject: (5 reasons to use Kubernetes)
[#]: via: (https://opensource.com/article/19/6/reasons-kubernetes)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)

使用 Kubernetes 的 5 个理由
======

> Kubernetes 解决了一些开发和运维团队每天关注的的常见问题。

![](https://img.linux.net.cn/data/attachment/album/201906/14/110657gk2jz6f6kqff2kk4.jpg)

[Kubernetes][2]（K8S）是面向企业的开源容器编排工具的事实标准。它提供了应用部署、扩展、容器管理和其他功能，使企业能够通过容错能力快速优化硬件资源利用率并延长生产环境运行时间。该项目最初由谷歌开发，并将该项目捐赠给[云原生计算基金会][3]（CNCF）。2018 年，它成为第一个从 CNCF [毕业][4]的项目。

这一切都很好，但它并不能解释为什么开发者和运维人员应该在 Kubernetes 上投入宝贵的时间和精力。Kubernetes 之所以如此有用，是因为它有助于开发者和运维人员迅速解决他们每天都在努力解决的问题。

以下是 Kubernetes 帮助开发者和运维人员解决他们最常见问题的五种能力。

### 1、厂商无关

许多公有云提供商不仅提供托管 Kubernetes 服务，还提供许多基于这些服务构建的云产品，来用于本地应用容器编排。由于与供应商无关，使运营商能够轻松、安全地设计、构建和管理多云和混合云平台，而不会有供应商锁定的风险。Kubernetes 还消除了运维团队对复杂的多云/混合云战略的担忧。

### 2、服务发现

为了开发微服务应用，Java 开发人员必须控制服务可用性（就应用是否可以提供服务而言），并确保服务持续存在，以响应客户端的请求，而没有任何例外。Kubernetes 的[服务发现功能][5]意味着开发人员不再需要自己管理这些东西。

### 3、触发

你的 DevOps 会如何在上千台虚拟机上部署多语言、云原生应用？理想情况下，开发和运维会在 bug 修复、功能增强、新功能、安全更新时触发部署。Kubernetes 的[部署功能][6]会自动化这个日常工作。更重要的时，它支持高级部署策略，例如[蓝绿部署和金丝雀部署][7]。

### 4、可伸缩性

自动扩展是处理云环境中大量工作负载所需的关键功能。通过构建容器平台，你可以为终端用户提高系统可靠性。[Kubernetes Horizo​​ntal Pod Autoscaler][8]（HPA）允许一个集群增加或减少应用程序（或 Pod）的数量，以应对峰值流量或性能峰值，从而减少对意外系统中断的担忧。

### 5、容错性

在现代应用体系结构中，应考虑故障处理代码来控制意外错误并快速从中恢复。但是开发人员需要花费大量的时间和精力来模拟偶然的错误。Kubernetes 的 [ReplicaSet][9] 通过确保指定数量的 Pod 持续保持活动来帮助开发人员解决此问题。

### 结论

Kubernetes 使企业能够轻松、快速、安全地解决常见的开发和运维问题。它还提供其他好处，例如构建无缝的多云/混合云战略，节省基础架构成本以及加快产品上市时间。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/reasons-kubernetes

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_wheel_gear_devops_kubernetes.png?itok=xm4a74Kv
[2]: https://opensource.com/resources/what-is-kubernetes
[3]: https://www.cncf.io/projects/
[4]: https://www.cncf.io/blog/2018/03/06/kubernetes-first-cncf-project-graduate/
[5]: https://kubernetes.io/docs/concepts/services-networking/service/
[6]: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
[7]: https://opensource.com/article/17/5/colorful-deployments
[8]: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/
[9]: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/
