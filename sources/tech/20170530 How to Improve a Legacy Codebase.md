Translating by aiwhj
# How to Improve a Legacy Codebase
# 如何改善遗留的代码库

It happens at least once in the lifetime of every programmer, project manager or teamleader. You get handed a steaming pile of manure, if you’re lucky only a few million lines worth, the original programmers have long ago left for sunnier places and the documentation - if there is any to begin with - is hopelessly out of sync with what is presently keeping the company afloat.

它在每一个程序员，项目管理员，团队领导的一生中都会发生至少一次。原来的程序员离开了这个地方，只留下了文档，和一坨几百万行屎一样的代码。一旦接管这些代码，想要跟上公司的进度简直让人绝望。

Your job: get us out of this mess.
你的任务：让大家摆脱这个混乱的局面

当你的第一反应过去之后，你开始去熟悉这个项目，公司的管理层都在关注着，项目只能成功，然而，看了一遍之后却发现了许多的错误。该怎么做呢？
After your first instinctive response (run for the hills) has passed you start on the project knowing full well that the eyes of the company senior leadership are on you. Failure is not an option. And yet, by the looks of what you’ve been given failure is very much in the cards. So what to do?

幸运（不幸）的是我已经遇到好几次这种情况了，我和我的小伙伴发现将这坨热气腾腾的屎变成一个健康可维护的项目是很值得的。下面这些是我使用的一些小技巧：
I’ve been (un)fortunate enough to be in this situation several times and me and a small band of friends have found that it is a lucrative business to be able to take these steaming piles of misery and to turn them into healthy maintainable projects. Here are some of the tricks that we employ:

### Backup
### 备份

在你去做任何操作之前备份与之相关的所有文件。这样可以确保不会丢失任何信息，这些信息可能会在另外一些地方很重要。一旦改变其中一些文件，你可能花费一天或者更多天都解决不了这个愚蠢的问题，配置数据通常不受版本控制，所以特别容易受到这方面影响，如果定期备份数据时连带着它一起备份了，还是比较幸运的。所以谨慎总比后悔好，复制所有东西到一个绝对安全的地方吧，而且不要轻易动他除非这些文件是只读模式。
Before you start to do anything at all make a backup of  _everything_  that might be relevant. This to make sure that no information is lost that might be of crucial importance somewhere down the line. All it takes is a silly question that you can’t answer to eat up a day or more once the change has been made. Especially configuration data is susceptible to this kind of problem, it is usually not versioned and you’re lucky if it is taken along in the periodic back-up scheme. So better safe than sorry, copy everything to a very safe place and never ever touch that unless it is in read-only mode.

### Important pre-requisite, make sure you have a build process and that it actually produces what runs in production
### 你必须确认他们能够在生产环境下构建运行并产出，这是重要的先决条件。

这一步显而易见并且已经很到位的情况下我完全错过了这一步，Hacker News 的众多评论者就会指出并且证明他们是对的：第一步是马上确保你知道在生产环境下运行着什么东西，也意味着你需要去在你的设备上构建一个跟生产环境上运行的版本每一个字节都一模一样的版本。如果你找不到实现它的办法，一旦你将它投入生产环境是，你很可能会遭遇一些很糟糕的事情。确保每一部分都尽你最大能力去测试，之后在你足够信任他能够很好的运行的时候将他弄得生产环境下。无论他运行的怎么样都要做好能够马上切换回就版本的准备，并且记录所有情况下的日志，便于接下来不可避免的 “验尸” 。
I totally missed this step on the assumption that it is obvious and likely already in place but many HN commenters pointed this out and they are absolutely right: step one is to make sure that you know what is running in production right now and that means that you need to be able to build a version of the software that is - if your platform works that way - byte-for-byte identical with the current production build. If you can’t find a way to achieve this then likely you will be in for some unpleasant surprises once you commit something to production. Make sure you test this to the best of your ability to make sure that you have all the pieces in place and then, after you’ve gained sufficient confidence that it will work move it to production. Be prepared to switch back immediately to whatever was running before and make sure that you log everything and anything that might come in handy during the - inevitable - post mortem.

