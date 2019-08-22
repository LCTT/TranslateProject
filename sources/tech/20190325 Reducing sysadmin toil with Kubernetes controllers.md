[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Reducing sysadmin toil with Kubernetes controllers)
[#]: via: (https://opensource.com/article/19/3/reducing-sysadmin-toil-kubernetes-controllers)
[#]: author: (Paul Czarkowski https://opensource.com/users/paulczar)

Reducing sysadmin toil with Kubernetes controllers
======

Controllers can ease a sysadmin's workload by handling things like creating and managing DNS addresses and SSL certificates.

![][1]

Kubernetes is a platform for reducing toil cunningly disguised as a platform for running containers. The element that allows for both running containers and reducing toil is the Kubernetes concept of a **Controller**.

Most resources in Kubernetes are managed by **kube-controller-manager** , or "controller" for short. A [controller][2] is defined as "a control loop that watches the shared state of a cluster … and makes changes attempting to move the current state toward the desired state." Think of it like this: A Kubernetes controller is to a microservice as a Chef recipe (or an Ansible playbook) is to a monolith.

Each Kubernetes resource is controlled by its own control loop. This is a step forward from previous systems like Chef or Puppet, which both have control loops at the server level, but not the resource level. A controller is a fairly simple piece of code that creates a control loop over a single resource to ensure the resource is behaving correctly. These control loops can stack together to create complex functionality with simple interfaces.

The canonical example of this in action is in how we manage Pods in Kubernetes. A Pod is effectively a running copy of an application that a specific worker node is asked to run. If that application crashes, the kubelet running on that node will start it again. However, if that node crashes, the Pod is not recovered, as the control loop (via the kubelet process) responsible for the resource no longer exists. To make applications more resilient, Kubernetes has the ReplicaSet controller.

The ReplicaSet controller is bundled inside the Kubernetes **controller-manager** , which runs on the Kubernetes master node and contains the controllers for these more advanced resources. The ReplicaSet controller is responsible for ensuring that a set number of copies of your application is always running. To do this, the ReplicaSet controller requests that a given number of Pods is created. It then routinely checks that the correct number of Pods is still running and will request more Pods or destroy existing Pods to do so.

By requesting a ReplicaSet from Kubernetes, you get a self-healing deployment of your application. You can further add lifecycle management to your workload by requesting [a Deployment][3], which is a controller that manages ReplicaSets and provides rolling upgrades by managing multiple versions of your application's ReplicaSets.

These controllers are great for managing Kubernetes resources and fantastic for managing resources outside of Kubernetes. The [Cloud Controller Manager][4] is a grouping of Kubernetes controllers that acts on resources external to Kubernetes, specifically resources that provide functionality to Kubernetes on the underlying cloud infrastructure. This is what drives Kubernetes' ability to do things like having a **LoadBalancer** [Service][5] type create and manage a cloud-specific load-balancer (e.g., an Elastic Load Balancer on AWS).

Furthermore, you can extend Kubernetes by writing a controller that watches for events and annotations and performs extra work, acting on Kubernetes resources or external resources that have some form of programmable API.

To review:

  * Controllers are a fundamental building block of Kubernetes' functionality.
  * A controller forms a control loop to ensure that the state of a given resource matches the requested state.
  * Kubernetes provides controllers via Controller Manager and Cloud Controller Manager processes that provide additional resilience and functionality.
  * The ReplicaSet controller adds resiliency to pods by ensuring the correct number of replicas is running.
  * A Deployment controller adds rolling upgrade capabilities to ReplicaSets.
  * You can extend Kubernetes' functionality by writing your own controllers.



### Controllers reduce sysadmin toil

Some of the most common tickets in a sysadmin's queue are for fairly simple tasks that should be automated, but for various reasons are not. For example, creating or updating a DNS record generally requires updating a [zone file][6], but one bad entry and you can take down your entire DNS infrastructure. Or how about those tickets that look like _[SYSAD-42214] Expired SSL Certificate - Production is down_?

[![DNS Haiku][7]][8]

DNS haiku, image by HasturHasturHamster

What if I told you that Kubernetes could manage these things for you by running some additional controllers?

Imagine a world where asking Kubernetes to run applications for you would automatically create and manage DNS addresses and SSL certificates. What a world we live in!

#### Example: External DNS controller

The **[external-dns][9]** controller is a perfect example of Kubernetes treating operations as a microservice. You configure it with your DNS provider, and it will watch resources including Services and Ingress controllers. When one of those resources changes, it will inspect them for annotations that will tell it when it needs to perform an action.

With the **external-dns** controller running in your cluster, you can add the following annotation to a service, and it will go out and create a matching [DNS A record][10] for that resource:
```
kubectl annotate service nginx \
"external-dns.alpha.kubernetes.io/hostname=nginx.example.org."
```
You can change other characteristics, such as the DNS record's TTL value:
```
kubectl annotate service nginx \
"external-dns.alpha.kubernetes.io/ttl=10"
```
Just like that, you now have automatic DNS management for your applications and services in Kubernetes that reacts to any changes in your cluster to ensure your DNS is correct.

#### Example: Certificate manager operator

Like the **external-dns** controller, the [**cert-manager**][11] will react to changes in resources, but it also comes with a custom resource definition (CRD) that will allow you to request certificates as a resource on their own, not just as a byproduct of an annotation.

**cert-manager** works with [Let's Encrypt][12] and other sources of certificates to request valid, signed Transport Layer Security (TLS) certificates. You can even use it in combination with **external-dns** , like in the following example, which registers **web.example.com** , retrieves a TLS certificate from Let's Encrypt, and stores it in a Secret.

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  annotations:
    certmanager.k8s.io/acme-http01-edit-in-place: "true"
    certmanager.k8s.io/cluster-issuer: letsencrypt-prod
    kubernetes.io/tls-acme: "true"
  name: example
spec:
  rules:
  - host: web.example.com
    http:
      paths:
      - backend:
          serviceName: example
          servicePort: 80
        path: /*
  tls:
  - hosts:
   - web.example.com
    secretName: example-tls
```

You can also request a certificate directly from the **cert-manager** CRD, like in the following example. As in the above, it will result in a certificate key pair stored in a Kubernetes Secret:
```
apiVersion: certmanager.k8s.io/v1alpha1
kind: Certificate
metadata:
  name: example-com
  namespace: default
spec:
  secretName: example-com-tls
  issuerRef:
    name: letsencrypt-staging
  commonName: example.com
  dnsNames:
 - www.example.com
  acme:
    config:
    - http01:
        ingressClass: nginx
      domains:
     - example.com
    - http01:
        ingress: my-ingress
      domains:
     - www.example.com
```

### Conclusion

This was a quick look at one way Kubernetes is helping enable a new wave of changes in how we operate software. This is one of my favorite topics, and I look forward to sharing more on [Opensource.com][14] and my [blog][15]. I'd also like to hear how you use controllers—message me on Twitter [@pczarkowski][16].

* * *

_This article is based on[Cloud Native Operations - Kubernetes Controllers][17] originally published on Paul Czarkowski's blog._


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/reducing-sysadmin-toil-kubernetes-controllers

作者：[Paul Czarkowski][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/paulczar
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_wheel_gear_devops_kubernetes.png?itok=xm4a74Kv
[2]: https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/
[3]: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
[4]: https://kubernetes.io/docs/tasks/administer-cluster/running-cloud-controller/
[5]: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types
[6]: https://en.wikipedia.org/wiki/Zone_file
[7]: https://opensource.com/sites/default/files/uploads/dns_haiku.png (DNS Haiku)
[8]: https://www.reddit.com/r/sysadmin/comments/4oj7pv/network_solutions_haiku/
[9]: https://github.com/kubernetes-incubator/external-dns
[10]: https://en.wikipedia.org/wiki/List_of_DNS_record_types#Resource_records
[11]: http://docs.cert-manager.io/en/latest/
[12]: https://letsencrypt.org/
[13]: http://www.example.com
[14]: http://Opensource.com
[15]: https://tech.paulcz.net/blog/
[16]: https://twitter.com/pczarkowski
[17]: https://tech.paulcz.net/blog/cloud-native-operations-k8s-controllers/
