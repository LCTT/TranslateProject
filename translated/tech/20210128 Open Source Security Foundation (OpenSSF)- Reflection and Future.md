[#]: collector: (lujun9972)
[#]: translator: (cool-summer-021)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Open Source Security Foundation (OpenSSF): Reflection and Future)
[#]: via: (https://www.linux.com/news/open-source-security-foundation-openssf-reflection-and-future/)
[#]: author: (The Linux Foundation https://www.linuxfoundation.org/en/blog/openssf-reflection-and-future/)

开源安全基金会（OpenSSF）：回顾和展望
======

[开源软件基金会(OpenSSF)][1]正式[成立于2020年8月3日][2]。本文将讨论 OpenSSF 创立的初衷，它成立之初六个月内的成就，以及它未来的愿景。

全世界都在推行开源（OSS）理念，所以开源软件的安全也至关重要。为了提升开源软件的安全性，业界已经做了大量工作，并取得了一些成果。这些成果包括：Linux 基金会的核心基础设施计划（CII）、GitHub 安全实验室的开源安全联盟（OSSC）和由 Google 以及其他公司创立的联合开源软件计划（JOSSI）。 

显然，如果这些成果合为一体，软件行业将发展得更加顺利。这三项成果在 2020 年合并为“旨在促进开源软件安全性的、由各行业巨头主导的跨行业联盟”。 

OpenSSF的确受益于这种“跨行业联盟”；它有几十个成员，包括 Canonical, GitHub, Google, IBM, Intel, Microsoft 和 Red Hat。联盟的理事会成员还包括安全社区个人代表，这些个人代表是那些不能以企业名义作为联盟成员的个人。该联盟也创造了一些便于人们合作的组织结构：建立一些活跃的工作组，这种工作组需要确定(并公布)它存在的价值，其中的成员应当就该组织的技术愿景形成一致意见。

但是这并不重要，除非它们有实际成果。当时虽然处于早期，它们也确实取得了一些成果。它们发布了：

  * [安全软件开发基础课程][3]。在开放在线课堂平台有3门免费课程，旨在教授软件开发人员软件安全方面的知识。这些课程注重实际操作，任何开发人员都可以较轻松地学习，而不是那些需要耗费大量资源的理论或案例。开发人员也可以付费进行测试，从而获得认证，表明自己掌握了这些课程地内容。
  * [安全评分卡][4]。为开源项目自动生成“安全分数”，帮助用户进行信任、风险和安全方面的决策。
  * [临界分数][5]。基于一些参数，为开源项目自动生成临界分数。临界分数可以让人们对世界上最重要的开源项目有更好的理解。
  * [安全度量仪表盘][6]。这是较早时候发布的成果，它结合安全评分卡、CII 最佳实践和其他数据来源，提供与 OSS 项目有关的安全和支持信息的仪表盘。
  * [OpenSSF CVE基准测试][7]。基准测试由超过200个历史JavaScript/TypeScript漏洞(CVE)的脆弱代码和元数据组成。这将帮助安全团队评估市场上的各种安全工具，使他们能够用真实的代码库(而不是合成的测试代码)确定假阳性和假阴性率。
  * [OWASP 安全知识框架][8]。由于与 OWASP 的合作，这项成果是一个知识库，它包含了带检查清单的项目和使用多种编程语言的最佳代码样例。它还提供针对开发者的如何使用特定的语言编写安全代码的培训材料，以及用于实际操作的安全实验室。
  * 2020 年自由/开源软件贡献者调查报告，OpenSSF 和 LISH 发布了一份报告，其中详细说明了对开源软件贡献者的调查结果，并以此为依据，研究和确定提高OSS安全性和可持续性的方法。一共调查了1200名受访者。



现有的 [CII 最佳实践徽章][10] 项目已经与 OpenSSF合并，将继续升级。现在项目有很多中文译者，翻译为斯瓦希里语的工作也在进行中，项目也进行了很多小改进，详细阐明获得徽章的要求。

2020年11月举行的 OpenSSF 大会讨论了 OpenSSF 正在进行中的工作。最近，OpenSSF 有这些工作组:

  * 系统的脆弱性信息披露
  * 安全工具
  * 安全最佳实践
  * 对开源项目安全漏洞的识别（重点关注指标仪表盘）
  * 对关键项目的保障
  * 数字身份认证



除了持续更新已发布的项目，未来可能的工作还包括：

  * 为减少重复工作，在多种技术指标中确定哪些是重复和关联的安全需求。这就是作为领导者与 OWASP 协作开发，也称为[通用需求枚举(CRE)][12]。CRE 旨在使用一种公共主题标识符将标准和指南的各个部分联系起来，这种公共主题标识符的作用是令标准和方案制定者高效工作，令标准使用者能搜索到需要的信息，从而使双方对网络安全有相同的理解。
  * 建一个网站，提供对安全度量仪表盘的免安装访问。再次强调，这将会提供各种来源（包括安全计分卡和CII 最佳实践）的数据的简单展示。
  * 开发对关键 OSS 项目的识别功能。哈佛大学和LF已经做过一些识别关键 OSS 项目的工作。未来一年内，他们会改进方法，添加新的数据来源，从而更好地进行鉴别工作。
  * 资助一些关键的OSS项目，提高它们的安全性。预期将关注那些财力不足的项目，帮助这些项目提升整体性能。
  * 识别和实现已改进和简化的技术，用于数字签名的提交和对身份的校验。



跟所有的 Linux 基金会项目一样，OpenSSF 的工作是由其成员决定的。如果你对大家所依赖的 OSS 安全有兴趣，你可以访问 OpenSSF网站并以某种方式加入它们。参与的最好方式是出席工作组会议——会议每隔一周就举行，而且非常随意。通过合作，我们可以有所作为。欲了解更多信息，可以访问 [https://openssf.org][1]。

_[**David A. Wheeler,**][13]_* Director of Open Source Supply Chain Security at the Linux Foundation***

[本文][14] 首次发表于 [Linux 基金会网站][15].

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
