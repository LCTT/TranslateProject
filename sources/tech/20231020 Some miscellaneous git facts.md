[#]: subject: "Some miscellaneous git facts"
[#]: via: "https://jvns.ca/blog/2023/10/20/some-miscellaneous-git-facts/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Some miscellaneous git facts
======

I’ve been very slowly working on writing about how Git works. I thought I already knew Git pretty well, but as usual when I try to explain something I’ve been learning some new things.

None of these things feel super surprising in retrospect, but I hadn’t thought about them clearly before.

The facts are:

  * [the “index”, “staging area” and “–cached” are all the same thing][1]
  * [the stash is a bunch of commits][2]
  * [not all references are branches or tags][3]
  * [merge commits aren’t empty][4]



Let’s talk about them!

### the “index”, “staging area” and “–cached” are all the same thing

When you run `git add file.txt`, and then `git status`, you’ll see something like this:

```

    $ git add content/post/2023-10-20-some-miscellaneous-git-facts.markdown
    $ git status
    Changes to be committed:
      (use "git restore --staged <file>..." to unstage)
        new file:   content/post/2023-10-20-some-miscellaneous-git-facts.markdown

```

People usually call this “staging a file” or “adding a file to the staging area”.

When you stage a file with `git add`, behind the scenes git adds the file to its object database (in `.git/objects`) and updates a file called `.git/index` to refer to the newly added file.

This “staging area” actually gets referred to by 3 different names in Git. All of these refer to the exact same thing (the file `.git/index`):

  * `git diff --cached`
  * `git diff --staged`
  * the file `.git/index`



I felt like I should have realized this earlier, but I didn’t, so there it is.

### the stash is a bunch of commits

When I run `git stash` to stash my changes, I’ve always been a bit confused about where those changes actually went. It turns out that when you run `git stash`, git makes some commits with your changes and labels them with a reference called `stash` (in `.git/refs/stash`).

Let’s stash this blog post and look at the log of the `stash` reference:

```

    $ git log stash --oneline
    6cb983fe (refs/stash) WIP on main: c6ee55ed wip
    2ff2c273 index on main: c6ee55ed wip
    ... some more stuff

```

Now we can look at the commit `2ff2c273` to see what it contains:

```

    $ git show 2ff2c273  --stat
    commit 2ff2c273357c94a0087104f776a8dd28ee467769
    Author: Julia Evans <julia@jvns.ca>
    Date:   Fri Oct 20 14:49:20 2023 -0400

        index on main: c6ee55ed wip

     content/post/2023-10-20-some-miscellaneous-git-facts.markdown | 40 ++++++++++++++++++++++++++++++++++++++++

```

Unsurprisingly, it contains this blog post. Makes sense!

`git stash` actually creates 2 separate commits: one for the index, and one for your changes that you haven’t staged yet. I found this kind of heartening because I’ve been working on a tool to snapshot and restore the state of a git repository (that I may or may not ever release) and I came up with a very similar design, so that made me feel better about my choices.

Apparently older commits in the stash are stored in the reflog.

### not all references are branches or tags

Git’s documentation often refers to “references” in a generic way that I find a little confusing sometimes. Personally 99% of the time when I deal with a “reference” in Git it’s a branch or `HEAD` and the other 1% of the time it’s a tag. I actually didn’t know ANY examples of references that weren’t branches or tags or `HEAD`.

But now I know one example – the stash is a reference, and it’s not a branch or tag! So that’s cool.

Here are all the references in my blog’s git repository (other than `HEAD`):

```

    $ find .git/refs -type f
    .git/refs/heads/main
    .git/refs/remotes/origin/HEAD
    .git/refs/remotes/origin/main
    .git/refs/stash

```

Apparently there’s also a git command called [`git notes`][5] that can create references under `.git/refs/notes`.

### merge commits aren’t empty

Here’s a toy git repo where I created two branches `x` and `y`, each with 1 file (`x.txt` and `y.txt`) and merged them. Let’s look at the merge commit.

```

    $ git log --oneline
    96a8afb (HEAD -> y) Merge branch 'x' into y
    0931e45 y
    1d8bd2d (x) x

```

If I run `git show 96a8afb`, the commit looks “empty”: there’s no diff!

```

    git show 96a8afb
    commit 96a8afbf776c2cebccf8ec0dba7c6c765ea5d987 (HEAD -> y)
    Merge: 0931e45 1d8bd2d
    Author: Julia Evans <julia@jvns.ca>
    Date:   Fri Oct 20 14:07:00 2023 -0400

        Merge branch 'x' into y

```

But if I diff the merge commit against each of its two parent commits separately, you can see that of course there **is** a diff:

```

    $ git diff 0931e45 96a8afb   --stat
     x.txt | 1 +
     1 file changed, 1 insertion(+)
    $ git diff 1d8bd2d 96a8afb   --stat
     y.txt | 1 +
     1 file changed, 1 insertion(+)

```

It seems kind of obvious in retrospect that merge commits aren’t actually “empty” (they’re snapshots of the current state of the repo, just like any other commit), but I’d never thought about why they appear to be empty.

Apparently the reason that these merge diffs are empty is that merge diffs only show **conflicts** – if I instead create a repo with a merge conflict (one branch added `x` and another branch added `y` to the same file), and show the merge commit where I resolved the conflict, it looks like this:

```

    $ git show HEAD
    commit 3bfe8311afa4da867426c0bf6343420217486594
    Merge: 782b3d5 ac7046d
    Author: Julia Evans <julia@jvns.ca>
    Date:   Fri Oct 20 15:29:06 2023 -0400

        Merge branch 'x' into y

    diff --cc file.txt
    index 975fbec,587be6b..b680253
    --- a/file.txt
    +++ b/file.txt
    @@@ -1,1 -1,1 +1,1 @@@
    - y
     -x
    ++z

```

It looks like this is trying to tell me that one branch added `x`, another branch added `y`, and the merge commit resolved it by putting `z` instead. But in the earlier example, there was no conflict, so Git didn’t display a diff at all.

(thanks to Jordi for telling me how merge diffs work)

### that’s all!

I’ll keep this post short, maybe I’ll write another blog post with more git facts as I learn them.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2023/10/20/some-miscellaneous-git-facts/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: tmp.0vBZr0yeF0#the-index-staging-area-and-cached-are-all-the-same-thing
[2]: tmp.0vBZr0yeF0#the-stash-is-a-bunch-of-commits
[3]: tmp.0vBZr0yeF0#not-all-references-are-branches-or-tags
[4]: tmp.0vBZr0yeF0#merge-commits-aren-t-empty
[5]: https://tylercipriani.com/blog/2022/11/19/git-notes-gits-coolest-most-unloved-feature/
