[#]: subject: "What is PDB in Kubernetes?"
[#]: via: "https://kerneltalks.com/virtualization/what-is-pdb-in-kubernetes/"
[#]: author: "kerneltalks https://www.facebook.com/kerneltalks/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What is PDB in Kubernetes?
======
Ever wondered what is PDB i.e. Pod Disruption Budget in the Kubernetes world? Then this small post is just for you!

![][1]

PDB i.e. Pod Disruption Budget is a method to make sure the minimum number of Pods are always available for a certain application in the Kubernetes cluster. That is a kind of one-liner for explaining PDB 🙂 Let’s dive deeper and understand what is PDB. What does PDB offer? Should I define PDB for my applications? etc.

#### What is Pod Disruption Budget?

The Replicaset in Kubernetes helps us to keep multiple replicas of the same Pod to handle the load or add an extra layer of availability in containerized applications. But, those replicas are tossed during cluster maintenance or scaling actions if you don’t tell the control plane (Kubernetes master/ Kubernetes API server) how they should be terminated.

The PDB is a way to let control plane how the Pods in a certain Replicaset should be terminated. The PDB is a Kubernetes kind that should be associated with the Deployment kind.

#### How PDB is defined?

It’s a very small kind and offers only three fields to configure:

* spec.selector: Defines the Pods to which PDB will be applied
* spec.minAvailable: An absolute number or percentage. It’s the number of Pods that should always remain in a running state during evictions.
* spec.maxUnavailable: An absolute number or percentage. It’s the maximum number of Pods that can be unavailable during evictions.
* You can only specify either `spec.minAvailable` or `spec.maxUnavailable`

A sample Kubernetes manifest for PDB looks like this –

```
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: sample-pdb
  namespace: <namespace> #optional
  Annotations:           #optional
    key: value 
  labels:                #optional
    key: value
spec:
  minAvailable: 1
  selector:
    matchLabels:
      app: web
```

Here –

* metadata: The PDB name, the namespace in which PDB lives, annotations and labels that are applied to the PDB itself.
* spec: It’s a PDB config we discussed above.

#### How does PDB work?

Let’s look at how this configuration takes into effect. For better understanding, we will consider a simple application that has 5 replicas.

Case 1: PDB is configured with minAvailable to be 3.

This means we are telling the control plane that it can evict at most  (5 running – 3 minavailable) 2 Pods at a time. That means we are allowing 2 disruptions at a time. This value is also called *disruptionsAllowed*. So, in a situation where the control plane needs to move all the 5 Pods, it will evict 2 Pods first then once those 2 evicted Pods, respawns on the new node and goes into the `Running` state, it will evict the next 2 and lastly 1. In a process, it makes sure that there are always 3 Pods in the `Running` state.

Case 2: PDB is configured with maxUnavailable to be 2

It’s the same effect as above! Basically, you are telling the control plane at any given point of time 2 Pods can be evicted meaning 5-2 = 3 Pods should be running!

The `Allowed Disruptions` is calculated on the fly. It always considers the Pods in `Running` state only. Continuing with the above example, if out of 5 Pods, 2 Pods are not in a `Running` state (for maybe some reason) then *disruptionsAllowed*is calculated as 3-3=0. This means only 3 Pods are in the `Running` state and all 3 should not be evicted since PDB says it wants a minimum of 3 Pods in the `Running` state all the time.

In a nutshell: *disruptionsAllowed = Number of RUNNING Pods – minAvailable value*

#### How to check Pod Disruption Budget?

One can use the below command to check the PDB –

```
$ kubectl get poddisruptionbudgets -n <namespace>
```

Then, `kubectl describe` can be used to get the details of each PDB fetched in the output of the previous command.

#### Should I define PDB for my applications?

Yes, you should! It’s a good practice to calculate and properly define the PDB to make your application resilient to Cluster maintenance/scaling activities.

The minimum number is to have minAvailable as 1 and replicas 2. Or make sure that minAvailable is always less than the replica count. The wrongly configured PDB will not allow Pod evictions and may disturb the cluster activities. Obviously, cluster admins can force their way in but then it means downtime in your applications.

You can also implement cluster constraints for PDB so that new applications won’t be allowed to deploy unless they have PDB manifest as well in the code.

--------------------------------------------------------------------------------

via: https://kerneltalks.com/virtualization/what-is-pdb-in-kubernetes/

作者：[kerneltalks][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.facebook.com/kerneltalks/
[b]: https://github.com/lkxed
[1]: https://z5.kerneltalks.com/wp-content/uploads/2022/08/pod-disruption-budget.png
