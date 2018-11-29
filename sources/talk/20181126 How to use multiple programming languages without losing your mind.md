heguangzhi Translating

[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (How to use multiple programming languages without losing your mind)
[#]: via: (https://opensource.com/article/18/11/multiple-programming-languages)
[#]: author: (Bart Copeland https://opensource.com/users/bartcopeland)
[#]: url: ( )

How to use multiple programming languages without losing your mind
======
A polyglot environment is a double-edged sword, bringing benefits along with complexities that may threaten the organization.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/books_programming_languages.jpg?itok=KJcdnXM2)

With all the different programming languages available today, many organizations have become digital polyglots. Open source opens up a world of languages and technology stacks developers can use to accomplish their tasks, including developing and supporting legacy and modern software applications.

Polyglots can talk with millions more people than those who only speak their native language. In software environments, developers don't introduce new languages to achieve specifc ends, not to communicate better. Some languages are great for one task but not another, so working with multiple programming languages enables developers to use the right tool for the job. In this way, all development is polyglot; it's just the nature of the beast.

The creation of a polyglot environment is often gradual and situational. For example, when an enterprise acquires a company, it takes on the company's technology stacks—including its programming languages. Or as tech leadership changes, new leaders may bring different technologies into the fold. Technologies also fall in and out of fashion, expanding the number of programming languages and technologies an organization has to maintain over time.

A polyglot environment is a double-edged sword for enterprises, bringing benefits but also complexities and challenges. Ultimately, if the situation remains unchecked, polyglot will kill your enterprise.

### Tricky technical tongue-twisters

Where there are multiple different technologies—programming languages, legacy tools, and up-and-coming technology stacks—there is complexity. Engineering teams spend more time wrestling to retrofit programming languages with licenses, security, and dependencies. At the same time, management lacks oversight on code compliance and can't gauge risk.

What happens is that enterprises have varying degrees of programming language quality and high variability in tooling support. It's hard to become an expert in one language when you're required to work with a dozen. There's a big difference in skill level between a person who speaks French and Italian fluently and a person who can string a few sentences together in eight languages. The same is true for developers and programming languages.

The difficulties only increase with the addition of more programming languages, leading to a digital Tower of Babel.

The answer is not to take away the tools your developers need for the job. Adding new programming languages builds their skill base and empowers them with the right equipment to fulfill their craft. So, you want to say "yes" to your developers, but as more and more programming languages are added to the enterprise, they impose a drag on your software development lifecycle (SDLC). At scale, all these languages and tools can kill the enterprise.

There are three main issues enterprises should pay attention to:

  1. **Visibility:** Teams come together for a project, then disband. Applications are released and never updated—why fix what's not broken? As a result, when a critical vulnerability is discovered, the enterprise may not have visibility into which applications are affected, which libraries those applications contain, or even what languages they were built with. This can result in costly  "exploration projects" to ensure the vulnerability is properly addressed.
  2. **Updating or coding:** Some enterprises centralize the updating and fixing function in a single team. Others require that each  "pizza team" manage its own development tools. In either case, the engineering team and management pay an opportunity cost: rather than coding new features, these teams are constantly updating and fixing libraries in their open source tools since they move so quickly.
  3. **Reinventing the wheel:** Since code dependencies and library versions are constantly being updated, the artifacts associated with the original build of an application may no longer be available when a vulnerability is found. As a result, many development cycles are wasted trying to recreate an environment in which the vulnerability can be fixed.



Multiply each programming language in your organization by these three issues, and what started out as a molehill suddenly looks like Mount Everest. And just like a mountain climber, you won't survive without the proper equipment and tools.

### Finding your Rosetta Stone

A comprehensive solution that serves the needs of the enterprise and its individual stakeholders in the SDLC is in order. Enterprises can create this solution using these best practices:

  1. Monitor code running in production and respond based on risk of flagged components (e.g., common vulnerabilities and exposures components) used in your applications.
  2. Receive regular updates to keep code current and bug-free.
  3. Use commercial open source support to get help with programming language versions and platforms that are near end-of-life and not supported by the community.
  4. Standardize specific programming language builds across your enterprise to enable consistent environments across teams and minimize dependencies.
  5. Set thresholds for when to trigger an update, alarm, or another kind of event based on dependencies.
  6. Create a single source of truth for your package management; this may require the assistance of a knowledgeable technology provider.
  7. Get smaller build distributions with only the packages you need, based on your specific criteria.



Using these best practices, developers can maximize their time to create more value for the enterprise instead of doing basic tooling or build-engineering tasks. This will create code consistency in all environments in the software development life cycle (SDLC). It will also create greater efficiency and cost savings as fewer resources are needed to maintain programming languages and package distributions. This new way of operating will make the lives of both technical staff and management easier.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/multiple-programming-languages

作者：[Bart Copeland][a]
选题：[lujun9972][b]
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bartcopeland
[b]: https://github.com/lujun9972
