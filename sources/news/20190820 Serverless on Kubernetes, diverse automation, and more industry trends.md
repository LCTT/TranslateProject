[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Serverless on Kubernetes, diverse automation, and more industry trends)
[#]: via: (https://opensource.com/article/19/8/serverless-kubernetes-and-more)
[#]: author: (Tim Hildred https://opensource.com/users/thildred)

Serverless on Kubernetes, diverse automation, and more industry trends
======
A weekly look at open source community and industry trends.
![Person standing in front of a giant computer screen with numbers, data][1]

As part of my role as a senior product marketing manager at an enterprise software company with an open source development model, I publish a regular update about open source community, market, and industry trends for product marketers, managers, and other influencers. Here are five of my and their favorite articles from that update.

## [10 tips for creating robust serverless components][2]

> There are some repeated patterns that we have seen after creating 20+ serverless components. We recommend that you browse through the [available component repos on GitHub][3] and check which one is close to what you’re building. Just open up the repo and check the code and see how everything fits together.
>
> All component code is open source, and we are striving to keep it clean, simple and easy to follow. After you look around you’ll be able to understand how our core API works, how we interact with external APIs, and how we are reusing other components.

**The impact**: Serverless Inc is striving to take probably the most hyped architecture early on in the hype cycle and make it usable and practical today. For serverless to truly go mainstream, producing something useful has to be as easy for a developer as "Hello world!," and these components are a step in that direction.

## [Kubernetes workloads in the serverless era: Architecture, platforms, and trends][4]

> There are many fascinating elements of the Kubernetes architecture: the containers providing common packaging, runtime and resource isolation model within its foundation; the simple control loop mechanism that monitors the actual state of components and reconciles this with the desired state; the custom resource definitions. But the true enabler for extending Kubernetes to support diverse workloads is the concept of the pod.
>
> A pod provides two sets of guarantees. The deployment guarantee ensures that the containers of a pod are always placed on the same node. This behavior has some useful properties such as allowing containers to communicate synchronously or asynchronously over localhost, over inter-process communication ([IPC][5]), or using the local file system.

**The impact**: If developer adoption of serverless architectures is largely driven by how easily they can be productive working that way, business adoption will be driven by the ability to place this trend in the operational and business context. IT decision-makers need to see a holistic picture of how serverless adds value alongside their existing investments, and operators and architects need to envision how they'll keep it all up and running.

## [How developers can survive the Last Mile with CodeReady Workspaces][6]

> Inside each cloud provider, a host of tools can address CI/CD, testing, monitoring, backing up and recovery problems. Outside of those providers, the cloud native community has been hard at work cranking out new tooling from [Prometheus][7], [Knative][8], [Envoy][9] and [Fluentd][10], to [Kubenetes][11] itself and the expanding ecosystem of Kubernetes Operators.
>
> Within all of those projects, cloud-based services and desktop utilities is one major gap, however: the last mile of software development is the IDE. And despite the wealth of development projects inside the community and Cloud Native Computing Foundation, it is indeed the Eclipse Foundation, as mentioned above, that has taken on this problem with a focus on the new cloud development landscape.

**The impact**: Increasingly complex development workflows and deployment patterns call for increasingly intelligent IDEs. While I'm sure it is possible to push a button and redeploy your microservices to a Kubernetes cluster from emacs (or vi, relax), Eclipse Che (and CodeReady Workspaces) are being built from the ground up with these types of cloud-native workflows in mind.

## [Automate security in increasingly complex hybrid environments][12]

> According to the [Information Security Forum][13]’s [Global Security Threat Outlook for 2019][14], one of the biggest IT trends to watch this year is the increasing sophistication of cybercrime and ransomware. And even as the volume of ransomware attacks is dropping, cybercriminals are finding new, more potent ways to be disruptive. An [article in TechRepublic][15] points to cryptojacking malware, which enables someone to hijack another's hardware without permission to mine cryptocurrency, as a growing threat for enterprise networks.
>
> To more effectively mitigate these risks, organizations could invest in automation as a component of their security plans. That’s because it takes time to investigate and resolve issues, in addition to applying controlled remediations across bare metal, virtualized systems, and cloud environments -- both private and public -- all while documenting changes. 

**The impact**: This one is really about our ability to trust that the network service providers that we rely upon to keep our phones and smart TVs full of stutter-free streaming HD content have what they need to protect the infrastructure that makes it all possible. I for one am rooting for you!

## [AnsibleFest 2019 session catalog][16]

> 85 Ansible automation sessions over 3 days in Atlanta, Georgia

**The impact**: What struck me is the range of things that can be automated with Ansible. Windows? Check. Multicloud? Check. Security? Check. The real question after those three days are over will be: Is there anything in IT that can't be automated with Ansible? Seriously, I'm asking, let me know.

_I hope you enjoyed this list of what stood out to me from last week and come back next Monday for more open source community, market, and industry trends._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/serverless-kubernetes-and-more

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://serverless.com/blog/10-tips-creating-robust-serverless-components/
[3]: https://github.com/serverless-components/
[4]: https://www.infoq.com/articles/kubernetes-workloads-serverless-era/
[5]: https://opensource.com/article/19/4/interprocess-communication-linux-networking
[6]: https://thenewstack.io/how-developers-can-survive-the-last-mile-with-codeready-workspaces/
[7]: https://prometheus.io/
[8]: https://knative.dev/
[9]: https://www.envoyproxy.io/
[10]: https://www.fluentd.org/
[11]: https://kubernetes.io/
[12]: https://www.redhat.com/en/blog/automate-security-increasingly-complex-hybrid-environments
[13]: https://www.securityforum.org/
[14]: https://www.prnewswire.com/news-releases/information-security-forum-forecasts-2019-global-security-threat-outlook-300757408.html
[15]: https://www.techrepublic.com/article/top-4-security-threats-businesses-should-expect-in-2019/
[16]: https://agenda.fest.ansible.com/sessions
