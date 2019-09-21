What's the difference between a fork and a distribution?
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/spoons_forks_520x292_jh.png?itok=DzEzZBuG)

If you've been around open source software for any length of time, you'll hear the terms fork and distribution thrown around casually in conversation. For many people, the distinction between the two isn't clear, so here I'll try to clear up the confusion.

### First, some definitions

Before explaining the nuances of a fork vs. a distribution and the pitfalls thereof, let's define key concepts.

**[Open source software][1]** is software that:

  * Is freely available to distribute under certain [license][2] restraints
  * Permits its source code to be viewable and modified under certain license restraints



Open source software can be **consumed** in the following ways:

  * Downloaded in binary or source code format, often at no charge (e.g., the [Eclipse developer environment][3])
  * As a distribution (product) by a vendor, sometimes at a cost to the user (e.g., [Red Hat products][4])
  * Embedded into proprietary software solutions (e.g., some smartphones and browsers display fonts using the open source [freetype software][5])



**Free and open source (FOSS)** is not necessarily  "free" as in "zero cost." Free and open source simply means the software is free to distribute, modify, study, and use, subject to the software's licensing. The software distributor may attach a purchase price to it. For example, Linux is available at no cost as Fedora, CentOS, Gentoo, etc. or as a paid distribution as Red Hat Enterprise Linux, SUSE, etc.

**Community** refers to the organizations and individuals that collaboratively work on an open source project. Any individual or organization can contribute to the project by writing or reviewing code, documentation, test suites, managing meetings, updating websites, etc., provided they abide by the license. For example, at [Openhub.net][6], we see government, nonprofit, commercial, and education organizations [contributing to some open source projects][7].

**project** is the result of this collaborative development, documentation, and testing. Most projects have a central repository where code, documentation, testing, and so forth are developed.

An open sourceis the result of this collaborative development, documentation, and testing. Most projects have a central repository where code, documentation, testing, and so forth are developed.

A **distribution** is a copy, in binary or source code format, of an open source project. For example, CentOS, Fedora, Red Hat Enterprise Linux, SUSE, Ubuntu, and others are distributions of the Linux project. Tectonic, Google Kubernetes Engine, Amazon Container Service, and Red Hat OpenShift are distributions of the Kubernetes project.

Vendor distributions of open source projects are often called **products** , thus Red Hat OpenStack Platform is the Red Hat OpenStack product that is a distribution of the OpenStack upstream project—and it is still 100% open source.

The **trunk** is the main workstream in the community where the open source project is developed.

An open source **fork** is a version of the open source project that is developed along a separate workstream from the main trunk.

Thus, **a distribution is not the same as a fork**. A distribution is a packaging of the upstream project that is made available by vendors, often as products. However, the core code and documentation in the distribution adhere to the version in the upstream project. A fork—and any distribution based on the fork—results in a version of the code and documentation that are different from the upstream project. Users who have forked upstream open source code have to maintain it on their own, meaning they lose the benefit of the collaboration that takes place in the upstream community.

To further explain a software fork, let's use the analogy of migrating animals. Whales and sea lions migrate from the Arctic to California and Mexico; Monarch butterflies migrate from Alaska to Mexico; and (in the Northern Hemisphere) swallows and many other birds fly south for the winter. The key to a successful migration is that all animals in the group stick together, follow the leaders, find food and shelter, and don't get lost.

### Risks of going it on your own

A bird, butterfly, or whale that strays from the group loses the benefit of remaining with the group and knowing where to find food, shelter, and the desired destination.

Similarly, users or organizations that fork and modify an upstream project and maintain it on their own run the following risks:

  1. **They cannot update their code based on the upstream because their code differs.** This is known as technical debt; the more changes made to forked code, the more it costs in time and money to rebase the fork to the upstream project.
  2. **They potentially run less secure code.** If a vulnerability is found in open source code and fixed by the community in the upstream, a forked version of the code may not benefit from this fix because it is different from the upstream.
  3. **They might not benefit from new features.** The upstream community, using input from many organizations and individuals, creates new features for the benefit of all users of the upstream project. If an organization forks the upstream, they potentially cannot incorporate the new features because their code differs.
  4. **They might not integrate with other software packages.** Open source projects are rarely developed as single entities; rather they often are packaged together with other projects to create a solution. Forked code may not be able to be integrated with other projects because the developers of the forked code are not collaborating in the upstream with other participants.
  5. **They might not certify on hardware platforms.** Software packages are often certified to run on hardware platforms so, if problems arise, the hardware and software vendors can collaborate to find the root cause or problem.



In summary, an open source distribution is simply a packaging of an upstream, multi-organizational, collaborative open source project sold and supported by a vendor. A fork is a separate development workstream of an open source project and risks not being able to benefit from the collaborative efforts of the upstream community.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/forks-vs-distributions

作者：[Jonathan Gershater][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jgershat
[1]:https://opensource.com/resources/what-open-source
[2]:https://opensource.com/tags/licensing
[3]:https://www.eclipse.org/che/getting-started/download/
[4]:https://access.redhat.com/downloads
[5]:https://www.freetype.org/
[6]:http://openhub.net
[7]:https://www.openhub.net/explore/orgs
