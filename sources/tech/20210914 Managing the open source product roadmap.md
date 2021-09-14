[#]: subject: "Managing the open source product roadmap"
[#]: via: "https://opensource.com/article/21/9/open-source-product-roadmap"
[#]: author: "Scott McCarty https://opensource.com/users/fatherlinux"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Managing the open source product roadmap
======
A roadmap assures customers that your product will meet their needs, now
and in the future.
![Looking at a map for career journey][1]

In the first four parts of this series on the open source software supply chain, I explored [open source as a supply chain][2], [what a product is][3], [what product managers do][4], and [ways to differentiate open source software products from their upstream projects][5]. In this article, I will discuss the essential elements of a roadmap and how to determine them.

Customers, as well as the sales and marketing teams who talk to them, love a roadmap. It gives them a sense of what is realistic and what is not. The roadmap is also at the heart of a product. Maintaining an up-to-date product roadmap keeps the product team focused on the customer and aligned around delivering what they need. The roadmap communicates both the strategic direction for a product and the company's perspective on problem solving.

What's the difference between the roadmap of a proprietary product and one that's built on an open source supply chain? Not much. Product managers talk to customers, rank their needs, lay out a roadmap, and then figure out how to deliver capabilities by building, buying, and partnering.

Think of the roadmap as the flight plan for the product. The pilot may have to make changes based on weather, health emergencies, or mechanical troubles, but they must always start with a flight plan, or they can't take off. The same is true with products.

### Focusing on market problems

One of the biggest temptations product managers face is losing track of the bigger picture and focusing on the last problem they heard from a customer. Fixating only on the latest problem leads to perpetual changes in objectives, which will wear out engineering teams and partners. A product manager's influence is rooted in trust, trust is rooted in consistent behavior, and consistent behavior is rooted in confidence.

Confidence starts with identifying market problems. When one customer tells you something, it might be a fluke. When 100 customers tell you something, it's a problem. A single product manager likely can't get feedback from 100 customers, so they need to have a system to get input from every place they can: customers, sales folks, other product managers, product marketers, users at conferences, and related sources.

Customers have many kinds of problems, but a market problem is an urgent challenge that your target customers would gladly pay to solve. It is a problem that makes people more likely to purchase your product or to renew if it's a subscription. Solving market problems validated by customer needs drives the creation of your roadmap. Your roadmap will never make everyone happy, but it can help align strategies between your product and the customers that purchase it.

### Managing by influence

Once you've identified realistic problems that your product might solve, you have to figure out how to solve them. These solutions are called features or, in sales, capabilities. A good product manager realizes that features go far beyond technical things built by engineers. Features can absolutely be a piece of code that the engineering team builds, but they could just as easily be something the legal team provides, such as indemnification, or even installation guidance from a services team. These features guide the product roadmap.

So how do product managers deliver on their roadmap? They don't typically write code—and they probably shouldn't—and they don't typically control the budget or sign deals with partners. In fact, they have no direct control over anyone: customers, engineers, partners, journalists, analysts, and especially not competitors. Instead, they have to manage by influence.

When the product team has a set of market problems that have been validated with customers, influencing the necessary people to get a feature implemented is much easier. This is true whether the feature is delivered by an upstream project, downstream engineers, a services team, or the legal team.

Building influence is particularly important with upstream open source suppliers. Some product managers assume they can't control an upstream project, so they think it's easier to ****fork** **the project and change what they need. Don't fork: it's expensive, often lower quality, harder to maintain, and you lose all of the valuable upstream user testing. Just as manufacturers influence their key upstream suppliers, so too should open source product managers get involved with upstream projects, build trust, and use their influence.

### Customers vs. competitors

Copying your competitor is always a temptation. Keeping an eye on competitors is never a bad idea, but do not prioritize that above customers' needs. Instead, target your customers' business problems by speaking with them directly and determining the capabilities they are looking for. If you know you're faster than your competitor, but neither of you solves the business problem, the customer won't pay either of you.

That said, pay attention to competitors' marketing and messaging to potential customers, because it can profoundly affect how customers communicate their problems and the requests they make for features. Sometimes a competitor can convince a customer they have a problem only a feature that is one of the competitor's strengths can solve. Following your competitor's lead is not the way to identify either a market problem or the best feature to solve it. Use competitor activity as input, but do not let it guide your roadmap.

### Committing to and presenting the roadmap

A good product manager knows their product well and loves it. They also know and love their customers. Nothing embodies this more than getting excited while presenting the roadmap. The roadmap is the output of both a product manager's customer conversations and the influence that a product team exerts on behalf of the customer.

A product manager can only commit to a roadmap item once they've done all of the following:

  * Identified a market problem
  * Validated it with multiple customers and other influences
  * Worked with upstream engineering, legal, QE, performance engineering, and other partners to determine that they can solve it
  * Determined a reasonable timeframe to maturity



That's it. That's what it takes to build a roadmap: market need and commitment to deliver within a timeframe.

Always remember that your product is more than just its upstream suppliers. Think about open source as an upstream supply chain, but think about your product as a downstream solution containing a superset of problem-solving features. The sum of the whole should be greater than the individual parts, and part of your job is to differentiate that sum from other offerings in the marketplace. The roadmap should provide differentiated features and capabilities including:

  * Product-specific capabilities—not supplier features
  * Capabilities that are ready for customers to test (in beta testing or tech preview)
  * Capabilities that are ready for customers to use in production (generally available and launched)



A good roadmap will be used by your customers, salespeople, marketing people, and other product managers. Moreover, if your product focuses on technical users, developers and architects rely on a roadmap to integrate your product into their products. If your product is a technical platform or service (such as one based on Linux, Kubernetes, Java, or virtual machines), you are not only consuming from an upstream supply chain; you are also part of the supply chain for downstream products created by your customers. This makes a solid roadmap all the more critical.

### Other considerations

It is likely that several holy wars could be started and fought over market problems, features, and what tools that product teams should use. For this reason, I have specifically avoided any mention of tooling. The important part to convey is that a roadmap should be laser focused on what customers need and want. It’s a product team’s job to deliver capabilities based on these needs. How to track this is specifically not covered in this article.

Another nuance left out of this conversation is the upstream project roadmap. Who’s in charge of that? Upstream projects aren’t products and there is rarely someone in charge of a long term roadmap for upstream projects. With some of the mega-projects like OpenStack, Kubernetes, or the Linux kernel there are open source program managers and architects who do focus on a roadmap. This actually makes it easier for an open source product manager, but most of the smaller projects, which can still be a key supplier for your product, don’t have upstream roadmaps which extend beyond the next one or two releases.

Roadmaps are useful for customers, sales people, marketing people, and other product managers. Moreover, if your product is focused on technical users, roadmaps are important for developers and architects who rely on them to integrate your product into their products. If your product is a technical platform or service (ex. based on Linux, Kubernetes, Java, virtual machines, etc), you are not only consuming from an upstream supply chain, you are also part of the supply chain for downstream products created by your customers. This makes a solid roadmap all the more important.

Your roadmap is never going to make everyone happy, but it can help align strategies between your product and the customers that purchase it. This is just as important with open source as with proprietary software products.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/open-source-product-roadmap

作者：[Scott McCarty][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/career_journey_road_gps_path_map_520.png?itok=PpL6jJgY (Looking at a map for career journey)
[2]: https://opensource.com/article/20/10/open-source-supply-chain
[3]: https://opensource.com/article/20/10/defining-product-open-source
[4]: https://opensource.com/article/20/11/open-source-product-teams
[5]: https://opensource.com/article/21/2/differentiating-products-upstream-suppliers
