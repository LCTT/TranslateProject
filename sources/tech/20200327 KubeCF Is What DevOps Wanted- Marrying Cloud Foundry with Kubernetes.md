[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (KubeCF Is What DevOps Wanted: Marrying Cloud Foundry with Kubernetes )
[#]: via: (https://www.linux.com/articles/kubecf-is-what-devops-wanted-marrying-cloud-foundry-with-kubernetes/)
[#]: author: (Swapnil Bhartiya https://www.linux.com/author/swapnil/)

KubeCF Is What DevOps Wanted: Marrying Cloud Foundry with Kubernetes 
======

[![][1]][2]

There are times when solutions that  seem to compete against each other turn out to be complementary. [This is exactly what happened with Cloud Foundry and Kubernetes. ][3]

“Enterprises have moved on from the debate around Cloud Foundry Application Runtime or PaaS experience versus Kubernetes-based experience, and have opted to adopt both. The PaaS experience that Cloud Foundry offers is about optimizing developer time by allowing them to focus on business problems. Let them focus on the app they’re trying to build, not on the plumbing underneath it,” says Chip Childers, CTO at Cloud Foundry ​Foundation.

“There are plenty of use cases that don’t fit into a PaaS-style architecture. If you look at the breadth of architectures that a typical enterprise deals with, there are tons of applications that you need to just wrap the thing in a container and operate it that way,” he says.

**Integrating Cloud Foundry and Kubernetes **

To incorporate Kubernetes into the Cloud Foundry architecture so Cloud Foundry users can use Kubernetes as an alternative to Diego/Garden to orchestrate application container instances, Cloud Foundry Foundation kickstarted an initiative called [Project Eirini][4].

Similarly, [Project Quarks][5] is another incubating effort within the Cloud Foundry Foundation that is focused on packaging the Cloud Foundry Application Runtime as a set of containers instead of virtual machines, enabling easier deployment to Kubernetes.

“Project Quarks took some code from SUSE called Fizzle. It would take the type of release artifact that our project teams were generally releasing for their component of the system, and work it into a usable Docker image. Then they would use Helm and some scripts to deploy that into Kubernetes,” said Childers.

There was, however, one crucial piece of the jigsaw missing.

“There was this code that SUSE had been working on. It was the basis of the SUSE product called SCF (SUSE Cloud Foundry). SCF became [KubeCF][6]. It creates a Kubernetes native distribution of Cloud Foundry,” reveals Childers.

KubeCF recently hit its 1.0 release. So, where does KubeCF go from here?

“Presenty, we can look at it as the easiest path to a Kubernetes-native Cloud Foundry for pure open search users. There are some other efforts that are happening in parallel that are taking a look at each component of the Cloud Foundry architecture. Project architects are working towards allowing people to take KubeCF, deploy the whole system to Kubernetes, and take advantage of the simplicity that gets enabled as code gets modified,” says Childers.

**Developers First: Ensuring Seamless UX**

One of the strengths of the Cloud Foundry community is that it has always offered a distribution. There is still a distribution called CF deployment, which is based on a VM-centric architecture that uses the Cloud Foundry BOSH platform to orchestrate infrastructures and service environments (or virtualized environments like V-sphere) to deploy VMs and then run the system on top of it.

However, distribution also entails members of the ecosystem packaging it or dictating with their own offerings. In such a scenario, how can developers expect consistency across the distros?

“The commonality between both upstream releases — the CF deployment and KubeCF — lies in the components that they sew together to create the Cloud Foundry platform. The Cloud Foundry Platform certification continues to be based on the idea that a certified distribution uses those components in an unmodified way, and integrates them to create that developer experience,” Childers explains.

“So, regardless of whether you’re deploying to Kubernetes or you’re deploying to virtual machines, regardless of the certified vendor that you use, or if you use upstream distributions, you should have that same developer experience. That’s what Platform Certification ensures,” he says.

Operational consistency is less a concern for the ecosystem and the community because many of these providers are offering it as a service. “Those that do it as subscription-based software delivery have a lot of tooling around operations that’s specific to them plus all of the other values that they bring together,” Childers avers.

**Evolution Unabated**

The KubeCF distribution has finally put the debate of ‘Do I use Kubernetes or do I use Cloud Foundry?’ to rest.

“The answer should’ve always been ‘You use both.’ The architecture fits one on top of the other very nicely, and overcomes the concerns of dual stacks,” says Childers.

With the ‘either-or’ debate over, Chip intends to further evolve this architecture, thereby offering an enormous amount of value to enterprises trying to deal with container-centric infrastructure management and developer productivity.

“We’ve completely re-converged as an ecosystem around embracing the Kubernetes-based infrastructure as being the most popular and rising approach. We’ve been evolving this architecture as a community for years now,” he says.

“There are huge engineering and commercial teams supporting Kubernetes. VMware has an enormous investment in Kubernetes, and it continues to increase that investment. With the acquisition of Pivotal, VMware also has a huge amount of investment in Cloud Foundry. It’s working aggressively on the mission of bringing the two together. We see the same traction with SAP, IBM, and SUSE, which presents a lot of opportunities for everybody,” adds Childers.

--------------------------------------------------------------------------------

via: https://www.linux.com/articles/kubecf-is-what-devops-wanted-marrying-cloud-foundry-with-kubernetes/

作者：[Swapnil Bhartiya][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/swapnil/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2020/03/color-3580779_1920-1068x667.jpg (color-3580779_1920)
[2]: https://www.linux.com/wp-content/uploads/2020/03/color-3580779_1920.jpg
[3]: https://www.tfir.io/kubecf-a-kubernetes-native-distribution-of-cloud-foundry-chip-childers-cto-cloud-foundry-%e2%80%8bfoundation/
[4]: https://www.cloudfoundry.org/project-eirini/
[5]: https://www.cloudfoundry.org/project-quarks/
[6]: https://github.com/cloudfoundry-incubator/kubecf
