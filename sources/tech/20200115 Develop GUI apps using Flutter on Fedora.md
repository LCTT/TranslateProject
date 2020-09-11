[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Develop GUI apps using Flutter on Fedora)
[#]: via: (https://fedoramagazine.org/develop-gui-apps-using-flutter-on-fedora/)
[#]: author: (Carmine Zaccagnino https://fedoramagazine.org/author/carzacc/)

Develop GUI apps using Flutter on Fedora
======

![][1]

When it comes to app development frameworks, Flutter is the latest and greatest. Google seems to be planning to take over the entire GUI app development world with Flutter, starting with mobile devices, which are already perfectly supported. Flutter allows you to develop cross-platform GUI apps for multiple targets — mobile, web, and desktop — from a single codebase.

This post will go through how to install the Flutter SDK and tools on Fedora, as well as how to use them both for mobile development and web/desktop development.

### Installing Flutter and Android SDKs on Fedora

To get started building apps with Flutter, you need to install

  * the Android SDK;
  * the Flutter SDK itself; and,
  * optionally, an IDE and its Flutter plugins.



#### Installing the Android SDK

Flutter requires the installation of the Android SDK with the entire [Android Studio][2] suite of tools. Google provides a _tar.gz_ archive. The Android Studio executable can be found in the _android-studio/bin_ directory and is called _studio.sh_. To run it, open a terminal, _cd_ into the aforementioned directory, and then run:

```
$ ./studio.sh
```

#### Installing the Flutter SDK

Before you install Flutter you may want to consider what release channel you want to be on.

The _stable_ channel is least likely to give you a headache if you just want to build a mobile app using mainstream Flutter features.

On the other hand, you may want to use the latest features, especially for desktop and web app development. In that case, you might be better off installing either the latest version of the _beta_ or even the _dev_ channel.

Either way, you can switch between channels after you install using the _flutter channel_ command explained later in the article.

Head over to the [official SDK archive page][3] and download the latest installation bundle for the release channel most appropriate for your use case.

The installation bundle is simply a _xz-_compressed tarball (_.tar.xz_ extension). You can extract it wherever you want, given that you add the _flutter/bin_ subdirectory to the _PATH_ environment variable.

#### Installing the IDE plugins

To install the plugin for [Visual Studio Code][4], you need to search for _Flutter_ in the _Extensions_ tab. Installing it will also install the _Dart_ plugin.

The same will happen when you install the plugin for Android Studio by opening the _Settings_, then the _Plugins_ tab and installing the _Flutter_ plugin.

### Using the Flutter and Android CLI Tools on Fedora

Now that you’ve installed Flutter, here’s how to use the CLI tool.

#### Upgrading and Maintaining Your Flutter Installations

The _flutter doctor_ command is used to check whether your installation and related tools are complete and don’t require any further action.

For example, the output you may get from _flutter doctor_ right after installing on Fedora is:

```
Doctor summary (to see all details, run flutter doctor -v):

[✓] Flutter (Channel stable, v1.12.13+hotfix.5, on Linux, locale it_IT.UTF-8)

[!] Android toolchain - develop for Android devices (Android SDK version 29.0.2)

    ✗ Android licenses not accepted.  To resolve this, run: flutter doctor --android-licenses

[!] Android Studio (version 3.5)

    ✗ Flutter plugin not installed; this adds Flutter specific functionality.

    ✗ Dart plugin not installed; this adds Dart specific functionality.

[!] Connected device

    ! No devices available

! Doctor found issues in 3 categories.
```

Of course the issue with the Android toolchain has to be resolved in order to build for Android. Run this command to accept the licenses:

```
$ flutter doctor --android-licenses
```

Use the _flutter channel_ command to switch channels after installation. It’s just like switching branches on Git (and that’s actually what it does). You use it in the following way:

```
$ flutter channel <channel_name>
```

…where you’d replace _&lt;channel_name&gt;_ with the release channel you want to switch to.

After doing that, or whenever you feel the need to do it, you need to update your installation. You might consider running this every once in a while or when a major update comes out if you follow Flutter news. Run this command:

```
$ flutter upgrade
```

#### Building for Mobile

You can build for Android very easily: the _flutter build_ command supports it by default, and it allows you to build both APKs and newfangled app bundles.

All you need to do is to create a project with _flutter create_, which will generate some code for an example app and the necessary _android_ and _ios_ folders.

When you’re done coding you can either run:

  * _flutter build apk_ or _flutter build appbundle_ to generate the necessary app files to distribute, or
  * _flutter run_ to run the app on a connected device or emulator directly.



When you run the app on a phone or emulator with _flutter run_, you can use the _R_ button on the keyboard to use _stateful hot reload_. This feature updates what’s displayed on the phone or emulator to reflect the changes you’ve made to the code without requiring a full rebuild.

If you input a capital _R_ character to the debug console, you trigger a _hot restart_. This restart doesn’t preserve state and is necessary for bigger changes to the app.

If you’re using a GUI IDE, you can trigger a hot reload using the _bolt_ icon button and a hot restart with the typical _refresh_ button.

#### Building for the Desktop

To build apps for the desktop on Fedora, use the [flutter-desktop-embedding][5] repository. The _flutter create_ command doesn’t have templates for desktop Linux apps yet. That repository contains examples of desktop apps and files required to build on desktop, as well as examples of plugins for desktop apps.

To build or run apps for Linux, you also need to be on the _master_ release channel and enable Linux desktop app development. To do this, run:

```
$ flutter config --enable-linux-desktop
```

After that, you can use _flutter run_ to run the app on your development workstation directly, or run _flutter build linux_ to build a binary file in the _build/_ directory.

If those commands don’t work, run this command in the project directory to generate the required files to build in the _linux/_ directory:

```
$ flutter create .
```

#### Building for the Web

Starting with Flutter 1.12, you can build Web apps using Flutter with the mainline codebase, without having to use the _flutter_web_ forked libraries, but you have to be running on the _beta_ channel.

If you are (you can switch to it using _flutter channel beta_ and _flutter upgrade_ as we’ve seen earlier), you need to enable web development by running _flutter config –enable-web_.

After doing that, you can run _flutter run -d web_ and a local web server will be started from which you can access your app. The command returns the URL at which the server is listening, including the port number.

You can also run _flutter build web_ to build the static website files in the _build/_ directory.

If those commands don’t work, run this command in the project directory to generate the required files to build in the _web/_ directory:

```
$ flutter create .
```

### Packages for Installing Flutter

Other distributions have packages or community repositories to install and update in a more straightforward and intuitive way. However, at the time of writing, no such thing exists for Flutter. If you have experience packaging RPMs for Fedora, consider contributing to [this GitHub repository][6] for [this COPR package][7].

The next step is learning Flutter. You can do that in a number of ways:

  * Read the good API reference documentation on the official site
  * Watching some of the introductory video courses available online
  * Read one of the many books out there today. _[Check out the author’s bio for a suggestion! — Ed.]_



* * *

_Photo by [Randall Ruiz][8] on [Unsplash][9]._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/develop-gui-apps-using-flutter-on-fedora/

作者：[Carmine Zaccagnino][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/carzacc/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/01/flutter-816x345.jpg
[2]: https://developer.android.com/studio
[3]: https://flutter.dev/docs/development/tools/sdk/releases?tab=linux
[4]: https://fedoramagazine.org/using-visual-studio-code-fedora/
[5]: https://github.com/google/flutter-desktop-embedding
[6]: https://github.com/carzacc/flutter-copr
[7]: https://copr.fedorainfracloud.org/coprs/carzacc/flutter/
[8]: https://unsplash.com/@ruizra?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[9]: https://unsplash.com/s/photos/flutter?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
