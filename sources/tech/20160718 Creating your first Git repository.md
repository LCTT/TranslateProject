Creating your first Git repository
======================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/open_abstract_pieces.jpg?itok=ZRt0Db00)

Now it is time to learn how to create your own Git repository, and how to add files and make commits.

In the previous installments in this series, you learned how to interact with Git as an end user; you were the aimless wanderer who stumbled upon an open source project's website, cloned a repository, and moved on with your life. You learned that interacting with Git wasn't as confusing as you may have thought it would be, and maybe you've been convinced that it's time to start leveraging Git for your own work.

While Git is definitely the tool of choice for major software projects, it doesn't only work with major software projects. It can manage your grocery lists (if they're that important to you, and they may be!), your configuration files, a journal or diary, a novel in progress, and even source code!

And it is well worth doing; after all, when have you ever been angry that you have a backup copy of something that you've just mangled beyond recognition?

Git can't work for you unless you use it, and there's no time like the present. Or, translated to Git, "There is no push like origin HEAD". You'll understand that later, I promise.

### The audio recording analogy

We tend to speak of computer imaging in terms of snapshots because most of us can identify with the idea of having a photo album filled with particular moments in time. It may be more useful, however, to think of Git more like an analogue audio recording.

A traditional studio tape deck, in case you're unfamiliar, has a few components: it contains the reels that turn either forward or in reverse, tape to preserve sound waves, and a playhead to record or detect sound waves on tape and present them to the listener.

In addition to playing a tape forward, you can rewind it to get back to a previous point in the tape, or fast-forward to skip ahead to a later point.

Imagine a band in the 1970s recording to tape. You can imagine practising a song over and over until all the parts are perfect, and then laying down a track. First, you record the drums, and then the bass, and then the guitar, and then the vocals. Each time you record, the studio engineer rewinds the tape and puts it into loop mode so that it plays the previous part as you play yours; that is, if you're on bass, you get to hear the drums in the background as you play, and then the guitarist hears the drums and bass (and cowbell) and so on. On each loop, you play over the part, and then on the following loop, the engineer hits the record button and lays the performance down on tape.

You can also copy and swap out a reel of tape entirely, should you decide to do a re-mix of something you're working on.

Now that I've hopefully painted a vivid Roger Dean-quality image of studio life in the 70s, let's translate that into Git.

### Create a Git repository

The first step is to go out and buy some tape for our virtual tape deck. In Git terms, that's the repository ; it's the medium or domain where all the work is going to live.

Any directory can become a Git repository, but to begin with let's start a fresh one. It takes three commands:

- Create the directory (you can do that in your GUI file manager, if you prefer).
- Visit that directory in a terminal.
- Initialise it as a directory managed by Git.

Specifically, run these commands:

```
$ mkdir ~/jupiter  # make directory
$ cd ~/jupiter     # change into the new directory
$ git init .       # initialise  your new Git repo
```

Is this example, the folder jupiter is now an empty but valid Git repository.

That's all it takes. You can clone the repository, you can go backward and forward in history (once it has a history), create alternate timelines, and everything else Git can normally do.

Working inside the Git repository is the same as working in any directory; create files, copy files into the directory, save files into it. You can do everything as normal; Git doesn't get involved until you involve it.

In a local Git repository, a file can have one of three states:

- Untracked: a file you create in a repository, but not yet added to Git.
- Tracked: a file that has been added to Git.
- Staged: a tracked file that has been changed and added to Git's commit queue.

Any file that you add to a Git repository starts life out as an untracked file. The file exists on your computer, but you have not told Git about it yet. In our tape deck analogy, the tape deck isn't even turned on yet; the band is just noodling around in the studio, nowhere near ready to record yet.

That is perfectly acceptable, and Git will let you know when it happens:

```
$ echo "hello world" > foo
$ git status
On branch master
Untracked files:
(use "git add <file>..." to include in what will be committed)    
    foo    
nothing added but untracked files present (use "git add" to track)
```

As you can see, Git also tells you how to start tracking files.

### Git without Git

Creating a repository in GitHub or GitLab is a lot more clicky and pointy. It isn't difficult; you click the New Repository button and follow the prompts.

It is a good practice to include a README file so that people wandering by have some notion of what your repository is for, and it is a little more satisfying to clone a non-empty repository.

