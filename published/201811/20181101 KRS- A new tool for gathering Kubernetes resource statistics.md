KRS：一个收集 Kubernetes 资源统计数据的新工具
======

> 零配置工具简化了信息收集，例如在某个命名空间中运行了多少个 pod。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_hardware_purple.png?itok=3NdVoYhl)

最近我在纽约的 O'Reilly Velocity 就 [Kubernetes 应用故障排除][1]的主题发表了演讲，并且在积极的反馈和讨论的推动下，我决定重新审视这个领域的工具。结果，除了 [kubernetes-incubator/spartakus][2] 和 [kubernetes/kube-state-metrics][3] 之外，我们还没有太多的轻量级工具来收集资源统计数据（例如命名空间中的 pod 或服务的数量）。所以，我在回家的路上开始编写一个小工具 —— 创造性地命名为 `krs`，它是 Kubernetes Resource Stats 的简称 ，它允许你收集这些统计数据。

你可以通过两种方式使用 [mhausenblas/krs][5]：

* 直接在命令行（有 Linux、Windows 和 MacOS 的二进制文件），以及
* 在集群中使用 [launch.sh][4] 脚本部署，该脚本动态创建适当的基于角色的访问控制（RBAC） 权限。

提醒你，它还在早期，并且还在开发中。但是，`krs` 的 0.1 版本提供以下功能：

* 在每个命名空间的基础上，它定期收集资源统计信息（支持 pod、部署和服务）。
* 它以 [OpenMetrics 格式][6]公开这些统计。
* 它可以直接通过二进制文件使用，也可以在包含所有依赖项的容器化设置中使用。

目前，你需要安装并配置 `kubectl`，因为 `krs` 依赖于执行 `kubectl get all` 命令来收集统计数据。（另一方面，谁会使用 Kubernetes 但没有安装 `kubectl` 呢？）

使用 `krs` 很简单。[下载][7]适合你平台的二进制文件，并按如下方式执行：

```
$ krs thenamespacetowatch
# HELP pods Number of pods in any state, for example running
# TYPE pods gauge
pods{namespace="thenamespacetowatch"} 13
# HELP deployments Number of deployments
# TYPE deployments gauge
deployments{namespace="thenamespacetowatch"} 6
# HELP services Number of services
# TYPE services gauge
services{namespace="thenamespacetowatch"} 4
```

这将在前台启动 `krs`，从名称空间 `thenamespacetowatch` 收集资源统计信息，并分别在标准输出中以 OpenMetrics 格式输出它们，以供你进一步处理。

![krs screenshot][9]

*krs 实战截屏*

也许你会问，Michael，为什么它不能做一些有用的事（例如将指标存储在 S3 中）？因为 [Unix 哲学][10]。

对于那些想知道他们是否可以直接使用 Prometheus 或 [kubernetes/kube-state-metrics][3] 来完成这项任务的人：是的，你可以，为什么不行呢？ `krs` 的重点是作为已有工具的轻量级且易于使用的替代品 —— 甚至可能在某些方面略微互补。

本文最初发表在 [Medium 的 ITNext][11] 上，并获得授权转载。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/kubernetes-resource-statistics

作者：[Michael Hausenblas][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mhausenblas
[b]: https://github.com/lujun9972
[1]: http://troubleshooting.kubernetes.sh/
[2]: https://github.com/kubernetes-incubator/spartakus
[3]: https://github.com/kubernetes/kube-state-metrics
[4]: https://github.com/mhausenblas/krs/blob/master/launch.sh
[5]: https://github.com/mhausenblas/krs
[6]: https://openmetrics.io/
[7]: https://github.com/mhausenblas/krs/releases
[8]: /file/412706
[9]: https://opensource.com/sites/default/files/uploads/krs_screenshot.png (krs screenshot)
[10]: http://harmful.cat-v.org/cat-v/
[11]: https://itnext.io/kubernetes-resource-statistics-e8247f92b45c
