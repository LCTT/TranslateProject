Version Control Before Git with CVS
======
Github was launched in 2008. If your software engineering career, like mine, is no older than Github, then Git may be the only version control software you have ever used. While people sometimes grouse about its steep learning curve or unintuitive interface, Git has become everyone’s go-to for version control. In Stack Overflow’s 2015 developer survey, 69.3% of respondents used Git, almost twice as many as used the second-most-popular version control system, Subversion. After 2015, Stack Overflow stopped asking developers about the version control systems they use, perhaps because Git had become so popular that the question was uninteresting.

Git itself is not much older than Github. Linus Torvalds released the first version of Git in 2005. Though today younger developers might have a hard time conceiving of a world where the term “version control software” didn’t more or less just mean Git, such a world existed not so long ago. There were lots of alternatives to choose from. Open source developers preferred Subversion, enterprises and video game companies used Perforce (some still do), while the Linux kernel project famously relied on a version control system called BitKeeper.

Some of these systems, particularly BitKeeper, might feel familiar to a young Git user transported back in time. Most would not. BitKeeper aside, the version control systems that came before Git worked according to a fundamentally different paradigm. In a taxonomy offered by Eric Sink, author of Version Control by Example, Git is a third-generation version control system, while most of Git’s predecessors, the systems popular in the 1990s and early 2000s, are second-generation version control systems. Where third-generation version control systems are distributed, second-generation version control systems are centralized. You have almost certainly heard Git described as a “distributed” version control system before. I never quite understood the distributed/centralized distinction, at least not until I installed and experimented with a centralized second-generation version control system myself.

The system I installed was CVS. CVS, short for Concurrent Versions System, was the very first second-generation version control system. It was also the most popular version control system for about a decade until it was replaced in 2000 by Subversion. Even then, Subversion was supposed to be “CVS but better,” which only underscores how dominant CVS had become throughout the 1990s.

CVS was first developed in 1986 by a Dutch computer scientist named Dick Grune, who was looking for a way to collaborate with his students on a compiler project. CVS was initially little more than a collection of shell scripts wrapping RCS (Revision Control System), a first-generation version control system that Grune wanted to improve. RCS works according to a pessimistic locking model, meaning that no two programmers can work on a single file at once. In order to edit a file, you have to first ask RCS for an exclusive lock on the file, which you keep until you are finished editing. If someone else is already editing a file you need to edit, you have to wait. CVS improved on RCS and ushered in the second generation of version control systems by trading the pessimistic locking model for an optimistic one. Programmers could now edit the same file at the same time, merging their edits and resolving any conflicts later. (Brian Berliner, an engineer who later took over the CVS project, wrote a very readable [paper][1] about CVS’ innovations in 1990.)

In that sense, CVS wasn’t all that different from Git, which also works according to an optimistic model. But that’s where the similarities end. In fact, when Linus Torvalds was developing Git, one of his guiding principles was WWCVSND, or “What Would CVS Not Do.” Whenever he was in doubt about a decision, he strove to choose the option that had not been chosen in the design of CVS. So even though CVS predates Git by over a decade, it influenced Git as a kind of negative template.

I’ve really enjoyed playing around with CVS. I think there’s no better way to understand why Git’s distributed nature is such an improvement on what came before. So I invite you to come along with me on an exciting journey and spend the next ten minutes of your life learning about a piece of software nobody has used in the last decade. (See correction.)

### Getting Started with CVS

Instructions for installing CVS can be found on the [project’s homepage][2]. On MacOS, you can install CVS using Homebrew.

Since CVS is centralized, it distinguishes between the client-side universe and the server-side universe in a way that something like Git does not. The distinction is not so pronounced that there are different executables. But in order to start using CVS, even on your own machine, you’ll have to set up the CVS backend.

The CVS backend, the central store for all your code, is called the repository. Whereas in Git you would typically have a repository for every project, in CVS the repository holds all of your projects. There is one central repository for everything, though there are ways to work with only a project at a time.

To create a local repository, you run the `init` command. You would do this somewhere global like your home directory.

```
$ cvs -d ~/sandbox init
```

CVS allows you to pass options to either the `cvs` command itself or to the `init` subcommand. Options that appear after the `cvs` command are global in nature, while options that appear after the subcommand are specific to the subcommand. In this case, the `-d` flag is global. Here it happens to tell CVS where we want to create our repository, but in general the `-d` flag points to the location of the repository we want to use for any given action. It can be tedious to supply the `-d` flag all the time, so the `CVSROOT` environment variable can be set instead.

Since we’re working locally, we’ve just passed a path for our `-d` argument, but we could also have included a hostname.

