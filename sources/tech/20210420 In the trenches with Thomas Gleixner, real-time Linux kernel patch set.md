[#]: subject: (In the trenches with Thomas Gleixner, real-time Linux kernel patch set)
[#]: via: (https://www.linux.com/news/in-the-trenches-with-thomas-gleixner-real-time-linux-kernel-patch-set/)
[#]: author: (Linux.com Editorial Staff https://www.linux.com/author/linuxdotcom/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

In the trenches with Thomas Gleixner, real-time Linux kernel patch set
======

_![][1]_

_Jason Perlow, Editorial Director at the Linux Foundation interviews Thomas Gleixner, Linux Foundation Fellow, CTO of Linutronix GmbH, and project leader of the_ [_PREEMPT_RT_][2] _real-time kernel patch set._

**JP:** *Greetings, Thomas! It’s great to have you here this morning — although for you, it’s getting late in the afternoon in Germany. So **PREEMPT_RT**, the real-time patch set for the kernel is a fascinating project because it has some very important use-cases that most people who use Linux-based systems may not be aware of. First of all, can you tell me what “Real-Time” truly means? *

**TG:** Real-Time in the context of operating systems means that the operating system provides mechanisms to guarantee that the associated real-time task processes an event within a specified period of time. Real-Time is often confused with “really fast.” The late Prof. Doug Niehaus explained it this way: “Real-Time is not as fast as possible; it is as fast as specified.”

The specified time constraint is application-dependent. A control loop for a water treatment plant can have comparatively large time constraints measured in seconds or even minutes, while a robotics control loop has time constraints in the range of microseconds. But for both scenarios missing the deadline at which the computation has to be finished can result in malfunction. For some application scenarios, missing the deadline can have fatal consequences.

In the strict sense of Real-Time, the guarantee which is provided by the operating system must be verifiable, e.g., by mathematical proof of the worst-case execution time. In some application areas, especially those related to functional safety (aerospace, medical, automation, automotive, just to name a few), this is a mandatory requirement. But for other scenarios or scenarios where there is a separate mechanism for providing the safety requirements, the proof of correctness can be more relaxed. But even in the more relaxed case, the malfunction of a real-time system can cause substantial damage, which obviously wants to be avoided.

**JP:** _What is the history behind the project? How did it get started?_

**TG:** Real-Time Linux has a history that goes way beyond the actual **PREEMPT_RT** project.

Linux became a research vehicle very early on. Real-Time researchers set out to transform Linux into a Real-Time Operating system and followed different approaches with more or less success. Still, none of them seriously attempted a fully integrated and perhaps upstream-able variant. In 2004 various parties started an uncoordinated effort to get some key technologies into the Linux kernel on which they wanted to build proper Real-Time support. None of them was complete, and there was a lack of an overall concept. 

Ingo Molnar, working for RedHat, started to pick up pieces, reshape them and collect them in a patch series to build the grounds for the real-time preemption patch set **PREEMPT_RT**. At that time, I worked with [the late Dr. Doug Niehaus][3] to port a solution we had working based on the 2.4 Linux kernel forward to the 2.6 kernel. Our work was both conflicting and complimentary, so I teamed up with Ingo quickly to get this into a usable shape. Others like Steven Rostedt brought in ideas and experience from other Linux Real-Time research efforts. With a quickly forming loose team of interested developers, we were able to develop a halfway usable Real-Time solution that was fully integrated into the Linux kernel in a short period of time. That was far from a maintainable and production-ready solution. Still, we had laid the groundwork and proven that the concept of making the Linux Kernel real-time capable was feasible. The idea and intent of fully integrating this into the mainline Linux kernel over time were there from the very beginning.

**JP:** _Why is it still a separate project from the Mainline kernel today?_

**TG:** To integrate the real-time patches into the Linux kernel, a lot of preparatory work, restructuring, and consolidation of the mainline codebase had to be done first. While many pieces that emerged from the real-time work found their way into the mainline kernel rather quickly due to their isolation, the more intrusive changes that change the Linux kernel’s fundamental behavior needed (and still need) a lot of polishing and careful integration work. 

Naturally, this has to be coordinated with all the other ongoing efforts to adopt the Linux kernel to the different use cases ranging from tiny embedded systems to supercomputers. 

This also requires carefully designing the integration so it does not get in the way of other interests and imposes roadblocks for further developing the Linux kernel, which is something the community and especially Linus Torvalds, cares about deeply. 

As long as these remaining patches are out of the mainline kernel, this is not a problem because it does not put any burden or restriction on the mainline kernel. The responsibility is on the real-time project, but on the other side, in this context, there is no restriction to take shortcuts that would never be acceptable in the upstream kernel.

The real-time patches are fundamentally different from something like a device driver that sits at some corner of the source tree. A device driver does not cause any larger damage when it goes unmaintained and can be easily removed when it reaches the final state bit-rot. Conversely, the **PREEMPT_RT** core technology is in the heart of the Linux kernel. Long-term maintainability is key as any problem in that area will affect the Linux user universe as a whole. In contrast, a bit-rotted driver only affects the few people who have a device depending on it.

**JP:** *Traditionally, when I think about RTOS, I think of legacy solutions based on closed systems. Why is it essential we have an open-source alternative to them? *

**TG:** The RTOS landscape is broad and, in many cases, very specialized. As I mentioned on the question of “what is real-time,” certain application scenarios require a fully validated RTOS, usually according to an application space-specific standard and often regulatory law. Aside from that, many RTOSes are limited to a specific class of CPU devices that fit into the targeted application space. Many of them come with specialized application programming interfaces which require special tooling and expertise.

The Real-Time Linux project never aimed at these narrow and specialized application spaces. It always was meant to be the solution for 99% of the use cases and to be able to fully leverage the flexibility and scalability of the Linux kernel and the broader FOSS ecosystem so that integrated solutions with mixed-criticality workloads can be handled consistently. 

Developing real-time applications on a real-time enabled Linux kernel is not much different from developing non-real-time applications on Linux, except for the careful selection of system interfaces that can be utilized and programming patterns that should be avoided, but that is true for real-time application programming in general independent of the RTOS. 

The important difference is that the tools and concepts are all the same, and integration into and utilizing the larger FOSS ecosystem comes for free.

The downside of **PREEMPT_RT** is that it can’t be fully validated, which excludes it from specific application spaces, but there are efforts underway, e.g., the LF ELISA project, to fill that gap. The reason behind this is, that large multiprocessor systems have become a commodity, and the need for more complex real-time systems in various application spaces, e.g., assisted / autonomous driving or robotics, requires a more flexible and scalable RTOS approach than what most of the specialized and validated RTOSes can provide. 

That’s a long way down the road. Still, there are solutions out there today which utilize external mechanisms to achieve the safety requirements in some of the application spaces while leveraging the full potential of a real-time enabled Linux kernel along with the broad offerings of the wider FOSS ecosystem.

**JP:** _What are examples of products and systems that use the real-time patch set that people depend on regularly?_

**TG:** It’s all over the place now. Industrial automation, control systems, robotics, medical devices, professional audio, automotive, rockets, and telecommunication, just to name a few prominent areas.

**JP:** *Who are the major participants currently developing systems and toolsets with the real-time Linux kernel patch set?  *

**TG:** Listing them all would be equivalent to reciting the “who’s who” in the industry. On the distribution side, there are offerings from, e.g., RedHat, SUSE, Mentor, and Wind River, which deliver RT to a broad range of customers in different application areas. There are firms like Concurrent, National Instruments, Boston Dynamics, SpaceX, and Tesla, just to name a few on the products side.

RedHat and National Instruments are also members of the LF collaborative Real-Time project.

**JP:** _What are the challenges in developing a real-time subsystem or specialized kernel for Linux? Is it any different than how other projects are run for the kernel?_

**TG:** Not really different; the same rules apply. Patches have to be posted, are reviewed, and discussed. The feedback is then incorporated. The loop starts over until everyone agrees on the solution, and the patches get merged into the relevant subsystem tree and finally end up in the mainline kernel.

But as I explained before, it needs a lot of care and effort and, often enough, a large amount of extra work to restructure existing code first to get a particular piece of the patches integrated. The result is providing the desired functionality but is at the same time not in the way of other interests or, ideally, provides a benefit for everyone.

The technology’s complexity that reaches into a broad range of the core kernel code is obviously challenging, especially combined with the mainline kernel’s rapid change rate. Even larger changes happening at the related core infrastructure level are not impacting ongoing development and integration work too much in areas like drivers or file systems. But any change on the core infrastructure can break a carefully thought-out integration of the real-time parts into that infrastructure and send us back to the drawing board for a while.

**JP:**  *Which companies have been supporting the effort to get the **PREEMPT_RT** Linux kernel patches upstream? *

**TG:** For the past five years, it has been supported by the members of the LF real-time Linux project, currently ARM, BMW, CIP, ELISA, Intel, National Instruments, OSADL, RedHat, and Texas Instruments. CIP, ELISA, and OSADL are projects or organizations on their own which have member companies all over the industry. Former supporters include Google, IBM, and NXP.

I personally, my team and the broader Linux real-time community are extremely grateful for the support provided by these members. 

However, as with other key open source projects heavily used in critical infrastructure, funding always was and still is a difficult challenge. Even if the amount of money required to keep such low-level plumbing but essential functionality sustained is comparatively small, these projects struggle with finding enough sponsors and often lack long-term commitment.

The approach to funding these kinds of projects reminds me of the [Mikado Game][4], which is popular in Europe, where the first player who picks up the stick and disturbs the pile often is the one who loses.

That’s puzzling to me, especially as many companies build key products depending on these technologies and seem to take the availability and sustainability for granted up to the point where such a project fails, or people stop working on it due to lack of funding. Such companies should seriously consider supporting the funding of the Real-Time project.

It’s a lot like the [Jenga][5] game, where everyone pulls out as many pieces as they can up until the point where it collapses. We cannot keep taking; we have to give back to these communities putting in the hard work for technologies that companies heavily rely on.

I gave up long ago trying to make sense of that, especially when looking at the insane amounts of money thrown at the over-hyped technology of the day. Even if critical for a large part of the industry, low-level infrastructure lacks the buzzword charm that attracts attention and makes headlines — but it still needs support.

**JP:**  *One of the historical concerns was that Real-Time didn’t have a community associated with it; what has changed in the last five years?  *

**TG:** There is a lively user community, and quite a bit of the activity comes from the LF project members. On the development side itself, we are slowly gaining more people who understand the intricacies of **PREEMPT_RT** and also people who look at it from other angles, e.g., analysis and instrumentation. Some fields could be improved, like documentation, but there is always something that can be improved.

**JP:**  _What will the Real-Time Stable team be doing once the patches are accepted upstream?_

**TG:** The stable team is currently overseeing the RT variants of the supported mainline stable versions. Once everything is integrated, this will dry out to some extent once the older versions reach EOL. But their expertise will still be required to keep real-time in shape in mainline and in the supported mainline stable kernels.

**JP:** _So once the upstreaming activity is complete, what happens afterward?_

**TG:** Once upstreaming is done, efforts have to be made to enable RT support for specific Linux features currently disabled on real-time enabled kernels. Also, for quite some time, there will be fallout when other things change in the kernel, and there has to be support for kernel developers who run into the constraints of RT, which they did not have to think about before. 

The latter is a crucial point for this effort. Because there needs to be a clear longer-term commitment that the people who are deeply familiar with the matter and the concepts are not going to vanish once the mainlining is done. We can’t leave everybody else with the task of wrapping their brains around it in desperation; there cannot be institutional knowledge loss with a system as critical as this. 

The lack of such a commitment would be a showstopper on the final step because we are now at the point where the notable changes are focused on the real-time only aspects rather than welcoming cleanups, improvements, and features of general value. This, in turn, circles back to the earlier question of funding and industry support — for this final step requires several years of commitment by companies using the real-time kernel.

There’s not going to be a shortage of things to work on. It’s not going to be as much as the current upstreaming effort, but as the kernel never stops changing, this will be interesting for a long time.

**JP:** _Thank you, Thomas, for your time this morning. It’s been an illuminating discussion._

_To get involved with the real-time kernel patch for Linux, please visit the_ [_PREEMPT_RT wiki_][2] _at The Linux Foundation or email [real-time-membership@linuxfoundation.org][6]_

--------------------------------------------------------------------------------

via: https://www.linux.com/news/in-the-trenches-with-thomas-gleixner-real-time-linux-kernel-patch-set/

作者：[Linux.com Editorial Staff][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/linuxdotcom/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2021/04/IntheTrenches_ThomasGleixner.png
[2]: https://wiki.linuxfoundation.org/realtime/start
[3]: https://lwn.net/Articles/514182/?fbclid=IwAR1mhNcOVlNdQ_QmwOhC1vG3vHzxsXRwa_g4GTo62u1sHbjOZBPPviT5bxc
[4]: https://en.wikipedia.org/wiki/Mikado_(game)
[5]: https://en.wikipedia.org/wiki/Jenga
[6]: mailto:real-time-membership@linuxfoundation.org
