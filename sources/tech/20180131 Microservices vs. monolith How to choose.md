Microservices vs. monolith: How to choose
============================================================

### Both architectures have pros and cons, and the right decision depends on your organization's unique needs.


![Microservices vs. monolith: How to choose](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/building_architecture_design.jpg?itok=lB_qYv-I "Microservices vs. monolith: How to choose")
Image by : 

Onasill ~ Bill Badzo on [Flickr][11]. [CC BY-NC-SA 2.0][12]. Modified by Opensource.com.

For many startups, conventional wisdom says to start with a monolith architecture over microservices. But are there exceptions to this?

The upcoming book,  [_Microservices for Startups_][13] , explores the benefits and drawbacks of microservices, offering insights from dozens of CTOs.

While different CTOs take different approaches when starting new ventures, they agree that context and capability are key. If you're pondering whether your business would be best served by a monolith or microservices, consider the factors discussed below.

### Understanding the spectrum

More on Microservices

*   [How to explain microservices to your CEO][1]

*   [Free eBook: Microservices vs. service-oriented architecture][2]

*   [Secured DevOps for microservices][3]

Let's first clarify what exactly we mean by “monolith” and “microservice.”

Microservices are an approach to developing a single application as a suite of small services, each running in its own process and communicating with lightweight mechanisms, often an HTTP resource API. These services are built around business capabilities and independently deployable by fully automated deployment machinery.

A monolithic application is built as a single, unified unit, and usually one massive code base. Often a monolith consists of three parts: a database, a client-side user interface (consisting of HTML pages and/or JavaScript running in a browser), and a server-side application.

“System architectures lie on a spectrum,” Zachary Crockett, CTO of [Particle][14], said in an interview. “When discussing microservices, people tend to focus on one end of that spectrum: many tiny applications passing too many messages to each other. At the other end of the spectrum, you have a giant monolith doing too many things. For any real system, there are many possible service-oriented architectures between those two extremes.”

Depending on your situation, there are good reasons to tend toward either a monolith or microservices.

"We want to use the best tool for each service." Julien Lemoine, CTO at Algolia

Contrary to what many people think, a monolith isn’t a dated architecture that's best left in the past. In certain circumstances, a monolith is ideal. I spoke to Steven Czerwinski, head of engineering at [Scaylr][15] and a former Google employee, to better understand this.

“Even though we had had positive experiences of using microservices at Google, we [at Scalyr] went [for a monolith] route because having one monolithic server means less work for us as two engineers,” he explained. (This was back in the early days of Scalyr.)

But if your team is experienced with microservices and you have a clear idea of the direction you’re going, microservices can be a great alternative.

Julien Lemoine, CTO at [Algolia][16], chimed in on this point: “We have always started with a microservices approach. The main goal was to be able to use different technology to build our service, for two big reasons:

*   We want to use the best tool for each service. Our search API is highly optimized at the lowest level, and C++ is the perfect language for that. That said, using C++ for everything is a waste of productivity, especially to build a dashboard.

*   We want the best talent, and using only one technology would limit our options. This is why we have different languages in the company.”

If your team is prepared, starting with microservices allows your organization to get used to the rhythm of developing in a microservice environment right from the start.

### Weighing the pros and cons

Before you decide which approach is best for your organization, it's important to consider the strengths and weaknesses of each.

### Monoliths

### Pros:

*   **Fewer cross-cutting concerns:** Most apps have cross-cutting concerns, such as logging, rate limiting, and security features like audit trails and DOS protection. When everything is running through the same app, it’s easy to address those concerns by hooking up components.

*   **Less operational overhead:** There’s only one application to set up for logging, monitoring, and testing. Also, it's generally less complex to deploy.

*   **Performance:** A monolith architecture can offer performance advantages since shared-memory access is faster than inter-process communication (IPC).

### Cons:

*   **Tightly coupled:** Monolithic app services tend to get tightly coupled and entangled as the application evolves, making it difficult to isolate services for purposes such as independent scaling or code maintainability.

*   **Harder to understand:** Monolithic architectures are more difficult to understand because of dependencies, side effects, and other factors that are not obvious when you’re looking at a specific service or controller.

### Microservices

### Pros:

*   **Better organization:** Microservice architectures are typically better organized, since each microservice has a specific job and is not concerned with the jobs of other components.

*   **Decoupled:** Decoupled services are easier to recompose and reconfigure to serve different apps (for example, serving both web clients and the public API). They also allow fast, independent delivery of individual parts within a larger integrated system.

*   **Performance:** Depending on how they're organized, microservices can offer performance advantages because you can isolate hot services and scale them independently of the rest of the app.

*   **Fewer mistakes:** Microservices enable parallel development by establishing a strong boundary between different parts of your system. Doing this makes it more difficult to connect parts that shouldn’t be connected, for example, or couple too tightly those that need to be connected.

### Cons:

*   **Cross-cutting concerns across each service:** As you build a new microservice architecture, you’re likely to discover cross-cutting concerns you may not have anticipated at design time. You’ll either need to incur the overhead of separate modules for each cross-cutting concern (i.e., testing), or encapsulate cross-cutting concerns in another service layer through which all traffic is routed. Eventually, even monolithic architectures tend to route traffic through an outer service layer for cross-cutting concerns, but with a monolithic architecture, it’s possible to delay the cost of that work until the project is more mature.

*   **Higher operational overhead:** Microservices are frequently deployed on their own virtual machines or containers, causing a proliferation of VM wrangling. These tasks are frequently automated with container fleet management tools.

### Decision time

Once you understand the pros and cons of both approaches, how do you apply this information to your startup? Based on interviews with CTOs, here are three questions to guide your decision process:

