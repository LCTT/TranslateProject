[#]: subject: "Share your Linux terminal with tmate"
[#]: via: "https://opensource.com/article/22/6/share-linux-terminal-tmate"
[#]: author: "Sumantro Mukherjee https://opensource.com/users/sumantro"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Share your Linux terminal with tmate
======
Tmate expands your options for session sharing with the Linux terminal.

![Terminal command prompt on orange background][1]

Image by: [iradaturrahmat][2]via [Pixabay][3], CC0

As a member of the Fedora Linux QA team, I sometimes find myself executing a bunch of commands that I want to broadcast to other developers. If you've ever used a [terminal multiplexer][4] like [tmux][5] or [GNU Screen][6], you might think that that's a relatively easy task. But not all of the people I want to see my demonstration are connecting to my terminal session from a laptop or desktop. Some might have casually opened it from their phone browser—which they can readily do because I use [tmate][7].

### Linux terminal sharing with tmate

Watching someone else work in a Linux terminal is very educational. You can learn new commands, new workflows, or new ways to debug and automate. But it can be difficult to capture what you're seeing so you can try it yourself later. You might resort to taking screenshots or a screen recording of a shared terminal session so you can type out each command later. The only other option is for the person demonstrating the commands to record the session using a tool like [Asciinema][8] or [script and scriptreplay][9].

But with tmate, a user can share a terminal either in read-only mode or over SSH. Both the SSH and the read-only session can be accessed through a terminal or as an HTML webpage.

I use read-only mode when I'm onboarding people for the Fedora QA team because I need to run commands and show the output, but with tmate, folks can keep notes by copying and pasting from their browser to a text editor.

### Linux tmate in action

On Linux, you can install tmate with your package manager. For instance, on Fedora:

```
$ sudo dnf install tmate
```

On Debian and similar distributions:

```
$ sudo apt install tmate
```

On macOS, you can install it using [Homebrew][10] or [MacPorts][11]. If you need instructions for other Linux distributions, refer to the [install][12] guide.

![Screenshot of terminal showing the options for tmate sharing: web session (regular and read-only) and ssh session (regular and read-only)][13]

Once installed, start tmate:

```
$ tmate
```

When tmate launches, links are generated to provide access to your terminal session over HTTP and SSH. Each protocol features a read-only option as well as a reverse SSH session.

Here's what a web session looks like:

![Screenshot showing tmate terminal window and 2 versions of sharing sessions demonstrating the same code][14]

Tmate's web console is HTML5, so, as a result, a user can copy the entire screen and paste it into a terminal to run the same commands.

### Keeping a session alive

You may wonder what happens if you accidentally close your terminal. You may also wonder about sharing your terminal with a different console application. After all, tmate is a multiplexer, so it should be able to keep sessions alive, detach and re-attach to a session, and so on.

And of course, that's exactly what tmate can do. If you've ever used tmux, this is probably pretty familiar.

```
$ tmate -F -n web new-session vi  console
```

This command opens up `new-session` in Vi, and the `-F` option ensures that the session re-spawns even when closed.

![A screenshot of the terminal showing the output after using the new-session and -F options: connection information for either a web session (regular or read-only) or ssh session (regular or read-only)][15]

### Social multiplexing

Tmate gives you the freedom of tmux or GNU Screen plus the ability to share your sessions with others. It's a valuable tool for teaching other users how to use a terminal, demonstrating the function of a new command, or debugging unexpected behavior. It's open source, so give it a try!

Image by: (Sumantro Mukherjee, CC BY-SA 4.0)

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/share-linux-terminal-tmate

作者：[Sumantro Mukherjee][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/terminal_command_linux_desktop_code.jpg
[2]: https://pixabay.com/en/users/iradaturrahmat-3964359/
[3]: https://pixabay.com/en/ubuntu-computer-program-interface-3145957/
[4]: https://opensource.com/article/21/5/linux-terminal-multiplexer
[5]: https://opensource.com/downloads/tmux-cheat-sheet
[6]: https://opensource.com/article/17/3/introduction-gnu-screen
[7]: https://tmate.io/
[8]: https://opensource.com/article/22/1/record-your-terminal-session-asciinema
[9]: https://www.redhat.com/sysadmin/record-terminal-script-scriptreplay
[10]: https://opensource.com/article/20/6/homebrew-mac
[11]: https://opensource.com/article/20/11/macports
[12]: https://tmate.io/
[13]: https://opensource.com/sites/default/files/2022-06/install%20tmate_0.png
[14]: https://opensource.com/sites/default/files/2022-06/tmate%20web%20session.png
[15]: https://opensource.com/sites/default/files/2022-06/tmate%20keeping%20session%20alive.png