The command creates a directory called `sandbox` in your home directory. If you list the contents of `sandbox`, you’ll find that it contains another directory called `CVSROOT`. This directory, not to be confused with the environment variable, holds administrative files for the repository.

Congratulations! You’ve just created your first CVS repository.

### Checking In Code

Let’s say that you’ve decided to keep a list of your favorite colors. You are an artistically inclined but extremely forgetful person. You type up your list of colors and save it as a file called `favorites.txt`:

```
blue
orange
green

definitely not yellow
```

Let’s also assume that you’ve saved your file in a new directory called `colors`. Now you’d like to put your favorite color list under version control, because fifty years from now it will be interesting to look back and see how your tastes changed through time.

In order to do that, you will have to import your directory as a new CVS project. You can do that using the `import` command:

```
$ cvs -d ~/sandbox import -m "" colors colors initial
N colors/favorites.txt

No conflicts created by this import
```

Here we are specifying the location of our repository with the `-d` flag again. The remaining arguments are passed to the `import` subcommand. We have to provide a message, but here we don’t really need one, so we’ve left it blank. The next argument, `colors`, specifies the name of our new directory in the repository; here we’ve just used the same name as the directory we are in. The last two arguments specify the vendor tag and the release tag respectively. We’ll talk more about tags in a minute.

You’ve just pulled your “colors” project into the CVS repository. There are a couple different ways to go about bringing code into CVS, but this is the method recommended by [Pragmatic Version Control Using CVS][3], the Pragmatic Programmer book about CVS. What makes this method a little awkward is that you then have to check out your work fresh, even though you’ve already got an existing `colors` directory. Instead of using that directory, you’re going to delete it and then check out the version that CVS already knows about:

```
$ cvs -d ~/sandbox co colors
cvs checkout: Updating colors
U colors/favorites.txt
```

This will create a new directory, also called `colors`. In this directory you will find your original `favorites.txt` file along with a directory called `CVS`. The `CVS` directory is basically CVS’ equivalent of the `.git` directory in every Git repository.

### Making Changes

Get ready for a trip.

Just like Git, CVS has a `status` subcommand:

```
$ cvs status
cvs status: Examining .
===================================================================
File: favorites.txt     Status: Up-to-date

 Working revision:  1.1.1.1 2018-07-06 19:27:54 -0400
 Repository revision:   1.1.1.1 /Users/sinclairtarget/sandbox/colors/favorites.txt,v
 Commit Identifier: fD7GYxt035GNg8JA
 Sticky Tag:        (none)
 Sticky Date:       (none)
 Sticky Options:    (none)
```

This is where things start to look alien. CVS doesn’t have commit objects. In the above, there is something called a “Commit Identifier,” but this might be only a relatively recent edition—no mention of a “Commit Identifier” appears in Pragmatic Version Control Using CVS, which was published in 2003. (The last update to CVS was released in 2008.)

Whereas with Git you’d talk about the version of a file associated with commit `45de392`, in CVS files are versioned separately. The first version of your file is version 1.1, the next version is 1.2, and so on. When branches are involved, extra numbers are appended, so you might end up with something like the `1.1.1.1` above, which appears to be the default in our case even though we haven’t created any branches.

If you were to run `cvs log` (equivalent to `git log`) in a project with lots of files and commits, you’d see an individual history for each file. You might have a file at version 1.2 and a file at version 1.14 in the same project.

Let’s go ahead and make a change to version 1.1 of our `favorites.txt` file:

```
 blue
 orange
 green
+cyan

 definitely not yellow
```

Once we’ve made the change, we can run `cvs diff` to see what CVS thinks we’ve done:

```
$ cvs diff
cvs diff: Diffing .
Index: favorites.txt
===================================================================
RCS file: /Users/sinclairtarget/sandbox/colors/favorites.txt,v
retrieving revision 1.1.1.1
diff -r1.1.1.1 favorites.txt
3a4
> cyan
```

CVS recognizes that we added a new line containing the color “cyan” to the file. (Actually, it says we’ve made changes to the “RCS” file; you can see that CVS never fully escaped its original association with RCS.) The diff we are being shown is the diff between the copy of `favorites.txt` in our working directory and the 1.1.1.1 version stored in the repository.

In order to update the version stored in the repository, we have to commit the change. In Git, this would be a multi-step process. We’d have to stage the change so that it appears in our index. Then we’d commit the change. Finally, to make the change visible to anyone else, we’d have to push the commit up to the origin repository.

In CVS, all of these things happen when you run `cvs commit`. CVS just bundles up all the changes it can find and puts them in the repository:

