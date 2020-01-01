[#]: collector: (lujun9972)
[#]: translator: (nacyro)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (10 articles to enhance your security aptitude)
[#]: via: (https://opensource.com/article/19/12/security-resources)
[#]: author: (Ben Cotton https://opensource.com/users/bcotton)

10 articles to enhance your security aptitude
======
Whether you're learning the first steps or looking to add to your
skills, there's something for you in Opensource.com's top 10 security
articles of 2019.
![A secure lock.][1]

If security is a process (and it is), then it stands to reason that different projects (and contributors) are in different places. Some applications have years of security testing, with design done by people who have worked in information security for decades. Others are brand new projects by developers working on their first open source project. It comes as no surprise that Opensource.com's top security articles of 2019 represent this range of experience. We have articles that introduce basic security practices as well as deep dives into more advanced topics.

Whether you're learning the first steps or looking to add to your skills acquired over a storied career, there's something for you in the top 10 security articles of 2019.

### 7 steps to securing your Linux server

Security is like a house: if the foundation is bad, the rest is at risk. Patrick H. Mullins' excellent _[7 steps to securing your Linux server][2]_ gets you started with basic security steps for Linux servers. Even if you have a lot of experience administering servers, this article provides a good checklist to make sure you have the basics covered. From there, you can begin adding additional layers of security.

### Make Linux stronger with firewalls

One of the seven steps to securing your server is enabling a firewall. But what _is_ a firewall, and how does it work? Seth Kenlon answers these questions and then describes in detail how to configure your firewall for better security in _[Make Linux stronger with firewalls][3]_. Using firewalld and Network Manager, you can set different firewall configurations for different networks. This allows you to have a trusting configuration on your home network, for example, and a more paranoid configuration on your favorite coffee shop's WiFi network.

### Reducing security risks with centralized logging

Once you've secured your system, you're not done: security is a process, not a state. Part of _keeping_ systems secure is keeping an eye on what goes on. One way to do that, especially with multiple systems, is to centralize your logging. In _[Reducing security risks with centralized logging][4]_, Hannah Suarez shares how to get started (she based this article on her lightning talk at FOSDEM '19).

### Using GPG keys for SSH

Most people who use key-based authentication for SSH use SSH keys. And why wouldn't you? It's right there in the name. These are perfectly fine from a security standpoint, but if you want to make some forms of key distribution and backup easier, there's another way. Brian Exelbierd's three-part series walks through _[How to enable SSH access with a GPG subkey][5]_, _[How to import existing SSH keys][6]_, and _[How to reduce your backup needs to a single key file][7]_.

### Graphically manage SSH keys with Seahorse

Using GPG for SSH keys isn't everyone's cup of tea, but that doesn't mean you're out of luck when it comes to key management. Seahorse is a graphical tool for managing SSH keys (and other authentication methods) that is included in the GNOME desktop. Alan Formy-Duval's [_Graphically manage SSH keys with Seahorse_][8], is particularly helpful to the novice user.

### Security scanning your DevOps pipeline

Containers are everywhere these days. But what's in them? Knowing that containers meet your security policies is an important part of staying secure. Fortunately, you can use open source tools to help automate compliance checking. Jessica Cherry's (formly Repka) [_Security scanning your DevOps pipeline_][9] is a step-by-step tutorial that shows you how to use the Jenkins build system and the Anchore inspection service to create a scanning pipeline for container images and registries.

### 4 open source cloud security tools

One of the great things about cloud services is that your data can be accessed from anywhere. One of the downsides to cloud services is that your data can be accessed from anywhere. If you're using "-as-a-Service" offerings, you want to make sure they're securely configured. Anderson Silva, Alison Naylor, Travis McPeak, and Rich Monk join forces to introduce [_4 open source cloud security tools_][10] to help improve security when using GitHub and AWS. If you're looking for accidentally committed secrets—or trying to prevent them from being committed in the first place—this article has tools you can use.

### How to use OpenSSL: hashes, digital signatures, and more

Much of information security is based on math: specifically, the cryptographic functions used to encrypt data and authenticate users or file contents. After providing an introduction in [_Getting started with OpenSSL: Cryptography basics_][11], Marty Kalin digs deeper into the details of _[How to use OpenSSL: Hashes, digital signatures, and more][12]_, explaining how to use the OpenSSL utility to explore these commonly used but uncommonly understood concepts.

### Learn about computer security with the Raspberry Pi and Kali Linux

Cheap hardware and open source software make a great combination, especially for people looking to learn by doing. In this article, Anderson Silva introduces the security-oriented Kali Linux distribution in _[Learn about computer security with the Raspberry Pi and Kali Linux][13]_. It's a short article, but it's full of useful links to documentation and security-related projects that you can use with your own Raspberry Pi.

### Will quantum computing break security?

Has the rest of this article been a waste? Will quantum computing render everything we know about security obsolete? The good news is that the answer is "no," but quantum computing can still have a profound impact on security and the computing world more broadly. In _[Will quantum computing break security?][14]_ Mike Bursell examines its potential impacts—both the good news and the bad. And of course, quantum computing may make it easier to break encryption, but that doesn't matter if the baddies can't get your data in the first place.

### Looking to 2020

Security will always be important, and (as the quantum computing article suggests) the next few years will be an interesting time in the field. In 2020, Opensource.com articles will look at the leading edge of open source security and help explain the basics to the ever-growing open source community. If you have a topic you want us to cover, please share it in the comments, or—better yet— if you have an article in mind, [write for us][15].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/security-resources

作者：[Ben Cotton][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bcotton
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook2016_security_cc.png?itok=3V07Lpko (A secure lock.)
[2]: https://opensource.com/article/19/10/linux-server-security
[3]: https://opensource.com/article/19/7/make-linux-stronger-firewalls
[4]: https://opensource.com/article/19/2/reducing-security-risks-centralized-logging
[5]: https://opensource.com/article/19/4/gpg-subkeys-ssh
[6]: https://opensource.com/article/19/4/gpg-subkeys-ssh-multiples
[7]: https://opensource.com/article/19/4/gpg-subkeys-ssh-manage
[8]: https://opensource.com/article/19/4/ssh-keys-seahorse
[9]: https://opensource.com/article/19/7/security-scanning-your-devops-pipeline
[10]: https://opensource.com/article/19/9/open-source-cloud-security
[11]: https://opensource.com/article/19/6/cryptography-basics-openssl-part-1
[12]: https://opensource.com/article/19/6/cryptography-basics-openssl-part-2
[13]: https://opensource.com/article/19/3/computer-security-raspberry-pi
[14]: https://opensource.com/article/19/1/will-quantum-computing-break-security
[15]: https://opensource.com/how-submit-article
