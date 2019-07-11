Translating by Scoutydren....


[#]: collector: (lujun9972)
[#]: translator: (Scoutydren)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn to change history with git rebase!)
[#]: via: (https://git-rebase.io/)
[#]: author: (git-rebase https://git-rebase.io/)

Learn to change history with git rebase!
======
One of Git 's core value-adds is the ability to edit history. Unlike version control systems that treat the history as a sacred record, in git we can change history to suit our needs. This gives us a lot of powerful tools and allows us to curate a good commit history in the same way we use refactoring to uphold good software design practices. These tools can be a little bit intimidating to the novice or even intermediate git user, but this guide will help to demystify the powerful git-rebase .

```
A word of caution : changing the history of public, shared, or stable branches is generally advised against. Editing the history of feature branches and personal forks is fine, and editing commits that you haven't pushed yet is always okay. Use git push -f to force push your changes to a personal fork or feature branch after editing your commits.
```

Despite the scary warning, it's worth mentioning that everything mentioned in this guide is a non-destructive operation. It's actually pretty difficult to permanently lose data in git. Fixing things when you make mistakes is covered at the end of this guide.

### Setting up a sandbox

We don't want to mess up any of your actual repositories, so throughout this guide we'll be working with a sandbox repo. Run these commands to get started:

```
git init /tmp/rebase-sandbox
cd /tmp/rebase-sandbox
git commit --allow-empty -m"Initial commit"
```

If you run into trouble, just run rm -rf /tmp/rebase-sandbox and run these steps again to start over. Each step of this guide can be run on a fresh sandbox, so it's not necessary to re-do every task.


### Amending your last commit

Let's start with something simple: fixing your most recent commit. Let's add a file to our sandbox - and make a mistake:

```
echo "Hello wrold!" >greeting.txt
 git add greeting.txt
 git commit -m"Add greeting.txt"
```

Fixing this mistake is pretty easy. We can just edit the file and commit with `--amend`, like so:

```
echo "Hello world!" >greeting.txt
 git commit -a --amend
```

Specifying `-a` automatically stages (i.e. `git add`'s) all files that git already knows about, and `--amend` will squash the changes into the most recent commit. Save and quit your editor (you have a chance to change the commit message now if you'd like). You can see the fixed commit by running `git show`:

```
commit f5f19fbf6d35b2db37dcac3a55289ff9602e4d00 (HEAD -> master)
Author: Drew DeVault
Date:   Sun Apr 28 11:09:47 2019 -0400

    Add greeting.txt

diff --git a/greeting.txt b/greeting.txt
new file mode 100644
index 0000000..cd08755
--- /dev/null
+++ b/greeting.txt
@@ -0,0 +1 @@
+Hello world!
```

### Fixing up older commits

Amending only works for the most recent commit. What happens if you need to correct an older commit? Let's start by setting up our sandbox accordingly:

```
echo "Hello!" >greeting.txt
git add greeting.txt
git commit -m"Add greeting.txt"

echo "Goodbye world!" >farewell.txt
git add farewell.txt
git commit -m"Add farewell.txt"
```

Looks like `greeting.txt` is missing "world". Let's write a commit normally which fixes that:

```
echo "Hello world!" >greeting.txt
git commit -a -m"fixup greeting.txt"
```

So now the files look correct, but our history could be better - let's use the new commit to "fixup" the last one. For this, we need to introduce a new tool: the interactive rebase. We're going to edit the last three commits this way, so we'll run `git rebase -i HEAD~3` (`-i` for interactive). This'll open your text editor with something like this:

```
pick 8d3fc77 Add greeting.txt
pick 2a73a77 Add farewell.txt
pick 0b9d0bb fixup greeting.txt

# Rebase f5f19fb..0b9d0bb onto f5f19fb (3 commands)
#
# Commands:
# p, pick <commit> = use commit
# f, fixup <commit> = like "squash", but discard this commit's log message
```

This is the rebase plan, and by editing this file you can instruct git on how to edit history. I've trimmed the summary to just the details relevant to this part of the rebase guide, but feel free to skim the full summary in your text editor.

When we save and close our editor, git is going to remove all of these commits from its history, then execute each line one at a time. By default, it's going to pick each commit, summoning it from the heap and adding it to the branch. If we don't edit this file at all, we'll end up right back where we started, picking every commit as-is. We're going to use one of my favorite features now: fixup. Edit the third line to change the operation from "pick" to "fixup" and move it to immediately after the commit we want to "fix up":

```
pick 8d3fc77 Add greeting.txt
fixup 0b9d0bb fixup greeting.txt
pick 2a73a77 Add farewell.txt
```

**Tip** : We can also abbreviate this with just "f" to speed things up next time.

Save and quit your editor - git will run these commands. We can check the log to verify the result:

```
$ git log -2 --oneline
fcff6ae (HEAD -> master) Add farewell.txt
a479e94 Add greeting.txt
```

### Squashing several commits into one

As you work, you may find it useful to write lots of commits as you reach small milestones or fix bugs in previous commits. However, it may be useful to "squash" these commits together, to make a cleaner history before merging your work into master. For this, we'll use the "squash" operation. Let's start by writing a bunch of commits - just copy and paste this if you want to speed it up:

```
git checkout -b squash
for c in H e l l o , ' ' w o r l d; do
    echo "$c" >>squash.txt
    git add squash.txt
    git commit -m"Add '$c' to squash.txt"
done
```

That's a lot of commits to make a file that says "Hello, world"! Let's start another interactive rebase to squash them together. Note that we checked out a branch to try this on, first. Because of that, we can quickly rebase all of the commits since we branched by using `git rebase -i master`. The result:

```
pick 1e85199 Add 'H' to squash.txt
pick fff6631 Add 'e' to squash.txt
pick b354c74 Add 'l' to squash.txt
pick 04aaf74 Add 'l' to squash.txt
pick 9b0f720 Add 'o' to squash.txt
pick 66b114d Add ',' to squash.txt
pick dc158cd Add ' ' to squash.txt
pick dfcf9d6 Add 'w' to squash.txt
pick 7a85f34 Add 'o' to squash.txt
pick c275c27 Add 'r' to squash.txt
pick a513fd1 Add 'l' to squash.txt
pick 6b608ae Add 'd' to squash.txt

# Rebase 1af1b46..6b608ae onto 1af1b46 (12 commands)
#
# Commands:
# p, pick <commit> = use commit
# s, squash <commit> = use commit, but meld into previous commit
```

**Tip** : your local master branch evolves independently of the remote master branch, and git stores the remote branch as `origin/master`. Combined with this trick, `git rebase -i origin/master` is often a very convenient way to rebase all of the commits which haven't been merged upstream yet!

We're going to squash all of these changes into the first commit. To do this, change every "pick" operation to "squash", except for the first line, like so:

```
pick 1e85199 Add 'H' to squash.txt
squash fff6631 Add 'e' to squash.txt
squash b354c74 Add 'l' to squash.txt
squash 04aaf74 Add 'l' to squash.txt
squash 9b0f720 Add 'o' to squash.txt
squash 66b114d Add ',' to squash.txt
squash dc158cd Add ' ' to squash.txt
squash dfcf9d6 Add 'w' to squash.txt
squash 7a85f34 Add 'o' to squash.txt
squash c275c27 Add 'r' to squash.txt
squash a513fd1 Add 'l' to squash.txt
squash 6b608ae Add 'd' to squash.txt
```

When you save and close your editor, git will think about this for a moment, then open your editor again to revise the final commit message. You'll see something like this:

```
# This is a combination of 12 commits.
# This is the 1st commit message:

Add 'H' to squash.txt

# This is the commit message #2:

Add 'e' to squash.txt

# This is the commit message #3:

Add 'l' to squash.txt

# This is the commit message #4:

Add 'l' to squash.txt

# This is the commit message #5:

Add 'o' to squash.txt

# This is the commit message #6:

Add ',' to squash.txt

# This is the commit message #7:

Add ' ' to squash.txt

# This is the commit message #8:

Add 'w' to squash.txt

# This is the commit message #9:

Add 'o' to squash.txt

# This is the commit message #10:

Add 'r' to squash.txt

# This is the commit message #11:

Add 'l' to squash.txt

# This is the commit message #12:

Add 'd' to squash.txt

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# Date:      Sun Apr 28 14:21:56 2019 -0400
#
# interactive rebase in progress; onto 1af1b46
# Last commands done (12 commands done):
#    squash a513fd1 Add 'l' to squash.txt
#    squash 6b608ae Add 'd' to squash.txt
# No commands remaining.
# You are currently rebasing branch 'squash' on '1af1b46'.
#
# Changes to be committed:
#   new file:   squash.txt
#
```

This defaults to a combination of all of the commit messages which were squashed, but leaving it like this is almost always not what you want. The old commit messages may be useful for reference when writing the new one, though.

**Tip** : the "fixup" command you learned about in the previous section can be used for this purpose, too - but it discards the messages of the squashed commits.

Let's delete everything and replace it with a better commit message, like this:

```
Add squash.txt with contents "Hello, world"

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# Date:      Sun Apr 28 14:21:56 2019 -0400
#
# interactive rebase in progress; onto 1af1b46
# Last commands done (12 commands done):
#    squash a513fd1 Add 'l' to squash.txt
#    squash 6b608ae Add 'd' to squash.txt
# No commands remaining.
# You are currently rebasing branch 'squash' on '1af1b46'.
#
# Changes to be committed:
#   new file:   squash.txt
#
```

Save and quit your editor, then examine your git log - success!

```
commit c785f476c7dff76f21ce2cad7c51cf2af00a44b6 (HEAD -> squash)
Author: Drew DeVault
Date:   Sun Apr 28 14:21:56 2019 -0400

    Add squash.txt with contents "Hello, world"
```

Before we move on, let's pull our changes into the master branch and get rid of this scratch one. We can use `git rebase` like we use `git merge`, but it avoids making a merge commit:

```
git checkout master
git rebase squash
git branch -D squash
```

We generally prefer to avoid using git merge unless we're actually merging unrelated histories. If you have two divergent branches, a git merge is useful to have a record of when they were... merged. In the course of your normal work, rebase is often more appropriate.

### Splitting one commit into several

Sometimes the opposite problem happens - one commit is just too big. Let's look into splitting it up. This time, let's write some actual code. Start with a simple C program2 (you can still copy+paste this snippet into your shell to do this quickly):

```
cat <<EOF >main.c
int main(int argc, char *argv[]) {
    return 0;
}
EOF
```

We'll commit this first.

```
git add main.c
git commit -m"Add C program skeleton"
```

Next, let's extend the program a bit:

```
cat <<EOF >main.c
#include &ltstdio.h>

const char *get_name() {
    static char buf[128];
    scanf("%s", buf);
    return buf;
}

int main(int argc, char *argv[]) {
    printf("What's your name? ");
    const char *name = get_name();
    printf("Hello, %s!\n", name);
    return 0;
}
EOF
```

After we commit this, we'll be ready to learn how to split it up.

```
git commit -a -m"Flesh out C program"
```

The first step is to start an interactive rebase. Let's rebase both commits with `git rebase -i HEAD~2`, giving us this rebase plan:

```
pick 237b246 Add C program skeleton
pick b3f188b Flesh out C program

# Rebase c785f47..b3f188b onto c785f47 (2 commands)
#
# Commands:
# p, pick <commit> = use commit
# e, edit <commit> = use commit, but stop for amending
```

Change the second commit's command from "pick" to "edit", then save and close your editor. Git will think about this for a second, then present you with this:

```
Stopped at b3f188b...  Flesh out C program
You can amend the commit now, with

  git commit --amend

Once you are satisfied with your changes, run

  git rebase --continue
```

We could follow these instructions to add new changes to the commit, but instead let's do a "soft reset"3 by running `git reset HEAD^`. If you run `git status` after this, you'll see that it un-commits the latest commit and adds its changes to the working tree:

```
Last commands done (2 commands done):
   pick 237b246 Add C program skeleton
   edit b3f188b Flesh out C program
No commands remaining.
You are currently splitting a commit while rebasing branch 'master' on 'c785f47'.
  (Once your working directory is clean, run "git rebase --continue")

Changes not staged for commit:
  (use "git add ..." to update what will be committed)
  (use "git checkout -- ..." to discard changes in working directory)

  modified:   main.c

no changes added to commit (use "git add" and/or "git commit -a")
```

To split this up, we're going to do an interactive commit. This allows us to selectively commit only specific changes from the working tree. Run `git commit -p` to start this process, and you'll be presented with the following prompt:

```
diff --git a/main.c b/main.c
index b1d9c2c..3463610 100644
--- a/main.c
+++ b/main.c
@@ -1,3 +1,14 @@
+#include &ltstdio.h>
+
+const char *get_name() {
+    static char buf[128];
+    scanf("%s", buf);
+    return buf;
+}
+
 int main(int argc, char *argv[]) {
+    printf("What's your name? ");
+    const char *name = get_name();
+    printf("Hello, %s!\n", name);
     return 0;
 }
Stage this hunk [y,n,q,a,d,s,e,?]?
```

Git has presented you with just one "hunk" (i.e. a single change) to consider committing. This one is too big, though - let's use the "s" command to "split" up the hunk into smaller parts.

```
Split into 2 hunks.
@@ -1 +1,9 @@
+#include <stdio.h>
+
+const char *get_name() {
+    static char buf[128];
+    scanf("%s", buf);
+    return buf;
+}
+
 int main(int argc, char *argv[]) {
Stage this hunk [y,n,q,a,d,j,J,g,/,e,?]?
```

**Tip** : If you're curious about the other options, press "?" to summarize them.

This hunk looks better - a single, self-contained change. Let's hit "y" to answer the question (and stage that "hunk"), then "q" to "quit" the interactive session and proceed with the commit. Your editor will pop up to ask you to enter a suitable commit message.

```
Add get_name function to C program

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# interactive rebase in progress; onto c785f47
# Last commands done (2 commands done):
#    pick 237b246 Add C program skeleton
#    edit b3f188b Flesh out C program
# No commands remaining.
# You are currently splitting a commit while rebasing branch 'master' on 'c785f47'.
#
# Changes to be committed:
#   modified:   main.c
#
# Changes not staged for commit:
#   modified:   main.c
#
```

Save and close your editor, then we'll make the second commit. We could do another interactive commit, but since we just want to include the rest of the changes in this commit we'll just do this:

```
git commit -a -m"Prompt user for their name"
git rebase --continue
```

That last command tells git that we're done editing this commit, and to continue to the next rebase command. That's it! Run `git log` to see the fruits of your labor:

```
$ git log -3 --oneline
fe19cc3 (HEAD -> master) Prompt user for their name
659a489 Add get_name function to C program
237b246 Add C program skeleton
```

### Reordering commits

This one is pretty easy. Let's start by setting up our sandbox:

```
echo "Goodbye now!" >farewell.txt
git add farewell.txt
git commit -m"Add farewell.txt"

echo "Hello there!" >greeting.txt
git add greeting.txt
git commit -m"Add greeting.txt"

echo "How're you doing?" >inquiry.txt
git add inquiry.txt
git commit -m"Add inquiry.txt"
```

The git log should now look like this:

```
f03baa5 (HEAD -> master) Add inquiry.txt
a4cebf7 Add greeting.txt
90bb015 Add farewell.txt
```

Clearly, this is all out of order. Let's do an interactive rebase of the past 3 commits to resolve this. Run `git rebase -i HEAD~3` and this rebase plan will appear:

```
pick 90bb015 Add farewell.txt
pick a4cebf7 Add greeting.txt
pick f03baa5 Add inquiry.txt

# Rebase fe19cc3..f03baa5 onto fe19cc3 (3 commands)
#
# Commands:
# p, pick <commit> = use commit
#
# These lines can be re-ordered; they are executed from top to bottom.
```

The fix is now straightforward: just reorder these lines in the order you wish for the commits to appear. Should look something like this:

```
pick a4cebf7 Add greeting.txt
pick f03baa5 Add inquiry.txt
pick 90bb015 Add farewell.txt
```

Save and close your editor and git will do the rest for you. Note that it's possible to end up with conflicts when you do this in practice - click here for help resolving conflicts.

### git pull --rebase

If you've been writing some commits on a branch which has been updated upstream, normally `git pull` will create a merge commit. In this respect, `git pull`'s behavior by default is equivalent to:

```
git fetch origin
git merge origin/master
```

There's another option, which is often more useful and leads to a much cleaner history: `git pull --rebase`. Unlike the merge approach, this is equivalent to the following:

```
git fetch origin
git rebase origin/master
```

The merge approach is simpler and easier to understand, but the rebase approach is almost always what you want to do if you understand how to use git rebase. If you like, you can set it as the default behavior like so:

```
git config --global pull.rebase true
```

When you do this, technically you're applying the procedure we discuss in the next section... so let's explain what it means to do that deliberately, too.

### Using git rebase to... rebase

Ironically, the feature of git rebase that I use the least is the one it's named for: rebasing branches. Say you have the following branches:

```
o--o--o--o--> master
   \--o--o--> feature-1
      \--o--> feature-2
```

It turns out feature-2 doesn't depend on any of the changes in feature-1, so you can just base it off of master. The fix is thus:

```
git checkout feature-2
git rebase master
```

The non-interactive rebase does the default operation for all implicated commits ("pick")4, which simply rolls your history back to the last common anscestor and replays the commits from both branches. Your history now looks like this:

```
o--o--o--o--> master
   |     \--o--> feature-2
   \--o--o--> feature-1
```

### Resolving conflicts

The details on resolving merge conflicts are beyond the scope of this guide - keep your eye out for another guide for this in the future. Assuming you're familiar with resolving conflicts in general, here are the specifics that apply to rebasing.

The details on resolving merge conflicts are beyond the scope of this guide - keep your eye out for another guide for this in the future. Assuming you're familiar with resolving conflicts in general, here are the specifics that apply to rebasing.

Sometimes you'll get a merge conflict when doing a rebase, which you can handle just like any other merge conflict. Git will set up the conflict markers in the affected files, `git status` will show you what you need to resolve, and you can mark files as resolved with `git add` or `git rm`. However, in the context of a git rebase, there are two options you should be aware of.

The first is how you complete the conflict resolution. Rather than `git commit` like you'll use when addressing conflicts that arise from `git merge`, the appropriate command for rebasing is `git rebase --continue`. However, there's another option available to you: `git rebase --skip`. This will skip the commit you're working on, and it won't be included in the rebase. This is most common when doing a non-interactive rebase, when git doesn't realize that a commit it's pulled from the "other" branch is an updated version of the commit that it conflicts with on "our" branch.

### Help! I broke it!

No doubt about it - rebasing can be hard sometimes. If you've made a mistake and in so doing lost commits which you needed, then `git reflog` is here to save the day. Running this command will show you every operation which changed a ref, or reference - that is, branches and tags. Each line shows you what the old reference pointed to, and you can `git cherry-pick`, `git checkout`, `git show`, or use any other operation on git commits once thought lost.


--------------------------------------------------------------------------------

via: https://git-rebase.io/

作者：[git-rebase][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://git-rebase.io/
[b]: https://github.com/lujun9972
