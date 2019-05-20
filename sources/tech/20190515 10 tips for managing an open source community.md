[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (10 tips for managing an open source community)
[#]: via: (https://opensource.com/article/19/5/tips-managing-community)
[#]: author: (Antoine Thomas https://opensource.com/users/ttoine/users/greg-p/users/mbbroberg/users/greg-p/users/wgarry155)

10 tips for managing an open source community
======
Work better with developers, users, and even trolls with these best
practices for open source projects.
![Illustration of a group of people working together][1]

Twenty years ago, I started using free and open source software. Soon after, I started asking questions on dedicated forums, learned how to use IRC to chat with developers, and contributed my first bug reports. As my contributions increased, I made a career move from industry to open source software.

Over the past 20 years, I've learned a lot about using and contributing to free and open source software and working with communities and developers. Here are 10 of the key areas you'll find in an open source project and some tips for managing them better.

### 1\. Newbies

New users will never change: they will not search for existing answers, and their questions are always urgent—for them, of course. Sometimes they don't understand that using open source software means they are responsible for how they use it. They don't know the difference between a project and a product. That's why they don't know the difference between community support, free support, and paid support.

On many forums and Q&A engines, you can add guidelines and other tips and tricks to help newbies write good questions that include the basic information required. If possible, enable features like duplicates and automatic suggestions in order to clear up the queue and information provided. Of course, seasoned community members and project experts can be annoyed with [beginners][2], but don't forget that everyone was once a beginner, too.

That's why the next point is so important.

### 2\. Education

Most people don't understand anything about free and open source software, communities, and related topics. Don't expect that most people will learn on their own. The key is to offer education, education, and more [education][3].

In your materials:

  * Clarify your business, your project, your products (e.g., the difference between a project and a product), and teach open source best practices inside and outside the company (yes, "inside" includes your colleagues and managers).
  * Write clear communication on your websites (corporate, project, docs, blog, etc.).
  * Remove the words "free" and "gratis" from your communications and content, and replace it with "open source" everywhere it is appropriate.



Your target is to help users understand that they are downloading an open source _project_ , not a product. This helps them develop accurate expectations about getting support and being responsible users.

### 3\. Forge

No matter what contribution system you use, how fast you sort issues, and how seriously you review code, some people will complain—that their issues are critical and must be fixed immediately, that [maintainers][4] are not kind or skilled enough, it is too complicated to submit code, and so forth. Some will share code on social networks rather than on the forge; they say they don't have the time for that, and the maintainers should do it.

A few ideas:

  * Create automated or standard answers to manage these kinds of users and messages so they don't consume unnecessary time.
  * Assign a project manager, community manager, or someone else to handle difficult people and discussions.
  * Always be welcoming, polite, and respectful; this will show your goodwill toward people.
  * Take time to mentor people who show interest in the project and want to learn and contribute.
  * Give more rights on the forge to people who earn it.
  * Write clear rules about how to get rights, how to lose rights, causes for being banned, etc., and include them in your developer documentation or contributing.md.
  * Keep in mind that contributors come from all around the world with different cultures, origins, and native languages, and their English might not be perfect. Stay open and tolerant.



### 4\. Documentation

Documentation will never be perfect nor up to date. It is always a best effort and a work in progress.

In some teams, [documentation and tutorials][5] are part of the work, which means the feature will not be merged if the developer hasn't written documentation. You may want to try this practice with your team and project.

Keep in mind that sometimes it is easier and more useful to write a step-by-step tutorial about questions that come up often in the community, rather than full, detailed documentation on a specific topic.

In your docs, you must include at least:

  * A description of the project, what it does, what it does not do (if needed), the current roadmap, and the distribution license
  * How to install and a list of prerequisites
  * Basic instructions for end users
  * Basic instructions for maintainers (run, updates, monitor, etc.)
  * How to build from source
  * How to contribute on the forge
  * How to write code (the expected standards per language)
  * How to write and run tests
  * A list of dependencies and their licenses
  * A list of all the software's extension systems and how to use them with examples (e.g., modules, themes, hooks, APIs, etc.)
  * Links to tutorials and interesting technical content on other websites
  * Ways to contribute to the project other than code (see #8 below for more)



Don't expect that smart users and good developers will figure this stuff out by themselves; they need you to provide this information to save time and comply with your project's best practices and requirements. Good documentation is a mark of seriousness. If it is not available, people will look for another project.

### 5\. Business

Many experts say that there is no [open source business model][6]. Nobody actually sells open source code for real. Companies do business with open source software and sell everything around it (certified builds, packaging, distribution, services, legal support, technical support, the marketplace, etc.).

This brings us back to point two above: education. Management, marketing, sales, and even developers must understand what open source is to understand what they sell, what they develop, and what the company really does.

It is essential to create content for them: FAQs, articles, workshops, blog posts, and whatever else will help them. These articles may help:

  * [Open source for products in four rules (and 10 slides)][7] by Stephen Walli
  * [Open source archetypes: A framework for purposeful open source][8] by Mozilla



### 6\. Trolls

There are many different types of trolls: some are active in the community, others use your software for their business, and some are just trolling your communication channels. But they all have one thing in common: they complain—that your project sucks, that your company doesn't know how to do business, that your dev team is unskilled, that the roadmap stinks, that community members are idiots—using an aggressive tone and insults. Some of them have strong expertise and could be useful if only they had a positive attitude… but, as usual, "haters gonna hate."

It's difficult (almost impossible) to manage trolls, but you can learn how to use them well:

  * When they provide enough information in their complaints or create issues or pull requests, thank them and give them credit when possible (they will love and hate this at the same time).
  * Counter lies on your communication channels with facts, and only facts (no opinions). But don't spend time fighting them, because you will feed them and they will gain more power against you.
  * Never, never, never, ever be aggressive or insulting; always stay calm and polite whatever they do, even if they insult you. The community will appreciate this, and you will earn credit and respect for being the good guy.
  * Invite them to meet you in real life at events and meetups, acknowledge their expertise, and tell them that their help is always welcome and appreciated.
  * Sometimes, there is no other choice but to ban them. If a troll has supporters on a specific case, this can create very bad momentum for the community. But people forget quickly when things become better later.



The Holy Grail with trolls is to turn them into good people who will use their enormous amount of energy for good. This is hard, it takes time, but it is possible.

### 7\. Developers

Because developers are difficult to hire and very well paid, some think they rule the world. Don't tell them, but they are actually ruled by the programming language, the author(s) of the specifications, and the person(s) who decides their priorities. (Who said "users"?)

Take care of them and take time to get to know them; they are skilled people who write your project's code, but they are humans too. :-)

If it is possible, create opportunities for them to meet in real life once or twice a year.

The good thing: the best developers are usually nice, humble people and love to solve problems with elegant solutions. That's the best clue I can offer to identify the best among their peers.

### 8\. Contributors

It is very hard to get people in an open source project to do the things _you_ really want or need: they participate and contribute for their own interests and with the skills they have.

Their interests may include:

  * Contributing code to a project to improve their skills through code reviews and mentoring
  * Adding lines on their resume to find a job
  * Fixing and improving the project so it will be better for their specific use (their customers, their employer, etc.)
  * Gaining visibility as an expert in the project's ecosystem and increasing their average daily rate



If you have specific needs, you can try to create a bounty program—and yes, this means providing some money or exciting rewards—to incentivize people to solve them.

Don't forget that there are many different ways to contribute to an open source project:

  * Using and spreading the word about your project
  * Planning events (e.g., meetups, conventions)
  * Design (e.g., mock-ups, specs)
  * Writing (e.g., documentation, tutorials, video tutorials, blogs)
  * Gardening (e.g., sorting issues and pull requests, moderating the forum)
  * Helping on the forum, chat, or other communication channels
  * And, finally, coding (yes, usually only a few people in the community are skilled enough to provide good code)



Tips:

  * Understanding the reasons why people contribute to your project will help you understand your community and your users. Meet them in real life at events and meetups, chat with them on social networks, and just ask them why they are participating.
  * Make it easy to contribute in different ways
  * Feature contributors and community leaders on your blog



### 9\. Intellectual property (IP)

People don't understand anything about copyright, licenses, distribution compatibilities, brand management, patents, and IP in general. Even most developers don't know that they are authors, that their employer owns the rights of what they write, or that they need to care about licenses. I think this topic should be taught more in engineering schools.

IP is related to source code management, but it also includes brand management (e.g., name and logo), project dependencies and license compatibilities, contributors, and much more.

To make a long story short:

  * Writing software is like writing a book, with authors, editors, distribution, copyright management, etc., and your project's license is a contract between the project authors/editors and the users/contributors.
  * Companies will use your project to solve a business-related problem for them or their customers.
  * Freelancers and small businesses may not be very careful about IP, they will test your software, and if they like it, they will use it.
  * If a big corporation is interested in your software project, they will first check that the IP is clean. If the lawyers approve it, the corporation will start to use it and eventually hire developers. If you are lucky enough, they might even contribute back some features and improvements.



Keep in mind: Intellectual property is very important for open source projects and yet very underestimated. Usually, it is managed by the foundation or the company hosting the project.

### 10\. Community

Organize your communication channels and resources like a knowledge base: they must be easy to write, easy to improve, and easy to find.

There are two categories of information you need to manage in your community:

  * About the project and software
  * About the community members



The first one is obvious. With wikis (docs), forums, bug trackers, and code management tools like Git, you will gather a lot (yes, a lot) of information about the project. The key here is to think about categories, moderation, links, and a bit of SEO.

The second one—about the community members and project users—is highly underestimated. You must be very careful with personal information, but create a way for contributors to display who they are and what they do with the software. A good start is to enable user profiles on the forum with interesting fields and information about your project. Then, try to add a bit of gamification to identify the leaders in the community. At some point, think about using a customer relationship management (CRM) solution to keep track of interactions you have with people—those you meet in real life, authors of major contributions, etc.

This way you will increase knowledge of both the project and its contributors. This will help you create a better project and become a better community manager or project owner.

* * *

If you're an open source project manager, contributor, or user, what tips do you have to add to this list? Please share your ideas in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/tips-managing-community

作者：[Antoine Thomas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ttoine/users/greg-p/users/mbbroberg/users/greg-p/users/wgarry155
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/group_team_hackathon_code_classroom.jpg?itok=g6IQ3a7c (Illustration of a group of people working together)
[2]: /resources/beginners-open-source
[3]: /article/18/1/best-open-education
[4]: /article/18/11/ways-give-thanks-open-source
[5]: /business/15/7/10-tips-better-documentation
[6]: /article/17/12/open-source-business-models
[7]: https://opensource.com/business/15/8/open-source-products-four-rules
[8]: https://blog.mozilla.org/wp-content/uploads/2018/05/MZOTS_OS_Archetypes_report_ext_scr.pdf
