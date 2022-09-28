[#]: subject: "Get started with Java serverless functions"
[#]: via: "https://opensource.com/article/21/6/java-serverless-functions"
[#]: author: "Daniel Oh https://opensource.com/users/daniel-oh"
[#]: collector: "lkxed"
[#]: translator: "cool-summer-021"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Get started with Java serverless functions
======
Quarkus allows you to develop serverless workloads with familiar Java technology.

![Tips and gears turning][1]

Image by: opensource.com

The [serverless Java][2] journey started out with functions—small snippets of code running on demand. This phase didn't last long. Although functions based on virtual machine architecture in the 1.0 phase made this paradigm very popular, as the graphic below shows, there were limits around execution time, protocols, and poor local-development experience.

Developers then realized that they could apply the same serverless traits and benefits to microservices and Linux containers. This launched the 1.5 phase, where some serverless containers completely abstracted [Kubernetes][3], delivering the serverless experience through [Knative][4] or another abstraction layer that sits on top of it.

In the 2.0 phase, serverless starts to handle more complex orchestration and integration patterns combined with some level of state management. More importantly, developers want to keep using a familiar application runtime, Java, to run a combination of serverless and non-serverless workloads in legacy systems.

![The serverless Java journey][5]

Before Java developers can start developing new serverless functions, their first task is to choose a new cloud-native Java framework that allows them to run Java functions quicker with a smaller memory footprint than traditional monolithic applications. This can be applied to various infrastructure environments, from physical servers to virtual machines to containers in multi- and hybrid-cloud environments.

Developers might consider an opinionated Spring framework that uses the `java.util.function` package in [Spring Cloud Function][6] to support the development of imperative and reactive functions. Spring also enables developers to deploy Java functions to installable serverless platforms such as [Kubeless][7], [Apache OpenWhisk][8], [Fission][9], and [Project Riff][10]. However, there are concerns about slow startup and response times and heavy memory-consuming processes with Spring. This problem can be worse when running Java functions on scalable container environments such as Kubernetes.

[Quarkus][11] is a new open source cloud-native Java framework that can help solve these problems. It aims to design serverless applications and write cloud-native microservices for running on cloud infrastructures (e.g., Kubernetes).

Quarkus rethinks Java, using a closed-world approach to building and running it. It has turned Java into a runtime that's comparable to Go. Quarkus also includes more than 100 extensions that integrate enterprise capabilities, including database access, serverless integration, messaging, security, observability, and business automation.

Here is a quick example of how developers can scaffold a Java serverless function project with Quarkus.

### 1. Create a Quarkus serverless Maven project

Developers have multiple options to install a local Kubernetes cluster, including [Minikube][12] and [OKD][13] (OpenShift Kubernetes Distribution). This tutorial uses an OKD cluster for a developer's local environment because of the easy setup of serverless functionality on Knative and DevOps toolings. These guides for [OKD installation][14] and [Knative operator installation][15] offer more information about setting them up.

The following command generates a Quarkus project (e.g., `quarkus-serverless-restapi` ) to expose a simple REST API and download a `quarkus-openshift` extension for Knative service deployment:

```
$ mvn io.quarkus:quarkus-maven-plugin:1.13.4.Final:create \
       -DprojectGroupId=org.acme \
       -DprojectArtifactId=quarkus-serverless-restapi \
       -Dextensions="openshift" \
       -DclassName="org.acme.getting.started.GreetingResource"
```

### 2. Run serverless functions locally

Run the application using Quarkus development mode to check if the REST API works, then tweak the code a bit:

```
$ ./mvnw quarkus:dev
```

The output will look like this:

```
__  ____  __  _____   ___  __ ____  ______ 
 --/ __ \/ / / / _ | / _ \/ //_/ / / / __/ 
 -/ /_/ / /_/ / __ |/ , _/ ,< / /_/ /\ \   
--\___\_\____/_/ |_/_/|_/_/|_|\____/___/   
INFO  [io.quarkus] (Quarkus Main Thread) quarkus-serverless-restapi 1.0.0-SNAPSHOT on JVM (powered by Quarkus xx.xx.xx.) started in 2.386s. Listening on: http://localhost:8080
INFO  [io.quarkus] (Quarkus Main Thread) Profile dev activated. Live Coding activated.
INFO  [io.quarkus] (Quarkus Main Thread) Installed features: [cdi, kubernetes, resteasy]
```

> **Note**: Keep your Quarkus application running to use Live Coding. This allows you to avoid having to rebuild, redeploy the application, and restart the runtime whenever the code changes.

Now you can hit the REST API with a quick `curl` command. The output should be `Hello RESTEasy` :

```
$ curl localhost:8080/hello
Hello RESTEasy
```

Tweak the return text in `GreetingResource.java` :

```
public String hello() {
        return "Quarkus Function on Kubernetes";
    }
```

You will see new output when you reinvoke the REST API:

```
$ curl localhost:8080/hello
Quarkus Function on Kubernetes
```

There's not been a big difference between normal microservices and serverless functions. A benefit of Quarkus is that it enables developers to use any microservice to deploy Kubernetes as a serverless function.

### 3. Deploy the functions to a Knative service

If you haven't already, [create a namespace][16] (e.g., `quarkus-serverless-restapi` ) on your OKD (Kubernetes) cluster to deploy this Java serverless function.

Quarkus enables developers to generate Knative and Kubernetes resources by adding the following variables in `src/main/resources/application.properties` :

```
quarkus.container-image.group=quarkus-serverless-restapi <1>
quarkus.container-image.registry=image-registry.openshift-image-registry.svc:5000 <2>
quarkus.kubernetes-client.trust-certs=true <3>
quarkus.kubernetes.deployment-target=knative <4>
quarkus.kubernetes.deploy=true <5>
quarkus.openshift.build-strategy=docker <6>
```

> Legend:

> <1> Define a project name where you deploy a serverless application
<2> The container registry to use
<3> Use self-signed certs in this simple example to trust them
<4> Enable the generation of Knative resources
<5> Instruct the extension to deploy to OpenShift after the container image is built
<6> Set the Docker build strategy

This command builds the application then deploys it directly to the OKD cluster:

```
$ ./mvnw clean package -DskipTests
```

> **Note:** Make sure to log in to the right project (e.g., `quarkus-serverless-restapi` ) by using the `oc login` command ahead of time.

The output should end with `BUILD SUCCESS`.

Add a Quarkus label to the Knative service with this `oc` command:

```
$ oc label rev/quarkus-serverless-restapi-00001 
app.openshift.io/runtime=quarkus --overwrite
```

Then access the OKD web console to go to the [Topology view in the Developer perspective][17]. You might see that your pod (serverless function) is already scaled down to zero (white-line circle).

![Topology view][18]

### 4. Test the functions on Kubernetes

Retrieve a route `URL` of the serverless function by running the following `oc` command:

```
$ oc get rt/quarkus-serverless-restapi
[...]
NAME                      URL                             READY   REASON
quarkus-serverless[...]   http://quarkus[...].SUBDOMAIN   True
```

Access the route `URL` with a `curl` command:

```
$ curl http://quarkus-serverless-restapi-quarkus-serverless-restapi.SUBDOMAIN/hello
```

In a few seconds, you will get the same result as you got locally:

```
Quarkus Function on Kubernetes
```

When you return to the Topology view in the OKD cluster, the Knative service scales up automatically.

![Scaling the Knative Function][19]

This Knative service pod will go down to zero again in 30 seconds because of Knative serving's default setting.

### What's next?

The serverless journey has evolved, starting with functions on virtual machines to serverless containers and integration with enterprise legacy systems. Along this journey, enterprise developers can still use familiar technologies like Java for developing serverless functions by using Quarkus to create a project then build and deploy it to Kubernetes with a Knative service.

The next article in this series will guide you on optimizing Java serverless functions in Kubernetes for faster startup time and small memory footprints at scale.

Image by: (Daniel Oh, CC BY-SA 4.0)

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/java-serverless-functions

作者：[Daniel Oh][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png
[2]: https://opensource.com/article/21/5/what-serverless-java
[3]: https://opensource.com/article/19/6/reasons-kubernetes
[4]: https://cloud.google.com/knative/
[5]: https://opensource.com/sites/default/files/uploads/serverless-journey.png
[6]: https://spring.io/serverless
[7]: https://kubeless.io/
[8]: https://openwhisk.apache.org/
[9]: https://fission.io/
[10]: https://projectriff.io/
[11]: https://quarkus.io/
[12]: https://minikube.sigs.k8s.io/docs/start/
[13]: https://docs.okd.io/latest/welcome/index.html
[14]: https://docs.okd.io/latest/installing/index.html
[15]: https://knative.dev/docs/install/knative-with-operators/
[16]: https://docs.okd.io/latest/applications/projects/configuring-project-creation.html
[17]: https://docs.okd.io/latest/applications/application_life_cycle_management/odc-viewing-application-composition-using-topology-view.html
[18]: https://opensource.com/sites/default/files/uploads/topologyview.png
[19]: https://opensource.com/sites/default/files/uploads/scale-up-knative-function.png
