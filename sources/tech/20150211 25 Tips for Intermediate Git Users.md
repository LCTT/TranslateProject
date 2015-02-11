25 Tips for Intermediate Git Users
================================================================================
I’ve been using git for about 18 months now and thought I knew it pretty well. Then we had [Scott Chacon][1] from GitHub over to do some training at [LVS, a supplier/developer of betting/gaming software][2] (where contracted until 2013) and I learnt a ton in the first day.

As someone who’s always felt fairly comfortable in Git, I thought sharing some of the nuggets I learnt with the community might help someone to find an answer without needing to do lots of research.

### Basic Tips ###

#### 1. First Steps After Install ####

After installing Git, the first thing you should do is configure your name and email, as every commit will have these details:

    $ git config --global user.name "Some One"
    $ git config --global user.email "someone@gmail.com"

#### 2. Git is Pointer-Based ####

Everything stored in git is in a file. When you create a commit it creates a file containing your commit message and associated data (name, email, date/time, previous commit, etc) and links it to a tree file. The tree file contains a list of objects or other trees. The object or blob is the actual content associated with the commit (a file, if you will, although the filename isn’t stored in the object, but in the tree). All of these files are stored with a filename of a SHA-1 hash of the object.

From there branches and tags are simply files containing (basically) a SHA-1 hash which points to the commit. Using these references allows for a lot of flexibility and speed, as creating a new branch is as simple as creating a file with the name of the branch and the SHA-1 reference to the commit you’re branching from. Of course, you’d never do that as you’d use the Git command line tools (or a GUI), but it’s that simple.

You may have heard references to the HEAD. This is simply a file containing the SHA-1 reference of the commit you’re currently pointing to. If you’re resolving a merge conflict and see HEAD, that’s nothing to do with a particular branch or necessarily a particular point on the branch but where you currently are.

All the branch pointers are kept in .git/refs/heads, HEAD is in .git/HEAD and tags are in .git/refs/tags – feel free to have a look in there.

#### 3. Two Parents – of course! ####

When viewing a merge commit message in a log, you will see two parents (as opposed to the normal one for a work-based commit). The first parent is the branch you were on and the second is the one you merged in to it.

#### 4. Merge Conflicts ####

By now I’m sure you have had a merge conflict and had to resolve it. This is normally done by editing the file, removing the <<<<, ====, >>>> markers and the keeping the code you want to store. Sometimes it’s nice to see the code before either change, i.e. before you made the change in both branches that now conflicts. This is one command away:

    $ git diff --merge
    diff --cc dummy.rb  
    index 5175dde,0c65895..4a00477  
    --- a/dummy.rb
    +++ b/dummy.rb
    @@@ -1,5 -1,5 +1,5 @@@
      class MyFoo
        def say
    -     puts "Bonjour"
     -    puts "Hello world"
    ++    puts "Annyong Haseyo"
        end
      end

If the file is binary, diffing files isn’t so easy… What you’ll normally want to do is to try each version of the binary file and decide which one to use (or manually copy portions over in the binary file’s editor). To pull a copy of the file from a particular branch (say you’re merging master and feature132):

    $ git checkout master flash/foo.fla # or...
    $ git checkout feature132 flash/foo.fla
    $ # Then...
    $ git add flash/foo.fla

Another way is to cat the file from git – you can do this to another filename then copy the correct file over (when you’ve decided which it is) to the normal filename:

    $ git show master:flash/foo.fla > master-foo.fla
    $ git show feature132:flash/foo.fla > feature132-foo.fla
    $ # Check out master-foo.fla and feature132-foo.fla
    $ # Let's say we decide that feature132's is correct
    $ rm flash/foo.fla
    $ mv feature132-foo.fla flash/foo.fla
    $ rm master-foo.fla
    $ git add flash/foo.fla

UPDATE: Thanks to Carl in the comments on the original blog post for the reminder, you can actually use “git checkout —ours flash/foo.fla” and “git checkout —theirs flash/foo.fla” to checkout a particular version without remembering which branches you merge in. Personally I prefer to be more explicit, but the option is there…

Remember to add the file after resolving the merge conflict (as I do above).

### Servers, Branching and Tagging ###

#### 5. Remote Servers ####

One of the most powerful features of Git is the ability to have more than one remote server (as well as the fact that you’re running a local repository always). You don’t always need write access either, you may have multiple servers you read from (to merge work in) and then write to another. To add a new remote server is simple:

    $ git remote add john git@github.com:johnsomeone/someproject.git

If you want to see information about your remote servers you can do:

    # shows URLs of each remote server
    $ git remote -v 
    
    # gives more details about each
    $ git remote show name 

You can always see the differences between a local branch and a remote branch:

    $ git diff master..john/master

You can also see the changes on HEAD that aren’t on that remote branch:

    $ git log remote/branch..
    # Note: no final refspec after ..

