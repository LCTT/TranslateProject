[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The state of open source translation tools for contributors to your project)
[#]: via: (https://opensource.com/article/19/6/translation-platforms-matter)
[#]: author: (Jean-Baptiste Holcroft https://opensource.com/users/jibec/users/jibec)

The state of open source translation tools for contributors to your project
======
There are almost 100 languages with more than 10 million speakers. How
many of your active contributors speak one?
![Team of people around the world][1]

In the world of free software, many people speak English: It is the **one** language. English helps us cross borders to meet others. However, this language is also a barrier for the majority of people.

Some master it while others don't. Complex English terms are, in general, a barrier to the understanding and propagation of knowledge. Whenever you use an uncommon English word, ask yourself about your real mastery of what you are explaining, and the unintentional barriers you build in the process.

_“If you talk to a man in a language he understands, that goes to his head. If you talk to him in his language, that goes to his heart.”_ — Nelson Mandela

We are 7 billion humans, and less than 400 million of us are English natives. The wonders done day after day by free/libre open source contributors deserve to reach the hearts of the [6.6 billion people][2] for whom English is not their mother tongue. In this day and age, we have the technology to help translate all types of content: websites, documentation, software, and even sounds and images. Even if I do not translate of all of these media personally, I do not know of any real limits. The only prerequisite for getting this content translated is both the willingness of the creators and the collective will of the users, customers, and—in the case of free software—the contributors.

### Why successful translation requires real tooling

Some projects are stuck in the stone ages and require translators to use [Git][3], [Mercurial][4], or other development tools. These tools don’t meet the needs of translation communities. Let’s help these projects evolve, as discussed in the section "A call for action."

Other projects have integrated translation platforms, which are key tools for linguistic diversity and existence. These tools understand the needs of translators and serve as a bridge to the development world. They make translation contribution easy, and keep those doing the translations motivated over time.

This aspect is important: There are almost 100 languages with more than 10 million speakers. Do you really believe that your project can have an active contributor for each of these languages? Unless you are a huge organization, like Mozilla or LibreOffice, there is no chance. The translators who help you also help two, ten, or a hundred other projects. They need tools to be effective, such as [translation memories][5], progress reports, alerts, ways to collaborate, and knowing that what they do is useful.

### Translation platforms are in trouble

However, the translation platforms distributed as free software are disappearing in favor of closed platforms. These platforms set their rules and efforts according to what will bring them the most profit.

Linguistic and cultural diversity does not bring money: It opens doors and allows local development. It emancipates populations and can ensure the survival of certain cultures and languages. In the 21st century, is your culture really alive if it does not exist in cyberspace?

The short history of translation platforms is not pretty:

  * In 2011, Transifex ceased to be open when they decided to no longer publish their source code.
  * Since September 2017, the [Pootle][6] project seems to have stalled.
  * In October 2018, the [Zanata][7] project shut down because it had not succeeded in building a community of technical contributors capable of taking over when corporate funding was halted.



In particular, the [Fedora Project][8]—which I work closely with—has ridden the roller coaster from Transifex to Zanata and is now facing another move and more challenges.

Two significant platforms remain:

  * [Pontoon][9]: Dedicated to the Mozilla use case (large community, common project).
  * [Weblate][10]: A generic platform created by developer [Michal Čihař][11] (a generic purpose platform).



These two tools are of high quality and are technically up-to-date, but Mozilla’s Pontoon is not designed to appeal to the greatest number of people. This project is dedicated to the specific challenges Mozilla faces. 

### A call for action

There is an urgent need for large communities to share resources to perpetuate Weblate as free software and promote its adoption. Support is also needed for other tools, such as [po4a][12], the [Translate Toolkit][13], and even our old friend [gettext][14]. Will we accept a sword of Damocles hanging over our heads? Will we continue to consume years of free work without giving a cent in return? Or will we take the lead in bringing security to our communities?

**What you can do as a contributor**: Promote Weblate as an open source translation platform, and help your beloved project use it. [Hosting is free for open source projects][15].

**What you can do as a developer**: Make sure all of your project’s content can be translated into any language. Think about this issue from the beginning, as all tools don’t provide the same internationalization features.

**What you can do as an entity with a budget**: Whether you’re a company or just part of the community, pay for the support, hosting, or development of the tools you use. Even if the amount is symbolic, doing this will lower the risks. In particular, [here is the info for Weblate][16]. (Note: I’m not involved with the Weblate project other than bug reports and translation.)

**What to do if you’re a language enthusiast**: Contact me to help create an open source language organization to promote our tools and their usage, and find money to fund them.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/translation-platforms-matter

作者：[Jean-Baptiste Holcroft][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jibec/users/jibec
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team_global_people_gis_location.png?itok=Rl2IKo12 (Team of people around the world)
[2]: https://www.ethnologue.com/statistics/size
[3]: https://git-scm.com
[4]: https://www.mercurial-scm.org
[5]: https://en.wikipedia.org/wiki/Translation_memory
[6]: http://pootle.translatehouse.org
[7]: http://zanata.org
[8]: https://getfedora.org
[9]: https://github.com/mozilla/pontoon/
[10]: https://weblate.org
[11]: https://cihar.com
[12]: https://po4a.org
[13]: http://docs.translatehouse.org/projects/translate-toolkit/en/latest/
[14]: https://www.gnu.org/software/gettext/
[15]: http://hosted.weblate.org/
[16]: https://weblate.org/en/hosting/
