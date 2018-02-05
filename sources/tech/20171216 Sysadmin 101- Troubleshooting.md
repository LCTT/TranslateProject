translating by lujun9972
Sysadmin 101: Troubleshooting
======
I typically keep this blog strictly technical, keeping observations, opinions and the like to a minimum. But this, and the next few posts will be about basics and fundamentals for starting out in system administration/SRE/system engineer/sysops/devops-ops (whatever you want to call yourself) roles more generally.
Bear with me!

"My web site is slow"

I just picked the type of issue for this article at random, this can be applied to pretty much any sysadmin related troubleshooting. It's not about showing off the cleverest oneliners to find the most information. It's also not an exhaustive, step-by-step "flowchart" with the word "profit" in the last box. It's about general approach, by means of a few examples.
The example scenarios are solely for illustrative purposes. They sometimes have a basis in assumptions that doesn't apply to all cases all of the time, and I'm positive many readers will go "oh, but I think you will find…" at some point.
But that would be missing the point.

Having worked in support, or within a support organization for over a decade, there is one thing that strikes me time and time again and that made me write this;
**The instinctive reaction many techs have when facing a problem, is to start throwing potential solutions at it.**

"My website is slow"

  * I'm going to try upping `MaxClients/MaxRequestWorkers/worker_connections`
  * I'm going to try to increase `innodb_buffer_pool_size/effective_cache_size`
  * I'm going to try to enable `mod_gzip` (true story, sadly)



"I saw this issue once, and then it was because X. So I'm going to try to fix X again, it might work".

This wastes a lot of time, and leads you down a wild goose chase. In the dark. Wearing greased mittens.
InnoDB's buffer pool may well be at 100% utilization, but that's just because there are remnants of a large one-off report someone ran a while back in there. If there are no evictions, you've just wasted time.

### Quick side-bar before we start

At this point, I should mention that while it's equally applicable to many roles, I'm writing this from a general support system adminstrator's point of view. In a mature, in-house organization or when working with larger, fully managed or "enterprise" customers, you'll typically have everything instrumented, measured, graphed, thresheld (not even word) and alerted on. Then your approach will often be rather different. We're going in blind here.

If you don't have that sort of thing at your disposal;

### Clarify and First look

Establish what the issue actually is. "Slow" can take many forms. Is it time to first byte? That's a whole different class of problem from poor Javascript loading and pulling down 15 MB of static assets on each page load. Is it slow, or just slower than it usually is? Two very different plans of attack!

Make sure you know what the issue reported/experienced actually is before you go off and do something. Finding the source of the problem is often difficult enough, without also having to find the problem itself.
That is the sysadmin equivalent of bringing a knife to a gunfight.

### Low hanging fruit / gimmies

You are allowed to look for a few usual suspects when you first log in to a suspect server. In fact, you should! I tend to fire off a smattering of commands whenever I log in to a server to just very quickly check a few things; Are we swapping (`free/vmstat`), are the disks busy (`top/iostat/iotop`), are we dropping packets (`netstat/proc/net/dev`), is there an undue amount of connections in an undue state (`netstat`), is something hogging the CPUs (`top`), is someone else on this server (`w/who`), any eye-catching messages in syslog and `dmesg`?

There's little point to carrying on if you have 2000 messages from your RAID controller about how unhappy it is with its write-through cache.

This doesn't have to take more than half a minute. If nothing catches your eye - continue.

### Reproduce

If there indeed is a problem somewhere, and there's no low hanging fruit to be found;

Take all steps you can to try and reproduce the problem. When you can reproduce, you can observe. **When you can observe, you can solve.** Ask the person reporting the issue what exact steps to take to reproduce the issue if it isn 't already obvious or covered by the first section.

Now, for issues caused by solar flares and clients running exclusively on OS/2, it's not always feasible to reproduce. But your first port of call should be to at least try! In the very beginning, all you know is "X thinks their website is slow". For all you know at that point, they could be tethered to their GPRS mobile phone and applying Windows updates. Delving any deeper than we already have at that point is, again, a waste of time.

Attempt to reproduce!

### Check the log!

It saddens me that I felt the need to include this. But I've seen escalations that ended mere minutes after someone ran `tail /var/log/..` Most *NIX tools these days are pretty good at logging. Anything blatantly wrong will manifest itself quite prominently in most application logs. Check it.

### Narrow down

