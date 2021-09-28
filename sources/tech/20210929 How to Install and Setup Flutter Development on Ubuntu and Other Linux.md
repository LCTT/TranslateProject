[#]: subject: "How to Install and Setup Flutter Development on Ubuntu and Other Linux"
[#]: via: "https://itsfoss.com/install-flutter-linux/"
[#]: author: "Community https://itsfoss.com/author/itsfoss/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install and Setup Flutter Development on Ubuntu and Other Linux
======

Google’s UI toolkit Flutter is getting increasingly popular for creating cross-platform applications for the mobile, web and desktop.

[Flutter][1] is not a programming language but a software development kit. [Dart][2] is the programming language used underneath the Flutter SDK.

Flutter is the main framework behind Google’s open source Fuchsia OS, Google STADIA and many other software and mobile apps.

If you want to start developing with Flutter, this tutorial will help you to get your set-up ready on Ubuntu and hopefully other Linux distributions.

### Installing Flutter on Ubuntu and other Linux with Snap

The easiest way to install Flutter on Linux is by using Snap. If you are using Ubuntu, you already have got Snap. _**For other distributions, please make sure to [enable Snap support][3].**_

[Open a terminal][4] and use the following command in a terminal to install Flutter:

```
sudo snap install flutter --classic
```

You’ll see something like this on your terminal:

![][5]

Once the installation completes, it is time to verify it. Not just Flutter installation but also verify every dependency that needs to be satisfied for Flutter to function properly.

#### Verify Flutter dependencies

To verify that every dependency, for the correct work of Flutter, is installed, Flutter has a built-in option:

```
flutter doctor
```

The process will start, looking like this:

![][6]

And it will be finishing like this:

![][7]

As you can see, we need Android Studio for working. So let’s install it. How do we do that? [Installing Android Studio on Linux][8] is also effortless with Snap.

#### Install and set up Android Studio

In a terminal, use the following command to get Android Studio installed:

```
sudo snap install android-studio --classic
```

![][9]

Once installed, open Android Studio from our operating system menu.

![][10]

You are almost done. It’s time for configuring Android Studio.

![][11]

Click next and select standard if you don’t want to complicate things.

![][12]

Select your preferred theme (I like the Dark one).

![][13]

Verify that everything is OK and click on Next.

![][14]

Finally, hit the Finish button.

![][15]

And wait until the download is finished.

![][16]

### Creating a sample Hello World Flutter app

In Android Studio, go to Projects and select New Flutter Project. Flutter SDK path will be set by default.

![][17]

And here is where the magic starts to appear because this is where you set your project name, which in this case it will be called hello_world.

Let’s select the three available platforms: **Android, iOS, and Web**. And finally, click on Finish.

![][18]

The principal file in the projects is located in `lib/main.dart`, as is shown in the next image.

![][19]

Once selected, erase everything contained inside the file and change it for this sample code:

```
// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
```

It’s important to say that this is only for showing you how Flutter works, in case you’re convinced about learning this beautiful and incredible language, here is the [Documentation][20] to see more about it. **Try** it!

Finally, select **Chome Web** device and do click on the **Run** button, as is shown below; and see the magic!

![][21]

It’s incredible how fast you can create a Flutter project. Say hello to your Hello World project.

![][22]

### In the end…

Flutter and Dart are perfect if you want to contribute with beautiful mobile and Web interfaces in a short time.

Now you know how to install Flutter on Ubuntu Linux and how to create your first app with it. I really enjoyed writing this post for you, hoping this helps you and if you have any questions, please let me know by leaving a comment or sending me an email to [[email protected]][23] Good luck!

_**Tutorial contributed by Marco Antonio Carmona Galván, a student of physics and data science.**_

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-flutter-linux/

作者：[Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://flutter.dev/
[2]: https://dart.dev/
[3]: https://itsfoss.com/install-snap-linux/
[4]: https://itsfoss.com/open-terminal-ubuntu/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/installing-flutter-ubuntu.png?resize=786%2C195&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/verify-flutter-install.png?resize=786%2C533&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/Flutter-verification-completes.png?resize=786%2C533&ssl=1
[8]: https://itsfoss.com/install-android-studio-ubuntu-linux/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/install-android-studio-linux-snap.png?resize=786%2C187&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/Open_Android_Studio.webp?resize=800%2C450&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/Setting-Up-Android-Studio-1.png?resize=800%2C603&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/Setting-Up-Android-Studio-2.png?resize=800%2C603&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/Setting-Up-Android-Studio-3.png?resize=800%2C603&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/Setting-Up-Android-Studio-4.png?resize=800%2C603&ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/Setting-Up-Android-Studio-5.png?resize=800%2C603&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/Setting-Up-Android-Studio-6.png?resize=800%2C603&ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/New_flutter_project.png?resize=800%2C639&ssl=1
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/sample-flutter-project.png?resize=800%2C751&ssl=1
[19]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/sample-flutter-project-1.png?resize=800%2C435&ssl=1
[20]: https://flutter.dev/docs
[21]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/sample-flutter-project-2.png?resize=800%2C450&ssl=1
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/sample-flutter-project-3.png?resize=800%2C549&ssl=1
[23]: https://itsfoss.com/cdn-cgi/l/email-protection
