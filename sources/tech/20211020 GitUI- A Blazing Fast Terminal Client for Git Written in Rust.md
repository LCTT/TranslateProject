[#]: subject: "GitUI: A Blazing Fast Terminal Client for Git Written in Rust"
[#]: via: "https://itsfoss.com/gitui/"
[#]: author: "Marco Carmona https://itsfoss.com/author/marco/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

GitUI: A Blazing Fast Terminal Client for Git Written in Rust
======

The [basic Git commands][1] are good enough for the usual clone, add, commit push.

But if you are working on a large project with multiple contributors, you may need to visualize things. A GUI tool gives a better view on the diff, stash and blame.

But then, if you are a terminal dweller, who wants the comfort of GUI with Git, I have got a good tool for you.

It is called GitUI and it provides user experience and comfort similar to a git GUI but right in your terminal. It is portable, fast, free and open source.

### GitUI: A terminal based tool for Git

[GitUI][2] is not the first Git client for Linux terminal. So, what makes GitUI different than other similar projects like [lazygit][3] or [tig][4]?

GitUI developer has shared some benchmark in the README file of the project.

| Time | Memory (GB) | Binary (MB) | Freezes | Crashes
---|---|---|---|---|---
gitui | 24 s | 0.17 | 1.4 | No | No
lazygit | 57 s | 2.6 | 16 | Yes | Sometimes
tig | 4 m 20 s | 1.3 | 0.6 | Sometimes | No

Comparison between GitUI, LazyGit, and Tig; simple user interfaces for Git

Most of this optimization comes from the use of Rust programming language.

_**Note: This program is in early stages of development and is not production ready yet.**_

### Installing GitUI on Linux

Needless to say, you should have [Git installed on your system][5] already.

To use GitUI, you need to [install Rust support for your Linux distribution][6] first.

In a terminal, use the following command:

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

![Installing Rust on Linux][7]

Go with option 1 when you are asked for a choice. When script finishes installation, set the configuration right with this command:

```
source $HOME/.cargo/env
```

Now that you have Rust and its package manager Cargo installed, use the Cargo command to install GitUI:

```
cargo install gitui
```

And you’re ready to use GitUI, for that just type `gitui` in the terminal to run it. I made some sample files to play with Git and GitUI.

![Starting gitui on terminal][8]

It’s important to mention that the interface has a fast and intuitive keyboard-only control. Everything is as easy as type the correct letter to stage, commit, branch, or push your files into your git repository.

Something that really gets me excited was that you can not only do the four actions before, but you can also **edit** each file, **pull** it, **blame** it, **navigate** inside it, and more things; everything without existing from the interface. Awesome, isn’t it?

![More functions inside the interface][9]

Felicitations! Now you know how to install GitUI and how it looks like in your terminal.

If you like the project, start its repository on [GitHub][2]. If you use some other tool to manage Git, please suggest your favorite in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/gitui/

作者：[Marco Carmona][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/marco/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/basic-git-commands-cheat-sheet/
[2]: https://github.com/Extrawurst/gitui
[3]: https://github.com/jesseduffield/lazygit
[4]: https://jonas.github.io/tig/
[5]: https://itsfoss.com/install-git-ubuntu/
[6]: https://itsfoss.com/install-rust-cargo-ubuntu-linux/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/Installing-Rust-step-1.png?resize=800%2C471&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/Starting-GitUI-on-terminal.png?resize=800%2C471&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/More-functions-inside-the-interface.png?resize=800%2C471&ssl=1
