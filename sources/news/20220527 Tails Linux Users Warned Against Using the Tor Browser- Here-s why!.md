[#]: subject: "Tails Linux Users Warned Against Using the Tor Browser: Here’s why!"
[#]: via: "https://news.itsfoss.com/tails-tor-browser/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Tails Linux Users Warned Against Using the Tor Browser: Here’s why!
======
A crucial fix for a dangerous vulnerability that bypasses security in Tor browser is due to arrive in Tails 5.1. Here’s what it is all about.

![tails][1]

The developers of the security-focused portable Linux distro, **Tails**, have recently released an important advisory regarding its current release. They have warned users to avoid entering or using any personal or sensitive information while using Tor Browser on **Tails 5.0 or older**.

Tor Browser is the de-facto web browser used in Tails and helps protect the user’s identity online when connected to the Internet. It is mainly used by various journalists and activists to evade censorship. Everyday users can use it too.

### What’s the problem?

Recently, two nasty vulnerabilities have been found that enable harmful websites to steal the user’s information from other websites.

To be specific, the vulnerabilities have been identified as CVE-2022-1802 and CVE-2022-1529 in an [advisory published by Mozilla.][2]

The Tails advisory best explains this:

> “For example, after you visit a malicious website, an attacker controlling this website might access the password or other sensitive information that you send to other websites afterwards during the same Tails session.”

### Should You Stop Using Tails Linux Distro?

Not necessarily.

Other apps in Tails, especially Thunderbird, are safe to use since the JavaScript is disabled if in use.

Furthermore, you can even enable the safest security level in the Tor browser. This is preferred because the JavaScript engine gets disabled. Do note that this will make websites function improperly.

In other words, the Tails Linux distro is still safe to use if you know what you’re doing.

### A Fix is Coming Soon

Good news! Mozilla has already patched these bugs upstream and now it’s up to the Tails team when it comes to releasing the fix.

Here’s what they have stated –

> This vulnerability will be fixed in Tails 5.1 (**May 31**), but our team doesn’t have the capacity to publish an emergency release earlier.

So, your best option is to wait for the Tails 5.1 release next week. You can read the [official advisory][3] released by Tails devs to know more.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/tails-tor-browser/

作者：[Rishabh Moharir][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/05/tails-5-0-privacy-issue.jpg
[2]: https://www.mozilla.org/en-US/security/advisories/mfsa2022-19/
[3]: https://tails.boum.org/security/prototype_pollution/index.en.html
