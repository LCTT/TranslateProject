[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 ways to run Kubernetes locally)
[#]: via: (https://opensource.com/article/20/11/run-kubernetes-locally)
[#]: author: (Bryant Son https://opensource.com/users/brson)

4 ways to run Kubernetes locally
======
Set up a local development environment or just try out the container
orchestration platform with these tools.
![Business woman on laptop sitting in front of window][1]

[Kubernetes][2] is an open source orchestration platform for containers. Developed by Google, it offers an open source system for automating deployment, scaling, and managing containerized applications. Although most people run Kubernetes in a cloud environment, running a Kubernetes cluster locally is not only possible, it has at least two benefits:

  * You can quickly try out Kubernetes before deciding to use it as your primary platform to deploy your application.
  * You can set it up as a local development environment before pushing anything to a public cloud, thus allowing separation between the development environment and the production environment.



Setting up a local Kubernetes environment as your development environment is the recommended option, no matter your situation, because this setup can create a safe and agile application-deployment process.

Fortunately, there are multiple platforms that you can try out to run Kubernetes locally, and they are all open source and available under the [Apache 2.0][3] license.

  * [Minikube][4] has the primary goals of being the best tool for local Kubernetes application development, and to support all Kubernetes features that fit.
  * [kind][5] runs local Kubernetes clusters using Docker container "nodes."
  * [CodeReady Containers][6] (CRC) manages a local OpenShift 4.x cluster optimized for testing and development purposes.
  * [Minishift][7] helps you run OpenShift 3.x clusters locally by running a single-node OpenShift cluster inside a virtual machine (VM).



### Minikube

![Minikube][8]

(Bryant Son, [CC BY-SA 4.0][9])

[Minikube][10] is the most well-known and popular choice to run a Kubernetes environment on a local computer. No matter what operating system you use, [Minikube's documentation][11] offers an easy [installation][12] guide for you. Generally, installing Minikube is as simple as running two commands:


```
$ curl -LO <https://storage.googleapis.com/minikube/releases/latest/minikube-PLATFORM-amd64>
$ sudo install minikube-PLATFORM-amd64 /usr/local/bin/minikube
```

Minikube quickly sets up a local Kubernetes cluster on Linux, macOS, or Windows with the following features:

  * Supports the latest Kubernetes release (+6 previous minor versions)
  * Cross-platform (Linux, macOS, Windows)
  * Deploys as a VM, a container, or on bare-metal
  * Multiple container runtimes (CRI-O, containerd, Docker)
  * Docker API endpoint for blazing-fast image pushes
  * LoadBalancer, filesystem mounts, FeatureGates, and other advanced features
  * Add-ons for easily installing Kubernetes applications



Because Minikube is an open source project, you can contribute to its [source code][4].

### kind

![kind][13]

(Bryant Son, [CC BY-SA 4.0][9])

[kind][14]'s developers describe it as "a tool for running local Kubernetes clusters using Docker container 'nodes.'" It was designed for testing Kubernetes but may also be used for local development or continuous integration.

kind supports:

  * Multi-node (including high-availability) clusters
  * Building Kubernetes release builds from source
  * Make/Bash/Docker or Bazel, in addition to pre-published builds
  * Linux, macOS, and Windows



In addition, kind is a Cloud Native Computing Foundation (CNCF)-certified conformant Kubernetes installer. Because it's open source, you can find kind's [source code][5] in its GitHub repository.

### CodeReady Container (CRC)

![CodeReady Container][15]

(Bryant Son, [CC BY-SA 4.0][9])

If you want to try the latest version of OpenShift locally, try Red Hat [CodeReady Containers][16] (CRC). CRC brings a minimal OpenShift 4.x cluster to your local computer that provides a minimal environment for development and testing purposes. CRC is mainly targeted for use on developers' desktops.

You can find CodeReady Container's [source code][6] on GitHub, also available under the Apache 2.0 license.

### Minishift

![Minishift][17]

(Bryant Son, [CC BY-SA 4.0][9])

The [Minishift][7] project [helps you run a version of OpenShift][18] with [OKD][19] locally with a single-node OpenShift cluster inside a virtual machine. You can use it to [try OpenShift][20] or to develop for the cloud, on your local host.

Like the other tools on this list, Minishift is open source, and you can access its [source code][7] on GitHub.

### Kubernetes for the people

As you can see, there are several ways to try out Kubernetes in your local environment. Did I miss anything? Feel free to leave a comment to ask a question or make a suggestion.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/run-kubernetes-locally

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://kubernetes.io/
[3]: https://www.apache.org/licenses/LICENSE-2.0
[4]: https://github.com/kubernetes/minikube
[5]: https://github.com/kubernetes-sigs/kind
[6]: https://github.com/code-ready/crc
[7]: https://github.com/minishift/minishift
[8]: https://opensource.com/sites/default/files/uploads/1_minikube.jpg (Minikube)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://minikube.sigs.k8s.io/docs/
[11]: https://minikube.sigs.k8s.io/docs
[12]: https://minikube.sigs.k8s.io/docs/start/
[13]: https://opensource.com/sites/default/files/uploads/2_kind.jpg (kind)
[14]: https://kind.sigs.k8s.io
[15]: https://opensource.com/sites/default/files/uploads/4_crc.jpg (CodeReady Container)
[16]: https://code-ready.github.io/crc
[17]: https://opensource.com/sites/default/files/uploads/3_minishift.jpg (Minishift)
[18]: https://www.redhat.com/sysadmin/kubernetes-cluster-laptop
[19]: https://www.okd.io/
[20]: https://www.redhat.com/sysadmin/learn-openshift-minishift
