[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Kubernetes communication, SRE struggles, and more industry trends)
[#]: via: (https://opensource.com/article/19/10/kubernetes-sre-more-industry-trends)
[#]: author: (Tim Hildred https://opensource.com/users/thildred)

Kubernetes communication, SRE struggles, and more industry trends
======
A weekly look at open source community and industry trends.
![Person standing in front of a giant computer screen with numbers, data][1]

As part of my role as a senior product marketing manager at an enterprise software company with an open source development model, I publish a regular update about open source community, market, and industry trends for product marketers, managers, and other influencers. Here are five of my and their favorite articles from that update.

## [Review of pod-to-pod communications in Kubernetes][2]

> In this article, we dive into pod-to-pod communications by showing you ways in which pods within a Kubernetes network can communicate with one another.
>
> While Kubernetes is opinionated in how containers are deployed and operated, it is very non-prescriptive of how the network should be designed in which pods are to be run. Kubernetes imposes the following fundamental requirements on any networking implementation (barring any intentional network segmentation policies)

**The impact**: Networking is one of the most complicated parts of making computers work together to solve our problems. Kubernetes turns that complexity up to 11, and this article dials it back down to 10.75.

## [One SRE's struggle and success to improve Infrastructure as Code][3]

> Convergence is our goal because we expect our infrastructure to reach a desired state over time expressed in the code. Software idempotence means software can run as many times as it wants and unintended changes don’t happen. As a result, we built an in-house service that runs as specified to apply configurations in source control. Traditionally, we’ve aimed for a masterless configuration design so our configuration agent looks for information on the host.

**The impact**: I've heard it said that the [human element][4] is the most important element of any digital transformation. While I don't know that the author would use that term to describe the outcome he was after, he does a great job of showing that it is not automation for automation's sake we want but rather automation that makes a meaningful impact on the lives of the people it supports.

## [Why GitHub is the gold standard for developer-focused companies][5]

> Now, with last year’s purchase by Microsoft supporting them, it is clear that GitHub has a real opportunity to continue building out a robust ecosystem, with billion dollar companies built upon what could turn into a powerful platform. Is GitHub the next ecosystem success story? In a word, yes. At my company, we bet on GitHub as a successful platform to build upon from the very start. We felt it was the place to build our solution if we wanted to streamline project management and keep software teams close to the code.

**The impact**: It is one of the great ironies of open source that the most popular tool for open source development is not itself open source. The only way this works is if that tool is so good that open source developers are willing to overlook that inconsistency.

## [KubeVirt joins Cloud Native Computing Foundation][6]

> This month the Cloud Native Computing Foundation (CNCF) formally adopted [KubeVirt][7] into the CNCF Sandbox. KubeVirt allows you to provision, manage and run virtual machines from and within Kubernetes. In joining the CNCF Sandbox, KubeVirt now has a more substantial platform to grow as well as educate the CNCF community on the use cases for placing virtual machines within Kubernetes. The CNCF onboards projects into the CNCF Sandbox when they warrant experimentation on neutral ground to promote and foster collaborative development.

**The impact**: The convergence of containers and virtual machines is clearly a direction vendors think is valuable. Moving this project to the CNCF gives a way to see whether this idea is going to be as popular with users and customers as vendors hope it will be.

_I hope you enjoyed this list of what stood out to me from last week and come back next Monday for more open source community, market, and industry trends._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/kubernetes-sre-more-industry-trends

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://superuser.openstack.org/articles/review-of-pod-to-pod-communications-in-kubernetes/
[3]: https://thenewstack.io/one-sres-struggle-and-success-to-improve-infrastructure-as-code/
[4]: https://devops.com/the-secret-to-digital-transformation-is-human-connection/
[5]: https://thenextweb.com/podium/2019/10/02/why-github-is-the-gold-standard-for-developer-focused-companies/
[6]: https://blog.openshift.com/kubevirt-joins-cloud-native-computing-foundation/
[7]: https://kubevirt.io/
