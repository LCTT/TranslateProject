[#]: subject: "AppFlowy: An Open-Source Alternative to Notion"
[#]: via: "https://itsfoss.com/appflowy/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

AppFlowy: An Open-Source Alternative to Notion
======
Brief: AppFlowy aims to be an open-source replacement to Notion, providing you with better privacy. Let us explore more about it.

While Notion (project management/note-taking tool) is exceptionally good in what it does, it is not an open-source solution. Moreover, it is not available for Linux as a desktop client.

So, what about an alternative that is more transparent, private, and available for Linux?

That’s where AppFlowy shines!

Build with Rust and Flutter, AppFlowy follows a minimal approach to simplify things yet with enough room for tweaks.

### AppFlowy is a Perfect Blend of Privacy and User Experience

![appflowy][1]

AppFlowy is fairly new. We [reported][2] its development status last year after its initial launch.

It is an open-source project that aims to overcome some limitations of [Notion][3] in terms of security and privacy. It helps you manage tasks, add to-do lists, add due dates, track the events, add pages, and format text for your notes/tasks.

But there’s more to it than security; the user experience also matters. And, AppFlowy does a decent job at it, if not better than Notion.

Note that the project is still in its **beta phase**.

Currently, the project’s aim is not for better design and functionality but for data privacy, native experience, and community-driven opportunities.

#### Notion vs. AppFlowy: What Are Your Priorities?

While it is meant to replace Notion as an open-source solution, it may not be for everyone.

So, if you are going to choose AppFlowy over Notion, you will get the following benefits:

##### Transparency

AppFlowy is an open-source project, so you are always welcome to view and modify the code.

##### Privacy

Notion can directly access your private data in the cloud as closed-source software. Compared to this, you can host AppFlowy as per your preference.

All your personal data will remain with you, and you’re in total control of it. The developers also mention that they are working on offline mode to bring better support for local installations.

##### Performance and Native Experience

AppFlowy is built using Rust and Flutter, which provides a modern user experience while keeping performance in mind.

Not just limited to that, you also get a good native experience on Linux, which you do not get with Notion.

### Features of AppFlowy

![appflowy screenshot 1][4]

AppFlowy may not be superior in terms of functionality, but it does offer several essential features.

You can expect more feature additions as the development continues. Some existing highlights include:

* Native cross-platform support.
* Ability to self-host it or install it on your computer.
* Customizability.
* Data privacy (top priority).
* A single code base for better maintenance.
* Community-driven extensibility.
* Minimalist UI.
* Add to-do list, and manage tasks.
* Highlight texts and essential formatting.
* Keyboard shortcuts for editing cell/grid.
* Dark mode support.

#### Installing AppFlowy on Linux

As this is still in the beta phase, it is unavailable in default repositories and doesn’t have any maintained PPAs, nor do you get any Flatpak/Snap packages.

However, you can easily install AppFlowy through the given commands (Only tested on Ubuntu 20.04 LTS and Arch X86_64):

```
wget https://github.com/AppFlowy-IO/AppFlowy/releases/download/0.0.4/AppFlowy-linux-x86.tar.gz
tar -xzvf AppFlowy-linux-x86.tar.gz
cd AppFlowy
```

To run AppFlowy, use the given command:

```
./app_flowy
```

To register AppFlowy in your system menu, you have to perform additional steps as given below:

First, you have to change the default name of the AppFLowy logo:

```
mv flowy_logo.svg app_flowy.svg
```

Now, you’ve to copy the temporary Linux desktop file to a usable Linux desktop file.

```
cp appflowy.desktop.temp app_flowy.desktop
```

It’s time to introduce some changes to the config file.

```
sudo nano appflowy.desktop
```

Here, you have to replace [CHANGE_THIS] with the path where the icon and executable file has been stored.

![add location of icon and exec file][5]

Save changes with CTRL + O and exit with CTRL + X.

Finally, move the desktop file so your system can pick it up.

```
mv app_flowy.desktop ~/.local/share/applications/.
```

And here’s what it should look like:

![appflowy in system menu][6]

In either case, you can check AppFlowy’s [official documentation][7] to build it from the source. Explore more about it on its official website.

[AppFlowy][8]

### Wrapping Up

If you need a simple Notion-like application with a native Linux experience, AppFlowy is an interesting choice.

You should expect bugs/issues considering it is under active development and far from being a complete replacement to Notion.

As an open-source alternative to Notion? It works! You can use it to manage tasks, add notes, and make a to-do list.

--------------------------------------------------------------------------------

via: https://itsfoss.com/appflowy/

作者：[Sagar Sharma][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/07/AppFlowy.png
[2]: https://news.itsfoss.com/appflowy-development/
[3]: https://www.notion.so/
[4]: https://itsfoss.com/wp-content/uploads/2022/07/appflowy-screenshot-1.png
[5]: https://itsfoss.com/wp-content/uploads/2022/07/Add-location-of-icon-and-exec-file-800x524.png
[6]: https://itsfoss.com/wp-content/uploads/2022/07/AppFlowy-in-System-menu-1.png
[7]: https://appflowy.gitbook.io/docs/essential-documentation/contribute-to-appflowy/software-contributions/environment-setup/building-on-linux
[8]: https://www.appflowy.io/
