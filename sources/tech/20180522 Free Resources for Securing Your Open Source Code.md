Free Resources for Securing Your Open Source Code
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/open-security.jpg?itok=R3M5LDrb)

While the widespread adoption of open source continues at a healthy rate, the recent [2018 Open Source Security and Risk Analysis Report][1] from Black Duck and Synopsys reveals some common concerns and highlights the need for sound security practices. The report examines findings from the anonymized data of over 1,100 commercial codebases with represented Industries from automotive, Big Data, enterprise software, financial services, healthcare, IoT, manufacturing, and more.

The report highlights a massive uptick in open source adoption, with 96 percent of the applications scanned containing open source components. However, the report also includes warnings about existing vulnerabilities. Among the [findings][2]:

  * “What is worrisome is that 78 percent of the codebases examined contained at least one open source vulnerability, with an average 64 vulnerabilities per codebase.”

  * “Over 54 percent of the vulnerabilities found in audited codebases are considered high-risk vulnerabilities.”

  * Seventeen percent of the codebases contained a highly publicized vulnerability such as Heartbleed, Logjam, Freak, Drown, or Poodle.




"The report clearly demonstrates that with the growth in open source use, organizations need to ensure they have the tools to detect vulnerabilities in open source components and manage whatever license compliance their use of open source may require," said Tim Mackey, technical evangelist at Black Duck by Synopsys.

Indeed, with ever more impactful security threats emerging,the need for fluency with security tools and practices has never been more pronounced. Most organizations are aware that network administrators and sysadmins need to have strong security skills, and, in many cases security certifications. [In this article,][3] we explored some of the tools, certifications and practices that many of them wisely embrace.

The Linux Foundation has also made available many informational and educational resources on security. Likewise, the Linux community offers many free resources for specific platforms and tools. For example, The Linux Foundation has published a [Linux workstation security checklist][4] that covers a lot of good ground. Online publications ranging from the [Fedora security guide][5] to the[Securing Debian Manual][6] can also help users protect against vulnerabilities within specific platforms.

The widespread use of cloud platforms such as OpenStack is also stepping up the need for cloud-centric security smarts. According to The Linux Foundation’s[Guide to the Open Cloud][7]: “Security is still a top concern among companies considering moving workloads to the public cloud, according to Gartner, despite a strong track record of security and increased transparency from cloud providers. Rather, security is still an issue largely due to companies’ inexperience and improper use of cloud services.”

For both organizations and individuals, the smallest holes in implementation of routers, firewalls, VPNs, and virtual machines can leave room for big security problems. Here is a collection of free tools that can plug these kinds of holes:

  * [Wireshark][8], a packet analyzer

  * [KeePass Password Safe][9], a free open source password manager

  * [Malwarebytes][10], a free anti-malware and antivirus tool

  * [NMAP][11], a powerful security scanner

  * [NIKTO][12], an open source web server scanner

  * [Ansible][13], a tool for automating secure IT provisioning

  * [Metasploit][14], a tool for understanding attack vectors and doing penetration testing




Instructional videos abound for these tools. You’ll find a whole[tutorial series][15] for Metasploit, and [video tutorials][16] for Wireshark. Quite a few free ebooks provide good guidance on security as well. For example, one of the common ways for security threats to invade open source platforms occurs in M&A scenarios, where technology platforms are merged—often without proper open source audits. In an ebook titled [Open Source Audits in Merger and Acquisition Transactions][17], from Ibrahim Haddad and The Linux Foundation, you’ll find an overview of the open source audit process and important considerations for code compliance, preparation, and documentation.

Meanwhile, we’ve[previously covered][18] a free ebook from the editors at[The New Stack][19] called Networking, Security & Storage with Docker & Containers. It covers the latest approaches to secure container networking, as well as native efforts by Docker to create efficient and secure networking practices. The ebook is loaded with best practices for locking down security at scale.

All of these tools and resources, and many more, can go a long way toward preventing security problems, and an ounce of prevention is, as they say, worth a pound of cure. With security breaches continuing, now is an excellent time to look into the many security and compliance resources for open source tools and platforms available. Learn more about security, compliance, and open source project health [here][20].

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/5/free-resources-securing-your-open-source-code

作者：[Sam Dean][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/sam-dean
[1]:https://www.blackducksoftware.com/open-source-security-risk-analysis-2018
[2]:https://www.prnewswire.com/news-releases/synopsys-report-finds-majority-of-software-plagued-by-known-vulnerabilities-and-license-conflicts-as-open-source-adoption-soars-300648367.html
[3]:https://www.linux.com/blog/sysadmin-ebook/2017/8/future-proof-your-sysadmin-career-locking-down-security
[4]:http://go.linuxfoundation.org/ebook_workstation_security
[5]:https://docs.fedoraproject.org/en-US/Fedora/19/html/Security_Guide/index.html
[6]:https://www.debian.org/doc/manuals/securing-debian-howto/index.en.html
[7]:https://www.linux.com/publications/2016-guide-open-cloud
[8]:https://www.wireshark.org/
[9]:http://keepass.info/
[10]:https://www.malwarebytes.com/
[11]:http://searchsecurity.techtarget.co.uk/tip/Nmap-tutorial-Nmap-scan-examples-for-vulnerability-discovery
[12]:https://cirt.net/Nikto2
[13]:https://www.ansible.com/
[14]:https://www.metasploit.com/
[15]:http://www.computerweekly.com/tutorial/The-Metasploit-Framework-Tutorial-PDF-compendium-Your-ready-reckoner
[16]:https://www.youtube.com/watch?v=TkCSr30UojM
[17]:https://www.linuxfoundation.org/resources/open-source-audits-merger-acquisition-transactions/
[18]:https://www.linux.com/news/networking-security-storage-docker-containers-free-ebook-covers-essentials
[19]:http://thenewstack.io/ebookseries/
[20]:https://www.linuxfoundation.org/projects/security-compliance/
