[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (We're all on a journey to cloud-native adoption together)
[#]: via: (https://opensource.com/article/19/11/cloud-native-adoption)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg)

We're all on a journey to cloud-native adoption together
======
The largest gathering of Kubernetes users is happening now. Here's what
they're talking about.
![A sprout in a forest][1]

The Cloud Native Computing Foundation (CNCF) is hosting its core conference for the fifth year running. It’s official title is [KubeCon + CloudNativeCon][2], but it’s most importantly the home for Kubernetes. Adopters, contributors, and Kubernetes-curious attendees add up to a record-breaking 12,000 people.

I attended to cover the show for our community (full disclosure: my ticket was provided as an industry analyst). Here’s what I heard on day 1.

### Keynote on Cloud Native crafting

[Dan Kohn][3], executive director of the CNCF foundation, started the day with a story. His son, an avid Minecraft player, was on the couch with a blank screen on his iPad. When asked why he responded, “I’m hiding from the zombies.”

In a twist that got everyone’s attention, Dan went on to say that enterprise companies are responding the same way to cloud-native adoption.

His take: Enterprise organizations are still playing the game, but they are hiding in the dark as cloud-native adoption rises. They have a fear response similar to his son playing Minecraft of not knowing how to respond to the zombie threat. Dan reinforces that the fears are real. The risk of outages and security breaches are not to be underestimated. And, they feel safe in what is already known.

He eventually provides the reveal: In Minecraft, fear comes from a lack of the right tools to fight to zombies. A player has to learn to craft new tools in order to succeed, and they learn best from those who have crafted before them. In that way, we’re all on a journey to cloud-native adoption together.

> Mine + craft = Minecraft.
>  Dev + Ops = DevOps.
>
> For Minecraft, you must master both mining and crafting to be great at the game. [@dankohn1][4] sees the same for Enterprise. [#KubeCon][5] [pic.twitter.com/sTV7HcBtsB][6]
>
> — Matt Broberg @ #KubeCon (@mbbroberg) [November 19, 2019][7]

That leads us to where we are today. Many have adopted Kubernetes and have grown to trust it over the last five years of growth and adoption. New users can fight their fears by crafting alongside others the open source community. The results will be able to fight off zombies and fear of cloud-native alike.

### Graduations from the CNCF foundation

Part of the mission of the CNCF is to support cloud-native software maturity. They have designed a model to support doing so and outline that in [detail here][8].

![Here's how CNCF Projects mature over time][9]

The model was celebrated as projects which have grown in adoption, maintainer participation, and project health celebrate their graduation which is both a form of technical accountability and a public endorsement for broader adoption.

#### Vitess: cloud-native database

The first project to celebrate graduation today was Vitess. It was described as a database designed specifically for cloud-native environments that provide different guarantees when compared to past architectures like virtual machines. The team behind Vitess proudly talked of its largest adopters, including one who boast 35 million queries per second.

#### Helm reaches 3.0

From early on in the Kubernetes world, projects have been working to make deployments of the same application an automated task. Helm arose from that need, and five years in is the clear de facto standard for how to deploy applications to Kubernetes in a way similar to package management.

The Helm team hit a number of impressive milestones, including the fact they have 1+ million downloads per month. Even more impressively, they have more maintainers now than they have in the entire project's history (29). The release of Helm 3.0 includes some long-desired features from its avid user base, including the removal of a dependency called Tiller. Read more about Helm 3.0 [here][10].

#### Jaeger marks maturity in distributed tracing

Being able to trace errors across [microservices][11] provides administrators and developers with the right information to fix a complex issue. That challenge, called Distributed tracing, was celebrated today with the [graduation of Jaeger][12].

> Jaeger now has 15 active maintainers from four companies, over 1,200 contributors and more than 375 authors of commits and pull requests. It also has more than 9,000 GitHub stars, 10 million Docker Hub pulls, 2,800 Twitter followers and 815 Gitter channel members.

### Out of the dark

KubeCon kicked off with a funny and poignant story calling us all out of the dark and toward the craft of cloud-native. This morning’s keynotes revealed well-adopted projects that are available for use ranging from databases to distributed traces, and they gave us a roadmap to understand their growth. Projects mature in the CNCF model by growing adoption, maintainership, and structure in how the project is run. Many will depend on these endorsements to guide their adoption as they pursue coming out of the dark.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/cloud-native-adoption

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_redwoods2.png?itok=H-iasPEv (A sprout in a forest)
[2]: https://events19.linuxfoundation.org/events/kubecon-cloudnativecon-north-america-2019/
[3]: https://www.dankohn.com/
[4]: https://twitter.com/dankohn1?ref_src=twsrc%5Etfw
[5]: https://twitter.com/hashtag/KubeCon?src=hash&ref_src=twsrc%5Etfw
[6]: https://t.co/sTV7HcBtsB
[7]: https://twitter.com/mbbroberg/status/1196837426745888769?ref_src=twsrc%5Etfw
[8]: https://github.com/cncf/toc/blob/master/process/graduation_criteria.adoc
[9]: https://opensource.com/sites/default/files/uploads/screenshot_from_2019-11-19_12-56-53.png (CNCF Project Maturity Model)
[10]: https://helm.sh/blog/helm-3-released/
[11]: https://opensource.com/downloads/microservices-cheat-sheet
[12]: https://www.cncf.io/announcement/2019/10/31/cloud-native-computing-foundation-announces-jaeger-graduation/
