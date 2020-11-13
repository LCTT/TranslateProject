[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to report security vulnerabilities to the Linux Foundation)
[#]: via: (https://www.linux.com/news/how-to-report-security-vulnerabilities-to-the-linux-foundation/)
[#]: author: (The Linux Foundation https://www.linuxfoundation.org/blog/2020/11/how-to-report-security-vulnerabilities-to-the-linux-foundation/)

How to report security vulnerabilities to the Linux Foundation
======

We at The Linux Foundation (LF) work to develop secure software in our foundations and projects, and we also work to secure the infrastructure we use. But we’re all human, and mistakes can happen.

So if you discover a security vulnerability in something we do, please tell us!

If you find a security vulnerability in the software developed by one of our foundations or projects, please report the vulnerability directly to that foundation or project. For example, Linux kernel security vulnerabilities should be reported to &lt;[security@kernel.org][1]&gt; as described in [security bugs][2]. If the foundation/project doesn’t state how to report vulnerabilities, please ask them to do so. In many cases, one way to report vulnerabilities is to send an email to **&lt;security@DOMAIN&gt;**.

If you find a security vulnerability in the Linux Foundation’s infrastructure as a whole, please report it to **&lt;[security@linuxfoundation.org][3]&gt;,** as noted on our [contact page][4].

For example, security researcher [Hanno Böck][5] recently alerted us that some of the retired **linuxfoundation.org** service subdomains were left delegated to some cloud services, making them potentially vulnerable to a subdomain takeover. Once we were alerted to that, the LF IT Ops Team quickly worked to eliminate the problem and will also be working on a way to monitor and alert about such problems in the future. We thank Hanno for alerting us!

We’re also working to make open source software (OSS) more secure in general. The [Open Source Security Foundation (OpenSSF)][6] is a broad initiative to secure the OSS that we all depend on. Please [check out the OpenSSF][7] if you’re interested in learning more.

**David A. Wheeler**

**Director, Open Source Supply Chain Security, The Linux Foundation**

The post [How to report security vulnerabilities to the Linux Foundation][8] appeared first on [The Linux Foundation][9].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/how-to-report-security-vulnerabilities-to-the-linux-foundation/

作者：[The Linux Foundation][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxfoundation.org/blog/2020/11/how-to-report-security-vulnerabilities-to-the-linux-foundation/
[b]: https://github.com/lujun9972
[1]: mailto:security@kernel.org
[2]: https://www.kernel.org/doc/html/latest/admin-guide/security-bugs.html
[3]: mailto:security@linuxfoundation.org
[4]: https://www.linuxfoundation.org/about/contact/
[5]: https://hboeck.de/
[6]: https://openssf.org/
[7]: https://openssf.org/getinvolved/
[8]: https://www.linuxfoundation.org/blog/2020/11/how-to-report-security-vulnerabilities-to-the-linux-foundation/
[9]: https://www.linuxfoundation.org/
