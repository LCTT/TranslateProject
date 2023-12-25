[#]: subject: "Mounting git commits as folders with NFS"
[#]: via: "https://jvns.ca/blog/2023/12/04/mounting-git-commits-as-folders-with-nfs/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "guevaraya"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Mounting git commits as folders with NFS
======

Hello! The other day, I started wondering – has anyone ever made a FUSE filesystem for a git repository where all every commit is a folder? It turns out the answer is yes! There’s [giblefs][1], [GitMounter][2], and [git9][3] for Plan 9.

But FUSE is pretty annoying to use on Mac – you need to install a kernel extension, and Mac OS seems to be making it harder and harder to install kernel extensions for security reasons. Also I had a few ideas for how to organize the filesystem differently than those projects.

So I thought it would be fun to experiment with ways to mount filesystems on Mac OS other than FUSE, so I built a project that does that called [git-commit-folders][4]. It works (at least on my computer) with both FUSE and NFS, and there’s a broken WebDav implementation too.

It’s pretty experimental (I’m not sure if this is actually a useful piece of software to have or just a fun toy to think about how git works) but it was fun to write and I’ve enjoyed using it myself on small repositories so here are some of the problems I ran into while writing it.

### goal: show how commits are like folders

The main reason I wanted to make this was to give folks some intuition for how git works under the hood. After all, git commits really _are_ very similar to folders – every Git commit [contains a directory listing][5] of the files in it, and that directory can have subdirectories, etc.

It’s just that git commits aren’t _actually_ implemented as folders to save disk space.

So in `git-commit-folders`, every commit is actually a folder, and if you want to explore your old commits, you can do it just by exploring the filesystem! For example, if I look at the initial commit for my blog, it looks like this:

```

    $ ls commits/8d/8dc0/8dc0cb0b4b0de3c6f40674198cb2bd44aeee9b86/
    README

```

and a few commits later, it looks like this:

```

    $ ls /tmp/git-homepage/commits/c9/c94e/c94e6f531d02e658d96a3b6255bbf424367765e9/
    _config.yml  config.rb  Rakefile  rubypants.rb  source

```

### branches are symlinks

In the filesystem mounted by `git-commit-folders`, commits are the only real folders – everything else (branches, tags, etc) is a symlink to a commit. This mirrors how git works under the hood.

```

    $ ls -l branches/
    lr-xr-xr-x 59 bork bazil-fuse -> ../commits/ff/ff56/ff563b089f9d952cd21ac4d68d8f13c94183dcd8
    lr-xr-xr-x 59 bork follow-symlink -> ../commits/7f/7f73/7f73779a8ff79a2a1e21553c6c9cd5d195f33030
    lr-xr-xr-x 59 bork go-mod-branch -> ../commits/91/912d/912da3150d9cfa74523b42fae028bbb320b6804f
    lr-xr-xr-x 59 bork mac-version -> ../commits/30/3008/30082dcd702b59435f71969cf453828f60753e67
    lr-xr-xr-x 59 bork mac-version-debugging -> ../commits/18/18c0/18c0db074ec9b70cb7a28ad9d3f9850082129ce0
    lr-xr-xr-x 59 bork main -> ../commits/04/043e/043e90debbeb0fc6b4e28cf8776e874aa5b6e673
    $ ls -l tags/
    lr-xr-xr-x - bork 31 Dec  1969 test-tag -> ../commits/16/16a3/16a3d776dc163aa8286fb89fde51183ed90c71d0

```

This definitely doesn’t completely explain how git works (there’s a lot more to it than just “a commit is like a folder!”), but my hope is that it makes thie idea that every commit is like a folder with an old version of your code” feel a little more concrete.

### why might this be useful?

Before I get into the implementation, I want to talk about why having a filesystem with a folder for every git commit in it might be useful. A lot of my projects I end up never really using at all (like [dnspeep][6]) but I did find myself using this project a little bit while I was working on it.

The main uses I’ve found so far are:

  * searching for a function I deleted – I can run `grep someFunction branch_histories/main/*/commit.go` to find an old version of it
  * quickly looking at a file on another branch to copy a line from it, like `vim branches/other-branch/go.mod`
  * searching every branch for a function, like `grep someFunction branches/*/commit.go`



All of these are through symlinks to commits instead of referencing commits directly.

None of these are the most efficient way to do this (you can use `git show` and `git log -S` or maybe `git grep` to accomplish something similar), but personally I always forget the syntax and navigating a filesystem feels easier to me. `git worktree` also lets you have multiple branches checked out at the same time, but to me it feels weird to set up an entire worktree just to look at 1 file.

Next I want to talk about some problems I ran into.

### problem 1: webdav or NFS?

The two filesystems I could that were natively supported by Mac OS were WebDav and NFS. I couldn’t tell which would be easier to implement so I just tried both.

At first webdav seemed easier and it turns out that golang.org/x/net has a [webdav implementation][7], which was pretty easy to set up.

But that implementation doesn’t support symlinks, I think because it uses the `io/fs` interface and `io/fs` doesn’t [support symlinks yet][8]. Looks like that’s in progress though. So I gave up on webdav and decided to focus on the NFS implementation, using this [go-nfs][9] NFSv3 library.

Someone also mentioned that there’s [FileProvider][10] on Mac but I didn’t look into that.

### problem 2: how to keep all the implementations in sync?

I was implementing 3 different filesystems (FUSE, NFS, and WebDav), and it wasn’t clear to me how to avoid a lot of duplicated code.

My friend Dave suggested writing one core implementation and then writing adapters (like `fuse2nfs` and `fuse2dav`) to translate it into the NFS and WebDav verions. What this looked like in practice is that I needed to implement 3 filesystem interfaces:

  * `fs.FS` for FUSE
  * `billy.Filesystem` for NFS
  * `webdav.Filesystem` for webdav



So I put all the core logic in the `fs.FS` interface, and then wrote two functions:

  * `func Fuse2Dav(fs fs.FS) webdav.FileSystem`
  * `func Fuse2NFS(fs fs.FS) billy.Filesystem`



All of the filesystems were kind of similar so the translation wasn’t too hard, there were just 1 million annoying bugs to fix.

### problem 3: I didn’t want to list every commit

Some git repositories have thousands or millions of commits. My first idea for how to address this was to make `commits/` appear empty, so that it works like this:

```

    $ ls commits/
    $ ls commits/80210c25a86f75440110e4bc280e388b2c098fbd/
    fuse  fuse2nfs  go.mod  go.sum  main.go  README.md

```

So every commit would be available if you reference it directly, but you can’t list them. This is a weird thing for a filesystem to do but it actually works fine in FUSE. I couldn’t get it to work in NFS though. I assume what’s going on here is that if you tell NFS that a directory is empty, it’ll interpret that the directory is actually empty, which is fair.

I ended up handling this by:

  * organizing the commits by their 2-character prefix the way `.git/objects` does (so that `ls commits` shows `0b 03 05 06 07 09 1b 1e 3e 4a`), but doing 2 levels of this so that a `18d46e76d7c2eedd8577fae67e3f1d4db25018b0` is at `commits/18/18df/18d46e76d7c2eedd8577fae67e3f1d4db25018b0`
  * listing all the packed commits hashes only once at the beginning, caching them in memory, and then only updating the loose objects afterwards. The idea is that almost all of the commits in the repo should be packed and git doesn’t repack its commits very often.



This seems to work okay on the Linux kernel which has ~1 million commits. It takes maybe a minute to do the initial load on my machine and then after that it just needs to do fast incremental updates.

Each commit hash is only 20 bytes so caching 1 million commit hashes isn’t a big deal, it’s just 20MB.

I think a smarter way to do this would be to load the commit listings lazily – Git sorts its packfiles by commit ID, so you can pretty easily do a binary search to find all commits starting with `1b` or `1b8c`. The [git library][11] I was using doesn’t have great support for this though, because listing all commits in a Git repository is a really weird thing to do. I spent maybe a couple of days [trying to implement it][12] but I didn’t manage to get the performance I wanted so I gave up.

### problem 4: “not a directory”

I kept getting this error:

```

    "/tmp/mnt2/commits/59/59167d7d09fd7a1d64aa1d5be73bc484f6621894/": Not a directory (os error 20)

```

This really threw me off at first but it turns out that this just means that there was an error while listing the directory, and the way the NFS library handles that error is with “Not a directory”. This happened a bunch of times and I just needed to track the bug down every time.

There were a lot of weird errors like this. I also got `cd: system call interrupted` which was pretty upsetting but ultimately was just some other bug in my program.

Eventually I realized that I could use Wireshark to look at all the NFS packets being sent back and forth, which made some of this stuff easier to debug.

### problem 5: inode numbers

At first I was accidentally setting all my directory inode numbers to 0. This was bad because if if you run `find` on a directory where the inode number of every directory is 0, it’ll complain about filesystem loops and give up, which is very fair.

I fixed this by defining an `inode(string)` function which hashed a string to get the inode number, and using the tree ID / blob ID as the string to hash.

### problem 6: stale file handles

I kept getting this “Stale NFS file handle” error. The problem is that I need to be able to take an opaque 64-byte NFS “file handle” and map it to the right directory.

The way the NFS library I’m using works is that it generates a file handle for every file and caches those references with a fixed size cache. This works fine for small repositories, but if there are too many files then it’ll overflow the cache and you’ll start getting stale file handle errors.

This is still a problem and I’m not sure how to fix it. I don’t understand how real NFS servers do this, maybe they just have a really big cache?

The NFS file handle is 64 bytes (64 bytes! not bits!) which is pretty big, so it does seem like you could just encode the entire file path in the handle a lot of the time and not cache it at all. Maybe I’ll try to implement that at some point.

### problem 7: branch histories

The `branch_histories/` directory only lists the latest 100 commits for each branch right now. Not sure what the right move is there – it would be nice to be able to list the full history of the branch somehow. Maybe I could use a similar subfolder trick to the `commits/` directory.

### problem 8: submodules

Git repositories sometimes have submodules. I don’t understand anything about submodules so right now I’m just ignoring them. So that’s a bug.

### problem 9: is NFSv4 better?

I built this with NFSv3 because the only Go library I could find at the time was an NFSv3 library. After I was done I discovered that the buildbarn project has an [NFSv4 server][13] in it. Would it be better to use that?

I don’t know if this is actually a problem or how big of an advantage it would be to use NFSv4. I’m also a little unsure about using the buildbarn NFS library because it’s not clear if they expect other people to use it or not.

### that’s all!

There are probably more problems I forgot but that’s all I can think of for now. I may or may not fix the NFS stale file handle problem or the “it takes 1 minute to start up on the linux kernel” problem, who knows!

Thanks to my friend [vasi][14] who explained one million things about filesystems to me.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2023/12/04/mounting-git-commits-as-folders-with-nfs/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://github.com/fanzeyi/giblefs
[2]: https://belkadan.com/blog/2023/11/GitMounter/
[3]: https://orib.dev/git9.html
[4]: https://github.com/jvns/git-commit-folders
[5]: https://jvns.ca/blog/2023/09/14/in-a-git-repository--where-do-your-files-live-/#commit-step-2-look-at-the-tree
[6]: https://github.com/jvns/dnspeep
[7]: https://pkg.go.dev/golang.org/x/net/webdav
[8]: https://github.com/golang/go/issues/49580
[9]: https://github.com/willscott/go-nfs/
[10]: https://developer.apple.com/documentation/fileprovider/
[11]: https://github.com/go-git/go-git
[12]: https://github.com/jvns/git-commit-folders/tree/fast-commits
[13]: https://github.com/buildbarn/bb-adrs/blob/master/0009-nfsv4.md
[14]: https://github.com/vasi
