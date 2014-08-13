[sailing]
How to Achieve Better Security With Proper Management of Open Source
================================================================================
![Bill Ledingham is the Chief Technology Officer (CTO) and Executive Vice President of Engineering at Black Duck Software.](http://www.linux.com/images/stories/41373/Bill-Ledingham.jpg)
Bill Ledingham is the Chief Technology Officer (CTO) and Executive Vice President of Engineering at Black Duck Software.

Companies increasingly understand that the key to developing innovative software faster and better than the competition is through the use of open source software (OSS). It’s nearly impossible to use only commercially sourced code and get your software to market with the speed and cost constraints required by today’s product life cycles. Without the ability to choose and integrate best-of-breed OSS, some of the greatest product ideas might never see the light of day.

With the use of open source, however, comes a different set of challenges. While your teams can gain speed and agility, it’s often more difficult to ascertain the code’s true origin and assure that it is secure.

As the OpenSSL Heartbleed vulnerability proved, not knowing what code is in your application or finished product can potentially create critical security threats that require time-consuming remediation efforts. Conversely, having an accurate inventory of what OSS components and versions are used and where can prove invaluable for quickly responding to and remediating vulnerabilities.

### It’s What’s Inside That Counts ###

The Heartbleed bug reminded developers and companies just how important security is. While there has been widespread debate over whether proprietary or open source software is more secure, the issue is largely moot. The reality is that code defects exist in most pieces of software, regardless of origin, and some affect security.

Security challenges can become even more complex when open source is integrated with internal, proprietary code. In addition to the obvious risk of not properly managing license compliance, tracking code origins and use throughout an organization can become very difficult, very quickly.

To have a truly accurate understanding of your potential vulnerabilities, you need to understand three things:

1. What code is in your current products and applications?
1. What code is being used in the front end of the development process and where are developers acquiring these components?
1. What components are being used at the back end of the process and where does code need to be validated before it is deployed?

### Assessing the Situation ###

All companies should check their code against common vulnerability databases, such as the United States National Institute of Standards and Technology’s [National Vulnerability Database][1] (NVD). Resources like the NVD track security vulnerabilities and provide severity rankings to help companies keep their code secure and up to date.

If you’ve never reviewed your code against a vulnerability database, it may seem like a daunting task. Fortunately, there are [tools][2] that leverage these databases to regularly and automatically identify all open source security vulnerabilities, alerting and tracking where affected components are in use and in need of remediation.

Continuously monitoring your codebase helps guarantee that unknown code is identified, code origin is understood, license information is up to date and future security vulnerabilities are quickly flagged for resolution. If your company has an accurate code inventory in place, you can easily find vulnerable code and remediate it to ensure your business – and your customers – remain secure.

### Preventing Future Problems ###

Most developers are attracted to OSS because it’s easy to access and free to acquire, usually allowing them to forgo a formal procurement process. Yet, while many development organizations have policies or guidelines for open source use, they are not always enforced and often not properly tracked. It’s important to track what code is coming into your organization, whether it’s been approved for use and where it’s used throughout your organization.

Once you know what you have, you need to establish governance. By implementing a management framework throughout the development process, you can ensure accurate descriptions of the code are captured and eliminate questions as to what code is where and whether it’s up to date. Manually managing this process is nearly impossible, which is why best-in-class companies actively manage their use of open source through automated code management and audit solutions.

Although every company and development team is different, the following processes have been proven to help organizations of all sizes manage and secure their use of OSS:

- **Automate Approvals and Cataloging** – Capture and track all relevant attributes of OSS components, assess license compliance and review possible security vulnerabilities through automated scanning, approval and inventory processes.
- 
- **Maintain Updated Code Versions** – Assess code quality and make sure your product is built using the most updated versions of the code. 
- 
- **Verify Code** – Evaluate all OSS in use; audit code for security, license, or export risk and remediate any issues.
- 
- **Ensure Compliance** – Create and implement an open source policy, establish an automated compliance process to ensure open source policies, regulations, legal obligations, etc., are followed across the organization.

### Active Management is Key ###

As the use of software across industries proliferates, open source will continue to play a crucial role in developing the newest innovations. To prevent security vulnerabilities in this increasingly complex environment, companies must actively manage the flow of open source throughout their organization and establish processes to regularly check their code against vulnerability databases for fast and easy remediation.

*Bill Ledingham is the Chief Technology Officer (CTO) and Executive Vice President of Engineering at Black Duck Software. Previously, Bill was CTO of Verdasys, a leader in information and cyber security, where he worked closely with leading Global 2000 companies and government organizations to safeguard their most sensitive information. Bill has been on the founding team of four companies, is active in the Boston start-up community, and has been a partner/investor with CommonAngels for the past 6 years.*

--------------------------------------------------------------------------------

via: http://www.linux.com/news/software/applications/782953-how-to-achieve-better-security-by-proper-management-of-open-source

作者：[Bill Ledingham][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linux.com/community/forums/person/59656
[1]:http://nvd.nist.gov/
[2]:http://www.blackducksoftware.com/oss-logistics/secure