If there are no obvious issues, but you can reproduce the reported problem, great. So, you know the website is slow. Now you've narrowed things down to: Browser rendering/bug, application code, DNS infrastructure, router, firewall, NICs (all eight+ involved), ethernet cables, load balancer, database, caching layer, session storage, web server software, application server, RAM, CPU, RAID card, disks.
Add a smattering of other potential culprits depending on the set-up. It could be the SAN, too. And don't forget about the hardware WAF! And.. you get my point.

If the issue is time-to-first-byte you'll of course start applying known fixes to the webserver, that's the one responding slowly and what you know the most about, right? Wrong!
You go back to trying to reproduce the issue. Only this time, you try to eliminate as many potential sources of issues as possible.

You can eliminate the vast majority of potential culprits very easily: Can you reproduce the issue locally from the server(s)? Congratulations, you've just saved yourself having to try your fixes for BGP routing.
If you can't, try from another machine on the same network. If you can - at least you can move the firewall down your list of suspects, (but do keep a suspicious eye on that switch!)

Are all connections slow? Just because the server is a web server, doesn't mean you shouldn't try to reproduce with another type of service. [netcat][1] is very useful in these scenarios (but chances are your SSH connection would have been lagging this whole time, as a clue)! If that's also slow, you at least know you've most likely got a networking problem and can disregard the entire web stack and all its components. Start from the top again with this knowledge (do not collect $200). Work your way from the inside-out!

Even if you can reproduce locally - there's still a whole lot of "stuff" left. Let's remove a few more variables. Can you reproduce it with a flat-file? If `i_am_a_1kb_file.html` is slow, you know it's not your DB, caching layer or anything beyond the OS and the webserver itself.
Can you reproduce with an interpreted/executed `hello_world.(py|php|js|rb..)` file? If you can, you've narrowed things down considerably, and you can focus on just a handful of things. If `hello_world` is served instantly, you've still learned a lot! You know there aren't any blatant resource constraints, any full queues or stuck IPC calls anywhere. So it's something the application is doing or something it's communicating with.

Are all pages slow? Or just the ones loading the "Live scores feed" from a third party?

**What this boils down to is; What 's the smallest amount of "stuff" that you can involve, and still reproduce the issue?**

Our example is a slow web site, but this is equally applicable to almost any issue. Mail delivery? Can you deliver locally? To yourself? To <common provider here>? Test with small, plaintext messages. Work your way up to the 2MB campaign blast. STARTTLS and no STARTTLS. Work your way from the inside-out.

Each one of these steps takes mere seconds each, far quicker than implementing most "potential" fixes.

### Observe / isolate

By now, you may already have stumbled across the problem by virtue of being unable to reproduce when you removed a particular component.

But if you haven't, or you still don't know **why** ; Once you've found a way to reproduce the issue with the smallest amount of "stuff" (technical term) between you and the issue, it's time to start isolating and observing.

Bear in mind that many services can be ran in the foreground, and/or have debugging enabled. For certain classes of issues, it is often hugely helpful to do this.

Here's also where your traditional armory comes into play. `strace`, `lsof`, `netstat`, `GDB`, `iotop`, `valgrind`, language profilers (cProfile, xdebug, ruby-prof…). Those types of tools.

Once you've come this far, you rarely end up having to break out profilers or debugers though.

[`strace`][2] is often a very good place to start.
You might notice that the application is stuck on a particular `read()` call on a socket file descriptor connected to port 3306 somewhere. You'll know what to do.
Move on to MySQL and start from the top again. Low hanging fruit: "Waiting_for comic core.md Dict.md lctt2014.md lctt2016.md LCTT翻译规范.md LICENSE Makefile published README.md sign.md sources translated 选题模板.txt 中文排版指北.md lock", deadlocks, max_connections.. Move on to: All queries? Only writes? Only certain tables? Only certain storage engines?…

You might notice that there's a `connect()` to an external API resource that takes five seconds to complete, or even times out. You'll know what to do.

You might notice that there are 1000 calls to `fstat()` and `open()` on the same couple of files as part of a circular dependency somewhere. You'll know what to do.

It might not be any of those particular things, but I promise you, you'll notice something.

If you're only going to take one thing from this section, let it be; learn to use `strace`! **Really** learn it, read the whole man page. Don 't even skip the HISTORY section. `man` each syscall you don't already know what it does. 98% of troubleshooting sessions ends with strace.

--------------------------------------------------------------------------------

via: http://northernmost.org/blog/troubleshooting-101/index.html

作者：[Erik Ljungstrom][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://northernmost.org
[1]:http://nc110.sourceforge.net/
[2]:https://linux.die.net/man/1/strace
