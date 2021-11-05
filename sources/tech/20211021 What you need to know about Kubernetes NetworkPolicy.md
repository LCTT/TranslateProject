[#]: subject: "What you need to know about Kubernetes NetworkPolicy"
[#]: via: "https://opensource.com/article/21/10/kubernetes-networkpolicy"
[#]: author: "Mike Calizo https://opensource.com/users/mcalizo"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What you need to know about Kubernetes NetworkPolicy
======
Understanding Kubernetes NetworkPolicy is one of the fundamental
requirements to learn before deploying an application to Kubernetes.
![Parts, modules, containers for software][1]

With a growing number of cloud-native applications going to production through Kubernetes adoption, security is an important checkpoint that you must consider early in the process. When designing a cloud-native application, it is very important to embed a security strategy up front. Failure to do so leads to lingering security issues that can cause project delays and ultimately cost you unnecessary stress and money.

For years, people left security at the end—until their deployment was about to go into production. That practice causes delays on deliverables because each organization has security standards to adhere to, which are either bypassed or not followed with a lot of accepted risks to make the deliverables.

Understanding Kubernetes NetworkPolicy can be daunting for people just starting to learn the ins and outs of Kubernetes implementation. But this is one of the fundamental requirements that you must learn before deploying an application to your Kubernetes cluster. When learning Kubernetes and cloud-native application patterns, make your slogan "Don't leave security behind!"

### The NetworkPolicy concept

[NetworkPolicy][2] replaces firewall appliances in the data center context that you know—as pods to compute instances, network plugins to router and switches, and volumes to storage area network (SAN).

By default, the Kubernetes NetworkPolicy allows [pods][3] to receive traffic from anywhere. If you are not concerned about security for your pods, then that might be OK. But if you are running a critical workload, then you need to secure your pods. The way to control the traffic flow within the cluster (including ingress and egress traffic) is through NetworkPolicies.

To enable NetworkPolicy, you need a [network plugin][4] that supports NetworkPolicy. Otherwise, any rules you applied become useless.

There a different network plugins [listed on Kubernetes.io][4]:

  * CNI plugins: adhere to the [Container Network Interface][5] (CNI) specification, designed for interoperability.
    * Kubernetes follows the [v0.4.0][6] release of the CNI specification.
  * Kubernetes plugin: implements basic `cbr0` using the `bridge` and `host-local` CNI plugins.



### Applying a network policy

To apply a network policy, you need a working Kubernetes cluster with a network plugin that supports NetworkPolicy.

But first, you need to understand how to use NetworkPolicy in the context of Kubernetes. The Kubernetes NetworkPolicy allows [pods][3] to receive traffic from anywhere. This is not ideal. To secure the pods, you must understand the endpoints pods can communicate within the Kubernetes construct.

  1. Pod-to-pod communication using `podSelector`. 
```
 - namespaceSelector:
    matchLabels:
      project: myproject 
```
  2. Namespace-to-namespace communication and namespace-to-pod communication using `namespaceSelector` and/or a combination of `podSelector` and `namespaceSelector`. 
```
 - namespaceSelector:
    matchLabels:
      project: myproject
\- podSelector:
    matchLabels:
      role: frontend 
```
  3. IP blocks communication for pods using `ipBlock` to define which `IP CIDR` blocks dictate the source and destination. 
```
 - ipBlock:
        cidr: 172.17.0.0/16
        except:
        - 172.17.1.0/24 
```



Note the difference between pod, namespace, and IP-based policy. For pod and namespace-based NetworkPolicy, you use `selector` to control traffic, while for IP-based NetworkPolicy, controls get defined using `IP blocks` (CIDR ranges).

Putting it together, a NetworkPolicy should look like the following:


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

Referencing the NetworkPolicy above, notice the `spec` section. Under this section, `podSelector` with label _app=backend_ is the target of our NetworkPolicy. In short, the NetworkPolicy protects the application called _backend_ inside a given namespace.

This section also has `policyTypes` definition. This field indicates whether or not the given policy applies to ingress traffic to the selected pod, egress traffic from selected pods, or both.


```
spec:
  podSelector:
    matchLabels:
      app: backend
  policyTypes:
  - Ingress
  - Egress

```

Now, look at the `ingress` and `egress` section. This definition dictates the control of the NetworkPolicy.

First, examine the `ingress from` section.

The NetworkPolicy in this instance allows pod connection from:

  * `ipBlock`
    * Allow 172.17.0.0/16
    * Deny192.168.1.0/24
  * `namespaceSelector`
    * `myproject`: Allow all pods from this namespace and with the same labels _project=myproject_.
  * `podSelector`
    * `frontend`: Allow pods that match the label _role=frontend_




```
ingress:
\- from:
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

Now, examine the `egress to` section. This dictates the connection from the pod to:

  * `ipBlock`
    * 10.0.0.0/24: Connection to this CIDR is allowed
    * Ports: Allowed to connect using TCP and port 5978




```
egress:
\- to:
  - ipBlock:
      cidr: 10.0.0.0/24
  ports:
  - protocol: TCP
    port: 5978

```

## NetworkPolicy limitations

NetworkPolicy alone cannot totally secure your Kubernetes clusters. You can use either the operating system components or Layer 7 technologies to overcome the known limitations. You need to remember that NetworkPolicy can only address security for IP address and port level—Open Systems Interconnection (OSI) layer 3 or 4.

To address security requirements that NetworkPolicy can't handle, you need to use other security solutions. Here are some [use cases][7] that you need to know where NetworkPolicy needs augmentation by other technologies.

## Summary

Understanding Kubernetes NetworkPolicy is important because it's a way to fulfill (but not replace) the firewall role that you usually use in a datacenter setup, but for Kubernetes. Think of this as the first layer of your container security, knowing that NetworkPolicy alone is not a total security solution.

NetworkPolicy applies security on pod and namespace using selectors and labels. In addition, NetworkPolicy can also enforce security through IP ranges.

Having a sound understanding of NetworkPolicy is an important skill towards secure adoption of containerization in the Kubernetes context.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/kubernetes-networkpolicy

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
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
