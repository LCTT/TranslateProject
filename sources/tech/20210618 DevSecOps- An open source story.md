[#]: subject: (DevSecOps: An open source story)
[#]: via: (https://opensource.com/article/21/6/open-sourcing-devsecops)
[#]: author: (Will Kelly https://opensource.com/users/willkelly)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

DevSecOps: An open source story
======
DevSecOps brings culture changes, frameworks, and tools into open source
software. To understand DevSecOps, you must understand its relationship
with open source.
![A lock on the side of a building][1]

Recent supply chain breaches, plus President Biden's new [Cybersecurity executive order][2], are bringing renewed attention to DevSecOps' value for the enterprise. DevSecOps brings culture changes, frameworks, and tools into open source software (OSS). To understand DevSecOps, you must understand its relationship with OSS.

### What is DevSecOps?

In its purest form, DevOps (which is an amalgamation of development and operations) is a methodology for breaking down the traditional silos between programmers and system administrators during the software delivery lifecycle. Corporations and government agencies adopt DevOps for various reasons, including improving software delivery velocity to serve customers better.

DevSecOps adds security into DevOps, further refining the concept to address code quality, security, and reliability assurance through automation, enabling continuous security and compliance. Organizations seeking to comply with Sarbanes Oxley (SOX), Payment Card Industry Data Security Standard (PCI DSS), FedRAMP, and similar programs are candidates for implementing DevSecOps.

For example, a federal government agency seeking [FedRAMP compliance][3] should use DevSecOps, because it enables them to bake security automation into each stage of their software development process. Likewise, a healthcare institution entrusted with sensitive personal healthcare information (PHI) needs DevSecOps to ensure its cloud applications meet HIPAA compliance requirements.

The more you move security mitigation to the left to tackle these issues in development, the more money you save. You also avoid potential negative headlines because your teams don't have to respond to issues in production, where remediation costs can soar way higher than if you caught them in your development environment.

You can treat the move from DevOps to DevSecOps as another step in the DevOps journey. But it's more like a transformation for your development organization and your entire business. Here's a typical framework:

  1. **Analyze, communicate, and educate:** This includes analyzing your development process maturity; defining DevSecOps for your organization; and fostering a DevSecOps culture with continuous feedback and interaction, team autonomy, and automation and architecture.
  2. **Integrate security into your DevOps lifecycle:** Ensure your DevOps and security teams work together.
  3. **Introduce automation into your DevOps lifecycle:** Start on small dev projects and gradually expand your automation strategy.
  4. **Collaborate on security changes to your DevOps toolchains:** Get your development and security teams working jointly on projects to harden your DevOps toolchain.
  5. **Execute on DevSecOps:** Get your teams fully engaged with your DevSecOps toolchains and new processes.
  6. **Encourage continuous learning and iteration:** Offer your developers and sysadmins training and feedback mechanisms to support developer performance and the health of your toolchains.



We're at a unique point in the history of software development, where the need to increase security and speed software development velocity is at a crossroads. While DevOps has done a lot to increase velocity, there was always more to do.

### Growth of DevSecOps

The growth of DevSecOps has been visible in compliance and security-conscious arenas. For example, it has a growing following inside the security-conscious US Department of Defense. Projects such as [Platform One][4] are setting an example of how DevSecOps practices can protect open source and cloud technologies in the most security-conscious government missions.

DevSecOps has a 20% to 50% penetration within industry, according to [Gartner's Hype Cycle for Agile and DevOps, 2020][5]. The pandemic has acted as a catalyst for DevSecOps as organizations have moved application development to the cloud.

### Challenges of DevSecOps

Even if you treat DevSecOps as another step in your DevOps journey, you can expect changes to your toolchain, roles on your DevOps and security teams, and how your groups interact. Over 60% of the respondents to [GitLab's 2021 Global DevSecOps Survey][6] report new roles and responsibilities because of DevOps, so prepare your people upfront and keep surprises to a minimum.

There is a variety of open source DevSecOps tools you can adopt to build out your DevOps pipeline, including:

  * [Alerta][7] consolidates and deduplicates alerts from multiple sources to provide quick visualizations. It integrates with Prometheus, Riemann, Nagios, and other monitoring tools and services for developers. You can use Alerta to customize alerts to meet your requirements.
  * [StackStorm][8] offers event-driven automation providing scripted remediations and responses. Some users affectionately call it the "[IFTTT][9] for ops."
  * [Grafana][10] allows you to create custom dashboards that aggregate all relevant data to visualize and query security data.
  * [OWASP Threat Dragon][11] is a web-based tool that offers system diagramming and a rules engine for modeling and mitigating threats automatically. Threat Dragon touts an easy-to-use interface and seamless integration with other software development tools.



DevSecOps brings a culture, much in the same way that DevOps does. Fostering a DevSecOps culture is about putting security first and making it everybody's job. DevSecOps organizations need to go beyond the mandatory corporate-wide online security training with canned dialogue and bring security into development and business processes.

### DevSecOps and open source risk mitigation

Businesses and even government agencies use as much as [90% open source code][12]. That sometimes accounts for hundreds of discrete libraries in a single application. There's no doubt that OSS saves DevOps teams time and money, but it may take a DevSecOps security model to mitigate OSS risk and licensing complexities.

Forty-six percent of respondents to Synopsys' [DevSecOps Practices and Open Source Management in 2020][13] survey said that media coverage of open source issues affects how they implement controls in their OSS projects. Continuing coverage of the recent supply chain breaches are amping up tech leaders' concerns about the stringency of their controls.

OSS risk mitigation strategies and DevSecOps go together in many ways, such as:

  * Begin generating a software bill of materials (SBOM) as a quality gate before OSS enters your software supply chain.
  * Give [OSS procurement][14] the same attention as you do the vetting, purchase, and intake of enterprise software by bringing in talent from your development, security, and corporate back-office teams. You can adapt your DevSecOps lifecycle to factor in your OSS procurement strategy.



### Final thoughts

DevSecOps is a noisy topic right now. Plenty of marketers are trying to put their spin on defining it to sell more products to commercial and public-sector enterprises. Even so, the relationship between OSS and DevSecOps remains clean because DevSecOps tools and strategies offer a security gate to bring OSS into the software supply chain and your DevSecOps pipeline while maintaining security and compliance from the first step in the process.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/open-sourcing-devsecops

作者：[Will Kelly][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/willkelly
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_3reasons.png?itok=k6F3-BqA (A lock on the side of a building)
[2]: https://www.whitehouse.gov/briefing-room/presidential-actions/2021/05/12/executive-order-on-improving-the-nations-cybersecurity/
[3]: https://www.fedramp.gov/faqs/
[4]: https://software.af.mil/team/platformone/
[5]: https://www.gartner.com/en/documents/3987588/hype-cycle-for-agile-and-devops-2020
[6]: https://about.gitlab.com/developer-survey/
[7]: https://alerta.io/
[8]: https://stackstorm.com/
[9]: https://ifttt.com/
[10]: https://grafana.com/
[11]: https://www.owasp.org/index.php/OWASP_Threat_Dragon
[12]: https://www.contrastsecurity.com/security-influencers/how-to-identify-remediate-oss-library-risks
[13]: https://www.synopsys.com/software-integrity/resources/analyst-reports/devsecops-practices-open-source-management.html
[14]: https://thenewstack.io/how-to-standardize-open-source-procurement-and-lower-risk-without-slowing-your-developers/
