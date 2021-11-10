[#]: subject: "exa: A Modern Replacement for the ls Command"
[#]: via: "https://itsfoss.com/exa/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

exa: A Modern Replacement for the ls Command
======

I bet you have used the [ls command in Linux][1]. It’s one of the first command you use while [learning Linux][2] commands.

The simple ls command is quite handy for listing directory content. I never really though any command could replace it until I discovered exa.

### What is exa command?

[exa][3] is a command line tool that lists directories and files in the specified path (or in the current directory if not specified). This might sound familiar to you because it is exactly ls command also does.

exa is supposed to be a modern replacement for the venerable ls command from the good old UNIX days. It has more features and better default than the ls command, so it claims.

![exa features | Courtesy exa project website][4]

Here are some reasons why you would want to use the exa command instead of ls:

  * exa is just as portable as ls (available on all major Linux distributions, *BSD and macOS)
  * Has colorful output by default
  * The differently formatted “verbose-ness” of exa might attract users who are new to Linux/BSDs
  * File querying is done in parallel, making exa equivalent or on par to the performance of ls
  * Shows git staged or un-staged status for individual files



One of the other aspect of exa is that it is written in the Rust programming language. In case you don’t know about the Rust language, it has similar execution speed compared to C while cutting down memory related errors at compile time itself; making your software fast _and_ secure.

### Installing exa on your Linux system

exa has gained quite some popularity lately and thus many distributions have started including it in the official repositories. In other words, you should be able to install it using your [distribution’s package manager][5].

Starting with Ubuntu 20.10, you can install it using the apt command:

```

    sudo apt install exa

```

Arch Linux already has it so just [use the pacman command][6]:

```

    sudo pacman -S exa

```

If it is not available through your package manager, don’t fret. It’s a Rust package after all and you can easily install it with Cargo. Please make sure to [install Rust and Cargo on Ubuntu][7] or whichever distribution you are using.

Once you have Rust and Cargo installed, use this command to install exa:

```

    cargo install exa

```

### Using exa

exa has a lot of command options, mostly aimed at a better formatted output and some quality of life improvements like git status for staged or unstaged file, and much more.

Below are a few screenshots demonstrating how exa will work on your system.

Simply using the exa command will produce an output similar to ls but with color. This color thing may not be that attractive because distributions like Ubuntu already provide colored ls output at least in desktop version. However, the ls command doesn’t have colored output by default.

```

    exa

```

![A screenshot of the exa command’s output without any additional flags][8]

Please note that exa and ls command do not have all the same options. For example, while the -l option gives long list in both exa and ls, the -h option adds a column header instead of the human readable option like ls.

```

    exa -lh

```

![exa has column titles for a better “verbose-ness” as I mentioned before][9]

I told you that exa has built in git integration. The screenshot below gives the demonstration of the –git flag. Notice how the test_file shows -N in tracked column of git because it has not been added to the repository sources yet.

```

    exa --git -lh

```

![Demonstration of how the git flag works with exa][10]

The example below is not something my cat typed. It’s a combination of various options. Exa has even more options for you to try and explore.

```

    exa -abghHliS

```

![A very colorful and detailed output with user friendly verbose output][11]

You can get the full list of options by running the following command in your terminal:

```

    exa --help

```

However, if you want to see what exa has to offer, you can view the [official documentation][12] on its [git repository][13].

### Worth switching to exa from ls?

As user friendly as exa might be to someone who is new to UNIX like Operating Systems, it trades the ability of being easily used in a script for “easy-ness” and appearance. Which, to be clear is not a bad thing.

In any case, ls is like the universal command. You may use exa for personal use but when it comes to scripting, stick to ls. The difference of one [or many] flags between ls and exa might drive you crazy when the expected output does not match the actual output in either command.

I would like to know your views on exa. Have you already tried it? How’s your experience with it?

--------------------------------------------------------------------------------

via: https://itsfoss.com/exa/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/ls-command/
[2]: https://itsfoss.com/free-linux-training-courses/
[3]: https://the.exa.website/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/exa-features.png?resize=800%2C331&ssl=1
[5]: https://itsfoss.com/package-manager/
[6]: https://itsfoss.com/pacman-command/
[7]: https://itsfoss.com/install-rust-cargo-ubuntu-linux/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/01_exa.webp?resize=800%2C600&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/02_exa_lh.webp?resize=800%2C600&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/03_exa_git.webp?resize=800%2C600&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/04_exa_all_flags.webp?resize=800%2C600&ssl=1
[12]: https://github.com/ogham/exa#command-line-options
[13]: https://github.com/ogham/exa
