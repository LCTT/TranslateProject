[#]: subject: "Wolfi: The Linux Un(distro) Improving Cloud Software Supply Chain Turns One!"
[#]: via: "https://news.itsfoss.com/wolfi-turns-one/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Wolfi: The Linux Un(distro) Improving Cloud Software Supply Chain Turns One!
======
An interesting project that helps secure software supply chain turns
one!
Wolfi has turned one!

I am not talking about the [world's smallest octopus][1], but a Linux distro taking inspiration from the little one.

It is **a community-driven, container-focused Linux distribution** designed to secure the software supply chain. The creators ([Chainguard][2]) call it an “ **Undistro** ”.

Wolfi aims to deal with the shortcomings of containers, primarily used to build and ship software.

Let's take a look at its journey so far, and what's in store for the future.

**Suggested Read** 📖

![][3]

### Wolfi: Project's Achievements 🐙

![][4]

Since Wolfi began its journey [last year][5], it has come a long way, with **over 1,300 package configs housed in the Wolfi repo** and **over** **18,000 packages in the Wolfi index**.

**60 contributors** have been involved with this project, with **more than 4,400 pull requests being merged** into the Wolfi repo on [GitHub][6] over the past year.

They have also achieved **a solid package update interval of less than 24 hours** , 80 percent of the time on their GitHub projects, with **support for vulnerability scanning tools** such as [Docker Scout][7], [Snyk][8], [Wiz][9], and more.

As Wolfi follows a [rolling release][10] approach, it also worked on delivering fixes to newly found [CVEs][11] quickly.

All of these achievements allowed them **to pioneer some key technical innovations** that include:

  * Building 64-bit ARM versions of all Wolfi packages.
  * Implementation of full-source bootstrapping for Go and Java.
  * Introduction of the [Rustls][12] TLS library for handling memory safety vulnerabilities.
  * A new project called '[wolfi-act][13]' that leverages Wolfi packages to be used dynamically within GitHub actions.



You're maybe wondering: **what does the future entail?**

Well, the folks behind Wolfi want it to improve it as **a community-driven project** that can someday become the most trusted distro for containerized workloads. With hopes that **builders everywhere can make use of Wolfi's full potential** to solve various problems.

Furthermore, they share about a use-case of Wolfi:

> One clear use case of Wolfi in practice today is [Chainguard Images][14]–which is why we set out to build the project. Chainguard Images is just one of the solutions Wolfi has enabled and we encourage more users and the community to explore what's possible to build with Wolfi for years to come.

As per their press release, they also mention that the **full-source bootstrapping for Rust and other language ecosystems will be added in the near future**.

_💬 Have you used Wolfi before? How was your experience with it?_

* * *

[![Linux Foundation Bootcamp Offer][15]][16]

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/wolfi-turns-one/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Octopus_wolfi
[2]: https://www.chainguard.dev/
[3]: https://news.itsfoss.com/content/images/size/w256h256/2022/08/android-chrome-192x192.png
[4]: https://news.itsfoss.com/content/images/2023/09/Wolfi.png
[5]: https://news.itsfoss.com/wolfi-linux-undistro/
[6]: https://github.com/wolfi-dev
[7]: https://docs.docker.com/scout/
[8]: https://snyk.io/
[9]: https://www.wiz.io/
[10]: https://itsfoss.com/rolling-release/
[11]: https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures
[12]: https://github.com/rustls/rustls
[13]: https://github.com/wolfi-dev/wolfi-act
[14]: https://www.chainguard.dev/chainguard-images
[15]: https://news.itsfoss.com/assets/images/Certs-and-Bundles-1536x864.webp
[16]: https://itsfoss.click/latest-lf-offer
