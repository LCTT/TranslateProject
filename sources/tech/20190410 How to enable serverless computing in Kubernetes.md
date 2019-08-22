[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to enable serverless computing in Kubernetes)
[#]: via: (https://opensource.com/article/19/4/enabling-serverless-kubernetes)
[#]: author: (Daniel Oh  https://opensource.com/users/daniel-oh/users/daniel-oh)

How to enable serverless computing in Kubernetes
======
Knative is a faster, easier way to develop serverless applications on
Kubernetes platforms.
![Kubernetes][1]

In the first two articles in this series about using serverless on an open source platform, I described [how to get started with serverless platforms][2] and [how to write functions][3] in popular languages and build components using containers on Apache OpenWhisk.

Here in the third article, I'll walk you through enabling serverless in your [Kubernetes][4] environment. Kubernetes is the most popular platform to manage serverless workloads and microservice application containers and uses a finely grained deployment model to process workloads more quickly and easily.

Keep in mind that serverless not only helps you reduce infrastructure management while utilizing a consumption model for actual service use but also provides many capabilities of what the cloud platform serves. There are many serverless or FaaS (Function as a Service) platforms, but Kuberenetes is the first-class citizen for building a serverless platform because there are more than [13 serverless or FaaS open source projects][5] based on Kubernetes.

However, Kubernetes won't allow you to build, serve, and manage app containers for your serverless workloads in a native way. For example, if you want to build a [CI/CD pipeline][6] on Kubernetes to build, test, and deploy cloud-native apps from source code, you need to use your own release management tool and integrate it with Kubernetes.

Likewise, it's difficult to use Kubernetes in combination with serverless computing unless you use an independent serverless or FaaS platform built on Kubernetes, such as [Apache OpenWhisk][7], [Riff][8], or [Kubeless][9]. More importantly, the Kubernetes environment is still difficult for developers to learn the features of how it deals with serverless workloads from cloud-native apps.

### Knative

[Knative][10] was born for developers to create serverless experiences natively without depending on extra serverless or FaaS frameworks and many custom tools. Knative has three primary components—[Build][11], [Serving][12], and [Eventing][13]—for addressing common patterns and best practices for developing serverless applications on Kubernetes platforms.

To learn more, let's go through the usual development process for using Knative to increase productivity and solve Kubernetes' difficulties from the developer's point of view.

**Step 1:** Generate your cloud-native application from scratch using [Spring Initializr][14] or [Thorntail Project Generator][15]. Begin implementing your business logic using the [12-factor app methodology][16], and you might also do assembly testing to see if the function works correctly in many local testing tools.

![Spring Initializr screenshot][17] | ![Thorntail Project Generator screenshot][18]
---|---

**Step 2:** Build container images from your source code repositories via the Knative Build component. You can define multiple steps, such as installing dependencies, running integration testing, and pushing container images to your secured image registry for using existing Kubernetes primitives. More importantly, Knative Build makes developers' daily work easier and simpler—"boring but difficult." Here's an example of the Build YAML:


```
apiVersion: build.knative.dev/v1alpha1
kind: Build
metadata:
name: docker-build
spec:
serviceAccountName: build-bot
source:
git:
revision: master
url: <https://github.com/redhat-developer-demos/knative-tutorial-event-greeter.git>
steps:
\- args:
\- --context=/workspace/java/springboot
\- --dockerfile=/workspace/java/springboot/Dockerfile
\- --destination=docker.io/demo/event-greeter:0.0.1
env:
\- name: DOCKER_CONFIG
value: /builder/home/.docker
image: gcr.io/kaniko-project/executor
name: docker-push
```

**Step 3:** Deploy and serve your container applications as serverless workloads via the Knative Serving component. This step shows the beauty of Knative in terms of automatically scaling up your serverless containers on Kubernetes then scaling them down to zero if there is no request to the containers for a specific period (e.g., two minutes). More importantly, [Istio][19] will automatically address ingress and egress networking traffic of serverless workloads in multiple, secure ways. Here's an example of the Serving YAML:


```
apiVersion: serving.knative.dev/v1alpha1
kind: Service
metadata:
name: greeter
spec:
runLatest:
configuration:
revisionTemplate:
spec:
container:
image: dev.local/rhdevelopers/greeter:0.0.1
```

**Step 4:** Bind running serverless containers to a variety of eventing platforms, such as SaaS, FaaS, and Kubernetes, via Knative's Eventing component. In this step, you can define event channels and subscriptions, which are delivered to your services via a messaging platform such as [Apache Kafka][20] or [NATS streaming][21]. Here's an example of the Event sourcing YAML:


```
apiVersion: sources.eventing.knative.dev/v1alpha1
kind: CronJobSource
metadata:
name: test-cronjob-source
spec:
schedule: "* * * * *"
data: '{"message": "Event sourcing!!!!"}'
sink:
apiVersion: eventing.knative.dev/v1alpha1
kind: Channel
name: ch-event-greeter
```

### Conclusion

Developing with Knative will save a lot of time in building serverless applications in the Kubernetes environment. It can also make developers' jobs easier by focusing on developing serverless applications, functions, or cloud-native containers.

* * *

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/enabling-serverless-kubernetes

作者：[Daniel Oh (Red Hat, Community Moderator)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/kubernetes.png?itok=PqDGb6W7 (Kubernetes)
[2]: https://opensource.com/article/18/11/open-source-serverless-platforms
[3]: https://opensource.com/article/18/11/developing-functions-service-apache-openwhisk
[4]: https://kubernetes.io/
[5]: https://landscape.cncf.io/format=serverless
[6]: https://opensource.com/article/18/8/what-cicd
[7]: https://openwhisk.apache.org/
[8]: https://projectriff.io/
[9]: https://kubeless.io/
[10]: https://cloud.google.com/knative/
[11]: https://github.com/knative/build
[12]: https://github.com/knative/serving
[13]: https://github.com/knative/eventing
[14]: https://start.spring.io/
[15]: https://thorntail.io/generator/
[16]: https://12factor.net/
[17]: https://opensource.com/sites/default/files/uploads/spring_300.png (Spring Initializr screenshot)
[18]: https://opensource.com/sites/default/files/uploads/springboot_300.png (Thorntail Project Generator screenshot)
[19]: https://istio.io/
[20]: https://kafka.apache.org/
[21]: https://nats.io/
