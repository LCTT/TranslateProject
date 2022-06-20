[#]: subject: "Ubuntu Runs on a Google Nest Hub, Wait, What?"
[#]: via: "https://news.itsfoss.com/ubuntu-google-nest/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ubuntu Runs on a Google Nest Hub, Wait, What?
======
A hacker successfully managed to run Ubuntu on a Google Nest Hub (2nd Gen), say, what now?

![ubuntu google][1]

I just spotted a story about Ubuntu running on a Google Nest Hub (2nd Gen).

Well, that is certainly exciting!

So, let me share more about it here.

### Hacking Google Nest Hub to Install Ubuntu

Yes, a hacking attempt made this possible.

A cybersecurity professional, **Frédéric Basse**, broke the secure boot on Google Nest Hub (2nd gen) and managed to run Ubuntu.

Of course, Google Nest Hub does not officially support booting a custom OS. But, a security vulnerability allowed Fred to use an exploit and run Ubuntu.

While this is fun, it is also a severe problem for an always-connected smart home display by Google.

As explained in his [blog post][2], the hacker utilized a Raspberry Pi Pico microcontroller to exploit a USB bug in the bootloader to break the secure boot chain.

The security expert concluded:

> As a result, an attacker can execute arbitrary code at early boot stage (before kernel execution) by plugging a malicious USB device and pressing two buttons

He has also made the bootloader exploit available on [GitHub][3], if you want to experiment (suited for security researchers).

### Making Ubuntu Work on Google Nest 

![][4]

The exploit allowed the attacker to boot an unsigned OS. However, he had to make some modifications with the preinstalled Ubuntu image tailored for Raspberry Pi (64-bit ARM).

Here’s what he mentions about it:

> We build a custom U-Boot bootloader with secure boot disabled and boot flow altered to load environment from USB flash drive. We also build a custom Linux kernel for elaine with [additionnal d][5]r[ivers like USB mouse][6]. The initial ramdisk (initrd) from Ubuntu is repacked to integrate firmware binaries required for the touchscreen. The boot image is created based on the custom Linux kernel and modified initrd.

So, it is evident that you will not get a full-fledged Ubuntu experience, but thanks to the exploit, we now know that Ubuntu can run on a Google Nest as an experiment if you’re willing to break your Google Nest for the test (don’t do that, really!).

### Smart Home Security Concern + Linux

The cybersecurity expert mentions that the vulnerability has been fixed upstream (twice).

But, the lack of CVE may have influenced the fix not propagating downstream, as the researcher suggests.

Undoubtedly, seeing Linux running on an unsupported device is awesome. Makes me wonder if we should have someone make **commercial smart home devices powered by Linux?**

*Is there something like that already available?*

Nevertheless, it is equally concerning for smart home devices to be vulnerable to easy attacks.

What do you think? Share your thoughts in the comments down below.

**Via**: [Liliputing][7]

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/ubuntu-google-nest/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/06/hacker-installs-ubuntu-on-google-nest-hub.jpg
[2]: https://fredericb.info/2022/06/breaking-secure-boot-on-google-nest-hub-2nd-gen-to-run-ubuntu.html
[3]: https://github.com/frederic/chipicopwn
[4]: https://news.itsfoss.com/wp-content/uploads/2022/06/ubuntu-google-nest.jpg
[5]: https://github.com/frederic/elaine-linux/commit/11068237d9178e77d79e3a5d27fc4f8f9b923c51
[6]: https://github.com/frederic/elaine-linux/commit/11068237d9178e77d79e3a5d27fc4f8f9b923c51
[7]: https://liliputing.com/2022/06/hacker-installs-ubuntu-on-a-google-nest-hub-2nd-gen-smart-display.html
