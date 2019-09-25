[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How DevOps professionals can become security champions)
[#]: via: (https://opensource.com/article/19/9/devops-security-champions)
[#]: author: (Jessica Repka https://opensource.com/users/jrepkahttps://opensource.com/users/jrepkahttps://opensource.com/users/patrickhousleyhttps://opensource.com/users/mehulrajputhttps://opensource.com/users/alanfdosshttps://opensource.com/users/marcobravo)

How DevOps professionals can become security champions
======
Breaking down silos and becoming a champion for security will help you,
your career, and your organization.
![A lock on the side of a building][1]

Security is a misunderstood element in DevOps. Some see it as outside of DevOps' purview, while others find it important (and overlooked) enough to recommend moving to [DevSecOps][2]. No matter your perspective on where it belongs, it's clear that security affects everyone.

Each year, the [statistics on hacking][3] become more alarming. For example, there's a hacker attack every 39 seconds, which can lead to stolen records, identities, and proprietary projects you're writing for your company. It can take months (and possibly forever) for your security team to discover the who, what, where, or when behind a hack.

What are operations professionals to do about these dire problems? I say it is time for us to become part of the solution by becoming security champions.

### Silos and turf wars

Over my years of working side-by-side with my local IT security (ITSEC) teams, I've noticed a great many things. A big one is that tension is very common between DevOps and security. This tension almost always stems from the security team's efforts to protect against vulnerabilities (e.g., by setting rules or disabling things) that interrupt DevOps' work and hinder their ability to deploy apps quickly.

You've seen it, I've seen it, everyone you meet in the field has at least one story about it. A small set of grudges turns into a burned bridge that takes time to repair—or the groups begin a small turf war, and the resulting silos make achieving DevOps unlikely.

### Get a new perspective

To try to break down these silos and end the turf wars, I talk to at least one person on each security team to learn about the ins and outs of daily security operations in our organization. I started doing this out of general curiosity, but I've continued because it always gives me a valuable new perspective. For example, I've learned that for every deployment that's stopped due to failed security, the ITSEC team is feverishly trying to patch 10 other problems it sees. Their brashness and quickness to react are due to the limited time they have to fix something before it becomes a large problem.

Consider the immense amount of knowledge it takes to find, analyze, and undo what has been done. Or to figure out what the DevOps team is doing—without background information—then replicate and test it. And to do all of this with their usual greatly understaffed security team.

This is the daily life of your security team, and your DevOps team is not seeing it. ITSEC's daily work can mean overtime hours and overwork to make sure that the company, its teams, and the proprietary work its teams are producing are secure.

### Ways to be a security champion

This is where being your own security champion can help. This means—for everything you work on—you must take a good, hard look at all the ways someone could log into it and what could be taken from it.

Help your security team help you. Introduce tools into your pipelines to integrate what you know will work with what they will know will work. Start with small things, such as reading up on Common Vulnerabilities and Exposures (CVEs) and adding scanning functions to your [CI/CD][4] pipelines. For everything you build, there is an open source scanning tool, and adding small open source tools (such as the ones below) can go the extra mile in the long run.

**Container scanning tools:**

  * [Anchore Engine][5]
  * [Clair][6]
  * [Vuls][7]
  * [OpenSCAP][8]



**Code scanning tools:**

  * [OWASP SonarQube][9]
  * [Find Security Bugs][10]
  * [Google Hacking Diggity Project][11]



**Kubernetes security tools:**

  * [Project Calico][12]
  * [Kube-hunter][13]
  * [NeuVector][14]



### Keep your DevOps hat on

Learning about new technology and how to create new things with it is part of the job if you're in a DevOps-related role. Security is no different. Here's my list of ways to keep up to date on the security front while keeping your DevOps hat on.

  * Read one article each week about something related to security in whatever you're working on.
  * Look at the [CVE][15] website weekly to see what's new.
  * Try doing a hackathon. Some companies do this once a month; check out the [Beginner Hack 1.0][16] site if yours doesn't and you'd like to learn more.
  * Try to attend at least one security conference a year with a member of your security team to see things from their side.



### Be a champion for good

There are several reasons you should become your own security champion. The first and foremost is to further your knowledge and advance your career. The second reason is to help other teams, foster new relationships, and break down the silos that harm your organization. Creating friendships across your organization has multiple benefits, including setting a good example of bridging teams and encouraging people to work together. You will also foster sharing knowledge throughout the organization and provide everyone with a new lease on security and greater internal cooperation.

Overall, being a security champion will lead you to be a champion for good across your organization.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/devops-security-champions

作者：[Jessica Repka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jrepkahttps://opensource.com/users/jrepkahttps://opensource.com/users/patrickhousleyhttps://opensource.com/users/mehulrajputhttps://opensource.com/users/alanfdosshttps://opensource.com/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_3reasons.png?itok=k6F3-BqA (A lock on the side of a building)
[2]: https://opensource.com/article/19/1/what-devsecops
[3]: https://hostingtribunal.com/blog/hacking-statistics/
[4]: https://opensource.com/article/18/8/what-cicd
[5]: https://github.com/anchore/anchore-engine
[6]: https://github.com/coreos/clair
[7]: https://vuls.io/
[8]: https://www.open-scap.org/
[9]: https://github.com/OWASP/sonarqube
[10]: https://find-sec-bugs.github.io/
[11]: https://resources.bishopfox.com/resources/tools/google-hacking-diggity/
[12]: https://www.projectcalico.org/
[13]: https://github.com/aquasecurity/kube-hunter
[14]: https://github.com/neuvector/neuvector-helm
[15]: https://cve.mitre.org/
[16]: https://www.hackerearth.com/challenges/hackathon/beginner-hack-10/
