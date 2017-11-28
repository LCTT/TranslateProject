Proxy Models in Container Environments
============================================================

### Most of us are familiar with how proxies work, but is it any different in a container-based environment? See what's changed.

Inline, side-arm, reverse, and forward. These used to be the terms we used to describe the architectural placement of proxies in the network.

Today, containers use some of the same terminology, but they are introducing new ones. That’s an opportunity for me to extemporaneously expound* on my favorite of all topics: the proxy.

One of the primary drivers of cloud (once we all got past the pipedream of cost containment) has been scalability. Scale has challenged agility (and sometimes won) in various surveys over the past five years as the number one benefit organizations seek by deploying apps in cloud computing environments.

That’s in part because in a digital economy (in which we now operate), apps have become the digital equivalent of brick-and-mortar “open/closed” signs and the manifestation of digital customer assistance. Slow, unresponsive apps have the same effect as turning out the lights or understaffing the store.

Apps need to be available and responsive to meet demand. Scale is the technical response to achieving that business goal. Cloud not only provides the ability to scale, but offers the ability to scale  _automatically_ . To do that requires a load balancer. Because that’s how we scale apps – with proxies that load balance traffic/requests.

Containers are no different with respect to expectations around scale. Containers must scale – and scale automatically – and that means the use of load balancers (proxies).

If you’re using native capabilities, you’re doing primitive load balancing based on TCP/UDP. Generally speaking, container-based proxy implementations aren’t fluent in HTTP or other application layer protocols and don’t offer capabilities beyond plain old load balancing ([POLB][1]). That’s often good enough, as container scale operates on a cloned, horizontal premise – to scale an app, add another copy and distribute requests across it. Layer 7 (HTTP) routing capabilities are found at the ingress (in [ingress controllers][2] and API gateways) and are used as much (or more) for app routing as they are to scale applications.

In some cases, however, this is not enough. If you want (or need) more application-centric scale or the ability to insert additional services, you’ll graduate to more robust offerings that can provide programmability or application-centric scalability or both.

To do that means [plugging-in proxies][3]. The container orchestration environment you’re working in largely determines the deployment model of the proxy in terms of whether it’s a reverse proxy or a forward proxy. Just to keep things interesting, there’s also a third model – sidecar – that is the foundation of scalability supported by emerging service mesh implementations.

### Reverse Proxy

 [![Image title](https://devcentral.f5.com/Portals/0/Users/038/38/38/unavailable_is_closed_thumb.png?ver=2017-09-12-082119-957 "Image title")][4] 

A reverse proxy is closest to a traditional model in which a virtual server accepts all incoming requests and distributes them across a pool (farm, cluster) of resources.

There is one proxy per ‘application’. Any client that wants to connect to the application is instead connected to the proxy, which then chooses and forwards the request to an appropriate instance. If the green app wants to communicate with the blue app, it sends a request to the blue proxy, which determines which of the two instances of the blue app should respond to the request.

In this model, the proxy is only concerned with the app it is managing. The blue proxy doesn’t care about the instances associated with the orange proxy, and vice-versa.

### Forward Proxy

 [![Image title](https://devcentral.f5.com/Portals/0/Users/038/38/38/per-node_forward_proxy_thumb.jpg?ver=2017-09-14-072422-213)][5] 

This mode more closely models that of a traditional outbound firewall.

In this model, each container **node** has an associated proxy. If a client wants to connect to a particular application or service, it is instead connected to the proxy local to the container node where the client is running. The proxy then chooses an appropriate instance of that application and forwards the client's request.

Both the orange and the blue app connect to the same proxy associated with its node. The proxy then determines which instance of the requested app instance should respond.

In this model, every proxy must know about every application to ensure it can forward requests to the appropriate instance.

### Sidecar Proxy

 [![Image title](https://devcentral.f5.com/Portals/0/Users/038/38/38/per-pod_sidecar_proxy_thumb.jpg?ver=2017-09-14-072425-620)][6] 

This mode is also referred to as a service mesh router. In this model, each **container **has its own proxy.

If a client wants to connect to an application, it instead connects to the sidecar proxy, which chooses an appropriate instance of that application and forwards the client's request. This behavior is the same as a  _forward proxy _ model.

The difference between a sidecar and forward proxy is that sidecar proxies do not need to modify the container orchestration environment. For example, in order to plug-in a forward proxy to k8s, you need both the proxy  _and _ a replacement for kube-proxy. Sidecar proxies do not require this modification because it is the app that automatically connects to its “sidecar” proxy instead of being routed through the proxy.

### Summary

Each model has its advantages and disadvantages. All three share a reliance on environmental data (telemetry and changes in configuration) as well as the need to integrate into the ecosystem. Some models are pre-determined by the environment you choose, so careful consideration as to future needs – service insertion, security, networking complexity – need to be evaluated before settling on a model.

We’re still in early days with respect to containers and their growth in the enterprise. As they continue to stretch into production environments it’s important to understand the needs of the applications delivered by containerized environments and how their proxy models differ in implementation.

*It was extemporaneous when I wrote it down. Now, not so much.


--------------------------------------------------------------------------------

via: https://dzone.com/articles/proxy-models-in-container-environments

作者：[Lori MacVittie ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://dzone.com/users/307701/lmacvittie.html
[1]:https://f5.com/about-us/blog/articles/go-beyond-polb-plain-old-load-balancing
[2]:https://f5.com/about-us/blog/articles/ingress-controllers-new-name-familiar-function-27388
[3]:http://clouddocs.f5.com/products/asp/v1.0/
[4]:https://devcentral.f5.com/Portals/0/Users/038/38/38/unavailable_is_closed.png?ver=2017-09-12-082118-160
[5]:https://devcentral.f5.com/Portals/0/Users/038/38/38/per-node_forward_proxy.jpg?ver=2017-09-14-072419-667
[6]:https://devcentral.f5.com/Portals/0/Users/038/38/38/per-pod_sidecar_proxy.jpg?ver=2017-09-14-072424-073
[7]:https://dzone.com/users/307701/lmacvittie.html
[8]:https://dzone.com/users/307701/lmacvittie.html
[9]:https://dzone.com/articles/proxy-models-in-container-environments#
[10]:https://dzone.com/cloud-computing-tutorials-tools-news
[11]:https://dzone.com/articles/proxy-models-in-container-environments#
[12]:https://dzone.com/go?i=243221&u=https%3A%2F%2Fget.platform9.com%2Fjzlp-kubernetes-deployment-models-the-ultimate-guide%2F
