[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 open source cloud security tools)
[#]: via: (https://opensource.com/article/19/9/open-source-cloud-security)
[#]: author: (Alison NaylorAaron Rinehart https://opensource.com/users/asnaylorhttps://opensource.com/users/ansilvahttps://opensource.com/users/sethhttps://opensource.com/users/bretthunoldtcomhttps://opensource.com/users/aaronrineharthttps://opensource.com/users/marcobravo)

4 open source cloud security tools
======
Find and eliminate vulnerabilities in the data you store in AWS and
GitHub.
![Tools in a cloud][1]

If your day-to-day as a developer, system administrator, full-stack engineer, or site reliability engineer involves Git pushes, commits, and pulls to and from GitHub and deployments to Amazon Web Services (AWS), security is a persistent concern. Fortunately, open source tools are available to help your team avoid common mistakes that could cost your organization thousands of dollars.

This article describes four open source tools that can help improve your security practices when you're developing on GitHub and AWS. Also, in the spirit of open source, I've joined forces with three security experts—[Travis McPeak][2], senior cloud security engineer at Netflix; [Rich Monk][3], senior principal information security analyst at Red Hat; and [Alison Naylor][4], principal information security analyst at Red Hat—to contribute to this article.

We've separated each tool by scenario, but they are not mutually exclusive.

### 1\. Find sensitive data with Gitrob

You need to find any potentially sensitive information present in your team's Git repos so you can remove it. It may make sense for you to use tools that are focused towards attacking an application or a system using a red/blue team model, in which an infosec team is divided in two: an attack team (a.k.a. a red team) and a defense team (a.k.a. a blue team). Having a red team to try to penetrate your systems and applications is lots better than waiting for an adversary to do so. Your red team might try using [Gitrob][5], a tool that can clone and crawl through your Git repositories looking for credentials and sensitive files.

Even though tools like Gitrob could be used for harm, the idea here is for your infosec team to use it to find inadvertently disclosed sensitive data that belongs to your organization (such as AWS keypairs or other credentials that were committed by mistake). That way, you can get your repositories fixed and sensitive data expunged—hopefully before an adversary finds them. Remember to remove not only the affected files but [also their history][6]!

### 2\. Avoid committing sensitive data with git-secrets

While it's important to find and remove sensitive information in your Git repos, wouldn't it be better to avoid committing those secrets in the first place? Mistakes happen, but you can protect yourself from public embarrassment by using [git-secrets][7]. This tool allows you to set up hooks that scan your commits, commit messages, and merges looking for common patterns for secrets. Choose patterns that match the credentials your team uses, such as AWS access keys and secret keys. If it finds a match, your commit is rejected and a potential crisis averted.

It's simple to set up git-secrets for your existing repos, and you can apply a global configuration to protect all future repositories you initialize or clone. You can also use git-secrets to scan your repos (and all previous revisions) to search for secrets before making them public.

### 3\. Create temporary credentials with Key Conjurer

It's great to have a little extra insurance to prevent inadvertently publishing stored secrets, but maybe we can do even better by not storing credentials at all. Keeping track of credentials generally—including who has access to them, where they are stored, and when they were last rotated—is a hassle. However, programmatically generating temporary credentials can avoid a lot of those issues altogether, neatly side-stepping the issue of storing secrets in Git repos. Enter [Key Conjurer][8], which was created to address this need. For more on why Riot Games created Key Conjurer and how they developed it, read _[Key conjurer: our policy of least privilege][9]_.

### 4\. Apply least privilege automatically with Repokid

Anyone who has taken a security 101 course knows that least privilege is the best practice for role-based access control configuration. Sadly, outside school, it becomes prohibitively difficult to apply least-privilege policies manually. An application's access requirements change over time, and developers are too busy to trim back their permissions manually. [Repokid][10] uses data that AWS provides about identity and access management (IAM) use to automatically right-size policies. Repokid helps even the largest organizations apply least privilege automatically in AWS.

### Tools, not silver bullets

These tools are by no means silver bullets, but they are just that: tools! So, make sure you work with the rest of your organization to understand the use cases and usage patterns for your cloud services before trying to implement any of these tools or other controls.

Becoming familiar with the best practices documented by all your cloud and code repository services should be taken seriously as well. The following articles will help you do so.

**For AWS:**

  * [Best practices for managing AWS access keys][11]
  * [AWS security audit guidelines][12]



**For GitHub:**

  * [Introducing new ways to keep your code secure][13]
  * [GitHub Enterprise security best practices][14]



Last but not least, reach out to your infosec team; they should be able to provide you with ideas, recommendations, and guidelines for your team's success. Always remember: security is everyone's responsibility, not just theirs.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/open-source-cloud-security

作者：[Alison NaylorAaron Rinehart][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/asnaylorhttps://opensource.com/users/ansilvahttps://opensource.com/users/sethhttps://opensource.com/users/bretthunoldtcomhttps://opensource.com/users/aaronrineharthttps://opensource.com/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud_tools_hardware.png?itok=PGjJenqT (Tools in a cloud)
[2]: https://twitter.com/travismcpeak?lang=en
[3]: https://github.com/rmonk
[4]: https://www.linkedin.com/in/alperkins/
[5]: https://github.com/michenriksen/gitrob
[6]: https://help.github.com/en/articles/removing-sensitive-data-from-a-repository
[7]: https://github.com/awslabs/git-secrets
[8]: https://github.com/RiotGames/key-conjurer
[9]: https://technology.riotgames.com/news/key-conjurer-our-policy-least-privilege
[10]: https://github.com/Netflix/repokid
[11]: https://docs.aws.amazon.com/general/latest/gr/aws-access-keys-best-practices.html
[12]: https://docs.aws.amazon.com/general/latest/gr/aws-security-audit-guide.html
[13]: https://github.blog/2019-05-23-introducing-new-ways-to-keep-your-code-secure/
[14]: https://github.blog/2015-10-09-github-enterprise-security-best-practices/
