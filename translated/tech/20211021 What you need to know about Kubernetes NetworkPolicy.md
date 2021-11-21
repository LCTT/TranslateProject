[#]: subject: "What you need to know about Kubernetes NetworkPolicy"
[#]: via: "https://opensource.com/article/21/10/kubernetes-networkpolicy"
[#]: author: "Mike Calizo https://opensource.com/users/mcalizo"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

你需要了解的关于 Kubernetes <ruby>网络策略<rt>NetworkPolicy</rt></ruby> 的信息
======
在你通过 Kubernetes 部署一个应用之前，了解 Kubernetes <ruby>网络策略<rt>NetworkPolicy</rt></ruby> 是一个基本的要求。
![Parts, modules, containers for software][1]

随着越来越多的云原生应用程序通过 Kubernetes 部署到生产环境，安全性是你必须在早期就需要考虑的一个重要检查项。在设计云原生应用程序时，预先嵌入安全策略非常重要。不这样做会导致后续的安全问题，从而导致项目延迟，并最终给你带来不必要的压力和金钱投入。

多年来，人们在最后还是没有实现安全--直到他们的部署即将发布到生产环境。这种做法会导致项目交付的延迟，因为每个组织都有要遵守的安全标准，这些标准要么被绕过，要么没有遵循许多公认的风险来交付项目。

对于刚开始学习 Kubernetes 实现的来龙去脉的人来说，了解 Kubernetes <ruby>网络策略<rt>NetworkPolicy</rt></ruby> 可能会令人生畏。但这是在将应用程序部署到 Kubernetes 集群之前必须了解的基本要求之一。在学习 Kubernetes 和云原生应用程序时，请记住“不要把安全抛在脑后！”。

### NetworkPolicy 概念

[NetworkPolicy][2] 取代了数据中心环境中的防火墙设备--作为计算实例的 Pod、路由器和交换机的网络插件以及存储区域网络（SAN）的卷。

默认情况下，Kubernetes NetworkPolicy 允许 [Pod][3] 从任何地方接收流量。如果你不担心 Pod 的安全性，那么这可能没问题。但是，如果你正在运行关键工作负载，则需要保护 Pod。控制集群内的流量（包括入口和出口流量），可以通过 NetworkPolicy 实现。

要启用网络策略，你需要一个支持网络策略的网络插件。否则，你应用的任何规则都将变得毫无用处。

[Kubernetes.io][4] 上列出了不同的网络插件：
  
  * CNI 插件：遵循[容器网络接口](5)（CNI）规范，旨在实现互操作性。 
    * Kubernetes 遵循 CNI 规范的 [v0.4.0][6] 版本。
  * Kubernetes 插件：使用桥接器和主机本地 CNI 插件实现基本的 `cbr0`。



### 应用网络策略

要应用网络策略，你需要一个具有支持 NetworkPolicy 的网络插件的工作 Kubernetes 集群。

但首先，你需要了解如何在 Kubernetes 的上下文中使用 NetworkPolicy。Kubernetes NetworkPolicy 允许 [Pod][3] 从任何地方接收流量。这并不是理想情况。为了 Pod 安全性，你必须了解 Pod 是可以在 Kubernetes 架构内进行通信的端点。

  1. 使用 `podSelector` 进行 Pod 到 Pod 的通信。 
```
 - namespaceSelector:
    matchLabels:
      project: myproject 
```
  2. 使用 `namespaceSelector` 和/或 `podSelector` 和 `namespaceSelector` 的组合进行命名空间到命名空间通信和命名空间到 Pod 通信。 
```
 - namespaceSelector:
    matchLabels:
      project: myproject
 - podSelector:
    matchLabels:
      role: frontend 
```
  3. IP 阻止 Pod 之间的通信使用 `ipBlock` ，通过定义 `IP CIDR` 来指定源和目的地。 
```
 - ipBlock:
        cidr: 172.17.0.0/16
        except:
        - 172.17.1.0/24 
```


请注意 Pod、命名空间和基于 IP 的策略之间的区别。对于基于 Pod 和命名空间的 NetworkPolicy，使用选择器来控制流量，而对基于 IP 的 NetworkPolicy，使用 `IP blocks`（CIDR 范围）定义控制。

把它们放在一起，一个 NetworkPolicy 应如下所示：

```
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: test-network-policy
  namespace: default
spec:
  podSelector:
    matchLabels:
      app: backend
  policyTypes:
  - Ingress
  - Egress
  ingress:
  - from:
    - ipBlock:
        cidr: 172.17.0.0/16
        except:
        - 192.168.1.0/24
    - namespaceSelector:
        matchLabels:
          project: myproject
    - podSelector:
        matchLabels:
          role: frontend
    ports:
    - protocol: TCP
      port: 6379
  egress:
  - to:
    - ipBlock:
        cidr: 10.0.0.0/24
    ports:
    - protocol: TCP
      port: 5978

```

参考上面的 NetworkPolicy，请注意 `spec` 部分。在此部分下，带有标签 app=backend 的 `podSelector` 是我们 NetworkPolicy 的目标。简而言之，NetworkPolicy 保护给定命名空间内称为后端的应用程序。

此部分也有 `policyTypes` 定义。此字段指示给定策略是否适用于选定 Pod 的入口流量、选定 Pod 的出口流量，或两者皆有。

```
spec:
  podSelector:
    matchLabels:
      app: backend
  policyTypes:
  - Ingress
  - Egress

```

现在，请看 `ingress` 和 `egress` 部分。该定义规定了 NetworkPolicy 的控制。

首先，检查 `ingress from` 部分。
此实例中，网络策略允许从以下位置进行 Pod 连接：

  * `ipBlock`
    * 允许 172.17.0.0/16
    * 拒绝 192.168.1.0/24
  * `namespaceSelector`
    * `myproject`: 允许来自此命名空间并具有相同标签 project=myproject 的所有 Pod。
  * `podSelector`
    * `frontend`: 允许与标签 role=frontend 匹配的 Pod。

```
ingress:
 - from:
  - ipBlock:
      cidr: 172.17.0.0/16
      except:
      - 192.168.1.0/24
  - namespaceSelector:
      matchLabels:
        project: myproject
  - podSelector:
      matchLabels:
        role: frontend

```

现在，检查 `egress to` 部分。这决定了从 pod 出去的连接：

  * `ipBlock`
    * 10.0.0.0/24: 允许连接到此 CIDR
    * Ports: 允许使用 TCP 和端口 5978 进行连接

```
egress:
 - to:
  - ipBlock:
      cidr: 10.0.0.0/24
  ports:
  - protocol: TCP
    port: 5978

```

## NetworkPolicy 限制

仅靠 NetworkPolicy 无法完全保护你的 Kubernetes 集群。你可以使用操作系统组件或 7 层网络技术来克服已知限制。你需要记住，NetworkPolicy 只能解决 IP 地址和端口级别的安全问题--即开放系统互联（OSI）中的第 3 层或第 4 层。

为了解决 NetworkPolicy 无法处理的安全要求，你需要使用其它安全解决方案。以下是一些你需要了解 NetworkPolicy 需要其它技术增强的[用例][7]。

## 总结

了解 Kubernetes NetworkPolicy 很重要，因为它是实现（但不是替代）你通常在数据中心设置中使用的防火墙角色的一种方式，但适用于 Kubernetes。将此视为容器安全的第一层，仅仅依靠 NetworkPolicy 并不是一个完整的安全解决方案。

NetworkPolicy 使用选择器和标签在 Pod 和命名空间上实现安全性。此外，NetworkPolicy 还可以通过 IP 范围强制实施安全性。

充分理解 NetworkPolicy 是在 Kubernetes 环境中安全采用容器化的一项重要技能。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/kubernetes-networkpolicy

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mcalizo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_modules_networking_hardware_parts.png?itok=rPpVj92- (Parts, modules, containers for software)
[2]: https://kubernetes.io/docs/concepts/services-networking/network-policies/
[3]: https://kubernetes.io/docs/concepts/workloads/pods/
[4]: https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/network-plugins/
[5]: https://github.com/containernetworking/cni
[6]: https://github.com/containernetworking/cni/blob/spec-v0.4.0/SPEC.md
[7]: https://kubernetes.io/docs/concepts/services-networking/network-policies/#what-you-can-t-do-with-network-policies-at-least-not-yet
