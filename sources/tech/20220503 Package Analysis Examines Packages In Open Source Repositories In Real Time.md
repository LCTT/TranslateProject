[#]: subject: "Package Analysis Examines Packages In Open Source Repositories In Real Time"
[#]: via: "https://www.opensourceforu.com/2022/05/package-analysis-examines-packages-in-open-source-repositories-in-real-time/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Package Analysis Examines Packages In Open Source Repositories In Real Time
======
![openssf-logo][1]

The Open Source Security Foundation (OpenSSF) has released a beta version of a new tool that can do dynamic analysis of all packages published to prominent open source repositories. The Package Analysis project attempts to safeguard open source packages by identifying and alerting users to any malicious behaviour, with the goal of enhancing trust in open source software and bolstering the security of the software supply chain.

“The Package Analysis project seeks to understand the behavior and capabilities of packages available on open source repositories: what files do they access, what addresses do they connect to, and what commands do they run?,” the OpenSSF said.

“The project also tracks changes in how packages behave over time, to identify when previously safe software begins acting suspiciously,” the foundation’s Caleb Brown and David A. Wheeler added.

The program discovered over 200 malicious packages published to PyPI and NPM during a month-long test run, with the majority of the rogue libraries relying on dependency confusion and typosquatting assaults. Google, an OpenSSF member, has thrown its support to the Package Analysis initiative, underlining the importance of “vetting packages before they are published in order to keep users secure.”

Last year, the company’s Open Source Security Team proposed the Supply Chain Levels for Software Artifacts (SLSA) architecture to verify the integrity of software packages and prevent unauthorised changes. The development comes as the open source ecosystem is increasingly being weaponized to attack developers with malware such as cryptocurrency miners and data thieves.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/package-analysis-examines-packages-in-open-source-repositories-in-real-time/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/05/openssf-logo-696x418.jpg
