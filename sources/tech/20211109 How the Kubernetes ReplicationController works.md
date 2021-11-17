[#]: subject: "How the Kubernetes ReplicationController works"
[#]: via: "https://opensource.com/article/21/11/kubernetes-replicationcontroller"
[#]: author: "Mike Calizo https://opensource.com/users/mcalizo"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How the Kubernetes ReplicationController works
======
A ReplicationController is responsible for managing the pod lifecycle
and ensuring that the specified number of pods required are running at
any given time.
![Ships at sea on the web][1]

Have you ever wondered what is responsible for supervising and managing just the exact number of pods running inside the Kubernetes cluster? Kubernetes can do this in multiple ways, but one common approach is using ReplicationController (rc). A ReplicationController is responsible for managing the pod lifecycle and ensuring that the specified number of pods required are running at any given time. On the other hand, it is not responsible for the advanced cluster capabilities like performing auto-scaling, readiness and liveliness probes, and other advanced replication capabilities. Other components within the Kubernetes cluster better perform those capabilities.

In short, the ReplicationController has limited responsibility and gets typically used for specific implementations that do not require complex logic to attain certain requirements (for example, ensuring that the desired number of pods always matches the specified number). If there are more than the desired number, the ReplicationController removes the excess ones and ensures the same number of pods exist even in the event of node failure or pod termination

Simple things do not require complex solutions, and this is, for me, a perfect metaphor of how a ReplicationController gets used.

### How to Create a ReplicationController

Like most Kubernetes resources, you can create a ReplicationController using YAML or JSON format then post it to the Kubernetes API endpoint.


```


$ kubectl create -f rcexample.yaml
  replicationcontroller/rcexample created

```

Now, I'll dig a bit deeper into what `rcexample.yaml` looks like. 


```


apiVersion: v1
kind: ReplicationController   → rc descriptor    
metadata:
 name: rcexample            → Name of the replication controller              
spec:
 replicas: 3                 → Desired number of pods      
 selector:                  → The pod selector for this rc        
   app: nginx                        
 template:                  → The template for creating a new pod        
   metadata:                        
     labels:                        
       app: nginx                    
   spec:                            
     containers:                    
     - name: nginx                  
       image: nginx

```

To explain further, this file, when executed to create a ReplicationController called `rcexample` ensures that three instances of pods called `nginx` are running all the time. If one or all the pods `app=nginx` are not running, new pods are created based on the defined pod template.

A ReplicationController has three parts:

  * Replica: 3
  * Pod Template: app=nginx
  * Pod Selector: app=nginx



Notice that Pod Template matches with Pod Selector to prevent the ReplicationController from indefinitely creating pods. If you create a ReplicationController with a pod selector not matching the template, the Kubernetes API server gives you an error.

To verify that the ReplicationController `rcexample` got created:


```


$ kubectl get po
NAME          READY     STATUS              RESTARTS   AGE
rcexample-53thy   0/1   Running                 0          10s
rcexample-k0xz6   0/1   Running                 0          10s
rcexample-q3vkg   0/1   Running                 0          10s

```

To delete the ReplicationController:


```


$ kubectl delete rc rcexample
  replicationcontroller "rcexample" deleted

```

Note that you can use a [rolling update][2] strategy to the service in the ReplicationController by replacing pods one by one.

### Other methods to replicate containers

In a Kubernetes deployment, there are multiple ways you that can attain replication of containers. One of the main reasons Kubernetes is the main choice for container platforms is the native ability to replicate containers to attain reliability, load balancing, and scaling. 

I have shown above how you can easily create a ReplicationController to make sure that a certain number of pods is available at any given time. You can manually scale pods by updating the number of replicas.

The other possible approach to attain replication is by using [ReplicaSet][3].


```
`(kind: ReplicaSet)`
```

ReplicaSet (rs) functions are almost identical to ReplicationController. The main difference is that a ReplicaSet does not allow a rolling-update strategy.

Another approach to attain replication is by using [Deployments][4].


```
`(kind: Deployment)`
```

Deployments is a more advanced container replication approach. Functionality-wise, Deployments provide the same functionality but can roll out and roll back changes if needed. This functionality is possible because Deployments has StrategyType specification to replace old pods with new ones. There are two types of deployment strategies that you can define—Recreate and RollingUpdate. You specify the deployment strategy as shown below:


```
`StrategyType: RollingUpdate`
```

### Conclusion

Replication of containers is one of the main reasons why Kubernetes gets considered for most enterprise container adoption. Replication allows you to attain the reliability and scalability that most critical applications need as minimum requirements for production.

Understanding which methods to use to attain replication in a Kubernetes cluster is important to decide which one is the best for you to incorporate in your application architecture consideration.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/kubernetes-replicationcontroller

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mcalizo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/kubernetes_containers_ship_lead.png?itok=9EUnSwci (Ships at sea on the web)
[2]: https://kubernetes.io/docs/tutorials/kubernetes-basics/update/update-intro/
[3]: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/
[4]: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
