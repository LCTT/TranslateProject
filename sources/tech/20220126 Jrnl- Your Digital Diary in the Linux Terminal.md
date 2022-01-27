[#]: subject: "Jrnl: Your Digital Diary in the Linux Terminal"
[#]: via: "https://itsfoss.com/jrnl/"
[#]: author: "Marco Carmona https://itsfoss.com/author/marco/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Jrnl: Your Digital Diary in the Linux Terminal
======

Imagine this: somebody has broken your heart and what you want is to write your feelings in a journal without distraction. Did you get the idea? No? Neither do I. I am not heartbroken (or maybe I am and I don’t want to tell you).

But I would still like to show you a wonderful minimalistic open-source, note-taking application to keep journal entries.

This handy little program is [Jrnl][1] and it lets you create, search and view journal entries right in the terminal.

Creating new notes with Jrnl is as simple as writing this:

```

    jrnl yesterday: I read an amazing article on It’s FOSS. I learn about a minimalist app called Jrnl, I should try it.

```

Looks easy, isn’t it? The keyword yesterday is a trigger here and it saves your note to yesterday’s date. Remember that it’s called Jrnl (journal) for a reason. Its main aim is to keep journal.

If you like to keep a diary of your thoughts or simply want to try it out, let me share a few details on the installation and its usage.

### Installing and using Jnrl on your Linux system

Jrnl can be installed using pipx or Homebrew package managers.

I used Homebrew for my testing so I’ll list those steps. Get Homebrew first:

```

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

```

![Installing Homebrew on your system][2]

That’s all! If you need more information, we have a detailed tutorial on [installing Homebrew on Linux][3].

Once you have Homebrew package manager installed, use it to install Jrnl:

```

    brew install jrnl

```

![Installing Jrnl with Homebrew][4]

Once you have it installed, just initialize jrnl and start writing your random thoughts.

Do you remember the first example at the beginning of this article? Let’s take a look at it again!

```

    jrnl yesterday: I read an amazing article in It’s FOSS. I learn about a minimalist app called Jrnl, I should try it.

```

![Writing an entry][5]

In this line, I’m starting the program with the command `jrnl` next to a timestamp, which in this case is `yesterday`. I write a colon `:` to indicate that I will start writing something, and everything contained until a first sentence mark `.?!:` (in this case a period `.`) will be the title. Finally, everything next to this sentence mark will be considered the body of the file.

Currently, Jnrl has two modes: composing and viewing; the steps before are used to compose an entry but if what you want to view, for example, the entry that was written before, the syntax is also easy, what you only have to type is the next line.

```

    jrnl -on yesterday

```

![Viewing an entry][6]

Think that someone may read your journal and thoughts? You can also encrypt your entries.

That’s it! Of course, Jrnl has a lot more function, which can easily be found with the next line:

```

    jrnl --help

```

You can also refer to the documentation on [its official website][7]. Remember, the documentation is your best friend in an open-source project like this one. Enjoy it!

### Conclusion

Of course, Jrnl is not for everyone. Most command line utilities are not. But if you live and breath in the terminal and like to record your thoughts

Please don’t forget to share with us your personal experience in the comments; or even better, if you want to get this project to many more people you can share this post in various communities and forum.

--------------------------------------------------------------------------------

via: https://itsfoss.com/jrnl/

作者：[Marco Carmona][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/marco/
[b]: https://github.com/lujun9972
[1]: https://jrnl.sh/en/stable/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/Installing_brew.png?resize=800%2C131&ssl=1
[3]: https://itsfoss.com/homebrew-linux/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/installing_jrnl.png?resize=800%2C490&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/Writing_an_entry.png?resize=800%2C211&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/Viewing_an_entry.png?resize=800%2C159&ssl=1
[7]: https://jrnl.sh/en/stable/overview/