#### 6. Tagging ####

In Git there are two types of tag – a lightweight tag and an annotated tag. Bearing in mind Tip 2 about Git being pointer based, the difference between the two is simple. A lightweight tag is simply a named pointer to a commit. You can always change it to point to another commit. An annotated tag is a name pointer to a tag object, with it’s own message and history. As it has it’s own message it can be GPG signed if required.

Creating the two types of tag is easy (and one command line switch different)

    $ git tag to-be-tested
    $ git tag -a v1.1.0 # Prompts for a tag message

#### 7. Creating Branches ####

Creating branches in git is very easy (and lightning quick due to it only needing to create a less than 100 byte file). The longhand way of creating a new branch and switching to it:

    $ git branch feature132
    $ git checkout feature132

Of course, if you know you’re going to want to switch to it straight away you can do it in one command:

    $ git checkout -b feature132

If you want to rename a local branch it’s as easy as (the long way to show what happens):

    $ git checkout -b twitter-experiment feature132
    $ git branch -d feature132

Update: Or you can (as Brian Palmer points out in the comments on the original blog post) just use the -m switch to “git branch” to do it in one step (as Mike points out, if you only specify one branch it renames your current branch):

    $ git branch -m twitter-experiment
    $ git branch -m feature132 twitter-experiment

#### 8. Merging Branches ####

At some point in the future, you’re going to want to merge your changes back in. There are two ways to do this:

    $ git checkout master
    $ git merge feature83 # Or...
    $ git rebase feature83

The difference between merge and rebase is that merge tries to resolve the changes and create a new commit that blends them. Rebase tries to take your changes since you last diverged from the other branch and replay them from the HEAD of the other branch. However, don’t rebase after you’ve pushed a branch to a remote server – this can cause confusion/problems.

If you aren’t sure which branches still have unique work on them – so you know which you need to merge and which ones can be removed, there are two switches to git branch that help:

    # Shows branches that are all merged in to your current branch
    $ git branch --merged
    
    # Shows branches that are not merged in to your current branch
    $ git branch --no-merged

#### 9. Remote Branches ####

If you have a local branch that you’d like to appear on a remote server, you can push it up with one command:

    $ git push origin twitter-experiment:refs/heads/twitter-experiment
    # Where origin is our server name and twitter-experiment is the branch

Update: Thanks to Erlend in the comments on the original blog post – this is actually the same as doing `git push origin twitter-experiment` but by using the full syntax you can see that you can actually use different names on both ends (so your local can be `add-ssl-support` while your remote name can be `issue-1723`).

If you want to delete a branch from the server (note the colon before the branch name):

    $ git push origin :twitter-experiment

If you want to show the state of all remote branches you can view them like this:

    $ git remote show origin

This may list some branches that used to exist on the server but now don’t exist. If this is the case you can easily remove them from your local checkout using:

    $ git remote prune

Finally, if you have a remote branch that you want to track locally, the longhand way is:

    $ git branch --track myfeature origin/myfeature
    $ git checkout myfeature

However, newer versions of Git automatically set up tracking if you use the -b flag to checkout:

    $ git checkout -b myfeature origin/myfeature

### Storing Content in Stashes, Index and File System ###

#### 10. Stashing ####

In Git you can drop your current work state in to a temporary storage area stack and then re-apply it later. The simple case is as follows:

    $ git stash
    # Do something...
    $ git stash pop

A lot of people recommend using `git stash apply` instead of pop, however if you do this you end up with a long list of stashes left hanging around. “pop” will only remove it from the stack if it applies cleanly. If you’ve used `git stash apply` you can remove the last item from the stack anyway using:

    $ git stash drop

Git will automatically create a comment based on the current commit message. If you’d prefer to use a custom message (as it may have nothing to do with the previous commit):

    $ git stash save "My stash message"

If you want to apply a particular stash from your list (not necessarily the last one) you can list them and apply it like this:

    $ git stash list
      stash@{0}: On master: Changed to German
      stash@{1}: On master: Language is now Italian
    $ git stash apply stash@{1}

#### 11. Adding Interactively ####

In the subversion world you change files and then just commit everything that has changed. In Git you have a LOT more power to commit just certain files or even certain patches. To commit certain files or parts of files you need to go in to interactive mode.

    $ git add -i
               staged     unstaged path
    
    
    *** Commands ***
      1: status      2: update   3: revert   4: add untracked
      5: patch      6: diff     7: quit     8: help
    What now>  

This drops you in to a menu based interactive prompt. You can use the numbers of the commands or the highlighted letters (if you have colour highlighting turned on) to go in to that mode. Then it’s normally a matter of typing the numbers of the files you want to apply that action to (you can use formats like 1 or 1-4 or 2,4,7).