Cloning the repository is no different than usual, but obtaining permission to write back into that repository on GitHub is slightly more complex, because in order to authenticate to GitHub you must have an SSH key. If you're on Linux, create one with this command:

```
$ ssh-keygen
```

Then copy your new key, which is plain text. You can open it in a plain text editor, or use the cat command:

```
$ cat ~/.ssh/id_rsa.pub
```

Now paste your key into [GitHub's SSH configuration][1],  or your [GitLab configuration][2].

As long as you clone your GitHub project via SSH, you'll be able to write back to your repository.

Alternately, you can use GitHub's file uploader interface to add files without even having Git on your system.

![](https://opensource.com/sites/default/files/2_githubupload.jpg)

### Tracking files

As the output of git status tells you, if you want Git to start tracking a file, you must git add it. The git add action places a file in a special staging area, where files wait to be committed, or preserved for posterity in a snapshot. The point of a git add is to differentiate between files that you want to have included in a snapshot, and the new or temporary files you want Git to, at least for now, ignore.

In our tape deck analogy, this action turns the tape deck on and arms it for recording. You can picture the tape deck with the record and pause button pushed, or in a playback loop awaiting the next track to be laid down.

Once you add a file, Git will identify it as a tracked file:

```
$ git add foo
$ git status
On branch master
Changes to be committed:
(use "git reset HEAD <file>..." to unstage)
new file:   foo
```

Adding a file to Git's tracking system is not making a recording. It just puts a file on the stage in preparation for recording. You can still change a file after you've added it; it's being tracked and remains staged, so you can continue to refine it or change it before committing it to tape (but be warned; you're NOT recording yet, so if you break something in a file that was perfect, there's no going back in time yet, because you never got that perfect moment on tape).

If you decide that the file isn't really ready to be recorded in the annals of Git history, then you can unstage something, just as the Git message described:

```
$ git reset HEAD foo
```

This, in effect, disarms the tape deck from being ready to record, and you're back to just noodling around in the studio.

### The big commit

At some point, you're going to want to commit something; in our tape deck analogy, that means finally pressing record and laying a track down on tape.

At different stages of a project's life, how often you press that record button varies. For example, if you're hacking your way through a new Python toolkit and finally manage to get a window to appear, then you'll certainly want to commit so you have something to fall back on when you inevitably break it later as you try out new display options. But if you're working on a rough draft of some new graphics in Inkscape, you might wait until you have something you want to develop from before committing. Ultimately, though, it's up to you how often you commit; Git doesn't "cost" that much and hard drives these days are big, so in my view, the more the better.

A commit records all staged files in a repository. Git only records files that are tracked, that is, any file that you did a git add on at some point in the past. and that have been modified since the previous commit. If no previous commit exists, then all tracked files are included in the commit because they went from not existing to existing, which is a pretty major modification from Git's point-of-view.

To make a commit, run this command:

```
$ git commit -m 'My great project, first commit.'
```

This preserves all files committed for posterity (or, if you speak Gallifreyan, they become "fixed points in time"). You can see not only the commit event, but also the reference pointer back to that commit in your Git log:

```
$ git log --oneline
55df4c2 My great project, first commit.
```

For a more detailed report, just use git log without the --oneline option.

The reference number for the commit in this example is 55df4c2. It's called a commit hash and it represents all of the new material you just recorded, overlaid onto previous recordings. If you need to "rewind" back to that point in history, you can use that hash as a reference.

You can think of a commit hash as [SMPTE timecode][3] on an audio tape, or if we bend the analogy a little, one of those big gaps between songs on a vinyl record, or track numbers on a CD.

As you change files further and add them to the stage, and ultimately commit them, you accrue new commit hashes, each of which serve as pointers to different versions of your production.

And that's why they call Git a version control system, Charlie Brown.

In the next article, we'll explore everything you need to know about the Git HEAD, and we'll nonchalantly reveal the secret of time travel. No big deal, but you'll want to read it (or maybe you already have?).



--------------------------------------------------------------------------------

via: https://opensource.com/life/16/7/creating-your-first-git-repository

作者：[Seth Kenlon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[1]: https://github.com/settings/keys
[2]: https://gitlab.com/profile/keys
[3]: http://slackermedia.ml/handbook/doku.php?id=timecode