### Freeze the DB
### 冻结数据库
直到你改善了代码之前尽可能的冻结你的数据库，在你特别熟悉代码库和遗留代码的之后再去修改数据库。在这之前过早的修改数据库的话，你可能会碰到大问题，你会失去让新旧代码和数据库和数据库一起构建稳固的基础的能力。保持数据库完全不变能够比较新的逻辑代码和旧的逻辑代码造成的影响，如果都像通知的那样就没有什么影响了。
If at all possible freeze the database schema until you are done with the first level of improvements, by the time you have a solid understanding of the codebase and the legacy code has been fully left behind you are ready to modify the database schema. Change it any earlier than that and you may have a real problem on your hand, now you’ve lost the ability to run an old and a new codebase side-by-side with the database as the steady foundation to build on. Keeping the DB totally unchanged allows you to compare the effect your new business logic code has compared to the old business logic code, if it all works as advertised there should be no differences.

### Write your tests
### 写测试
在你做任何改变之前，尽可能多的写下端到端测试和集成测试。确保这些测试能够正确的输出并且是在你能够清晰的知道旧的是如何工作的假设之下（准备好应对一些突发状况）。这些测试有两个重要的作用，他们能够在较早的阶段帮助你抛弃一些错误观念，在你写新代码替换旧代码的时候也有一定防护作用。
Before you make any changes at all write as many end-to-end and integration tests as you can. Make sure these tests produce the right output and test any and all assumptions that you can come up with about how you  _think_  the old stuff works (be prepared for surprises here). These tests will have two important functions: they will help to clear up any misconceptions at a very early stage and they will function as guardrails once you start writing new code to replace old code.

自动化测试，如果你也有 CI 的使用经验，请使用它并且确保在你提交代码之后能够快速的完成所有测试。
Automate all your testing, if you’re already experienced with CI then use it and make sure your tests run fast enough to run the full set of tests after every commit.

### Instrumentation and logging
### 日志监控
如果线上的旧设备需要添加上监控功能。用一个完全新的数据库，为每一个你能想到事件都添加一个简单的计数器，并且根据这些事件的名字添加一个函数增加这些计数器。用一些额外的代码实现一个时间戳事件日志，这是一个好办法知道有多少事件导致了另外一些种类的事件。例如：用户打开 APP ，用户关闭 APP 。如果这两个事件导致后端调用的数量维持长时间的不同，这个数量差就是当前打开的 APP 的数量。如果你看到打开 APP 的比关闭的多的时候，你知道哪些 APP 是关闭的必须的方法（例如崩溃）。每一个事件你会发现有许多不同种类的联系跟其他的一些事件，通常你争取维持这些固定的关系，除非有一个明显的错误在系统上。你的目标是降低那些错误的事件，最大化哪些计数器在向下到初始化的水平在链条中。（例如：用户试着支付应该得到相同数量的跟支付回调）。
If the old platform is still available for development add instrumentation. Do this in a completely new database table, add a simple counter for every event that you can think of and add a single function to increment these counters based on the name of the event. That way you can implement a time-stamped event log with a few extra lines of code and you’ll get a good idea of how many events of one kind lead to events of another kind. One example: User opens app, User closes app. If two events should result in some back-end calls those two counters should over the long term remain at a constant difference, the difference is the number of apps currently open. If you see many more app opens than app closes you know there has to be a way in which apps end (for instance a crash). For each and every event you’ll find there is some kind of relationship to other events, usually you will strive for constant relationships unless there is an obvious error somewhere in the system. You’ll aim to reduce those counters that indicate errors and you’ll aim to maximize counters further down in the chain to the level indicated by the counters at the beginning. (For instance: customers attempting to pay should result in an equal number of actual payments received).

这是非常简单的点子去翻转每一个后端应用到一个就像真实的薄书系统一样
This very simple trick turns every backend application into a bookkeeping system of sorts and just like with a real bookkeeping system the numbers have to match, as long as they don’t you have a problem somewhere.

在构建一个健康的系统的时候，这个系统是很珍贵的，而且它也是一个好伙伴，仅次于使用源码控制修改系统日志，你可以确认 BUG 出现的位置，以及对多种计数器造成的影响。
This system will over time become invaluable in establishing the health of the system and will be a great companion next to the source code control system revision log where you can determine the point in time that a bug was introduced and what the effect was on the various counters.

