[#]: subject: (5 useful ways to manage Kubernetes with kubectl)
[#]: via: (https://opensource.com/article/21/7/kubectl)
[#]: author: (Alan Smithee https://opensource.com/users/alansmithee)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

5 useful ways to manage Kubernetes with kubectl
======
Learn kubectl to enhance how you interact with Kubernetes.
![Ship captain sailing the Kubernetes seas][1]

Kubernetes is software to help you run lots of containers in an organized way. Aside from providing tools to manage (or [orchestrate][2]) the containers you run, Kubernetes also helps those containers scale out as needed. With Kubernetes as your central control panel (or _control plane_), you need a way to manage Kubernetes, and the tool for that job is kubectl. The `kubectl` command lets you control, maintain, analyze, and troubleshoot Kubernetes clusters. As with many tools using the `ctl` (short for "control") suffix, such as systemctl and sysctl, kubectl has purview over a broad array of functions and tasks, so you end up using it a lot if you're running Kubernetes. It's a big command with lots of options, so here are five common tasks that kubectl makes easy.

### 1\. List and describe resources

Containers, by design, tend to multiply. Under certain conditions, they can multiply rapidly. This can get overwhelming if the only way you have to see running containers is `podman ps` or `docker ps`. With `kubectl get` and `kubectl describe`, you can get information about what pods are running and the containers they're handling. What's more is that you can get just the information you need by using options like `--namespace` or `name` or `--selector`.

The `get` subcommand is useful for a lot more than just pods and containers. It has information about nodes, namespaces, deployments, services, and replicas.

### 2\. Create resources

If you've only ever created deployments through a web user interface (UI) like one provided by OpenShift, OKD, or Kubernetes, but you're looking to take control of your cluster from your Linux terminal instead, then get ready to use `kubectl create`. The `kubectl create` command doesn't just instantiate a new app deployment, though. There are lots of other components available in Kubernetes that you can create, such as services, quotas, and [CronJobs][3].

A CronJob in Kubernetes can create a transient pod meant to perform some task on a schedule of your choice. They're not difficult to set up. Here's a CronJob to have a BusyBox image echo "hello world" every minute:


```
$ kubectl create cronjob \
hello-world \
\--image=busybox \
\--schedule="*/1 * * * *" -- echo "hello world"
```

### 3\. Edit files

You may have an understanding that objects in Kubernetes have accompanying configuration files, but rummaging through your filesystem to find the appropriate file can be troublesome. With `kubectl edit`, you can keep your mind on the objects and not on the files that define them. You can have `kubectl` find and open the file for you (it respects the `KUBE_EDITOR` environment variable, so you can set your editor to whatever you prefer):


```
$ KUBE_EDITOR=emacs \
kubectl edit cronjob/hello-world
```

### 4\. Trade files between containers

Newcomers to containers are often baffled by the concept of a shared system that they can't apparently access. They may learn about `exec` options in their container engine or in kubectl itself, but containers still can seem impervious when they can't just grab a file from or place a file into a container. Using the `kubectl cp` command, you can treat containers as if they were remote servers, making copying files to and from containers no more complex than an SSH command:


```
`$ kubectl cp foo my-pod:/tmp`
```

### 5\. Apply changes

Making changes to Kubernetes objects can be done at any time with the `kubectl apply` command. All you have to do is point the command to a configuration file:


```
`$ kubectl apply -f ./mypod.json`
```

Akin to running an Ansible playbook or a Bash script, `apply` makes it easy to "import" settings quickly into a running Kubernetes instance. For instance, the GitOps tool [ArgoCD][4] is surprisingly simple to install thanks to the `apply` subcommand:


```
$ kubectl create namespace argocd
$ kubectl apply -n argocd \
-f <https://raw.githubusercontent.com/argoproj/argo-cd/vx.y.z/manifests/install.yaml>
```

### Use kubectl

Kubectl is a powerful tool, and because it's a terminal command it can be scripted and used in many ways a web UI cannot. Learning kubectl is a great way to further your understanding of Kubernetes, containers, pods, and all the technologies that surround these important cloud innovations. [Download our kubectl cheat sheet][5] for a quick reference, complete with sample commands, to help you as you learn and remind you of the details once you're a pro.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/kubectl

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://opensource.com/article/20/11/orchestration-vs-automation
[3]: https://opensource.com/article/20/11/kubernetes-jobs-cronjobs
[4]: https://argoproj.github.io/argo-cd/
[5]: https://opensource.com/downloads/kubectl-cheat-sheet
