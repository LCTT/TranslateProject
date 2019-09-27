[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to contribute to GitLab)
[#]: via: (https://opensource.com/article/19/9/how-contribute-gitlab)
[#]: author: (Ray Paik https://opensource.com/users/rpaikhttps://opensource.com/users/barkerd427)

How to contribute to GitLab
======
Help the community by contributing to code, documentation, translations,
user experience design, and more.
![Woman programming][1]

I think many people are familiar with GitLab—the company or the software. What many may not realize is that GitLab is also an open source community that started with this [first commit][2] from our co-founder [Dmitriy Zaporozhet][3] in 2011. As a matter of fact, we have [more than 2,000 contributors][4] from the wider community who have contributed to GitLab.

The wider community contributions span code, documentation, translations, user experience design, etc. If you are interested in open source and in contributing to a complete DevOps platform, I'd like you to consider joining the GitLab community.

You can find things that you can start contributing to by looking at issues with the "[Accepting merge requests" label sorted by weight][5]. Low-weight issues will be easier to accomplish. If you find an issue that you're interested in working on, be sure to add a comment on the issue saying that you'd like to work on this, and verify that no one is already working on it. If you cannot find an issue that you are interested in but have an idea for a contribution (e.g., bug fixes, documentation update, new features, etc.), we encourage you to open a new issue or even [open a merge request][6] (MR) to start working with reviewers or other community members.

If you are interested, here are the different areas at GitLab where you can contribute and how you can get started.

### Development

Whether it's fixing bugs, adding new features, or helping with reviews, GitLab is a great open source community for developers from all backgrounds. Many contributors have started contributing to GitLab development without being familiar with languages like Ruby. You can follow the steps below to start contributing to GitLab development:

  1. For GitLab development, you should download and set up the [GitLab Development Kit][7]. The GDK README has instructions on how you can get started.
  2. [Fork the GitLab project][8] that you want to contribute to.
  3. Add the feature or fix the bug you want to work on.
  4. If you work on a feature change that impacts users or admins, please also [update the documentation][9].
  5. [Open an MR][6] to merge your code and its documentation. The earlier you open an MR, the sooner you can get feedback. You can mark your MR as a [Work in Progress][10] so that people know that you're not done yet.
  6. Add tests, if needed, as well as a [changelog entry][11] so you can be credited for your work.
  7. Make sure the test suite is passing.
  8. Wait for a reviewer. A "Community contribution" label will be added to your MR, and it will be triaged within a few days and a reviewer notified. You may need multiple reviews/iterations depending on the size of the change. If you don't hear from anyone in several days, feel free to mention the Merge Request Coaches by typing **@gitlab-org/coaches** in a comment.



### Documentation

Contributing to documentation is a great way to get familiar with the GitLab development process and to meet reviewers and other community members. From fixing typos to better organizing our documentation, you will find many areas where you can contribute. Here are the recommended steps for people interested in helping with documentation:

  1. Visit [https://docs.gitlab.com][12] for the latest GitLab documentation.
  2. If you find a page that needs improvement, click the "Edit this page" link at the bottom of the page, fork the project, and modify the documentation.
  3. Open an MR and follow the [branch-naming convention for documentation][13] so you can speed up the continuous integration process.
  4. Wait for a reviewer. A "Community contribution" label will be added to your MR and it will be triaged within a few days and a reviewer notified. If you don't hear from a reviewer in several days, feel free to mention **@gl-docsteam** in a comment.



You may also want to reference [GitLab Documentation Guidelines][9] as you contribute to documentation.

### Translation

GitLab is being translated into more than 35 languages, and this is driven primarily by wider community members. If you speak another language, you can join more than 1,500 community members who are helping translate GitLab.

The translation is managed at <https://translate.gitlab.com> using [CrowdIn][14]. First, a phrase (e.g., one that appears in the GitLab user interface or in error messages) needs to be internationalized before it can be translated. The internationalized phrases are then made available for translations on <https://translate.gitlab.com>. Here's how you can help us speak your language:

  1. Log into <https://translate.gitlab.com> (you can use your GitLab login).
  2. Find a language you'd like to contribute to.
  3. Improve existing translations, vote on new translations, and/or contribute new translations to your given language.
  4. Once your translation is approved, it will be merged into future GitLab releases.



### UX design

In order to help make a product that is easy to use and built for a diverse group of people, we welcome contributions from the wider community. You can help us better understand how you use GitLab and your needs as you work with the GitLab UX team members. Here's how you can get started:

  1. Visit the [https://design.gitlab.com][15] for an overview of GitLab's open source Design System. You may also find the [Get Started guide][16] to be helpful.
  2. Choose an [issue][17] to work on. If you can't find an issue that you are interested in, you can open a new issue to start a conversation and get early feedback.
  3. Create an MR to make changes that reflect the issue you're working on.
  4. Wait for a reviewer. A "Community contribution" label will be added to your MR, and it will be triaged within a few days and a reviewer notified. If you don't hear from anyone in several days, feel free to mention **@gitlab-com/gitlab-ux** in a comment.



### Getting help

If you need any help while contributing to GitLab, you can refer to the [Getting Help][18] section on our Contribute page for available resources. One thing I want to emphasize is that you should not feel afraid to [mention][19] people at GitLab in issues or MRs if you have any questions or if you feel like someone has not been responsive. GitLab team members should be responsive to other community members whether they work at GitLab or not.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/how-contribute-gitlab

作者：[Ray Paik][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rpaikhttps://opensource.com/users/barkerd427
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: https://gitlab.com/gitlab-org/gitlab-ce/commit/9ba1224867665844b117fa037e1465bb706b3685
[3]: https://about.gitlab.com/company/team/#dzaporozhets
[4]: https://contributors.gitlab.com
[5]: https://gitlab.com/groups/gitlab-org/-/issues?assignee_id=None&label_name%5B%5D=Accepting+merge+requests&scope=all&sort=weight&state=opened&utf8=%E2%9C%93
[6]: https://docs.gitlab.com/ee/gitlab-basics/add-merge-request.html
[7]: https://gitlab.com/gitlab-org/gitlab-development-kit
[8]: https://docs.gitlab.com/ee/workflow/forking_workflow.html#creating-a-fork
[9]: https://docs.gitlab.com/ee/development/documentation/
[10]: https://docs.gitlab.com/ee/user/project/merge_requests/work_in_progress_merge_requests.html
[11]: https://docs.gitlab.com/ee/development/changelog.html
[12]: https://docs.gitlab.com/
[13]: https://docs.gitlab.com/ee/development/documentation/index.html#branch-naming
[14]: https://crowdin.com/
[15]: https://design.gitlab.com/
[16]: https://design.gitlab.com/contribute/get-started/
[17]: https://gitlab.com/gitlab-org/gitlab-services/design.gitlab.com/issues
[18]: https://about.gitlab.com/community/contribute/#getting-help
[19]: https://docs.gitlab.com/ee/user/group/subgroups/#mentioning-subgroups
