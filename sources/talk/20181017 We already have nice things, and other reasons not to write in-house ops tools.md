We already have nice things, and other reasons not to write in-house ops tools
======
Let's look at the pitfalls of writing in-house ops tools, the circumstances that justify it, and how to do it better.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tool-hammer-nail-build-broken.png?itok=91xn-5wI)

When I was an ops consultant, I had the "great fortune" of seeing the dark underbelly of many companies in a relatively short period of time. Such fortune was exceptionally pronounced on one client engagement where I became the maintainer of an in-house deployment tool that had bloated to touch nearly every piece of infrastructure—despite lacking documentation and testing. Dismayed at the impossible task of maintaining this beast while tackling the real work of improving the product, I began reviewing my old client projects and probing my ops community for their strategies. What I found was an epidemic of "[not invented here][1]" (NIH) syndrome and a lack of collaboration with the broader community.

### The problem with NIH

One of the biggest problems of NIH is the time suck for engineers. Instead of working on functionality that adds value to the business, they're adding features to tools that solve standard problems such as deployment, continuous integration (CI), and configuration management.

This is a serious issue at small or midsized startups, where new hires need to hit the ground running. If they have to learn a completely new toolset, rather than drawing from their experience with industry-standard tools, the time it takes them to become useful increases dramatically. While the new hires are learning the in-house tools, the company remains reliant on the handful of people who wrote the tools to document, train, and troubleshoot them. Heaven forbid one of those engineers succumbs to [the bus factor][2], because the possibility of getting outside help if they forgot to document something is zero.

### Do you need to roll it yourself?

Before writing your own ops tool, ask yourself the following questions:

  * Have we polled the greater ops community for solutions?
  * Have we compared the costs of proprietary tools to the estimated engineering time needed to maintain an in-house solution?
  * Have we identified open source solutions, even those that lack desired features, and attempted to contribute to them?
  * Can we fork any open source tools that are well-written but unmaintained?



If you still can't find a tool that meets your needs, you'll have to roll your own.

### Tips for rolling your own

Here's a checklist for rolling your own solutions:

  1. In-house tooling should not be exempt from the high standards you apply to the rest of your code. Write it like you're going to open source it.
  2. Make sure you allow time in your sprints to work on feature requests, and don't allow features to be rushed in before proper testing and documentation.
  3. Keep it small. It's going to be much harder to exact any kind of exit strategy if your tool is a monstrosity that touches everything.
  4. Track your tool's usage and prune features that aren't actively utilized.



### Have an exit strategy

Open sourcing your in-house tool is not an exit strategy per se, but it may help you get outside contributors to free up your engineers' time. This is the more difficult strategy and will take some extra care and planning. Read "[Starting an Open Source Project][3]" and "[So You've Decided To Open-Source A Project At Work. What Now?][4]" before committing to this path. If you're interested in a cleaner exit, set aside time each quarter to research and test new open source replacements.

Regardless of which path you choose, explicitly stating that an in-house solution is not the preferred state—early in its development—should clear up any confusion and prevent the issue of changing directions from becoming political.

Sabice Arkenvirr will present [We Already Have Nice Things, Use Them!][5] at [LISA18][6], October 29-31 in Nashville, Tennessee, USA.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/nice-things

作者：[Sabice Arkenvirr][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/vishuzdelishuz
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Not_invented_here
[2]: https://en.wikipedia.org/wiki/Bus_factor
[3]: https://opensource.guide/starting-a-project/
[4]: https://www.smashingmagazine.com/2013/12/open-sourcing-projects-guide-getting-started/
[5]: https://www.usenix.org/conference/lisa18/presentation/arkenvirr
[6]: https://www.usenix.org/conference/lisa18
