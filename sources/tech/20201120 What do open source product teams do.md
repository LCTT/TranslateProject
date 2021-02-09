[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What do open source product teams do?)
[#]: via: (https://opensource.com/article/20/11/open-source-product-teams)
[#]: author: (Scott McCarty https://opensource.com/users/fatherlinux)

What do open source product teams do?
======
Product managers play an essential role in creating differentiated value
that customers will pay for.
![a checklist for a team][1]

If you go to any hip product management conference, you'll hear about product teams. At a minimum, a product team has a product manager, but it often includes roles in marketing, technical architecture, and even user experience (UX). Previous articles in this series have covered [open source as a supply chain model][2] and [defining products in the open source software supply chain][3], and this article specifically focuses on the role of product management within the product team.

### Who's on the product team?

Product managers and product marketing managers are the two most common product management roles, but product management can be further split into any number of roles, including competitive analysis, business strategy, sales enablement, revenue growth, content creation, sales tools, and more. With a very large product, even the product management role may be broken up into separate roles. You may even hear titles like technical marketing manager, product evangelist, and business owner, not to mention people-management roles for groups of individual contributor roles. For the purpose of this article, I refer to all of these roles collectively as "product management."

Product management is a [tough career][4], and there are many frameworks for learning and understanding it. One of the oldest and most mature is the [Pragmatic Framework][5], which defines 37 different areas of responsibility. The Pragmatic Framework is a bit too complex for this article. Instead, I'll emphasize a subset of tasks that are applicable in open source products:

  * **Market problems:** Talk to customers and figure out what they need
  * **Product roadmap:** Determine what features will be added to the product and when
  * **Build:** Invest in building technology in-house
  * **Buy:** Purchase technology from another company
  * **Partner:** Deliver a solution to a customer by leveraging a partner's technology
  * **Pricing:** Determine the price
  * **Packaging:** Determine what's included in the price
  * **Channel training:** Train the salespeople so that they can educate potential customers



The rest of this series will look into how these different roles affect and are affected by an open source supply chain.

### Build, buy, or partner?

Which is more important, the business need or the technology? This is probably the classic paradox of business strategy. The answer is neither. Execution is what matters. The product management team is tasked with creating and retaining customers. This can be done by building technology, buying technology, or partnering to acquire technology or services that, when combined, provide value to customers. For example, if customers need an encryption feature that's missing from a software product, the product manager can:

  * Ask engineering to build it, test it, document it, and maintain it.
  * Influence the executive team to buy a company or software package that provides it. (However, less than 2% of product managers have access to P&amp;L data, [much less the budget to buy companies][6].)
  * Deliver it to the customer through a verified partner. If a partner already provides a solution, this is the quickest way to deliver a solution, but it could raise the product's price or require the customer to purchase additional software.



With traditional proprietary software products and services, this could mean building, buying, or partnering for a foundational piece of software, like a database. With products built on open source software, this can be thought of as choosing an open source project as a supplier. The purchase is made by contributing engineering time, code, documentation, testing, infrastructure, etc. Because open source is not free as in beer, somebody has to write it, test it, document it, etc. It's very difficult to provide value to customers if you don't contribute upstream.

This combination of built, bought, and partner-delivered capabilities is what differentiates a product, whether open source or proprietary. Proprietary licensing does not differentiate a product. Let me repeat: _proprietary licensing does not differentiate a product_. People confuse proprietary licensing with providing value to a customer. Proprietary licenses are a perfectly valid and useful way to monetize users, but they do not provide customers with more value. Licenses do not create value; they help extract it. If you believe [open core][7] or hybrid licensing are the only way to make money with open source, read this paragraph five times until it sinks in (hint, focus on creating value).

Both open source and proprietary products must create value. Customers buy capabilities as part of a solution (i.e., new things they couldn't do before). If product management spends more brainpower on delivering capabilities than determining what can be held back with proprietary licensing, the customer will be happier, more loyal, and receive more value.

### Types of products built on open source

Most modern software products are delivered by adding new value to the value provided by the open source supply chain. This could include extra downstream testing, documentation, quality engineering, performance testing, security testing, industry certifications, a partner ecosystem, training, professional services, or even extra proprietary code not included upstream (open core). By considering this new model, many of the old debates about open source can be clarified:

  * **Open source products:** The entire supply chain of code that goes into the product is open source. This can include multiple upstream projects like enterprise Linux distributions or sophisticated products like [Red Hat Satellite][8] or [OpenShift][9].
  * **Open core products:** Some of the supply chain of code that goes into the product is open source while other parts are proprietary. This mix of licensing can be used to control pricing, packaging, and distribution. It can also have the downside of putting engineering contributions to the product at odds with the open source supply chain (see _[Goodbye open core—good riddance to bad rubbish][10]_).
  * **Paid software-as-a-service products:** The supply chain of SaaS products can be made up of open source languages and libraries, while the business logic built in-house is often proprietary. This allows product managers to tightly control pricing and packaging through very measurable distribution channels. There are many examples of online companies using this model, including customer resource management platforms, databases, caching layers, identity management, document management, and office and email solutions.
  * **Free SaaS products:** The supply chain of free SaaS products (e.g., Facebook, Google Search, YouTube, etc.) is essentially the same as paid SaaS products. Instead of tightly controlling the pricing and packaging, the product is monetized through user data or advertisements.
  * **Cloud providers vs. software vendors:** The recent interest in and creation of new quasi-open source licenses like the [Server Side Public License][11], [Redis Source Available License][12], or [PolyForm][13] are better understood by thinking of open source as a supply chain and SaaS as a pricing and packaging model. These new licenses exert some control on how buyers from the open source supply chain can price and package their products (e.g., limiting how a large cloud provider can deliver a service built on freely available code and binaries). This is not unheard of, even in traditional manufacturing supply chains. It's a defensive play because these licenses don't deliver new value to customers.
  * **Open source as awareness:** In this model, the buzz around the upstream project is used to deliver awareness for the products built on it. In marketing, awareness of a technology is a critical first step for having a product's customers build on it. For example, if users are aware of and believe in Kubernetes, they are potential customers for products built on Kubernetes; when people looking for a Kubernetes solution hear that your product is built on Kubernetes, they immediately become potential customers. In a way, this is similar to Lenovo laptops advertising "Intel inside" or [Arm &amp; Hammer laundry detergent advertising OxiClean][14] as part of their supply chain. If you like OxiClean, you'll love Arm &amp; Hammer detergent.
  * **Open core as marketing:** This goes a step further than open source as awareness. A single vendor almost always controls the upstream open source projects that go into open core products. They attempt to use the supply chain, often unsuccessfully, to generate market awareness in what's perceived to be free or inexpensive marketing and lead generation. Open core products advertise that they include the open source project to provide core value propositions. Going back to the Arm &amp; Hammer example: If you like open source, you'll love our proprietary software with open source goodness inside.



### The supply chain

Continuing the analogy from my [last article][3], when General Motors develops a car, the product team doesn't tell Bosch what fuel injectors they want. They tell Bosch how much power the new vehicle will generate, how much towing capacity it needs to have, etc. They give Bosch a set of technical requirements. Then Bosch provides GM with a fuel-injection solution that not only includes the fuel injectors but also the wiring harnesses and perhaps even software that makes it run. It's cheaper and often better quality to rely on a supply chain for components that are shared among virtually every vehicle in the marketplace.

Like an automobile, the sum of a software product is greater than the individual parts. When a manufacturer delivers a car, it's more than the braking, steering, power plant, infotainment system, financing, and mechanical service program. It has an associated brand, build quality, reliability, and an experience. Most of the parts aren't differentiated between vendors. Software products, especially ones built on an open source supply chain, are no different. Product management needs to differentiate their products from the underlying software components in the supply chain. The value of a software product is a layer of differentiation built on top of a supply chain of dependencies. This value is what product management must focus on.

### Differentiated value

Product management is not about picking and choosing what bugs are fixed upstream or downstream. It's not about holding back enough value in the open source project so that users purchase the product. It's not about coming up with special licenses to monetize an open source project's user base. It's about creating differentiated value that customers will pay for. It's about listening to their needs, internalizing them, and knowing them intimately. It's about influencing a supply chain, switching supply chains, and building a partner ecosystem that gives your product gravity.

Product managers who think about differentiated value on top of an open source supply chain can easily answer the following questions:

  * As an open source product manager, should I attend conferences for the upstream projects? _Sure, because it's like attending a trade show for one of your suppliers._
  * How should product management handle a situation where the upstream project isn't delivering what their customers need? _Add more investment. If the open source community is healthy, it will produce what you need._
  * What should product management do when an upstream community is struggling with contributions or is unhealthy? _The same thing that a manufacturer would do if their supplier lost contracts with their two biggest competitors because they were failing: switch suppliers._



In the next article, I will delve into the distinct value created in products, focusing on the value that upstream projects can't provide. If product management is done well, there is no unnatural tension between upstream suppliers and downstream products. When done right, both the upstream projects and downstream products create unique and differentiated value that satisfies the needs of users and customers alike.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/open-source-product-teams

作者：[Scott McCarty][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk (a checklist for a team)
[2]: https://opensource.com/article/20/10/open-source-supply-chain
[3]: https://opensource.com/article/20/10/defining-product-open-source
[4]: https://www.mindtheproduct.com/forget-product-management-tough-career/
[5]: https://www.pragmaticinstitute.com/framework
[6]: http://developmentcorporate.com/2019/04/02/the-myth-of-the-product-management-pl/
[7]: https://medium.com/open-consensus/2-open-core-definition-examples-tradeoffs-e4d0c044da7c
[8]: https://en.wikipedia.org/wiki/Satellite_(software)
[9]: https://en.wikipedia.org/wiki/OpenShift
[10]: https://medium.com/@adamhjk/goodbye-open-core-good-riddance-to-bad-rubbish-ae3355316494
[11]: https://www.mongodb.com/licensing/server-side-public-license
[12]: https://redislabs.com/wp-content/uploads/2019/03/Redis-Source-Available-License-PDF-2.pdf
[13]: https://polyformproject.org/licenses/
[14]: https://www.armandhammer.com/laundry/liquid-laundry-detergent/liquid-laundry-detergent/plus-oxiclean-with-fade-defense-liquid-laundry-detergent
