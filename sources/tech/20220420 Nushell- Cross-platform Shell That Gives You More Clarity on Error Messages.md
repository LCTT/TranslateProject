[#]: subject: "Nushell: Cross-platform Shell That Gives You More Clarity on Error Messages"
[#]: via: "https://itsfoss.com/nushell/"
[#]: author: "Marco Carmona https://itsfoss.com/author/marco/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Nushell: Cross-platform Shell That Gives You More Clarity on Error Messages
======

_**Brief:** Nushell is a unique type of shell that provides easy-to-read error messages and offers cross-platform support. Find out more about it here._

Even if you are not interested in using the terminal, the Linux terminal often makes some of the heavy lifting more effortless and lets you fix stuff. So, is safe to say that the Linux terminal is pretty powerful if you know what you’re doing.

And that is true! But the problem appears when you get an error. If you don’t have enough experience using it, you won’t know how to solve it.

While the error messages try to convey the best meaning of the problem, not every user can easily decode the fix. It usually takes a bit of research for beginners. But, if the error can have more clarity, the user could be able to fix it sooner.

Not just limited to the error message, the structure of the output you get in your terminal to browse files, for example, is not the prettiest.

![Terminal listing several files][1]

**Do you see what I mean?** Of course, this could become more complex when you have more files of distinct types. And, you get no idea about file permissions, groups, etc with the output you get with the basic ls command.

That’s where Nushell tries to solve the problem.

### Nushell: A Shell That Provides User-Friendly Output by Default

![Nushell example screenshot][2]

Nu, as it’s also called, it takes its philosophy and inspiration from projects like [PowerShell][3], functional programming languages, and modern [CLI][4] tools.

Let me give you an example, imagine you want to list only the output with a type equal to the file inside your home directory, including the hidden files. Well, to achieve this it is as easy as just typing the following command:

```

    ls -a | where type == 'file'

```

![Listing only files with Nushell][5]

Observe how clear and simple its syntax is; now imagine how easy it could be to find the process and name ID, its status, and CPU or memory consumed with the Nushell. **It’s part of its magic!**

It tries its best to provide user-friendly output for the commands you enter, organized in a specific structure.

### Features of Nushell

![Error messages in Nu, one of its primary highlights][6]

As per the official information available, some of its most popular features include:

  * **Pipelines to control any OS.** Nu works on Linux, macOS, and Windows. In other words, being a flexible cross-platform shell with a modern feel.
  * **Everything is data.** Nu pipelines use structured data, so you can safely select, filter, and sort the same way every time.
  * **Powerful plugins.** It’s easy to extend Nu functionalities using a powerful plugin system.
  * **Easy to read error messages.** Nu operates on typed data, so it catches bugs that other shells don’t. And when things break, Nu tells you exactly where and why.
  * Clean IDE support.



You can take a look at its [official documentation][7] for a thorough look at its features and usage.

### Installing Nushell in your system

Unfortunately, if you’re an Ubuntu user like me, you won’t find an apt repository to install Nushell. But, you can build it by installing the required dependencies, as per its instructions on [GitHub][8].

Fortunately, there is a way to install it on any distro, using **Homebrew**. Head to its official website to explore more installation options.

[Nushell][9]

You can refer to our tutorial on [installing and using Homebrew Package Manager on Linux][10]. Once you successfully set it up on Linux, you need to type in the following command to install Nushell:

```

    brew install nushell

```

![Installing nushell with Homebrew][11]

Once the process is finished, just type `nu` to start the Nushell shell. **That’s it!**

If you’d like to set Nushell as your default shell, you can do it with the command **chsh**, but remember, it is still in development, that’s why we do not recommend it for everyday use.

However, you can explore more about it on its website or the [GitHub page][8] before you decide to try it.

What do you think about this interesting shell? Let me know your thoughts in the comments down below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/nushell/

作者：[Marco Carmona][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/marco/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/wp-content/uploads/2022/04/Terminal-with-several-files-800x477.png
[2]: https://itsfoss.com/wp-content/uploads/2022/04/Nushell-example-800x475.jpg
[3]: https://itsfoss.com/microsoft-open-sources-powershell/
[4]: https://itsfoss.com/gui-cli-tui/
[5]: https://itsfoss.com/wp-content/uploads/2022/04/Listing-only-files-with-nushell-800x246.png
[6]: https://itsfoss.com/wp-content/uploads/2022/04/Error-messages-in-Nu-800x259.png
[7]: https://www.nushell.sh/book/
[8]: https://github.com/nushell/nushell
[9]: https://www.nushell.sh/
[10]: https://itsfoss.com/homebrew-linux/
[11]: https://itsfoss.com/wp-content/uploads/2022/04/Installing-nushell-with-brew-800x470.png
