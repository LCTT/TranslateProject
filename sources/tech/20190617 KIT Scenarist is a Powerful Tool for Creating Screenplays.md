[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (KIT Scenarist is a Powerful Tool for Creating Screenplays)
[#]: via: (https://itsfoss.com/kit-scenarist/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

KIT Scenarist is a Powerful Tool for Creating Screenplays
======

Did you ever wish that there was an open source tool for all your screenplay writing needs? Well, you are in luck. Today, we will be looking at an application that will do just that. Today, we will be looking at KIT Scenarist.

### KIT Scenarist: An Open Source tool for writing screenplays

[KIT Scenarist][1] is a program designed to be your one-stop-shop to create the next great screenplay. KIT Scenarist’s tools are split up into four modules: Research, Cards, Script, and Statistics. When you load KIT Scenarist for the first time after installing it, you will be asked if you want to enable each of these modules. You can also disable any of the modules from the setting menu.

![Scenarist][2]

The Research module gives you a place to store your story ideas, as well as, ideas and information for both characters and locations. You can also add images for a character or location to give you inspiration.

The Cards module shows you the scenes that you have written or sketched out like cards on a cord board. You can drag these scenes around on the board to rearrange them. You can also jump to a certain scene or mark a scene as done.

The Script module is where the actual writing takes place. It has a widget that tells you approximately how long your screenplay will take to perform. Like a word processor, you can tell KIT Scenarist what parts of the script are the actions, character, dialogue, etc and it will format it correctly.

![Scenarist Research module][3]

The Statistics module gives you all kinds of reports and graphs about your screenplay. The scene report shows how long each act is and what characters are in it. The location report shows how much time is spent at each location and in which acts. The cast report shows how many scenes each character is in and how much dialogue they have. There is even a report that lists all of the dialogue for each character.

[][4]

Suggested read Tilix: Advanced Tiling Terminal Emulator for Power Users

Like all well-designed apps, KIT Scenarist has both a light and dark theme. The dark theme is the default.

![Scenarist Statistics module][5]

KIT Scenarist stores your projects in `.kitsp` files. These files are essentially SQLite database files with a different extension. This means that if you ever run into issues with KIT Scenarist, you can retrieve your information with an SQLite viewer.

This application also allows you to import scripts from a wide range of script writing applications. You can import the following file formats: Final Draft Screenplay (.fdx), Final Draft Template (.fdxt), Trelby Screenplay (.trelby), [Fountain Text][6] (.foundation), Celtx Project (.celtx), .odt, . doc and .docx. You can export your outline and script to .docx, .pdf, .fdx. or .Fountain.

The desktop version of KIT Scenarist is free, but they also have a couple of [Pro options][7]. They have a cloud service to collaborate with others or sync your work to other devices. The cloud service costs $4.99 for a month or $52.90 for a year. They have other subscription lengths. KIT Scenarist is available in the iOS app store or the Google Play store, but cost money there. Finally, if you are an organization who wants to use KIT Scenarist but it is missing a feature you want, they will add it if you finance the work.

![Scenarist Cards module][8]

### How to Install Scenarist

Currently, the only repo that Scenarist is available for downloading is the [Arch User Repository][9]. (Arch rulez :D)

Otherwise, you have to [download][10] a package installer from the website. They have packages available for Linux (both .deb and .rpm), Windows, and macOS. As I stated above, there are also versions available for both Android and iOS, but they are not free. You can find the source code of KIT Scenarist on GitHub.

[KIT Scenarist on GitHub][11]

If KIT Scenarist won’t start on your Linux system, try installing the `libxcb-xinerama0` package.

![Scenarist Script][12]

### Final Thoughts on KIT Scenarist

KIT Scenarist offers the full script writing experience. All your information is stored in one place, so you don’t need to look everywhere for your information. It does everything. Now, the creator just needs to add a feature to submit your script directly to the person who will make you the next famous playwright.

[][13]

Suggested read Bookworm: A Simple yet Magnificent eBook Reader for Linux

If KIT Scenarist looks too overwhelming and you want to try something simpler, I would recommend trying [Trelby][14]. If you are into writing, you may read my list of [useful open source tools for writers][15].

Have you every used KIT Scenarist? What is your favorite open source screenwriting tool? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][16].

--------------------------------------------------------------------------------

via: https://itsfoss.com/kit-scenarist/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://kitscenarist.ru/en/index.html
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/06/scenarist-about.png?fit=800%2C469&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/06/scenarist-research.png?fit=800%2C371&ssl=1
[4]: https://itsfoss.com/tilix-terminal-emulator/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/06/scenarist-statistics.png?fit=800%2C467&ssl=1
[6]: https://www.fountain.io/
[7]: https://kitscenarist.ru/en/pricing.html
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/06/scenarist-cards.png?fit=800%2C470&ssl=1
[9]: https://aur.archlinux.org/packages/scenarist
[10]: https://kitscenarist.ru/en/download.html
[11]: https://github.com/dimkanovikov/kitscenarist
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/06/scenarist-script.png?fit=800%2C468&ssl=1
[13]: https://itsfoss.com/bookworm-ebook-reader-linux/
[14]: https://www.trelby.org/
[15]: https://itsfoss.com/open-source-tools-writers/
[16]: http://reddit.com/r/linuxusersgroup
