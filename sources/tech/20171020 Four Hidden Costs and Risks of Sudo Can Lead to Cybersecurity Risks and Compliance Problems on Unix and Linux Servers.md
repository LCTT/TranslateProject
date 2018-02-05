Four Hidden Costs and Risks of Sudo Can Lead to Cybersecurity Risks and Compliance Problems on Unix and Linux Servers
======
It is always a philosophical debate as to whether to use open source software in a regulated environment. Open source software is crowd sourced, and developers from all over the world contribute to packages that are later included in Operating System distributions. In the case of ‘sudo’, a package designed to provide privileged access included in many Linux distributions, the debate is whether it meets the requirements of an organization, and to what level it can be relied upon to deliver compliance information to auditors.

There are four hidden costs or risks that must be considered when evaluating whether sudo is meeting your organization’s cybersecurity and compliance needs on its Unix and Linux systems, including administrative, forensics and audit, business continuity, and vendor support. Although sudo is a low-cost solution, it may come at a high price in a security program, and when an organization is delivering compliance data to satisfy auditors. In this article, we will review these areas while identifying key questions that should be answered to measure acceptable levels of risk. While every organization is different, there are specific risk/cost considerations that make a strong argument for replacing sudo with a commercially-supported solution.

### Administrative Costs

There are several hidden administrative costs is using sudo for Unix and Linux privilege management. For example, with sudo, you also need to run a third-party automation management system (like CFEngine or Puppet) plus third party authentication modules on the box. And, if you plan to externalize the box at all, you’re going to have to replace sudo with that supplier’s version of sudo. So, you end up maintaining sudo, a third-party management system, a third-party automation system, and may have to replace it all if you want to authenticate against something external to the box. A commercial solution would help to consolidate this functionality and simplify the overall management of Unix and Linux servers.

Another complexity with sudo is that everything is local, meaning it can be extremely time-consuming to manage as environments grow. And as we all know, time is money. With sudo, you have to rely on local systems on the server to keep logs locally, rotate them, send them to an archival environment, and ensure that no one is messing with any of the other related subsystems. This can be a complex and time-consuming process. A commercial solution would combine all of this activity together, including binary pushes and retention, upgrades, logs, archival, and more.

Unix and Linux systems by their very nature are decentralized, so managing each host separately leads to administrative costs and inefficiencies which in turn leads to risks. A commercial solution centralizes management and policy development across all hosts, introducing enterprise level consistency and best practices to a privileged access management program.

### Forensics & Audit Risks

Administrative costs aside, let’s look at the risks associated with not being able to produce log data for forensic investigations. Why is this a challenge for sudo? The sudo package is installed locally on individual servers, and configuration files are maintained on each server individually. There are some tools such as Puppet or Chef that can monitor these files for changes, and replace files with known good copies when a change is detected, but those tools only work after a change takes place. These tools usually operate on a schedule, often checking once or twice per day, so if a system is compromised, or authorization files are changed, it may be several hours before the system is restored to a known good state. The question is, what can happen in those hours?

There is currently no keystroke logging within sudo, and since any logs of sudo activity are stored locally on servers, they can be tampered with by savvy administrators. Event logs are typically collected with normal system logs, but once again, this requires additional configuration and management of these tools. When advanced users are granted administrative access on servers, it is possible that log data can be modified, or deleted, and all evidence of their activities erased with very little indication that events took place. Now, the question is, has this happened, or is it continuing to happen?

With sudo, there is no log integrity – no chain of custody on logs – meaning logs can’t be non-repudiated and therefore can’t be used in legal proceedings in most jurisdictions. This is a significant risk to organizations, especially in criminal prosecution, termination, or other disciplinary actions. Third-party commercial solutions’ logs are tamper-proof, which is just not possible with sudo.

Large organizations typically collect a tremendous amount of data, including system logs, access information, and other system information from all their systems. This data is then sent to a SIEM for analytics, and reporting. SIEM tools do not usually deliver real-time alerting when uncharacteristic events happen on systems, and often configuration of events is difficult and time consuming. For this reason, SIEM solutions are rarely relied upon for alerting within an enterprise environment. Here the question is, what is an acceptable delay from the time an event takes place until someone is alerted?

Correlating log activity with other data to determine a broader pattern of abuse is also impossible with sudo. Commercial solutions gather logs into one place with searchable indices. Some commercial solutions even correlate this log data against other sources to identify uncharacteristic behavior that could be a warning that a serious security issue is afoot. Commercial solutions therefore provide greater forensic benefits than sudo.

Another gotcha with sudo is that change management processes can’t be verified. It is always a best practice to review change records, and to validate that what was performed during the change matches the implementation that was proposed. ITIL and other security frameworks require validation of change management practices. Sudo can’t do this. Commercial solutions can do this through reviewing session command recording history and file integrity monitoring without revealing the underlying session data.

