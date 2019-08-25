[#]: collector: (lujun9972)
[#]: translator: (hopefully2333)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Is your enterprise software committing security malpractice?)
[#]: via: (https://www.networkworld.com/article/3429559/is-your-enterprise-software-committing-security-malpractice.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Is your enterprise software committing security malpractice?
======
ExtraHop discovered enterprise security and analytic software are "phoning home" and quietly uploading information to servers outside of customers' networks.
![Getty Images][1]

Back when this blog was dedicated to all things Microsoft I routinely railed against the spying aspects of Windows 10. Well, apparently that’s nothing compared to what enterprise security, analytics, and hardware management tools are doing.

An analytics firm called ExtraHop examined the networks of its customers and found that their security and analytic software was quietly uploading information to servers outside of the customer's network. The company issued a [report and warning][2] last week.

ExtraHop deliberately chose not to name names in its four examples of enterprise security tools that were sending out data without warning the customer or user. A spokesperson for the company told me via email, “ExtraHop wants the focus of the report to be the trend, which we have observed on multiple occasions and find alarming. Focusing on a specific group would detract from the broader point that this important issue requires more attention from enterprises.”

**[ For more on IoT security, read [tips to securing IoT on your network][3] and [10 best practices to minimize IoT security vulnerabilities][4]. | Get regularly scheduled insights by [signing up for Network World newsletters][5]. ]**

### Products committing security malpractice and secretly transmitting data offsite

[ExtraHop's report][6] found a pretty broad range of products secretly phoning home, including endpoint security software, device management software for a hospital, surveillance cameras, and security analytics software used by a financial institution. It also noted the applications may run afoul of Europe’s [General Data Privacy Regulation (GDPR)][7].

In every case, ExtraHop provided evidence that the software was transmitting data offsite. In one case, a company noticed that approximately every 30 minutes, a network-connected device was sending UDP traffic out to a known bad IP address. The device in question was a Chinese-made security camera that was phoning home to a known ​malicious IP address​ with ties to China.

And the camera was likely set up independently by an employee at their office for personal security purposes, showing the downside to shadow IT.

In the cases of the hospital's device management tool and the financial firm's analytics tool, those were violations of data security laws and could expose the company to legal risks even though it was happening without their knowledge.

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][8] ]**

The hospital’s medical device management product was supposed to use the hospital’s Wi-Fi network to only ensure patient data privacy and HIPAA compliance. ExtraHop noticed traffic from the workstation that was managing initial device rollout was opening encrypted SSL:443 connections to vendor-owned cloud storage, a major HIPAA violation.

ExtraHop notes that while there may not be any malicious activity in these examples, it is still in violation of the law, and administrators need to keep an eye on their networks to monitor traffic for unusual activity.

"To be clear, we don’t know why these vendors are phoning home data. The companies are all respected security and IT vendors, and in all likelihood, their phoning home of data was either for a legitimate purpose given their architecture design or the result of a misconfiguration," the report says.

### How to mitigate phoning-home security risks

To address this security malpractice problem, ExtraHop suggests companies do these five things:

  * Monitor for vendor activity: Watch for unexpected vendor activity on your network, whether they are an active vendor, a former vendor or even a vendor post-evaluation.
  * Monitor egress traffic: Be aware of egress traffic, especially from sensitive assets such as domain controllers. When egress traffic is detected, always match it to approved applications and services.
  * Track deployment: While under evaluation, track deployments of software agents.
  * Understand regulatory considerations: Be informed about the regulatory and compliance considerations of data crossing political and geographic boundaries.
  * Understand contract agreements: Track whether data is used in compliance with vendor contract agreements.



**[ Now read this: [Network World's corporate guide to addressing IoT security][9] ]**

Join the Network World communities on [Facebook][10] and [LinkedIn][11] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3429559/is-your-enterprise-software-committing-security-malpractice.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/03/cybersecurity_eye-with-binary_face-recognition_abstract-eye-100751589-large.jpg
[2]: https://www.extrahop.com/company/press-releases/2019/extrahop-issues-warning-about-phoning-home/
[3]: https://www.networkworld.com/article/3254185/internet-of-things/tips-for-securing-iot-on-your-network.html#nww-fsb
[4]: https://www.networkworld.com/article/3269184/10-best-practices-to-minimize-iot-security-vulnerabilities#nww-fsb
[5]: https://www.networkworld.com/newsletters/signup.html#nww-fsb
[6]: https://www.extrahop.com/resources/whitepapers/eh-security-advisory-calling-home-success/
[7]: https://www.csoonline.com/article/3202771/general-data-protection-regulation-gdpr-requirements-deadlines-and-facts.html
[8]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[9]: https://www.networkworld.com/article/3269165/internet-of-things/a-corporate-guide-to-addressing-iot-security-concerns.html
[10]: https://www.facebook.com/NetworkWorld/
[11]: https://www.linkedin.com/company/network-world
