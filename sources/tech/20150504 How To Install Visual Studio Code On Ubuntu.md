How To Install Visual Studio Code On Ubuntu
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/05/Install-Visual-Studio-Code-in-Ubuntu.jpeg)

Microsoft has done the unexpected by [releasing Visual Studio Code][1] for all major desktop platforms that includes Linux as well. If you are a web developer who happens to be using Ubuntu, you can **easily install Visual Studio Code in Ubuntu**.

We will be using [Ubuntu Make][2] for installing Visual Studio Code in Ubuntu. Ubuntu Make, previously known as Ubuntu Developer Tools Center, is a command line utility that allows you to easily install various development tools, languages and IDEs. You can easily [install Android Studio][3] and other popular IDEs such as Eclipse with Ubuntu Make. In this tutorial we shall see **how to install Visual Studio Code in Ubuntu with Ubuntu Make**.

### Install Microsoft Visual Studio Code in Ubuntu ###

Before installing Visual Studio Code, we need to install Ubuntu Make first. Though Ubuntu Make is available in Ubuntu 15.04 repository, **you’ll need Ubuntu Make 0.7 for Visual Studio**. You can get the latest Ubuntu Make by using the official PPA. The PPA is available for Ubuntu 14.04, 14.10 and 15.04. Also, it **is only available for 64 bit platform**.

Open a terminal and use the following commands to install Ubuntu Make via official PPA:

    sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
    sudo apt-get update
    sudo apt-get install ubuntu-make

Once you have installed Ubuntu Make, use the command below to install Visual Studio Code:

    umake web visual-studio-code

You’ll be asked to provide a path where it will be installed:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/05/Visual_Studio_Code_Ubuntu_1.jpeg)

After throwing a whole lot of terms and conditions, it will ask for your permission to install Visual Studio Code. Press ‘a’ at this screen:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/05/Visual_Studio_Code_Ubuntu_2.jpeg)

Once you do that it will start downloading and installing it. Once it is installed, you can see that Visual Studio Code icon has already been locked to the Unity Launcher. Just click on it to run it. This is how Visual Studio Code looks like in Ubuntu 15.04 Unity:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/05/Visual_Studio_Code_Ubuntu.jpeg)

### Uninstall Visual Studio Code from Ubuntu ###

To uninstall Visual Studio Code, we’ll use the same command line tool umake. Just use the following command in terminal:

    umake web visual-studio-code --remove

If you do not want to use Ubuntu Make, you can install Visual Studio Code by downloading the files from Microsoft:

- [Download Visual Studio Code for Linux][4]

See, how easy it is to install Visual Studio Code in Ubuntu, all thanks to Ubuntu Make. I hope this tutorial helped you. Feel free to drop a comment if you have any questions or suggestions.

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-visual-studio-code-ubuntu/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://www.geekwire.com/2015/microsofts-visual-studio-expands-to-mac-and-linux-with-new-code-development-tool/
[2]:https://wiki.ubuntu.com/ubuntu-make
[3]:http://itsfoss.com/install-android-studio-ubuntu-linux/
[4]:https://code.visualstudio.com/Download