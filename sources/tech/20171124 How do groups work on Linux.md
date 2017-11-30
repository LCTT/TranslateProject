HankChow Translating

How do groups work on Linux?
============================================================

Hello! Last week, I thought I knew how users and groups worked on Linux. Here is what I thought:

1.  Every process belongs to a user (like `julia`)

2.  When a process tries to read a file owned by a group, Linux a) checks if the user `julia` can access the file, and b) checks which groups `julia` belongs to, and whether any of those groups owns & can access that file

3.  If either of those is true (or if the ‘any’ bits are set right) then the process can access the file

So, for example, if a process is owned by the `julia` user and `julia` is in the `awesome` group, then the process would be allowed to read this file.

```
r--r--r-- 1 root awesome     6872 Sep 24 11:09 file.txt

```

I had not thought carefully about this, but if pressed I would have said that it probably checks the `/etc/group` file at runtime to see what groups you’re in.

### that is not how groups work

I found out at work last week that, no, what I describe above is not how groups work. In particular Linux does **not** check which groups a process’s user belongs to every time that process tries to access a file.

Here is how groups actually work! I learned this by reading Chapter 9 (“Process Credentials”) of [The Linux Programming Interface][1] which is an incredible book. As soon as I realized that I did not understand how users and groups worked, I opened up the table of contents with absolute confidence that it would tell me what’s up, and I was right.

### how users and groups checks are done

They key new insight for me was pretty simple! The chapter starts out by saying that user and group IDs are **attributes of the process**:

*   real user ID and group ID;

*   effective user ID and group ID;

*   saved set-user-ID and saved set-group-ID;

*   file-system user ID and group ID (Linux-specific); and

*   supplementary group IDs.

This means that the way Linux **actually** does group checks to see a process can read a file is:

*   look at the process’s group IDs & supplementary group IDs (from the attributes on the process, **not** by looking them up in `/etc/group`)

*   look at the group on the file

*   see if they match

Generally when doing access control checks it uses the **effective** user/group ID, not the real user/group ID. Technically when accessing a file it actually uses the **file-system** ids but those are usually the same as the effective uid/gid.

### Adding a user to a group doesn’t put existing processes in that group

Here’s another fun example that follows from this: if I create a new `panda` group and add myself (bork) to it, then run `groups` to check my group memberships – I’m not in the panda group!

```
bork@kiwi~> sudo addgroup panda
Adding group `panda' (GID 1001) ...
Done.
bork@kiwi~> sudo adduser bork panda
Adding user `bork' to group `panda' ...
Adding user bork to group panda
Done.
bork@kiwi~> groups
bork adm cdrom sudo dip plugdev lpadmin sambashare docker lxd

```

no `panda` in that list! To double check, let’s try making a file owned by the `panda`group and see if I can access it:

```
$  touch panda-file.txt
$  sudo chown root:panda panda-file.txt
$  sudo chmod 660 panda-file.txt
$  cat panda-file.txt
cat: panda-file.txt: Permission denied

```

Sure enough, I can’t access `panda-file.txt`. No big surprise there. My shell didn’t have the `panda` group as a supplementary GID before, and running `adduser bork panda` didn’t do anything to change that.

### how do you get your groups in the first place?

So this raises kind of a confusing question, right – if processes have groups baked into them, how do you get assigned your groups in the first place? Obviously you can’t assign yourself more groups (that would defeat the purpose of access control).

It’s relatively clear how processes I **execute** from my shell (bash/fish) get their groups – my shell runs as me, and it has a bunch of group IDs on it. Processes I execute from my shell are forked from the shell so they get the same groups as the shell had.

So there needs to be some “first” process that has your groups set on it, and all the other processes you set inherit their groups from that. That process is called your **login shell** and it’s run by the `login` program (`/bin/login`) on my laptop. `login` runs as root and calls a C function called `initgroups` to set up your groups (by reading `/etc/group`). It’s allowed to set up your groups because it runs as root.

### let’s try logging in again!

So! Let’s say I am running in a shell, and I want to refresh my groups! From what we’ve learned about how groups are initialized, I should be able to run `login` to refresh my groups and start a new login shell!

Let’s try it:

```
$ sudo login bork
$ groups
bork adm cdrom sudo dip plugdev lpadmin sambashare docker lxd panda
$ cat panda-file.txt # it works! I can access the file owned by `panda` now!

```

Sure enough, it works! Now the new shell that `login` spawned is part of the `panda` group! Awesome! This won’t affect any other shells I already have running. If I really want the new `panda` group everywhere, I need to restart my login session completely, which means quitting my window manager and logging in again.

### newgrp

Somebody on Twitter told me that if you want to start a new shell with a new group that you’ve been added to, you can use `newgrp`. Like this:

```
sudo addgroup panda
sudo adduser bork panda
newgrp panda # starts a new shell, and you don't have to be root to run it!

```

You can accomplish the same(ish) thing with `sg panda bash` which will start a `bash` shell that runs with the `panda` group.

### setuid sets the effective user ID

I’ve also always been a little vague about what it means for a process to run as “setuid root”. It turns out that setuid sets the effective user ID! So if I (`julia`) run a setuid root process (like `passwd`), then the **real** user ID will be set to `julia`, and the **effective** user ID will be set to `root`.

`passwd` needs to run as root, but it can look at its real user ID to see that `julia`started the process, and prevent `julia` from editing any passwords except for `julia`’s password.

### that’s all!

There are a bunch more details about all the edge cases and exactly how everything works in The Linux Programming Interface so I will not get into all the details here. That book is amazing. Everything I talked about in this post is from Chapter 9, which is a 17-page chapter inside a 1300-page book.

The thing I love most about that book is that reading 17 pages about how users and groups work is really approachable, self-contained, super useful, and I don’t have to tackle all 1300 pages of it at once to learn helpful things :)

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2017/11/20/groups/

作者：[Julia Evans ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca/
[1]:http://man7.org/tlpi/
