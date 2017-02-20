React Native Ubuntu 简介
=====================

在 Canonical 的 Webapps 团队，我们总在寻找可以为开发者所用的 web 和 web 相关技术。我们想让每个人生活更轻松，让 web 开发者更加熟悉工具的使用，并且在 Ubuntu 上提供一个使用它们的简单途径。

我们提供对 web 应用以及创建和打包 Cordova 应用的支持，这使得在 Ubuntu 上使用任意 web 框架来创造美妙的应用体验成为可能。

其中一个可以在这些情景中使用的主流框架就是 React.js。React.js 是一个拥有声明式编程模型和强大的组件系统的 UI 框架，它主要侧重于 UI 的构建，所以你可以在你喜欢的任何地方用上它。

然而这些应用场景太广泛了，有时候你可能需要更高的性能，或者能够直接用原生 UI 组件来开发，但是在一个不太熟悉的场景中使用它可能不合时宜。如果你熟悉 React.js，那么通过 React Native 来开发可以毫不费力地将你所有现有的知识和工具迁移到完全的原生组件开发中。React Native 是 React.js 的姐妹项目，你可以用同样的方式和代码来创建一个直接使用原生组件并且拥有原生级别性能的应用，而且这就和你期待的一样轻松快捷。

![](http://i.imgur.com/ZsSHWXP.png)

我们很高兴地宣布随着我们对 HTML5 应用的支持，现在可以在 Ubuntu 平台上开发 React Native 应用了。你可以移植你现有的 iOS 或 Android 版本的 React Native 应用，或者利用你的 web 开发技能来创建一个新的应用。

你可以在 [这里][1] 找到 React Native Ubuntu 的源代码，要开始使用时，跟随 [README-ubuntu.md][2] 的指导，并创建你的第一个应用吧。

Ubuntu 的支持包括生成软件包的功能。通过 React Native CLI，构建一个 snap 软件包只需要简单执行 `react-native package-ubuntu --snap` 这样的命令。还可以为 Ubuntu 设备构建一个 click 包，这意味着 React Native Ubuntu 应用从一开始就可以放到 Ubuntu 商店了。

在不久的将来会有很多关于在 Ubuntu 上开发一个 React Native 应用你所需要了解的东西的博文，例如创建应用、开发流程以及打包并发布到商店等等。还会有一些关于怎样开发新型的可复用的模块的信息，这些模块可以给运行时环境增加额外的功能，并且可以发布为 npm 模块。

赶快去实践一下吧，看看你能创造出些什么来。

--------------------------------------------------------------------------------

via: https://developer.ubuntu.com/en/blog/2016/08/05/introducing-react-native-ubuntu/

作者：[Justin McPherson][a]
译者：[Mars Wong](https://github.com/OneNewLife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://developer.ubuntu.com/en/blog/authors/justinmcp/
[1]: https://github.com/CanonicalLtd/react-native
[2]: https://github.com/CanonicalLtd/react-native/blob/ubuntu/README-ubuntu.md
