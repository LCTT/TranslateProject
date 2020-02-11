[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 firewall features IT pros should know about but probably don’t)
[#]: via: (https://www.networkworld.com/article/3519854/4-firewall-features-it-pros-should-know-about-but-probably-dont.html)
[#]: author: (Zeus Kerravala https://www.networkworld.com/author/Zeus-Kerravala/)

5 firewall features IT pros should know about but probably don’t
======
As a foundational network defense, firewalls continue to be enhanced with new features, so many that some important ones that shouldn’t be get overlooked.
Natalya Burova / Getty Images

[Firewalls][1] continuously evolve to remain a staple of network security by incorporating functionality of standalone devices, embracing network-architecture changes, and integrating outside data sources to add intelligence to the decisions they make – a daunting wealth of possibilities that is difficult to keep track of.

Because of this richness of features, next-generation firewalls are difficult to master fully, and important capabilities sometimes can be, and in practice are, overlooked.

Here is a shortlist of new features IT pros should be aware of.

**[ Also see [What to consider when deploying a next generation firewall][2]. | Get regularly scheduled insights by [signing up for Network World newsletters][3]. ]**

### Also in this series:

  * [Cybersecurity in 2020: From secure code to defense in depth][4] (CSO)
  * [More targeted, sophisticated and costly: Why ransomware might be your biggest threat][5] (CSO)
  * [How to bring security into agile development and CI/CD][6] (Infoworld)
  * [UEM to marry security – finally – after long courtship][7] (Computerworld)
  * [Security vs. innovation: IT's trickiest balancing act][8] (CIO)



## Network segmentation

Dividing a single physical network into multiple logical networks is known as [network segmentation][9] in which each segment behaves as if it runs on its own physical network. The traffic from one segment can’t be seen by or passed to another segment.

This significantly reduces attack surfaces in the event of a breach. For example, a hospital could put all its medical devices into one segment and its patient records into another. Then, if hackers breach a heart pump that was not secured properly, that would not enable them to access private patient information.

It’s important to note that many connected things that make up the [internet of things][10] have older operating systems and are inherently insecure and can act as a point of entry for attackers, so the growth of IoT and its distributed nature drives up the need for network segmentation.

## Policy optimization

Firewall policies and rules are the engine that make firewalls go. Most security professionals are terrified of removing older policies because they don’t know when they were put in place or why. As a result, rules keep getting added with no thought of reducing the overall number. Some enterprises say they have millions of firewall rules in place. The fact is, too many rules add complexity, can conflict with each other and are time consuming to manage and troubleshoot.

[][11]

Policy optimization migrates legacy security policy rules to application-based rules that permit or deny traffic based on what application is being used. This improves overall security by reducing the attack surface and also provides visibility to safely enable application access. Policy optimization identifies port-based rules so they can be converted to application-based whitelist rules or add applications from a port-based rule to an existing application-based rule without compromising application availability. It also identifies over-provisioned application-based rules. Policy optimization helps prioritize which port-based rules to migrate first, identify application-based rules that allow applications that aren’t being used, and analyze rule-usage characteristics such as hit count, which compares how often a particular rule is applied vs. how often all the rules are applied.

Converting port-based rules to application-based rules improves security posture because the organization can select the applications they want to whitelist and deny all other applications. That way unwanted and potentially malicious traffic is eliminated from the network.

## Credential-theft prevention

Historically, workers accessed corporate applications from company offices. Today they access legacy apps, SaaS apps and other cloud services from the office, home, airport and anywhere else they may be. This makes it much easier for threat actors to steal credentials. The Verizon [Data Breach Investigations Report][12] found that 81% of hacking-related breaches leveraged stolen and/or weak passwords.

Credential-theft prevention blocks employees from using corporate credentials on sites such as Facebook and Twitter.  Even though they may be sanctioned applications, using corporate credentials to access them puts the business at risk.

Credential-theft prevention works by scanning username and password submissions to websites and compare those submissions to lists of official corporate credentials. Businesses can choose what websites to allow submitting corporate credentials to or block them based on the URL category of the website.

When the firewall detects a user attempting to submit credentials to a site in a category that is restricted, it can display a block-response page that prevents the user from submitting credentials. Alternatively, it can present a continue page that warns users against submitting credentials to sites classified in certain URL categories, but still allows them to continue with the credential submission. Security professionals can customize these block pages to educate users against reusing corporate credentials, even on legitimate, non-phishing sites.

## DNS security

A combination of machine learning, analytics and automation can block attacks that leverage the [Domain Name System (DNS)][13]. In many enterprises, DNS servers are unsecured and completely wide open to attacks that redirect users to bad sites where they are phished and where data is stolen. Threat actors have a high degree of success with DNS-based attacks because security teams have very little visibility into how attackers use the service to maintain control of infected devices. There are some standalone DNS security services that are moderately effective but lack the volume of data to recognize all attacks.

When DNS security is integrated into firewalls, machine learning can analyze the massive amount of network data, making standalone analysis tools unnecessary. DNS security integrated into a firewall can predict and block malicious domains through automation and the real-time analysis that finds them.  As the number of bad domains grows, machine learning can find them quickly and ensure they don’t become problems.

Integrated DNS security can also use machine-learning analytics to neutralize DNS tunneling, which smuggles data through firewalls by hiding it within DNS requests. DNS security can also find malware command-and-control servers.  It builds on top of signature-based systems to identify advanced tunneling methods and automates the shutdown of DNS-tunneling attacks.

## Dynamic user groups

It’s possible to create policies that automate the remediation of anomalous activities of workers. The basic premise is that users’ roles within a group means their network behaviors should be similar to each other. For example, if a worker is phished and strange apps were installed, this would stand out and could indicate a breach.

Historically, quarantining a group of users was highly time consuming because each member of the group had to be addressed and policies enforced individually. With dynamic user groups, when the firewall sees an anomaly it creates policies that counter the anomoly and pushes them out to the user group. The entire group is automatically updated without having to manually create and commit policies. So, for example, all the people in accounting would receive the same policy update automatically, at once, instead of manually, one at a time. Integration with the firewall enables the firewall to distribute the policies for the user group to all the other infrastructure that requires it including other firewalls, log collectors or applications. 

Firewalls have been and will continue to be the anchor of cyber security. They are the first line of defense and can thwart many attacks before they penetrate the enterprise network.  Maximizing the value of firewalls means turning on many of the advanced features, some of which have been in firewalls for years but not turned on for a variety of reasons.

Join the Network World communities on [Facebook][14] and [LinkedIn][15] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3519854/4-firewall-features-it-pros-should-know-about-but-probably-dont.html

作者：[Zeus Kerravala][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Zeus-Kerravala/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3230457/what-is-a-firewall-perimeter-stateful-inspection-next-generation.html
[2]: https://www.networkworld.com/article/3236448/lan-wan/what-to-consider-when-deploying-a-next-generation-firewall.html
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.csoonline.com/article/3519913/cybersecurity-in-2020-from-secure-code-to-defense-in-depth.html
[5]: https://www.csoonline.com/article/3518864/more-targeted-sophisticated-and-costly-why-ransomware-might-be-your-biggest-threat.html
[6]: https://www.infoworld.com/article/3520969/how-to-bring-security-into-agile-development-and-cicd.html
[7]: https://www.computerworld.com/article/3516136/uem-to-marry-security-finally-after-long-courtship.html
[8]: https://www.cio.com/article/3521009/security-vs-innovation-its-trickiest-balancing-act.html
[9]: https://www.networkworld.com/article/3016565/how-network-segmentation-provides-a-path-to-iot-security.html
[10]: https://www.networkworld.com/article/3207535/what-is-iot-the-internet-of-things-explained.html
[11]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[12]: https://enterprise.verizon.com/resources/reports/dbir/
[13]: https://www.networkworld.com/article/3268449/what-is-dns-and-how-does-it-work.html
[14]: https://www.facebook.com/NetworkWorld/
[15]: https://www.linkedin.com/company/network-world