我通常保持技术差 5 分钟一次（一小时 12 次），如果你的应用生成了更多或者更少的事件，你应该改变这个时间间隔。所有的计数器公用一个数据表，每一个记录都只是简单的一行。
I usually keep these counters at a 5 minute resolution (so 12 buckets for an hour), but if you have an application that generates fewer or more events then you might decide to change the interval at which new buckets are created. All counters share the same database table and so each counter is simply a column in that table.

### Change only one thing at the time
### 一次只修改一处

不要完全陷入一个陷阱，在提高代码或者平台可用性的同时添加新特性或者是修复 BUG。这会让你头大，现在必须问问你自己每一步操作想要每一步的什么结果并且将会使你早前建立的测试失效。
Do not fall into the trap of improving both the maintainability of the code or the platform it runs on at the same time as adding new features or fixing bugs. This will cause you huge headaches because you now have to ask yourself every step of the way what the desired outcome is of an action and will invalidate some of the tests you made earlier.

### Platform changes
###改变平台
如果你决定转移你的应用到另外一个平台，最主要的是跟之前保持一样。如果你觉得你会添加更多的文档和测试，但是不会比那更多，所有的业务逻辑和相互依赖跟从前一样保持不变。
If you’ve decided to migrate the application to another platform then do this first  _but keep everything else exactly the same_ . If you want you can add more documentation or tests, but no more than that, all business logic and interdependencies should remain as before.

### Architecture changes
###改变架构
接下来处理的是改变应用的结构（如果需要）。这一点上，你可以自由的去改变代码为更高级的，通常是降低模块间的横向联系，这样可以降低代码活动期间对终端用户造成的影响范围。如果老代码是庞大的，那么现在正是时候让他模块化，大段代码分解成众多小的，不过不要把变量的名字和他的数据结构分开。
The next thing to tackle is to change the architecture of the application (if desired). At this point in time you are free to change the higher level structure of the code, usually by reducing the number of horizontal links between modules, and thus reducing the scope of the code active during any one interaction with the end-user. If the old code was monolithic in nature now would be a good time to make it more modular, break up large functions into smaller ones but leave names of variables and data-structures as they were.
Hacker News [mannykannot][1] 指出，理所应当的，这一步不总是有必要的，如果你特别不幸的话，你可能为了改变一些架构必须付出沉重的代价。我也赞同这个，我应该加上这个，因此这里有一些更新。我非常想添加的是如果你修改高级代码的时候修改了一点点底层代码试着限制只修改一个文件或者一个不恰当的例子一个子系统，所以你尽可能的限制了修改的范围。其他方面你可能有个困难时期去排查你所做的修改。
HN user [mannykannot][1] points - rightfully - out that this is not always an option, if you’re particularly unlucky then you may have to dig in deep in order to be able to make any architecture changes. I agree with that and I should have included it here so hence this little update. What I would further like to add is if you do both do high level changes and low level changes at least try to limit them to one file or worst case one subsystem so that you limit the scope of your changes as much as possible. Otherwise you might have a very hard time debugging the change you just made.

### Low level refactoring
### 底层代码的重构
现在，你应该非常理解每一个模块的作用，准备做一些真正的工作吧：重构代码去提高可维护性和让代码准备添加新功能。这将很可能是项目的一部分消耗大部分时间，记录你做的，不要对模块做改变直到你彻底的记录他并且感觉理解了他。很自由的修改变量名和函数名以及数据结构去提高清晰度和统一性，添加测试（情况需要的话，包括单元测试）。
By now you should have a very good understanding of what each module does and you are ready for the real work: refactoring the code to improve maintainability and to make the code ready for new functionality. This will likely be the part of the project that consumes the most time, document as you go, do not make changes to a module until you have thoroughly documented it and feel you understand it. Feel free to rename variables and functions as well as datastructures to improve clarity and consistency, add tests (also unit tests, if the situation warrants them).

