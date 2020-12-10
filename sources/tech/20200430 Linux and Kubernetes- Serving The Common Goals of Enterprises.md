[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux and Kubernetes: Serving The Common Goals of Enterprises)
[#]: via: (https://www.linux.com/articles/linux-and-kubernetes-serving-the-common-goals-of-enterprises/)
[#]: author: (Swapnil Bhartiya https://www.linux.com/author/swapnil/)

Linux and Kubernetes: Serving The Common Goals of Enterprises
======

[![][1]][2]

For [Stefanie Chiras,][3] VP &amp; GM, Red Hat Enterprise Linux (RHEL) Business Unit at [Red Hat][4], aspects such as security and resiliency have always been important for Red Hat. More so, in the current situation when everyone has gone fully remote and it’s much harder to get people in front of the hardware for carrying out updates, patching, etc.

“As we look at our current situation, never has it been more important to have an operating system that is resilient and secure, and we’re focused on that,” she said.

The recently released version of [Red Hat Enterprise Linux (RHEL) 8.2][5] inadvertently address these challenge as it makes it easier for technology leaders to embrace the latest, production-ready innovations swiftly which offering security and resilience that their IT teams need.

RHEL’s embrace of a predictable 6-month minor release cycle also helped customers plan upgrades more efficiently.

“There is value for customers in having predictability of minor releases on a six-month cycle. Without knowing when they were coming was causing disruptions for them. The launch of 8.2 is now the second time we have delivered on our commitment of having minor releases every six months,” said Stefanie Chiras.

In addition to offering security updates, the new version adds insights capabilities and forays into newer areas of innovation.

The upgrade has expanded the earlier capability called ‘Adviser’ dramatically. Additional functionalities such as drift monitoring and CVE coverage allow for a much deeper granularity into how the infrastructure is running.

“It really amplifies the skills that are already present in ops and sysadmin teams, and this provides a Red Hat consultation, if you will, directly into the data center,” claimed Charis.

As containers are increasingly being leveraged for digital transformation, RHEL 8.2 offers an updated application stream of Red Hat’s container tools. It also has new, containerized versions of Buildah and Skopeo.

[Skopeo][6] is an open-source image copying tool, while Buildah is a tool for building Docker- and Kubernetes-compatible images easily and quickly.

RHEL has also ensured in-place upgrades in the new version. Customers can now directly in-place upgrade from version 7 to version 8.2.

Chiras believes Linux has emerged as the go-to-platform for innovations such as Machine Learning, Deep Learning, and Artificial Intelligence.

“Linux has now become the springboard of innovation,” she argued. “AI, machine learning, and deep learning are driving a real change in not just the software but also the hardware. In the context of these emerging technologies, it’s all about making them consumable into an enterprise.”

“We’re very focused on our ecosystem, making sure that we’re working in the right upstream communities with the right ISVs, with the right hardware partners to make all of that magic come together,” Chiras said.

Towards this end, Red Hat has been partnering with multiple architectures for a long time — be it an x86 architecture, ARM, Power, or mainframe with IBM Z. Its partnership with Nvidia pulls in capabilities such as FPGAs, and GPU.

**Synergizing Kubernetes and Linux **

Kubernetes is fast finding favor in enterprises.  So how do Linux and Kubernetes serve the common goals of enterprises?

“Kubernetes is a new way to deploy Linux. We’re very focused on providing operational consistency by leveraging our technology in RHEL and then bringing in that incredible capability of Kubernetes within our OpenShift product line,” Chiras said.

The deployment of Linux within a Kubernetes environment is much more complicated than in a traditional deployment. RHEL, therefore, made some key changes. The company created Red Hat Enterprise Linux CoreOS — an optimized version of RHEL for the OpenShift experience.

“It’s deployed as an immutable. It’s tailored, narrow, and gets updated as part of your OpenShift update to provide consistent user experience and comprehensive security.

The launch of the Red Hat Universal Base Image (UBI) offers users greater security, reliability, and performance of official Red Hat container images where OCI-compliant Linux containers run.

“Kubernetes is a new way to deploy Linux. It really is a tight collaboration but what we’re really focused on is the customer experience. We want them to get easy updates with consistency and reliability, resilience and security. We’re pulling all of that together. With such advancements going on, it’s a fascinating space to watch,” added Chiras.

--------------------------------------------------------------------------------

via: https://www.linux.com/articles/linux-and-kubernetes-serving-the-common-goals-of-enterprises/

作者：[Swapnil Bhartiya][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/swapnil/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2019/12/computer-2930704_1280-1068x634.jpg (computer-2930704_1280)
[2]: https://www.linux.com/wp-content/uploads/2019/12/computer-2930704_1280.jpg
[3]: https://www.linkedin.com/in/stefanie-chiras-9022144/
[4]: https://www.redhat.com/en
[5]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html-single/8.2_release_notes/index
[6]: https://github.com/containers/skopeo
