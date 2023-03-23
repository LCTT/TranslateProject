[#]: subject: "The business case for supporting EPEL"
[#]: via: "https://fedoramagazine.org/the-business-case-for-supporting-epel/"
[#]: author: "Joseph Gayoso https://fedoramagazine.org/author/joseph/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

The business case for supporting EPEL
======

![][1]

Photo by [Leone Venter][2] on [Unsplash][3]

EPEL stands for Extra Packages for Enterprise Linux. EPEL is a collection of packages built and maintained by the community for use in Red Hat Enterprise Linux (RHEL), CentOS Stream, and RHEL-like distributions like Rocky Linux and Alma Linux.

I am going to make the case that if you use EPEL as part of your organization’s infrastructure, you have an interest in keeping those packages available and as secure as they can be.

Who is this article for? I’m thinking of the team leads, managers, and directors in IT departments who make decisions about the tools their organizations have access to.

If you don’t use or know about EPEL, it’s likely that you don’t have to think about these things. In this case this article isn’t for you. However, it might contain ideas for promoting sustainable uses of free and open source software that you can apply to other situations that are more relevant to you.

### Reason 1: Unmaintained packages may be removed from EPEL

Packages must be built and maintained for them to be available to the users of every distro. If someone isn’t doing the work of maintaining the packages, those packages become increasingly out of date. Eventually they may even be removed from the repository because of the security risk. This is avoidable as long as a package has a maintainer.

If you or someone in your organization is the maintainer of a package that you use, then you don’t have to worry about it falling by the wayside and potentially becoming a vulnerability. You get to make sure that the package stays in the repo, is up to date, and remains compatible with the rest of your infrastructure or deployments. Plain and simple.

Of course there needs to be room to manage bandwidth. How critical an application is to the operations of your organization defines how important it should be for you to make sure that either you maintain it or it is being looked after. XFCE may just be a nice-to-have for you, but Ansible might be mission critical.

### Reason 2: You’re the first to have any security patches

Cyber threats continue to grow in number of exploits found and the speed at which they are exploited. Security is on every IT person’s mind. Patching vulnerabilities is something that increasingly can’t wait, and this extends to EPEL packages as well.

If you’re the maintainer for a required application, you have the ability to respond quickly to newly discovered vulnerabilities and protect your organization. Additionally, acting in your own self-interest now protects all the other organizations that also depend on that package.

### Reason 3: Everyone else who uses that package can help you keep the package running well

As the maintainer of an application, others who also use the package will alert you of bugs as they arise. These are bugs that you may not have realized were there. Arguably it may not be critical to squash bugs that you don’t experience. However, by becoming the hub for feedback for that package, you will also be smoothing out the experience for your own users who may not have thought to report the bug. You benefit from crowd-sourcing quality control.

### Reason 4: You can prepare for future releases before they come out

All future LTS releases of RHEL and RHEL-like distros will have their start as CentOS Stream. If you plan on migrating to a release that is represented by the current version of CentOS Stream, as the maintainer you can and should be building against it. This allows you to ensure continuity by packaging the application yourself for your next upgrade. You will know, ahead of time, whether your must-have packages will work in the latest release of your enterprise distro of choice.

### Reason 5: You’re contributing to the long-term confidence in EPEL as a platform

The only reason we have packages in EPEL to begin with is because individuals are volunteering their time to maintain them. In a few cases you have companies committing resources to maintain packages but they are a small minority. If people don’t believe that EPEL will stick around for as long as RHEL releases, maintainers can lose steam or burnout. By committing resources to EPEL, you are shoring up confidence in the project – confidence that can encourage other organizations and people to invest in EPEL.

### Potential solutions

If at this point you are thinking to yourself, “I would like to give back in some way, but what would that look like?”, here are some ideas. Some require lower commitment than others if you want to help but need to remain flexible about involvement.

  1. Maintain at least one package of the ones you use in your organization. The average maintainer looks after 10 packages, so covering at least one should be an easier hurdle to cross.
  2. If everything you use is already covered, find at least one package without a maintainer so that you can support other users just as other maintainers are supporting you.
  3. Report bugs for the packages you’re using.
  4. Request packages from older EPEL branches in newer EPEL branches, i.e. EPEL 9.
  5. Provide testing feedback for packages in the epel-testing repositories.
  6. Depending on the number and importance of packages you use, consider how much employee time you want to dedicate to EPEL maintenance.
  7. Integrate any EPEL maintenance you provide into the job descriptions of the responsible employees so that your team can continue being a responsible open source contributor into the future.



### Become a package maintainer

You can start by checking out the Fedora documentation on [how to become a package maintainer][4]!

If you need support, or assistance getting started, help is available in the EPEL [Matrix channel][5] (with IRC bridge). Here are other ways to [get in touch with the EPEL community][6].

### Since you’ve made it this far…

[Please take this quick survey about EPEL!][7] We’re looking for feedback on how to improve EPEL in the future.

Here are additional resources you can check out on EPEL and how you can leverage it more.

  * [What’s EPEL, and how do I use it?][8]
  * [Frequently Asked Questions (FAQ)][9]
  * [Joining the EPEL SIG][4]
  * [How can we be sure that someone will maintain the packages until end of life of the distribution the packages were built for?][10]
  * [EPEL package maintainer generic job description][11]
  * [About EPEL][12]
  * [Extra Packages for Enterprise Linux (EPEL) – Fedora Docs][13]



### What do you think?

Do you think these reasons are valid? Are there others you think should be mentioned? Do you disagree with this idea? Continue the conversation in the comments below or in the Fedora Discussion board!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/the-business-case-for-supporting-epel/

作者：[Joseph Gayoso][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/joseph/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/09/support_EPEL-816x345.jpg
[2]: https://unsplash.com/@fempreneurstyledstock?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/packages?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://docs.fedoraproject.org/en-US/epel/epel-help/
[5]: https://chat.fedoraproject.org/#/room/#epel:fedoraproject.org
[6]: https://docs.fedoraproject.org/en-US/epel/#communicating_with_the_epel_sig
[7]: https://fedoraproject.limequery.com/396386
[8]: https://www.redhat.com/en/blog/whats-epel-and-how-do-i-use-it
[9]: https://docs.fedoraproject.org/en-US/epel/epel-faq/
[10]: https://docs.fedoraproject.org/en-US/epel/epel-faq/#how_can_we_be_sure_that_someone_will_maintain_the_packages_until_end_of_life_of_the_distribution_the_packages_were_built_for
[11]: https://docs.fedoraproject.org/en-US/epel/epel-package-maintainer-generic-description/
[12]: https://docs.fedoraproject.org/en-US/epel/epel-about/
[13]: https://docs.fedoraproject.org/en-US/epel/
