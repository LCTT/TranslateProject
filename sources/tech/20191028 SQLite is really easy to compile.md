[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (SQLite is really easy to compile)
[#]: via: (https://jvns.ca/blog/2019/10/28/sqlite-is-really-easy-to-compile/)
[#]: author: (Julia Evans https://jvns.ca/)

SQLite is really easy to compile
======

In the last week I’ve been working on another SQL website (<https://sql-steps.wizardzines.com/>, a list of SQL examples). I’m running all the queries on that site with sqlite, and I wanted to use window functions in one of the examples ([this one][1]).

But I’m using the version of sqlite from Ubuntu 18.04, and that version is too old and doesn’t support window functions. So I needed to upgrade sqlite!

This turned to out be surprisingly annoying (as usual), but in a pretty interesting way! I was reminded of some things about how executables and shared libraries work and it had a very satisfying conclusion. So I wanted to write it up here.

(spoiler: the summary is that <https://www.sqlite.org/howtocompile.html> explains how to compile SQLite and it takes like 5 seconds to do and it’s 20x easier than my usual experiences compiling software from source)

### attempt 1: download a SQLite binary from their website

The [SQLite download page][2] has a link to a Linux binary for the SQLite command line tool. I downloaded it, it worked on my laptop, and I thought I was done.

But then I tried to run it on a build server I was using (Netlify), and I got this extremely strange error message: “File not found”. I straced it, and sure enough `execve` was returning the error code ENOENT, which means “File not found”. This was kind of maddening because the file was DEFINITELY there and it had the correct permissions and everything.

I googled this problem (by searching “execve enoent”), found [this stack overflow answer][3], which pointed out that to run a binary, you don’t just need the binary to exist! You also need its **loader** to exist. (the path to the loader is inside the binary)

To see the path for the loader you can use `ldd`, like this:

```
$ ldd sqlite3
    linux-gate.so.1 (0xf7f9d000)
    libdl.so.2 => /lib/i386-linux-gnu/libdl.so.2 (0xf7f70000)
    libm.so.6 => /lib/i386-linux-gnu/libm.so.6 (0xf7e6e000)
    libz.so.1 => /lib/i386-linux-gnu/libz.so.1 (0xf7e4f000)
    libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xf7c73000)
    /lib/ld-linux.so.2
```

So `/lib/ld-linux.so.2` is the loader,and that file doesn’t exist on the build server, probably because that Xenial installation didn’t have support for 32-bit binaries (?), and I needed to try something different.

### attempt 2: install the Debian sqlite3 package

Okay, I thought, maybe I can install the [sqlite package from debian testing][4]. Trying to install a package from a different Debian version that I’m not using is literally never a good idea, but for some reason I decided to try it anyway.

Doing this completely unsurprisingly broke the sqlite installation on my computer (which also broke git), but I managed to recover from that with a bunch of `sudo dpkg --purge --force-all libsqlite3-0` and make everything that depended on sqlite work again.

### attempt 3: extract the Debian sqlite3 package

I also briefly tried to just extract the sqlite3 binary from the Debian sqlite package and run it. Unsurprisingly, this also didn’t work, but in a more understandable way: I had an older version of libreadline (.so.7) and it wanted .so.8.

```
$ ./usr/bin/sqlite3
./usr/bin/sqlite3: error while loading shared libraries: libreadline.so.8: cannot open shared object file: No such file or directory
```

### attempt 4: compile it from source

The whole reason I spent all this time trying to download sqlite binaries is that I assumed it would be annoying or time consuming to compile sqlite from source. But obviously downloading random sqlite binaries was not working for me at all, so I finally decided to try to compile it myself.

Here are the directions: [How to compile SQLite][5]. And they’re the EASIEST THING IN THE UNIVERSE. Often compiling things feels like this:

  * run `./configure`
  * realize i’m missing a dependency
  * run `./configure` again
  * run `make`
  * the compiler fails because actually i have the wrong version of some dependency
  * go do something else and try to find a binary



Compiling SQLite works like this:

  * download an [amalgamation tarball from the download page][2]
  * run `gcc shell.c sqlite3.c -lpthread -ldl`
  * that’s it!!!



All the code is in one file (`sqlite.c`), and there are no weird dependencies! It’s amazing.

For my specific use case I didn’t actually need threading support or readline support or anything, so I used the instructions on the compile page to create a very simple binary that only used libc and no other shared libraries.

```
$ ldd sqlite3
    linux-vdso.so.1 (0x00007ffe8e7e9000)
    libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fbea4988000)
    /lib64/ld-linux-x86-64.so.2 (0x00007fbea4d79000)
```

### this is nice because it makes it easy to experiment with sqlite

I think it’s cool that SQLite’s build process is so simple because in the past I’ve had fun [editing sqlite’s source code][6] to understand how its btree implementation works.

This isn’t really super surprising given what I know about SQLite (it’s made to work really well in restricted / embedded contexts, so it makes sense that it would be possible to compile it in a really simple/minimal way). But it is super nice!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2019/10/28/sqlite-is-really-easy-to-compile/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://sql-steps.wizardzines.com/lag.html
[2]: https://www.sqlite.org/download.html
[3]: https://stackoverflow.com/questions/5234088/execve-file-not-found-when-stracing-the-very-same-file
[4]: https://packages.debian.org/bullseye/amd64/sqlite3/download
[5]: https://www.sqlite.org/howtocompile.html
[6]: https://jvns.ca/blog/2014/10/02/how-does-sqlite-work-part-2-btrees/
