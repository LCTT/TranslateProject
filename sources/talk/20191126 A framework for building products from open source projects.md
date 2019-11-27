[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A framework for building products from open source projects)
[#]: via: (https://opensource.com/article/19/11/products-open-source-projects)
[#]: author: (Kevin Xu https://opensource.com/users/kevin-xu)

A framework for building products from open source projects
======
Here is a roadmap for turning a project into a commercial open source
product.
![An airplane.][1]

My first memory of playing with a computer was through an [MS-DOS][2] terminal on the x86 PC in my grandfather's pharmaceutical research lab in the early '90s—playing games stored on 3.5" floppy disks and doing touch-typing exercises. As technology improved, I spent an obscene amount of time taking my computer apart to add more RAM, a new graphics card, or a new fan, mostly so I could play cooler games. It was a fun, ongoing project, and I bonded with my father over it. It was also way cheaper than buying a new computer.

What's the point of this in the context of open source?

Well, even though I had no idea what "open source" was at the time, I was behaving like a typical developer does with open source projects today—spending my free time to piece together and build things I wanted, sometimes for a specific goal, sometimes to learn new things, sometimes as a way to connect with others.

But, over time, I stopped tinkering. For whatever reason, I decided that my time was becoming too "valuable" to retrofit my older computers. I started using a MacBook, and when my older MacBook wasn't functioning well, I paid a pretty penny for a new one with a better configuration instead of unscrewing the bottom to see if I could jam in a new RAM card.

My behavior became more like that of an enterprise buyer—saving time and trouble by spending money.

### An open source software project is not a product you sell

If your experience with technology resembles mine in any way, you know intuitively that the _projects_ we [DIY][3] are not the same as the _products_ we spend money buying.

This isn't a new observation in the open source community.

[Stephen Walli][4], an IT industry veteran and part of the [Open Container Initiative][5], has written [numerous detailed blog posts][6] on this topic. [Sarah Novotny][7], who led the Kubernetes community and was heavily involved in the Nginx and MySQL communities, [emphatically articulated][8] at the inaugural [Open Core Summit][9] that the open source project a company shepherds and the product that a company sells are two completely _different_ things.

Yet, project and product continue to be conflated by maintainers-turned-founders of commercial open source software (COSS) companies, especially (and ironically) when the open source project gets traction.

This mistake gets repeated, I believe, because it's hard to mentally conceptualize how and why a commercial product should be different when the open source project is already being used widely.

### What makes a COSS product different?

Two core elements differentiate a commercial product from its open source root: packaged experience and buyer-specific features.

#### Packaged experience

Packaging your project so that it has that out-of-the-box user experience isn't just about a polished user interface (UI) or hosting it on your server as SaaS (although that could be part of it). It's an expressed opinion of how you, the creator or maintainer of the project turned founder of the company, believe the technology should be used to solve your customer's business problem. That "opinion" is essentially the product experience the customer is paying for.

When you are running an open source community project, it's usually good to be _not_ opinionated and let your community organically flourish. When you are developing a product for customers, it's usually good to _be_ opinionated.

It's the retrofitted x86 PC versus the MacBook dynamic.

[Dave McJannet][10], CEO of Hashicorp, and [Peter Reinhardt][11], CEO of Segment, both cited packaging as a crucial step to get right in order to turn an open source project into a scalable commercial product.

#### Buyer-specific features

A well-packaged product must also have the features that are necessary for your targeted buyer to justify a purchase. What these features are depends on the profile of your buyer, but the possibilities are finite and manageable.

An enterprise buyer, say a Global 2000, will have a relatively consistent set of features that it must have to purchase a product. ([EnterpriseReady.io][12] is a great resource about what those features tend to be.)

A small- or medium-sized business buyer, say your local mom-and-pop bakery, that has less financial resources and people power and is more price-sensitive, will need different things to be convinced to buy.

A consumer service monetized via ads, where your buyers are the advertisers while your users are everyday people, will be different still.

One thing is for sure: your buyer is almost _never_ your open source community.

Know what your buyer requires for a purchase, and package that with your expert opinion on how to solve the buyer's problem; **that's what differentiates a product from a project.**

Sid Sijbrandij's articulation of GitLab's [buyer-based open core][13] model is a good example for enterprises.

Certainly, other elements can be added to further the differentiation. But a packaged experience with buyer-specific features is essential. Without one or the other, your prospective customers might as well just tinker on their own for free.

### One metric that matters: Time-to-value

A perennially difficult thing in product development is measuring progress and establishing a data-driven framework to determine whether you are on the right path or not. I'm a fan of the One Metric That Matters (OMTM) mentality, elaborated in [_Lean Analytics_][14], where you focus on one single number (above everything else) for your current stage. This approach enforces focus and discipline among a sea of data you can gather and distract yourself with (oftentimes vanity metrics like download numbers or GitHub stars). The single metric can effectively rally your entire company around one tangible goal or mission—especially critical for an early-stage company. And the metric you focus on will be different at different stages.

So what's the right OMTM in the early days of product development?

I propose **time-to-value**

"Time" here is straightforward—the lower, the better.

"Value" needs a precise, rigorous definition that is technology- and problem-specific. Your distributed database is valuable because it can serve data with no downtime when servers fail. Your continuous integration tool is valuable because it enables application developers to push improvements faster without breaking the application. You get the idea.

How quickly can a customer see or feel the _one core piece of value_ that you measure and optimize for? Whatever is "a sufficiently short time" depends on the use case, but given the increasing consumerization of enterprise technology, any product's time-to-value that's more than 30 minutes is probably too long.

Finding and tightly defining that "value" is hard and iterative, but also table stakes if you are looking to build a product company around an open source project. Without a deep understanding of what that value is for your customer, there's probably not much of a company to build.

At the end of the day, as much fun as it was to "beef up" my x86 PC, I'm pretty satisfied with my MacBook and happy to pay the premium. So don't get too enamored with the joy of tinkering if your goal is actually to sell MacBook.

(P.S. The mental framework outlined here may not apply if you are building a consultancy or support-oriented company that services open source project users. For more expansive reading on different COSS business models, see _[_COSS business model progressions_][15]_ by Joseph Jacks.)

_Special thanks to Sarah Novotny for her feedback on this post's draft._

* * *

_This article was [previously published on COSS Media][16] and is edited and republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/products-open-source-projects

作者：[Kevin Xu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kevin-xu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/206308main_image_976_946-710.jpg?itok=U6hh3EIO (An airplane.)
[2]: https://en.wikipedia.org/wiki/MS-DOS
[3]: https://en.wikipedia.org/wiki/Do_it_yourself
[4]: https://stephesblog.blogs.com/about.html
[5]: https://www.opencontainers.org/
[6]: https://medium.com/@stephenrwalli
[7]: https://sarahnovotny.com/about/
[8]: https://www.linkedin.com/pulse/personal-reflection-open-core-summit-kevin-xu/
[9]: https://opencoresummit.com/#speakers
[10]: https://founderrealtalk.ggvc.com/2019/04/25/episode-23-hashicorp-ceo-dave-mcjannet-reveals-the-secrets-of-commercializing-open-source-selling-to-enterprises-and-building-successful-relationships-with-founders/
[11]: https://www.youtube.com/watch?v=Q75V35unztw&feature=youtu.be
[12]: https://www.enterpriseready.io/#
[13]: https://www.youtube.com/watch?v=G6ZupYzr_Zg
[14]: http://leananalyticsbook.com/
[15]: https://coss.media/coss-business-model-progressions/
[16]: https://coss.media/deriving-product-from-open-source/
