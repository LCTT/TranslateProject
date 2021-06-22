[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Hard lessons learned about Kubernetes garbage collection)
[#]: via: (https://opensource.com/article/20/6/kubernetes-garbage-collection)
[#]: author: (Oleg Matskiv https://opensource.com/users/oleg-matskiv)

Hard lessons learned about Kubernetes garbage collection
======
Why I'll never skim Kubernetes documentation again.
![Ship captain sailing the Kubernetes seas][1]

Some time ago, I learned an important Kubernetes lesson the hard way. The story begins with [Kubernetes Operators][2], which is a method of packaging, deploying, and managing a Kubernetes application. The thing I tripped up on was [garbage collection][3] in the cluster, which cleans up objects that no longer have an owner object (but more on that later).

### The task

Last year, the team I work on was assigned to develop a Kubernetes Operator. For most people on the team, this was their first experience with the [Operator SDK][4] (software development kit) and [Kubernetes controllers][5], which are the control loops that power Kubernetes. We all read some basic introductory information about Operator SDK and followed the [quickstart guide][6] for building an Operator in the Go programming language. We learned some basic principles and a few handy tricks, and we were eager to apply them.

Our task was to develop an Operator that would install, configure, and ensure production readiness for a number of projects. The goal was to have automation for managing a fleet of instances with minimal manual work for our [site reliability engineering (SRE)][7] team. Not an easy task, but we liked the challenge and the technologies we could use, so we were moving fast and breaking some things along the way.

### The bug

Initially, we were chasing a proof of concept implementation, so we logged bugs with a plan to fix them later.

![Decision-making matrix][8]

([Davidjcmorris][9], [CC-BY-SA-4.0][10])

The bug I will describe fits perfectly into Quadrant II of this [Eisenhower Matrix][11] (as Stephen Covey espoused)—not urgent, but important. Very important actually—all the namespaces that our Operator created would sometimes terminate without any request from a user. It didn't happen very often, so we decided to fix it later.

Eventually, I picked up this bug from our backlog and started looking for a root cause. The Operator definitely couldn't terminate the namespace, as we didn't have any Delete API calls written in the code at that point, which, in hindsight, was the first clue. I started my detective work by dialing up the logging on the [Kubernetes API server][12] and making sure the logs were being safely saved. Then I waited for the issue to happen again.

Once the issue occurred in an environment I set up, I searched the logs for this combination of strings: `"requestURI":"/api/v1/namespaces/my-namespace"` \+ `"verb":"delete"`_._

From my search results, I found what was executing the namespace deletion: `"user":{"username":"system:serviceaccount:kube-system:generic-garbage-collector"`.

Now I knew _how_ the namespaces were removed, but I didn't know _why_. I opened the Kubernetes [garbage collection documentation][3], but since I am not a patient man, I just skimmed through the basic information about the `ownerReference` field and continued thinking about why this was happening.

We were using the `ownerReference` metadata field on the namespaces that we created. The owner was our own resource defined by the [custom resource API][13]. And when our custom resource was deleted, the associated namespaces that it owned through the `ownerReference` were deleted as well. This deletion of associated objects made the uninstallation step a breeze.

I didn't see any problem with this, so I continued reading the logs for more clues. I noticed that the namespace would be removed when the `kube-controller-manager` pod restarted. The reason for the restart made sense to me: the `kube-controller-manager` pod runs on the master node, we only had one master node in our development cluster, and the load on that node was very high for the instance size we used.

So I tried to reproduce the issue myself. I deleted the `kube-controller-manager` pod, a new one spun up, and I checked its logs. Once I saw some logs about garbage collection, I finally put two and two together and went back to the garbage collection docs. And there it was:

> "**Note:** Cross-namespace owner references are disallowed by design. This means: 1) Namespace-scoped dependents can only specify owners in the same namespace, and owners that are cluster-scoped. 2) Cluster-scoped dependents can only specify cluster-scoped owners, but not namespace-scoped owners."

Our custom resource was namespace-scoped, but the namespaces are cluster-scoped. And the Kubernetes API server creates namespaces even if the owner reference we use is disallowed by design. So the namespaces were created with the owner references, and then they had to be deleted since garbage collection follows the documented rules. 

### The lessons learned

The technical lesson I learned is simple: Don't use owner references in which a namespace-scoped resource owns a cluster-scoped resource or a resource in a different namespace. When you use these "disallowed by design" owner references, your Kubernetes resources will be deleted by the garbage-collection routine whenever the `kube-controller-manager pod` starts up.

But the more important lesson I learned is _not to underestimate the documentation_. If I was more patient when I read the documentation the first time, I would have definitely saved myself some time.

You might also think that we could have avoided this if we followed my advice back when the invalid owner reference was added to the codebase. But it turns out it was not documented yet. A [pull request][14] in February 2019 added this important note, long after Kubernetes was a well-established technology.

I think this highlights the fact that there is always room for improvement in documentation. Let's do it together, starting with reading the guide to [contributing to Kubernetes docs][15].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/kubernetes-garbage-collection

作者：[Oleg Matskiv][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/oleg-matskiv
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://kubernetes.io/docs/concepts/extend-kubernetes/operator/
[3]: https://kubernetes.io/docs/concepts/workloads/controllers/garbage-collection/
[4]: https://sdk.operatorframework.io/
[5]: https://kubernetes.io/docs/concepts/architecture/controller/
[6]: https://sdk.operatorframework.io/docs/golang/quickstart/
[7]: https://www.redhat.com/en/topics/devops/what-is-sre
[8]: https://opensource.com/sites/default/files/uploads/512px-7_habits_decision-making_matrix.png (Decision-making matrix)
[9]: https://commons.wikimedia.org/wiki/File:7_habits_decision-making_matrix.png
[10]: https://creativecommons.org/licenses/by-sa/4.0/
[11]: https://en.wikipedia.org/wiki/Time_management#The_Eisenhower_Method
[12]: https://kubernetes.io/docs/reference/command-line-tools-reference/kube-apiserver/
[13]: https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/
[14]: https://github.com/kubernetes/website/pull/12543
[15]: https://kubernetes.io/docs/contribute/
