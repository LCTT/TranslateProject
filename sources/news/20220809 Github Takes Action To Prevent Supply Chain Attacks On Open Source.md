[#]: subject: "Github Takes Action To Prevent Supply Chain Attacks On Open Source"
[#]: via: "https://www.opensourceforu.com/2022/08/github-takes-action-to-prevent-supply-chain-attacks-on-open-source/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Github Takes Action To Prevent Supply Chain Attacks On Open Source
======
A series of further software supply chain breaches have highlighted the essential need to secure software chains of custody in the wake of the 2020 SolarWinds cyberespionage campaign, in which Russian hackers infiltrated a widely used IT management platform and snuck contaminated upgrades into it. And since open source initiatives are fundamentally decentralised and frequently ad hoc activities, the problem is especially urgent in this context. After a slew of unsettling hacks of widely used JavaScript software packages from GitHub’s well-known “npm” registry, the business unveiled a strategy this week to provide improved open source security protections.

The code-signing platform Sigstore will be supported by GitHub, which is owned by Microsoft, for npm software packages. Code signing is akin to a digital wax seal. In order to make it considerably simpler for open source maintainers to confirm that the code they produce is the same code that ultimately ends up in the software packages that are actually being downloaded by people globally, cross-industry collaboration led to the creation of the tool.

GitHub is not the only part of the open source ecosystem, but Dan Lorenc, CEO of Chainguard, which is a co-developer of Sigstore, notes that it is a vital hub for the community because it is where the great majority of projects store and share their source code. However, developers usually visit a package management when they truly want to download open source software or tools.

By making Sigstore available to package managers, developers may handle cryptographic checks and requirements as software goes through the supply chain with the help of the Sigstore tools. This increases transparency throughout every stage of the product’s journey. Many individuals, according to Lorenc, are astounded to learn that these integrity checks haven’t been implemented yet and that a sizable portion of the open source ecosystem has long relied on blind faith. The Biden White House released an executive order in May 2021 that dealt primarily with software supply chain security.

The Linux Foundation, Google, Red Hat, Purdue University, and Chainguard all contributed to the development of Sigstore. There is now official software for signing Python package distributions using Sigstore, and Kubernetes, an open source environment for developing software, now supports it.

Sigstore relies on being free and simple to use to encourage adoption, much as the major industry push to promote HTTPS web encryption, which was made possible in large part by tools like Let’s Encrypt from the nonprofit Internet Security Research Group. According to Github, the project will begin with a proposal on how Sigstore will be implemented for npm and an open comment period to get community input on the precise deployment strategy for the tool. However, the ultimate objective is to make such code signing available to as many open source projects as possible to make supply chain attacks considerably more challenging.

“We want to see a world where eventually all software artifacts are signed and linked back to the source code,” GitHub’s Hutchings says. “That is why it is so important to build on an open technology stack like Sigstore that other packaging repositories can adopt as well.”

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/08/github-takes-action-to-prevent-supply-chain-attacks-on-open-source/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