```
$ cvs commit -m "Add cyan to favorites."
cvs commit: Examining .
/Users/sinclairtarget/sandbox/colors/favorites.txt,v <-- favorites.txt
new revision: 1.2; previous revision: 1.1
```

I’m so used to Git that this strikes me as terrifying. Without an opportunity to stage changes, any old thing that you’ve touched in your working directory might end up as part of the public repository. Did you passive-aggressively rewrite a coworker’s poorly implemented function out of cathartic necessity, never intending for him to know? Too bad, he now thinks you’re a dick. You also can’t edit your commits before pushing them, since a commit is a push. Do you enjoy spending 40 minutes repeatedly running `git rebase -i` until your local commit history flows like the derivation of a mathematical proof? Sorry, you can’t do that here, and everyone is going to find out that you don’t actually write your tests first.

But I also now understand why so many people find Git needlessly complicated. If `cvs commit` is what you were used to, then I’m sure staging and pushing changes would strike you as a pointless chore.

When people talk about Git being a “distributed” system, this is primarily the difference they mean. In CVS, you can’t make commits locally. A commit is a submission of code to the central repository, so it’s not something you can do without a connection. All you’ve got locally is your working directory. In Git, you have a full-fledged local repository, so you can make commits all day long even while disconnected. And you can edit those commits, revert, branch, and cherry pick as much as you want, without anybody else having to know.

Since commits were a bigger deal, CVS users often made them infrequently. Commits would contain as many changes as today we might expect to see in a ten-commit pull request. This was especially true if commits triggered a CI build and an automated test suite.

If we now run `cvs status`, we can see that we have a new version of our file:

```
$ cvs status
cvs status: Examining .
===================================================================
File: favorites.txt     Status: Up-to-date

 Working revision:  1.2 2018-07-06 21:18:59 -0400
 Repository revision:   1.2 /Users/sinclairtarget/sandbox/colors/favorites.txt,v
 Commit Identifier: pQx5ooyNk90wW8JA
 Sticky Tag:        (none)
 Sticky Date:       (none)
 Sticky Options:    (none)
```

### Merging

As mentioned above, in CVS you can edit a file that someone else is already editing. That was CVS’ big improvement on RCS. What happens when you need to bring your changes back together?

Let’s say that you have invited some friends to add their favorite colors to your list. While they are adding their colors, you decide that you no longer like the color green and remove it from the list.

When you go to commit your changes, you might discover that CVS notices a problem:

```
$ cvs commit -m "Remove green"
cvs commit: Examining .
cvs commit: Up-to-date check failed for `favorites.txt'
cvs [commit aborted]: correct above errors first!
```

It looks like your friends committed their changes first. So your version of `favorites.txt` is not up-to-date with the version in the repository. If you run `cvs status`, you’ll see that your local copy of `favorites.txt` is version 1.2 with some local changes, but the repository version is 1.3:

```
$ cvs status
cvs status: Examining .
===================================================================
File: favorites.txt     Status: Needs Merge

 Working revision:  1.2 2018-07-07 10:42:43 -0400
 Repository revision:   1.3 /Users/sinclairtarget/sandbox/colors/favorites.txt,v
 Commit Identifier: 2oZ6n0G13bDaldJA
 Sticky Tag:        (none)
 Sticky Date:       (none)
 Sticky Options:    (none)
