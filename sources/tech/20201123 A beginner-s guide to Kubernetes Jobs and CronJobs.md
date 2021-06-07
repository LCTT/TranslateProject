[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A beginner's guide to Kubernetes Jobs and CronJobs)
[#]: via: (https://opensource.com/article/20/11/kubernetes-jobs-cronjobs)
[#]: author: (Mike Calizo https://opensource.com/users/mcalizo)

A beginner's guide to Kubernetes Jobs and CronJobs
======
Use Jobs and CronJobs to control and manage Kubernetes pods and
containers.
![Ships at sea on the web][1]

[Kubernetes][2] is the default orchestration engine for containers. Its options for controlling and managing pods and containers include:

  1. Deployments
  2. StatefulSets
  3. ReplicaSets



Each of these features has its own purpose, with the common function to ensure that pods run continuously. In failure scenarios, these controllers either restart or reschedule pods to ensure the services in the pods continue running.

As the [Kubernetes documentation explains][3], a Kubernetes Job creates one or more pods and ensures that a specified number of the pods terminates when the task (Job) completes.

Just like in a typical operating system, the ability to perform automated, scheduled jobs without user interaction is important in the Kubernetes world. But Kubernetes Jobs do more than just run automated jobs, and there are multiple ways to utilize them through:

  1. Jobs
  2. CronJobs
  3. Work queues (this is beyond the scope of this article)



Sounds simple right? Well, maybe. Anyone who works on containers and microservice applications knows that some require services to be transient so that they can do specific tasks for applications or within the Kubernetes clusters.

In this article, I will go into why Kubernetes Jobs are important, how to create Jobs and CronJobs, and when to use them for applications running on the Kubernetes cluster.

### Differences between Kubernetes Jobs and CronJobs

Kubernetes Jobs are used to create transient pods that perform specific tasks they are assigned to. [CronJobs][4] do the same thing, but they run tasks based on a defined schedule.

Jobs play an important role in Kubernetes, especially for running batch processes or important ad-hoc operations. Jobs differ from other Kubernetes controllers in that they run tasks until completion, rather than managing the desired state such as in Deployments, ReplicaSets, and StatefulSets.

### How to create Kubernetes Jobs and CronJobs

With that background in hand, you can start creating Jobs and CronJobs.

#### Prerequisites

To do this exercise, you need to have the following:

  1. A working Kubernetes cluster; you can install it with either:
    * [CentOS 8][5]
    * [Minikube][6]
  2. The [kubectl][7] Kubernetes command line



Here is the Minikube deployment I used for this demonstration:


```
$ minikube version
minikube version: v1.8.1

$ kubectl cluster-info
Kubernetes master is running at <https://172.17.0.59:8443>
KubeDNS is running at <https://172.17.0.59:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy>

$ kubectl get nodes
NAME       STATUS   ROLES    AGE   VERSION
minikube   Ready    master   88s   v1.17.3
```

#### Kubernetes Jobs

Just like anything else in the Kubernetes world, you can create Kubernetes Jobs with a definition file. Create a file called `sample-jobs.yaml` using your favorite editor.

Here is a snippet of the file that you can use to create an example Kubernetes Job:


```
apiVersion: batch/v1          ## The version of the Kubernetes API
kind: Job                     ## The type of object for jobs
metadata:
 name: job-test
spec:                        ## What state you desire for the object
 template:
   metadata:
     name: job-test
   spec:
     containers:
     - name: job
       image: busybox                  ##  Image used
       command: ["echo", "job-test"]   ##  Command used to create logs for verification later
     restartPolicy: OnFailure          ##  Restart Policy in case container failed
```

Next, apply the Jobs in the cluster:


```
`$ kubectl apply -f sample-jobs.yaml`
```

Wait a few minutes for the pods to be created. You can view the pod creation's status:


```
`$ kubectl get pod –watch`
```

After a few seconds, you should see your pod created successfully:


```
$ kubectl get pods
  NAME                  READY   STATUS          RESTARTS         AGE
  job-test                      0/1     Completed       0            11s
```

Once the pods are created, verify the Job's logs:


```
`$ kubectl logs job-test job-test`
```

You have created your first Kubernetes Job, and you can explore details about it:


```
`$ kubectl describe job job-test`
```

Clean up the Jobs:


```
`$ kubectl delete jobs job-test`
```

#### Kubernetes CronJobs

You can use CronJobs for cluster tasks that need to be executed on a predefined schedule. As the [documentation explains][8], they are useful for periodic and recurring tasks, like running backups, sending emails, or scheduling individual tasks for a specific time, such as when your cluster is likely to be idle.

As with Jobs, you can create CronJobs via a definition file. Following is a snippet of the CronJob file `cron-test.yaml`. Use this file to create an example CronJob:


```
apiVersion: batch/v1beta1            ## The version of the Kubernetes API
kind: CronJob                        ## The type of object for Cron jobs
metadata:
  name: cron-test
spec:
  schedule: "*/1 * * * *"            ## Defined schedule using the *nix style cron syntax
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: cron-test
            image: busybox            ## Image used
            args:
           - /bin/sh
            - -c
            - date; echo Hello this is Cron test
          restartPolicy: OnFailure    ##  Restart Policy in case container failed
```

Apply the CronJob to your cluster:


```
$ kubectl apply -f cron-test.yaml
 cronjob.batch/cron-test created
```

Verify that the CronJob was created with the schedule in the definition file:


```
$ kubectl get cronjob cron-test
 NAME        SCHEDULE      SUSPEND   ACTIVE   LAST SCHEDULE   AGE
 cron-test   */1 * * * *   False     0        &lt;none&gt;          10s
```

After a few seconds, you can find the pods that the last scheduled job created and view the standard output of one of the pods:


```
$ kubectl logs cron-test-1604870760
  Sun Nov  8 21:26:09 UTC 2020
  Hello from the Kubernetes cluster
```

You have created a Kubernetes CronJob that creates an object once per execution based on the schedule `schedule: "*/1 * * * *"`. Sometimes the creation can be missed because of environmental issues in the cluster. Therefore, they need to be [idempotent][9].

### Other things to know

Unlike deployments and services in Kubernetes, you can't change the same Job configuration file and reapply it at once. When you make changes in the Job configuration file, you must delete the previous Job from the cluster before you apply it.

Generally, creating a Job creates a single pod and performs the given task, as in the example above. But by using completions and [parallelism][10], you can initiate several pods, one after the other.

### Use your Jobs

You can use Kubernetes Jobs and CronJobs to manage your containerized applications. Jobs are important in Kubernetes application deployment patterns where you need a communication mechanism along with interactions between pods and the platforms. This may include cases where an application needs a "controller" or a "watcher" to complete tasks or needs to be scheduled to run periodically.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/kubernetes-jobs-cronjobs

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mcalizo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/kubernetes_containers_ship_lead.png?itok=9EUnSwci (Ships at sea on the web)
[2]: https://kubernetes.io/
[3]: https://kubernetes.io/docs/concepts/workloads/controllers/job/
[4]: https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/
[5]: https://phoenixnap.com/kb/how-to-install-kubernetes-on-centos
[6]: https://minikube.sigs.k8s.io/docs/start/
[7]: https://kubernetes.io/docs/reference/kubectl/kubectl/
[8]: https://v1-18.docs.kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/
[9]: https://en.wikipedia.org/wiki/Idempotence
[10]: https://kubernetes.io/docs/concepts/workloads/controllers/job/#parallel-jobs
