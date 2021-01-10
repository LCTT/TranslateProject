[#]: collector: "lujun9972"
[#]: translator: "larryzju"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "How to use Kubernetes resource quotas"
[#]: via: "https://opensource.com/article/20/12/kubernetes-resource-quotas"
[#]: author: "Mike Calizo https://opensource.com/users/mcalizo"

Kubernetes resource quota 使用指南
======
Resource quotas <ruby>控制<rt>control</rt></ruby>应用的 CPU 或内存使用情况，防止<ruby>资源被过量使用<rt>resource contention</rt></ruby>或<ruby>抢占<rt>land grabs</rt></ruby>
![Jars with food inside on a shelf][1]

当 Kubernetes 集群运行过一段时间或者在被开发者大量使用后，[Kubernetes][2] 资源（例如 CPU 和内存）的控制的问题就会显现出来。而在大多情况下只有集群出问题后，我们才会意识到资源控制的重要性。

Kubernetes 部署过程如果没有能充分考虑到将来的扩展性，资源类问题将会非常常见，此类问题与集群的管理和部署团队的经验有关。

如果不加以合理控制，一个暴力的应用或者开发者可能影响到共享该集群的所有业务，大家可以因此相互埋怨、指责并保护性地抢占资源。这对于集群管理和开发人员都是非常难以处理的场景。

在 Kubernetes 环境中控制应用的计算资源使用有多种方式。大部分情况下，我们可以使用 resource quota 和 limit range。注意存储管理不在我们讨论范围之内，存储管理可以通过 Persistent Volume 插件，以实现针对不同的存储控制需求。

Resource quota 是一种控制 Kubernetes 计算资源的方法。本文告诉你如何使用 resource quota 来管理开发人员行为并控制应用的资源使用。

### 什么是 resource quota

[resource quotas][3] 通过 `ResourceQuota` object 来为每个 namespace 设置资源配额，对以下对象类型的 CPU 和内存进行限制

  * Pods
  * Services
  * Secrets
  * Persistent Volume Claims (PVCs)
  * ConfigMaps

Kubernetes 通过 request 和 limit 两个参数对 CPU 和内存进行限制（参考 [LimitRange][4] 文档）。前者表示容器最小被保证资源，后者表示容器最大可用资源。实际上最大可用资源还受限于其它容器的实际使用情况。

下一张图片解释 request 和 limit quota 的区别：

![Requests and limits in Kubernetes resource quotas][5]

(Michael Calizo, [CC BY-SA 4.0][6])

下面我们就通过一个例子来说明如何设置 resource quota，如何在 Kubernetes 的实现进行更好的资源控制。

### 准备环境

首先你需要一个 Kubernetes 环境。以下是我使用 Kubernetes 环境：

  * [Minikube][7] v1.14.2
  * Fedora 33 操作系统
  * 网络访问

如果你想在 Linux 机器上通过 Minikube 搭建 Kubernetes 测试环境，可以参考 Bryant Son [_Getting started with Minikube_][7] 一文。Window 或者 macOS 用户可以参考[这篇文章][8].

### 设置 resource quota

这里我们仅展示 CPU quota 设置步骤，配置内存 quota 与之类似。

在生产环境中，CPU 是最需要被控制的资源，尤其是在多应用的场景下特别需要注意防止某些应用消耗太多 CPU 而影响到其它应用。

首先我们创建一个 namespace


```bash
$ kubectl create namespace quota-test
namespace/quota-test created
```

准备 `cpu-quota.yaml` 文件，内容如下


```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: test-cpu-quota
spec:
  hard:
    requests.cpu: "100m"  
    limits.cpu: "200m"
```

应用 CPU quota 到 Kubernetes 集群：


```bash
$ kubectl apply -f cpu-qouta.yaml
resourcequota/test-cpu-quota created
```

使用 `kubectl describe` 检查 quota 配置情况：


```bash
$ kubectl describe resourcequota/test-cpu-quota --namespace quota-test
Name:         test-cpu-quota
Namespace:    quota-test
Resource      Used  Hard
--------      ----  ----
limits.cpu    0     200m
requests.cpu  0     100m
```

在 `Used resources` 列中显示了当前情况，该列值会随着 pod 的部署而变化。

下面是我们来验证 quota 管理的场景。我们将在 namespace 下部署三个的 pods，为它们配置以不同的资源限制如下：

  * **PodA:** 第一个被实例化，使用 50% 可用 CPU 资源
  * **PodB:** 第二个被实例化，使用其余 50% 可用 CPU 资源
  * **PodC:** 没有可用 CPU 资源，因此不会被部署

#### 部署 pods

**PodA:**


```bash
$ kubectl create -n quota-test -f- << EOF
apiVersion: v1
kind: Pod
metadata:
  name: poda
spec:
  containers:
  - name: quota-test
    image: busybox
    imagePullPolicy: IfNotPresent
    command: ['sh', '-c', 'echo Pod is Running ; sleep 5000']
    resources:
      requests:
        cpu: "50m"
      limits:
        cpu: "100m"
  restartPolicy: Never
EOF
```

部署 PodA 后，再次查看 quota 描述信息中的  `Used CPU` 信息


```bash
$ kubectl describe resourcequota/test-cpu-quota --namespace quota-test
Name:         test-cpu-quota
Namespace:    quota-test
Resource      Used  Hard
--------      ----  ----
limits.cpu    100m  200m
requests.cpu  50m   100m
```

**PodB:**


```bash
$ kubectl create -n quota-test -f- << EOF
apiVersion: v1
kind: Pod
metadata:
  name: podb
spec:
  containers:
  - name: quota-test
    image: busybox
    imagePullPolicy: IfNotPresent
    command: ['sh', '-c', 'echo Pod is Running ; sleep 5000']
    resources:
      requests:
        cpu: "50m"
      limits:
        cpu: "100m"
  restartPolicy: Never
EOF
```

再次查看 CPU 资源使用，此时 PodB 启动后 CPU limit 已经达到上限：


```bash
$ kubectl describe resourcequota/test-cpu-quota --namespace quota-test
Name:         test-cpu-quota
Namespace:    quota-test
Resource      Used  Hard
\--------      ----  ----
limits.cpu    200m  200m
requests.cpu  100m  100m
```

**PodC:**

试着创建 PodC，此时 CPU quota 已经被 PodA 和 PodB 用尽：


```bash
$ kubectl create -n quota-test -f- << EOF
apiVersion: v1
kind: Pod
metadata:
  name: podc
spec:
  containers:
  - name: quota-test
    image: busybox
    imagePullPolicy: IfNotPresent
    command: ['sh', '-c', 'echo Pod is Running ; sleep 5000']
    resources:
      requests:
        cpu: "5m"
      limits:
        cpu: "10m"
  restartPolicy: Never
EOF
```

正我们期望，第三个 Pod 无法被启动，quota 限制了Pod 的创建：


```
`Error from server (Forbidden): error when creating "STDIN": pods "podc" is forbidden: exceeded quota: test-cpu-quota, requested: limits.cpu=10m,requests.cpu=5m, used: limits.cpu=200m,requests.cpu=100m, limited: limits.cpu=200m,requests.cpu=100m`
```

如我们的例子所示，定义合理的 resource quota 限制开发者行为对 Kubernetes 管理十分重要。

### 清理

删除刚才创建的 namespace `quota-test`:


```bash
$ kubectl delete -n quota-test
```

### 规划 resource quota

Kubernetes 中提供多种方式来控制资源的抢占和使用，合理的规划和配置 quota、limit range 等参数对保持集群的稳定性十分必要。

你应该十分谨慎地控制计算资源的 resource quota，特别是在商业生产应用环境。

在规划 resource quota 时，开发人员的参与很重要，需要他们预估并给出最合理的资源使用值。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/kubernetes-resource-quotas

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[larryzju](https://github.com/larryzju)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mcalizo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_secret_ingredient_520x292.png?itok=QbKzJq-N "Jars with food inside on a shelf"
[2]: https://kubernetes.io/
[3]: https://kubernetes.io/docs/concepts/policy/resource-quotas
[4]: https://kubernetes.io/docs/concepts/policy/limit-range/
[5]: https://opensource.com/sites/default/files/uploads/resourcequota_requests-limits.png "Requests and limits in Kubernetes resource quotas"
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/article/18/10/getting-started-minikube
[8]: https://www.liquidweb.com/kb/how-to-install-minikube/
