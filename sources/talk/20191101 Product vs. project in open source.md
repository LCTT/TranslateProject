[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Product vs. project in open source)
[#]: via: (https://opensource.com/article/19/11/product-vs-project)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)

Product vs. project in open source
======
What's the difference between an open source product and an open source
project? Not all open source is created (and maintained) equal.
![Bees on a hive, connected by dots][1]

Open source is a good thing. Open source is a particularly good thing for security. I've written about this before (notably in [_Disbelieving the many eyes hypothesis_][2] and [_The commonwealth of open source_][3]), and I'm going to keep writing about it. In this article, however, I want to talk a little more about a feature of open source that is arguably both a possible disadvantage and a benefit: the difference between a project and a product. I'll come down firmly on one side (spoiler alert: for organisations, it's "product"), but I'd like to start with a little disclaimer. I am employed by Red Hat, and we are a company that makes money from supporting open source. I believe this is a good thing, and I approve of the model that we use, but I wanted to flag any potential bias early in the article.

The main reason that open source is good for security is that you can see what's going on when there's a problem, and you have a chance to fix it. Or, more realistically, unless you're a security professional with particular expertise in the open source project in which the problem arises, somebody _else_ has a chance to fix it. We hope that there are sufficient security folks with the required expertise to fix security problems and vulnerabilities in software projects about which we care.

It's a little more complex than that, however. As an organisation, there are two main ways to consume open source:

  * As a **project**: you take the code, choose which version to use, compile it yourself, test it, and then manage it.
  * As a **product**: a vendor takes the project, chooses which version to package, compiles it, tests it, and then sells support for the package, typically including docs, patching, and updates.



Now, there's no denying that consuming a project "raw" gives you more options. You can track the latest version, compiling and testing as you go, and you can take security patches more quickly than the product version may supply them, selecting those that seem most appropriate for your business and use cases. On the whole, this seems like a good thing. There are, however, downsides that are specific to security. These include:

  1. Some security fixes come with an [embargo][4], to which only a small number of organisations (typically the vendors) have access. Although you may get access to fixes at the same time as the wider ecosystem, you will need to check and test them (unless you blindly apply them—don't do that), which will already have been performed by the vendors.
  2. The _huge_ temptation to make changes to the code that don't necessarily—or immediately—make it into the upstream project means that you are likely to be running a fork of the code. Even if you _do_ manage to get these upstream in time, during the period that you're running the changes but they're not upstream, you run a major risk that any security patches will not be immediately applicable to your version. (This is, of course, true for non-security patches, but security patches are typically more urgent.) One option, of course, if you believe that your version is likely to consumed by others, is to make an _official_ fork of the project and try to encourage a community to grow around that; but in the end, you will still have to decide whether to support the _new_ version internally or externally.
  3. Unless you ensure that _all_ instances of the software are running the same version in your deployment, any back-porting of security fixes to older versions will require you to invest in security expertise equal (or close to equal) to that of the people who created the fix in the first place. In this case, you are giving up the "commonwealth" benefit of open source, as you need to pay experts who duplicate the skills of the community.



What you are basically doing, by choosing to deploy a _project_ rather than a _product_ is taking the decision to do _internal productisation_ of the project. You lose not only the commonwealth benefit of security fixes but also the significant _economies of scale_ that are intrinsic to the vendor-supported product model. There may also be _economies of scope_ that you miss: many vendors will have multiple products that they support and will be able to apply security expertise across those products in ways that may not be possible for an organisation whose core focus is not on product support.

These economies are reflected in another possible benefit to the commonwealth of using a vendor: The very fact that multiple customers are consuming their products means that vendors have an incentive and a revenue stream to spend on security fixes and general features. There are other types of fixes and improvements on which they may apply resources, but the relative scarcity of skilled security experts means that the [principle of comparative advantage][5] suggests that they should be in the best position to apply them for the benefit of the wider community.[1][6]

What if a vendor you use to provide a productised version of an open source project goes bust or decides to drop support for that product? Well, this is a problem in the world of proprietary software as well, of course. But in the case of proprietary software, there are three likely outcomes:

  * You now have no access to the software source, and therefore no way to make improvements.
  * You _are_ provided access to the software source, but it is not available to the wider world, and therefore you are on your own.
  * _Everyone_ is provided with the software source, but no existing community exists to improve it, and it either dies or takes significant time for a community to build around it.



In the case of open source, however, if the vendor you have chosen goes out of business, there is always the option to use another vendor, encourage a new vendor to take it on, productise it yourself (and supply it to other organisations), or, if the worst comes to the worst, take the internal productisation route while you search for a scalable long-term solution.

In the modern open source world, we (the community) have gotten quite good at managing these options, as the growth of open source consortia[2][7] shows. In a consortium, groups of organisations and individuals cluster around a software project or a set of related projects to encourage community growth, alignment around feature and functionality additions, general security work, and productisation for use cases that may as yet be ill-defined, all the while trying to exploit the economies of scale and scope outlined above. An example of this would be the Linux Foundation's [Confidential Computing Consortium][8], to which the [Enarx project][9] aims to be contributed.

Choosing to consume open source software as a product instead of as a project involves some trade-offs, but, from a security point of view at least, the economics for organisations are fairly clear: unless you are in a position to employ ample security experts, products are most likely to suit your needs.

* * *

1\. Note: I'm not an economist, but I believe that this holds in this case. Happy to have comments explaining why I'm wrong (if I am…).

2\. "Consortiums" if you _really_ must.

* * *

_This article was originally published on [Alice, Eve, and Bob][10] and is reprinted with the author's permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/product-vs-project

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_bees_network.png?itok=NFNRQpJi (Bees on a hive, connected by dots)
[2]: https://opensource.com/article/17/10/many-eyes
[3]: https://opensource.com/article/17/11/commonwealth-open-source
[4]: https://aliceevebob.com/2018/01/09/meltdown-and-spectre-thinking-about-embargoes-and-disclosures/
[5]: https://en.wikipedia.org/wiki/Comparative_advantage
[6]: tmp.ov8Yhb4jS4#1
[7]: tmp.ov8Yhb4jS4#2
[8]: https://confidentialcomputing.io/
[9]: https://enarx.io/
[10]: https://aliceevebob.com/2019/10/15/of-projects-products-and-security-community/
