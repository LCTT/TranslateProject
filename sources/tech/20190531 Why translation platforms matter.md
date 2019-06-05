[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why translation platforms matter)
[#]: via: (https://opensource.com/article/19/5/translation-platforms)
[#]: author: (Jean-Baptiste Holcroft https://opensource.com/users/jibec/users/annegentle/users/bcotton)

Why translation platforms matter
======
Technical considerations are not the best way to judge a good
translation platform.
![][1]

Language translation enables open source software to be used by people all over the world, and it's a great way for non-developers to get involved in their favorite projects. There are many [translation tools][2] available that you can evaluate according to how well they handle the main functional areas involved in translations: technical interaction capabilities, teamwork support capabilities, and translation support capabilities.

Technical interaction considerations include:

  * Supported file formats
  * Synchronization with the source repository
  * Automation support tools
  * Interface possibilities



Support for teamwork (which could also be called "community animation") includes how a platform:

  * Monitors changes (by a translator, on a project, etc.)
  * Follows up on updates pushed by projects
  * Displays the state of the situation
  * Enables or not review and validation steps
  * Assists in discussions between translators (from the same team and inter-languages) and with project maintainers
  * Supports global communication on the platform (news, etc.)



Translator assistance includes:

  * A clear and ergonomic interface
  * A limited number of steps to find a project and start working
  * A simple way to read the flow between translation and distribution
  * Access to a translation memory machine
  * Glossary enrichment



There are no major differences, though there are some minor ones, between source code management platforms relating to the first two functional areas. ****I suspect that the last area pertains mainly to source code. However, the data handled is quite different and users are usually much less technically sophisticated than developers, as well as more numerous.

### My recommendation

In my opinion, the GNOME platform offers the best translation platform for the following reasons:

  * Its site contains both the team organization and the translation platform. It's easy to see who is responsible and their roles on the team. Everything is concentrated on a few screens.
  * It's easy to find what to work on, and you quickly realize you'll have to download files to your computer and send them back once you modify them. It's not very sexy, but the logic is easy to understand.
  * Once you send a file back, the platform can send an alert to the mailing list so the team knows the next steps and the translation can be easily discussed at the global level (rather than commenting on specific sentences).
  * It has 297 languages.
  * It shows clear percentages on progress, both on basic sentences and advanced menus and documentation.



Coupled with a predictable GNOME release schedule, everything is available for the community to work well because the tool promotes community work.

If we look at the Debian translation team, which has been doing a good job for years translating an unimaginable amount of content for Fedora (especially news), we see there is a highly codified translation process based exclusively on emails with a manual push in the repositories. This team also puts everything into the process, rather than the tools, and—despite the considerable energy this seems to require—it has worked for many years while being among the leading group of languages.

My perception is that the primary issue for a successful translation platform is not based on the ability to make the unitary (technical, translation) work, but on how it structures and supports the translation team's processes. This is what gives sustainability.

The production processes are the most important way to structure a team; by putting them together correctly, it's easy for newcomers to understand how processes work, adopt them, and explain them to the next group of newcomers.

To build a sustainable community, the first consideration must be on a tool that supports collaborative work, then on its usability.

This explains my frustration with the [Zanata][3] tool, which is efficient from a technical and interface standpoint, but poor when it comes to helping to structure a community. GIven that translation is a community-driven process (possibly one of the most community-driven processes in open source software development), this is a critical problem for me.

* * *

_This article is adapted from "[What's a good translation platform?][4]" originally published on the Jibec Journal and is reused with permission._

Learn about seven tools and processes, both human and software, which are used to manage patch...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/translation-platforms

作者：[Jean-Baptiste Holcroft][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jibec/users/annegentle/users/bcotton
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/people_remote_teams_world.png?itok=_9DCHEel
[2]: https://opensource.com/article/17/6/open-source-localization-tools
[3]: http://zanata.org/
[4]: https://jibecfed.fedorapeople.org/blog-hugo/en/2016/09/whats-a-good-translation-platform/
