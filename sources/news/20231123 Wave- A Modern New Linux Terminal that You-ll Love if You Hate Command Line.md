[#]: subject: "Wave: A Modern New Linux Terminal that You'll Love if You Hate Command Line"
[#]: via: "https://news.itsfoss.com/wave-terminal/"
[#]: author: "Abhishek https://news.itsfoss.com/author/root/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Wave: A Modern New Linux Terminal that You'll Love if You Hate Command Line
======
The VS Code of Linux Terminals is here and it has the potential to
become popular among the gen z of coders and Linux users.
Not every day I get excited about the idea of a new terminal emulator.

There are [tons of terminals available for Linux][1]. From the default one that comes with your distribution to the classic of yore, terminator or the more 'modern' Rust-based, hardware accelerated ones like [Rio][2].

There is no dearth of choices here. Why should I care about one more addition to the long list?

And yet, when I came across this new terminal, I got the feeling that it has the potential to go big.

![][3]

Hear me out on why I say that. For a seasoned Linux user, the terminal is just a tool to get things done. The main power lies with the commands and how they are used. The one thing that attracts here is the multiple windows and that too can be achieved by mastering CLI tools like screen or tmux.

But there is a population of Linux users for whom the terminal is a scary place. They go there only when it is absolutely necessary and there is no alternative. Like a five-year-old child going to the washroom at night.

And this new terminal should be a comfortable tool for this second type of Linux user.

You'll understand after you see its features.

### Wave: A terminal for those who are not comfortable with the command line

Well... that's what the developers seem to have in mind here.

[Wave terminal][4] is created primarily for application developers who have to use the terminal every now and then to deploy their project or troubleshoot their application.

#### Moder code editor like interface

![][5]

Yes, that's a terminal, not a code editor. The interface is like VS Code where you have the ability to group terminal sessions into workspaces. Working on a project that has a dev server, a test server and a production server, group them in a workspace.

#### Edit files without mastering any keyboard shortcuts

You can edit files inline, be it on your local system or the remote machine. And there is no learning curve here. Just use it like a regular text editor.

![][6]

#### View Markdown, JSON or images

You can render Markdown preview, pretty display JSON files or display CSV files data in tabular format. You can also view images.

![][7]

#### Persistent SSH connections and universal history

Another awesome feature is that Wave gives you persistent SSH connections. Don't worry about getting disconnected from the remote server because you were idle for an hour. It will automatically connect you, even if the remote system reboots.

You also get the feature of combined history search. Don't remember which command you run in which terminal session? No problem. Wave has got your back there.

🤩

The ability to save and have persistent SSH connections, group them in workspaces, and the graphical editing of files are good enough reasons for a developer to become a fan of Wave terminal.

### My experience with Wave terminal

Here's what I feel after using it for a couple of hours.

When I first started it, I was greeted with a pop screen. It had telemetry enabled by default. Classic VS Code like feature. Fine, I disabled it.

![][8]

The next hiccup is the terms of service. You have to accept it but there is no way to actually read the terms on this screen. However, I can see it on [their website][9]. It's been adopted from the [Basecamp open source policies][10].

I really don't see the need for this when the software is open source licensed under Apache 2.0. It is just going to confuse people.

Anyway, this is what the interface looked like in the first run. As you can see, the interface is like a modern code editor with a sidebar that allows you to group terminal tabs in workspaces. You can assign name, icons and colors to each tab. This is helpful if you connect to multiple remote servers.

![][11]

In that regard, you can also save your SSH connections in the classic Putty style.

![][12]

This way, you can preconfigure a certain tab to start with a particular SSH connection.

The main trouble for me (if I can call it that) is with the input field. It's a tiny input box at the bottom. You enter the command and it shows the output as the entire command and its output are grouped into a box and moved up.

![][13]

I am used to the classic terminal input style where things start at top and then move towards bottom. Here, it is the opposite.

See, that's intentional. Each command and its output is a separate box, a separate element. You can copy it, minimize it or archive it from the view.

#### The best thing after sliced bread

The biggest promise of Wave terminal is that it doesn't make you feel like you are in the terminal. The Achilles heel for beginners is editing files in the terminal. Even the simplest of the terminal-based editor (read Nano) has a learning curve.

But not Wave. It has a built-in editor that can be invoked with `codeedit filename` command and you get to edit the file the same way you do in a graphical text editor. Yes, you can use your mouse as freely. You may also specify the file type from the menu in the editor.

![][14]

For a person who gets cold feet while editing config files in the terminal, this is a god-send feature.

A developer often has to deal with Markdown and JSON files. Wave terminal is perfectly capable of rendering these files.

![][15]

And the SSH connections are persistent. Forget about being disconnected from remote server time and again. Wave handles it perfectly.

You can further explore its features from its [documentation page][16].

![][17]

### Installing Wave terminal on Linux

You can download the zip from their website.

[Download Wave][18]

Extract it and you'll see that it has an executable file named `Wave` that can be run to launch the application.

![][19]

Play around with it and if you like it enough, move the entire folder to the /opt directory, create a new desktop file for it so that it can be searchable in the system menu. I won't go in those details for the moment.

There are no distro specific installer files like deb/rpm. Snap and Flatpak packages are also not present for the moment. It's a new application. Give it some time.

The source code is available on GitHub. Check it out and give it a star if you like it.

[Wave Terminal on GitHub][20]

### Conclusion

As you can see and feel, this is an application created for application developers. People who spend more time on coding and have to deal with the command line for deploying their applications or debug them.

It is also evident that it is crafted for macOS users. The interface, keyboard shortcuts, everything screams mac.

But that's okay. It should not matter to the Linux users as long as Wave is available on Linux.

I just hope that it doesn't go closed source and become a paid tool in the future. If that happens,

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/wave-terminal/

作者：[Abhishek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/root/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-terminal-emulators/
[2]: https://raphamorim.io/rio/
[3]: https://news.itsfoss.com/content/images/2023/11/wave-terminal.webp
[4]: https://www.waveterm.dev/
[5]: https://news.itsfoss.com/content/images/2023/11/wave-terminal-1.webp
[6]: https://news.itsfoss.com/content/images/2023/11/wave-edit-files-inline.webp
[7]: https://news.itsfoss.com/content/images/2023/11/view-images-wave-terminal.webp
[8]: https://news.itsfoss.com/content/images/2023/11/wave-terminal-tos.png
[9]: https://www.waveterm.dev/tos
[10]: https://github.com/basecamp/policies/blob/master/terms/index.md
[11]: https://news.itsfoss.com/content/images/2023/11/wave-terminal-first-screen.png
[12]: https://news.itsfoss.com/content/images/2023/11/wave-terminal-putty-like-ssh-connection-add.png
[13]: https://news.itsfoss.com/content/images/2023/11/wave-terminal-interface.png
[14]: https://news.itsfoss.com/content/images/2023/11/editing-files-wave-terminal.png
[15]: https://news.itsfoss.com/content/images/2023/11/wave-terminal-markdown-view.png
[16]: https://docs.waveterm.dev/quickstart
[17]: https://mintlify.s3-us-west-1.amazonaws.com/commandline/_generated/favicon/apple-touch-icon.png?v=3
[18]: https://www.waveterm.dev/download
[19]: https://news.itsfoss.com/content/images/2023/11/wave-terminal-executable.png
[20]: https://github.com/wavetermdev/waveterm
