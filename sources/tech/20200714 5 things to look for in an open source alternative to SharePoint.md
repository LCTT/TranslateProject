[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 things to look for in an open source alternative to SharePoint)
[#]: via: (https://opensource.com/article/20/7/sharepoint-alternative)
[#]: author: (Will Kelly https://opensource.com/users/willkelly)

5 things to look for in an open source alternative to SharePoint
======
If you're considering an open source collaboration platform to meet your
remote workforce's needs, here are five things to keep in mind.
![Digital images of a computer desktop][1]

We're entering a collaboration platform renaissance as remote work becomes the norm for enterprises large and small. [Microsoft SharePoint][2]—a collaboration platform available on premises or in the cloud—is the de-facto standard for corporations and government agencies. However, SharePoint implementations are infamous for the [challenges][3] that prevent their completion. Combine those common speedbumps with shrinking IT budgets and rising collaboration requirements because of remote work, and open source alternatives to SharePoint become well worth a look.

Here are five things to consider in an open source alternative to SharePoint.

### Is it easy to install, set up, and use in the cloud?

Looking beyond installation and initial configuration, you want an open source alternative that's easy to set up. Treat open source collaboration tools as something you must take responsibility for, particularly in setup and user support, whether you have your IT department's approval or you're going shadow IT.

Chances are you'll be installing the platform in a public or private cloud space, so look for an open source collaboration platform that's cloud-friendly. For example, if your organization is running Amazon Web Services (AWS), you can install open source wikis, including [MediaWiki][4], [DokuWiki][5], and [TikiWiki][6], from the AWS Marketplace. After installing them, you can get an idea of how much using the platform will affect your organization's cloud bill.

### Is it friendly to end-users?

Show me a complex collaboration site, and I'll show you the developers and other staff who are doing their darndest to work around it. You don't want to make this mistake.

Keep it simple if you want to spin up an open source collaboration platform to replace or augment SharePoint for your remote workers. The easier the collaboration platform is for your users, the better chance you have of winning them over as allies.

With features like a Configure Sites wizard, TikiWiki is an example of an open source collaboration platform that's end-user friendly.

### Are the content-editing tools easy to use?

Editing options are a major benefit to the diverse communities of open source contributors building these technologies. MediaWiki is one example of how open source collaboration platforms approach authoring tools. The project has an [Editing team][7] that focuses just on editing and authoring tools. Some of its projects include [WikiEditor][8], [VisualEditor][9], and [CodeEditor][10] extensions. You're bound to find an editor that fits your users' workstyle.

This feature becomes especially important for developers, who have been known to rebel against SharePoint because it lacks Markdown support. Get feedback from your developers about their authoring needs. If Markdown is one of their requirements, make sure you choose an open source collaboration platform that supports it.

Also be sure to follow open source adoption best practices by ensuring the technology has an active community. For example, some DokuWiki editor plugins, such as [Ace Editor][11] and [Editor Plugin][12], haven't been updated in years.

### What kind of access control is available to protect content?

If you're dealing with project documentation or any type of sensitive corporate information, examine the access control options in any open source collaboration platform you're considering. Look for support for read-only pages and access-control lists (ACLs).

Open source wikis are open by default. That's not necessarily a bad thing, depending on your security posture. SharePoint permissions are a [known trouble spot][13], even in the eyes of SharePoint experts. In contrast, DokuWiki has a well-documented [ACL feature][14].

### Is it integration-friendly for your organization?

Even if you're moving to an open source collaboration platform as a last-minute replacement for an ailing SharePoint implementation, you can't ignore your integration requirements.

MediaWiki and TikiWiki use a MySQL backend. DokuWiki doesn't require a database; it uses plain text files. Databases can be an integration consideration, based on your team members' database chops.

Integration with an authentication backend such as LDAP will also be necessary for some organizations. Security and compliance people get worried about new platforms that aren't aligned with corporate standards. Users often resent having yet another password to remember.

### Deploy with care

Open source collaboration alternatives have a unique growth opportunity, as organizations find their once-ignored collaboration tools aren't serving their burgeoning remote workforces. Regardless of your goals, deploy your open source SharePoint alternative with care.

Have you moved to an open source collaboration platform to better serve your remote workers? If so, please share your experiences in the comments.

Sandstorm's Jade Wang shares some of her favorite open source web apps that are self-hosted...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/sharepoint-alternative

作者：[Will Kelly][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/willkelly
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_browser_web_desktop.png?itok=Bw8ykZMA (Digital images of a computer desktop)
[2]: https://www.microsoft.com/en-us/microsoft-365/sharepoint/collaboration
[3]: https://sharepointmaven.com/sharepoint-implementation-failed/
[4]: https://www.mediawiki.org/wiki/MediaWiki
[5]: https://www.dokuwiki.org/
[6]: https://tiki.org/HomePage
[7]: https://www.mediawiki.org/wiki/Editing_team
[8]: https://www.mediawiki.org/wiki/Extension:WikiEditor
[9]: https://www.mediawiki.org/wiki/Extension:VisualEditor
[10]: https://www.mediawiki.org/wiki/Extension:CodeEditor
[11]: https://www.dokuwiki.org/plugin:aceeditor
[12]: https://www.dokuwiki.org/plugin:editor
[13]: https://www.varonis.com/blog/why-do-sharepoint-permissions-cause-so-much-trouble/
[14]: https://www.dokuwiki.org/acl
