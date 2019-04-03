[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Easy means easy to debug)
[#]: via: (https://arp242.net/weblog/easy.html)
[#]: author: (Martin Tournoij https://arp242.net/)


What does it mean for a framework, library, or tool to be “easy”? There are many possible definitions one could use, but my definition is usually that it’s easy to debug. I often see people advertise a particular program, framework, library, file format, or something else as easy because “look with how little effort I can do task X, this is so easy!” That’s great, but an incomplete picture.

You only write software once, but will almost always go through several debugging cycles. With debugging cycle I don’t mean “there is a bug in the code you need to fix”, but rather “I need to look at this code to fix the bug”. To debug code, you need to understand it, so “easy to debug” by extension means “easy to understand”.

Abstractions which make something easier to write often come at the cost of make things harder to understand. Sometimes this is a good trade-off, but often it’s not. In general I will happily spend a little but more effort writing something now if that makes things easier to understand and debug later on, as it’s often a net time-saver.

Simplicity isn’t the only thing that makes programs easier to debug, but it is probably the most important. Good documentation helps too, but unfortunately good documentation is uncommon (note that quality is not measured by word count!)

This is not exactly a novel insight; from the 1974 The Elements of Programming Style by Brian W. Kernighan and P. J. Plauger:

> Everyone knows that debugging is twice as hard as writing a program in the first place. So if you’re as clever as you can be when you write it, how will you ever debug it?

A lot of stuff I see seems to be written “as clever as can be” and is consequently hard to debug. I’ll list a few examples of this pattern below. It’s not my intention to argue that any of these things are bad per se, I just want to highlight the trade-offs in “easy to use” vs. “easy to debug”.

  * When I tried running [Let’s Encrypt][1] a few years ago it required running a daemon as root(!) to automatically rewrite nginx files. I looked at the source a bit to understand how it worked and it was all pretty complex, so I was “let’s not” and opted to just pay €10 to the CA mafia, as not much can go wrong with putting a file in /etc/nginx/, whereas a lot can go wrong with complex Python daemons running as root.

(I don’t know the current state/options for Let’s Encrypt; at a quick glance there may be better/alternative ACME clients that suck less now.)

  * Some people claim that systemd is easier than SysV init.d scripts because it’s easier to write systemd unit files than it is to write shell scripts. In particular, this is the argument Lennart Poettering used in his [systemd myths][2] post (point 5).

I think is completely missing the point. I agree with Poettering that shell scripts are hard – [I wrote an entire post about that][3] – but by making the interface easier doesn’t mean the entire system becomes easier. Look at [this issue][4] I encountered and [the fix][5] for it. Does that look easy to you?

  * Many JavaScript frameworks I’ve used can be hard to fully understand. Clever state keeping logic is great and all, until that state won’t work as you expect, and then you better hope there’s a Stack Overflow post or GitHub issue to help you out.

  * Docker is great, right up to the point you get:

```
 ERROR: for elasticsearch Cannot start service elasticsearch:
oci runtime error: container_linux.go:247: starting container process caused "process_linux.go:258:
applying cgroup configuration for process caused \"failed to write 898 to cgroup.procs: write
/sys/fs/cgroup/cpu,cpuacct/docker/b13312efc203e518e3864fc3f9d00b4561168ebd4d9aad590cc56da610b8dd0e/cgroup.procs:
invalid argument\""
```

or

```
ERROR: for elasticsearch Cannot start service elasticsearch: EOF
```

And … now what?

  * Many testing libraries can make things harder to debug. Ruby’s rspec is a good example where I’ve occasionally used the library wrong by accident and had to spend quite a long time figuring out what exactly went wrong (as the errors it gave me were very confusing!)

I wrote a bit more about that in my [Testing isn’t everything][6] post.

  * ORM libraries can make database queries a lot easier, at the cost of making things a lot harder to understand once you want to solve a problem.





--------------------------------------------------------------------------------

via: https://arp242.net/weblog/easy.html

作者：[Martin Tournoij][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://arp242.net/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Let%27s_Encrypt
[2]: http://0pointer.de/blog/projects/the-biggest-myths.html
[3]: https://arp242.net/weblog/shell-scripting-trap.html
[4]: https://unix.stackexchange.com/q/185495/33645
[5]: https://cgit.freedesktop.org/systemd/systemd/commit/?id=6e392c9c45643d106673c6643ac8bf4e65da13c1
[6]: /weblog/testing.html
[7]: mailto:martin@arp242.net
[8]: https://github.com/Carpetsmoker/arp242.net/issues/new