### Fix bugs
### 修改bugs
现在你准备承担真实用户看到的改变，战斗的第一步将是积累了一整年很多的bugs，像往常一样，第一步证实问题仍然存在，对这个结果做个测试然后修复这个bug，你的 CI 和写的端对端测试应该让你安全在你犯了错误由于不太熟悉或者一些额外的事情。
Now you’re ready to take on actual end-user visible changes, the first order of battle will be the long list of bugs that have accumulated over the years in the ticket queue. As usual, first confirm the problem still exists, write a test to that effect and then fix the bug, your CI and the end-to-end tests written should keep you safe from any mistakes you make due to a lack of understanding or some peripheral issue.

### Database Upgrade
### 升级数据库
如果在前面的都所谓之后你需要固定和可维护的数据库再一次你有一个选项去改变数据库或者替换数据库用一个不同的完整的，如果这是你打算做的，做到了所有的这些将能够帮助你通过可靠的方式做修改而不会碰到问题，你会完整的测试新数据库和新代码，所有测试可以确保你顺利的迁移。
If required after all this is done and you are on a solid and maintainable codebase again you have the option to change the database schema or to replace the database with a different make/model altogether if that is what you had planned to do. All the work you’ve done up to this point will help to assist you in making that change in a responsible manner without any surprises, you can completely test the new DB with the new code and all the tests in place to make sure your migration goes off without a hitch.

### Execute on the roadmap
### 按着路线图执行
祝贺你脱离的困境并且可以准备添加新功能了。
Congratulations, you are out of the woods and are now ready to implement new functionality.

### Do not ever even attempt a big-bang rewrite
### 任何时候都不要企图推翻重写

推翻重写是那种注定会失败的项目，之一，你是
A big-bang rewrite is the kind of project that is pretty much guaranteed to fail. For one, you are in uncharted territory to begin with so how would you even know what to build, for another, you are pushing  _all_  the problems to the very last day, the day just before you go ‘live’ with your new system. And that’s when you’ll fail, miserably. Business logic assumptions will turn out to be faulty, suddenly you’ll gain insight into why that old system did certain things the way it did and in general you’ll end up realizing that the guys that put the old system together weren’t maybe idiots after all. If you really do want to wreck the company (and your own reputation to boot) by all means, do a big-bang rewrite, but if you’re smart about it this is not even on the table as an option.

### So, the alternative, work incrementally

To untangle one of these hairballs the quickest path to safety is to take any element of the code that you do understand (it could be a peripheral bit, but it might also be some core module) and try to incrementally improve it still within the old context. If the old build tools are no longer available you will have to use some tricks (see below) but at least try to leave as much of what is known to work alive while you start with your changes. That way as the codebase improves so does your understanding of what it actually does. A typical commit should be at most a couple of lines.

### Release!

Every change along the way gets released into production, even if the changes are not end-user visible it is important to make the smallest possible steps because as long as you lack understanding of the system there is a fair chance that only the production environment will tell you there is a problem. If that problem arises right after you make a small change you will gain several advantages:

*   it will probably be trivial to figure out what went wrong

*   you will be in an excellent position to improve the process

*   and you should immediately update the documentation to show the new insights gained

### Use proxies to your advantage

If you are doing web development praise the gods and insert a proxy between the end-users and the old system. Now you have per-url control over which requests go to the old system and which you will re-route to the new system allowing much easier and more granular control over what is run and who gets to see it. If your proxy is clever enough you could probably use it to send a percentage of the traffic to the new system for an individual URL until you are satisfied that things work the way they should. If your integration tests also connect to this interface it is even better.

### Yes, but all this will take too much time!

Well, that depends on how you look at it. It’s true there is a bit of re-work involved in following these steps. But it  _does_  work, and any kind of optimization of this process makes the assumption that you know more about the system than you probably do. I’ve got a reputation to maintain and I  _really_  do not like negative surprises during work like this. With some luck the company is already on the skids, or maybe there is a real danger of messing things up for the customers. In a situation like that I prefer total control and an iron clad process over saving a couple of days or weeks if that imperils a good outcome. If you’re more into cowboy stuff - and your bosses agree - then maybe it would be acceptable to take more risk, but most companies would rather take the slightly slower but much more sure road to victory.

--------------------------------------------------------------------------------

via: https://jacquesmattheij.com/improving-a-legacy-codebase

作者：[Jacques Mattheij ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jacquesmattheij.com/
[1]:https://news.ycombinator.com/item?id=14445661
