[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Enjoy Netflix? You Should Thank FreeBSD)
[#]: via: (https://itsfoss.com/netflix-freebsd-cdn/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Enjoy Netflix? You Should Thank FreeBSD
======

Netflix is one of the most popular streaming services in the world.

But you already know that. Don’t you?

What you probably did not know is that Netflix uses [FreeBSD][1] to deliver its content to you.

Yes, that’s right. Netflix relies on FreeBSD to build its in-house content delivery network (CDN).

A [CDN][2] is a group of servers located in various part of the world. It is mainly used to deliver ‘heavy content’ like images and videos to the end-user faster than a centralized server.

Instead of opting for a commercial CDN service, Netflix has built its own in-house CDN called [Open Connect][3].

Open Connect utilizes [custom hardware][4], Open Connect Appliance. You can see it in the image below. It can handle 40Gb/s data and has a storage capacity of 248TB.

![Netflix’s Open Connect Appliance runs FreeBSD][5]

Netflix provides Open Connect Appliance to qualifying Internet Service Providers (ISP) for free. This way, substantial Netflix traffic gets localized and the ISPs deliver the Netflix content more efficiently.

This Open Connect Appliance runs on FreeBSD operating system and [almost exclusively runs open source software][6].

### Open Connect uses FreeBSD “Head”

![][7]

You would expect Netflix to use a stable release of FreeBSD for such a critical infrastructure but Netflix tracks the [FreeBSD head/current version][8]. Netflix says that tracking “head” lets them “stay forward-looking and focused on innovation”.

Here are the benefits Netflix sees of tracking FreeBSD:

  * Quicker feature iteration
  * Quicker access to new FreeBSD features
  * Quicker bug fixes
  * Enables collaboration
  * Minimizes merge conflicts
  * Amortizes merge “cost”



> Running FreeBSD “head” lets us deliver large amounts of data to our users very efficiently, while maintaining a high velocity of feature development.
>
> Netflix

Remember, even [Google uses Debian][9] testing instead of Debian stable. Perhaps these enterprises prefer the cutting edge features more than anything else.

Like Google, Netflix also plans to upstream any code they can. This should help FreeBSD and other BSD distributions based on FreeBSD.

So what does Netflix achieves with FreeBSD? Here are some quick stats:

> Using FreeBSD and commodity parts, we achieve 90 Gb/s serving TLS-encrypted connections with ~55% CPU on a 16-core 2.6-GHz CPU.
>
> Netflix

If you want to know more about Netflix and FreeBSD, you can refer to [this presentation from FOSDEM][10]. You can also watch the video of the presentation [here][11].

These days big enterprises rely mostly on Linux for their server infrastructure but Netflix has put their trust in BSD. This is a good thing for BSD community because if an industry leader like Netflix throws its weight behind BSD, others could follow the lead. What do you think?

--------------------------------------------------------------------------------

via: https://itsfoss.com/netflix-freebsd-cdn/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.freebsd.org/
[2]: https://www.cloudflare.com/learning/cdn/what-is-a-cdn/
[3]: https://openconnect.netflix.com/en/
[4]: https://openconnect.netflix.com/en/hardware/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/netflix-open-connect-appliance.jpeg?fit=800%2C533&ssl=1
[6]: https://openconnect.netflix.com/en/software/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/netflix-freebsd.png?resize=800%2C450&ssl=1
[8]: https://www.bsdnow.tv/tutorials/stable-current
[9]: https://itsfoss.com/goobuntu-glinux-google/
[10]: https://fosdem.org/2019/schedule/event/netflix_freebsd/attachments/slides/3103/export/events/attachments/netflix_freebsd/slides/3103/FOSDEM_2019_Netflix_and_FreeBSD.pdf
[11]: http://mirror.onet.pl/pub/mirrors/video.fosdem.org/2019/Janson/netflix_freebsd.webm
