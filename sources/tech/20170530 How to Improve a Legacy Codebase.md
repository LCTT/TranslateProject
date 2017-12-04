Translating by aiwhj
# How to Improve a Legacy Codebase


It happens at least once in the lifetime of every programmer, project manager or teamleader. You get handed a steaming pile of manure, if you’re lucky only a few million lines worth, the original programmers have long ago left for sunnier places and the documentation - if there is any to begin with - is hopelessly out of sync with what is presently keeping the company afloat.

Your job: get us out of this mess.

After your first instinctive response (run for the hills) has passed you start on the project knowing full well that the eyes of the company senior leadership are on you. Failure is not an option. And yet, by the looks of what you’ve been given failure is very much in the cards. So what to do?

I’ve been (un)fortunate enough to be in this situation several times and me and a small band of friends have found that it is a lucrative business to be able to take these steaming piles of misery and to turn them into healthy maintainable projects. Here are some of the tricks that we employ:

### Backup

Before you start to do anything at all make a backup of  _everything_  that might be relevant. This to make sure that no information is lost that might be of crucial importance somewhere down the line. All it takes is a silly question that you can’t answer to eat up a day or more once the change has been made. Especially configuration data is susceptible to this kind of problem, it is usually not versioned and you’re lucky if it is taken along in the periodic back-up scheme. So better safe than sorry, copy everything to a very safe place and never ever touch that unless it is in read-only mode.

### Important pre-requisite, make sure you have a build process and that it actually produces what runs in production

I totally missed this step on the assumption that it is obvious and likely already in place but many HN commenters pointed this out and they are absolutely right: step one is to make sure that you know what is running in production right now and that means that you need to be able to build a version of the software that is - if your platform works that way - byte-for-byte identical with the current production build. If you can’t find a way to achieve this then likely you will be in for some unpleasant surprises once you commit something to production. Make sure you test this to the best of your ability to make sure that you have all the pieces in place and then, after you’ve gained sufficient confidence that it will work move it to production. Be prepared to switch back immediately to whatever was running before and make sure that you log everything and anything that might come in handy during the - inevitable - post mortem.

### Freeze the DB

If at all possible freeze the database schema until you are done with the first level of improvements, by the time you have a solid understanding of the codebase and the legacy code has been fully left behind you are ready to modify the database schema. Change it any earlier than that and you may have a real problem on your hand, now you’ve lost the ability to run an old and a new codebase side-by-side with the database as the steady foundation to build on. Keeping the DB totally unchanged allows you to compare the effect your new business logic code has compared to the old business logic code, if it all works as advertised there should be no differences.

### Write your tests

Before you make any changes at all write as many end-to-end and integration tests as you can. Make sure these tests produce the right output and test any and all assumptions that you can come up with about how you  _think_  the old stuff works (be prepared for surprises here). These tests will have two important functions: they will help to clear up any misconceptions at a very early stage and they will function as guardrails once you start writing new code to replace old code.

Automate all your testing, if you’re already experienced with CI then use it and make sure your tests run fast enough to run the full set of tests after every commit.

### Instrumentation and logging

If the old platform is still available for development add instrumentation. Do this in a completely new database table, add a simple counter for every event that you can think of and add a single function to increment these counters based on the name of the event. That way you can implement a time-stamped event log with a few extra lines of code and you’ll get a good idea of how many events of one kind lead to events of another kind. One example: User opens app, User closes app. If two events should result in some back-end calls those two counters should over the long term remain at a constant difference, the difference is the number of apps currently open. If you see many more app opens than app closes you know there has to be a way in which apps end (for instance a crash). For each and every event you’ll find there is some kind of relationship to other events, usually you will strive for constant relationships unless there is an obvious error somewhere in the system. You’ll aim to reduce those counters that indicate errors and you’ll aim to maximize counters further down in the chain to the level indicated by the counters at the beginning. (For instance: customers attempting to pay should result in an equal number of actual payments received).

This very simple trick turns every backend application into a bookkeeping system of sorts and just like with a real bookkeeping system the numbers have to match, as long as they don’t you have a problem somewhere.

This system will over time become invaluable in establishing the health of the system and will be a great companion next to the source code control system revision log where you can determine the point in time that a bug was introduced and what the effect was on the various counters.

I usually keep these counters at a 5 minute resolution (so 12 buckets for an hour), but if you have an application that generates fewer or more events then you might decide to change the interval at which new buckets are created. All counters share the same database table and so each counter is simply a column in that table.

### Change only one thing at the time

Do not fall into the trap of improving both the maintainability of the code or the platform it runs on at the same time as adding new features or fixing bugs. This will cause you huge headaches because you now have to ask yourself every step of the way what the desired outcome is of an action and will invalidate some of the tests you made earlier.

### Platform changes

If you’ve decided to migrate the application to another platform then do this first  _but keep everything else exactly the same_ . If you want you can add more documentation or tests, but no more than that, all business logic and interdependencies should remain as before.

### Architecture changes

The next thing to tackle is to change the architecture of the application (if desired). At this point in time you are free to change the higher level structure of the code, usually by reducing the number of horizontal links between modules, and thus reducing the scope of the code active during any one interaction with the end-user. If the old code was monolithic in nature now would be a good time to make it more modular, break up large functions into smaller ones but leave names of variables and data-structures as they were.

HN user [mannykannot][1] points - rightfully - out that this is not always an option, if you’re particularly unlucky then you may have to dig in deep in order to be able to make any architecture changes. I agree with that and I should have included it here so hence this little update. What I would further like to add is if you do both do high level changes and low level changes at least try to limit them to one file or worst case one subsystem so that you limit the scope of your changes as much as possible. Otherwise you might have a very hard time debugging the change you just made.

### Low level refactoring

By now you should have a very good understanding of what each module does and you are ready for the real work: refactoring the code to improve maintainability and to make the code ready for new functionality. This will likely be the part of the project that consumes the most time, document as you go, do not make changes to a module until you have thoroughly documented it and feel you understand it. Feel free to rename variables and functions as well as datastructures to improve clarity and consistency, add tests (also unit tests, if the situation warrants them).

### Fix bugs

Now you’re ready to take on actual end-user visible changes, the first order of battle will be the long list of bugs that have accumulated over the years in the ticket queue. As usual, first confirm the problem still exists, write a test to that effect and then fix the bug, your CI and the end-to-end tests written should keep you safe from any mistakes you make due to a lack of understanding or some peripheral issue.

### Database Upgrade

If required after all this is done and you are on a solid and maintainable codebase again you have the option to change the database schema or to replace the database with a different make/model altogether if that is what you had planned to do. All the work you’ve done up to this point will help to assist you in making that change in a responsible manner without any surprises, you can completely test the new DB with the new code and all the tests in place to make sure your migration goes off without a hitch.

### Execute on the roadmap

Congratulations, you are out of the woods and are now ready to implement new functionality.

### Do not ever even attempt a big-bang rewrite

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
