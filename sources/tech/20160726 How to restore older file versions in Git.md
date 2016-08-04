translated by strugglingyouth
How to restore older file versions in Git
=============================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/file_system.jpg?itok=s2b60oIB)

In today's article you will learn how to find out where you are in the history of your project, how to restore older file versions, and how to make Git branches so you can safely conduct wild experiments.

Where you are in the history of your Git project, much like your location in the span of a rock album, is determined by a marker called HEAD (like the playhead of a tape recorder or record player). To move HEAD around in your own Git timeline, use the git checkout command.

There are two ways to use the git checkout command. A common use is to restore a file from a previous commit, and you can also rewind your entire tape reel and go in an entirely different direction.

### Restore a file

This happens when you realize you've utterly destroyed an otherwise good file. We all do it; we get a file to a great place, we add and commit it, and then we decide that what it really needs is one last adjustment, and the file ends up completely unrecognizable.

To restore it to its former glory, use git checkout from the last known commit, which is HEAD:

```
$ git checkout HEAD filename
```

If you accidentally committed a bad version of a file and need to yank a version from even further back in time, look in your Git log to see your previous commits, and then check it out from the appropriate commit:

```
$ git log --oneline
79a4e5f bad take
f449007 The second commit
55df4c2 My great project, first commit.

$ git checkout 55df4c2 filename

```

Now the older version of the file is restored into your current position. (You can see your current status at any time with the git status command.) You need to add the file because it has changed, and then commit it:

```
$ git add filename
$ git commit -m 'restoring filename from first commit.'
```

Look in your Git log to verify what you did:

```
$ git log --oneline
d512580 restoring filename from first commit
79a4e5f bad take
f449007 The second commit
55df4c2 My great project, first commit.
```

Essentially, you have rewound the tape and are taping over a bad take. So you need to re-record the good take.

### Rewind the timeline

The other way to check out a file is to rewind the entire Git project. This introduces the idea of branches, which are, in a way, alternate takes of the same song.

When you go back in history, you rewind your Git HEAD to a previous version of your project. This example rewinds all the way back to your original commit:

```
$ git log --oneline
d512580 restoring filename from first commit
79a4e5f bad take
f449007 The second commit
55df4c2 My great project, first commit.

$ git checkout 55df4c2
```

When you rewind the tape in this way, if you hit the record button and go forward, you are destroying your future work. By default, Git assumes you do not want to do this, so it detaches HEAD from the project and lets you work as needed without accidentally recording over something you have recorded later.

If you look at your previous version and realise suddenly that you want to re-do everything, or at least try a different approach, then the safe way to do that is to create a new branch. You can think of this process as trying out a different version of the same song, or creating a remix. The original material exists, but you're branching off and doing your own version for fun.

To get your Git HEAD back down on blank tape, make a new branch:

```
$ git checkout -b remix
Switched to a new branch 'remix'
```

Now you've moved back in time, with an alternate and clean workspace in front of you, ready for whatever changes you want to make.

You can do the same thing without moving in time. Maybe you're perfectly happy with how your progress is going, but would like to switch to a temporary workspace just to try some crazy ideas out. That's a perfectly acceptable workflow, as well:

```
$ git status
On branch master
nothing to commit, working directory clean

$ git checkout -b crazy_idea
Switched to a new branch 'crazy_idea'
```

Now you have a clean workspace where you can sandbox some crazy new ideas. Once you're done, you can either keep your changes, or you can forget they ever existed and switch back to your master branch.

To forget your ideas in shame, change back to your master branch and pretend your new branch doesn't exist:

```
$ git checkout master
```

To keep your crazy ideas and pull them back into your master branch, change back to your master branch and merge your new branch:

```
$ git checkout master
$ git merge crazy_idea
```

Branches are powerful aspects of git, and it's common for developers to create a new branch immediately after cloning a repository; that way, all of their work is contained on their own branch, which they can submit for merging to the master branch. Git is pretty flexible, so there's no "right" or "wrong" way (even a master branch can be distinguished from what remote it belongs to), but branching makes it easy to separate tasks and contributions. Don't get too carried away, but between you and me, you can have as many Git branches as you please. They're free!

### Working with remotes

So far you've maintained a Git repository in the comfort and privacy of your own home, but what about when you're working with other people?

There are several different ways to set Git up so that many people can work on a project at once, so for now we'll focus on working on a clone, whether you got that clone from someone's personal Git server or their GitHub page, or from a shared drive on the same network.

The only difference between working on your own private Git repository and working on something you want to share with others is that at some point, you need to push your changes to someone else's repository. We call the repository you are working in a local repository, and any other repository a remote.

When you clone a repository with read and write permissions from another source, your clone inherits the remote from whence it came as its origin. You can see a clone's remote:

```
$ git remote --verbose
origin  seth@example.com:~/myproject.Git (fetch)
origin  seth@example.com:~/myproject.Git (push)
```

Having a remote origin is handy because it is functionally an offsite backup, and it also allows someone else to be working on the project.

If your clone didn't inherit a remote origin, or if you choose to add one later, use the git remote command:

```
$ git remote add seth@example.com:~/myproject.Git
```

If you have changed files and want to send them to your remote origin, and have read and write permissions to the repository, use git push. The first time you push changes, you must also send your branch information. It is a good practice to not work on master, unless you've been told to do so:

```
$ git checkout -b seth-dev
$ git add exciting-new-file.txt
$ git commit -m 'first push to remote'
$ git push -u origin HEAD
```

This pushes your current location (HEAD, naturally) and the branch it exists on to the remote. After you've pushed your branch once, you can drop the -u option:

```
$ git add another-file.txt
$ git commit -m 'another push to remote'
$ git push origin HEAD
```

### Merging branches

When you're working alone in a Git repository you can merge test branches into your master branch whenever you want. When working in tandem with a contributor, you'll probably want to review their changes before merging them into your master branch:

```
$ git checkout contributor
$ git pull
$ less blah.txt  # review the changed files
$ git checkout master
$ git merge contributor
```

If you are using GitHub or GitLab or something similar, the process is different. There, it is traditional to fork the project and treat it as though it is your own repository. You can work in the repository and send changes to your GitHub or GitLab account without getting permission from anyone, because it's your repository.

If you want the person you forked it from to receive your changes, you create a pull request, which uses the web service's backend to send patches to the real owner, and allows them to review and pull in your changes.

Forking a project is usually done on the web service, but the Git commands to manage your copy of the project are the same, even the push process. Then it's back to the web service to open a pull request, and the job is done.

In our next installment we'll look at some convenience add-ons to help you integrate Git comfortably into your everyday workflow.

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/7/how-restore-older-file-versions-git

作者：[Seth Kenlon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
