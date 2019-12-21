[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Kubernetes namespaces for beginners)
[#]: via: (https://opensource.com/article/19/12/kubernetes-namespaces)
[#]: author: (Jessica Cherry https://opensource.com/users/jrepka)

Kubernetes namespaces for beginners
======
What is a namespace and why do you need it?
![Ship captain sailing the Kubernetes seas][1]

What is in a Kubernetes namespace? As Shakespeare once wrote, which we call a namespace, by any other name, would still be a virtual cluster. By virtual cluster, I mean Kubernetes can offer multiple Kubernetes clusters on a single cluster, much like a virtual machine is an abstraction of its host. According to the [Kubernetes docs][2]:

> Kubernetes supports multiple virtual clusters backed by the same physical cluster. These virtual clusters are called namespaces.

Why do you need to use namespaces? In one word: isolation.

Isolation has many advantages, including that it supports secure and clean environments. If you are the owner of the infrastructure and are supporting developers, isolation is fairly important. The last thing you need is someone who is unfamiliar with how your cluster is built going and changing the system configuration—and possibly disabling everyone's ability to log in.

### The namespaces that start it all

The first three namespaces created in a cluster are always **default**, **kube-system**, and **kube-public**. While you can technically deploy within these namespaces, I recommend leaving these for system configuration and not for your projects. 

  * **Default** is for deployments that are not given a namespace, which is a quick way to create a mess that will be hard to clean up if you do too many deployments without the proper information. I leave this alone because it serves that one purpose and has confused me on more than one occasion.
  * **Kube-system** is for all things relating to, you guessed it, the Kubernetes system. Any deployments to this namespace are playing a dangerous game and can accidentally cause irreparable damage to the system itself. Yes, I have done it; I do not recommend it.
  * **Kube-public** is readable by everyone, but the namespace is reserved for system usage.



### Using namespaces for isolation

I have used namespaces for isolation in a couple of ways. I use them most often to split many users' projects into separate environments. This is useful in preventing cross-project contamination since namespaces provide independent environments. Users can install multiple versions of Jenkins, for example, and their environmental variables won't collide if they are in different namespaces.

This separation also helps with cleanup. If development groups are working on various projects that suddenly become obsolete, you can delete the namespace and remove everything in one swift movement with **kubectl delete ns &lt;$NAMESPACENAME&gt;**. (Please make sure it's the right namespace. I deleted the wrong one in production once, and it's not pretty.)

Be aware that this can cause damage across teams and problems for you if you are the infrastructure owner. For example, if you create a namespace with some special, extra-secure DNS functions and the wrong person deletes it, all of your pods and their running applications will be removed with the namespace. Any use of **delete** should be reviewed by a peer (through [GitOps][3]) before hitting the cluster.

While the official documentation suggests not using multiple namespaces [with 10 or fewer users][2], I still use them in my own cluster for architectural purposes. The cleaner the cluster, the better.

### What admins need to know about namespaces

For starters, namespaces cannot be nested in other namespaces. There can be only one namespace with deployments in it. You don't have to use namespaces for versioned projects, but you can always use the labels to separate versioned apps with the same name. Namespaces divide resources between users using resource quotas; for example, _this namespace can only have x_ _number_ _of nodes_. Finally, all namespaces scope down to a unique name for the resource type.

### Namespace commands in action

To try out the following namespace commands, you need to have [Minikube][4], [Helm][5], and the [kubectl][6] command line installed. For information about installing them, see my article [_Security scanning your DevOps pipeline_][7] or each project's homepage. I am using the most recent release of Minikube. The manual installation is fast and has consistently worked correctly the first time.

To get your first set of namespaces:


```
jess@Athena:~$ kubectl get namespace
NAME            STATUS   AGE
default         Active   5m23s
kube-public     Active   5m24s
kube-system     Active   5m24s
```

To create a namespace:


```
jess@Athena:~$ kubectl create namespace athena
namespace/athena created
```

Now developers can deploy to the namespace you created; for example, here's a small and easy Helm chart:


```
jess@Athena:~$ helm install teset-deploy stable/redis --namespace athena
NAME: teset-deploy
LAST DEPLOYED: Sat Nov 23 13:47:43 2019
NAMESPACE: athena
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
** Please be patient while the chart is being deployed **
Redis can be accessed via port 6379 on the following DNS names from within your cluster:

teset-deploy-redis-master.athena.svc.cluster.local for read/write operations
teset-deploy-redis-slave.athena.svc.cluster.local for read-only operations
```

To get your password:


```
`export REDIS_PASSWORD=$(kubectl get secret --namespace athena teset-deploy-redis -o jsonpath="{.data.redis-password}" | base64 --decode)`
```

To connect to your Redis server:

  1. Run a Redis pod that you can use as a client: [code] kubectl run --namespace athena teset-deploy-redis-client --rm --tty -i --restart='Never' \
        --env REDIS_PASSWORD=$REDIS_PASSWORD \
\--image docker.io/bitnami/redis:5.0.7-debian-9-r0 -- bash 
```
  2. Connect using the Redis CLI: [code] redis-cli -h teset-deploy-redis-master -a $REDIS_PASSWORD
redis-cli -h teset-deploy-redis-slave -a $REDIS_PASSWORD
```



To connect to your database from outside the cluster:


```
kubectl port-forward --namespace athena svc/teset-deploy-redis-master 6379:6379 &amp;
redis-cli -h 127.0.0.1 -p 6379 -a $REDIS_PASSWORD
```

Now that this deployment is out, you have a chart deployed in your namespace named **test-deploy**.

To look at what pods are in your namespace:


```
jess@Athena:~$ kubectl get pods --namespace athena
NAME                            READY   STATUS  RESTARTS   AGE
teset-deploy-redis-master-0   1/1       Running   0             2m38s
teset-deploy-redis-slave-0      1/1     Running   0             2m38s
teset-deploy-redis-slave-1      1/1     Running   0             90s
```

At this point, you have officially isolated your application to a single namespace and created one virtual cluster that talks internally only to itself.

Delete everything with a single command:


```
jess@Athena:~$ kubectl delete namespace athena
namespace "athena" deleted
```

Because this deletes the application's entire internal configuration, the delete may take some time, depending on how large your deployment is.

Double-check that everything has been removed:


```
jess@Athena:~$ kubectl get pods --all-namespaces
NAMESPACE       NAME                            READY   STATUS  RESTARTS   AGE
kube-system   coredns-5644d7b6d9-4vxv6          1/1     Running   0             32m
kube-system   coredns-5644d7b6d9-t5wn7          1/1     Running   0             32m
kube-system   etcd-minikube                     1/1     Running   0             31m
kube-system   kube-addon-manager-minikube       1/1     Running   0             32m
kube-system   kube-apiserver-minikube           1/1     Running   0             31m
kube-system   kube-controller-manager-minikube  1/1     Running   0             31m
kube-system   kube-proxy-5tdmh                  1/1     Running   0             32m
kube-system   kube-scheduler-minikube           1/1     Running   0             31m
kube-system   storage-provisioner               1/1     Running   0             27m
```

This is a list of all the pods and all the known namespaces where they live. As you can see, the application and namespace you previously made are now gone.

### Namespaces in practice

I currently use namespaces for security purposes, including reducing the privileges of users with limitations. You can limit everything—from which roles can access a namespace to their quota levels for cluster resources, like CPUs. For example, I use resource quotas and role-based access control (RBAC) configurations to confirm that a namespace is accessible only by the appropriate service accounts.

On the isolation side of security, I don't want my home Jenkins application to be accessible over a trusted local network as secure images that have public IP addresses (and thus, I have to assume, could be compromised).

Namespaces can also be helpful for budgeting purposes if you have a hard budget on how much you can use in your cloud platform for nodes (or, in my case, how much I can deploy before [segfaulting][8] my home server). Although this is out of scope for this article, and it's complicated, it is worth researching and taking advantage of to prevent overextending your cluster.

### Conclusion

Namespaces are a great way to isolate projects and applications. This is just a quick introduction to the topic, so I encourage you to do more advanced research on namespaces and use them more in your work.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/kubernetes-namespaces

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jrepka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
[3]: https://www.weave.works/blog/gitops-operations-by-pull-request
[4]: https://kubernetes.io/docs/tasks/tools/install-minikube/
[5]: https://helm.sh/
[6]: https://kubernetes.io/docs/tasks/tools/install-kubectl/
[7]: https://opensource.com/article/19/7/security-scanning-your-devops-pipeline
[8]: https://en.wikipedia.org/wiki/Segmentation_fault