**Are you in familiar territory?**

Diving directly into microservices is less risky if your team has previous domain experience (for example, in e-commerce) and knowledge concerning the needs of your customers. If you’re traveling down an unknown path, on the other hand, a monolith may be a safer option.

**Is your team prepared?**

Does your team have experience with microservices? If you quadruple the size of your team within the next year, will microservices offer the best environment? Evaluating the dimensions of your team is crucial to the success of your project.

**How’s your infrastructure?**

To make microservices work, you’ll need a cloud-based infrastructure.

David Strauss, CTO of [Pantheon][17], explained: “[Previously], you would want to start with a monolith because you wanted to deploy one database server. The idea of having to set up a database server for every single microservice and then scale out was a mammoth task. Only a huge, tech-savvy organization could do that. Today, with services like Google Cloud and Amazon AWS, you have many options for deploying tiny things without needing to own the persistence layer for each one.”

### Evaluate the business risk

As a tech-savvy startup with high ambitions, you might think microservices is the “right” way to go. But microservices can pose a business risk. Strauss explained, “A lot of teams overbuild their project initially. Everyone wants to think their startup will be the next unicorn, and they should therefore build everything with microservices or some other hyper-scalable infrastructure. But that's usually wrong.” In these cases, Strauss continued, the areas that they thought they needed to scale are often not the ones that actually should scale first, resulting in wasted time and effort.

### Situational awareness

Ultimately, context is key. Here are some tips from CTOs:

#### When to start with a monolith

*   **Your team is at founding stage:** Your team is small—say, 2 to 5 members—and is unable to tackle a broader, high-overhead microservices architecture.

*   **You’re building an unproven product or proof of concept:** If you're bringing a brand-new product to market, it will likely evolve over time, and a monolith is better-suited to allow for rapid product iteration. The same notion applies to a proof of concept, where your goal is to learn as much as possible as quickly as possible, even if you end up throwing it away.

*   **You have no microservices experience:** Unless you can justify the risk of learning on the fly at an early stage, a monolith may be a safer approach for an inexperienced team.

#### When to start with microservices

*   **You need quick, independent service delivery:** Microservices allow for fast, independent delivery of individual parts within a larger integrated system. Note that it can take some time to see service delivery gains with microservices compared to a monolith, depending on your team's size.

*   **A piece of your platform needs to be extremely efficient:** If your business does intensive processing of petabytes of log volume, you’ll likely want to build that service out in an efficient language like C++, while your user dashboard may be built in [Ruby on Rails][5].

*   **You plan to grow your team:** Starting with microservices gets your team used to developing in separate small services from the beginning, and teams that are separated by service boundaries are easier to scale as needed.

To decide whether a monolith or microservices is right for your organization, be honest and self-aware about your context and capabilities. This will help you find the best path to grow your business.

### Topics

 [Microservices][21][DevOps][22]

### About the author

 [![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/profile_15.jpg?itok=EaSRMCN-)][18] jakelumetta - Jake is the CEO of [ButterCMS, an API-first CMS][6]. He loves whipping up Butter puns and building tools that makes developers lives better. For more content like this, follow [@ButterCMS][7] on Twitter and [subscribe to our blog][8].[More about me][9]

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/how-choose-between-monolith-microservices

作者：[jakelumetta ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jakelumetta
[1]:https://blog.openshift.com/microservices-how-to-explain-them-to-your-ceo/?intcmp=7016000000127cYAAQ&src=microservices_resource_menu1
[2]:https://www.openshift.com/promotions/microservices.html?intcmp=7016000000127cYAAQ&src=microservices_resource_menu2
[3]:https://opensource.com/business/16/11/secured-devops-microservices?src=microservices_resource_menu3
[4]:https://opensource.com/article/18/1/how-choose-between-monolith-microservices?rate=tSotlNvwc-Itch5fhYiIn5h0L8PcUGm_qGvqSVzu9w8
[5]:http://rubyonrails.org/
[6]:https://buttercms.com/
[7]:https://twitter.com/ButterCMS
[8]:https://buttercms.com/blog/
[9]:https://opensource.com/users/jakelumetta
[10]:https://opensource.com/user/205531/feed
[11]:https://www.flickr.com/photos/onasill/16452059791/in/photolist-r4P7ci-r3xUqZ-JkWzgN-dUr8Mo-biVsvF-kA2Vot-qSLczk-nLvGTX-biVxwe-nJJmzt-omA1vW-gFtM5-8rsk8r-dk9uPv-5kja88-cv8YTq-eQqNJu-7NJiqd-pBUkk-pBUmQ-6z4dAw-pBULZ-vyM3V3-JruMsr-pBUiJ-eDrP5-7KCWsm-nsetSn-81M3EC-pBURh-HsVXuv-qjgBy-biVtvx-5KJ5zK-81F8xo-nGFQo3-nJr89v-8Mmi8L-81C9A6-qjgAW-564xeQ-ihmDuk-biVBNz-7C5VBr-eChMAV-JruMBe-8o4iKu-qjgwW-JhhFXn-pBUjw
[12]:https://creativecommons.org/licenses/by-nc-sa/2.0/
[13]:https://buttercms.com/books/microservices-for-startups/
[14]:https://www.particle.io/Particle
[15]:https://www.scalyr.com/
[16]:https://www.algolia.com/
[17]:https://pantheon.io/
[18]:https://opensource.com/users/jakelumetta
[19]:https://opensource.com/users/jakelumetta
[20]:https://opensource.com/users/jakelumetta
[21]:https://opensource.com/tags/microservices
[22]:https://opensource.com/tags/devops