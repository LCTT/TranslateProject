[#]: collector: (lujun9972)
[#]: translator: (windgeek)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What's the difference between DevSecOps and agile software development)
[#]: via: (https://opensource.com/article/20/7/devsecops-vs-agile)
[#]: author: (Sam Bocetta https://opensource.com/users/sambocetta)

What's the difference between DevSecOps and agile software development
======
Are you focused more on security or software delivery? Or can you have
both?
![Brick wall between two people, a developer and an operations manager][1]

There is a tendency in the tech community to use the terms DevSecOps and agile development interchangeably. While there are some similarities, such as that both aim to detect risks earlier, there are also distinctions that [drastically alter how each would work][2] in your organization.

DevSecOps built on some of the principles that agile development established. However, DevSecOps is [especially focused on integrating security features][3], while agile is focused on delivering software.

Knowing how to protect your website or application from ransomware and other threats really comes down to the software and systems development you use. Your needs may impact whether you choose to utilize DevSecOps, agile development, or both.

### Differences between DevSecOps and agile

The main distinction between these two systems comes down to one simple concept: security. Depending on your software development practices, your company's security measures—and when, where, and who implements them—may differ significantly.

Every business [needs IT security][4] to protect their vital data. Virtual private networks (VPNs), digital certificates, firewall protection, multi-factor authentication, secure cloud storage, and teaching employees about basic cybersecurity measures are all actions a business should take if it truly values IT security.

When you trust DevSecOps, you're taking your company's security and essentially making it tantamount to continuous integration and delivery. DevSecOps methodologies emphasize security at the very beginning of development and make it an integral component of overall software quality.

This is due to three major principles in DevSecOps security:

  * Balancing user access with data security
  * [Encrypting data][5] with VPN and SSL to protect it from intruders while it is in transit
  * Anticipating future risks with tools that scan new code for security flaws and notifying developers about the flaws



While DevOps has always intended to include security, not every organization practicing DevOps has kept it in mind. That is where DevSecOps as an evolution of DevOps can offer clarity. Despite the similarity of their names, the two [should not be confused][6]. In a DevSecOps model, security is the primary driving force for the organization.

Meanwhile, agile development is more focused on iterative development cycles, which means feedback is constantly integrated into continuous software development. [Agile's key principles][7] are to embrace changing environments to provide customers and clients with competitive advantages, to collaborate closely with developers and stakeholders, and to maintain a consistent focus of technical excellence throughout the process to help boost efficiency. In other words, unless an agile team includes security in its definition of excellence, security _is_ an afterthought in agile.

### Challenges for defense agencies

If there's any organization dedicated to the utmost in security, it's the U.S. Department of Defense. In 2018, the DoD published a [guide to "fake agile"][8] or "agile in name only" in software development. The guide was designed to warn DoD executives about bad programming and explain how to spot it to avoid risks.

It's not only DoD that has something to gain by using these methodologies. The healthcare and financial sectors also [maintain massive quantities][9] of sensitive data that must remain secure.

DoD's changing of the guard with its modernization strategy, which includes the adoption of DevSecOps, is essential. This is particularly pertinent in an age when even the DoD is susceptible to hacker attacks and data breaches, as evidenced by its [massive data breach][10] in February 2020.

There are also risks inherent in transferring cybersecurity best practices into real-life development. Things won't go perfectly 100% of the time. At best, things will be uncomfortable, and at worst, they could create a whole new set of risks.

Developers, especially those working on code for military software, may not have a thorough [understanding of all contexts][11] where DevSecOps should be employed. There will be a steep learning curve, but for the greater good of security, these are necessary growing pains.

### New models in the age of automation

To address growing concerns about previous security measures, DoD contractors have begun to assess the DevSecOps model. The key is deploying the methodology into continuous service delivery contexts.

There are three ways this can happen. The first involves automation, which is [already being used][12] in most privacy and security tools, including VPNs and privacy-enhanced mobile operating systems. Instead of relying on human-based checks and balances, automation in large-scale cloud infrastructures can handle ongoing maintenance and security assessments.

The second element involves the transition to DevSecOps as the primary security checkpoint. Traditionally, systems were designed with zero expectation that data would be accessible as it moves between various components.

The third and final element involves bringing corporate approaches to military software development. Many DoD contractors and employees come from the commercial sector rather than the military. Their background gives them knowledge and experience in [providing cybersecurity][13] to large-scale businesses, which they can bring into government positions.

### Challenges worth overcoming

Switching to a DevSecOps-based methodology presents some challenges. In the last decade, many organizations have completely redesigned their development lifecycles to comply with agile development practices, and making another switch so soon may seem daunting.

Businesses should gain peace of mind knowing that even the DoD has had trouble with this transition, and they're not alone in the challenges of rolling out new processes to make commercial techniques and tools more widely accessible.

Looking into the future, the switch to DevSecOps will be no more painful than the switch to agile development was. Firms have a lot to gain by acknowledging the [value of building security][4] into development workflows, as well as building upon the advantages of existing agile networks.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/devsecops-vs-agile

作者：[Sam Bocetta][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sambocetta
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/devops_confusion_wall_questions.png?itok=zLS7K2JG (Brick wall between two people, a developer and an operations manager)
[2]: https://tech.gsa.gov/guides/understanding_differences_agile_devsecops/
[3]: https://www.redhat.com/en/topics/devops/what-is-devsecops
[4]: https://www.redhat.com/en/topics/security
[5]: https://surfshark.com/blog/does-vpn-protect-you-from-hackers
[6]: https://www.infoq.com/articles/evolve-devops-devsecops/
[7]: https://enterprisersproject.com/article/2019/9/agile-project-management-explained
[8]: https://www.governmentciomedia.com/defense-innovation-board-issues-guide-detecting-agile-bs
[9]: https://www.redhat.com/en/solutions/financial-services
[10]: https://www.military.com/daily-news/2020/02/25/dod-agency-suffers-data-breach-potentially-compromising-ssns.html
[11]: https://fcw.com/articles/2020/01/23/dod-devsecops-guidance-williams.aspx
[12]: https://privacyaustralia.net/privacy-tools/
[13]: https://www.securitymagazine.com/articles/88301-cybersecurity-is-standard-business-practice-for-large-companies
