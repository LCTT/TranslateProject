Translating by Penney94
[GIVE AWAY YOUR CODE, BUT NEVER YOUR TIME][23]
============================================================

As software developers, I think we can agree that open-source code has [transformed the world][9]. Its public nature tears down the walls that prevent some pieces of software from becoming the best they can be. The problem is that too many valuable projects stagnate, with burned-out leaders:

> “I do not have the time or energy to invest in open source any more. I am not being paid at all to do any open source work, and so the work that I do there is time that I could be spending doing ‘life stuff’, or writing…It’s for this reason that I've decided to end all my engagements with open source effective today.”
> 
> —[Ryan Bigg, former maintainer of several Ruby and Elixir projects][1]
> 
> “It’s also been a massive opportunity cost because of all the things I haven’t learned or done in the meantime because FubuMVC takes up so much of my time and that’s the main reason that it has to stop now.”
> 
> —[Jeremy Miller, former project lead of FubuMVC][2]
> 
> “When we decide to start having kids, I will probably quit open source for good…I anticipate that ultimately this will be the solution to my problem: the nuclear option.”
> 
> —[Nolan Lawson, one of the maintainers of PouchDB][3]

What we need is a new industry norm, that project leaders will  _always_  be compensated for their time. We also need to bury the idea that any developer who submits an issue or pull request is automatically entitled to the attention of a maintainer.

Let’s first review how an open-source code base works in the market. It is a building block. It is [utility software][10], a cost that must be incurred by a business to make profit elsewhere. The community around the software grows if users can both understand the purpose of the code and see that it is a better value than the alternatives (closed-source off-the-shelf, custom in-house solution, etc.). It can be better, cheaper, or both.

If an organization needs to improve the code, they are free to hire any developer they want. It’s usually [in their interest][11] to contribute the improvement back to the community because, due to the complexity of merging, that’s the only way they can easily receive future improvements from other users. This “gravity” tends to hold communities together.

But it also burdens project maintainers since they must respond to these incoming improvements. And what do they get in return? At best, a community contribution may be something they can use in the future but not right now. At worst, it is nothing more than a selfish request wearing the mask of altruism.

One class of open-source projects has avoided this trap. What do Linux, MySQL, Android, Chromium, and .NET Core have in common, besides being famous? They are all  _strategically important_  to one or more big-business interests because they complement those interests. [Smart companies commoditize their complements][12] and there’s no commodity cheaper than open-source software. Red Hat needs companies using Linux in order to sell Enterprise Linux, Oracle uses MySQL as a gateway drug that leads to MySQL Enterprise, Google wants everyone in the world to have a phone and web browser, and Microsoft is trying to hook developers on a platform and then pull them into the Azure cloud. These projects are all directly funded by the respective companies.

But what about the rest of the projects out there, that aren’t at the center of a big player’s strategy?

If you’re the leader of one of these projects, charge an annual fee for community membership.  _Open source, closed community._  The message to users should be “do whatever you want with the code, but  _pay us for our time_ if you want to influence the project’s future.” Lock non-paying users out of the forum and issue tracker, and ignore their emails. People who don’t pay should feel like they are missing out on the party.

Also charge contributors for the time it takes to merge nontrivial pull requests. If a particular submission will not immediately benefit you, charge full price for your time. Be disciplined and [remember YAGNI][13].

Will this lead to a drastically smaller community, and more forks? Absolutely. But if you persevere in building out your vision, and it delivers value to anyone else, they will pay as soon as they have a contribution to make.  _Your willingness to merge contributions is [the scarce resource][4]._  Without it, users must repeatedly reconcile their changes with every new version you release.

Restricting the community is especially important if you want to maintain a high level of [conceptual integrity][14] in the code base. Headless projects with [liberal contribution policies][15] have less of a need to charge.

To implement larger pieces of your vision that do not justify their cost for your business alone, but may benefit others, [crowdfund][16]. There are many success stories:

> [Font Awesome 5][5]
> 
> [Ruby enVironment Management (RVM)][6]
> 
> [Django REST framework 3][7]

[Crowdfunding has limitations][17]. It [doesn’t work][18] for [huge projects][19]. But again, open-source code is utility software, which doesn’t need ambitious, risky game-changers. It has already [permeated every industry][20] with only incremental updates.

These ideas represent a sustainable path forward, and they could also fix the [diversity problem in open source][21], which may be rooted in its historically-unpaid nature. But above all, let’s remember that we only have [so many keystrokes left in our lives][22], and that we will someday regret the ones we waste.

  _When I say “open source”, I mean code [licensed][8] in a way that it can be used to build proprietary things. This usually means a permissive license (MIT or Apache or BSD), but not always. Linux is the core of today’s tech industry, yet it is licensed under the GPL._ 

Thanks to Jason Haley, Don McNamara, Bryan Hogan, and Nadia Eghbal for reading drafts of this.

--------------------------------------------------------------------------------

via: http://wgross.net/essays/give-away-your-code-but-never-your-time

作者：[William Gross][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://wgross.net/#about-section
[1]:http://ryanbigg.com/2015/11/open-source-work
[2]:https://jeremydmiller.com/2014/04/03/im-throwing-in-the-towel-in-fubumvc/
[3]:https://nolanlawson.com/2017/03/05/what-it-feels-like-to-be-an-open-source-maintainer/
[4]:https://hbr.org/2010/11/column-to-win-create-whats-scarce
[5]:https://www.kickstarter.com/projects/232193852/font-awesome-5
[6]:https://www.bountysource.com/teams/rvm/fundraiser
[7]:https://www.kickstarter.com/projects/tomchristie/django-rest-framework-3
[8]:https://choosealicense.com/
[9]:https://www.wired.com/insights/2013/07/in-a-world-without-open-source/
[10]:https://martinfowler.com/bliki/UtilityVsStrategicDichotomy.html
[11]:https://tessel.io/blog/67472869771/monetizing-open-source
[12]:https://www.joelonsoftware.com/2002/06/12/strategy-letter-v/
[13]:https://martinfowler.com/bliki/Yagni.html
[14]:http://wiki.c2.com/?ConceptualIntegrity
[15]:https://opensource.com/life/16/5/growing-contributor-base-modern-open-source
[16]:https://poststatus.com/kickstarter-open-source-project/
[17]:http://blog.felixbreuer.net/2013/04/24/crowdfunding-for-open-source.html
[18]:https://www.indiegogo.com/projects/geary-a-beautiful-modern-open-source-email-client#/
[19]:http://www.itworld.com/article/2708360/open-source-tools/canonical-misses-smartphone-crowdfunding-goal-by--19-million.html
[20]:http://www.infoworld.com/article/2914643/open-source-software/rise-and-rise-of-open-source.html
[21]:http://readwrite.com/2013/12/11/open-source-diversity/
[22]:http://keysleft.com/
[23]:http://wgross.net/essays/give-away-your-code-but-never-your-time
