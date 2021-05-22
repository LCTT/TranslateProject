[#]: subject: (Everything You Need to Know About CentOS Stream)
[#]: via: (https://itsfoss.com/centos-stream-faq/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Everything You Need to Know About CentOS Stream
======

Recently, [CentOS was killed][1], which existed as a rebuild of Red Hat Enterprise Linux (RHEL). You will still find the availability of CentOS Linux 8 and 7 but their support will end at the end of 2021 and 2024 (maintenance updates) respectively.

CentOS Stream will completely replace CentOS Linux as we know it. But, what is it? Is it meant to replace CentOS? Is it reliable enough?

In this article, we shall discuss everything briefly that you need to know about CentOS Stream.

### What is CentOS Stream?

![][2]

Unlike CentOS Linux, CentOS Stream was introduced as an upstream to Red Hat Enterprise Linux (RHEL). And, it is not a rolling-release distribution.

**CentOS Stream is instead a development version of RHEL.**

For more clarity on how CentOS Stream is developed, I’ll recommend you to read one of the [official blog posts on CentOS continuous delivery][3].

Of course, Fedora is yet another upstream, but CentOS Stream has been positioned between RHEL and Fedora Linux.

With CentOS Stream, the CentOS community members can have a bigger potential to influence the development of RHEL.

Considering that CentOS Stream is a distribution that tracks just ahead of RHEL, any significant change in Fedora should be expected to reflect in CentOS Stream while RHEL being the next stop.

### What Problems Does CentOS Stream Solve?

As you know, that the development of RHEL is closed inside Red Hat itself.

Being something that supports an open-source ecosystem, there existed an open contribution gap for the developers and the community to influence or contribute to the development of Red Hat Enterprise Linux.

**For that very reason, CentOS Stream was introduced as a preview version of RHEL or you could call it as a development build of RHEL.**

_CentOS Stream is meant to bridge the gap and let the community contribute and have a say in the direction of development for RHEL._

Of course, looking at it from a business perspective, CentOS Stream aims to encourage RHEL subscriptions but let’s not ignore the ease of contribution to RHEL development via CentOS Stream.

In addition to this resolution, CentOS Stream also tries to provide a more stable preview version of RHEL. As per one of their [official blog posts][3], they mentioned the RHEL nightly builds are updates for CentOS Stream, and they try to ensure better stability every day with CentOS Stream.

And, that’s a good thing for folks who want to test the upcoming changes in RHEL.

### Is it meant to replace CentOS Linux?

No.

CentOS Linux was a rebuild of RHEL i.e a community edition of RHEL.

But, CentOS Stream is a development version of RHEL, which will include upcoming changes and additions that are meant for RHEL.

So, CentOS Stream is more suitable for folks who want to test their servers if they are future proof (RHEL Ready) and potentially for CentOS Linux users considering that the build is stable enough as per their requirements.

However, it is interesting to note that for some, it may replace CentOS Linux considering that it is not technically a rolling release.

And, if you’re someone who does not want to try it, feel free to try the [CentOS alternatives][4] available.

### Migrate from CentOS 8 to CentOS Stream

Fortunately, it is not that tough to update your CentOS system to CentOS Stream. The CentOS team offer a tool to automates removing the CentOS repositories and adding CentOS Stream repos.

You can refer to our [migration guide on LinuxHandbook][5] for further information.

It is always recommended having a backup of your server before you migrate or update your system.

Should you do it? That entirely depends on what you think of CentOS Stream from everything you read about it in this article.

### Migrate from CentOS to Red Hat Enterprise Linux

After receiving a backlash for the sudden discontinuation of CentOS 8, Red Hat announced that it will [give up to 16 RHEL licenses for free to any user][6]. The technical support from Red Hat is not included in this offer.

If you want to take advantage of this offer, you should create an account for the [no-cost RHEL][7]. Afterwards, you may follow this guide to [convert your CentOS to RHEL][8].

### Concluding Thoughts

Personally, I have mixed feelings about CentOS Stream. Yes, it is indeed something that open ups the development of RHEL but if it’s a replacement for CentOS Linux? I don’t think so.

Yes, it will encourage RHEL subscriptions for sure and if you’re interested to shape up the development of RHEL, CentOS Stream will be a good option for you.

What do you think about CentOS Stream? Let me know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/centos-stream-faq/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/centos-stream-fiasco/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/CentOS-Stream.jpg?resize=800%2C450&ssl=1
[3]: https://blog.centos.org/2020/12/centos-stream-is-continuous-delivery/
[4]: https://itsfoss.com/rhel-based-server-distributions/
[5]: https://linuxhandbook.com/update-to-centos-stream/
[6]: https://news.itsfoss.com/rhel-no-cost-option/
[7]: https://developers.redhat.com/articles/faqs-no-cost-red-hat-enterprise-linux
[8]: https://access.redhat.com/articles/2360841
