Be the open source supply chain
============================================================

### Learn why you should be a supply chain influencer.

 ![Be the open source supply chain](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/OSDC_BUS_ArchitectureOfParticipation_520x292.png?itok=tzfeycyR "Be the open source supply chain") 
Image by : 

opensource.com

I would bet that whoever is best at managing and influencing the open source supply chain will be best positioned to create the most innovative products. In this article, I’ll explain why you should be a supply chain influencer, and how your organization can be an active participant in your supply chain.

In my previous article, [Open source and the software supply chain][2], I discussed the basics of supply chain management, and where open source fits in this model. I left readers with this illustration of the model:

 ![supply chain](https://opensource.com/sites/default/files/f1_520_0.png "supply chain") 

The question to ask your employer and team(s) is: How do we best take advantage of this? After all, if Apple can set the stage for its dominance by creating a better hardware supply chain, then surely one can do the same with software supply chains.

### Evaluating supply chains

Having worked with developers and product teams in many companies, I learned that the process for selecting components that go into a product is haphazard. Sometimes there is an official bake-off of one or two components against each other, but the developers often choose to work with a product based on "feel". When determining the best components, you must evaluate based on those projects’ longevity, stage of development, and enough other metrics to form the basis of a "build vs. buy" decision. Number of users, interested parties, commercial activity, involvement of development team in support, and so on are a few considerations in the decision-making process.

Over time, technology and business needs change, and in the world of open source software, even more so. Not only must an engineering and product team be able to select the best component at that time, they must also be able to switch it out for something else when the time comes—for example, when the community managing the old component moves on, or when a new component with better features emerges.

### What not to do

When evaluating supply chain components, teams are prone to make a number of mistakes, including these common ones:

*   **Not Invented Here (NIH)**: I can’t tell you how many times engineering teams decided to "fix" shortcomings in existing supply chain components by deciding to write it themselves. I won’t say "never ever do that," but I will warn that if you take on the responsibility of writing an infrastructure component, understand that you’re chucking away all the advantages of the open source supply chain—namely upstream testing and upstream engineering—and deciding to take on those tasks, immediately saddling your team (and your product) with technical debt that will only grow over time. You’re making the choice to be less efficient, and you had better have a compelling reason for doing so.
*   **Carrying patches forward**: Any open source-savvy team understands the value of contributing patches to their respective upstream projects. When doing so, contributed code goes through that project’s automated testing procedures, which, when combined with your own team’s existing testing infrastructure, makes for a more hardened end product. Unfortunately, not all teams are open source-savvy. Sometimes these teams are faced with onerous legal requirements that deter them from seeking permission to contribute fixes upstream. In that case, encourage (i.e., nag) your manager to get blanket legal approval for such things, because the alternative is carrying all those changes forward, incurring significant technical debt, and applying patches until the day your project (or you) dies.
*   **Think you’re only a user**: Using open source components as part of your software supply chain is only the first step. To reap the rewards of open source supply chains, you must dive in and be an influencer. (More on that shortly.)

### Effective supply chain management example: Red Hat

Because of its upstream-first policies, [Red Hat][3] is an example of how both to utilize and influence software supply chains. To understand the Red Hat model, you must view their products through a supply chain perspective.

Products supported by Red Hat are composed of open source components often vetted by multiple upstream communities, and changes made to these components are pushed to their respective upstream projects, often before they land in a supported product from Red Hat. The work flow look somewhat like:

 ![workflow diagram](https://opensource.com/sites/default/files/f2_520_0.png "workflow diagram") 

There are multiple reasons for this kind of workflow:

*   Testing, testing, testing: By offloading some initial testing, a company like Red Hat benefits from both the upstream community’s testing, as well as the testing done by other ecosystem participants, including competitors.
*   Upstream viability: The Red Hat model only works as long as upstream suppliers are viable and self-sustaining. Thus, it’s in Red Hat’s interest to make sure those communities stay healthy.
*   Engineering efficiency: Because Red Hat offloads common tasks to upstream communities, their engineers spend more time adding value to products for customers.

To understand the Red Hat approach to supply chain, let’s look at their approach to product development with OpenStack.

Curiously, Red Hat’s start with OpenStack was not to create a product or even to announce one; rather, they started pushing engineering resources into strategic projects in OpenStack (starting with Nova, Keystone, and Cinder). This list grew to include several other projects in the OpenStack community. A more traditional product management executive might look at this approach and think, "Why on earth would we contribute so much engineering to something that isn’t established and has no product? Why are we giving our competitors our work for free?"

Instead, here is the open source supply chain thought process:

### Step 1

Look at growth areas in the business or largest product gaps that need filling. Is there an open source community that fits a strategic gap? Or can we build a new project from scratch to do the same? In this case, Red Hat looked at the OpenStack community and eventually determined that it would fill a gap in the product portfolio.

### Step 2

Gradually turn up the dial on engineering resources. This does a couple of things. First, it helps the engineering team get a sense of the respective projects’ prospects for success. If prospects aren’t not good, the company can stop contributing, with minimal investment spent. Once the project is determined to be worth in the investment, to the company can ensure its engineers will influence current and future development. This helps the project with quality code development, and ensures that the code meets future product requirements and acceptance criteria. Red Hat spent a lot of time slinging code in OpenStack repositories before ever announcing an OpenStack product, much less releasing one. But this was a fraction of the investment that would have been made if the company had developed an IaaS product from scratch.

### Step 3

Once the engineering investments begin, start a product management roadmap and marketing release plan. Once the code reaches a minimum level of quality, fork the upstream repository and start working on product-specific code. Bug fixes are pushed upstream to openstack.org and into product branches. (Remember: Red Hat’s model depends on upstream viability, so it makes no sense not to push fixes upstream.)

Lather, rinse, repeat. This is how you manage an open source software supply chain.

### Don't accumulate technical debt

If needed, Red Hat could decide that it would simply depend on upstream code, supply necessary proprietary product glue, and then release that as a product. This is, in fact, what most companies do with upstream open source code; however, this misses a crucial point I made previously. To develop a really great product, being heavily involved in the development process helps. How can an organization make sure that the code base meets its core product criteria if they’re not involved in the day-to-day architecture discussions?

To make matters worse, in an effort to protect backwards compatibility and interoperability, many companies fork the upstream code, make changes and don't contribute them upstream, choosing instead to carry them forward internally. That is a big no-no, saddling your engineering team forever with accumulated technical debt that will only grow over time. In that scenario, all the gains made from upstream testing, development and release go away in a whiff of stupidity.

### Red Hat and OpenShift

Once you begin to understand Red Hat’s approach to supply chain, which you can see manifested in its approach to OpenStack, you can understand its approach to OpenShift. Red Hat first released OpenShift as a proprietary product that was also open sourced. Everything was homegrown, built by a team that joined Red Hat as part of the [Makara acquisition][4] in 2010.

The technology initially suffered from NIH—using its own homegrown clustering and container management technologies, in spite of the recent (at the time) release of new projects: Kubernetes, Mesos, and Docker. What Red Hat did next is a testament to the company’s commitment to its open source supply chain model: Between OpenShift versions 2 and 3, developers rewrote it to utilize and take advantage of new developments from the Kubernetes and Docker communities, ditching their NIH approach. By restructuring the project in that way, the company took advantage of economies of scale that resulted from the burgeoning developer communities for both projects. I

Instead of Red Hat fashioning a complete QC/QA testing environment for the entire OpenShift stack, they could rely on testing infrastructure supplied by the Docker and Kubernetes communities. Thus, Red Hat contributions to both the Docker and Kubernetes code bases would undergo a few rounds of testing before ever reaching the company’s own product branches:

1.  The first round of testing is by the Docker and Kubernetes communities .
2.  Further testing is done by ecosystem participants building products on either or both projects.
3.  More testing happens on downstream code distributions or products that "embed" both projects.
4.  Final testing happens in Red Hat’s own product branch.

The amount of upstream (from Red Hat) testing done on the code ensures a level of quality that would be much more expensive for the company to do comprehensively and from scratch. This is the trick to open source supply chain management: Don’t just consume upstream code, minimally shimming it into a product. That approach won’t give you any of the advantages offered by open source development practices and direct participation for solving your customers’ problems.

To get the most benefit from the open source software supply chain, you must **be** the open source software supply chain.

--------------------------------------------------------------------------------

作者简介：

John Mark Walker - John Mark Walker is Director of Product Management at Dell EMC and is responsible for managing the ViPR Controller product as well as the CoprHD open source community. He has led many open source community efforts, including ManageIQ,

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/be-open-source-supply-chain

作者：[John Mark Walker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/johnmark
[1]:https://opensource.com/article/17/1/be-open-source-supply-chain?rate=sz6X6GSpIX1EeYBj4B8PokPU1Wy-ievIcBeHAv0Rv2I
[2]:https://opensource.com/article/16/12/open-source-software-supply-chain
[3]:https://www.redhat.com/en
[4]:https://www.redhat.com/en/about/press-releases/makara
[5]:https://opensource.com/user/11815/feed
