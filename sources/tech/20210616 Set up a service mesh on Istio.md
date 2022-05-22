[#]: subject: (Set up a service mesh on Istio)
[#]: via: (https://opensource.com/article/21/6/service-mesh-serverless)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Set up a service mesh on Istio
======
A quick example of going serverless on Knative.
![Net catching 1s and 0s or data in the clouds][1]

Service mesh and serverless deployment models represent the next phase in the evolution of microservice architectures. Service mesh enables developers to focus on business feature development rather than managing non-functional microservices capabilities such as monitoring, tracing, fault tolerance, and service discovery.

[Open source service mesh][2] projects, including [Istio][3], [LinkerD][4], and [Kuma][5], use a sidecar, a dedicated infrastructure layer built right into an app, to implement service mesh functionalities. So, for example, developers can improve monitoring and tracing of cloud-native microservices on a distributed networking system using [Jaeger to build an Istio service mesh][6].

![CNCF Service Mesh Landscape][7]

CNCF Service Mesh Landscape (Source: [CNCF][2])

In this next phase of implementing service mesh in microservices, developers can advance their serverless development using an event-driven execution pattern. It's not just a brand-new method; it also tries to modernize business processes from 24x7x365 uptime to on-demand scaling. Developers can leverage the traits and benefits of serverless deployment by using one of the [open source serverless projects][8] shown below. For example, [Knative][9] is a faster, easier way to develop serverless applications on Kubernetes platforms.

![CNCF Serverless Landscape][10]

CNCF Serverless Landscape (Source: [CNCF][8])

Imagine combining service mesh and serverless for more advanced cloud-native microservices development and deployment. This combined architecture allows you to configure additional networking settings, such as custom domains, mutual Transport Layer Security (mTLS) certificates, and JSON Web Token authentication.

Here is a quick example of setting up service mesh on Istio with serverless on Knative Serving.

### 1\. Add Istio with sidecar injection

When you install the Istio service mesh, you need to set the `autoInject: enabled` configuration for automatic sidecar injection:


```
    global:
      proxy:
        autoInject: enabled
```

If you'd like to learn more, consult Knative's documentation about [installing Istio without and with sidecar injection][11].

### 2\. Enable a sidecar for mTLS networking

To use mTLS network communication between a `knative-serving` namespace and another namespace where you want the application pod to be running, enable a sidecar injection:


```
`$ kubectl label namespace knative-serving istio-injection=enabled`
```

You also need to configure `PeerAuthentication` in the `knative-serving namespace`:


```
cat &lt;&lt;EOF | kubectl apply -f -
apiVersion: "security.istio.io/v1beta1"
kind: "PeerAuthentication"
metadata:
  name: "default"
  namespace: "knative-serving"
spec:
  mtls:
    mode: PERMISSIVE
EOF
```

If you've installed a local gateway for Istio service mesh and Knative, the default cluster gateway name will be `knative-local-gateway` for the Knative service and application deployment.

### 3\. Deploy an application for a Knative service

Create a Knative service resource YAML file (e.g., `myservice.yml`) to enable sidecar injection for a Knative service.

Add the `sidecar.istio.io/inject="true"` annotation to the service resource:


```
apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  name: hello-example-1
spec:
  template:
    metadata:
      annotations:
        sidecar.istio.io/inject: "true" (1)
        sidecar.istio.io/rewriteAppHTTPProbers: "true" (2)
    spec:
      containers:
      - image: docker.io/sample_application (3)
        name: container
```

In the code above:

(1) Adds the sidecar injection annotation.
(2) Enables JSON Web Token (JWT) authentication.
(3) Replace the application image with yours in an external container registry (e.g., DockerHub, Quay.io).

Apply the Knative service resource above:


```
`$ kubectl apply -f myservice.yml`
```

Note: Be sure to log into the right namespace in the Kubernetes cluster to deploy the sample application.

### Conclusion

This article explained the benefits of service mesh and serverless deployment for the advanced cloud-native microservices architecture. You can evolve existing microservices to service mesh or serverless step-by-step, or you can combine them to handle more advanced application implementation with complex networking settings on Kubernetes. However, this combined architecture is still in an early stage due to the architecture's complexity and lack of use cases.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/service-mesh-serverless

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_analytics_cloud.png?itok=eE4uIoaB (Net catching 1s and 0s or data in the clouds)
[2]: https://landscape.cncf.io/card-mode?category=service-mesh&grouping=category
[3]: https://istio.io/docs/concepts/what-is-istio/
[4]: https://linkerd.io/
[5]: https://kuma.io/
[6]: https://opensource.com/article/19/3/getting-started-jaeger
[7]: https://opensource.com/sites/default/files/uploads/cncf-service-mesh-landscape.png (CNCF Service Mesh Landscape)
[8]: https://landscape.cncf.io/serverless?category=service-mesh&grouping=category&zoom=200
[9]: https://opensource.com/article/19/4/enabling-serverless-kubernetes
[10]: https://opensource.com/sites/default/files/uploads/cncf-serverless-landscape2.png (CNCF Serverless Landscape)
[11]: https://knative.dev/docs/install/installing-istio/#installing-istio-without-sidecar-injection
