[#]: subject: "What you need to know about Kubernetes NetworkPolicy"
[#]: via: "https://opensource.com/article/21/10/kubernetes-networkpolicy"
[#]: author: "Mike Calizo https://opensource.com/users/mcalizo"
[#]: collector: "lujun9972"
[#]: translator: " "
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

## The NetworkPolicy concept

[NetworkPolicy][2] replaces firewall appliances in the data center context that you know—as pods to compute instances, network plugins to router and switches, and volumes to storage area network (SAN).

By default, the Kubernetes NetworkPolicy allows [pods][3] to receive traffic from anywhere. If you are not concerned about security for your pods, then that might be OK. But if you are running a critical workload, then you need to secure your pods. The way to control the traffic flow within the cluster (including ingress and egress traffic) is through NetworkPolicies.

To enable NetworkPolicy, you need a [network plugin][4] that supports NetworkPolicy. Otherwise, any rules you applied become useless.

There a different network plugins [listed on Kubernetes.io][4]:

  * CNI plugins: adhere to the [Container Network Interface][5] (CNI) specification, designed for interoperability.
    * Kubernetes follows the [v0.4.0][6] release of the CNI specification.
  * Kubernetes plugin: implements basic `cbr0` using the `bridge` and `host-local` CNI plugins.



## Applying a network policy

To apply a network policy, you need a working Kubernetes cluster with a network plugin that supports NetworkPolicy.

But first, you need to understand how to use NetworkPolicy in the context of Kubernetes. The Kubernetes NetworkPolicy allows [pods][3] to receive traffic from anywhere. This is not ideal. To secure the pods, you must understand the endpoints pods can communicate within the Kubernetes construct.

  1. Pod-to-pod communication using `podSelector`. [code] - namespaceSelector:
    matchLabels:
      project: myproject 
```
  2. Namespace-to-namespace communication and namespace-to-pod communication using `namespaceSelector` and/or a combination of `podSelector` and `namespaceSelector`. [code] - namespaceSelector:
    matchLabels:
      project: myproject
\- podSelector:
    matchLabels:
      role: frontend
```
  3. IP blocks communication for pods using `ipBlock` to define which `IP CIDR` blocks dictate the source and destination. [code] - ipBlock:
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
          projec