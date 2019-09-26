[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to be good at creating and maintaining systems at-large)
[#]: via: (https://opensource.com/article/19/7/book-review-building-evolutionary-architectures)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)

How to be good at creating and maintaining systems at-large
======
A book review of "Building Evolutionary Architectures: Support Constant
Change" for open source and security folks
![An open book][1]

Initially, this article was simply a review of the book, but as I got into it, I realised that I wanted to talk about how the approach it describes is applicable to a couple of different groups (security folks and open source projects), and so I’ve gone with it.

How, then, did I come across the book? I was attending a conference a few months ago (DeveloperWeek San Diego), and decided to go to one of the sessions because it looked interesting. The speaker was Dr. Rebecca Parsons, and I liked what she was talking about so much that I ordered this book, whose subject was the topic of her talk, to arrive at home by the time I would return a couple of days later.

![Building Evolutionary Architectures: Support Constant Change][2]

[_Building Evolutionary Architectures: Support Constant Change_][3] is not a book about securitym, and I'm a security guy, but it deals with security as one application of its approach, and very convincingly. The central issue that the authors—all employees of ThoughtWorks—identify is, simplified, that although we’re good at creating features for applications, we’re less good at creating, and then maintaining, broader properties of systems. This problem is compounded, they suggest, by the fast and ever-changing nature of modern development practices, where "enterprise architects can no longer rely on static planning".

The alternative that they propose is to consider "fitness functions", "objectives you want your architecture to exhibit or move towards". Crucially, these are properties of the architecture—or system—rather than features or specific functionality. Tests should be created to monitor the specific functions, but they won’t be your standard unit tests, nor will they necessarily be "point in time" tests. Instead, they will measure a variety of issues, possibly over a period of time, to let you know whether your system is meeting the particular fitness functions you are measuring. There’s a lot of discussion of how to measure these fitness functions, but I would have liked even more. From my point of view, it was one of the most valuable topics covered.

Frankly, the above might be enough to recommend the book, but there’s more. They advocate strongly for creating incremental change to meet your requirements (gradual, rather than major changes) and "evolvable architectures", encouraging you to realise that:

  1. you may not meet all your fitness functions at the beginning;
  2. applications which may have met the fitness functions at one point may _cease_ to meet them later on, for various reasons;
  3. your architecture is likely to change over time;
  4. your requirements, and therefore the priority that you give to each fitness function, will change over time;
  5. even if your fitness functions remain the same, the ways in which you need to monitor them may change.



All of these are, in my view, extremely useful insights for anybody designing and building a system. Combining them with architectural thinking is even more valuable.

As is standard for modern O’Reilly books, there are examples throughout, including a worked fake consultancy journey of a particular company with specific needs, leading you through some of the practices in the book. At times, this felt a little contrived, but the mechanism is generally helpful. There were times when the book seemed to stray from its core approach—which is architectural, as per the title—into explanations through pseudo code, but these support one of the useful aspects of the book, which is giving examples of what architectures are more or less suited to the principles expounded in the more theoretical parts. Some readers may feel more at home with the theoretical, others with the more example-based approach (I lean towards the former), but all in all, it seems like an appropriate balance. Relating these to the impact of "architectural coupling" was particularly helpful, in my view.

There is a useful grounding in some of the advice in Conway’s Law ("Organizations which design systems … are constrained to produce designs which are copies of the communication structures of these organizations.") which led me to wonder how we could model open source projects—and their architectures—based on this perspective. There are also (as is also standard these days) patterns and anti-patterns: I would generally consider these a useful part of any book on design and architecture.

### Why is this a book for security folks?

The most important thing about this book, from my point of view as a security systems architect, is that it _isn’t_ about security. Security is mentioned, but is not considered core enough to the book to merit a mention in the appendix. The point, though, is that the security of a system—an embodiment of an architecture—is a perfect example of a fitness function. Taking this as a starting point for a project will help you do two things.

First, you will avoid focussing on features and functionality, and look at the bigger picture. Second, you will consider what you _really_ need from security in the system, and how that translates into issues such as the security posture to be adopted, and the measurements you will take to validate it through the lifecycle.

Possibly even more important than those two points is that it will force you to consider the priority of security in relation to other fitness functions (resilience, maybe, or ease of use?) and how the relative priorities will—and should—change over time. A realisation that we don’t live in a bubble, and that our priorities are not always that same as those of other stakeholders in a project, is always useful.

### Why is this a book for open source folks?

Very often—and for quite understandable and forgiveable reasons—the architectures of open source projects grow organically at first, needing major overhauls and refactoring at various stages of their lifecycles. This is not to say that this doesn’t happen in proprietary software projects as well, of course, but the sometimes frequent changes in open source projects' emphasis and requirements, the ebb and flow of contributors and contributions and the sometimes, um, reduced levels of documentation aimed at end users can mean that features are significantly prioritised over what we could think of as the core vision of the project. One way to remedy this would be to consider the appropriate fitness functions of the project, to state them upfront, and to have a regular cadence of review by the community, to ensure that they are:

  * still relevant;
  * correctly prioritised at this stage in the project;
  * actually being met.



If any of the above come into question, it’s a good time to consider a wider review by the community, and maybe a refactoring or partial redesign of the project.

Open source projects have—quite rightly—various different models of use and intended users. One of the happenstances that can negatively affect a project is when it is identified as a possible fit for a use case for which it was not originally intended. Academic software which is designed for accuracy over performance might not be a good fit for corporate research, for instance, in the same way that a project aimed at home users which prioritises minimal computing resources might not be appropriate for a high-availability enterprise roll-out. One of the ways of making this clear is by being very clear up-front about the fitness functions that you expect your project to meet—and, vice versa, about the fitness functions you are looking to fulfil when you are looking to select a project. It is easy to focus on features and functionality, and to overlook the more non-functional aspects of a system, and fitness functions allow us to make some informed choices about how to balance these decisions.

_This article was originally posted on [Alice, Eve and Bob - a security blog][4]._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/book-review-building-evolutionary-architectures

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open_book_color.jpg?itok=I-8tNQOP (An open book)
[2]: https://opensource.com/sites/default/files/styles/medium/public/uploads/building-evolutionary-architectures.jpg?itok=UlyKLSxV (Building Evolutionary Architectures: Support Constant Change)
[3]: https://www.oreilly.com/library/view/building-evolutionary-architectures/9781491986356/
[4]: https://aliceevebob.com/2019/06/25/building-evolutionary-architectures-for-security-and-for-open-source/
