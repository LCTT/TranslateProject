translating---geekpi

KRS: A new tool for gathering Kubernetes resource statistics
======
Zero-configuration tool simplifies gathering information, such as how many pods are running in a certain namespace.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_hardware_purple.png?itok=3NdVoYhl)

Recently I was in New York giving a talk at O'Reilly Velocity on the topic of [troubleshooting Kubernetes apps][1] and, motivated by the positive feedback and great discussions on the topic, I decided to revisit tooling in the space. It turns out that, besides [kubernetes-incubator/spartakus][2] and [kubernetes/kube-state-metrics][3], we don't really have much lightweight tooling available to collect resource stats (such as the number of pods or services in a namespace). So, I sat down on my way home and started coding on a little tool—creatively named **krs** , which is short for Kubernetes Resource Stats—that allows you to gather these stats.

You can use [mhausenblas/krs][5] in two ways:

  * directly from the command line (binaries for Linux, Windows, and MacOS are available); and
  * in cluster, as a deployment, using the [launch.sh][4] script, which creates the appropriate role-based access control (RBAC) permissions on the fly.



Mind you, it's very early days, and this is heavily a work in progress. However, the 0.1 release of **krs** offers the following features:

  * In a per-namespace basis, it periodically gathers resource stats (supporting pods, deployments, and services).
  * It exposes these stats as metrics in the [OpenMetrics format][6].
  * It can be used directly via binaries or in a containerized setup with all dependencies included.



In its current form, you need to have **kubectl** installed and configured for **krs** to work, because **krs** relies on a **kubectl get all** command to be executed to gather the stats. (On the other hand, who's using Kubernetes and doesn't have **kubectl** installed?)

Using **krs** is simple; [Download][7] the binary for your platform and execute it like this:

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

This will launch **krs** in the foreground, gathering resource stats from the namespace **thenamespacetowatch** and outputting them respectively in the OpenMetrics format on **stdout** for you to further process.

![krs screenshot][9]

Screenshot of krs in action.

But Michael, you may ask, why isn't it doing something useful (such as storing 'em in S3) with the metrics? Because [Unix philosophy][10].

For those wondering if they can directly use Prometheus or [kubernetes/kube-state-metrics][3] for this task: Well, sure you can, why not? The emphasis of **krs** is on being a lightweight and easy-to-use alternative to already available tooling—and maybe even being slightly complementary in certain aspects.

This was originally published on [Medium's ITNext][11] and is reprinted with permission.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/kubernetes-resource-statistics

作者：[Michael Hausenblas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
