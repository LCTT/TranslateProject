[#]: subject: "SBOM – SB Doesn’t Stand for Silver Bullet"
[#]: via: "https://www.linux.com/news/sbom-sb-doesnt-stand-for-silver-bullet/"
[#]: author: "Dan Whiting https://www.linuxfoundation.org/blog/sbom-sb-doesnt-stand-for-silver-bullet/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

SBOM – SB Doesn’t Stand for Silver Bullet
======
Software Bill of Materials (SBOMs) are like ingredient labels on food. They are critical to keep consumers safe and healthy, they are somewhat standardized, but it is a lot more exciting to grow or make the food rather than the label.

### What is an SBOM?

What is an SBOM? In short, it is a way to tell another party all of the software that is used in the stack that makes up an application. One benefit of having a SBOM is you know what is in there when a vulnerability comes up. You can easily determine if you are vulnerable and where.

As modern software is built utilizing a base of software already written (no sense in recreating the wheel), it is important that all of the components don’t get lost in the shuffle. It isn’t readily apparent what a particular piece of software utilizes. So, if a vulnerability for Software A arises, you need to know, do I have that piece of software somewhere in my ecosystem, and, if so, where. Then you can remediate if you need to.

I can’t take credit for the food label analogy used in my introduction. I heard it from [Allan Friedman][1], a Senior Advisor and Strategist at the [U.S. Cybersecurity and Infrastructure Security Agency][2] (CISA) and a key SBOM advocate, when he presented about SBOMs at the RSA Conference 2022 with [Kate Stewart][3], the VP of Dependable Embedded Systems here at the Linux Foundation. Allan made the point that food labels only provide information. The consumer needs to read and understand them and take appropriate action. For instance, if they are allergic to peanuts, they can look at an ingredient label and determine if they can safely eat the food.

SBOMs are similar – they tell a person what software is used as an “ingredient” so someone can determine if they need to take action if a vulnerability arises. It isn’t a silver bullet, but it is a vital tool. Without SBOMs no one can track what component “ingredients” are in their software applications.

### SBOMs and the Software Supply Chain

Supply chains are impacting our lives more than just restricting availability of consumer goods. Software supply chains are immensely more complicated now as software is built with pre-existing components. This makes software better, more effective, more powerful, etc. But it also introduces risk as more and more parties touch a particular piece of software. Much like our world has become so interdependent, so has our software.

Understanding what is in the supply chain for our software helps us effectively secure it. When a new risk emerges, we know what we need to do.

### SBOMs and Software Security

SBOMs are increasingly being recognized as an important pillar in any comprehensive software security plan. A global [survey conducted in 2021 Q3 by the Linux Foundation][4] found that 78% of organizations responding plan to use SBOMs in 2022. Additionally, the recently published [Open Source Software Security Mobilization Plan][5] recommends SBOMs be universal and the [U.S. Executive Order on Improving the Nation’s Cybersecurity][6] requires SBOMs be provided for software purchased by the U.S. government. And, as Allan points out in his talk, “We buy everything.” The E.O. actually lays out a nice summary of SBOMs and their benefits:

The term “Software Bill of Materials” or “SBOM” means a formal record containing the details and supply chain relationships of various components used in building software. Software developers and vendors often create products by assembling existing open source and commercial software components. The SBOM enumerates these components in a product. It is analogous to a list of ingredients on food packaging. An SBOM is useful to those who develop or manufacture software, those who select or purchase software, and those who operate software. Developers often use available open source and third-party software components to create a product; an SBOM allows the builder to make sure those components are up to date and to respond quickly to new vulnerabilities. Buyers can use an SBOM to perform vulnerability or license analysis, both of which can be used to evaluate risk in a product. Those who operate software can use SBOMs to quickly and easily determine whether they are at potential risk of a newly discovered vulnerability.  A widely used, machine-readable SBOM format allows for greater benefits through automation and tool integration. The SBOMs gain greater value when collectively stored in a repository that can be easily queried by other applications and systems. Understanding the supply chain of software, obtaining an SBOM, and using it to analyze known vulnerabilities are crucial in managing risk.

Allan and Kate spent time in their talk going into the current state of SBOMs, challenges, benefits, tools available for creating and sharing SBOMs, what is a minimum SBOM, standards being developed, making them fully automated, and more. Look for some future LF Blog posts digging into these.

But there are things you can do now.

### What can you and your organization do now?

Allan and Kate laid out several things you and your organization can do, starting now. Starting within your organization:

Next week: Understand origins of software your organization is using

* Commercial: can you ask for an SBOM?
* Open source: do you have an SBOM for the binary or sources you’re importing?

Three months: Understand what SBOMs your customers will require

Expectations: which standards, dependency depth, licensing info?

Six months: Prototype and deploy

Implement SBOM through using an OSS tool and/or starting a conversation with vendor

And participate in ongoing discussions to determine best practices for the ecosystem and contribute to open source project any code developed to support SBOMs.

### But there are also steps you can take as an individual: 

Next week: Start playing with an open source SBOM tool and apply it to a repo

Three months: Have an SBOM strategy that explicitly identifies tooling needs

Six months:

Begin SBOM implementation through using an OSS tool or starting a conversation with vendor
Participate in a plugfest and try to consume another’s SBOM

And make sure to share any open source and commercial tools you find helpful and work with the tools to help harden them, test and report bugs, and push them to scale.

### How can you shape the future of SBOMs?

First, I want to highlight some upcoming opportunities they shared to help shape the future of SBOMs. CISA is running public Tooling & Implementation work stream discussions in July 2022. They are the same, but occur at different times to help accommodate more time zones:

* July 13, 2022 – 3:00-4:30 PM ET
* July 21, 2022 – 9:30-11:00 AM ET

If you want to participate, please email [SBOM@cisa.dhs.gov][7].

Additionally, there will be “[plugfests][8]” to be announced soon, and they suggested organizations already adopting SBOMs publish case studies and reference tooling workflows to help others.

### Conclusion

SBOMs are here to stay. If you aren’t already, get on the train now. It is pulling out of the station, but you still have an opportunity to help shape where it is going and how well the journey goes.

Allan’s and Kate’s slides are available [here][9]. If you registered to attend the RSA Conference, you can now watch their full presentation on demand [here][10].

### The Software Package Data ExchangeⓇ (SPDXⓇ)

The Linux Foundation hosts SPDX, which is an open standard for communicating software bill of material information, including components, licenses, copyrights, and security references. SPDX reduces redundant work by providing a common format for companies and communities to share important data, thereby streamlining and improving compliance. The SPDX specification is an international open standard (ISO/IEC 5962:2021). Learn more at [spdx.dev][11].

The post [SBOM – SB Doesn’t Stand for Silver Bullet][12] appeared first on [Linux Foundation][13].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/sbom-sb-doesnt-stand-for-silver-bullet/

作者：[Dan Whiting][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxfoundation.org/blog/sbom-sb-doesnt-stand-for-silver-bullet/
[b]: https://github.com/lkxed
[1]: https://www.linkedin.com/in/allanafriedman/
[2]: https://www.cisa.gov/
[3]: https://www.linkedin.com/in/katestewartaustin/
[4]: https://www.linuxfoundation.org/tools/the-state-of-software-bill-of-materials-sbom-and-cybersecurity-readiness/
[5]: https://openssf.org/oss-security-mobilization-plan/
[6]: https://openssf.org/blog/2021/05/14/how-lf-communities-enable-security-measures-required-by-the-us-executive-order-on-cybersecurity/
[7]: https://www.linux.com/mailto:SBOM@cisa.dhs.gov
[8]: https://en.wikipedia.org/wiki/Plugtest
[9]: https://www.linuxfoundation.org/wp-content/uploads/Tooling-up-Getting-SBOMs-to-Scale_slides.pdf
[10]: https://www.rsaconference.com/usa/agenda/session/Tooling%20up%20Getting%20SBOMs%20to%20Scale
[11]: https://spdx.dev/
[12]: https://www.linuxfoundation.org/blog/sbom-sb-doesnt-stand-for-silver-bullet/
[13]: https://www.linuxfoundation.org/
