[#]: subject: (Productivity with Ulauncher)
[#]: via: (https://fedoramagazine.org/ulauncher-productivity/)
[#]: author: (Troy Curtis Jr https://fedoramagazine.org/author/troycurtisjr/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Productivity with Ulauncher
======

![Productivity with Ulauncher][1]

Photo by [Freddy Castro][2] on [Unsplash][3]

Application launchers are a category of productivity software that not everyone is familiar with, and yet most people use the basic concepts without realizing it. As the name implies, this software launches applications, but they also other capablities.

Examples of dedicated Linux launchers include [dmenu][4], [Synapse][5], and [Albert][6]. On MacOS, some examples are [Quicksilver][7] and [Alfred][8]. Many modern desktops include basic versions as well. On Fedora Linux, the Gnome 3 [activities overview][9] uses search to open applications and more, while MacOS has the built-in launcher Spotlight.

While these applications have great feature sets, this article focuses on productivity with [Ulauncher][10].

### What is Ulauncher?

[Ulauncher][10] is a new application launcher written in Python, with the first Fedora package available in March 2020 for [Fedora Linux 32][11]. The core focuses on basic functionality with a nice [interface for extensions][12]. Like most application launchers, the key idea in Ulauncher is search. Search is a powerful productivity boost, especially for repetitive tasks.

Typical menu-driven interfaces work great for discovery when you aren’t sure what options are available. However, when the same action needs to happen repeatedly, it is a real time sink to navigate into 3 nested sub-menus over and over again. On the other side, [hotkeys][13] give immediate access to specific actions, but can be difficult to remember. Especially after exhausting all the obvious mnemonics. Is [_Control+C_][14] “copy”, or is it “cancel”? Search is a middle ground giving a means to get to a specific command quickly, while supporting discovery by typing only some remembered word or fragment. Exploring by search works especially well if tags and descriptions are available. Ulauncher supplies the search framework that extensions can use to build all manner of productivity enhancing actions.

### Getting started

Getting the core functionality of Ulauncher on any Fedora OS is trivial; install using _[dnf][15]_:

```
sudo dnf install ulauncher
```

Once installed, use any standard desktop launching method for the first start up of Ulauncher. A basic dialog should pop up, but if not try launching it again to toggle the input box on. Click the gear icon on the right side to open the preferences dialog.

![Ulauncher input box][16]

A number of options are available, but the most important when starting out are _Launch at login_ and the hotkey. The default hotkey is _Control+space_, but it can be changed. Running in Wayland needs additional configuration for consistent operation; see the [Ulauncher wiki][17] for details. Users of “Focus on Hover” or “Sloppy Focus” should also enable the “Don’t hide after losing mouse focus” option. Otherwise, Ulauncher disappears while typing in some cases.

### Ulauncher basics

The idea of any application launcher, like Ulauncher, is fast access at any time. Press the hotkey and the input box shows up on top of the current application. Type out and execute the desired command and the dialog hides until the next use. Unsurprisingly, the most basic operation is launching applications. This is similar to most modern desktop environments. Hit the hotkey to bring up the dialog and start typing, for example _te_, and a list of matches comes up. Keep typing to further refine the search, or navigate to the entry using the arrow keys. For even faster access, use _Alt+#_ to directly choose a result.

![Ulauncher dialog searching for keywords with “te”][18]

Ulauncher can also do quick calculations and navigate the file-system. To calculate, hit the hotkey and type a math expression. The result list dynamically updates with the result, and hitting _Enter_ copies the value to the clipboard. Start file-system navigation by typing _/_ to start at the root directory or _~/_ to start in the home directory. Selecting a directory lists that directory’s contents and typing another argument filters the displayed list. Locate the right file by repeatedly descending directories. Selecting a file opens it, while _Alt+Enter_ opens the folder containing the file.

### Ulauncher shortcuts

The first bit of customization comes in the form of shortcuts. The _Shortcuts_ tab in the preferences dialog lists all the current shortcuts. Shortcuts can be direct commands, URL aliases, URLs with argument substitution, or small scripts. Basic shortcuts for Wikipedia, StackOverflow, and Google come pre-configured, but custom shortcuts are easy to add.

![Ulauncher shortcuts preferences tab][19]

For instance, to create a duckduckgo search shortcut, click _Add Shortcut_ in the _Shortcuts_ preferences tab and add the name and keyword _duck_ with the query _<https://duckduckgo.com/?q=%s>_. Any argument given to the _duck_ keyword replaces _%s_ in the query and the URL opened in the default browser. Now, typing _duck fedora_ will bring up a duckduckgo search using the supplied terms, in this case _fedora_.

A more complex shortcut is a script to convert [UTC time][20] to local time. Once again click _Add Shortcut_ and this time use the keyword _utc_. In the _Query or Script_ text box, include the following script:

```
#!/bin/bash
tzdate=$(date -d "$1 UTC")
zenity --info --no-wrap --text="$tzdate"
```

This script takes the first argument (given as _$1_) and uses the standard [_date_][21] utility to convert a given UTC time into the computer’s local timezone. Then [zenity][22] pops up a simple dialog with the result. To test this, open Ulauncher and type _utc 11:00_. While this is a good example showing what’s possible with shortcuts, see the [ultz][23] extension for really converting time zones.

### Introducing extensions

While the built-in functionality is great, installing extensions really accelerates productivity with Ulauncher. Extensions can go far beyond what is possible with custom shortcuts, most obviously by providing suggestions as arguments are typed. Extensions are Python modules which use the [Ulauncher extension interface][12] and can either be personally-developed local code or shared with others using GitHub. A collection of community developed extensions is available at <https://ext.ulauncher.io/>. There are basic standalone extensions for quick conversions and dynamic interfaces to online resources such as dictionaries. Other extensions integrate with external applications, like password managers, browsers, and VPN providers. These effectively give external applications a Ulauncher interface. By keeping the core code small and relying on extensions to add advanced functionality, Ulauncher ensures that each user only installs the functionality they need.

![Ulauncher extension configuration][24]

Installing a new extension is easy, though it could be a more integrated experience. After finding an interesting extension, either on the Ulauncher extensions website or anywhere on GitHub, navigate to the _Extensions_ tab in the preferences window. Click _Add Extension_ and paste in the GitHub URL. This loads the extension and shows a preferences page for any available options. A nice hint is that while browsing the extensions website, clicking on the _Github star_ button opens the extension’s GitHub page. Often this GitHub repository has more details about the extension than the summary provided on the community extensions website.

#### Firefox bookmarks search

One useful extension is [Ulauncher Firefox Bookmarks][25], which gives fuzzy search access to the current user’s Firefox bookmarks. While this is similar to typing _*&lt;search-term&gt;_ in Firefox’s omnibar, the difference is Ulauncher gives quick access to the bookmarks from anywhere, without needing to open Firefox first. Also, since this method uses search to locate bookmarks, no folder organization is really needed. This means pages can be “starred” quickly in Firefox and there is no need to hunt for an appropriate folder to put it in.

![Firefox Ulauncher extension searching for fedora][26]

#### Clipboard search

Using a clipboard manager is a productivity boost on its own. These managers maintain a history of clipboard contents, which makes it easy to retrieve earlier copied snippets. Knowing there is a history of copied data allows the user to copy text without concern of overwriting the current contents. Adding in the [Ulauncher clipboard][27] extension gives quick access to the clipboard history with search capability without having to remember another unique hotkey combination. The extension integrates with different clipboard managers: [GPaste][28], [clipster][29], or [CopyQ][30]. Invoking Ulauncher and typing the _c_ keywords brings up a list of recent copied snippets. Typing out an argument starts to narrow the list of options, eventually showing the sought after text. Selecting the item copies it to the clipboard, ready to paste into another application.

![Ulauncher clipboard extension listing latest clipboard contents][31]

#### Google search

The last extension to highlight is [Google Search][32]. While a Google search shortcut is available as a default shortcut, using an extension allows for more dynamic behavior. With the extension, Google supplies suggestions as the search term is typed. The experience is similar to what is available on Google’s homepage, or in the search box in Firefox. Again, the key benefit of using the extension for Google search is immediate access while doing anything else on the computer.

![Google search Ulauncher extension listing suggestions for fedora][33]

### Being productive

Productivity on a computer means customizing the environment for each particular usage. A little configuration streamlines common tasks. Dedicated hotkeys work really well for the most frequent actions, but it doesn’t take long before it gets hard to remember them all. Using fuzzy search to find half-remembered keywords strikes a good balance between discoverability and direct access. The key to productivity with Ulauncher is identifying frequent actions and installing an extension, or adding a shortcut, to make doing it faster. Building a habit to search in Ulauncher first means there is a quick and consistent interface ready to go a key stroke away.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/ulauncher-productivity/

作者：[Troy Curtis Jr][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/troycurtisjr/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/03/ulauncher-816x345.jpg
[2]: https://unsplash.com/@readysetfreddy?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://tools.suckless.org/dmenu/
[5]: https://launchpad.net/synapse-project
[6]: https://github.com/albertlauncher/albert
[7]: https://qsapp.com/
[8]: https://www.alfredapp.com/
[9]: https://help.gnome.org/misc/release-notes/3.6/users-activities-overview.html.en
[10]: https://ulauncher.io/
[11]: https://fedoramagazine.org/announcing-fedora-32/
[12]: http://docs.ulauncher.io/en/latest/
[13]: https://en.wikipedia.org/wiki/Keyboard_shortcut
[14]: https://en.wikipedia.org/wiki/Control-C
[15]: https://fedoramagazine.org/managing-packages-fedora-dnf/
[16]: https://fedoramagazine.org/wp-content/uploads/2021/03/image.png
[17]: https://github.com/Ulauncher/Ulauncher/wiki/Hotkey-In-Wayland
[18]: https://fedoramagazine.org/wp-content/uploads/2021/03/image-1.png
[19]: https://fedoramagazine.org/wp-content/uploads/2021/03/image-2-1024x361.png
[20]: https://www.timeanddate.com/time/aboututc.html
[21]: https://man7.org/linux/man-pages/man1/date.1.html
[22]: https://help.gnome.org/users/zenity/stable/
[23]: https://github.com/Epholys/ultz
[24]: https://fedoramagazine.org/wp-content/uploads/2021/03/image-6-1024x407.png
[25]: https://github.com/KuenzelIT/ulauncher-firefox-bookmarks
[26]: https://fedoramagazine.org/wp-content/uploads/2021/03/image-3.png
[27]: https://github.com/friday/ulauncher-clipboard
[28]: https://github.com/Keruspe/GPaste
[29]: https://github.com/mrichar1/clipster
[30]: https://hluk.github.io/CopyQ/
[31]: https://fedoramagazine.org/wp-content/uploads/2021/03/image-4.png
[32]: https://github.com/NastuzziSamy/ulauncher-google-search
[33]: https://fedoramagazine.org/wp-content/uploads/2021/03/image-5.png
