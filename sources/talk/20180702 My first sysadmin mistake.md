My first sysadmin mistake
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_mistakes.png?itok=dN0OoIl5)

If you work in IT, you know that things never go completely as you think they will. At some point, you'll hit an error or something will go wrong, and you'll end up having to fix things. That's the job of a systems administrator.

As humans, we all make mistakes. Sometimes, we are the error in the process, or we are what went wrong. As a result, we end up having to fix our own mistakes. That happens. We all make mistakes, typos, or errors.

As a young systems administrator, I learned this lesson the hard way. I made a huge blunder. But thanks to some coaching from my supervisor, I learned not to dwell on my errors, but to create a "mistake strategy" to set things right. Learn from your mistakes. Get over it, and move on.

My first job was a Unix systems administrator for a small company. Really, I was a junior sysadmin, but I worked alone most of the time. We were a small IT team, just the three of us. I was the only sysadmin for 20 or 30 Unix workstations and servers. The other two supported the Windows servers and desktops.

Any systems administrators reading this probably won't be surprised to know that, as an unseasoned, junior sysadmin, I eventually ran the `rm` command in the wrong directory. As root. I thought I was deleting some stale cache files for one of our programs. Instead, I wiped out all files in the `/etc` directory by mistake. Ouch.

My clue that I'd done something wrong was an error message that `rm` couldn't delete certain subdirectories. But the cache directory should contain only files! I immediately stopped the `rm` command and looked at what I'd done. And then I panicked. All at once, a million thoughts ran through my head. Did I just destroy an important server? What was going to happen to the system? Would I get fired?

Fortunately, I'd run `rm *` and not `rm -rf *` so I'd deleted only files. The subdirectories were still there. But that didn't make me feel any better.

Immediately, I went to my supervisor and told her what I'd done. She saw that I felt really dumb about my mistake, but I owned it. Despite the urgency, she took a few minutes to do some coaching with me. "You're not the first person to do this," she said. "What would someone else do in your situation?" That helped me calm down and focus. I started to think less about the stupid thing I had just done, and more about what I was going to do next.

I put together a simple strategy: Don't reboot the server. Use an identical system as a template, and re-create the `/etc` directory.

Once I had my plan of action, the rest was easy. It was just a matter of running the right commands to copy the `/etc` files from another server and edit the configuration so it matched the system. Thanks to my practice of documenting everything, I used my existing documentation to make any final adjustments. I avoided having to completely restore the server, which would have meant a huge disruption.

To be sure, I learned from that mistake. For the rest of my years as a systems administrator, I always confirmed what directory I was in before running any command.

I also learned the value of building a "mistake strategy." When things go wrong, it's natural to panic and think about all the bad things that might happen next. That's human nature. But creating a "mistake strategy" helps me stop worrying about what just went wrong and focus on making things better. I may still think about it, but knowing my next steps allows me to "get over it."


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/my-first-sysadmin-mistake

作者：[Jim Hall][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jim-hall
