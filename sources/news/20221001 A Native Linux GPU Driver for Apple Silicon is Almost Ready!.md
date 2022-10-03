[#]: subject: "A Native Linux GPU Driver for Apple Silicon is Almost Ready!"
[#]: via: "https://news.itsfoss.com/linux-gpu-driver-apple/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "KevinZonda"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A Native Linux GPU Driver for Apple Silicon is Almost Ready!
======
A native Linux GPU driver on Apple M1? It's almost here!

![A Native Linux GPU Driver for Apple Silicon is Almost Ready!][1]

Making Linux work on an Apple silicon-powered device is what many of us want!

Thanks to [Asahi Linux project][2], it is now a reality for testers. Sure, it is not ready for prime time, but if you are an advanced Linux user, you could try Linux on Apple M1/M2 devices right now.

Now, an exciting progress by **Asahi Lina**, a Linux developer, has all our attention.

**We might have a working native GPU driver written in Rust sooner than expected.**

### So, What Does This Mean?

A couple of months ago, Asahi Lina joined the Asahi Linux project and started [developing a prototype driver][3] to run graphics applications on Linux.

Now, with more tweaks and some amazing dedication by Asahi Lina to reverse engineer the M1 GPU hardware interface, she has managed to run GNOME, KDE apps, YouTube on Firefox, and more on an Apple M1 chip!

Here's what she [tweeted][4]:

Note that this hasn't been tested with Apple M2 yet.

Here's the video stream where you get to see it in action:

![IT WORKS! GNOME, Firefox, KDE apps, everything!!!!][5]

She also explains:

Of course, this is an early development when we do not even have Rust implementation with the Linux Kernel. So, probably you would see this getting closer to reality with Linux Kernel 6.1 or newer when Rust starts getting to the mainline releases.

Nevertheless, this is an incredible milestone for Asahi Linux. With some of the developments, users must be anxious to try Linux on Apple silicon-powered devices.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-gpu-driver-apple/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/10/native-apple-linux-gpu.png
[2]: https://news.itsfoss.com/asahi-linux-announcement/
[3]: https://asahilinux.org/2022/07/july-2022-release/
[4]: https://twitter.com/LinaAsahi/status/1575343067892051968
[5]: https://youtu.be/k0cnMUroMlQ
