[#]: subject: "How to Install Visual Studio Code Extensions"
[#]: via: "https://itsfoss.com/install-vs-code-extensions/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: "CoWave-Fall"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Visual Studio Code Extensions
======

_**Brief: Learn how to search for extensions and install them in Visual Studio Code editor. Both GUI and command line methods have been discussed.**_

Microsoft’s [Visual Studio Code][1] is perhaps the most popular [open source code editor][2], after Vim (of course).

Visual Studio Code provides an amazing “out of the box” experience by providing almost all of the IDE like features. But there are always things you wish Visual Studio Code could do. _“The grass is always greener on the other side.”_

The [Visual Studio Code Marketplace][3] is exactly where you will find the extensions for Visual Studio Code. Extensions that are published on the Visual Studio Code Marketplace are scanned for viruses before they are published. So these extensions can be [trusted][4].

### Installing extensions in Visual Studio Code

You don’t need to go to the Marketplace website for installing extensions. You can install and manage extensions right from the editor itself.

I hope you have [Visual Studio Code installed on Linux][5] or whichever operating system you are using.

Open Visual Studio Code, and to the left most side, is the Activity Bar. The last button on the Activity Bar is the Extensions button. Clicking on that will expose you to the enormous wealth of the extensions available for installation on Visual Studio Code.

![Accessing the Extensions tab in VS Code][6]

_**You can also press the Shortcut Key combination `Ctrl + Shift + X` to launch the Extensions side pane.**_

If you do not have any extensions installed, you will see a list of the most popular extensions available on the Visual Studio Code Marketplace. There are extensions you wish Visual Studio Code already had. And then, some day you will discover an extension and wonder how you lived without it!

#### Find an extension and install it from the editor (GUI method)

Now is the time to try out that `vim` thing Linux people talk about *nudge nudge* ;)

Just kidding. Let us install something more beginner friendly and something that a beginner can easily take advantage of, without much practice.

Click on **Visual Studio IntelliCode** (#1) extension from the list presented of the most popular extensions.

![How to install an extension like Visual Studio IntelliCode][7]

Simply clicking on the **Install** button (#2) will install the **Visual Studio IntelliCode** extension. This extension gives you AI-predicted suggestions while you are writing code.

Once installed, you will be able to take full advantage of this extension. Try typing a block of code in your preferred programming language and check if the suggested AI autocomplete is working out for you, and not causing any kind of slowdown in your workflow.

![Managing an installed extension in Visual Studio Code][8]

If you dislike any of the installed extension, you can simply click on the **Uninstall** button (#2) to completely remove the unwanted extension.

If you have multiple extensions installed, and if you feel like one of the installed extensions is causing you problems – say like sudden crashes; You can simply disable one (or multiple) extension(s) simply by clicking on the **Disable** button (#1) and check if extension _x_ was acting up or was it extension _y_, or was it something different altogether.

Considering that extension removal and re-installation takes a long time, disabling extensions can be handy when you have multiple extensions installed.

#### Alternate method: Install extensions using the terminal

Did you know you could install a Visual Studio Code extension from the terminal itself? Well, now you do!

To install an extension from your terminal, you need to know the extension name and publisher name in the order of `publisher.extension`. For an example, if you want to install the same extension as you did before, Visual Studio IntelliCode, it’s publisher name and extension name is `VisualStudioExptTeam.vscodeintellicode`.

To find out this unique identifier of any extension, firstly, [visit the Visual Studio Code Marketplace][9] in your browser of choice.

![A screenshot of what Visual Studio Code Marketplace looks like][10]

Then search for any extension, for this tutorial, I will focus on installing Visual Studio IntelliCode. And then open the page of the extension that you want to install.

![Search for Visual Studio IntelliCode and open the extension webpage][11]

Once you have the web page of your extension open, you will see a code block. In the screenshot of the extension web page below is the highlighted unique identifier of the extension.

![Unique identifier of the extension Visual Studio Code][12]

Once you have the unique code of the extension you desire to install – **VisualStudioExptTeam.vscodeintellicode** in this case, you can proceed by running the following command in your terminal.

```
code --install-extension VisualStudioExptTeam.vscodeintellicode
```

Like the GUI, the command line interface also allows you to install, disable, remove and manage extensions.

There is a handy flag that will give you a list of all the extensions you have installed. You can do that by running the following command:

```
code --list-extensions
```

To disable a single extension, run this command:

```
code --disable-extension <YOUR-EXTENSION-ID>
```

If you want to disable all extensions, you can run the following command:

```
code --disable-extensions
```

The above command will disable **all** installed extensions. This will help you diagnose if extensions are causing problems or is it Visual Studio Code itself.

Now, if you want to completely remove any extension, use this command:

```
code --uninstall-extension <YOUR-EXTENSION-ID>
```

### Conclusion

I find it much easier to use the editor for installing VS Code extensions. It’s straight in the editor where I code after all.

Once you are comfortable tinkering with Visual Studio Code, maybe checkout this article pointing out some [useful keyboard shortcuts for Visual Studio Code][13] that might help you get even more productive!

Happy coding, fellow *nix user! :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-vs-code-extensions/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://code.visualstudio.com/
[2]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[3]: https://marketplace.visualstudio.com/VSCode
[4]: https://code.visualstudio.com/docs/editor/extension-marketplace#_can-i-trust-extensions-from-the-marketplace
[5]: https://itsfoss.com/install-visual-studio-code-ubuntu/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/01-all-extensions-1.webp?resize=800%2C450&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/02-select-intellicode-1.webp?resize=800%2C450&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/03-intellicode-installation-done-1.webp?resize=800%2C450&ssl=1
[9]: https://marketplace.visualstudio.com/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/visual_studio_code_marketplace.webp?resize=800%2C450&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/visual_stuido_code_ext_search.webp?resize=800%2C450&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/vs_code_extension_identifier.webp?resize=800%2C450&ssl=1
[13]: https://itsfoss.com/vs-code-shortcuts/
