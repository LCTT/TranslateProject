translating wi-cuckoo
How to Download, Install, and Configure Plank Dock in Ubuntu
================================================================================
It’s a well-known fact that Linux is extremely customizable with users having a lot of options to choose from – be it the operating systems’ various distributions or desktop environments available for a single distro. Like users of any other OS, Linux users also have different tastes and preferences, especially when it comes to desktop.

While some users aren’t particularly bothered about their desktop, others take special care to make sure that their desktop looks cool and attractive, something for which there are various applications available. One such application that brings life to your desktop – especially if you use a global menu on the top – is the dock. There are many dock applications available for Linux; if you’re looking for the simplest one, then look no further than [Plank][1], which we’ll be discussing in this article.

**Note**: the examples and commands mentioned here have been tested on Ubuntu (version 14.10) and Plank version 0.9.1.1383.

### Plank ###

The official documentation describes Plank as the “simplest dock on the planet.” The project’s goal is to provide just what a dock needs, although it’s essentially a library which can be extended to create other dock programs with more advanced features.

What’s worth mentioning here is that Plank, which comes pre-installed in elementary OS, is the underlying technology for Docky, a popular dock application which is very similar in functionality to Mac OS X’s Dock.

### Download and Install ###

You can download and install Plank by executing the following commands on your terminal:

    sudo add-apt-repository ppa:docky-core/stable
    sudo apt-get update
    sudo apt-get install plank

Once installed successfully, you can open the application by typing the name Plank in Unity Dash (see image below), or open it from the App Menu if you aren’t using the Unity environment.

![](https://www.maketecheasier.com/assets/uploads/2015/09/plank-unity-dash.png)

### Features ###

Once the Plank dock is enabled, you’ll see it sitting at the center-bottom of your desktop.

![](https://www.maketecheasier.com/assets/uploads/2015/09/plank-enabled-new.jpg)

As you can see in the image above, the dock contains some application icons with an orange color indication below those which are currently running. Needless to say, you can click an icon to open that application. Also, a right-click on any application icon will produce some more options that you might be interested in. For example, see the screen-shot below:

![](https://www.maketecheasier.com/assets/uploads/2015/09/plank-right-click-icons-new.jpg)

To access the configuration options, you’ll have to do a right-click on Plank’s icon (which is the first one from the left), and then click the Preferences option. This will produce the following window.

![](https://www.maketecheasier.com/assets/uploads/2015/09/plank-preferences.png)

As you can see, the preference window consists of two tabs: Appearance and Behavior, with the former being selected by default. The Appearance tab contains settings related to the Plank theme, the dock’s position, and alignment, as well as that related to icons, while the Behavior tab contains settings related to the dock itself.

![](https://www.maketecheasier.com/assets/uploads/2015/09/plank-behavior-settings.png)

For example, I changed the position of the dock to Right from within the Appearance tab and locked the icons (which means no “Keep in Dock” option on right-click) from the Behavior tab.

![](https://www.maketecheasier.com/assets/uploads/2015/09/plank-right-lock-new.jpg)

As you can see in the screen-shot above, the changes came into effect. Similarly, you can tweak any available setting as per your requirement.

### Conclusion ###

Like I said in the beginning, having a dock isn’t mandatory. However, using one definitely makes things convenient, especially if you’ve been using Mac and have recently switched over to Linux for whatever reason. For its part, Plank not only offers simplicity, but dependability and stability as well – the project is well-maintained.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/download-install-configure-plank-dock-ubuntu/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/himanshu/
[1]:https://launchpad.net/plank