If you want to go to patch mode (‘p’ or ‘5’ from interactive mode) you can also go straight in to that mode:

    $ git add -p    
    diff --git a/dummy.rb b/dummy.rb  
    index 4a00477..f856fb0 100644  
    --- a/dummy.rb
    +++ b/dummy.rb
    @@ -1,5 +1,5 @@
     class MyFoo
       def say
    -    puts "Annyong Haseyo"
    +    puts "Guten Tag"
       end
     end
    Stage this hunk [y,n,q,a,d,/,e,?]?  

As you can see you then get a set of options at the bottom for choosing to add this changed part of the file, all changes from this file, etc. Using the ‘?’ command will explain the options.

#### 12. Storing/Retrieving from the File System ####

Some projects (the Git project itself for example) store additional files directly in the Git file system without them necessarily being a checked in file.

Let’s start off by storing a random file in Git:

    $ echo "Foo" | git hash-object -w --stdin
    51fc03a9bb365fae74fd2bf66517b30bf48020cb  

At this point the object is in the database, but if you don’t set something up to point to that object it will be garbage collected. The easiest way is to tag it:

    $ git tag myfile 51fc03a9bb365fae74fd2bf66517b30bf48020cb

Note that here we’ve used the tag myfile. When we need to retrieve the file we can do it with:

    $ git cat-file blob myfile

This can be useful for utility files that developers may need (passwords, gpg keys, etc) but you don’t want to actually check out on to disk every time (particularly in production).

### Logging and What Changed? ###

#### 13. Viewing a Log ####

You can’t use Git for long without using ‘git log’ to view your recent commits. However, there are some tips on how to use it better. For example, you can view a patch of what changed in each commit with:

    $ git log -p

Or you can just view a summary of which files changed with:

    $ git log --stat

There’s a nice alias you can set up which shows abbreviated commits and a nice graph of branches with the messages on a single line (like gitk, but on the command line):

    $ git config --global alias.lol "log --pretty=oneline --abbrev-commit --graph --decorate"
    $ git lol
    * 4d2409a (master) Oops, meant that to be in Korean
    * 169b845 Hello world

#### 14. Searching in the Log ####

If you want to search for a particular author you can specify that:

    $ git log --author=Andy

Update: Thanks to Johannes in the comments, I’ve cleared up some of the confusion here.

Or if you have a search term that appears in the commit message:

    $ git log --grep="Something in the message"

There’s also a more powerful command called the pickaxe command that look for the entry that removes or adds a particular piece of content (i.e. when it first appeared or was removed). This can tell you when a line was added (but not if a character on that line was later changed):

    $ git log -S "TODO: Check for admin status"

What about if you changed a particular file, e.g. `lib/foo.rb`

    $ git log lib/foo.rb

Let’s say you have a `feature/132` branch and a `feature/145` and you want to view the commits on those branches that aren’t on master (note the ^ meaning not):

    $ git log feature/132 feature/145 ^master

You can also narrow it down to a date range using ActiveSupport style dates:

    $ git log --since=2.months.ago --until=1.day.ago

By default it will use OR to combine the query, but you can easily change it to use AND (if you have more than one criteria)

    $ git log --since=2.months.ago --until=1.day.ago --author=andy -S "something" --all-match

#### 15. Selecting Revisions to View/Change ####

There are a number of items you can specify when referring to a revision, depending on what you know about it:

    $ git show 12a86bc38 # By revision
    $ git show v1.0.1 # By tag
    $ git show feature132 # By branch name
    $ git show 12a86bc38^ # Parent of a commit
    $ git show 12a86bc38~2 # Grandparent of a commit
    $ git show feature132@{yesterday} # Time relative
    $ git show feature132@{2.hours.ago} # Time relative

Note that unlike the previous section, a caret on the end means the parent of that commit – a caret at the start means not on this branch.

#### 16. Selecting a Range ####

The easiest way is to use:

    $ git log origin/master..new
    # [old]..[new] - everything you haven't pushed yet

You can also omit the [new] and it will use your current HEAD.

### Rewinding Time & Fixing Mistakes ###

#### 17. Resetting changes ####

You can easily unstage a change if you haven’t committed it using:

    $ git reset HEAD lib/foo.rb

Often this is aliased to ‘unstage’ as it’s a bit non-obvious.

    $ git config --global alias.unstage "reset HEAD"
    $ git unstage lib/foo.rb

If you’ve committed the file already, you can do two things – if it’s the last commit you can just amend it:

    $ git commit --amend

This undoes the last commit, puts your working copy back as it was with the changes staged and the commit message ready to edit/commit next time you commit.

If you’ve committed more than once and just want to completely undo them, you can reset the branch back to a previous point in time.

    $ git checkout feature132
    $ git reset --hard HEAD~2

