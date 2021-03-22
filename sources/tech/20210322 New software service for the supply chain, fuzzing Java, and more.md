[#]: subject: (New software service for the supply chain, fuzzing Java, and more)
[#]: via: (https://opensource.com/article/21/3/linux-kubernetes-industry-trends)
[#]: author: (Tim Hildred https://opensource.com/users/thildred)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

New software service for the supply chain, fuzzing Java, and more
======
A look at current open source community and industry trends.
![Person standing in front of a giant computer screen with numbers, data][1]

As part of my role as a principal communication strategist at an enterprise software company with an open source development model, I publish a regular update about open source community, market, and industry trends. Here are some of my and their favorite articles from that update.

## [Linux Foundation announces new open source software signing service][2]

> Without standardization, securing the software supply chain will be almost impossible. It's sigstore backers' hope that they can fix these issues. The goal is worth the effort. As Josh Aas, executive director of the [Internet Security Research Group (ISRG)][3] and [Let's Encrypt][4], said "Securing a software deployment ought to start with making sure we're running the software we think we are. Sigstore represents a great opportunity to bring more confidence and transparency to the open-source software supply chain."

**The impact**: One of the core promises of open source is that "with enough eyes, all bugs are shallow," which is a claim that has been made for the security of the software as well. This effort (and others like it) represent an industry-wide approach to backing up that claim.

## [Fuzzing Java in OSS-Fuzz][5]

> OSS-Fuzz has found [more than 25,000][6] bugs in open source projects using fuzzing. We look forward to seeing how this technique can help secure and improve code written in JVM-based languages.

**The impact**: It is exciting to see what might have been an extra step in the development process being made easy and integral early on. 

## [Linaro to release monthly GNU Toolchain integration builds][7]

> “Linaro’s goal is to empower the Arm ecosystem, making it easier for those with a need for a binary toolchain to have access before an official release", said Mike Holmes, Director of Foundation Technologies at
>  Linaro. “By having access to the monthly GNU Toolchain integration builds, developers can feel more confident that their system will be stable against the future full release.”

**The impact**: This should be an accelerant for developing the ARM ecosystem, which already seems to be growing by leaps and bounds.

## [Top Kubernetes health metrics you must monitor][8]

> Kubernetes is [one of the most popular choices][9] for container management and automation today. A highly efficient Kubernetes setup generates innumerable new metrics every day, making monitoring cluster health quite challenging. You might find yourself sifting through several different metrics without being entirely sure which ones are the most insightful and warrant utmost attention. As daunting a task as this may seem, you can hit the ground running by knowing which of these metrics provide the right kind of insights into the health of your Kubernetes clusters. In this article, we take you through a few Kubernetes health metrics that top our list. 

**The impact**: It's not enough to see the forest for the trees; you need to see the forest _and_ the trees. Kubernetes = forest; health metrics = trees.

_I hope you enjoyed this list and come back next week for more open source community, market, and industry trends._

Starting a new CA is a lot of work. The Internet Security Research Group co-founder and director...

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/linux-kubernetes-industry-trends

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://www.zdnet.com/article/linux-foundation-announces-new-open-source-software-signing-service/#ftag=RSSbaffb68
[3]: https://www.abetterinternet.org/
[4]: https://letsencrypt.org/
[5]: https://security.googleblog.com/2021/03/fuzzing-java-in-oss-fuzz.html (Fuzzing Java in OSS-Fuzz)
[6]: https://bugs.chromium.org/p/oss-fuzz/issues/list?q=-status%3Aduplicate%2Cwontfix&can=1
[7]: https://lwn.net/Articles/848890/
[8]: https://www.cncf.io/blog/2021/03/08/top-kubernetes-health-metrics-you-must-monitor/
[9]: https://enterprisersproject.com/article/2017/10/how-explain-kubernetes-plain-english
