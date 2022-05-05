[#]: subject: "dahliaOS – A Unique Linux Distribution Based on Google Fuchsia [First Look]"
[#]: via: "https://www.debugpoint.com/2022/05/dahlia-os-alpha/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

dahliaOS – A Unique Linux Distribution Based on Google Fuchsia [First Look]
======
OUR FIRST LOOK AT THE DAHLIAOS ALPHA VERSION, BASED ON GOOGLE’S FUCHSIA
OPERATING SYSTEM.
The [dahliaOS][1] is a unique distribution and a “fork” of the Google [Fuchsia][2] operating system that runs on mainline Linux Kernel and [Zircon Kernel][3]. The Zircon kernel is a newly designed kernel developed by Google for its own set of projects and devices.

The parent OS Fuchsia is designed to work on any hardware, including car dashboards to PCs. That said, the dahliaOS is a new promising operating system (or should I say a new Linux Distribution?) which brings a new era of desktop computing experience to traditional Linux distributions.

![dahliaOS Alpha Desktop][4]

### dahliaOS – First Look (ALPHA)

#### Core Architecture

It’s an ALPHA software as of writing this review. So, there are bugs. I would not recommend it for your daily driver or any serious work.

Firstly, the team of dahliaOS managed to run this fork on top of the mainline Linux Kernel ([Kernel 5.17][5] in this alpha version). You still have the option to use the zircon kernel. On top of that, it uses the init system for boot up and other initial functions.

Secondly, dahliaOS’s user interface is called Pangolin desktop, which is based on deprecated capybara UI, and it provides a desktop shell.

In addition to those, the Pangolin Shell interacts with X.Org and Flutter. While researching, I found traces of Openbox Window manager; perhaps it’s also used.

However, the X.Org display server communicates with userspace and the userspace talks to Linux Kernel. The overall architecture is explained below image (credit: dahliaOS team).

![dahlisOS Architecture][4]

#### The Pangolin Desktop

At the first look, it’s a stunning looking desktop and very fast. The overall look may feel similar to Chrome OS, but there are differences. The primary reason maybe it’s designed differently and written in Flutter.

The design is pretty standard with a bottom main panel with an application menu at the left, a middle dock and a system tray.

The application menu launches full screen, and it’s unique. At the top, you get a global search bar which searches your entire desktop and web. In the middle, an icon-based application grid gives you access to all the installed packages in your system. One of the unique aspects of this menu is an additional menu bar that shows the application categories in this fullscreen view.

![Full-screen application view][4]

Finally, a small section shows shortcuts to the power menu, system settings, and user profile at the bottom.

Not only that, the bottom panel does not overlay with the fullscreen application menu; it remains visible.

But that’s not all. My favourite is the system tray pop-up menu which summarizes the system state with toggle switches to turn on or off several settings. See for yourself in the below image.

![System Tray][4]

It’s a fine work of user interface design that brings all these options together without the feeling of clumsiness.

Moreover, the different search options and a nice workspace view give this desktop an additional advantage.

#### Applications and Settings

Firstly, I want to discuss how well the Settings window is designed. Settings application gives you access to all tweaks for dahliaOS. This responsive application (adapts to the screen size), offers an array of options on the left panel with its details on the right.

![Settings Window][4]

Network, Customizations, Connected devices, and notifications are some of the critical settings that you can find. However, being an alpha copy, some are still under development.

In addition, dahliaOS comes with built-in dark and light mode with an option to change the primary taskbar alignment, coloured title bars with transparency effect (wow) and a settings slider to change the window border radius!

Finally, a file manager, photo viewer, terminal and calculator – all developed in Flutter give a different feel if you are an avid Linux user.

![dahliaOS Running Apps][4]

Installing software is a little different as dahliaOS manages all of them via Web App.

#### Installing native apps or Linux packages

I am not sure whether dahliaOS would allow the installation of native Linux packages via apt, Flathub or Snap. But the possibility is there as a future roadmap.

#### Performance

Overall, the performance is speedy, and the resource consumption metric is good. In a virtual machine environment, dahliaOS consumes about 330MB of memory. But CPU is surprisingly little higher in my opinion, which hovers around 10 % to 13% range. The Pangolin desktop consumes most of the resources, followed by the X.Org.

![dahliaOS ALPHA System Performance][4]

Finally, you might feel some strange desktop behaviour related to in-focus and out of focus situations in applications – perhaps due to FLutter. Sometimes, the focus is not registered even if you select a window via mouse. It might well be a bug.

### Video of dahliaOS walkthrough – Alpha

Here’s a quick walkthrough of dahliaOS, which I recorded for our readers to give you some idea before you try.

### Closing Notes

To wrap up, I think it is one of the promising Linux distributions in the making, which takes a different path than traditional forks.

We will keep a close watch on this project and give you updates here.

If you want to learn more, contribute, visit the official website for more [details][6] ([source][7]). Finally, if you are planning to install or try, visit this [page][8].

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][9], [Twitter][10], [YouTube][11], and [Facebook][12] and never miss an update!

#### Share this:

  * [Twitter][13]

  * [Facebook][14]

  * [Print][15]

  * [LinkedIn][16]

  * [Reddit][17]

  * [Telegram][18]

  * [WhatsApp][19]

  * [Email][20]

  *


--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/05/dahlia-os-alpha/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://dahliaos.io/
[2]: https://fuchsia.dev/
[3]: https://fuchsia.dev/fuchsia-src/concepts/kernel
[4]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[5]: https://www.debugpoint.com/2022/03/linux-kernel-5-17/
[6]: https://docs.dahliaos.io/
[7]: https://github.com/dahliaOS/
[8]: https://docs.dahliaos.io/install/efi
[9]: https://t.me/debugpoint
[10]: https://twitter.com/DebugPoint
[11]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[12]: https://facebook.com/DebugPoint
[13]: https://www.debugpoint.com/2022/05/dahlia-os-alpha/?share=twitter (Click to share on Twitter)
[14]: https://www.debugpoint.com/2022/05/dahlia-os-alpha/?share=facebook (Click to share on Facebook)
[15]: tmp.6E0Ad93KWV#print (Click to print)
[16]: https://www.debugpoint.com/2022/05/dahlia-os-alpha/?share=linkedin (Click to share on LinkedIn)
[17]: https://www.debugpoint.com/2022/05/dahlia-os-alpha/?share=reddit (Click to share on Reddit)
[18]: https://www.debugpoint.com/2022/05/dahlia-os-alpha/?share=telegram (Click to share on Telegram)
[19]: https://www.debugpoint.com/2022/05/dahlia-os-alpha/?share=jetpack-whatsapp (Click to share on WhatsApp)
[20]: https://www.debugpoint.com/2022/05/dahlia-os-alpha/?share=email (Click to email this to a friend)
