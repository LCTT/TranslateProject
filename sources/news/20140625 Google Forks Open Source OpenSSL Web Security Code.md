Google Forks Open Source OpenSSL Web Security Code
================================================================================
> Google's BoringSSL, a fork of the open source OpenSSL software for encrypting Web data, will spread the open source community's resources thinner.

![](http://thevarguy.com/site-files/thevarguy.com/files/imagecache/medium_img/uploads/2014/06/grayscale6jpgcropdisplay.jpg)

In the wake of [Heartbleed][1], there may soon be as many variants of the open source OpenSSL software for encrypting Web traffic as there are Pokemon characters—or something like that. A few days ago, Google (GOOG) became the latest organization to announce its own OpenSSL spin, which it's calling BoringSSL.

Google developer Adam Langley announced BoringSSL—a name he described as "aspirational," presumably because Google hopes the new software will prove more drama-free than OpenSSL—in a [blog post][2] on June 20.

Google has made its own modifications to the OpenSSL code for some time for use in Chrome and other offerings, Langley said. But going forward, the company intends to fork OpenSSL entirely to create a separate solution, a change it hopes will simplify development on Google's end.

That said, Langley emphasized that Google is "not aiming to replace OpenSSL as an open source project," and will continue sharing code with the OpenSSL developers when it will help them fix bugs in their own software. Those code contributions will be available under an [ISC license][3], a type of open source license that the [GNU folks][4]—who probably spend more time than anyone else worrying about keeping software Free—regard as essentially [kosher][5].

Yet while BoringSSL may do little to upset the Free Software crowd, it's making a confusing situation worse for the open source community. Previously, OpenSSL was the sole widely used open source solution for encrypting traffic sent to and from Web pages on millions of servers. But following the security fiasco called Heartbleed, when it became apparent that a bug (which has now been fixed) in OpenSSL allowed third parties to snoop data, consensus around OpenSSL as the best solution for implementing this very important piece of Web functionality has evaporated.

Shortly after Heartbleed, a group of open source developers forked the OpenSSL code into [LibReSSL][6] because they believe the former was "[not developed by a responsible team][7]." At the same time, the [Linux Foundation][8] and its partners are spending potentially millions of dollars trying to inject new life—and public faith—into OpenSSL through the [Core Infrastructure Initiative][9].

Now Google has gone off on in yet another direction with BoringSSL, a move that does nothing to advance faith in either OpenSSL or LibReSSL. And that means the open source community's development resources are being spread even thinner, a situation that can only be resolved if one OpenSSL-variant emerges to rule them all.

--------------------------------------------------------------------------------

via:http://thevarguy.com/open-source-application-software-companies/062314/google-forks-open-source-openssl-web-security-code-boring 

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://heartbleed.com/
[2]:https://www.imperialviolet.org/2014/06/20/boringssl.html
[3]:http://en.wikipedia.org/wiki/ISC_license
[4]:https://www.gnu.org/
[5]:https://www.gnu.org/licenses/license-list.html#ISC
[6]:http://www.libressl.org/
[7]:http://opensslrampage.org/post/82973312181/openssl-is-not-developed-by-a-responsible-team
[8]:http://linuxfoundation.org/
[9]:http://thevarguy.com/open-source-application-software-companies/053014/core-infrastructure-initiative-endorses-open-source-netwo