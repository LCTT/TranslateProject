
kylepeng93正在翻译
Running a mainline kernel on a cellphone
================================================================================

One of the biggest freedoms associated with free software is the ability to replace a program with an updated or modified version. Even so, of the many millions of people using Linux-powered phones, few are able to run a mainline kernel on those phones, even if they have the technical skills to do the replacement. The sad fact is that no mainstream phone available runs mainline kernels. A session at the 2015 Kernel Summit, led by Rob Herring, explored this problem and what might be done to address it.

When asked, most of the developers in the room indicated that they would prefer to be able to run mainline kernels on their phones — though a handful did say that they would rather not do so. Rob has been working on this problem for the last year and a half in support of Project Ara (mentioned in this article). But the news is not good.

There is, he said, too much out-of-tree code running on a typical handset; mainline kernels simply lack the drivers needed to make that handset work. A typical phone is running 1-3 million lines of out-of-tree code. Almost all of those phones are stuck on the 3.10 kernel — or something even older. There are all kinds of reasons for this, but the simple fact is that things seem to move too quickly in the handset world for the kernel community to keep up. Is that, he asked, something that we care about?

Tim Bird noted that the Nexus 1, one of the original Android phones, never ran a mainline kernel and never will. It broke the promise of open source, making it impossible for users to put a new kernel onto their devices. At this point, no phone supports that ability. Peter Zijlstra wondered about how much of that out-of-tree code was duplicated functionality from one handset to the next; Rob noted that he has run into three independently developed hotplug governors so far.

Dirk Hohndel suggested that few people care. Of the billion phones out there, he said, approximately 27 of them have owners who care about running mainline kernels. The rest just want to get the phone to work. Perhaps developers who are concerned about running mainline kernels are trying to solve the wrong problem.

Chris Mason said that handset vendors are currently facing the same sorts of problems that distributors dealt with many years ago. They are coping with a lot of inefficient, repeated, duplicated work. Once the distributors [Rob Herring] decided to put their work into the mainline instead of carrying it themselves, things got a lot better. The key is to help the phone manufacturers to realize that they can benefit in the same way; that, rather than pressure from users, is how the problem will be solved.

Grant Likely raised concerns about security in a world where phones cannot be upgraded. What we need is a real distribution market for phones. But, as long as the vendors are in charge of the operating software, phones will not be upgradeable. We have a big security mess coming, he said. Peter added that, with Stagefright, that mess is already upon us.

Ted Ts'o said that running mainline kernels is not his biggest concern. He would be happy if the phones on sale this holiday season would be running a 3.18 or 4.1 kernel, rather than being stuck on 3.10. That, he suggested, is a more solvable problem. Steve Rostedt said that would not solve the security problem, but Ted remarked that a newer kernel would at least make it easier to backport fixes. Grant replied that, one year from now, it would all just happen again; shipping newer kernels is just an incremental fix. Kees Cook added that there is not much to be gained from backporting fixes; the real problem is that there are no defenses from bugs (he would expand on this theme in a separate session later in the day).

Rob said that any kind of solution would require getting the vendors on board. That, though, will likely run into trouble with the sort of lockdown that vendors like to apply to their devices. Paolo Bonzini asked whether it would be possible to sue vendors over unfixed security vulnerabilities, especially when the devices are still under warranty. Grant said that upgradeability had to become a market requirement or it simply wasn't going to happen. It might be a nasty security issue that causes this to happen, or carriers might start requiring it. Meanwhile, kernel developers need to keep pushing in that direction. Rob noted that, beyond the advantages noted thus far, the ability to run mainline kernels would help developers to test and validate new features on Android devices.

Josh Triplett asked whether the community would be prepared to do what it would take if the industry were to come around to the idea of mainline kernel support. There would be lots of testing and validation of kernels on handsets required; Android Compatibility Test Suite failures would have to be treated as regressions. Rob suggested that this could be discussed next year, after the basic functionality is in place, but Josh insisted that, if the demand were to show up, we would have to be able to give a good answer.

Tim said that there is currently a big disconnect with the vendor world; vendors are not reporting or contributing anything back to the community at all. They are completely disconnected, so there is no forward progress ever. Josh noted that when vendors do report bugs with the old kernels they are using, the reception tends to be less than friendly. Arnd Bergmann said that what was needed was to get one of the big silicon vendors to commit to the idea and get its hardware to a point where running mainline kernels was possible; that would put pressure on the others. But, he added, that would require the existence of one free GPU driver that got shipped with the hardware — something that does not exist currently.

Rob put up a list of problem areas, but there was not much time for discussion of the particulars. WiFi drivers continue to be an issue, especially with the new features being added in the Android world. Johannes Berg agreed that the new features are an issue; the Android developers do not even talk about them until they ship with the hardware. Support for most of those features does eventually land in the mainline kernel, though.

As things wound down, Ben Herrenschmidt reiterated that the key was to get vendors to realize that working with the mainline kernel is in their own best interest; it saves work in the long run. Mark Brown said that, in past years when the kernel version shipped with Android moved forward more reliably, the benefits of working upstream were more apparent to vendors. Now that things seem to be stuck on 3.10, that pressure is not there in the same way. The session ended with developers determined to improve the situation, but without any clear plan for getting there.

--------------------------------------------------------------------------------

via: https://lwn.net/Articles/662147/

作者：[Jonathan Corbet][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://lwn.net/Articles/KernelSummit2015/
