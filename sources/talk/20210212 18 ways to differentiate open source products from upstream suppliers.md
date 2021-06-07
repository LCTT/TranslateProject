[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (18 ways to differentiate open source products from upstream suppliers)
[#]: via: (https://opensource.com/article/21/2/differentiating-products-upstream-suppliers)
[#]: author: (Scott McCarty https://opensource.com/users/fatherlinux)

18 ways to differentiate open source products from upstream suppliers
======
Open source products must create enough differentiated value that
customers will voluntarily pay for them versus another (or free)
product.
![Tips and gears turning][1]

In the first three parts of this series, I explored [open source as a supply chain][2], [what a product is][3], and [what product managers do][4]. In this fourth article, I'll look at a plethora of methods to differentiate open source software products from their upstream open source projects.

Since open source projects are essentially information products, these methods are likely to apply to many information-related products (think YouTube creators) that have a component of value given away for free. Product managers have to get creative when the information and material to build your product is freely available to users.

### Creating and capturing value

Product managers are responsible for creating solutions that attract and retain customers. To create a customer, they must provide value in exchange for money. Like a good salesperson, a product manager should never feel guilty about charging for their product (see [_How to sell an open source product_][5] by John Mark Walker).

Products built on open source are fundamentally no different than any other products or service. They must create value for customers. In fact, they must create enough value that customers will voluntarily pay a price that is sufficient to pay for the development costs and return a profit. These products must also be differentiated from competing products and services, as well as upstream projects.

![Inputs for creating value][6]

(Scott McCarty, [CC BY-SA 4.0][7])

While products built on open source software are not fundamentally different from other products and services, there are some differences. First, some of the development costs are defrayed among all open source contributors. These costs can include code, testing, documentation, hardware, project hosting costs, etc. But even when development costs are defrayed in open source, costs are incurred by the vendor that productizes the code. These can include employee costs for research, analysis, security, performance testing, certification processes (e.g., collaborating with hardware vendors, cloud providers, etc.), and of course, sales and marketing.

![Inputs for solving market problems][8]

(Scott McCarty, [CC BY-SA 4.0][7])

Successful open source products must be able to charge a cost that is sufficient to pay for the defrayed upstream open source contributions (development costs) and the downstream productization costs (vendor costs). Stated another way, products can only charge a sufficient price if they create value that can only be captured by customers paying for them. That might sound harsh, but it's a reality for all products. There's a saying in product management: Pray to pay doesn't work. With that said, don't be too worried. There are ethical ways to capture value.

### Types of value

Fundamentally, there are two types of value: proprietary and non-proprietary. Proprietary is a bad word in open source software, but an attractive word in manufacturing, finance, and other industries. Many financial companies will highlight their proprietary algorithms and the same with drug companies and manufacturing processes. In software, proprietary value is often thought to be completely incongruous with free and open source software. People often assume proprietary value is a binary decision. It’s difficult for people to imagine proprietary value in the context of open source software without being artificially constrained by a license. However, as we’ll attempt to demonstrate, it’s not so clear cut.

From an open source product management perspective, you can define proprietary value as anything that would be very difficult or nearly impossible for the customer to recreate themselves—or something the potential customer doesn't believe they can recreate. Commodity value is the opposite of proprietary. Commodity value is value the customer believes they could construct (or reconstruct) given enough time and money.

Reconstructing commodity value instead of purchasing it makes sense only if it's cheaper or easier than buying a product. Stated another way, a good product should save a customer money compared to building the solution themselves. It's in this cost gap that open source products exist and thrive.

With products built, or mostly built, on an open source supply chain, customers retain the "build versus buy" decision and can stop paying at any time. This is often true with open core products as well. As long as the majority of the supply chain is open source, the customer likely could rebuild a few components to get what they need. The open source product manager's job is the same as for any other product or service: to create and retain customers by providing value worth paying for.

### Differentiators for open source product managers

Like any artist, a product manager traffics in value as their medium. They must price and package their product. They must constantly strive to differentiate their product against competitors in the marketplace and the upstream projects that are suppliers to that product. However, the supply chain is but one tool a product manager can use to differentiate and create a customer.

This is a less-than-exhaustive list that should give you some ideas about how product managers can differentiate their products and create value. As you read through the list, think deeply about whether a customer could recreate the value of each given enough time, money, and willpower.

  * **Supply chain:** Selecting the upstream suppliers is important. The upstream community's health is a selling point over products based on competing upstream projects. A perfect example of this kind of differentiation is with products such as OpenShift, Docker EE, and Mesosphere, which respectively rely on Kubernetes, Swarm, and Apache Mesos as upstream suppliers. Similar to how electric cars are replacing gasoline engines, the choice of technology and its supplier provide differentiation.

  * **Quality engineering:** Upstream continuous integration and continuous delivery (CI/CD) and user testing are wonderful bases for building a product. However, it's critical to ensure that the downstream product, often made up of multiple upstream projects, works well together with specific versions of all the components. Testing the entire solution together applies as much to differentiating from upstream suppliers as it does from competitive products. Customers want products that just work.

  * **Industry certifications:** Specific classes of customers, such as government, financial services, transportation, manufacturing, and telecom, often have certification requirements. Typically, these are related to security or auditing and are often quite expensive. Certifications are great because they differentiate the product from competitors and upstream.

  * **Hardware or cloud provider certifications:** The dirty secret of cheap hardware is that it changes all the time. Often this hardware has new capabilities with varying levels of maturity. Hardware certifications provide a level of confidence that the software will run well on a specific piece of hardware or cloud virtual machine. They also provide a level of assurance that the product company and the platform on which it is certified to run are committing to make it work well together. A potential customer could always vet hardware themselves, but they often don't have deep relationships with hardware vendors and cloud providers, making it difficult to demand fixes and patches.

  * **Ecosystem:** This represents access to a plethora of add-on solutions from third-party vendors. Again, the ecosystem provides some assurance that all the entities work together to make things work well. Small companies would likely find it difficult or impossible to demand that individual software vendors certify their privately built platforms. Integrations like these are usually quite expensive for an individual user and are best defrayed across a product's customers.

  * **Lifecycle:** Upstream projects are great because they move quickly and innovate. But many different versions of many different upstream projects can go into a single product's supply chain. Ensuring that all the versions of the different upstream projects work together over a given lifecycle is a lot of work. A longer lifecycle gives customers time to get a return on investment. Stated another way, users spend a lot of time and money planning and rolling out software. A product's lifecycle commitment ensures that customers can use the software and receive value from their investment for a reasonable amount of time.

  * **Packaging and distribution:** Once a vendor commits to supporting a product for a given lifecycle (e.g., five years), they must also commit to providing packaging and distribution during that time. Both products and cloud services need to provide customers the ability to plan a roadmap, execute a rollout, and expand over the desired lifecycle, so packages or services need to remain available for customer use.

  * **Documentation:** This is often overlooked by both open source projects and vendors. Aligning product documentation to the product lifecycle, versus the upstream supplier documentation, is extremely important. It's also important to document the entire solution working together, whether that's installation or use cases for end users. It's beneficial for customers to have documentation that applies to the specific combination of components they are using.

  * **Security:** Closely related to the product lifecycle, vendors must commit to providing security during the time the product is supported. This includes analyzing code, scoring vulnerabilities, patching those vulnerabilities, and verifying that they are patched. This is a particularly opportune area for products to differentiate themselves from upstream suppliers. It really is value creation through data.

  * **Performance:** Also closely related to product lifecycle, vendors must commit to providing performance testing, tuning recommendations, and sometimes even backporting performance improvements during the product's lifecycle. This is another opportune area for products.

  * **Indemnification:** This is essentially insurance in case the company using the software is sued by a patent troll. Often, the corporate legal team just won't have the skill set needed to defend themselves. While potential customers could pay a third party for legal services, would they know the software as well?

  * **Compute resources:** You simply can't get access to compute resources without paying for them. There are free trials, but sustained usage always requires paying, either through a cloud provider or by buying hardware. In fact, this is one of the main differentiated values provided by infrastructure as a service (IaaS) and software as a service (SaaS) cloud providers. This is quite differentiated from upstream suppliers because they will never have the budget to provide free compute, storage, and network.

  * **Consulting:** Access to operational knowledge to set up and use the software may be a differentiator. Clearly, a company can hire the talent, given enough budget and willpower, but talent can be difficult to find. In fact, one might argue that software vendors have a much better chance of attracting the top talent, essentially creating a talent vacuum for users trying to reconstruct the value themselves.

  * **Training:** Similar to consulting, the company that wrote, configured, released, and operated the software at scale often knows how to use it best. Again, a customer could hire the talent given enough budget and willpower.

  * **Operational knowledge:** IaaS and SaaS solutions often provide this kind of value. Similarly, knowledge bases and connected experiences that analyze an installed environment's configuration to provide the user with insights (e.g., OpenShift, Red Hat Insights) can provide this value. Operational knowledge is similar to training and consulting.

  * **Support:** This includes the ability to call for help or file support tickets and is similar to training, consulting, and operational knowledge. Support is often a crutch for open source product managers; again, customers can often recreate their own support organizations, depending on where they want to strategically invest budget and people, especially for level one and level two support. Level three support (e.g., kernel programmers) might be harder to hire.

  * **Proprietary code:** This is code that's not released under an open source license. A customer could always build a software development team and augment the open core code with the missing features they need. For the vendor, proprietary code has the downside of creating an unnatural competition between the upstream open source supplier and the downstream product. Furthermore, this unnatural split between open source and proprietary code does not provide the customer more value. It always feels like value is being unnaturally held back. I would argue that this is a very suboptimal form of value capture.

  * **Brand:** Brand equity is not easily measurable. It really comes down to a general level of trust. The customer needs to believe that the solution provider can and will help them when they need it. It's slow to build a brand and easy to lose it. Careful thought might reveal that the same is true with internal support organizations in a company. Users will quickly lose trust in internal support organizations, and it can take years to build it back up.




Reading through the list, do you think a potential customer could recreate the value of almost any of these items? The answer is almost assuredly yes. This is true with almost any product feature or capability, whether it's open source or even proprietary. Cloud providers build their own CPUs and hardware, and delivery companies (e.g., UPS, Amazon, etc.) sometimes build their own vehicles. Whether it makes sense to build or buy all depends on the business and its specific needs.

### Add value in the right places

The open source licensing model led to an explosion in the availability of components that can be assembled into a software product. Stated another way, it formed a huge supply chain of software. Product managers can create products from a completely open source supply chain (e.g., Red Hat, Chef, SUSE, etc.), or mix and match open source and proprietary technology (e.g., open core like Sourcefire or SugarCRM). Choosing a fully open source versus open core methodology should not be confused with solving a business problem. Customers only buy products that solve their problems.

Enterprise open source products are solutions to problems, much like a vehicle sold by an auto manufacturer. The product manager for an open source product determines the requirements, things like the lifecycle (number of years), security (important certifications), performance (important workloads), and ecosystem (partners). Some of these requirements can be met by upstream suppliers (open source projects); some cannot.

An open source product is a composition of value consumed through a supply chain of upstream vendors and new value added by the company creating it. This new value combined with the consumed value is often worth more together and sold at a premium. It's the responsibility of product teams (including engineering, quality, performance, security, legal, etc.) to add new value in the right places, at the right times, to make their open source products worth the price customers pay versus building out the infrastructure necessary to assemble, maintain, and support the upstream components themselves.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/differentiating-products-upstream-suppliers

作者：[Scott McCarty][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png?itok=HcN38NOk (Tips and gears turning)
[2]: https://opensource.com/article/20/10/open-source-supply-chain
[3]: https://opensource.com/article/20/10/defining-product-open-source
[4]: https://opensource.com/article/20/11/open-source-product-teams
[5]: https://opensource.com/article/20/6/sell-open-source-software
[6]: https://opensource.com/sites/default/files/uploads/creatingvalue1.png (Inputs for creating value)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/creatingvalue2.png (Inputs for solving market problems)
