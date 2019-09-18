[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (git exercises: navigate a repository)
[#]: via: (https://jvns.ca/blog/2019/08/30/git-exercises--navigate-a-repository/)
[#]: author: (Julia Evans https://jvns.ca/)

git exercises: navigate a repository
======

I think the [curl exercises][1] the other day went well, so today I woke up and wanted to try writing some Git exercises. Git is a big thing to learn, probably too big to learn in a few hours, so my first idea for how to break it down was by starting by **navigating** a repository.

I was originally going to use a toy test repository, but then I thought – why not a real repository? That’s way more fun! So we’re going to navigate the repository for the Ruby programming language. You don’t need to know any C to do this exercise, it’s just about getting comfortable with looking at how files in a repository change over time.

### clone the repository

To get started, clone the repository:

```
git clone https://github.com/ruby/ruby
```

The big different thing about this repository (as compared to most of the repositories you’ll work with in real life) is that it doesn’t have branches, but it DOES have lots of tags, which are similar to branches in that they’re both just pointers to a commit. So we’ll do exercises with tags instead of branches. The way you _change_ tags and branches are very different, but the way you _look at_ tags and branches is exactly the same.

### a git SHA always refers to the same code

The most important thing to keep in mind while doing these exercises is that a git SHA like `9e3d9a2a009d2a0281802a84e1c5cc1c887edc71` always refers to the same code, as explained in this page. This page is from a zine I wrote with Katie Sylor-Miller called [Oh shit, git!][2]. (She also has a great site called <https://ohshitgit.com/> that inspired the zine).

<https://wizardzines.com/zines/oh-shit-git/samples/ohshit-commit.png>

We’ll be using git SHAs really heavily in the exercises to get you used to working with them and to help understand how they correspond to tags and branches.

### git subcommands we’ll be using

All of these exercises only use 5 git subcommands:

```
git checkout
git log (--oneline, --author, and -S will be useful)
git diff (--stat will be useful)
git show
git status
```

### exercises

  1. Check out matz’s commit of Ruby from 1998. The commit ID is `3db12e8b236ac8f88db8eb4690d10e4a3b8dbcd4`. Find out how many lines of code Ruby was at that time.
  2. Check out the current master branch
  3. Look at the history for the file `hash.c`. What was the last commit ID that changed that file?
  4. Get a diff of how `hash.c` has changed in the last 20ish years: compare that file on the master branch to the file at commit `3db12e8b236ac8f88db8eb4690d10e4a3b8dbcd4`.
  5. Find a recent commit that changed `hash.c` and look at the diff for that commit
  6. This repository has a bunch of **tags** for every Ruby release. Get a list of all the tags.
  7. Find out how many files changed between tag `v1_8_6_187` and tag `v1_8_6_188`
  8. Find a commit (any commit) from 2015 and check it out, look at the files very briefly, then go back to the master branch.
  9. Find out what commit the tag `v1_8_6_187` corresponds to.
  10. List the directory `.git/refs/tags`. Run `cat .git/refs/tags/v1_8_6_187` to see the contents of one of those files.
  11. Find out what commit ID `HEAD` corresponds to right now.
  12. Find out how many commits have been made to the `test/` directory
  13. Get a diff of `lib/telnet.rb` between the commits `65a5162550f58047974793cdc8067a970b2435c0` and `9e3d9a2a009d2a0281802a84e1c5cc1c887edc71`. How many lines of that file were changed?
  14. How many commits were made between Ruby 2.5.1 and 2.5.2 (tags `v2_5_1` and `v2_5_3`) (this one is a tiny bit tricky, there’s more than one step)
  15. How many commits were authored by `matz` (Ruby’s creator)?
  16. What’s the most recent commit that included the word `tkutil`?
  17. Check out the commit `e51dca2596db9567bd4d698b18b4d300575d3881` and create a new branch that points at that commit.
  18. Run `git reflog` to see all the navigating of the repository you’ve done so far



--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2019/08/30/git-exercises--navigate-a-repository/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/2019/08/27/curl-exercises/
[2]: https://wizardzines.com/zines/oh-shit-git/
