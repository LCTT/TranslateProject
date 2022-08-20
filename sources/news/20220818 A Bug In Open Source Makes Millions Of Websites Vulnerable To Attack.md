[#]: subject: "A Bug In Open Source Makes Millions Of Websites Vulnerable To Attack"
[#]: via: "https://www.opensourceforu.com/2022/08/a-bug-in-open-source-makes-millions-of-websites-vulnerable-to-attack/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A Bug In Open Source Makes Millions Of Websites Vulnerable To Attack
======
Experts have cautioned that hundreds of thousands of websites, including many utilising the.gov name, could suffer data loss. Git, an open source development platform, has a weakness that, if left unfixed, gives threat actors access to the kingdom’s secrets, according to cybersecurity specialists from Defense.com.

It appears that there are several.git folders that ought to be hidden but are frequently not. Although a major problem, the researchers claim that Git users’ disregard for recommended practises is more to blame. A threat actor may locate these folders and download their contents with the aid of a custom Google dork.

These folders’ files typically store the full history of the codebase, past code changes, comments, security keys, sensitive remote paths containing secrets, and plain-text password files. In addition to the apparent risk of revealing passwords and sensitive information, there is a hidden risk that hackers may analyse the code and discover more vulnerabilities that they will likely not be correcting but rather exploiting.

Additionally, these folders might have API keys and database login information, providing threat actors even more access to private user information. According to Defense.com, 332,000 websites in total, including 2,500 on the.gov domain, were identified as potentially susceptible.

“Open source(opens in new tab) technology always has the potential for security flaws, being rooted in publicly accessible code. However, this level of vulnerability is not acceptable,” commented Oliver Pinson-Roxburgh, CEO of Defense.com. “Organizations, including the UK government, must ensure they monitor their systems and take immediate steps to remediate risk.”

According to Pinson-Roxburgh, Git is a very well-liked open source version control system with more than 80 million active users, and this kind of vulnerability on such a well-liked platform can have “severe ramifications” for affected organisations.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/08/a-bug-in-open-source-makes-millions-of-websites-vulnerable-to-attack/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
