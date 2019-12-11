[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Annotate screenshots on Linux with Ksnip)
[#]: via: (https://opensource.com/article/19/12/annotate-screenshots-linux-ksnip)
[#]: author: (Clayton Dewey https://opensource.com/users/cedewey)

Annotate screenshots on Linux with Ksnip
======
Ksnip allows you to create and mark up screenshots in Linux with ease.
![a checklist for a team][1]

I recently switched from MacOS to [Elementary OS][2], a Linux distribution focused on ease of use and privacy. As a user-experience designer and a free software supporter, I take screenshots and annotate them all the time. After trying out several different tools, the one I enjoy the most by far is [Ksnip][3], an open source tool licensed under GPLv2.

![Ksnip screenshot][4]

### Installation

Install Ksnip with your preferred package manager. I installed it via Apt:


```
`sudo apt-get install ksnip`
```

### Configuration

Ksnip comes with quite a few configuration options, including:

  * Location to save screenshots
  * Default screenshot filename
  * Image grabber behavior
  * Cursor color and thickness
  * Text font



You can also integrate it with your Imgur account.

![Ksnip configuration options][5]

### Usage

Ksnip offers a wide range of [features][6]. My favorite part of Ksnip is that it has all the annotation tools I need (plus one I hadn't thought of!).

You can annotate with:

  * Pen
  * Marker
  * Rectangles
  * Ellipses
  * Text



You can also blur areas to remove sensitive information. And use my new favorite tool: numbered dots for steps on an interface.

### About the creator

I'm enjoying Ksnip so much that I reached out to the creator, [Damir Porobic][7], to learn more about the project.

When I asked what inspired him to create Ksnip, he said:

> "I switched from Windows to Linux a few years ago and missed the Windows Snipping Tool that I was used to on Windows. All other screenshot tools at that time were either huge (a lot of buttons and complex features) or lacked key features like annotations, so I decided to build a simple Snipping Tool clone, but with time it got more and more features. So here we are."

This is exactly what I found as I was evaluating screenshot tools. It's great that he took the time to build a solution and freely share it for others to benefit.

As for the future of Ksnip, Damir would like to add global shortcuts (at least for Windows) and tabs for new screenshots and allow the application to run in the background. There is also a growing list of feature requests on GitHub.

### Ways to help

Damir's biggest need for Ksnip help is with development. He and his wife are expecting a baby soon, so he won't have as much time to devote to the project. He is available to review and accept pull requests, though.

Also, the project could benefit from additional installation options via Snap and Flatpak and installers for MacOS and a setup for Windows. If you would like to help, check out the [Contribution][8] section of Ksnip's README.

* * *

_This article originally appeared on [Agaric Tech Cooperative's blog][9] and is republished with permission._

How do you know when your documentation needs screenshots? Ben Cotton shares some helpful tips.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/annotate-screenshots-linux-ksnip

作者：[Clayton Dewey][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cedewey
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk (a checklist for a team)
[2]: https://elementary.io/
[3]: https://github.com/damirporobic/ksnip
[4]: https://opensource.com/sites/default/files/uploads/ksnip.png (Ksnip screenshot)
[5]: https://opensource.com/sites/default/files/uploads/ksnip-configuration.png (Ksnip configuration options)
[6]: https://github.com/DamirPorobic/ksnip#features
[7]: https://github.com/damirporobic/
[8]: https://github.com/DamirPorobic/ksnip/blob/master/README.md#contribution
[9]: https://agaric.coop/blog/annotate-screenshots-linux-ksnip
