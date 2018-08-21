Keeping patient data safe with open source tools
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/health_heartbeat.png?itok=P-GXea-p)

Healthcare is experiencing a revolution. In a tightly regulated and ancient industry, the use of free and open source software make it uniquely positioned to see a great deal of progress.

I work at a [scrappy healthcare startup][1] where cost savings are a top priority. Our primary challenge is how to safely and efficiently manage personally identifying information (PII), like names, addresses, insurance information, etc., and personal health information (PHI), like the reason for a recent clinical visit, under the regulations of the Health Insurance Portability and Accountability Act of 1996, [HIPAA][2], which became mandatory in the United States in 2003.

Briefly, HIPAA is a set of U.S. regulations that were created in response to the need for safety in healthcare data transmission and security. Titles 1, 3, 4, and 5 relate to the healthcare industry and insurance regulation, and Title 2 protects patient privacy and the security of the PHI/PII. Title 2 dictates how and to whom medical information can be disclosed (patients, medical providers, and relevant staff members), and it also loosely describes technological security that must be used, with many suggestions.

The law was written to manage digital data portability through some amount of time (though several updates have been added to the original legislation), but it couldn’t have anticipated the kinds of technological advancements that have been introduced, so it often lacks detail on exactly how to keep patient data safe. Auditors want to see best-effort, authentically crafted and respected documentation—an often vague but compelling and ever-present challenge. But no regulation says we can’t use open source software, which makes our lives much easier.

Our stack consists of Python, with readily available open source security and cryptography packages that are typically already baked into the requirements of Python web frameworks (which in our case is Klein, a framework built with Twisted, an asynchronous networking framework for Python). On the front end, we’ve got [AngularJS][3]. Some of the free security Python packages we use are [cryptography][4], [itsdangerous][5], [pycrypto][6], and somewhat unrelatedly, [magic-wormhole][7], a fairly cryptographically secure file sending tool that my team and I love, built on Twisted and the Python cryptography packages.

These tools are integral to our HIPAA compliance on both the front-end and server side, as described in the example below. With the maturity and funding of FOSS (shout-out to the Mozilla Foundation for [funding the PyPI project][8], the packaging repository all Python developers depend on), it’s possible for a for-profit business to not only use and contribute to a significant amount of open source but also make it secure.

One of our early challenges was how to use Amazon Web Services' (AWS) message queuer, [SQS][9] (Simple Queueing Service), to transmit data from our application server to our data interface server (before SQS encrypted traffic end to end). We separate the data intake/send instance from the web application instance to make the data and the application incommunicable to one another. This reduces the security surface should an attacker gain access. The purpose of SQS, then, is to transmit data we receive from partners for continuing care and store it temporarily in application memory, and data that we send back to our data and interface engine from the application to add to patient’s chart on the healthcare network’s medical records system.

A typical HIPAA-compliant installation requires all data in transit to be encrypted, but at the time, SQS had no HIPAA-compliant option. So we use [GNU Privacy Guard][10] (GnuPG), which can be difficult to use but is reliable and cryptographically secure when applied correctly. This ensures that any data housed on the application server for any period of time is encrypted with a key we created for this service. While data is in transit from the application to the data interface, we encrypt and decrypt it with keys that live only on the two components.

While it’s easier than ever to use open source software, we are still working on contributing back. Even as the company attorneys and marketing folks determine the best and safest way to publicize our OSS projects, we’ve had some nibbles at our pip packages and repositories from others looking for the exact solution we present. I’m excited to make the [projects][11] [we've][12] [issued][13] better known, to steward more of our open source code to those who want it, and to encourage others to contribute back in kind.

There are a number of hurdles to this innovation in healthcare, and I recommend the excellent [EMR & HIPAA][14] blog, which offers a terrific, accessible daily newsletter on how many organizations are addressing these hurdles technically, logistically, and interpersonally.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/foss-hippa-healthcare-open-source-tools

作者：[Rachel Kelly][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/rachelkelly
[1]:http://bright.md/
[2]:https://www.hhs.gov/hipaa/for-individuals/guidance-materials-for-consumers/index.html
[3]:https://angularjs.org/
[4]:https://pypi.org/project/cryptography/
[5]:https://pypi.org/project/itsdangerous/
[6]:https://pypi.org/project/pycrypto/
[7]:https://github.com/warner/magic-wormhole
[8]:http://pyfound.blogspot.com/2017/11/the-psf-awarded-moss-grant-pypi.html
[9]:https://aws.amazon.com/sqs/
[10]:https://gnupg.org/
[11]:https://github.com/Brightmd/txk8s
[12]:https://github.com/Brightmd/hoursofoperation
[13]:https://github.com/Brightmd/yamlschema
[14]:https://www.emrandhipaa.com/
