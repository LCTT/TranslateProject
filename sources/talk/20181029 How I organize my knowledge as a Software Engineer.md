@flowsnow is translating


How I organize my knowledge as a Software Engineer
============================================================


Software Development and Technology in general are areas that evolve at a very fast pace and continuous learning is essential.
Some minutes navigating in the internet, in places like Twitter, Medium, RSS feeds, Hacker News and other specialized sites and communities, are enough to find lots of great pieces of information from articles, case studies, tutorials, code snippets, new applications and much more.

Saving and organizing all that information can be a daunting task. In this post I will present some tools tools that I use to do it.

One of the points I consider very important regarding knowledge management is to avoid lock-in in a particular platform. All the tools I use, allow to export your data in standard formats like Markdown and HTML.

Note that, My workflow is not perfect and I am constantly searching for new tools and ways to optimize it. Also everyone is different, so what works for me might not working well for you.

### Knowledge base with NotionHQ

For me, the fundamental piece of Knowledge management is to have some kind of personal Knowledge base / wiki. A place where you can save links, bookmarks, notes etc in an organized manner.

I use [NotionHQ][7] for that matter. I use it to keep notes on various topics, having lists of resources like great libraries or tutorials grouped by programming language, bookmarking interesting blog posts and tutorials, and much more, not only related to software development but also my personal life.

What I really like about Notion, is how simple it is to create new content. You write it using Markdown and it is organized as tree.

Here is my top level pages of my "Development" workspace:

 [![Image](https://res.cloudinary.com/practicaldev/image/fetch/s--uMbaRUtu--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/http://i.imgur.com/kRnuvMV.png)][8] 

Notion has some nice other features like integrated spreadsheets / databases and Task boards.

You will need to subscribe to paid Personal Plan, if you want to use Notion seriously as the free plan is somewhat limited. I think its worth the price. Notion allows to export your entire workspace to Markdown files. The export has some important problems, like loosing the page hierarchy, but hope Notion Team can improve that.

As a free alternative I would probably use [VuePress][9] or [GitBook][10] to host my own.

### Save interesting articles with Pocket

[Pocket][11] is one of my favorite applications ever! With Pocket you can create a reading list of articles from the Internet. 
Every time I see an article that looks interesting, I save it to Pocket using its Chrome Extension. Later on, I will read it and If I found it useful enough, I will use the "Archive" function of Pocket to permanently save that article and clean up my Pocket inbox.

I try to keep the Reading list small enough and keep archiving information that I have dealt with. Pocket allows you to tag articles which will make it simpler to search articles for a particular topic later in time.

You can also save a copy of the article in Pocket servers in case of the original site disappears, but you will need Pocket Premium for that.

Pocket also have a "Discover" feature which suggests similar articles based on the articles you have saved. This is a great way to find new content to read.

### Snippet Management with SnippetStore

From GitHub, to Stack Overflow answers, to blog posts, its common to find some nice code snippets that you want to save for later. It could be some nice algorithm implementation, an useful script or an example of how to do X in Y language.

I tried many apps from simple GitHub Gists to [Boostnote][12] until I discovered [SnippetStore][13].

SnippetStore is an open source snippet management app. What distinguish SnippetStore from others is its simplicity. You can organize snippets by Language or Tags and you can have multi file snippets. Its not perfect but it gets the job done. Boostnote, for example has more features, but I prefer the simpler way of organizing content of SnippetStore.

For abbreviations and snippets that I use on a daily basis, I prefer to use my Editor / IDE snippets feature as it is more convenient to use. I use SnippetStore more like a reference of coding examples.

[Cacher][14] is also an interesting alternative, since it has integrations with many editors, have a cli tool and uses GitHub Gists as backend, but 6$/month for its pro plan, its too much IMO.

### Managing cheat sheets with DevHints

[Devhints][15] is a collection of cheat sheets created by Rico Sta. Cruz. Its open source and powered by Jekyll, one of the most popular static site generator.

The cheat sheets are written in Markdown with some extra formatting goodies like support for columns.

I really like the looks of the interface and being Markdown makes in incredibly easy to add new content and keep it updated and in version control, unlike cheat sheets in PDF or Image format, that you can find on sites like [Cheatography][16].

As it is open source I have created my own fork, removed some cheat sheets that I dont need and add some more.

I use cheat sheets as reference of how to use some library or programming language or to remember some commands. Its very handy to have a single page, with all the basic syntax of a specific programming language for example.

I am still experimenting with this but its working great so far.

### Diigo

[Diigo][17] allows you to Annotate and Highlight parts of websites. I use it to annotate important information when studying new topics or to save particular paragraphs from articles, Stack Overflow answers or inspirational quotes from Twitter! ;)

* * *

And thats it. There might be some overlap in terms of functionality in some of the tools, but like I said in the beginning, this is an always evolving workflow, as I am always experimenting and searching for ways to improve and be more productive.

What about you? How to you organize your Knowledge?. Please feel free to comment below.

Thank you for reading.

------------------------------------------------------------------------

作者简介：

Bruno Paz
Web Engineer. Expert in #PHP and @Symfony Framework. Enthusiast about new technologies. Sports and @FCPorto fan!

--------------------------------------------------------------------------------

via: https://dev.to/brpaz/how-do-i-organize-my-knowledge-as-a-software-engineer-4387

作者：[ Bruno Paz][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[oska874](https://github.com/oska874)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://brunopaz.net/
[1]:https://dev.to/brpaz
[2]:http://twitter.com/brunopaz88
[3]:http://github.com/brpaz
[4]:https://dev.to/t/knowledge
[5]:https://dev.to/t/learning
[6]:https://dev.to/t/development
[7]:https://www.notion.so/
[8]:https://res.cloudinary.com/practicaldev/image/fetch/s--uMbaRUtu--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/http://i.imgur.com/kRnuvMV.png
[9]:https://vuepress.vuejs.org/
[10]:https://www.gitbook.com/?t=1
[11]:https://getpocket.com/
[12]:https://boostnote.io/
[13]:https://github.com/ZeroX-DG/SnippetStore
[14]:https://www.cacher.io/
[15]:https://devhints.io/
[16]:https://cheatography.com/
[17]:https://www.diigo.com/index
