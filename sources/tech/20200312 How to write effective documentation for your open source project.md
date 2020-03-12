[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to write effective documentation for your open source project)
[#]: via: (https://opensource.com/article/20/3/documentation)
[#]: author: (Kevin Xu https://opensource.com/users/kevin-xu)

How to write effective documentation for your open source project
======
Documentation quality can make the difference in people trying your
project or passing it by.
![A pink typewriter][1]

Unfortunately, good code won't speak for itself. Even the most elegantly designed and well-written codebase that solves the most pressing problem in the world won't just get adopted on its own. You, the open source creator, need to speak for your code and breathe life into your creation. That's where technical writing and documentation come in.

A project's documentation gets the most amount of traffic, by far. It's the place where people decide whether to continue learning about your project or move on. Thus, spending time and energy on documentation and technical writing, focusing on the most important section, "Getting Started," will do wonders for your project's traction.

Writing may feel uncomfortable, even daunting, to many of you. As engineers, we are trained more to write code than to write _about_ code. Many people also speak English as a second or even third language and may feel insecure or intimidated about writing in English. (I learned English as a second language, and my mother tongue is Mandarin Chinese, so I feel your pain.)

But we can't get around the reality that, if you want your project to have a broad, global reach, English is the language you must use. Don't fear. I wrote this post with those challenges in mind. You don't need to be the next Shakespeare to find the advice here useful.

### Five actionable writing tips

Here are five actionable writing tips you can apply today. They may seem painfully simple and obvious, yet they are ignored over and over again in technical writing.

  1. **Use** [**active voice**][2]**:** Active voice: "You can change these configurations by…" vs. passive voice: "These configurations can be changed by…"
  2. **Use simple, short sentences:** While not open source, [Hemingway App][3] and [Grammarly][4] are both helpful tools.
  3. **Format for easy reading:** Use headings, bullet points, and links to break up information into chunks instead of long explanatory paragraphs.
  4. **Keep it visual:** Use tables and diagrams, not sentences, to represent information with multiple dimensions.
  5. **Mind your spelling and grammar:** Always, always, always spell check for typos and grammar check for polish.



By applying these tips consistently in your writing and editing workflow, you achieve two big goals: efficient communication and building trust.

  * **Efficient communication:** Engineers don't want to read long-winded, meandering paragraphs in documentation (they have novels for that). They want to get technical information or instructions (when it's a guide) as efficiently as possible. Thus, your writing needs to be lean and useful. (That being said, it's fine to apply some humor, emojis, and "fluff" here and there to give your project some personality and make it more memorable. How exactly you do that will depend on _your_ personality.)
  * **Building trust:** The most valuable currency you must accrue, especially in the early days of building your project, is trust. Trust comes not only from your code quality but also from the quality of writing that talks about your code. Thus, please apply the same polish to your writing that you would to your code. This is the main reason for point 5 above (on spelling and grammar checks).



### Start with Getting Started documentation

With these fundamental techniques baked into your writing, the section you should spend the most time on in your documentation is the Getting Started section. This is, by far, the most important section and a classic example of the "[80/20 rule][5]" in action. Most of the web traffic to your project lands on your documentation, and most of _that_ lands on Getting Started. If it is well-constructed, you will get a new user right away. If not, the visitor will bounce and likely never come back.

How do you construct a good Getting Started section? I propose this three-step process:

  1. **Make it a task:** An effective Getting Started guide should be task-oriented—a discrete mini-project that a developer can accomplish. It should _not_ contain too much information about the architectural design, core concept, and other higher-level information. A single, visual architectural overview is fine, but don't devote multiple paragraphs to how and why your project is the best-designed solution. That information belongs somewhere else (more on that below). Instead, the Getting Started section should mostly be a list of steps and commands to… well, get your project started!
  2. **Can be finished in less than 30 minutes:** The core takeaway here is that the time to completion should be as low as possible; 30 minutes is the upper bound. This time limit also assumes the user has relatively little context about your project. This is important to keep in mind. Most people who bother to go through your Getting Started guide are members of a technical audience with a vague understanding of your project but not much more than that. They are there to try something out before they decide to spend more time digging deeper. "Time to completion" is a metric you should measure to continuously improve your Getting Started guide.
  3. **Do something meaningful:** What "meaningful" means depends on the open source project. It is important to think hard about what that is, tightly define it into a task, and allow a developer who completes your Getting Started guide to achieve that meaningful task. This meaningful task must speak directly to your project's value; otherwise, it will leave developers feeling like they just wasted their time.



For inspiration: If you are a distributed database project, perhaps "meaningful" means the whole cluster remains available with no downtime after you kill some nodes. If you are a data analytics or business intelligence tool, perhaps "meaningful" means quickly generating a dashboard with different visualizations after loading some data. Whatever "meaningful" means to your project, it should be achievable quickly and locally on a laptop.

A good example is [Linkerd's Getting Started][6]. Linkerd is an open source service mesh for Kubernetes. I'm a novice in Kubernetes and even less familiar with service mesh. Yet, I completed Linkerd's Getting Started guide on my laptop without much hassle, and the experience gave me a taste of what operating a service mesh is all about.

The three-step process above could be a helpful framework for designing a highly efficient Getting Started section in a measurable way. It is also related to the time-to-value metric when it comes to [productizing your open source project][7].

### Other core components

Besides carefully calibrating and optimizing your Getting Started, there are five other top-level components that are necessary to build full-fledged documentation: architectural design, in-production usage guide, use cases, references, and roadmap.

  * **Architectural design:** This is a deep-dive into your project's architecture and the rationales behind your design decisions, full of the details that you strategically glossed over in your Getting Started guide. This section is a big part of your overall [product marketing plan][8]. This section, usually filled with visuals and drawings, is meant to turn a casual hobbyist into an expert enthusiast who is interested in investing time in your project for the long term.
  * **In-production usage guide:** There is a world of difference between trying something out on a laptop and deploying it in production. Guiding a user who wants to use your project more seriously is an important next step. Demonstrating in-production operational knowledge is also how you attract your initial business customers who may like the promise of the technology but don't know or don't feel confident about using it in a production environment.
  * **Use cases:** The value of social proof is obvious, so listing your in-production adopters is important. The key here is to make sure this information is easy to find. It will likely be the second most popular link after Getting Started.
  * **References:** This section explains the project in detail and allows the user to examine and understand it under a microscope. It also functions as a dictionary where people look up information when needed. Some open source creators spend an inordinate amount of time spelling out every nuance and edge case of their project here. The motivation is understandable but unnecessary at the outset when your time is limited. It's more effective to reach a balance between detail and ways to get help: links to your community forum, Stack Overflow tag, or a separate FAQ page would do.
  * **Roadmap:** Laying out your future vision and plan with a rough timeline will keep users interested and incentivized for the long-term. Your project may not be perfect now, but you have a plan to perfect it. The Roadmap section is also a great place to get your community involved to build a strong ecosystem, so make sure you have a link that tells people how to voice their thoughts and opinions regarding the roadmap. (I'll write about community-building specifics in the future.)



You may not have all these components fully fleshed out yet, and some parts may materialize later than others, especially the use cases. However, be intentional about building these out over time. Addressing these five elements is the critical next step to your users' journey into your project, assuming they had a good experience with Getting Started.

One last note: include a clear one-sentence statement on what license you are using (probably in Getting Started, README, or somewhere else highly visible). This small touch will make vetting your project for adoption from the end user's side much more efficient.

### Spend 20% of your time writing

Generally, I recommend spending 10–20% of your time writing. Putting it in context: If you are working on your project full time, it's about half a day to one full day per week.

The more nuanced point here is you should work writing into your normal workflow, so it becomes a routine, not an isolated chore. Making incremental progress over time, rather than doing all the writing in one giant sitting, is what will help your project reach that ultimate goal: traction and trust.

* * *

_Special thanks to [Luc Perkins][9], developer advocate at the Cloud Native Computing Foundation, for his invaluable input._

_This article originally appeared on_ _[COSS Media][10]_ _and is republished with permission._

Nigel Babu offers 10 tips for taking your project's documentation to the next level.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/documentation

作者：[Kevin Xu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kevin-xu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-docdish-typewriter-pink.png?itok=OXJBtyYf (A pink typewriter)
[2]: https://www.grammar-monster.com/glossary/active_voice.htm
[3]: http://www.hemingwayapp.com/
[4]: https://www.grammarly.com/
[5]: https://en.wikipedia.org/wiki/Pareto_principle
[6]: https://linkerd.io/2/getting-started/
[7]: https://opensource.com/article/19/11/products-open-source-projects
[8]: https://opensource.com/article/20/2/product-marketing-open-source-project
[9]: https://twitter.com/lucperkins
[10]: https://coss.media/open-source-documentation-technical-writing-101/
