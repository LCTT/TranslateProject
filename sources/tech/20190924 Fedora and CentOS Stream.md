[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fedora and CentOS Stream)
[#]: via: (https://fedoramagazine.org/fedora-and-centos-stream/)
[#]: author: (Matthew Miller https://fedoramagazine.org/author/mattdm/)

Fedora and CentOS Stream
======

![][1]

_From the desk of the Fedora Project Leader:_

Hi everyone! You may have seen the [announcement][2] about [changes over at the CentOS Project][3]. (If not, please go ahead and take a few minutes and read it — I’ll wait!) And now you may be wondering: if CentOS is now upstream of RHEL, what happens to Fedora? Isn’t that Fedora’s role in the Red Hat ecosystem?

First, don’t worry. There are changes to the big picture, but they’re all for the better.

![][4]

If you’ve been following the conference talks from Red Hat Enterprise Linux leadership about the relationship between Fedora, CentOS, and RHEL, you have heard about “the [Penrose Triangle][5]”. That’s a shape like something from an M. C. Escher drawing: it’s impossible in real life!

We’ve been thinking for a while that _maybe_ impossible geometry is not actually the best model. 

For one thing, the imagined flow where contributions at the end would flow back into Fedora and grow in a “virtuous cycle” never actually worked that way. That’s a shame, because there’s a huge, awesome CentOS community and many great people working on it — and there’s a lot of overlap with the Fedora community too. We’re missing out.

But that gap isn’t the only one: there’s not really been a consistent flow between the projects and product at all. So far, the process has gone like this: 

  1. Some time after the previous RHEL release, Red Hat would suddenly turn more attention to Fedora than usual.
  2. A few months later, Red Hat would split off a new RHEL version, developed internally.
  3. After some months, that’d be put into the world, including all of the source — from which CentOS is built. 
  4. Source drops continue for updates, and sometimes those updates include patches that were in Fedora — but there’s no visible connection.



Each step here has its problems: intermittent attention, closed-door development, blind drops, and little ongoing transparency. But now Red Hat and CentOS Project are fixing that, and that’s good news for Fedora, too.

**Fedora will remain the** [**first**][6] **upstream of RHEL.** It’s where every RHEL came from, and is where RHEL 9 will come from, too. But after RHEL branches off, _CentOS_ will be upstream for ongoing work on those RHEL versions. I like to call it “the midstream”, but the marketing folks somehow don’t, so that’s going to be called “CentOS Stream”.

We — Fedora, CentOS, and Red Hat — still need to work out all of the technical details, but the idea is that these branches will live in the same package source repository. (The current plan is to make a “src.centos.org” with a  parallel view of the same data as [src.fedoraproject.org][7]). This change gives public visibility into ongoing work on released RHEL, and a place for developers and Red Hat’s partners to collaborate at that level.

[CentOS SIGs][8] — the special interest groups for virtualization, storage, config management and so on — will do their work in shared space right next to Fedora branches. This will allow much easier collaboration and sharing between the projects, and I’m hoping we’ll even be able to merge some of our similar SIGs to work together directly. Fixes from Fedora packages can be cherry-picked into the CentOS “midstream” ones — and where useful, vice versa.

Ultimately, Fedora, CentOS, and RHEL are part of the same big project family. This new, more natural flow opens possibilities for collaboration which were locked behind artificial (and extra-dimensional!) barriers. I’m very excited for what we can now do together!

_— Matthew Miller, Fedora Project Leader_

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-and-centos-stream/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/09/centos-stream-816x345.jpg
[2]: http://redhat.com/en/blog/transforming-development-experience-within-centos
[3]: https://wiki.centos.org/Manuals/ReleaseNotes/CentOSStream
[4]: https://lh3.googleusercontent.com/5XMDU29DYPsFKIVLCexK46n9DqWZEa0nTjAnJcouzww-RSAzNshGW3yIxXBSBsd6KfAyUAGpxX9y0Dsh1hj21ygcAn5a7h55LrneKROkxsipdXO2gq8cgoFqz582ojOh8NU9Ix0X
[5]: https://www.youtube.com/watch?v=1JmgOkEznjw
[6]: https://docs.fedoraproject.org/en-US/project/#_first
[7]: https://src.fedoraproject.org/
[8]: https://wiki.centos.org/SpecialInterestGroup
