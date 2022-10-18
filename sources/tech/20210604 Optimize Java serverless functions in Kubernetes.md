[#]: subject: (Optimize Java serverless functions in Kubernetes)
[#]: via: (https://opensource.com/article/21/6/java-serverless-functions-kubernetes)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)
[#]: collector: (lujun9972)
[#]: translator: (cool-summer-021)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Optimize Java serverless functions in Kubernetes
======
Achieve faster startup and a smaller memory footprint to run serverless
functions on Kubernetes.
![Ship captain sailing the Kubernetes seas][1]

A faster startup and smaller memory footprint always matter in [Kubernetes][2] due to the expense of running thousands of application pods and the cost savings of doing it with fewer worker nodes and other resources. Memory is more important than throughput on containerized microservices on Kubernetes because:

  * It's more expensive due to permanence (unlike CPU cycles)
  * Microservices multiply the overhead cost
  * One monolith application becomes _N_ microservices (e.g., 20 microservices ≈ 20GB)



This significantly impacts serverless function development and the Java deployment model. This is because many enterprise developers chose alternatives such as Go, Python, and Nodejs to overcome the performance bottleneck—until now, thanks to [Quarkus][3], a new Kubernetes-native Java stack. This article explains how to optimize Java performance to run serverless functions on Kubernetes using Quarkus.

### Container-first design

Traditional frameworks in the Java ecosystem come at a cost in terms of the memory and startup time required to initialize those frameworks, including configuration processing, classpath scanning, class loading, annotation processing, and building a metamodel of the world, which the framework requires to operate. This is multiplied over and over for different frameworks.

Quarkus helps fix these Java performance issues by "shifting left" almost all of the overhead to the build phase. By doing code and framework analysis, bytecode transformation, and dynamic metamodel generation only once, at build time, you end up with a highly optimized runtime executable that starts up super fast and doesn't require all the memory of a traditional startup because the work is done once, in the build phase.

![Quarkus Build phase][4]

(Daniel Oh, [CC BY-SA 4.0][5])

More importantly, Quarkus allows you to build a native executable file that provides [performance advantages][6], including amazingly fast boot time and incredibly small resident set size (RSS) memory, for instant scale-up and high-density memory utilization compared to the traditional cloud-native Java stack.

![Quarkus RSS and Boot Time Metrics][7]

(Daniel Oh, [CC BY-SA 4.0][5])

Here is a quick example of how you can build the native executable with a [Java serverless][8] function project using Quarkus.

### 1\. Create the Quarkus serverless Maven project

This command generates a Quarkus project (e.g., `quarkus-serverless-native`) to create a simple function:


```
$ mvn io.quarkus:quarkus-maven-plugin:1.13.4.Final:create \
       -DprojectGroupId=org.acme \
       -DprojectArtifactId=quarkus-serverless-native \
       -DclassName="org.acme.getting.started.GreetingResource"
```

### 2\. Build a native executable

You need a GraalVM to build a native executable for the Java application. You can choose any GraalVM distribution, such as [Oracle GraalVM Community Edition (CE)][9] and [Mandrel][10] (the downstream distribution of Oracle GraalVM CE). Mandrel is designed to support building Quarkus-native executables on OpenJDK 11.

Open `pom.xml`, and you will find this `native` profile. You'll use it to build a native executable:


```
&lt;profiles&gt;
    &lt;profile&gt;
        &lt;id&gt;native&lt;/id&gt;
        &lt;properties&gt;
            &lt;quarkus.package.type&gt;native&lt;/quarkus.package.type&gt;
        &lt;/properties&gt;
    &lt;/profile&gt;
&lt;/profiles&gt;
```

> **Note:** You can install the GraalVM or Mandrel distribution locally. You can also download the Mandrel container image to build it (as I did), so you need to run a container engine (e.g., Docker) locally.

Assuming you have started your container runtime already, run one of the following Maven commands.

For [Docker][11]:


```
$ ./mvnw package -Pnative \
-Dquarkus.native.container-build=true \
-Dquarkus.native.container-runtime=docker
```

For [Podman][12]:


```
$ ./mvnw package -Pnative \
-Dquarkus.native.container-build=true \
-Dquarkus.native.container-runtime=podman
```

The output should end with `BUILD SUCCESS`.

![Native Build Logs][13]

(Daniel Oh, [CC BY-SA 4.0][5])

Run the native executable directly without Java Virtual Machine (JVM):


```
`$ target/quarkus-serverless-native-1.0.0-SNAPSHOT-runner`
```

The output will look like:


```
__  ____  __  _____   ___  __ ____  ______
 --/ __ \/ / / / _ | / _ \/ //_/ / / / __/
 -/ /_/ / /_/ / __ |/ , _/ ,&lt; / /_/ /\ \  
\--\\___\\_\\____/_/ |_/_/|_/_/|_|\\____/___/  
INFO  [io.quarkus] (main) quarkus-serverless-native 1.0.0-SNAPSHOT native
(powered by Quarkus xx.xx.xx.) Started in 0.019s. Listening on: <http://0.0.0.0:8080>
INFO [io.quarkus] (main) Profile prod activated.
INFO [io.quarkus] (main) Installed features: [cdi, kubernetes, resteasy]
```

Supersonic! That's _19_ _milliseconds_ to startup. The time might be different in your environment.

It also has extremely low memory usage, as the Linux `ps` utility reports. While the app is running, run this command in another terminal:


```
`$ ps -o pid,rss,command -p $(pgrep -f runner)`
```

You should see something like:


```
  PID    RSS COMMAND
10246  11360 target/quarkus-serverless-native-1.0.0-SNAPSHOT-runner
```

This process is using around _11MB_ of memory (RSS). Pretty compact!

> **Note:** The RSS and memory usage of any app, including Quarkus, will vary depending on your specific environment and will rise as application experiences load.

You can also access the function with a REST API. Then the output should be `Hello RESTEasy`:


```
$ curl localhost:8080/hello
Hello RESTEasy
```

### 3\. Deploy the functions to Knative service

If you haven't already, [create a namespace][14] (e.g., `quarkus-serverless-native`) on [OKD][15] (OpenShift Kubernetes Distribution) to deploy this native executable as a serverless function. Then add a `quarkus-openshift` extension for Knative service deployment:


```
`$ ./mvnw -q quarkus:add-extension -Dextensions="openshift"`
```

Append the following variables in `src/main/resources/application.properties` to configure Knative and Kubernetes resources:


```
quarkus.container-image.group=quarkus-serverless-native
quarkus.container-image.registry=image-registry.openshift-image-registry.svc:5000
quarkus.native.container-build=true
quarkus.kubernetes-client.trust-certs=true
quarkus.kubernetes.deployment-target=knative
quarkus.kubernetes.deploy=true
quarkus.openshift.build-strategy=docker
```

Build the native executable, then deploy it to the OKD cluster directly:


```
`$ ./mvnw clean package -Pnative`
```

> **Note:** Make sure to log in to the right project (e.g., `quarkus-serverless-native`) using the `oc login` command ahead of time.

The output should end with `BUILD SUCCESS`. It will take a few minutes to complete a native binary build and deploy a new Knative service. After successfully creating the service, you should see a Knative service (KSVC) and revision (REV) using either the `kubectl` or `oc` command tool:


```
$ kubectl get ksvc
NAME                        URL   [...]
quarkus-serverless-native   <http://quarkus-serverless-native-\[...\].SUBDOMAIN>  True

$ kubectl get rev
NAME                              CONFIG NAME                 K8S SERVICE NAME                  GENERATION   READY   REASON
quarkus-serverless-native-00001   quarkus-serverless-native   quarkus-serverless-native-00001   1            True
```

### 4\. Access the native executable function

Retrieve the serverless function's endpoint by running this `kubectl` command:


```
`$ kubectl get rt/quarkus-serverless-native`
```

The output should look like:


```
NAME                         URL                                                                                                          READY   REASON
quarkus-serverless-native   <http://quarkus-serverless-restapi-quarkus-serverless-native.SUBDOMAIN>   True
```

Access the route `URL` with a `curl` command:


```
`$ curl http://quarkus-serverless-restapi-quarkus-serverless-native.SUBDOMAIN/hello`
```

In less than one second, you will get the same result as you got locally:


```
`Hello RESTEasy`
```

When you access the Quarkus running pod's logs in the OKD cluster, you will see the native executable is running as the Knative service.

![Native Quarkus Log][16]

(Daniel Oh, [CC BY-SA 4.0][5])

### What's next?

You can optimize Java serverless functions with GraalVM distributions to deploy them as serverless functions on Knative with Kubernetes. Quarkus enables this performance optimization using simple configurations in normal microservices.

The next article in this series will guide you on making portable functions across multiple serverless platforms with no code changes.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/java-serverless-functions-kubernetes

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://opensource.com/article/19/6/reasons-kubernetes
[3]: https://quarkus.io/
[4]: https://opensource.com/sites/default/files/uploads/quarkus-build.png (Quarkus Build phase)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://quarkus.io/blog/runtime-performance/
[7]: https://opensource.com/sites/default/files/uploads/quarkus-boot-metrics.png (Quarkus RSS and Boot Time Metrics)
[8]: https://opensource.com/article/21/5/what-serverless-java
[9]: https://www.graalvm.org/community/
[10]: https://github.com/graalvm/mandrel
[11]: https://www.docker.com/
[12]: https://podman.io/
[13]: https://opensource.com/sites/default/files/uploads/native-build-logs.png (Native Build Logs)
[14]: https://docs.okd.io/latest/applications/projects/configuring-project-creation.html
[15]: https://docs.okd.io/latest/welcome/index.html
[16]: https://opensource.com/sites/default/files/uploads/native-quarkus-log.png (Native Quarkus Log)
