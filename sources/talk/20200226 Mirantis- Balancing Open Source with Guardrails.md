[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Mirantis: Balancing Open Source with Guardrails)
[#]: via: (https://www.linux.com/articles/mirantis-balancing-open-source-with-guardrails/)
[#]: author: (Swapnil Bhartiya https://www.linux.com/author/swapnil/)

Mirantis: Balancing Open Source with Guardrails
======

[![][1]][2]

[![][1]][2]

Mirantis, an open infrastructure company that rose to popularity with its OpenStack offering, is now moving into the Kubernetes space very aggressively. [Last year, the company acquired the Docker Enterprise business from Docker.][3] [This week, it announced that they were hiring the Kubernetes experts from the Finnish company Kontena a][4]nd established a Mirantis office in Finland, expanding the company’s footprint in Europe. Mirantis already has a significant presence in Europe due to large customers such as Bosch and [Volkswagen][5].

The Kontena team primarily focused on two technologies. One was a Kubernetes distro called [Pharos][6], which differentiated itself from other distributions by specializing in addressing life cycle management challenges. They had developed some unique capabilities for deployment and for updating Kubernetes itself.

The second product by Kontena is [Lens][6]. “It’s like a Kubernetes dashboard on steroids. In addition to offering the standard dashboard functions, it went multiple steps further by providing a terminal for command line interfacing to nodes and containers, and additional real-time insights, role-based access controls and a number of other capabilities that are currently absent from the Kubernetes dashboard,” said [Dave Van Everen][7], SVP of Marketing at Mirantis.

Everything that Kontena does is open source. These open source projects are already used by hundreds of organizations around the world. “They have a proven track record of contributing valuable technology pieces to the Kubernetes ecosystem, and we saw an opportunity to bring the team on board and capitalized on that opportunity as quickly as we could,” said Van Everen.

Mirantis will integrate many of the technology concepts and benefits from Pharos into its Docker Enterprise offering. With Kontena engineers on board, Mirantis expects to incorporate the best of what Kontena offered into its commercially supported Docker Enterprise and [Kubernetes][8] technology.

With this acquisition, Mirantis has hinted at a very aggressive 2020. The company is weeks away from launching the first Docker Enterprise release since the acquisition. The release brings many new capabilities on top of Docker Enterprise 3.0. The company is working on merging the [Mirantis KaaS][9] capabilities with Docker Enterprise. “We will add new capabilities, including multi-cluster management and continuous automated updates to the Kubernetes that’s already within Docker Enterprise,” said Van Everen.

**What is Mirantis today?**

Mirantis started out as a pure-play OpenStack company, but as the market dynamics changed, the company adjusted its own positioning and bet on CD platforms like Spinnaker and container orchestration technologies like Kubernetes. So, what are they focusing on today?

Van Everen said that Mirantis is definitely embracing Kubernetes as the open standard used by enterprises for modern applications. Kubernetes itself has a massive ecosystem of technologies that a customer needs to leverage. “When we speak about Kubernetes, we speak about full-stack Kubernetes, which includes that ecosystem consisting of a couple dozen components in a typical cluster deployment. Our job as a trusted partner in helping our customers accelerate their path to modern applications is to streamline and automate all of the infrastructure and DevOps tooling supporting their app development lifecycle,” san Van Everen.

In a nutshell, Mirantis is making it easier for customers to use Kubernetes.

Over the years, [Mirantis][10] has gained expertise in IaaS with the work they did on OpenStack. “All of that plays a role in helping companies move faster and become more agile as they’re modernizing their applications. We apply many of those same strengths to the Kubernetes ecosystem,” he said.

Mirantis is also building expertise in continuous delivery platforms like [Argo CD][11] and is offering customers a spectrum of professional services around application modernization, from writing code that is based in microservices architecture, to integrating CI/CD pipelines and modernizing the tooling for CI/CD to better support cloud-native patterns. By supporting Kubernetes technology with app modernization services, Mirantis is helping customers wherever they are in their digital transformation and cloud-native journey.

“All of those things that our services team provides are complementary to the technology. That’s a unique value that only Mirantis can provide to the market, where we can couple open source technologies with strong services to ensure that companies really get the most out of that open source technology and fulfill their ultimate goal, which is to accelerate their pace of innovation,” Van Everen said.

Container networking is a critical piece of the cloud-native world and Mirantis already has expertise in the area, thanks to their work on OpenStack. The company recently joined the Linux Foundation’s [LF Networking project][12] which is home to [Tungsten Fabric][13] (formerly known as OpenContrail), a technology that Mirantis uses for its [OpenStack][14] offerings.

He explains, “While we use Calico for the container networking, Tungsten Fabric would be an important part of the underlying networking supporting Kubernetes deployments. Staying true to our heritage, we want to be involved in the open community and have both a voice and a stake in the direction the communities are moving in.”

[As for the ongoing debate or controversy around two competing service mesh technologies Istio and Linkerd,][15] the company has made its bet on Istio. A few months ago, Mirantis announced a training program for Istio, which was bundled with Mirantis’ KaaS offerings.

“We include Istio as a service mesh by default in child clusters under Mirantis KaaS management. It’ll be used as an ingress with Docker Enterprise initially. Moving forward, we’re still looking at how to best deploy it in a service mesh configuration by default and provide a configurable but still functional default deployment for Istio as a service mesh,” said Van Everen.

It might seem like Mirantis is latching on to the latest hot technologies like OpenStack, [Spinnaker][16], Docker Enterprise, Kubernetes, and Istio to see what sticks. In reality, there is a method to it: the company is going where its customers are going, with the technologies that customers are using. It’s a fine balancing act.

“That’s the type of technology challenge that Mirantis embraces. We are open source experts and continue to provide the greatest flexibility and choice in our industry, but we do it in such a way that there are guardrails in place so that companies don’t end up having something that’s overly complex and unmanageable, or configured incorrectly,” he concluded.

Note: Cross posted to [TFIR][17]

--------------------------------------------------------------------------------

via: https://www.linux.com/articles/mirantis-balancing-open-source-with-guardrails/

作者：[Swapnil Bhartiya][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/swapnil/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2019/09/world-network-1068x713.jpg (world-network)
[2]: https://www.linux.com/wp-content/uploads/2019/09/world-network.jpg
[3]: https://www.youtube.com/watch?v=cBOrVKuomcU&feature=emb_title
[4]: https://containerjournal.com/topics/container-ecosystems/mirantis-acquires-kubernetes-assets-from-kontena/
[5]: https://www.mirantis.com/company/press-center/company-news/volkswagen-group-selects-mirantis-openstack-software-next-generation-cloud/
[6]: https://github.com/kontena
[7]: https://twitter.com/davidvaneveren?lang=en
[8]: https://kubernetes.io/
[9]: https://www.tfir.io/mirantis-launches-kaas-across-bare-metal-public-and-private-clouds/
[10]: https://www.mirantis.com/
[11]: https://argoproj.github.io/argo-cd/
[12]: https://www.linuxfoundation.org/projects/networking/
[13]: https://tungsten.io/
[14]: https://www.openstack.org/
[15]: https://twitter.com/hashtag/istio?lang=en
[16]: https://www.tfir.io/?s=spinnaker
[17]: https://www.tfir.io/mirantis-balancing-open-source-with-guardrails/
