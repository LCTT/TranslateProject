CIP: Keeping the Lights On with Linux
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/cip-lights.jpg?itok=6LAUoIzt)

Modern civil infrastructure is all around us -- in power plants, radar systems, traffic lights, dams, weather systems, and so on. Many of these infrastructure projects exist for decades, if not longer, so security and longevity are paramount.

And, many of these systems are powered by Linux, which offers technology providers more control over these issues. However, if every provider is building their own solution, this can lead to fragmentation and duplication of effort. Thus, the primary goal of [Civil Infrastructure Platform (CIP)][1] is to create an open source base layer for industrial use-cases in these systems, such as embedded controllers and gateway devices.

“We have a very conservative culture in this area because once we create a system, it has to be supported for more than ten years; in some cases for over 60 years. That’s why this project was created, because every player in this industry had the same issue of being able to use Linux for a long time,” says Yoshitake Kobayashi is Technical Steering Committee Chair of CIP.

CIP’s concept is to create a very fundamental system to use open source software on controllers. This base layer comprises the Linux kernel and a small set of common open source software like libc, busybox, and so on. Because longevity of software is a primary concern, CIP chose Linux kernel 4.4, which is the LTS release of the kernel maintained by Greg Kroah-Hartman.

### Collaboration

Since CIP has an upstream first policy, the code that they want in the project must be in the upstream kernel. To create a proactive feedback loop with the kernel community, CIP hired Ben Hutchings as the official maintainer of CIP. Hutchings is known for the work he has done on Debian LTS release, which also led to an official collaboration between CIP and the Debian project.

Under the newly forged collaboration, CIP will use Debian LTS to build the platform. CIP will also help Debian Long Term Support (LTS) to extend the lifetime of all Debian stable releases. CIP will work closely with Freexian, a company that offers commercial services around Debian LTS. The two organizations will focus on interoperability, security, and support for open source software for embedded systems. CIP will also provide funding for some of the Debian LTS activities.

“We are excited about this collaboration as well as the CIP’s support of the Debian LTS project, which aims to extend the support lifetime to more than five years. Together, we are committed to long-term support for our users and laying the ‘foundation’ for the cities of the future.” said Chris Lamb, Debian Project Leader.

### Security

Security is the biggest concern, said Kobayashi. Although most of the civil infrastructure is not connected to the Internet for obvious security reasons (you definitely don’t want a nuclear power plant to be connected to the Internet), there are many other risks.

Just because the system itself is not connected to the Internet, that doesn’t mean it’s immune to all threats. Other systems -- like user’s laptops -- may connect to the Internet and then be plugged into the local systems. If someone receives a malicious file as an attachment with email, it can “contaminate” the internal infrastructure.

Thus, it’s critical to keep all software running on such controllers up to date and fully patched. To ensure security, CIP has also backported many components of the Kernel Self Protection project. CIP also follows one of the strictest cybersecurity standards -- IEC 62443 -- which defines processes and tests to ensure the system is more secure.

### Going forward

As CIP is maturing, it's extending its collaboration with providers of Linux. In addition to collaboration with Debian and freexian, CIP recently added Cybertrust Japan Co, Ltd., a supplier of enterprise Linux operating system, as a new Silver member.

Cybertrust joins other industry leaders, such as Siemens, Toshiba, Codethink, Hitachi, Moxa, Plat’Home, and Renesas, in their work to create a reliable and secure Linux-based embedded software platform that is sustainable for decades to come.

The ongoing work of these companies under the umbrella of CIP will ensure the integrity of the civil infrastructure that runs our modern society.

Learn more at the [Civil Infrastructure Platform][1] website.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/6/cip-keeping-lights-linux

作者：[Swapnil Bhartiya][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.cip-project.org/
