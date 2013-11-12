Personality Traits of the Best Software Developers
================================================================================
I come from the world of corporate software development. It may not be the most glamorous side of software (it’s nowhere near as interesting as [shrinkwrap startups][1] or those fancy-dancy [Web 2.0][2] companies that show up in your browser every time you mistype a domain name), but it’s stable, pays well, and has its own set of challenges that other types of software development know nothing about.

For example, when was the last time someone working on the next version of Halo spent three weeks trying to gather people from accounting, marketing, product management, and their call center in order to nail down requirements that would likely change in 2 months once they’ve delivered the software?

Or when was the last time someone at [37Signals][3] sat through back to back weeks of [JAD sessions][4]?

In this world of corporate development I’ve known a few phenomenal developers. I’m talking about those A people whom you would quit your job for to go start a company. And the the more I looked at what makes them so good, the more I realized they all share a handful of personality traits. Well, not exactly a handful, more like four.

![](http://softwarebyrob.wpengine.netdna-cdn.com/images/chess_game.jpg)

### Pessimistic ###

Admiral Jim Stockdale was the highest ranking US military officer imprisoned in Vietnam. He was held in the “Hanoi Hilton” and repeatedly tortured over 8 years. Stockdale told Jim Collins, author of [Good to Great][5], “You must never confuse faith that you will prevail in the end, which you can never afford to lose, with the discipline to confront the most brutal facts of your current reality, whatever they might be.”

After his release, Stockdale became the first three-star officer in the history of the navy to wear both aviator wings and the Congressional Medal of Honor.

Stockdale was a pessimist in the short-term because he faced the brutal facts of his reality, but was an optimist in the long-term because of his confidence that he would prevail in the end.

No one anticipates a catastrophic system failure by looking on the bright side. The best developers I know are experts at finding points of failure. You’ll often hear them quipping “What could possibly go wrong?” after someone makes a suggestion to handle a critical data transfer via nightly FTP over a dial-up connection. The best developers anticipate headaches that other developers never think of, and do everything within their power to avoid them.

On the flip side, great developers are optimistic, even downright confident, about their overall success. They know that by being a pessimist in the short-term, their long-term success is ensured. Just like Jim Stockdale, they realize that by confronting the brutal facts of their current reality they will prevail in the end.

### Angered By Sloppy Code ###

Paul Graham nailed it when [he said][6] “…people who are great at something are not so much convinced of their own greatness as mystified at why everyone else seems so incompetent.”

The worst nightmare for a great developer is to see someone else’s software gasping for air while bringing the rest of the system to its knees. It’s downright infuriating. And this isn’t limited to code; it can be bad installation packages, sloppy deployments, or a misspelled column name.

![](http://softwarebyrob.wpengine.netdna-cdn.com/images/paris_sewers.jpg)

Due to the life and death nature of their products, NASA designs zero-defect software systems using a process that has nearly eliminated the possibility for human error. They’ve added layer after layer of checks and balances that have resulted from years of finding mistakes and figuring out the best way to eliminate them. NASA is the poster child for discovering the source of a mistake and modifying their process to eliminate the possibility of that mistake ever happening again. And it works. A quote from [this Fast Company article][7] on NASA’s development process says

“What makes it remarkable is how well the software works. This software never crashes. It never needs to be re-booted. This software is bug-free. It is perfect, as perfect as human beings have achieved. Consider these stats: the last three versions of the program — each 420,000 lines long-had just one error each. The last 11 versions of this software had a total of 17 errors. Commercial programs of equivalent complexity would have 5,000 errors.”

I’m not saying we have to develop to this standard, but NASA knows how to find and fix bugs, and the way they do it is to find the source of every problem.

Someone who fixes a problem but doesn’t take the time to find out what caused it is doomed to never become an expert in their field. Experience is not years on the job, it’s learning to recognize a problem before it occurs, which can only be done by knowing what causes it in the first place.

Developers who don’t take the time to find the source often create sloppy solutions. For hundreds of examples of sloppy solutions visit [The Daily WTF][8]. Here are a few I’ve seen in my career:

- An assembly is deleted from a server each time it’s rebooted. You could create a custom script to re-copy that assembly to the server after each reboot, or find out why the assembly is being deleted in the first place.
- An image-manipulation script is hogging processor power for minutes at a time when it should run in under 10 seconds. You could make the script run at 2am when no one will notice, or you can take the time to step through the code and figure out where the real problem is.
- A shared XML file is being locked by a process, causing other processes to fail when they try to open it. You could make several copies of the XML file so each process has its own, or you could troubleshoot the file access code to find out why it’s locking the file.
- And on and on…

### Long Term Life Planners ###

This one was a little puzzling for the longest time, but I think I’ve finally put it together.

![](http://softwarebyrob.wpengine.netdna-cdn.com/images/brown_guitar.jpg)

People who think many years down the road in their personal life have the gift to think down the road during development. Being able to see the impacts of present-day decisions is paramount to building great software. The best developers I know have stable family lives, save for retirement, own their own home, and eat an apple a day (ok, maybe not that last one). People who have spastic home-lives and live paycheck to paycheck can certainly be good developers, but what they lack in life they tend to lack in the office: the ability to be disciplined, and to develop and adhere to a long-term plan.

### Attention to Detail ###

I’ve known smart developers who don’t pay attention to detail. The result is misspelled database columns, uncommented code, projects that aren’t checked into source control, software that’s not unit tested, unimplemented features, and so on. All of these can be easily dealt with if you’re building a Google mash-up or a five page website. But in corporate development each of these screw-ups is a death knell.

So I’ll say it very loud, but I promise I’ll only say it once:

**I have never, ever, ever seen a great software developer who does not have amazing attention to detail.**

I worked with a programmer back in school who forced anyone working with him to indent using two spaces instead of tabs. If you gave him code that didn’t use two spaces he would go through it line-by-line and replace your tabs with his spaces. While the value of tabs is not even a question, (I’ve long-chided him for this anal behavior) his attention to such a small detail has served him well in his many years designing chips at Intel.

### So There You Have It ###

The next time you’re interviewing a potential developer, determine if she has the four personality traits I’ve listed above. Here are a few methods I’ve found useful:

- Ask if they’re an optimist or a pessimist
- Ask about a time when they found the source of a problem
- Find out if they save for retirement (you can work this in during discussions of your company’s retirement plan)
- Make an obvious misspelling in a short code sample and ask if they see anything wrong

We know from [Facts and Fallacies of Software Engineering][9] that the best programmers are up to [28 times better][10] than the worst programmers, making them the best bargains in software. Take these four traits and go find a bargain (or better yet, make yourself into one).

If you liked this article you’ll also like my article [Timeline and Risk: How to Piss off Your Software Developers][11].

--------------------------------------------------------------------------------

via: http://www.softwarebyrob.com/2006/08/20/personality-traits-of-the-best-software-developers/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.joelonsoftware.com/
[2]:http://www.econsultant.com/web2/
[3]:http://www.37signals.com/
[4]:http://expertanswercenter.techtarget.com/eac/knowledgebaseAnswer/0,295199,sid63_gci986072,00.html
[5]:http://www.amazon.com/gp/redirect.html?link_code=ur2&tag=softwarbyrob-20&camp=1789&creative=9325&location=%2Fgp%2Fproduct%2F0060794410%2Fsr%3D8-3%2Fqid%3D1155789849%2Fref%3Dpd_bbs_3%3Fie%3DUTF8
[6]:http://www.paulgraham.com/gh.html
[7]:http://www.fastcompany.com/online/06/writestuff.html
[8]:http://www.thedailywtf.com/
[9]:http://www.amazon.com/gp/redirect.html?link_code=ur2&tag=softwarbyrob-20&camp=1789&creative=9325&location=http%3A%2F%2Fwww.amazon.com%2Fgp%2Fproduct%2F0321117425%2Fsr%3D8-1%2Fqid%3D1154642314%2Fref%3Dpd_bbs_1%3Fie%3DUTF8
[10]:http://safari.oreilly.com/0321117425/ch01lev1sec1
[11]:http://www.softwarebyrob.com/articles/Timeline_and_Risk_Piss_Off_Your_Software_Developers.aspx
