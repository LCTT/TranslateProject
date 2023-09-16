[#]: subject: "Coding in Rust? Here's a New IDE by JetBrains"
[#]: via: "https://news.itsfoss.com/rust-ide-jetbreains/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Coding in Rust? Here's a New IDE by JetBrains
======
Rust developers, you have something new to try out!
After recently announcing that IntelliJ-based IDEs [will support][1] the Wayland [display server][2] protocol, JetBrains has unveiled a **new IDE for Rust Developers**.

Called the “ **RustRover** ”, it aims to be **a feature-packed standalone Rust IDE** that is set to receive regular updates, quick support, and an “out-of-the-box experience”.

Allow me to show you what it has to offer.

📋

This is an early access tool not meant for production usage right now.

### RustRover: What to Expect?

![][3]

🚧

RustRover is not FOSS.

Developed from the ground up, RustRover **replaces the now deprecated[IntelliJ Rust][4] plugin** that used to handle Rust support on the JetBrains platform.

It has been built in line with JetBrains' other IDEs for providing **a dedicated Rust development environment** , that was missing previously.

💡

RustRover also uses the IntelliJ Rust plugin as a building block.

In its current state, RustRover has support for languages and technologies such as **Rust** , **Cargo** , **TOML** , **web** , and **database**. With the **additional functionality of[IntelliJ IDEA][5]**, including **[VCS integration][6]**.

And, as for its features, there are quite a few! 🗒️

**For coding,** it has support for **code completion** , **code generation** , **smart refactoring** , **live templates** , and more. RustRover has been designed to help users write code faster, and more accurately.

It also features the essentials, like **syntax highlighting** , **macro expansion** , **cross-language actions** , etc. for helping understand the codebase better.

**For testing** , RustRover features test runners, a debugger, support for running configurations, run targets, profiling and performance analysis.

**For project management** , it has support for Cargo and 'Cargo.toml', build scripts, code completion in dependency declarations, with easy access to crates documentation.

RustRover also **features some neat real-time collaboration features** such as **support for[VCS][7]** ([Git][8] and [GitHub][9]), **configuration sharing** , and **[code with me][10]**.

You are maybe wondering; **what about its licensing and pricing model?**

Seeing as **RustRover is not** **open-source** , JetBrains has **plans to sell it as a commercial product on a subscription basis** , similar to its other IDE offerings.

The pricing structure is yet to be finalized, but expect something similar to what they have been charging for their IDE products.

You can go through their [announcement blog][11] to know more about RustRover.

📋

Seeing that we are on the topic of Rust, why not give our [Rust Basics series][12] a try? It should act as a nice introduction into the world of Rust.

**Suggested Read** 📖

![][13]

**Want to give it a try?**

RustRover has been made available as **a tar.gz package** , **a JetBrains Toolbox App** , and as **a Snap for Ubuntu**. You can grab the package of your choice from the [official website][14].

[RustRover][14]

For Ubuntu, you can also run this command:

```

    sudo snap install jetbrains rustrover --classic

```

Do note that, at the time of writing this article, the **Snap package was not working as expected** , throwing an error during install when using the above-mentioned command.

JetBrains have **planned to keep RustRover in public review until September 2024** , with scope for the release of a stable version before that.

_💬 Would you be interested in using such an IDE for coding in Rust? Share your thoughts in the comments below!_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/rust-ide-jetbreains/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/intellij-wayland-support/
[2]: https://itsfoss.com/display-server/
[3]: https://news.itsfoss.com/content/images/2023/09/RustRover_IDE.png
[4]: https://intellij-rust.github.io/
[5]: https://www.jetbrains.com/idea/
[6]: https://www.jetbrains.com/help/youtrack/cloud/Integration-with-Version-Control-Systems.html
[7]: https://en.wikipedia.org/wiki/Version_control
[8]: https://git-scm.com/
[9]: https://github.com/
[10]: https://www.jetbrains.com/code-with-me/
[11]: https://blog.jetbrains.com/rust/2023/09/13/introducing-rustrover-a-standalone-rust-ide-by-jetbrains/
[12]: https://itsfoss.com/tag/rust-basics/
[13]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[14]: https://www.jetbrains.com/rust/download/
