[#]: subject: (Test Your Typing Speed in Linux Terminal With Ttyper)
[#]: via: (https://itsfoss.com/ttyper/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Test Your Typing Speed in Linux Terminal With Ttyper
======

There are several ways to test and improve your typing speed. You can use online tools, install dedicated applications on the desktop or test in the Linux terminal.

Linux terminal? That’s right. From [browsing internet][1] to [playing games][2], you can do [so many fun things in the mighty Linux terminal][3]. Testing your typing speed is one of them.

### Ttyper: Terminal-based typing test tool

[Ttyper][4] is a tool written in [Rust][5] that allows you to practice your touch typing.

It gives a random selection of some of the most common English words. The correct typed words are highlighted in green and the incorrect ones in red and this happens in real time. You can press backspace and correct the words but that will contribute to a reduced score.

![][6]

When you finish typing all the displayed words, you get the result with your typing speed in words per minute, accuracy and number of correct keypresses. You can _**use Ctrl+C to exit**_ Ttyper if you are not in a mood for typing the entire section.

![][7]

You can see Ttyper in action in this GIF recorded by the developer.

![][8]

By default, you get 50 words to practice but you may expand that with command options. You can also use a custom text file and use its content to practice typing.

Command | Contents
---|---
ttyper | 50 of the 200 most common English words
ttyper -w 100 | 100 of the 200 most common English words
ttyper -w 100 -l english1000 | 100 of the 1000 most common English words
ttyper text.txt | contents of test.txt split at whitespace

Ttyper also focuses on developers. It supports several programming languages and if you are a programmer, you may use it to test and improve your typing while you code.

![][9]

As of now, C, Csharp, Go, HTML, Java, JavaScript, Python, Ruby and Rust languages are supported.

You may change the language in the following manner:

```
ttyper -l html
```

By the way, the double ‘T’ in ‘Ttyper’ is not a typo. It is deliberate as TTY (**T**ele**TY**pewriter) represent the [terminal emulator][10], an indication that it is a terminal tool.

**Recommended Read:**

![][11]

#### [Present Slides in Linux Terminal With This Nifty Python Tool][12]

There are so many amusing and fun stuff you can do in the terminal. Making and presenting slides is just one of them.

### Installing Ttyper on Linux

Ttyper is built with Rust and you can install it on any Linux distribution that has support for Rust programming language and its [Cargo package manager][13].

Cargo is the Rust equivalent to Python’s PIP. There is a [central repository][14] and you can download and install the Rust packages along with its dependencies easily with Cargo.

I am going to add the instructions for installing Cargo on Ubuntu-based Linux distributions. You should be able to install it using your [distribution’s package manager][15].

Please make sure that you have universe repository enabled on Ubuntu. You can install Cargo with this command:

```
sudo apt install cargo
```

It will install Cargo package manager along with `rustc` package for Rust language.

Once you have Cargo installed on your system, use it install Ttyper with this command:

```
cargo install ttyper
```

This will add an executable rust file in .cargo/bin directory under your home directory. It will be mentioned at the end of the output of the package installation.

![][16]

You may switch to this directory:

```
cd ~/.cargo/bin
```

and run the ttyper executable:

```
ttyper
```

Of course, it’s not very convenient. This is why you should [add this directory to the PATH variable][17]. If you are familiar with the Linux command line, you can easily do that.

Unfortunately, I cannot give you the exact commands here because you need to provide the absolute PATH to this directory and that path name will differ based on your username. For example, for me, it is /home/abhishek/.cargo/bin. This absolute PATH will be different for you.

I advise reading about [absolute and relative path][18] for more clarity on this topic.

You can uninstall Ttyper by removing the binary file or use Cargo command in this manner:

```
cargo uninstall ttyper
```

If you like this nifty terminal tool, [star it on GitHub][4] to appreciate the developer’s effort.

As I mentioned at the beginning of this article, you can do a lot of cool stuff in the terminal. If you want to surprise your colleagues, maybe you can try [making presentation slides entirely in the Linux terminal][12].

--------------------------------------------------------------------------------

via: https://itsfoss.com/ttyper/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/terminal-web-browsers/
[2]: https://itsfoss.com/best-command-line-games-linux/
[3]: https://itsfoss.com/funny-linux-commands/
[4]: https://github.com/max-niederman/ttyper
[5]: https://www.rust-lang.org/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/ttyper-typing-speed-test-linux.png?resize=800%2C441&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/ttyper-typing-test-result.png?resize=800%2C547&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/ttyper.gif?resize=800%2C498&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/ttyper-typing-test-html.png?resize=800%2C441&ssl=1
[10]: https://itsfoss.com/linux-terminal-emulators/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/linux-terminal-presentation.jpg?fit=800%2C450&ssl=1
[12]: https://itsfoss.com/presentation-linux-terminal/
[13]: https://doc.rust-lang.org/cargo/index.html
[14]: https://crates.io/
[15]: https://itsfoss.com/package-manager/
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/installing-ttyper-linux.png?resize=800%2C399&ssl=1
[17]: https://itsfoss.com/add-directory-to-path-linux/
[18]: https://linuxhandbook.com/absolute-vs-relative-path/
