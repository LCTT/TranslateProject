[#]: subject: "Visual Studio Code or Atom? Which Code Editor Should You Use?"
[#]: via: "https://itsfoss.com/visual-studio-code-vs-atom/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Visual Studio Code or Atom? Which Code Editor Should You Use?
======

Finding a [good open source code editor][1] is not hard these days, choosing one can be.

Microsoft’s [Visual Studio Code][2] and GitHub’s [Atom][3] are two of the most popular, feature-rich, IDE-like code editors that have a huge user base and fan following.

Both VS Code and Atom belong to Microsoft now because Atom’s original developer GitHub is now owned by Microsoft. They have an interesting, modern UI with a pretty looking native dark theme. Both editors use [Electron][4] for the user interface.

The similarities are plenty and this is why it is easy to get confused between choosing one of them for your coding set up.

If you cannot make up your mind and want to compare and choose between one VS Code and Atom, this article should help you decide for yourself.

### Visual Studio Code

![Visual Studio Code’s User Interface with a busy project interface][5]

[Visual Studio Code][2] (A.K.A. VS Code) is one of the modern open source code editors. Its user-base explode because of its IDE-like features but still remaining relatively light on resources.

Visual Studio Code was made by Microsoft and is available on Linux, macOS and Windows. Microsoft released _most_ of the source code of Visual Studio Code on [GitHub][6] under the MIT License on 18th November 2015.

VS Code developers have done some fantastic optimizations with Electron to make it as lightweight and efficient as possible. And since Electron apps work on a majority of operating systems, users of Linux, macOS and Windows can all benefit from these optimizations.

[Installing VS Code on Linux][7] is pretty simple too. It is in fact available in the software center of many distributions.

#### Why you should opt for Visual Studio Code

  * Visual Studio Code is [generally] chosen by folks who want a near-IDE functionality from the start and do not want to fiddle with their code editor.
  * Visual Studio Code, even though based on Electron, has very little overhead compared to other Electron apps (GitHub’s Atom).
  * More out-of-the-box functionality like Microsoft’s IntelliSense auto-complete, Git integration, Markdown support.
  * Plug-ins can only add features, themes and add support for new languages; and this plug-in constraint ensures the editor’s core stays familiar even after adding new plug-ins.



The binary releases [distributed by Microsoft][8] are still proprietary freeware. [VSCodium][9] builds upon the publicly open source code of Visual Studio Code. However, the discussion on VSCodium is beyond the scope of this article, except for considering it as a viable alternative to Visual Studio Code if you want the functionality Visual Studio Code offers, but without any proprietary elements to it.

### Atom

![User Interface of the Atom editor][10]

[GitHub’s Atom][3] is another free and open source code editor available for Linux, macOS and Windows. Atom is a desktop application made with Electron for easy package development using JavaScript.

Atom’s source code was released under the MIT License [on GitHub][11]. Since Atom is a GitHub product, it has Git Control embedded in it.

Atom is dubbed as the “hackable text editor for the 21st Century” because of it complete customizability using HTML, CSS and JS.

Like VS Code, you can easily [install Atom on Linux][12] and other platforms.

#### Reasons to choose Atom

  * Atom is preferred by people who want a bare-bones editor and want to build upon it because of Atom’s hackable nature.
  * In-built Git and complete GitHub integration; not surprising considering it is developed by GitHub
  * [Atom’s plug-ins][13] are very easy to search, install and upgrade, from the app itself.
  * Plug-ins available for Atom are very extensible, and can end up completely changing the editor’s functionality and end up creating almost a new editor; It truly is “hackable”.
  * Atom’s binary releases and its source code are fully open source (unlike Visual Studio Code’s binary releases containing proprietary parts + telemetry).
  * You can [turn Atom from a code editor to IDE][14] with smarter context-aware auto-completion, code navigation features, document formatting and more.



### Conclusion

Both Atom and VS Code are built on Electron. But Microsoft has done more optimization on VS Code to make it as lightweight as possible.

At this point, VS Code is like Ubuntu, ships with almost everything out of the box. While Atom is like Arch, minimal and extremely hackable (extendable).

Both, Atom and VS Code technically are under Microsoft and eventually will reach feature parity. Hence, it is best to go with the editor your community (Web dev/Soft dev) leans towards and pave the path ahead. Maybe you end up with Vim!

--------------------------------------------------------------------------------

via: https://itsfoss.com/visual-studio-code-vs-atom/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[2]: https://code.visualstudio.com/
[3]: https://atom.io/
[4]: https://www.electronjs.org/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/04_visual_studio_code.png?resize=800%2C544&ssl=1
[6]: https://github.com/microsoft/vscode
[7]: https://itsfoss.com/install-visual-studio-code-ubuntu/
[8]: https://code.visualstudio.com/Download
[9]: https://vscodium.com/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/05_atom.png?resize=800%2C527&ssl=1
[11]: https://github.com/atom/atom
[12]: https://itsfoss.com/install-atom-ubuntu/
[13]: https://itsfoss.com/install-packages-in-atom/
[14]: https://ide.atom.io/