If you actually want to bring a branch to point to a completely different SHA1 (maybe you’re bringing the HEAD of a branch to another branch, or a further commit) you can do the following to do it the long way:

    $ git checkout FOO
    $ git reset --hard SHA

There’s actually a quicker way (as it doesn’t change your working copy back to the state of FOO first then forward to SHA):

    $ git update-ref refs/heads/FOO SHA

#### 18. Committing to the Wrong Branch ####

OK, let’s assume you committed to master but should have created a topic branch called experimental instead. To move those changes over, you can create a branch at your current point, rewind head and then checkout your new branch:

    $ git branch experimental   # Creates a pointer to the current master state
    $ git reset --hard master~3 # Moves the master branch pointer back to 3 revisions ago
    $ git checkout experimental

This can be more complex if you’ve made the changes on a branch of a branch of a branch etc. Then what you need to do is rebase the change on a branch on to somewhere else:

    $ git branch newtopic STARTPOINT
    $ git rebase oldtopic --onto newtopic

#### 19. Interactive Rebasing ####

This is a cool feature I’ve seen demoed before but never actually understood, now it’s easy. Let’s say you’ve made 3 commits but you want to re-order them or edit them (or combine them):

    $ git rebase -i master~3

Then you get your editor pop open with some instructions. All you have to do is amend the instructions to pick/squash/edit (or remove them) commits and save/exit. Then after editing you can `git rebase —continue` to keep stepping through each of your instructions.

If you choose to edit one, it will leave you in the state you were in at the time you committed that, so you need to use git commit —amend to edit it.

**Note: DO NOT COMMIT DURING REBASE – only add then use —continue, —skip or —abort.**

#### 20. Cleaning Up ####

If you’ve committed some content to your branch (maybe you’ve imported an old repo from SVN) and you want to remove all occurrences of a file from the history:

    $ git filter-branch --tree-filter 'rm -f *.class' HEAD

If you’ve already pushed to origin, but have committed the rubbish since then, you can also do this for your local system before pushing:

    $ git filter-branch --tree-filter 'rm -f *.class' origin/master..HEAD

### Miscellaneous Tips ###

#### 21. Previous References You’ve Viewed ####

If you know you’ve previously viewed a SHA-1, but you’ve done some resetting/rewinding you can use the reflog commands to view the SHA-1s you’ve recently viewed:

    $ git reflog
    $ git log -g # Same as above, but shows in 'log' format

#### 22. Branch Naming ####

A lovely little tip – don’t forget that branch names aren’t limited to a-z and 0-9. It can be quite nice to use / and . in names for fake namespacing or versionin, for example:

    $ # Generate a changelog of Release 132
    $ git shortlog release/132 ^release/131
    $ # Tag this as v1.0.1
    $ git tag v1.0.1 release/132

#### 23. Finding Who Dunnit ####

Often it can be useful to find out who changed a line of code in a file. The simple command to do this is:

    $ git blame FILE

Sometimes the change has come from a previous file (if you’ve combined two files, or you’ve moved a function) so you can use:

    $ # shows which file names the content came from
    $ git blame -C FILE

Sometimes it’s nice to track this down by clicking through changes and going further and further back. There’s a nice in-built gui for this:

    $ git gui blame FILE

#### 24. Database Maintenance ####

Git doesn’t generally require a lot of maintenance, it pretty much takes care of itself. However, you can view the statistics of your database using:

    $ git count-objects -v

If this is high you can choose to garbage collect your clone. This won’t affect pushes or other people but it can make some of your commands run much faster and take less space:

    $ git gc

It also might be worth running a consistency check every so often:

    $ git fsck --full

You can also add a `—auto` parameter on the end (if you’re running it frequently/daily from crontab on your server) and it will only fsck if the stats show it’s necessary.

When checking, getting “dangling” or “unreachable” is fine, this is often a result of rewinding heads or rebasing. Getting “missing” or “sha1 mismatch” is bad… Get professional help!

#### 25. Recovering a Lost Branch ####

If you delete a branch experimental with -D you can recreate it with:

    $ git branch experimental SHA1_OF_HASH

You can often find the SHA1 hash using git reflog if you’ve accessed it recently.

Another way is to use `git fsck —lost-found`. A dangling commit here is the lost HEAD (it will only be the HEAD of the deleted branch as the HEAD^ is referred to by HEAD so it’s not dangling)

### Done! ###

Wow, the longest blog post I’ve ever written, I hope someone finds it useful. If you did, or if you have any questions let me know in the comments…

--------------------------------------------------------------------------------

via: https://www.andyjeffries.co.uk/25-tips-for-intermediate-git-users/

作者：[Andy Jeffries][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://www.andyjeffries.co.uk/author/andy-jeffries/
[1]:http://gitcasts.com/about
[2]:http://www.lvs.co.uk/