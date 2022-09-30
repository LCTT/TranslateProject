[#]: subject: "Oh No!😱Fedora is Dropping Support for Popular Video Codecs [Here's Why!]"
[#]: via: "https://news.itsfoss.com/fedora-drops-vaapi-codec/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Oh No!😱Fedora is Dropping Support for Popular Video Codecs [Here's Why!]
======
Fedora 37 (and 36) may no longer allow you to conveniently use accelerated graphics for videos using some of the popular codecs.

![Oh No!😱Fedora is Dropping Support for Popular Video Codecs [Here's Why!]][1]

Fedora is a popular Linux distro that caters to users who want cutting-edge tech on their workstations (and servers).

It doesn't ship with any proprietary components and sticks to completely open-source repositories by default.

While that can be inconvenient for some already, now it seems another change may bother users looking forward to Fedora 37. 😞

A [recent commit to Mesa on Fedora][2] tells us that the Video Acceleration API support has been disabled for **H.264, H.265, and VC-1** codecs due to legal worry.

This is likely to be backported to Fedora 36 as well.

> 💡 H.264 is a dominant video codec in use by the majority of the video industry. 
>
> For instance, Apple extensively uses H.264 codec for its photos and videos captured by iPhones. You can read the [documentation][3] to learn more.

The change in Fedora was [first spotted][4] by a Fedora Project forum member who describes it as '*a big regression from F36*'.

### Is This Bad News for Fedora Users?

Yes, mostly.

**Primarily, it will affect AMD GPU users using open-source drivers**, preventing them using **GPU acceleration** to play video content that requires using these codecs.

Additionally, it also affects **any user who uses open-source graphics drivers**, even if they run iGPUs on Intel chips. Fedora developers have not yet provided any clarity on this, but you can test it out for yourself.

If you are someone who uses proprietary drivers on your NVIDIA graphics card, you have nothing to worry about.

Users running old hardware could also have problems, considering their system may not support these codecs.

Some of the most common uses of these codecs are in videos that you download from torrents or services that have not moved on to the newer generation codecs such as **AV1** and **VP9**.

And that's the **majority of the internet**I believe**.**

Some streaming platforms also use these codecs to run content on their respective platforms which can cause users to face issues while trying to access content through their services.

### Does This Affect Everyone?

If you are among the ones who watch YouTube videos and do not use any platform or download videos that require these codecs, you will have no issues.

You might want to explore more about AV1, if you are hearing about it for the first time:

![3 Things You Should Know About AV1][5]

### Fedora is Avoiding Legal Trouble

No one sued Fedora or forced them to do this yet. However, a change in Mesa recently allowed devs to optionally disable codecs to help avoid legal trouble and software patent conflicts as spotted by [Phoronix][6].

So, to avoid a legal mess, Fedora went ahead with this change.

The patents for H.264 and H.265 are with a company called [MPEG LA][7], which specializes in holding patents in the video codecs and display standards sector.

Whereas the patent for VC-1 is under [SMPTE][8], which is a group run by professionals from the media and entertainment sector.

We are still not sure how it all works, considering the user has already paid for the license to use these codecs when they purchase the graphics card. You can read more about it in [Fedora's legal list thread][9].

### What Are The Possible Workarounds?

**Of course,**you will have to depend on CPU-based decoding. Sure, you can also use an official or third-party Mesa build.

Flatpak apps may allow you to watch accelerated video content with no issues. But, it is up to the maintainer of the software.

But, it can be an inconvenient solution for most users.

The other workaround could be to include the codecs separately with VAAPI support in an RPM Fusion repository, meant to contain third-party applications.

However, the dev responsible for Fedora's RPM Fusion repo is not interested in maintaining a fork of Fedora's Mesa 3D. The developer mentions:

> There is little to no interest at rpmfusion to package and maintain it, also keeping the repo in sync with fedora isn't a priority for me.

![][10]

*💬 What do you think about this change in Fedora? Let us know your thoughts in the comments below.*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/fedora-drops-vaapi-codec/

作者：[Sourav Rudra][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/09/fedora-dropping-support-for-popular-video-codecs.png
[2]: https://src.fedoraproject.org/rpms/mesa/c/94ef544b3f2125912dfbff4c6ef373fe49806b52?branch=rawhide
[3]: https://support.apple.com/en-us/HT207022
[4]: https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org/thread/PYUYUCM3RGTTN4Q3QZIB4VUQFI77GE5X/
[5]: https://youtu.be/ibXKKllz4xQ
[6]: https://www.phoronix.com/news/Mesa-Optional-Video-Codecs
[7]: https://en.wikipedia.org/wiki/MPEG_LA
[8]: https://en.wikipedia.org/wiki/Society_of_Motion_Picture_and_Television_Engineers
[9]: https://lists.fedoraproject.org/archives/list/legal@lists.fedoraproject.org/thread/M4LTGLHY5JX42IHC45WNWB5FH2JIFMAS/
[10]: https://news.itsfoss.com/content/images/2022/09/fedora-rpm-mesa.jpg
[11]: https://www.humblebundle.com/books/linux-no-starch-press-books?partner=itsfoss