There is no session recording with sudo. Session logs are one of the best forensic tools available for investigating what happened on servers. It’s human nature that people tend to be more cautious when they know they can be watched. Sudo doesn’t provide session recordings.

Finally, there is no segregation of duties with sudo. Most security and compliance frameworks require true separation of duties, and using a tool such as sudo just “skins” over the segregation of duties aspect. All of these deficiencies – lack of log integrity, lack of session monitoring, no change management – introduces risk when organizations must prove compliance or investigate anomalies.

### Business Continuity Risks

Sudo is open source. There is no indemnification if there is a critical error. Also, there is no rollback with sudo, so there is always the chance that mistakes will bring and entire system down with no one to call for support. Sure, it is possible to centralize sudo through a third-party tool such as Puppet or CFEngine, but you still end up managing multiple files across multiple groups of systems manually (or managed as one huge policy). With this approach, there is greater risk that mistakes will break every system at once. A commercial solution would have policy roll-back capability that would limit the damage done.

### Lack of Enterprise Support

Since sudo is an open source package, there is no official service level for when packages must be updated to respond to identified security flaws, or vulnerabilities. By mid-2017, there have already been two vulnerabilities identified in sudo with a CVSS score greater than six (CVE Sudo Vulnerabilities). Over the past several years, there have been a number of vulnerabilities discovered in sudo that took as many as three years to patch ([CVE-2013-2776][1] , [CVE-2013-2777][2] , [CVE-2013-1776][3]). The question here is, what exploits have been used in the past several months or years? A commercial solution that replaces sudo would eliminate this problem.

### Ten Questions to Measure Risk in Your Unix and Linux Environment

Unix and Linux systems present high-value targets for external attackers and malicious insiders. Expect to be breached if you share accounts, provide unfettered root access, or let files and sessions go unmonitored. Gaining root or other privileged credentials makes it easy for attackers to fly under the radar and access sensitive systems and data. And as we have reviewed, sudo isn’t going to help.

In balancing costs vs. an acceptable level of risk to your Unix and Linux environment, consider these 10 questions:

1. How much time are Unix/Linux admins spending just trying to keep up? Can your organization benefit from automation?

2. Are you able to keep up with the different platform and version changes to your Unix/Linux systems?

3. As you grow and more hosts are added, how much more time will admins need to keep up with policy? Is adding personnel an option?

4. What about consistency across systems? Modifying individual sudoers files with multiple admins makes that very difficult. Wouldn’t systems become siloed if not consistently managed?

5. What happens when you bring in new or different Linux or Unix platforms? How will that complicate the management of the environment?

6. How critical is it for compliance or legal purposes to know whether a policy file or log has been tampered with?

7. Do you have a way to verify that the sudoers file hasn’t been modified without permission?

8. How do you know what admins actually did once they became root? Do you have a command history for their activity?

9. What would it cost the business if a mission-critical Unix/Linux host goes down? With sudo, how quickly could the team troubleshoot and fix the problem?

10. Can you demonstrate to the board that you have a backup if there is a significant outage?

### Benefits of Using a Commercial Solution

Although they come at a higher cost than free open source solutions, commercial solutions provide an effective way to mitigate the general issues related to sudo. Solutions that offer centralized management ease the pressure on monitoring and maintaining remote systems, centralized logging of events, and keystroke recording are the cornerstone of audit expectations for most enterprises.

Commercial solutions usually have a regular release cycle, and can typically deliver patches in response to vulnerabilities in hours, or days from the time they’re reported. Commercial solutions like PowerBroker for Unix & Linux by BeyondTrust provide event logging on separate infrastructure that is inaccessible to privileged users, and this eliminates the possibility of log tampering. PowerBroker also provides strong, centralized policy controls that are managed within an infrastructure separate from systems under management; this eliminates the possibility of rogue changes to privileged access policies in server environments. Strong policy control also moves security posture from ‘Respond’ to ‘Prevent’, and advanced features provide the ability to integrate with other enterprise tools, and conditionally alert when privileged access sessions begin, or end.

### Conclusion

For organizations that are serious about incorporating a strong privileged access management program into their security program, there is no question that a commercial product delivers much better than an open source offering such as sudo. Eliminating the possibility of malicious behavior using strong controls, centralized log file collection, and centralized policy management is far better than relying on questionable, difficult to manage controls delivered within sudo. In calculating an acceptable level of risk to your tier-1 Unix and Linux systems, all of these costs and benefits must be considered.


--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/four-hidden-costs-and-risks-sudo-can-lead-cybersecurity-risks-and-compliance-problems-unix-a

作者：[Chad Erbe][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/users/chad-erbe
[1]:https://www.cvedetails.com/cve/CVE-2013-2776/
[2]:https://www.cvedetails.com/cve/CVE-2013-2777/
[3]:https://www.cvedetails.com/cve/CVE-2013-1776/
