[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 tools to help you drive Kubernetes)
[#]: via: (https://opensource.com/article/19/6/tools-drive-kubernetes)
[#]: author: (Scott McCarty https://opensource.com/users/fatherlinux/users/fatherlinux/users/fatherlinux/users/fatherlinux)

4 tools to help you drive Kubernetes
======
Learning to drive Kubernetes is more important that knowing how to build
it, and these tools will get you on the road fast.
![Tools in a workshop][1]

In the third article in this series, _[Kubernetes basics: Learn how to drive first][2]_ , I emphasized that you should learn to drive Kubernetes, not build it. I also explained that there is a minimum set of primitives that you have to learn to model an application in Kubernetes. I want to emphasize this point: the set of primitives that you _need_ to learn are the easiest set of primitives that you _can_ learn to achieve production-quality application deployments (i.e., high-availability [HA], multiple containers, multiple applications). Stated another way, learning the set of primitives built into Kubernetes is easier than learning clustering software, clustered file systems, load balancers, crazy Apache configs, crazy Nginx configs, routers, switches, firewalls, and storage backends—all the things you would need to model a simple HA application in a traditional IT environment (for virtual machines or bare metal).

In this fourth article, I'll share some tools that will help you learn to drive Kubernetes quickly.

### 1\. Katacoda

[Katacoda][3] is the easiest way to test-drive a Kubernetes cluster, hands-down. With one click and five seconds of time, you have a web-based terminal plumbed straight into a running Kubernetes cluster. It's magnificent for playing and learning. I even use it for demos and testing out new ideas. Katacoda provides a completely ephemeral environment that is recycled when you finish using it.

![OpenShift Playground][4]

[OpenShift playground][5]

![Kubernetes Playground][6]

[Kubernetes playground][7]

Katacoda provides ephemeral playgrounds and deeper lab environments. For example, the [Linux Container Internals Lab][3], which I have run for the last three or four years, is built in Katacoda.

Katacoda maintains a bunch of [Kubernetes and cloud tutorials][8] on its main site and collaborates with Red Hat to support a [dedicated learning portal for OpenShift][9]. Explore them both—they are excellent learning resources.

When you first learn to drive a dump truck, it's always best to watch how other people drive first.

### 2\. Podman generate kube

The **podman generate kube** command is a brilliant little subcommand that helps users naturally transition from a simple container engine running simple containers to a cluster use case running many containers (as I described in the [last article][2]). [Podman][10] does this by letting you start a few containers, then exporting the working Kube YAML, and firing them up in Kubernetes. Check this out (pssst, you can run it in this [Katacoda lab][3], which already has Podman and OpenShift).

First, notice the syntax to run a container is strikingly similar to Docker:


```
`podman run -dtn two-pizza quay.io/fatherlinux/two-pizza`
```

But this is something other container engines don't do:


```
`podman generate kube two-pizza`
```

The output:


```
# Generation of Kubernetes YAML is still under development!
#
# Save the output of this file and use kubectl create -f to import
# it into Kubernetes.
#
# Created with podman-1.3.1
apiVersion: v1
kind: Pod
metadata:
creationTimestamp: "2019-06-07T08:08:12Z"
labels:
app: two-pizza
name: two-pizza
spec:
containers:
\- command:
\- /bin/sh
\- -c
\- bash -c 'while true; do /usr/bin/nc -l -p 3306 < /srv/hello.txt; done'
env:
\- name: PATH
value: /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
\- name: TERM
value: xterm
\- name: HOSTNAME
\- name: container
value: oci
image: quay.io/fatherlinux/two-pizza:latest
name: two-pizza
resources: {}
securityContext:
allowPrivilegeEscalation: true
capabilities: {}
privileged: false
readOnlyRootFilesystem: false
tty: true
workingDir: /
status: {}
\---
apiVersion: v1
kind: Service
metadata:
creationTimestamp: "2019-06-07T08:08:12Z"
labels:
app: two-pizza
name: two-pizza
spec:
selector:
app: two-pizza
type: NodePort
status:
loadBalancer: {}
```

You now have some working Kubernetes YAML, which you can use as a starting point for mucking around and learning, tweaking, etc. The **-s** flag created a service for you. [Brent Baude][11] is even working on new features like [adding Volumes/Persistent Volume Claims][12]. For a deeper dive, check out Brent's amazing work in his blog post "[Podman can now ease the transition to Kubernetes and CRI-O][13]."

### 3\. oc new-app

The **oc new-app** command is extremely powerful. It's OpenShift-specific, so it's not available in default Kubernetes, but it's really useful when you're starting to learn Kubernetes. Let's start with a quick command to create a fairly sophisticated application:


```
oc new-project -n example
oc new-app -f <https://raw.githubusercontent.com/openshift/origin/master/examples/quickstarts/cakephp-mysql.json>
```

With **oc new-app** , you can literally steal templates from the OpenShift developers and have a known, good starting point when developing primitives to describe your own applications. After you run the above command, your Kubernetes namespace (in OpenShift) will be populated by a bunch of new, defined resources.


```
`oc get all`
```

The output:


```
NAME READY STATUS RESTARTS AGE
pod/cakephp-mysql-example-1-build 0/1 Completed 0 4m
pod/cakephp-mysql-example-1-gz65l 1/1 Running 0 1m
pod/mysql-1-nkhqn 1/1 Running 0 4m

NAME DESIRED CURRENT READY AGE
replicationcontroller/cakephp-mysql-example-1 1 1 1 1m
replicationcontroller/mysql-1 1 1 1 4m

NAME TYPE CLUSTER-IP EXTERNAL-IP PORT(S) AGE
service/cakephp-mysql-example ClusterIP 172.30.234.135 <none> 8080/TCP 4m
service/mysql ClusterIP 172.30.13.195 <none> 3306/TCP 4m

NAME REVISION DESIRED CURRENT TRIGGERED BY
deploymentconfig.apps.openshift.io/cakephp-mysql-example 1 1 1 config,image(cakephp-mysql-example:latest)
deploymentconfig.apps.openshift.io/mysql 1 1 1 config,image(mysql:5.7)

NAME TYPE FROM LATEST
buildconfig.build.openshift.io/cakephp-mysql-example Source Git 1

NAME TYPE FROM STATUS STARTED DURATION
build.build.openshift.io/cakephp-mysql-example-1 Source Git@47a951e Complete 4 minutes ago 2m27s

NAME DOCKER REPO TAGS UPDATED
imagestream.image.openshift.io/cakephp-mysql-example docker-registry.default.svc:5000/example/cakephp-mysql-example latest About aminute ago

NAME HOST/PORT PATH SERVICES PORT TERMINATION WILDCARD
route.route.openshift.io/cakephp-mysql-example cakephp-mysql-example-example.2886795271-80-rhsummit1.environments.katacoda.com cakephp-mysql-example <all> None
```

The beauty of this is that you can delete Pods, watch the replication controllers recreate them, scale Pods up, and scale them down. You can play with the template and change it for other applications (which is what I did when I first started).

### 4\. Visual Studio Code

I saved one of my favorites for last. I use [vi][14] for most of my work, but I have never found a good syntax highlighter and code completion plugin for Kubernetes (if you have one, let me know). Instead, I have found that Microsoft's [VS Code][15] has a killer set of plugins that complete the creation of Kubernetes resources and provide boilerplate.

![VS Code plugins UI][16]

First, install Kubernetes and YAML plugins shown in the image above.

![Autocomplete in VS Code][17]

Then, you can create a new YAML file from scratch and get auto-completion of Kubernetes resources. The example above shows a Service.

![VS Code autocomplete filling in boilerplate for an object][18]

When you use autocomplete and select the Service resource, it fills in some boilerplate for the object. This is magnificent when you are first learning to drive Kubernetes. You can build Pods, Services, Replication Controllers, Deployments, etc. This is a really nice feature when you are building these files from scratch or even modifying the files you create with **Podman generate kube**.

### Conclusion

These four tools (six if you count the two plugins) will help you learn to drive Kubernetes, instead of building or equipping it. In my final article in the series, I will talk about why Kubernetes is so exciting for running so many different workloads.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/tools-drive-kubernetes

作者：[Scott McCarty][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux/users/fatherlinux/users/fatherlinux/users/fatherlinux
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_workshop_blue_mechanic.jpg?itok=4YXkCU-J (Tools in a workshop)
[2]: https://opensource.com/article/19/6/kubernetes-basics
[3]: https://learn.openshift.com/subsystems/container-internals-lab-2-0-part-1
[4]: https://opensource.com/sites/default/files/uploads/openshift-playground.png (OpenShift Playground)
[5]: https://learn.openshift.com/playgrounds/openshift311/
[6]: https://opensource.com/sites/default/files/uploads/kubernetes-playground.png (Kubernetes Playground)
[7]: https://katacoda.com/courses/kubernetes/playground
[8]: https://katacoda.com/learn
[9]: http://learn.openshift.com/
[10]: https://podman.io/
[11]: https://developers.redhat.com/blog/author/bbaude/
[12]: https://github.com/containers/libpod/issues/2303
[13]: https://developers.redhat.com/blog/2019/01/29/podman-kubernetes-yaml/
[14]: https://en.wikipedia.org/wiki/Vi
[15]: https://code.visualstudio.com/
[16]: https://opensource.com/sites/default/files/uploads/vscode_-_kubernetes_red_hat_-_plugins.png (VS Code plugins UI)
[17]: https://opensource.com/sites/default/files/uploads/vscode_-_kubernetes_service_-_autocomplete.png (Autocomplete in VS Code)
[18]: https://opensource.com/sites/default/files/uploads/vscode_-_kubernetes_service_-_boiler_plate.png (VS Code autocomplete filling in boilerplate for an object)
