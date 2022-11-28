[#]: subject: "Anaconda Web UI preview image now public!"
[#]: via: "https://fedoramagazine.org/anaconda-web-ui-preview-image-now-public/"
[#]: author: "Jiří Konečný https://fedoramagazine.org/author/jkonecny/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Anaconda Web UI preview image now public!
======

We are excited to announce the first public preview image of the new Anaconda web interface!  Our vision is to reimagine and modernize our installer’s user experience (see our blog post [“Anaconda is getting a new suit”][1]). We are doing this by redesigning the user experience on all fronts to make it more easy and approachable for everyone to use.

Today, we would like to introduce our [plans][2] for the public preview release, as our new project has already reached a point where core code functionality is already developed and the new interface can be used for real installations. 

So, we’re giving you something to play with! 🙂

![Installation progress of the preview image][3]

## Why public preview image?

By giving you a working ISO as soon as we can, you have the opportunity to help us to define this new UI. This task allows us to rethink what we have and find new ways to overcome the challenges of the UI instead of re-creating what we had already. Please take this opportunity and reach us with your feedback to help us to create the best OS installer ever!

Please let us know what you require from Anaconda. **What** featuresare important to you and **why** are these important? That will allow us to prioritize our focus on development and design. See below for[how to contact us][4].

## How to get public preview image?

Download the Anaconda preview image [here][5]. 

Thanks a lot to the [Image Builder][6] team for providing us with a way to build ISO with the Fedora 37 Workstation GA content. We are planning to provide additional images with an updated installer to give you the newest features and fixes with the link above. There are no updates to the installation payload (installed system data) yet. We will announce important updates of the ISO image by sending mail to [anaconda-devel@lists.fedoraproject.org][7] with CC to [devel@lists.fedoraproject.org][8]. Please subscribe to either of these to get information about the news. This way we will be able to iterate on your feedback.

## What you will get with the preview ISO

The ISO will allow you to install the system and let you get a taste of the new UI, so you can provide us early feedback. However, it is pretty early in the development cycle. We advise you to not use this ISO to install critical infrastructure or machines where you have important data.

Let’s go to the more interesting part of what you can do with the ISO:

- Choose installation language
- Select your disks
- Automatically partition the disks. **BEWARE! This will erase everything on the selected disks.**
- Automatically install Fedora 37 GA Workstation system
- Basic review screen of your selections
- Installation progress screen
- Built-in help (on Installation destination screen only)

### Known issues:

- In the bootloader menu you’ll see “Install Fedora 38”, it’s expected because the installation environment is from Rawhide. However, the content installed will be Fedora 37 GA, so don’t worry.
- Virtual Box on Mac might have resolution issues. We are working on resolving this issue.
- Aspect ratio and window handling. We know we need to solve this better, feedback is welcome.

## How to provide feedback?

Your feedback is critical to have a project which you and we can be proud of, so please share it with us. To give us feedback:

- Use our [GitHub repository discussions][9]
- Send mail to the [anaconda-devel@lists.fedoraproject.org][7] mailing list

Please take your time to play with the UI and tell us what you think. What works great, what is not working and what you would like to have. Ideally, follow future updates and tell us if the situation is better or worse. 

We are really counting on your feedback and we are thankful to have you all supporting us in this journey!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/anaconda-web-ui-preview-image-now-public/

作者：[Jiří Konečný][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

[a]: https://fedoramagazine.org/author/jkonecny/
[b]: https://github.com/lkxed
[1]: https://communityblog.fedoraproject.org/anaconda-is-getting-a-new-suit/
[2]: https://fedoraproject.org/wiki/Changes/Anaconda_Web_UI_preview_image
[3]: https://lh3.googleusercontent.com/wYYvx8Cp5YJBLlMTWu4PCQlFsTQqs_ZflspDg7cjLyPE2lZUChhiJGKkdT3BcALPyiR0A04rR32S8YRoOfQHGLm22HaEQK6opM4cSUE_xchqmiowJPnDNCu7qsQSEg85ClJku_-ZSlwFoy3PQPhmactnKnHPjsEa9gS4tAqrINTfZ_Pj0Gg_jLJ4u1tNVw
[4]: https://fedoramagazine.org#provide-feedback
[5]: https://fedorapeople.org/groups/anaconda/webui_preview_image/x86_64/webui_latest_install.iso
[6]: https://github.com/osbuild/osbuild-composer
[7]: https://fedoramagazine.orgmailto:anaconda-devel@lists.fedoraproject.org
[8]: https://fedoramagazine.orgmailto:devel@lists.fedoraproject.org
[9]: https://github.com/rhinstaller/anaconda/discussions/new?category=web-ui
