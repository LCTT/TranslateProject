[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to contribute to Fedora)
[#]: via: (https://fedoramagazine.org/how-to-contribute-to-fedora/)
[#]: author: (Ben Cotton https://fedoramagazine.org/author/bcotton/)

How to contribute to Fedora
======

![][1]

One of the great things about open source software projects is that users can make meaningful contributions. With a large project like Fedora, there’s somewhere for almost everyone to contribute. The hard part is finding the thing that appeals to you. This article covers a few of the ways people participate in the Fedora community every day.

The first step for contributing is to [create an account][2] in the Fedora Account System. After that, you can start finding areas to contribute. This article is not comprehensive. If you don’t see something you’re interested in, check out [What Can I Do For Fedora][3] or contact the [Join Special Interest Group][4] (SIG).

### Software development

This seems like an obvious place to get started, but Fedora has an “upstream first” philosophy. That means most of the software that ends up on your computer doesn’t originate in the Fedora Project, but with other open source communities. Even when Fedora package maintainers write code to add a feature or fix a bug, they work with the community to get those patches into the upstream project.

Of course, there are some applications that are specific to Fedora. These are generally more about building and shipping operating systems than the applications that get shipped to the end users. The [Fedora Infrastructure project][5] on GitHub has several applications that help make Fedora happen.

### Packaging applications

Once software is written, it doesn’t just magically end up in Fedora. [Package maintainers are the ones who make that happen][6]. Fundamentally, the job of the package maintainer is to make sure the application successfully builds into an RPM package and to generally keep up-to-date with upstream releases. Sometimes, that’s as simple as editing a line in the RPM spec file and uploading the new source code. Other times, it involves diagnosing build problems or adding patches to fix bugs or apply configuration settings.

Packagers are also often the first point of contact for user support. When something goes wrong with an application, the user (or [ABRT][7]) will file a bug in Red Hat Bugzilla. The Fedora package maintainer can help the user diagnose the problem and either fix it in the Fedora package or help file a bug in the upstream project’s issue tracker.

### Writing

Documentation is a key part of the success of any open source project. Without documentation, users don’t know how to use the software, contributors don’t know how to submit code or run test suites, and administrators don’t know how to install and run the application. The [Fedora Documentation team][8] writes [release notes][9], [in-depth guides][10], and short “[quick docs][11]” that provide task-specific information. Multi-lingual contributors can also help with translation and localization of both the documentation and software strings by joining the [localization (L10n) team][12].

Of course, Fedora Magazine is always looking for contributors to write articles. The [Contributing page][13] has more information. **[We’re partial to this way of contributing! — ed.]**

### Testing

Fedora users have come to rely on our releases working well. While we emphasize being on the leading edge, we want to make sure releases are usable, too. The [Fedora Quality Assurance team][14] runs a broad set of test cases and ensures all of the release criteria are met before anything ships. Before each release, the team arranges test days for various components.

Once the release is out, testing continues. Each package update first goes to the [updates-testing repository][15] before being published to the main testing repository. This gives people who are willing to test the opportunity to try updates before they go to the wider community. 

### Graphic design

One of the first things that people notice when they install a new Fedora release is the desktop background. In fact, using a new desktop background is one of our release criteria. The [Fedora Design team][16] produces several backgrounds for each release. In addition, they design stickers, logos, infographics, and many other visual elements for teams within Fedora. As you contribute, you may notice that you get awarded [badges][17]; the [Badges team][18] produces the art for those.

### Helping others

Cooperative effort is a hallmark of open source communities. One of the best ways to contribute to any project is to help other users. In Fedora, that can mean answering questions on the [Ask Fedora][19] forum, the [users mailing list][20], or in the [#fedora IRC channel][21]. Many third-party social media and news aggregator sites have discussion related to Fedora where you can help out as well.

### Spreading the word

Why put so much effort into making something that no one knows about? Spreading the word helps our user and contributor communities grow. You can host a release party, speak at a conference, or share how you use Fedora on your blog or social media sites. The [Fedora Mindshare committee][22] has funds available to help with the costs of parties and other events.

### Other contributions

This article only shared a few of the areas where you can contribute to Fedora. [What Can I Do For Fedora][3] has more options. If there’s something you don’t see, you can just start doing it. If others see the value, they can join in and help you. We look forward to your contributions!

* * *

_Photo by _[_Anunay Mahajan_][23]_ on [Unsplash][24]_.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-contribute-to-fedora/

作者：[Ben Cotton][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/bcotton/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/09/how-to-contribute-816x345.jpg
[2]: https://admin.fedoraproject.org/accounts/user/new
[3]: https://whatcanidoforfedora.org/
[4]: https://fedoraproject.org/wiki/SIGs/Join
[5]: https://github.com/fedora-infra
[6]: https://fedoramagazine.org/day-life-fedora-packager/
[7]: https://abrt.readthedocs.io/en/latest/index.html
[8]: https://docs.fedoraproject.org/en-US/fedora-docs/contributing/
[9]: https://docs.fedoraproject.org/en-US/fedora/f30/release-notes/
[10]: https://docs.fedoraproject.org/en-US/fedora/f30/
[11]: https://docs.fedoraproject.org/en-US/quick-docs/
[12]: https://fedoraproject.org/wiki/L10N
[13]: https://docs.fedoraproject.org/en-US/fedora-magazine/contributing/
[14]: https://fedoraproject.org/wiki/QA
[15]: https://fedoraproject.org/wiki/QA:Updates_Testing
[16]: https://fedoraproject.org/wiki/Design
[17]: https://badges.fedoraproject.org/
[18]: https://fedoraproject.org/wiki/Open_Badges?rd=Badges
[19]: https://ask.fedoraproject.org/
[20]: https://lists.fedoraproject.org/archives/list/users%40lists.fedoraproject.org/
[21]: https://fedoraproject.org/wiki/IRC_support_sig
[22]: https://docs.fedoraproject.org/en-US/mindshare-committee/
[23]: https://unsplash.com/@anunaymahajan?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[24]: https://unsplash.com/s/photos/give?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
