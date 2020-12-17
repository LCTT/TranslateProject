[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use Kubernetes resource quotas)
[#]: via: (https://opensource.com/article/20/12/kubernetes-resource-quotas)
[#]: author: (Mike Calizo https://opensource.com/users/mcalizo)

How to use Kubernetes resource quotas
======
Resource quotas prevent resource contention and "land grabs" by
controlling how much CPU or memory an application can consume.
![Jars with food inside on a shelf][1]

"Control" is the word that comes to mind when someone mentions they need to manage Kubernetes compute resources, especially CPU and memory. These conversations generally happen after the [Kubernetes][2] platform has been deployed for a while and developers are using the cluster extensively. And most of the time, the topic comes up after a problem happens.

Resource issues are common when the Kubernetes implementation is deployed without consideration for the cluster's future growth. Issues may also be related to the team's experience level that deploys and manages the Kubernetes cluster.

Without controls, one rogue application or developer can disrupt business. This inadvertently happens when several developers share a cluster with a fixed number of nodes. These resource constraints can start disagreements, finger-pointing, and "land-grabbing" of available resources among developers. It's a very bad situation for cluster administrators and developers alike.

There are several ways to manage how applications utilize computing resources in the Kubernetes environment. Most of the time, resource quotas and limit ranges are enough. Note that in Kubernetes, storage management takes an unusual approach by using a Persistent Volume plugin where properties to address and control different storage requirements are defined.

Kubernetes resource quotas are a way to control how computing resources are used. This article will show you how to use this feature to manage developers' behavior and control application resource consumption.

### What are resource quotas?

In short, [resource quotas][3] provide constraints that limit resource consumption per namespace. They can be applied only at the namespace level, which means they can be applied to computing resources and limit the number of objects inside the namespace.

A Kubernetes resource quota is defined by a `ResourceQuota` object. When applied to a namespace, it can limit computing resources such as CPU and memory as well as the creation of the following objects:

  * Pods
  * Services
  * Secrets
  * Persistent Volume Claims (PVCs)
  * ConfigMaps



Kubernetes supports two types of CPU and memory quotas to manage compute resources. These are controlled via limits and requests, as the [LimitRange][4] documentation explains.

In short, a _request_ defines the guaranteed CPU or memory resources for containers, while a _limit_ is the memory or CPU threshold that a container can use, depending on what is available based on other containers' usage.

This image illustrates the difference between requests and limits in Kubernetes resource quotas.

![Requests and limits in Kubernetes resource quotas][5]

(Michael Calizo, [CC BY-SA 4.0][6])

The following exercise demonstrates how to use resource quotas to create constraints that limit an application to certain resources based on a defined threshold. It also shows the usefulness of implementing resource quotas to gain control over your Kubernetes implementation.

### Prerequisites

Before starting, make sure you have Kubernetes deployed in your local machine. Here is my configuration:

  * [Minikube][7] v1.14.2
  * Fedora 33 operating system
  * Internet access



If you need help deploying Minikube on your Linux laptop, you can follow the steps in Bryant Son's [_Getting started with Minikube_][7]. Or, if you're on Windows or macOS, you can follow [these steps][8].

### Set up a resource quota

This example creates a CPU quota, but the process is similar for a memory quota or a combination of the two.

In a real production scenario, CPU resources are usually at the top of the computing resources you need to manage to avoid resource contention. This is true whenever you have multiple applications running on top of your server (compute).

Start by creating a new namespace where you will apply your CPU quota:


```
$ kubectl create namespace quota-test
namespace/quota-test created
```

Create a file named `cpu-quota.yaml` and put the following quota (created for this demo) into it:


```
apiVersion: v1
kind: ResourceQuota
metadata:
  name: test-cpu-quota
spec:
  hard:
    requests.cpu: "100m"  
    limits.cpu: "200m"
```

Apply the quota to your Kubernetes cluster with:


```
$ kubectl apply -f cpu-qouta.yaml
resourcequota/test-cpu-quota created
```

Verify that the quota was applied with the `kubectl describe` command:


```
$ kubectl describe resourcequota/test-cpu-quota --namespace quota-test
Name:         test-cpu-quota
Namespace:    quota-test
Resource      Used  Hard
\--------      ----  ----
limits.cpu    0     200m
requests.cpu  0     100m
```

Notice the `Used resources` column; this value will change as you deploy pods.

Now that you've defined your quota, test it. For this example, deploy three different pods in the same namespace to see if you can control the resources' usage based on the limits you defined. The three pods are:

  * **PodA:** This pod, the first to be instantiated, will use 50% of the available CPU.
  * **PodB:** This pod will use the other 50% of the available CPU; it will be the second pod instantiated.
  * **PodC:** The defined quota should prevent this third pod from being deployed.



Now that you know the scenario, deploy the pods.

#### Deploy the pods

**PodA:**


```
$ kubectl create -n quota-test -f- &lt;&lt;EOF
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

Verify the CPU use by describing the quota again and noting the `Used CPU` value limits and requests:


```
$ kubectl describe resourcequota/test-cpu-quota --namespace quota-test
Name:         test-cpu-quota
Namespace:    quota-test
Resource      Used  Hard
\--------      ----  ----
limits.cpu    100m  200m
requests.cpu  50m   100m
```

**PodB:**


```
$ kubectl create -n quota-test -f- &lt;&lt;EOF
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

Check the CPU resource usage again. As expected, PodB can be scheduled because the quota allows it:


```
$ kubectl describe resourcequota/test-cpu-quota --namespace quota-test
Name:         test-cpu-quota
Namespace:    quota-test
Resource      Used  Hard
\--------      ----  ----
limits.cpu    200m  200m
requests.cpu  100m  100m
```

**PodC:**

Now, try to instantiate the third pod, even though you know PodA and Pod B maximized the CPU quota threshold you defined:


```
$ kubectl create -n quota-test -f- &lt;&lt;EOF
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

As expected, the third pod will not instantiate because the defined quota prevents creating the pods:


```
`Error from server (Forbidden): error when creating "STDIN": pods "podc" is forbidden: exceeded quota: test-cpu-quota, requested: limits.cpu=10m,requests.cpu=5m, used: limits.cpu=200m,requests.cpu=100m, limited: limits.cpu=200m,requests.cpu=100m`
```

As this example shows, properly defined resource quotas are a powerful tool that a Kubernetes admin can utilize to manage developer behavior.

### Clean up

Delete the namespace you created (in this case, `quota-test`):


```
`$ kubectl delete -n quota-test`
```

### Planning your quotas

There are many ways to control how users can deploy applications to avoid "land grabbing" in a Kubernetes cluster. Having a sound implementation of quotas, limit ranges, and other native features contributes to a cluster's stability.

Implementing resource quotas on computing resources is an important design decision that you need to think carefully about—especially when deploying Kubernetes for running business-critical enterprise applications.

When defining quotas, it's important to include developers in your planning. Because of their application knowledge, they are your best resources for estimating what's required.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/kubernetes-resource-quotas

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mcalizo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_secret_ingredient_520x292.png?itok=QbKzJq-N (Jars with food inside on a shelf)
[2]: https://kubernetes.io/
[3]: https://kubernetes.io/docs/concepts/policy/resource-quotas
[4]: https://kubernetes.io/docs/concepts/policy/limit-range/
[5]: https://opensource.com/sites/default/files/uploads/resourcequota_requests-limits.png (Requests and limits in Kubernetes resource quotas)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/article/18/10/getting-started-minikube
[8]: https://www.liquidweb.com/kb/how-to-install-minikube/
