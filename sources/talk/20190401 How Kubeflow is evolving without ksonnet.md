[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How Kubeflow is evolving without ksonnet)
[#]: via: (https://opensource.com/article/19/4/kubeflow-evolution)
[#]: author: (Jonathan Gershater (Red Hat) https://opensource.com/users/jgershat/users/jgershat)

How Kubeflow is evolving without ksonnet
======
There are big differences in how open source communities handle change compared to closed source vendors.
![Chat bubbles][1]

Many software projects depend on modules that are run as separate open source projects. When one of those modules loses support (as is inevitable), the community around the main project must determine how to proceed.

This situation is happening right now in the [Kubeflow][2] community. Kubeflow is an evolving open source platform for developing, orchestrating, deploying, and running scalable and portable machine learning workloads on [Kubernetes][3]. Recently, the primary supporter of the Kubeflow component [ksonnet][4] announced that it would [no longer support][5] the software.

When a piece of software loses support, the decision-making process (and the outcome) differs greatly depending on whether the software is open source or closed source.

### A cellphone analogy

To illustrate the differences in how an open source community and a closed source/single software vendor proceed when a component loses support, let's use an example from hardware design.

Suppose you buy cellphone Model A and it stops working. When you try to get it repaired, you discover the manufacturer is out of business and no longer offering support. Since the cellphone's design is proprietary and closed, no other manufacturers can support it.

Now, suppose you buy cellphone Model B, it stops working, and its manufacturer is also out of business and no longer offering support. However, Model B's design is open, and another company is in business manufacturing, repairing and upgrading Model B cellphones.

This illustrates one difference between software written using closed and open source principles. If the vendor of a closed source software solution goes out of business, support disappears with the vendor, unless the vendor sells the software's design and intellectual property. But, if the vendor of an open source solution goes out of business, there is no intellectual property to sell. By the principles of open source, the source code is available for anyone to use and modify, under license, so another vendor can continue to maintain the software.

### How Kubeflow is evolving without ksonnet

The ramification of ksonnet's backers' decision to cease development illustrates Kubeflow's open and collaborative design process. Kubeflow's designers have several options, such as replacing ksonnet, adopting and developing ksonnet, etc. Because Kubeflow is an open source project, all options are discussed in the open on the Kubeflow mailing list. Some of the community's suggestions include:

>   * Should we look at projects that are CNCF/Apache projects e.g. [helm][6]
>   * I would opt for back to the basics. KISS. How about plain old jsonnet + kubectl + makefile/scripts ? Thats how e.g. the coreos [prometheus operator][7] does it. It would also lower the entry barrier (no new tooling) and let vendors of k8s (gke, openshift, etc) easily build on top of that.
>   * I vote for using a simple, _programmatic_ context, be it manual jsonnet + kubectl, or simple Python scripts + Python K8s client, or any tool be can build on top of these.
>


The members of the mailing list are discussing and debating alternatives to ksonnet and will arrive at a decision to continue development. What I love about the open source way of adapting is that it's done communally. Unlike closed source software, which is often designed by one vendor, the organizations that are members of an open source project can collaboratively steer the project in the direction they best see fit. As Kubeflow evolves, it will benefit from an open, collaborative decision-making framework.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/kubeflow-evolution

作者：[Jonathan Gershater (Red Hat)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jgershat/users/jgershat
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_communication_team.png?itok=CYfZ_gE7 (Chat bubbles)
[2]: https://www.kubeflow.org/
[3]: https://github.com/kubernetes
[4]: https://ksonnet.io/
[5]: https://blogs.vmware.com/cloudnative/2019/02/05/welcoming-heptio-open-source-projects-to-vmware/
[6]: https://landscape.cncf.io
[7]: https://github.com/coreos/prometheus-operator/tree/master/contrib/kube-prometheus
