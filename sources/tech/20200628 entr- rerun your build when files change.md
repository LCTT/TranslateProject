[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (entr: rerun your build when files change)
[#]: via: (https://jvns.ca/blog/2020/06/28/entr/)
[#]: author: (Julia Evans https://jvns.ca/)

entr: rerun your build when files change
======

This is going to be a pretty quick post – I found out about [`entr`][1] relatively recently and I felt like WHY DID NOBODY TELL ME ABOUT THIS BEFORE?!?! So I’m telling you about it in case you’re in the same boat as I was.

There’s a great explanation of the tool with lots of examples on [entr’s website][1].

The summary is in the headline: `entr` is a command line tool that lets you run a arbitrary command every time you change any of a set of specified files. You pass it the list of files to watch on stdin, like this:

```
git ls-files | entr bash my-build-script.sh
```

or

```
find . -name *.rs | entr cargo test
```

or whatever you want really.

### quick feedback is amazing

Like possibly every single programmer in the universe, I find it Very Annoying to have to manually rerun my build / tests every time I make a change to my code.

A lot of tools (like hugo and flask) have a built in system to automatically rebuild when you change your files, which is great!

But often I have some hacked together custom build process that I wrote myself (like `bash build.sh`), and `entr` lets me have a magical build experience where I get instant feedback on whether my change fixed the weird bug with just one line of bash. Hooray!

### restart a server (`entr -r`)

Okay, but what if you’re running a server, and the server needs to be restarted every time you? entr’s got you – if you pass `-r`, then

```
git ls-files | entr -r python my-server.py
```

### clear the screen (`entr -c`)

Another neat flag is `-c`, which lets you clear the screen before rerunning the command, so that you don’t get distracted/confused by the previous build’s output.

### use it with `git ls-files`

Usually the set of files I want to track is about the same list of files I have in git, so `git ls-files` is a natural thing to pipe to `entr`.

I have a project right now where sometimes I have files that I’ve just created that aren’t in git just yet. So what if you want to include untracked files? Here’s a little bash incantation I put together that does this:

```
{ git ls-files; git ls-files . --exclude-standard --others; } | entr your-build-scriot
```

There’s probably a way to do this with just one git command but I don’t know what it is.

### restart every time a new file is added: `entr -d`

The other problem with this `git ls-files` thing is that sometimes I add a new file, and of course it’s not in git yet. entr has a nice feature for this – if you pass `-d`, then if you add a new file in any of the directories entr is tracking, then it’ll exit.

I’m using this paired with a little while loop that will restart `entr` to include the new files, like this:

```
while true
do
{ git ls-files; git ls-files . --exclude-standard --others; } | entr -d your-build-scriot
done
```

### how entr works on Linux: inotify

On Linux, entr works using `inotify` (a system for tracking filesystem events like file changes) – if you strace it, you’ll see an `inotify_add_watch` system call for each file you ask it to watch, like this:

```
inotify_add_watch(3, "static/stylesheets/screen.css", IN_ATTRIB|IN_CLOSE_WRITE|IN_CREATE|IN_DELETE_SELF|IN_MOVE_SELF) = 1152
```

### that’s all!

I hope this helps a few people learn about `entr`!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/06/28/entr/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: http://eradman.com/entrproject/
