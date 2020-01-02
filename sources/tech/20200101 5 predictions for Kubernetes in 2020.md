[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 predictions for Kubernetes in 2020)
[#]: via: (https://opensource.com/article/20/1/kubernetes-2020)
[#]: author: (Scott McCarty https://opensource.com/users/fatherlinux)

5 predictions for Kubernetes in 2020
======
Plus, a look back at the most popular Kubernetes articles on the site in
2019.
![Person drinking a hat drink at the computer][1]

How do you track a wildly popular project like Kubernetes? How do you figure out where it’s going? If you are contributing to the project or participating in Special Interest Groups (SIGs), you might gain insight by osmosis, but for those of you with day jobs that don’t include contributing to Kubernetes, you might like a little help reading the tea leaves. With a fast-moving project like Kubernetes, the end of the year is an excellent time to take a look at the past year to gain insight into the next one.

This year, Kubernetes made a lot of progress. Aside from inspecting code, documentation, and meeting notes, another good source is blog entries. To gain some insights, I took a look at the top ten Kubernetes articles on Opensource.com. These articles give us insight into what topics people are interested in reading, but just as importantly, what articles people are interested in writing. Let’s dig in!

(Get the full list of top 10 Kubernetes articles from 2019 at the end.)

First, I would point out that five of these articles tackle the expansion of workloads and where they can run. This expansion of workloads includes data science, PostgreSQL, InfluxDB, and Grafana (as a workload, not just to monitor the cluster itself) and Edge. Historically, Kubernetes and containers in general have mostly run on top of virtual machines, especially when run on infrastructure provided by cloud providers. With this interest in Kubernetes at the edge, it’s another sign that end users are genuinely interested in Kubernetes on bare metal (see also [Kubernetes on metal with OpenShift][2]).

Next, there seems to be a lot of hunger for operational knowledge and best practices with Kubernetes. From [Kubernetes Operators][3], to [Kubernetes Controllers][4], from [Secrets][5] to [ConfigMaps][6], developers and operators alike are looking for best practices and ways to simplify workload deployment and management. Often we get caught up in the actual configuration example, or how people do it, and don’t take a step back to realize that all of these fall into the bucket of how to operationalize the deployment of applications (not how to install or run Kubernetes itself).

Finally, people seem to be really interested in getting started. In fact, there is so much information on how to build Kubernetes that it intimidates people and gets them down the wrong path. A couple of the top articles focus on why you should learn to run applications on Kubernetes instead of concentrating on installing it. Like best practices, people often don’t take a step back to analyze where they should invest their time when getting started. I have always advocated for, where possible, spending limited time and money on using technology instead of building it.

### 5 predictions for Kubernetes in 2020

So, looking back at those themes from 2019, what does this tell us about where 2020 is going? Well, combining insight from these articles with my own broad purview, I want to share my thoughts for 2020 and beyond:

  1. Expansion of workloads. I would keep my eye on high-performance computing, AI/ML, and stateful workloads using Operators.

  2. More concrete best practices, especially around mature standards like PCI, HIPAA, NIST, etc.

  3. Increased security around rootless and higher security [runtimes classes][7] (like [gVisor][8], [Kata Containers][9], etc.)

  4. Better standardization on Kubernetes manifests as the core artifact for deployment in development and sharing applications between developers. Things like [podman generate kube][10], [podman play kube][11], and all in one Kubernetes environments like [CodeReady Containers (CRC)][12]

  5. An ever-wider ecosystem of network, storage and specialized hardware (GPUs, etc.) vendors creating best of breed solutions for Kubernetes (in free software, we believe that open ecosystems are better than vertically integrated solutions)




I'm looking forward to another great year in Kubernetes!

**Top 10 Kubernetes articles for 2019**

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/kubernetes-2020

作者：[Scott McCarty][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hat drink at the computer)
[2]: https://blog.openshift.com/kubernetes-on-metal-with-openshift/
[3]: https://kubernetes.io/docs/concepts/extend-kubernetes/operator/
[4]: https://kubernetes.io/docs/concepts/architecture/controller/
[5]: https://kubernetes.io/docs/concepts/configuration/secret/
[6]: https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/
[7]: https://kubernetes.io/docs/concepts/containers/runtime-class/
[8]: https://gvisor.dev/
[9]: https://katacontainers.io/
[10]: https://developers.redhat.com/blog/2019/01/29/podman-kubernetes-yaml/
[11]: https://www.redhat.com/en/blog/rhel-81-minor-release-major-new-container-capabilities
[12]: https://developers.redhat.com/products/codeready-containers/overview
