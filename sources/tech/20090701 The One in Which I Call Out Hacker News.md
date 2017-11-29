##Translating by XiatianSummer

# [The One in Which I Call Out Hacker News][14]


> “Implementing caching would take thirty hours. Do you have thirty extra hours? No, you don’t. I actually have no idea how long it would take. Maybe it would take five minutes. Do you have five minutes? No. Why? Because I’m lying. It would take much longer than five minutes. That’s the eternal optimism of programmers.”
> 
> — Professor [Owen Astrachan][1] during 23 Feb 2004 lecture for [CPS 108][2]

[Accusing open-source software of being a royal pain to use][5] is not a new argument; it’s been said before, by those much more eloquent than I, and even by some who are highly sympathetic to the open-source movement. Why go over it again?

On Hacker News on Monday, I was amused to read some people saying that [writing StackOverflow was hilariously easy][6]—and proceeding to back up their claim by [promising to clone it over July 4th weekend][7]. Others chimed in, pointing to [existing][8] [clones][9] as a good starting point.

Let’s assume, for sake of argument, that you decide it’s okay to write your StackOverflow clone in ASP.NET MVC, and that I, after being hypnotized with a pocket watch and a small club to the head, have decided to hand you the StackOverflow source code, page by page, so you can retype it verbatim. We’ll also assume you type like me, at a cool 100 WPM ([a smidge over eight characters per second][10]), and unlike me,  _you_  make zero mistakes. StackOverflow’s *.cs, *.sql, *.css, *.js, and *.aspx files come to 2.3 MB. So merely typing the source code back into the computer will take you about eighty hours if you make zero mistakes.

Except, of course, you’re not doing that; you’re going to implement StackOverflow from scratch. So even assuming that it took you a mere ten times longer to design, type out, and debug your own implementation than it would take you to copy the real one, that already has you coding for several weeks straight—and I don’t know about you, but I am okay admitting I write new code  _considerably_  less than one tenth as fast as I copy existing code.

 _Well, okay_ , I hear you relent. *So not the whole thing. But I can do **most** of it.*

Okay, so what’s “most”? There’s simply asking and responding to questions—that part’s easy. Well, except you have to implement voting questions and answers up and down, and the questioner should be able to accept a single answer for each question. And you can’t let people upvote or accept their own answers, so you need to block that. And you need to make sure that users don’t upvote or downvote another user too many times in a certain amount of time, to prevent spambots. Probably going to have to implement a spam filter, too, come to think of it, even in the basic design, and you also need to support user icons, and you’re going to have to find a sanitizing HTML library you really trust and that interfaces well with Markdown (provided you do want to reuse [that awesome editor][11] StackOverflow has, of course). You’ll also need to purchase, design, or find widgets for all the controls, plus you need at least a basic administration interface so that moderators can moderate, and you’ll need to implement that scaling karma thing so that you give users steadily increasing power to do things as they go.

But if you do  _all that_ , you  _will_  be done.

Except…except, of course, for the full-text search, especially its appearance in the search-as-you-ask feature, which is kind of indispensable. And user bios, and having comments on answers, and having a main page that shows you important questions but that bubbles down steadily à la reddit. Plus you’ll totally need to implement bounties, and support multiple OpenID logins per user, and send out email notifications for pertinent events, and add a tagging system, and allow administrators to configure badges by a nice GUI. And you’ll need to show users’ karma history, upvotes, and downvotes. And the whole thing has to scale really well, since it could be slashdotted/reddited/StackOverflown at any moment.

But  _then_ ! **Then** you’re done!

…right after you implement upgrades, internationalization, karma caps, a CSS design that makes your site not look like ass, AJAX versions of most of the above, and G-d knows what else that’s lurking just beneath the surface that you currently take for granted, but that will come to bite you when you start to do a real clone.

Tell me: which of those features do you feel you can cut and still have a compelling offering? Which ones go under “most” of the site, and which can you punt?

Developers think cloning a site like StackOverflow is easy for the same reason that open-source software remains such a horrible pain in the ass to use. When you put a developer in front of StackOverflow, they don’t really  _see_ StackOverflow. What they actually  _see_  is this:

```
create table QUESTION (ID identity primary key,
                       TITLE varchar(255), --- why do I know you thought 255?
                       BODY text,
                       UPVOTES integer not null default 0,
                       DOWNVOTES integer not null default 0,
                       USER integer references USER(ID));
create table RESPONSE (ID identity primary key,
                       BODY text,
                       UPVOTES integer not null default 0,
                       DOWNVOTES integer not null default 0,
                       QUESTION integer references QUESTION(ID))
```

If you then tell a developer to replicate StackOverflow, what goes into his head are the above two SQL tables and enough HTML to display them without formatting, and that really  _is_  completely doable in a weekend. The smarter ones will realize that they need to implement login and logout, and comments, and that the votes need to be tied to a user, but that’s still totally doable in a weekend; it’s just a couple more tables in a SQL back-end, and the HTML to show their contents. Use a framework like Django, and you even get basic users and comments for free.