```

You can run `cvs diff` to see exactly what the differences between 1.2 and 1.3 are:

```
$ cvs diff -r HEAD favorites.txt
Index: favorites.txt
===================================================================
RCS file: /Users/sinclairtarget/sandbox/colors/favorites.txt,v
retrieving revision 1.3
diff -r1.3 favorites.txt
3d2
< green
7,10d5
<
< pink
< hot pink
< bubblegum pink
```

It seems that our friends really like pink. In any case, they’ve edited a different part of the file than we have, so the changes are easy to merge. CVS can do that for us when we run `cvs update`, which is similar to `git pull`:

```
$ cvs update
cvs update: Updating .
RCS file: /Users/sinclairtarget/sandbox/colors/favorites.txt,v
retrieving revision 1.2
retrieving revision 1.3
Merging differences between 1.2 and 1.3 into favorites.txt
M favorites.txt
```

If you now take a look at `favorites.txt`, you’ll find that it has been modified to include the changes that your friends made to the file. Your changes are still there too. Now you are free to commit the file:

```
$ cvs commit
cvs commit: Examining .
/Users/sinclairtarget/sandbox/colors/favorites.txt,v <-- favorites.txt
new revision: 1.4; previous revision: 1.3
```

The end result is what you’d get in Git by running `git pull --rebase`. Your changes have been added on top of your friends’ changes. There is no “merge commit.”

Sometimes, changes to the same file might be incompatible. If your friends had changed “green” to “olive,” for example, that would have conflicted with your change removing “green” altogether. In the early days of CVS, this was exactly the kind of case that caused people to worry that CVS wasn’t safe; RCS’ pessimistic locking ensured that such a case could never arise. But CVS guarantees safety by making sure that nobody’s changes get overwritten automatically. You have to tell CVS which change you want to keep going forward, so when you run `cvs update`, CVS marks up the file with both changes in the same way that Git does when Git detects a merge conflict. You then have to manually edit the file and pick the change you want to keep.

The interesting thing to note here is that merge conflicts have to be fixed before you can commit. This is another consequence of CVS’ centralized nature. In Git, you don’t have to worry about resolving merges until you push the commits you’ve got locally.

Since CVS doesn’t have easily addressable commit objects, the only way to group a collection of changes is to mark a particular working directory state with a tag.

Creating a tag is easy:

```
$ cvs tag VERSION_1_0
cvs tag: Tagging .
T favorites.txt
```

You’ll later be able to return files to this state by running `cvs update` and passing the tag to the `-r` flag:

```
$ cvs update -r VERSION_1_0
cvs update: Updating .
U favorites.txt
```

Because you need a tag to rewind to an earlier working directory state, CVS encourages a lot of preemptive tagging. Before major refactors, for example, you might create a `BEFORE_REFACTOR_01` tag that you could later use if the refactor went wrong. People also used tags if they wanted to generate project-wide diffs. Basically, all the things we routinely do today with commit hashes have to be anticipated and planned for with CVS, since you needed to have the tags available already.

Branches can be created in CVS, sort of. Branches are just a special kind of tag:

```
$ cvs rtag -b TRY_EXPERIMENTAL_THING colors
cvs rtag: Tagging colors
```

That only creates the branch (in full view of everyone, by the way), so you still need to switch to it using `cvs update`:

```
$ cvs update -r TRY_EXPERIMENTAL_THING
```

The above commands switch onto the new branch in your current working directory, but Pragmatic Version Control Using CVS actually advises that you create a new directory to hold your new branch. Presumably its authors found switching directories easier than switching branches in CVS.

Pragmatic Version Control Using CVS also advises against creating branches off of an existing branch. They recommend only creating branches off of the mainline branch, which in Git is known as `master`. In general, branching was considered an “advanced” CVS skill. In Git, you might start a new branch for almost any trivial reason, but in CVS branching was typically used only when really necessary, such as for releases.

A branch could later be merged back into the mainline using `cvs update` and the `-j` flag:

```
$ cvs update -j TRY_EXPERIMENTAL_THING
```

### Thanks for the Commit Histories

In 2007, Linus Torvalds gave [a talk][4] about Git at Google. Git was very new then, so the talk was basically an attempt to persuade a roomful of skeptical programmers that they should use Git, even though Git was so different from anything then available. If you haven’t already seen the talk, I highly encourage you to watch it. Linus is an entertaining speaker, even if he never fails to be his brash self. He does an excellent job of explaining why the distributed model of version control is better than the centralized one. A lot of his criticism is reserved for CVS in particular.

Git is a [complex tool][5]. Learning it can be a frustrating experience. But I’m also continually amazed at the things that Git can do. In comparison, CVS is simple and straightforward, though often unable to do many of the operations we now take for granted. Going back and using CVS for a while is an excellent way to find yourself with a new appreciation for Git’s power and flexibility. It illustrates well why understanding the history of software development can be so beneficial—picking up and re-examining obsolete tools will teach you volumes about the why behind the tools we use today.

If you enjoyed this post, more like it come out every two weeks! Follow [@TwoBitHistory][6] on Twitter or subscribe to the [RSS feed][7] to make sure you know when a new post is out.

#### Correction

I’ve been told that there are many organizations, particularly risk-adverse organizations that do things like make medical device software, that still use CVS. Programmers in these organizations have developed little tricks for working around CVS’ limitations, such as making a new branch for almost every change to avoid committing directly to `HEAD`. (Thanks to Michael Kohne for pointing this out.)

--------------------------------------------------------------------------------

via: https://twobithistory.org/2018/07/07/cvs.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://docs.freebsd.org/44doc/psd/28.cvs/paper.pdf
[2]: https://www.nongnu.org/cvs/
[3]: http://shop.oreilly.com/product/9780974514000.do
[4]: https://www.youtube.com/watch?v=4XpnKHJAok8
[5]: https://xkcd.com/1597/
[6]: https://twitter.com/TwoBitHistory
[7]: https://twobithistory.org/feed.xml
