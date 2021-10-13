[#]: subject: "Going to market with an open source product"
[#]: via: "https://opensource.com/article/21/10/open-source-product-market"
[#]: author: "Scott McCarty https://opensource.com/users/fatherlinux"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Going to market with an open source product
======
The role of product marketing and planned messaging in a successful
release.
![a handshake ][1]

This article is the sixth in a series on product management in an open source supply chain. In the previous articles, I covered the following topics:

  * [Open source as a supply chain][2]
  * [What a product is][3]
  * [What product managers do][4]
  * [Differentiating products from projects][5]
  * [Managing the open source product roadmap][6]



In this article, we'll focus on the intersection of open source and product marketing.

### What is product marketing?

Many people with a long career in engineering, including me, have had misconceptions about sales and marketing. As an engineering community, we've viewed it as things like ordering swag, naming things, running ad campaigns, and creating white papers. There's a joke in the marketing community about how engineers are always willing to provide their "opinions" on marketing decisions without fully comprehending the discipline, but marketers rarely—like never—make suggestions on code improvements. To work together, engineers and marketers must share a common definition.

While product marketers do help drive those commonly recognized tasks, the role is so much richer. Product marketers, technical marketers, and evangelists have outbound responsibilities like creating content (e.g., blogs, press releases, white papers, demos), delivering roadmap sessions to customers (as well as analysts and journalists), building content for sales teams, and much more. Combined, these outbound functions are often referred to as getting a product to market, but just as importantly, product marketing also has inbound functions. They serve as another set of eyes and ears to listen for customer needs and provide input to the product strategy. There's a saying in product management: nothing interesting happens within these four walls. Businesses must go out into the world, talk to customers, and more importantly, listen to them.

In smaller organizations, the product manager is often responsible for all inbound and outbound work. In larger organizations, these functions are often broken down into product management and product marketing management. Sometimes, the roles are even broken down into technical marketing and evangelist functions. Combined, these roles, as well as the architect (an engineering function) and User Exerperience (UX) person, are often referred to as the product team. While product marketing is usually responsible for going to market, there is a collaborative role to be played by all product team members. This collaboration is essential, especially in the context of an open source supply chain.

### Product marketing and open source

There are many focus areas defined in different product marketing frameworks (e.g., [Pragmatic Framework][7] or [The 4 Ps][8]). Because this series is focused specifically on enterprise and cloud software products in the context of an open source supply chain, we'll explore the following functions of product marketers:

  * **Positioning and messaging:** This is an agreed-upon methodology for how your company will talk about your product and where it fits into a marketplace. The goal is to make it easy for customers to understand where your product is strong.
  * **Buyer and user personas:** Slightly different from engineering personas, these are a generalized description of what typical customers care about and why. They help align everyone in the organization to meet the buyer's needs.
  * **Marketing plan:** This describes the strategies and tactics a product team will use to make people aware of the technology and how buyers will be acquired.
  * **Launch:** The release of code and the launch of a product are two distinctly different things. The release makes the code, binaries, or service available. The launch focuses on when, where, how, and how much the product is discussed in the marketplace.
  * **Sales alignment:** Product sales are a lot more efficient when sales, marketing, and even engineering teams talk about a product and its technology in the same way. Typically, this is a role of product marketing.
  * **Content:** This includes blogs, presentations, and other forms of content focused on customers, partners, journalists, analysts and even open source community members.



A deep dive into each of these areas is beyond the scope of this blog series, but it's important to understand how product marketing fits into the product team, especially in the context of open source. Activity in the upstream supply chain may inform, but it does not dictate how product marketers communicate the value of their products. The upstream can extend [thought leadership][9] and drive technology adoption, but it's not a sales funnel per se.

Consider my previous analogy on laundry detergent ([open source as awareness][4]); just because OxiClean provides value as a great stain remover in a multi-purpose spray cleaner doesn't mean that every user of this multi-purpose spray cleaner is a good lead for your laundry detergent. When someone is shopping for laundry detergent, being aware of the OxiClean technology might make them more interested, but people buy laundry detergent for different reasons than they buy multi-purpose spray cleaners. Think about this a few times and let it sink in.

Product marketers are responsible for selling the product, not the supply chain. The supply chain just provides awareness for which technologies are effective at solving technical problems.

For example, Kubernetes is a great technology and a great upstream project. Any customer interested in running containers at scale is probably aware of this technology. However, some customers are looking for a very general-purpose, hosted solution where somebody else runs it for them. Other potential customers are interested in building a highly customized solution on premise with tight security controls. These two buyers are buying for different reasons, but they're both going to notice the name Kubernetes. Kubernetes is good for awareness, but it's not a sales funnel. You can't sell a customer who wants a hosted service an on-premise solution, or vice versa.

As mentioned in a previous article, ["What do open source product teams do?,"][4] product marketers need to be careful not to treat the open source supply chain as a cheap or free marketing funnel. This is a huge pitfall. Another pitfall is making the "community edition" free for personal use. That's not good for potential customers, and it's not good for building a community either. The methodology of [working backward][10] from customer needs is a great way to avoid these pitfalls.

### Working Backward

Working backward from the customer requires capturing the most important information about the product, including why a customer would care and, in turn, why salespeople and partners should care. This helps naturally align everyone's understanding of your product. Working backward will naturally highlight the gaps between the product and the upstream supply chain. Stated another way, when working backward, it will be extremely obvious where upstream projects alone do not provide everything that a paying customer needs (e.g., a hosted Kubernetes solution).

Working backward is often described as writing the press release first. A press release is just one of many types of documents product teams use. Similar documents include, but are not limited to:

  * Core messaging documents
  * Positioning documents
  * Messaging documents
  * Positioning and messaging (P&amp;M) documents



As when creating the [open source product roadmap][6], don’t get caught up in the tool; think about the importance of the process itself. For example, there are many different templates for P&amp;M documents, and different teams often make up their own fields. Some P&amp;M documents go deeper and explore the differences between personas or other factors. The actual fields and technical depth will vary by team, but the process is the same. Work backward from the customer.

#### Positioning and messaging document

The positioning and messaging document ties all of these things together around a coherent framework. Not every product team builds this document, but it's a methodology that forces the product team to think deeply about what they are trying to achieve, why, and for who. Building this document illuminates the mission of the product, which helps align everyone from the upstream suppliers to the salespeople.

Here's [a positioning and messaging document template][11] you can use as a base on Google Docs.

![A blank template of a product messaging and positioning document][12]

(Scott McCarty, [CC BY-SA 4.0][13])

### Pitfalls

Companies participate in open source for all kinds of reasons, many of which are flawed (see ["Open source goal setting"][14] for good ones). For example, transparency is absolutely a good reason, but it's not the only reason to participate in open source. A better reason is the community-driven aspect of open source. This is a better investment for every dollar spent on developing a technology, because other people are helping you build it for free (see also ["Why Red Hat is investing in CRI-O and Podman"][15]).

Open source is not free marketing. Treating open source as discount or free marketing is a strategy for failure. You must differentiate your product's mission from the upstream mission. General Motors, Volkswagen, Toyota, and Tesla do not sell cars because they advertise what robots they use to build the cars, which brand of steel they use, or which LED bulbs they use.

The combination of all the choices made by the product team is what differentiates a product. Product teams, especially product marketing teams, must understand this with complete clarity. Every dollar they spend on highlighting supplier value is a dollar they don't spend on highlighting product value.

That said, the product team should absolutely think holistically about the value chain from suppliers to the product. Understanding the value provided by the suppliers is a significant component in the product value. Stay focused on customer needs and work backward. Don't start at the suppliers and work forwards.

### Conclusions

Though I've covered a lot of material, this article still hasn't scratched the surface of marketing as a discipline—really, multiple disciplines (digital, content, product, brand, ads, etc.). Product marketers and managers need to work backward, from the customer's need to the product, even with open source software. They must focus on capabilities and features that the customer will feel good about paying for. Product managers and marketers shouldn't fall into the trap of treating open source as a funnel for their product.

[][16]

pm_twitter.png

![A tweet from Steven Walli about projects and products in open source][17]

(Scott McCarty, [CC BY-SA 4.0][13])

Next time you're reading marketing material for an open source product, pay attention to the positioning and messaging, and try to infer which persona they're talking to. If something isn't making sense to you, it might be because it's not targeted at you! It might also be because the marketing team is making the mistake of focusing on what an upstream project does instead of their product.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/open-source-product-market

作者：[Scott McCarty][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/handshake_business_contract_partner.png?itok=NrAWzIDM (a handshake )
[2]: https://opensource.com/article/20/10/open-source-supply-chain
[3]: https://opensource.com/article/20/10/defining-product-open-source
[4]: https://opensource.com/article/20/11/open-source-product-teams
[5]: https://opensource.com/article/21/2/differentiating-products-upstream-suppliers
[6]: https://opensource.com/article/21/9/open-source-product-roadmap
[7]: https://pragmaticinstitute.com/product/framework/
[8]: https://www.investopedia.com/terms/f/four-ps.asp
[9]: https://en.wikipedia.org/wiki/Thought_leader
[10]: https://www.productplan.com/glossary/working-backward-amazon-method/
[11]: https://docs.google.com/document/d/1zc9p4IrKNKO7Ry37kBXTckax9Cst78rv-ad8V0ZqMEY/edit
[12]: https://opensource.com/sites/default/files/uploads/pm_sample_template.png (P&M template)
[13]: https://creativecommons.org/licenses/by-sa/4.0/
[14]: https://blog.opentechstrategies.com/2019/05/open-source-goal-setting/
[15]: https://www.redhat.com/en/blog/why-red-hat-investing-cri-o-and-podman
[16]: https://twitter.com/stephenrwalli/status/1147205594966663168
[17]: https://opensource.com/sites/default/files/uploads/pm_twitter.png (Projects vs products)