But that’s  _not_  what StackOverflow is about. Regardless of what your feelings may be on StackOverflow in general, most visitors seem to agree that the user experience is smooth, from start to finish. They feel that they’re interacting with a polished product. Even if I didn’t know better, I would guess that very little of what actually makes StackOverflow a continuing success has to do with the database schema—and having had a chance to read through StackOverflow’s source code, I know how little really does. There is a  _tremendous_  amount of spit and polish that goes into making a major website highly usable. A developer, asked how hard something will be to clone, simply  _does not think about the polish_ , because  _the polish is incidental to the implementation._ 

That is why an open-source clone of StackOverflow will fail. Even if someone were to manage to implement most of StackOverflow “to spec,” there are some key areas that would trip them up. Badges, for example, if you’re targeting end-users, either need a GUI to configure rules, or smart developers to determine which badges are generic enough to go on all installs. What will actually happen is that the developers will bitch and moan about how you can’t implement a really comprehensive GUI for something like badges, and then bikeshed any proposals for standard badges so far into the ground that they’ll hit escape velocity coming out the other side. They’ll ultimately come up with the same solution that bug trackers like Roundup use for their workflow: the developers implement a generic mechanism by which anyone, truly anyone at all, who feels totally comfortable working with the system API in Python or PHP or whatever, can easily add their own customizations. And when PHP and Python are so easy to learn and so much more flexible than a GUI could ever be, why bother with anything else?

Likewise, the moderation and administration interfaces can be punted. If you’re an admin, you have access to the SQL server, so you can do anything really genuinely administrative-like that way. Moderators can get by with whatever django-admin and similar systems afford you, since, after all, few users are mods, and mods should understand how the sites  _work_ , dammit. And, certainly, none of StackOverflow’s interface failings will be rectified. Even if StackOverflow’s stupid requirement that you have to have and know how to use an OpenID (its worst failing) eventually gets fixed, I’m sure any open-source clones will rabidly follow it—just as GNOME and KDE for years slavishly copied off Windows, instead of trying to fix its most obvious flaws.

Developers may not care about these parts of the application, but end-users do, and take it into consideration when trying to decide what application to use. Much as a good software company wants to minimize its support costs by ensuring that its products are top-notch before shipping, so, too, savvy consumers want to ensure products are good before they purchase them so that they won’t  _have_  to call support. Open-source products fail hard here. Proprietary solutions, as a rule, do better.

That’s not to say that open-source doesn’t have its place. This blog runs on Apache, [Django][12], [PostgreSQL][13], and Linux. But let me tell you, configuring that stack is  _not_  for the faint of heart. PostgreSQL needs vacuuming configured on older versions, and, as of recent versions of Ubuntu and FreeBSD, still requires the user set up the first database cluster. MS SQL requires neither of those things. Apache…dear heavens, don’t even get me  _started_  on trying to explain to a novice user how to get virtual hosting, MovableType, a couple Django apps, and WordPress all running comfortably under a single install. Hell, just trying to explain the forking vs. threading variants of Apache to a technically astute non-developer can be a nightmare. IIS 7 and Apache with OS X Server’s very much closed-source GUI manager make setting up those same stacks vastly simpler. Django’s a great a product, but it’s nothing  _but_  infrastructure—exactly the thing that I happen to think open-source  _does_  do well,  _precisely_  because of the motivations that drive developers to contribute.

The next time you see an application you like, think very long and hard about all the user-oriented details that went into making it a pleasure to use, before decrying how you could trivially reimplement the entire damn thing in a weekend. Nine times out of ten, when you think an application was ridiculously easy to implement, you’re completely missing the user side of the story.

--------------------------------------------------------------------------------

via: https://bitquabit.com/post/one-which-i-call-out-hacker-news/

作者：[Benjamin Pollack][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://bitquabit.com/meta/about/
[1]:http://www.cs.duke.edu/~ola/
[2]:http://www.cs.duke.edu/courses/cps108/spring04/
[3]:https://bitquabit.com/categories/programming
[4]:https://bitquabit.com/categories/technology
[5]:http://blog.bitquabit.com/2009/06/30/one-which-i-say-open-source-software-sucks/
[6]:http://news.ycombinator.com/item?id=678501
[7]:http://news.ycombinator.com/item?id=678704
[8]:http://code.google.com/p/cnprog/
[9]:http://code.google.com/p/soclone/
[10]:http://en.wikipedia.org/wiki/Words_per_minute
[11]:http://github.com/derobins/wmd/tree/master
[12]:http://www.djangoproject.com/
[13]:http://www.postgresql.org/
[14]:https://bitquabit.com/post/one-which-i-call-out-hacker-news/
