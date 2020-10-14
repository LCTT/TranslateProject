[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 reasons Jamstack is changing web development)
[#]: via: (https://opensource.com/article/20/9/jamstack)
[#]: author: (Phil Hawksworth https://opensource.com/users/phil-hawksworth)

4 reasons Jamstack is changing web development
======
Jamstack allows web developers to move far beyond static sites without
the need for complex, expensive active-hosting infrastructure.
![spiderweb diagram][1]

The way we use and the way we build the web have evolved dramatically since its inception. Developers have seen the rise and fall of many architectural and development paradigms intended to satisfy more complex user experiences, support evolving device capabilities, and enable more effective development workflows.

In 2015, [Netlify][2] founders Matt Biilmann and Chris Bach coined the term "[Jamstack][3]" to describe the architectural model they were championing and that was gaining popularity. In reality, the foundations of this model have existed from the beginning of the web. But multiple factors led them to coin this new term to encapsulate the approach and to give developers and technical architects a better means to discuss it.

In this article, I'll look at those factors, Jamstack's attributes, why the term came into existence, and how it is changing how we approach web development.

### What is Jamstack?

All Jamstack sites share a core principle: They are a collection of static assets generated during a build or compilation process so that they can be served from a simplified web server or directly from a content delivery network (CDN).

Before the term "Jamstack" emerged, many people described these sites as "static." This describes how the first sites on the web were created (although CDNs would come later). But the term "static sites" does a poor job of capturing what is possible with the Jamstack due to the way tools, services, and browsers have evolved.

The simplest Jamstack site is a single HTML file served as a static file. For a long time, open source web servers efficiently hosted static assets this way. This has become a commodity, with companies including Amazon, Microsoft, and Google offering hosting services based on file serving rather than spending compute cycles generating a response for each request on-demand.

But that's just a static site? Right?

Well, yes. But it's the thin end of the wedge. Jamstack builds upon this to deliver sites that confound the term "static" as a useful descriptor.

If you take things a stage further and introduce JavaScript into the equation, you can begin enhancing the user's experience. Modern browsers have increasingly capable JavaScript engines (like the open source [V8][4] from Google) and powerful browser [APIs][5] to enable services such as local-caching, location services, identity services, media access, and much more.

In many ways, the browser's JavaScript engine has replaced the runtime environment needed to perform dynamic operations in web experiences. Whereas a traditional technology stack such as [LAMP][6] requires configuration and maintenance of an operating system (Linux) and an active web server (Apache), these are not considerations with Jamstack. Files are served statically to clients (browsers), and if any computation is required, it can happen there rather than on the hosting infrastructure.

As Matt Biilmann describes it, "the runtime has moved up a level, to the browser."

Web experiences don't always require content to be dynamic or personalized, but they often do. Jamstack sites can provide this, thanks to the efficient use of JavaScript as well as a booming API economy. Many companies now provide content, tools, and services via APIs. These APIs enable even small project teams to inject previously unattainable, prohibitively expensive, and complex abilities into their Jamstack projects. For example, rather than needing to build identity, payment, and fulfillment services or to host, maintain, secure, and scale database capabilities, teams can source these functionalities from experts in those areas through APIs.

Businesses have emerged to provide these and many other services with all of the economies of scale and domain specializations needed to make them robust, efficient, and sustainable. The ability to consume these services via APIs decouples them from web applications' code, which is a very desirable thing.

Because these services took us beyond the old concept of static sites, a more descriptive term was needed.

### What's in a name?

The _JavaScript_ available in modern browsers, calling on _APIs_, and enriching the underlying site content delivered with _markup_ (HTML) are the J, A, and M in the Jamstack name. They identify properties that allow sites to move far beyond static sites without the need for complex and expensive active-hosting infrastructure.

But whether you decide to use all or just some of these attributes, the Jamstack's key principle is that the assets are created in advance to vastly improve hosting and development workflows. It's a shift from the higher-risk, just-in-time request-servicing method to a simplified, more predictable, prepared-in-advance approach.

As [Aaron Swartz][7] succinctly put it way back in 2002, "Bake, don't fry" your pages.

### 4 benefits of using Jamstack

Embracing this model of decoupling the generation (or rendering) of assets from the work of serving assets creates significant opportunities.

#### Lowering the cost of scaling

In a traditional stack, where views are generated for each incoming request, there is a correlation between the volume of traffic and the computation work done on the servers. This might reach all levels of the hosting stack, from load balancers and web servers to application servers and database servers. When these additional layers of infrastructure are provisioned to help manage the load, it adds cost and complexity to the environment and the work of operating the infrastructure and the site itself.

Jamstack sites flatten that stack. The work of generating the views happens only when the code or content changes, rather than for every request. Therefore, the site can be prepared in advance and hosted directly from a CDN without needing to perform expensive computations on the fly. Large pieces of infrastructure (and the work associated with them) disappear.

In short: Jamstack sites are optimized for scale by default.

#### Improving speed

Traditionally, to improve the hosting infrastructure's response time, those with the budget and the skills would add a CDN. Identifying assets that might be considered "static" and offloading serving those resources to a CDN could reduce the load on the web-serving infrastructure. Therefore, some requests could be served more rapidly from a CDN that is optimized for that task.

With a Jamstack site, the site is served entirely from the CDN. This avoids the complex logic of determining what must be served dynamically and what can be served from a CDN.

Every deployment becomes an operation to update the entire site on the CDN rather than across many pieces of infrastructure. This allows you to automate the process, which can increase your confidence in and decrease the cost and friction of deploying site updates.

#### Reducing security risks

Removing hosting infrastructure, especially servers that do computation based on the requests they receive, has a profound impact on a site's security profile. A Jamstack site has far fewer attack vectors than a traditional site since many servers are no longer needed. There is no server more secure than the one that does not exist.

The CDN infrastructure remains but is optimized to serve pre-generated assets. Because these are read-only operations, they have fewer opportunities for attack.

#### Supercharging the workflow

By removing so many moving parts from site hosting, you can vastly improve the workflows involved in developing and deploying them.

Jamstack sites support [version control from end to end][8] and commonly use Git and Git conventions to do everything from defining and provisioning new environments to executing a deployment. Deployments no longer need to change the state, resources, or configuration of multiple pieces of hosting infrastructure. And they can be tested locally, on staging environments, and in production environments with ease.

The approach also allows more comprehensive project encapsulation. A site's code repository can include everything needed to bootstrap a project, including defining the dependencies and operations involved in building the site. This simplifies onboarding developers and walking the path to production. (Here's [an example][9].)

### Jamstack for all

Web developers familiar with a wide variety of tools and frameworks are embracing the Jamstack. They are achieving new levels of productivity, ignited by the recognition that they can use many tools and languages that put more power and ability in their hands.

Open source libraries and frameworks with high levels of adoption and love from the development community are being used in combination and with third- and first-party APIs to produce incredibly capable solutions. And the low barriers of entry mean they are easier to explore, leading to higher levels of developer empowerment, effectiveness, and enthusiasm.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/jamstack

作者：[Phil Hawksworth][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/phil-hawksworth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web-cms-build-howto-tutorial.png?itok=bRbCJt1U (spiderweb diagram)
[2]: https://www.netlify.com/jamstack?utm_source=opensource.com&utm_medium=jamstack-benefits-pnh&utm_campaign=devex
[3]: https://jamstack.org/?utm_source=opensource.com&utm_medium=jamstack-benefits-pnh&utm_campaign=devex
[4]: https://v8.dev/
[5]: https://www.redhat.com/en/topics/api/what-are-application-programming-interfaces
[6]: https://en.wikipedia.org/wiki/LAMP_(software_bundle)
[7]: http://www.aaronsw.com/weblog/000404
[8]: https://www.netlify.com/products/build/?utm_source=opensource.com&utm_medium=jamstack-benefits-pnh&utm_campaign=devex
[9]: https://github.com/philhawksworth/hello-trello
