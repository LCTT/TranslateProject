[#]: collector: (lujun9972)
[#]: translator: (cool-summer-021)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Open Source Security Foundation (OpenSSF): Reflection and Future)
[#]: via: (https://www.linux.com/news/open-source-security-foundation-openssf-reflection-and-future/)
[#]: author: (The Linux Foundation https://www.linuxfoundation.org/en/blog/openssf-reflection-and-future/)

Open Source Security Foundation (OpenSSF): Reflection and Future
======

The [Open Source Software Foundation (OpenSSF)][1] officially [launched on August 3, 2020][2]. In this article, we’ll look at why the OpenSSF was formed, what it’s accomplished in its first six months, and its plans for the future.

The world depends on open source software (OSS), so OSS security is vital. Various efforts have been created to help improve OSS security. These efforts include the Core Infrastructure Initiative (CII) in the Linux Foundation, the Open Source Security Coalition (OSSC) founded by the GitHub Security Lab, and the Joint Open Source Software Initiative (JOSSI) founded by Google and others.

It became apparent that progress would be easier if these efforts merged into a single effort. The OpenSSF was created in 2020 as a merging of these three groups into “a cross-industry collaboration that brings together leaders to improve the security of open source software (OSS).”

The OpenSSF has certainly gained that “cross-industry collaboration”; its dozens of members include (alphabetically) Canonical, GitHub, Google, IBM, Intel, Microsoft, and Red Hat. Its governing board also includes a Security Community Individual Representative to represent those not represented in other ways specifically. It’s also created some structures to help people work together: it’s established active working groups, identified (and posted) its values, and agreed on its technical vision.

But none of that matters unless they actually _produce_ results. It’s still early, but they already have several accomplishments. They have released:

  * [Secure Software Development Fundamentals courses][3]. This set of 3 freely-available courses on the edX platform is for software developers to learn to develop secure software. It focuses on practical steps that any software developer can easily take, not theory or actions requiring unlimited resources.  Developers can also pay a fee to take tests to attempt to earn certificates to prove they understand the material.
  * [Security Scorecards][4]. This auto-generates a “security score” for open source projects to help users as they decide the trust, risk, and security posture for their use case.
  * [Criticality Score][5]. This project auto-generates a criticality score for open source projects based on a number of parameters. The goal is to better understand the most critical open source projects the world depends on.
  * [Security metrics dashboard][6]. This early-release work provides a dashboard of security and sustainment information about OSS projects by combining the Security ScoreCards, CII Best Practices, and other data sources.
  * [OpenSSF CVE Benchmark][7]. This benchmark consists of vulnerable code and metadata for over 200 historical JavaScript/TypeScript vulnerabilities (CVEs). This will help security teams evaluate different security tools on the market by enabling teams to determine false positive and false negative rates with real codebases instead of synthetic test code.
  * [OWASP Security Knowledge Framework (SKF)][8]. In collaboration with OWASP, this work is a knowledge base that includes projects with checklists and best practice code examples in multiple programming languages. It includes training materials for developers on how to write secure code in specific languages and security labs for hands-on work.
  * [Report on the 2020 FOSS Contributor Survey][9], The OpenSSF and the Laboratory for Innovation Science at Harvard (LISH) released a report that details the findings of a contributor survey to study and identify ways to improve OSS security and sustainability. There were nearly 1,200 respondents.



The existing [CII Best Practices badge][10] project has also been folded into the OpenSSF and continues to be improved. The project now has more Chinese translators, a new ongoing Swahili translation, and various small refinements that clarify the badging requirements.

The [November 2020 OpenSSF Town Hall][11] discussed the OpenSSF’s ongoing work. The OpenSSF currently has the following working groups:

  * Vulnerability Disclosures
  * Security Tooling
  * Security Best Practices
  * Identifying Security Threats to Open Source Projects (focusing on a metrics dashboard)
  * Securing Critical Projects
  * Digital Identity Attestation



Future potential work, other than continuously improving work already released, includes:

  * Identifying overlapping and related security requirements in various specifications to reduce duplicate effort. This is to be developed in collaboration with OWASP as lead and is termed the [Common Requirements Enumeration (CRE)][12]. The CRE is to “link sections of standard[s] and guidelines to each other, using a mutual topic identifier, enabling standard and scheme makers to work efficiently, enabling standard users to find the information they need, and attaining a shared understanding in the industry of what cyber security is.” [Source: “Common Requirements Enumeration”]
  * Establishing a website for no-install access to a security metrics OSS dashboard. Again, this will provide a single view of data from multiple data sources, including the Security Scorecards and CII Best Practices.
  * Developing improved identification of critical OSS projects. Harvard and the LF have previously worked to identify critical OSS projects. In the coming year, they will refine their approaches and add new data sources to identify critical OSS projects better.
  * Funding specific critical OSS projects to improve their security. The expectation is that this will focus on critical OSS projects that are not otherwise being adequately funded and will work to improve their overall sustainability.
  * Identifying and implementing improved, simplified techniques for digitally signing commits and verifying those identity attestations.



As with all Linux Foundation projects, the work by the OpenSSF is decided by its participants. If you are interested in the security of the OSS we all depend on, check out the OpenSSF and participate in some way. The best way to get involved is to attend the working group meetings — they are usually every other week and very casual. By working together we can make a difference. For more information, see [https://openssf.org][1]

_[**David A. Wheeler,**][13]_* Director of Open Source Supply Chain Security at the Linux Foundation***

The post [Open Source Security Foundation (OpenSSF): Reflection and Future][14] appeared first on [Linux Foundation][15].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/open-source-security-foundation-openssf-reflection-and-future/

作者：[The Linux Foundation][a]
选题：[lujun9972][b]
译者：[cool-summer-021](https://github.com/cool-summer-021)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxfoundation.org/en/blog/openssf-reflection-and-future/
[b]: https://github.com/lujun9972
[1]: https://openssf.org/
[2]: https://www.linuxfoundation.org/en/press-release/technology-and-enterprise-leaders-combine-efforts-to-improve-open-source-security/
[3]: https://openssf.org/blog/2020/10/29/announcing-secure-software-development-edx-course-sign-up-today/
[4]: https://openssf.org/blog/2020/11/06/security-scorecards-for-open-source-projects/
[5]: https://github.com/ossf/criticality_score
[6]: https://github.com/ossf/Project-Security-Metrics
[7]: https://openssf.org/blog/2020/12/09/introducing-the-openssf-cve-benchmark/
[8]: https://owasp.org/www-project-security-knowledge-framework/
[9]: https://www.linuxfoundation.org/en/press-release/new-open-source-contributor-report-from-linux-foundation-and-harvard-identifies-motivations-and-opportunities-for-improving-software-security/
[10]: https://bestpractices.coreinfrastructure.org/
[11]: https://openssf.org/blog/2020/11/23/openssf-town-hall-recording-now-available/
[12]: https://owasp.org/www-project-integration-standards/
[13]: mailto:dwheeler@linuxfoundation.org
[14]: https://www.linuxfoundation.org/en/blog/openssf-reflection-and-future/
[15]: https://www.linuxfoundation.org/
