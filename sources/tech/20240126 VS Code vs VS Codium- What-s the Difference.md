[#]: subject: "VS Code vs VS Codium: What's the Difference?"
[#]: via: "https://itsfoss.com/vs-code-vs-codium/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1705972010"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

VS Code vs VS Codium: What's the Difference?
======

The [VS Codium][1] is a VS Code clone that is 100% free and open-source.

But you may wonder "VS Code is also free and open-source" Then why does VS Codium even exist? **The first reason is Microsoft owns VS Code.**

If that's not enough, there are other reasons as well:

  * Telemetry is enabled by default
  * Has some proprietary elements



So those were the reasons why VS Codium exists. I'm yet to share the detailed difference between VS Code and VS Codium.

### The difference between VS Code and VS Codium

In my opinion, VS Code is the best text editor for GUI as you get support for almost every programming language. Thee are extensions to make things easy, and tricks for better productivity such as the ability to [comment out multiple lines at once][2] and seamless GitHub integration.

But what triggers me about VS Code is that _it is marketed as open source but it is not_.

Yes, some [parts of the VS Code are proprietary][3] and as it is backed by Microsoft, for many people that's a good enough reason to find an alternative and there comes the VS Codium.

But before I walk you through the detailed comparison, here's a quick comparison between VS Code and VS Codium:

| VS Code | VS Codium
---|---|---
Extensions | Has support for more extensions including proprietary ones. | Does not support proprietary extensions and supports fewer extensions compared to VS Code.
License | Microsoft's restricted license which won't let you modify and distribute VS Code. | Published under MIT license so you can modify and distribute VS Codium without any restriction.
Privacy | All the telemetry options are enabled by default to track your behavior. | No telemetry is enabled by default.
Support | Backed by Microsoft, you'll find every help possible on the internet, and has rich documentation as well. | While you can expect good community support but it is quite less compared to VS Code due to fewer users.

#### 1\. Extensions (the elephant in the room)

By far this is the biggest difference between VS Code and VS Codium where you are not given access to the same amount of extensions.

(VS Code has support for more extensions including proprietary ones)

Let me explain.

VS Codium uses its Open VSX registry for its extension library as an extension to the marketplace API used by VS Code and is a new project, so you don't get access to every extension you have in VS Code.

The other thing is proprietary extensions are not supported by VS Codium.

In my testing, I was not able to find these 4 extensions that I use on VS Codium:

  * C#
  * Live Share
  * IntelliCode
  * Azure Dev Spaces



![Extension search difference between VS Code and VS Codium][4]

In the above image, you can clearly see that VS Code has support for larger number of extensions and it is the only option when you want to work with proprietary ones.

So make sure you check important extensions are supported by VS Codium before you make a switch.

#### 2\. Licencing

The VS Codium is released under [an MIT license][5] which allows users to freely use, modify, and distribute the software without any restrictions.

Whereas the VS Code is released under [Microsoft's license][6] which only lets you use the product and restricts you to modify and re-distribute the product.

#### 3\. Telemetry

For those who don't know, telemetry is a feature that collects and sends data anonymously to the software provider. This includes information like how a user interacts with their product, features they frequently use, and issues you've encountered so far.

VS Codium being a community-driven project, is focused on privacy and is one of the major reasons behind its existence so it does not come with any telemetry or tracking.

On the other hand, VS Code collects telemetry so Microsoft can learn more about how you interact with VS Code. But if you are uncomfortable with it, you can disable this feature (unlike Windows OS):

![VS Code sends all the data by default][7]

#### 4\. Integration

VS Code offers integrated services that are not available in VS Codium mainly because of the marketplace. For example, you can use Live Share to collaborate with others for editing and debugging.

Another good example is Azure extensions that let you easily connect to Azure servers and get the job done with the least effort possible.

You can not expect such integration with VS Codium but that only applies to the Microsoft services. If you don't use other services by Microsoft, the whole "integration" point is irrelevant for you.

#### 5\. Support

VS Code is backed by Microsoft, you will find extensive support and documentation available. The number of users also plays a crucial role and VS Code users are definitely more than the VS Codium.

Sure, it does not mean if you use VS Codium there'll be no one to get you out of the trouble but it may not have the same level of support you'd get with VS Code.

### Which one to use?

I'll make it easy for you to choose. I'll give you two points so you can decide what matters the most for you:

  * If you want a 100% open-source text editor and you can compromise some extensions and features, then go with VS Codium.
  * Use VS Code to get support for proprietary extensions if you are OK with Microsoft's license and how they deal with user data.



Let me know which one you use or plan to use with your favorite feature.

--------------------------------------------------------------------------------

via: https://itsfoss.com/vs-code-vs-codium/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/vscodium/
[2]: https://itsfoss.com/comment-multiple-lines-vs-code/
[3]: https://github.com/microsoft/vscode/wiki/Differences-between-the-repository-and-Visual-Studio-Code#visual-studio-code
[4]: https://itsfoss.com/content/images/2024/01/Extension-difference-between-VS-Code-and-VS-Codium.png
[5]: https://itsfoss.com/open-source-licenses-explained/
[6]: https://code.visualstudio.com/license
[7]: https://itsfoss.com/content/images/2024/01/Telemetry-is-set-to-send-all-the-data-by-default-in-VS-Code.png
