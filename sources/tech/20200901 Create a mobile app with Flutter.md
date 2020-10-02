[#]: collector: (lujun9972)
[#]: translator: (gxlct008)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create a mobile app with Flutter)
[#]: via: (https://opensource.com/article/20/9/mobile-app-flutter)
[#]: author: (Vitaly Kuprenko https://opensource.com/users/kooper)

Create a mobile app with Flutter
======
Start your journey toward cross-platform development with the popular
Flutter framework.
![A person looking at a phone][1]

[Flutter][2] is a popular project among mobile developers around the world. The framework has a massive, friendly community of enthusiasts, which continues to grow as Flutter helps programmers take their projects into the mobile space.

This tutorial is meant to help you start doing mobile development with Flutter. After reading it, you'll know how to quickly install and set up the framework to start coding for smartphones, tablets, and other platforms.

This how-to assumes you have [Android Studio][3] installed on your computer and some experience working with it.

### What is Flutter?

Flutter enables developers to build apps for several platforms, including:

  * Android
  * iOS
  * Web (in beta)
  * macOS (in development)
  * Linux (in development)



Support for macOS and Linux is in early development, while web support is expected to be released soon. This means that you can try out its capabilities now (as I'll describe below).

### Install Flutter

I'm using Ubuntu 18.04, but the installation process is similar with other Linux distributions, such as Arch or Mint.

#### Install with snapd

To install Flutter on Ubuntu or similar distributions using [snapd][4], enter this in a terminal:


```
$ sudo snap install flutter --classic

$ sudo snap install flutter –classic
flutter 0+git.142868f from flutter Team/ installed
```

Then launch it using the `flutter` command. Upon the first launch, the framework downloads to your computer:


```
$ flutter
Initializing Flutter
Downloading <https://storage.googleapis.com/flutter\_infra\[...\]>
```

Once the download is finished, you'll see a message telling you that Flutter is initialized:

![Flutter initialized][5]

(Vitaly Kuprenko, [CC BY-SA 4.0][6])

#### Install manually

If you don't have snapd or your distribution isn't Ubuntu, the installation process will be a little bit different. In that case, [download][7] the version of Flutter recommended for your operating system.

![Install Flutter manually][8]

(Vitaly Kuprenko, [CC BY-SA 4.0][6])

Then extract it to your home directory.

Open the `.bashrc` file in your home directory (or `.zshrc` if you use the [Z shell][9]) in your favorite text editor. Because it's a hidden file, you must first enable showing hidden files in your file manager or open it from a terminal with:


```
`$ gedit ~/.bashrc &`
```

Add the following line to the end of the file:


```
`export PATH="$PATH:~/flutter/bin"`
```

Save and close the file. Keep in mind that if you extracted Flutter somewhere other than your home directory, the [path to Flutter SDK][10] will be different.

Close your terminal and then open it again so that your new configuration loads. Alternatively, you can source the configuration with:


```
`$ . ~/.bashrc`
```

If you don't see an error, then everything is fine.

This installation method is a little bit harder than using the `snap` command, but it's pretty versatile and lets you install the framework on almost any distribution.

#### Check the installation

To check the result, enter the following in the terminal:


```
`flutter doctor -v`
```

You'll see information about installed components. Don't worry if you see errors. You haven't installed any IDE plugins for working with Flutter SDK yet.

![Checking Flutter installation with the doctor command][11]

(Vitaly Kuprenko, [CC BY-SA 4.0][6])

### Install IDE plugins

You should install plugins in your [integrated development environment (IDE)][12] to help it interface with the Flutter SDK, interact with devices, and build code.

The three main IDE tools that are commonly used for Flutter development are IntelliJ IDEA (Community Edition), Android Studio, and VS Code (or [VSCodium][13]). I'm using Android Studio in this tutorial, but the steps are similar to how they work on IntelliJ IDEA (Community Edition) since they're built on the same platform.

First, launch **Android Studio**. Open **Settings** and go to the **Plugins** pane, and select the **Marketplace** tab. Enter **Flutter** in the search line and click **Install**.

![Flutter plugins][14]

(Vitaly Kuprenko, [CC BY-SA 4.0][6])

You'll probably see an option to install the **Dart** plugin; agree to it. If you don't see the Dart option, then install it manually by repeating the steps above. I also recommend using the **Rainbow Brackets** plugin, which makes code navigation easier.

That's it! You've installed all the plugins you need. You can check by entering a familiar command in the terminal:


```
`flutter doctor -v`
```

![Checking Flutter plugins with the doctor command][15]

(Vitaly Kuprenko, [CC BY-SA 4.0][6])

### Build your "Hello World" application

To start a new project, create a Flutter project:

  1. Select **New -&gt; New Flutter project**.

![Creating a new Flutter plugin][16]

(Vitaly Kuprenko, [CC BY-SA 4.0][6])

  2. In the window, choose the type of project you want. In this case, you need **Flutter Application**.

  3. Name your project **hello_world**. Note that you should use a merged name, so use an underscore instead of a space. You may also need to specify the path to the SDK.

![Naming a new Flutter plugin][17]

(Vitaly Kuprenko, [CC BY-SA 4.0][6])

  4. Enter the package name.




You've created a project! Now you can launch it on a device or by using an emulator.

![Device options in Flutter][18]

(Vitaly Kuprenko, [CC BY-SA 4.0][6])

Select the device you want and press **Run**. In a moment, you will see the result.

![Flutter demo on mobile device][19]

(Vitaly Kuprenko, [CC BY-SA 4.0][6])

Now you can start working on an [intermediate project][20].

### Try Flutter for web

Before you install Flutter components for the web, you should know that Flutter's support for web apps is pretty raw at the moment. So it's not a good idea to use it for complicated projects yet.

Flutter for web is not active in the basic SDK by default. To switch it on, go to the beta channel. To do this, enter the following command in the terminal:


```
`flutter channel beta`
```

![flutter channel beta output][21]

(Vitaly Kuprenko, [CC BY-SA 4.0][6])

Next, upgrade Flutter according to the beta branch by using the command:


```
`flutter upgrade`
```

![flutter upgrade output][22]

(Vitaly Kuprenko, [CC BY-SA 4.0][6])

To make Flutter for web work, enter:


```
`flutter config --enable-web`
```

Restart your IDE; this helps Android Studio index the new IDE and reload the list of devices. You should see several new devices:

![Flutter for web device options][23]

(Vitaly Kuprenko, [CC BY-SA 4.0][6])

Selecting **Chrome** launches an app in the browser, while **Web Server** gives you the link to your web app, which you can open in any browser.

Still, it's not time to rush into development because your current project doesn't support the web. To improve it, open the terminal in the project's root and enter:


```
`flutter create`
```

This command recreates the project, adding web support. The existing code won't be deleted.

Note that the tree has changed and now has a "web" directory:

![File tree with web directory][24]

(Vitaly Kuprenko, [CC BY-SA 4.0][6])

Now you can get to work. Select **Chrome** and press **Run**. In a moment, you'll see the browser window with your app.

![Flutter web app demo][25]

(Vitaly Kuprenko, [CC BY-SA 4.0][6])

Congratulations! You've just launched a project for the browser and can continue working with it as with any other website.

All of this comes from the same codebase because Flutter makes it possible to write code for both mobile platforms and the web with little to no changes.

### Do more with Flutter

Flutter is a powerful tool for mobile development, and moreover, it's an important evolutionary step toward cross-platform development. Learn it, use it, and deliver your apps to all the platforms!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/mobile-app-flutter

作者：[Vitaly Kuprenko][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kooper
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/idea_innovation_mobile_phone.png?itok=RqVtvxkd (A person looking at a phone)
[2]: https://flutter.dev/
[3]: https://developer.android.com/studio
[4]: https://snapcraft.io/docs/getting-started
[5]: https://opensource.com/sites/default/files/uploads/flutter1_initialized.png (Flutter initialized)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://flutter.dev/docs/get-started/install/linux
[8]: https://opensource.com/sites/default/files/uploads/flutter2_manual-install.png (Install Flutter manually)
[9]: https://opensource.com/article/19/9/getting-started-zsh
[10]: https://opensource.com/article/17/6/set-path-linux
[11]: https://opensource.com/sites/default/files/uploads/flutter3_doctor.png (Checking Flutter installation with the doctor command)
[12]: https://www.redhat.com/en/topics/middleware/what-is-ide
[13]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
[14]: https://opensource.com/sites/default/files/uploads/flutter4_plugins.png (Flutter plugins)
[15]: https://opensource.com/sites/default/files/uploads/flutter5_plugincheck.png (Checking Flutter plugins with the doctor command)
[16]: https://opensource.com/sites/default/files/uploads/flutter6_newproject.png (Creating a new Flutter plugin)
[17]: https://opensource.com/sites/default/files/uploads/flutter7_projectname.png (Naming a new Flutter plugin)
[18]: https://opensource.com/sites/default/files/uploads/flutter8_launchflutter.png (Device options in Flutter)
[19]: https://opensource.com/sites/default/files/uploads/flutter9_demo.png (Flutter demo on mobile device)
[20]: https://opensource.com/article/18/6/flutter
[21]: https://opensource.com/sites/default/files/uploads/flutter10_beta.png (flutter channel beta output)
[22]: https://opensource.com/sites/default/files/uploads/flutter11_upgrade.png (flutter upgrade output)
[23]: https://opensource.com/sites/default/files/uploads/flutter12_new-devices.png (Flutter for web device options)
[24]: https://opensource.com/sites/default/files/uploads/flutter13_tree.png (File tree with web directory)
[25]: https://opensource.com/sites/default/files/uploads/flutter14_webapp.png (Flutter web app demo)
