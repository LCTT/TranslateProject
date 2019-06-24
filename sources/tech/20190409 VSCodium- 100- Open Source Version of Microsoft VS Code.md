[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (VSCodium: 100% Open Source Version of Microsoft VS Code)
[#]: via: (https://itsfoss.com/vscodium/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

VSCodium: 100% Open Source Version of Microsoft VS Code
======

_**Brief: VSCodium is a fork of Microsoft’s popular Visual Studio Code editor. It’s identical to VS Code with the single biggest difference that unlike VS Code, VSCodium doesn’t track your usage data.**_

Microsoft’s [Visual Studio Code][1] is an excellent editor not only for web developers but also for other programmers. Due to its features, it’s considered one of the best open source code editors.

Yes, it’s one of the many open source products from Microsoft. You can [easily install Visual Studio Code in Linux][2] thanks to the ready to use binaries in the form of DEB, RPM and Snap packages.

And there is a problem which might not be an issue for a regular user but significant to an open source purist.

The ready to use binaries Microsoft provides are not open source.

Confused? Let me explain.

The source code of VS Code is open sourced under MIT license. You can access it on the [GitHub][3]. However, the [installation files that Microsoft has created contain proprietary telemetry/tracking][4].

This tracking basically collects usage data and sends it to Microsoft to ‘help improve their products and services’. Telemetry reporting is common with software products these days. Even [Ubuntu does that but with more transparency][5].

You can [disable the telemetry in VS Code][6] but can you trust Microsoft completely? If the answer is no, then what are your options?

You can build it from the source code and thus keep everything open source. But [installing from source code][7] is not always the prettiest option specially in today’s world when we are so used to of having binaries.

Another option is to use VSCodium!

### VSCodium: 100% open source form of Visual Studio Code

![][8]

[VSCodium][9] is a fork of Microsoft’s Visual Studio Code. This project’s sole aim is to provide you with ready to use binaries without Microsoft’s telemetry code.

[][10]

Suggested read  SuiteCRM: An Open Source CRM Takes Aim At Salesforce

This solves the problem where you want to use VS Code without the proprietary code from Microsoft but you are not comfortable with building it from the source.

Since [VSCodium is a fork of VS Code][11], it looks and functions exactly the same as VS Code.

Here’s a screenshot of the first run of VS Code and VSCodium side by side in Ubuntu. Can you distinguish one from another?

![Can you guess which is VSCode and VSCodium?][12]

If you have not been able to distinguish between the two, look at the bottom.

![That’s Microsoft][13]

Apart from this and the logo of the two applications, there is no other noticeable difference.

![VSCodium and VS Code in GNOME Menu][14]

#### Installing VSCodium on Linux

While VSCodium is available in some distributions like Parrot OS, you’ll have to add additional repositories in other Linux distributions.

On Ubuntu and Debian based distributions, you can use the following commands to install VSCodium.

First, add the GPG key of the repository:

```
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
```

And then add the repository itself:

```
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
```

Now update your system and install VSCodium:

```
sudo apt update && sudo apt install codium
```

You can find the [installation instructions for other distributions on its page][15]. You should also read the [instructions about migrating from VS Code to VSCodium][16].

**What do you think of VSCodium?**

Personally, I like the concept of VSCodium. To use the cliche, the project has its heart in the right place. I think, Linux distributions committed to open source may even start including it in their official repository.

What do you think? Is it worth switching to VSCodium or would you rather opt out of the telemetry and continue using VS Code?

And please, no “I use Vim” comments :D

--------------------------------------------------------------------------------

via: https://itsfoss.com/vscodium/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://code.visualstudio.com/
[2]: https://itsfoss.com/install-visual-studio-code-ubuntu/
[3]: https://github.com/Microsoft/vscode
[4]: https://github.com/Microsoft/vscode/issues/60#issuecomment-161792005
[5]: https://itsfoss.com/ubuntu-data-collection-stats/
[6]: https://code.visualstudio.com/docs/supporting/faq#_how-to-disable-telemetry-reporting
[7]: https://itsfoss.com/install-software-from-source-code/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/vscodium.png?resize=800%2C450&ssl=1
[9]: https://vscodium.com/
[10]: https://itsfoss.com/suitecrm-ondemand/
[11]: https://github.com/VSCodium/vscodium
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/vscodium-vs-vscode.png?resize=800%2C450&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/microsoft-vscode-tracking.png?resize=800%2C259&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/vscodium-and-vscode.jpg?resize=800%2C220&ssl=1
[15]: https://vscodium.com/#install
[16]: https://vscodium.com/#migrate
