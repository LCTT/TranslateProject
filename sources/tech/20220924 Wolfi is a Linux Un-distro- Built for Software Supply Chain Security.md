[#]: subject: "Wolfi is a Linux Un(distro) Built for Software Supply Chain Security"
[#]: via: "https://news.itsfoss.com/wolfi-linux-undistro/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Wolfi is a Linux Un(distro) Built for Software Supply Chain Security
======
Wolfi is a Linux undistro that focuses on resolving security issues with the software supply chain. Explore more here.

![Wolfi is a Linux Un(distro) Built for Software Supply Chain Security][1]

The software supply chain includes everything that goes into developing, building, storing, and running it and its dependencies.

As per the [State of the Software Supply Chain 2021 report][2], between 2020 and 2021 alone, attacks on the software supply chain increased by a shocking **650%**.

![][3]

That's a staggering percentage. 🤯

So, everyone in the industry, ranging from code platforms like [GitHub][4] to tech giants like Google, has been putting their best efforts into coming up with various initiatives to enhance the security of the software supply chain.

One of the examples include:

[Google Sponsors $1 Million to Fund Secure Open Source Program by The Linux Foundation][5]

📢 To join the efforts, [Chainguard][7], a security firm specializing in open-source software and cloud-native development, has introduced a **Linux distro designed to secure the software supply chain**.

💡 They call it an "**Undistro**" because it is not a full-fledged Linux distribution to run on bare metal.

Instead, it is a **container-focused Linux distribution**. So, let me tell you more about it.

### Wolfi: A Container-specific Linux Distribution

The world’s smallest Octopus is named Wolfi, which inspired them to use the same to represent minimalism to flexibility for this Linux distribution.

Wolfi aims to address issues with containers, which are mainly used to build and ship software.

Furthermore, Chainguard mentions that there are several issues with running containers; some include:

* Running vulnerable container images.
* Distributions used in container lag behind upstream versions.
* Container images include more software than needed, increasing the attack surface.
* Not designed to meet compliance requirements or standards like [SLSA][8].

So, Wolfi is a distro that aims to solve these problems by being a solution **designed for container/cloud-native environments**while **minimizing dependencies** as much as possible.

It provides a secure foundation that reduces the effort/time to review and mitigate security vulnerabilities while increasing productivity.

Chainguard explains this as follows:

> Building a new, container-specific distribution offers the chance to vastly simplify things by dropping support for traditional distribution features that are now irrelevant (like packaging Linux itself!), and other things like SBOMs become simpler when we can build them in from the start. We can also embrace the immutable nature of containers and avoid package updates altogether, instead preferring to rebuild from scratch with new versions.

### Key Features of Wolfi

To achieve its purpose, Wolfi has a few key highlights for you to encourage using it:

* Provides a high-quality, build-time SBOM as standard for all packages.
* Packages are designed to be granular and independent, to support minimal images.
* Uses the proven and reliable APK package format.
* Fully declarative and reproducible build system.
* Designed to support glibc and musl.

If you are not familiar with the securing software supply chain, this might go over your head.

![Securing your software supply chain][11]

So, I suggest looking at [Wikipedia][12] to understand the terms. The video above should also help you learn more.

### Try Wolfi

To try Chainguard images using the Wolfi undistro, you can head to its [GitHub page][13] to find all the technical instructions.

[Try Wolfi][14]

💬 *What do you think about Wolfi? Do you think it will solve the problem of securing the software supply chain? Let us know your thoughts in the comments.*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/wolfi-linux-undistro/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/09/wolfi-distro-software-supply-chain-security.png
[2]: https://www.sonatype.com/resources/state-of-the-software-supply-chain-2021
[3]: https://news.itsfoss.com/content/images/2022/09/software-chain-attacks.jpg
[4]: https://news.itsfoss.com/gitlab-open-source-tool-malicious-code/
[5]: https://news.itsfoss.com/google-sos-sponsor/
[7]: https://www.chainguard.dev/
[8]: https://slsa.dev/
[11]: https://youtu.be/Dg-hD4HHKT8
[12]: https://en.wikipedia.org/wiki/Software_supply_chain
[13]: https://github.com/chainguard-images/
[14]: https://github.com/chainguard-images/
[15]: https://www.humblebundle.com/books/linux-no-starch-press-books?partner=itsfoss
