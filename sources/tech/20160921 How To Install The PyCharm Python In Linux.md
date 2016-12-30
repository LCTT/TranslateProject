ucasFL translating
How To Install The PyCharm Python IDE In Linux
============================================

![][7]
### Introduction

Linux is often seen from the outside world as an operating system for geeks and whilst this is a misnomer it is true that if you want to develop software then Linux provides a great environment for doing so.

People new to programming often ask which programming language they should use and when it comes to Linux the choices are generally C, C++, Python, Java, PHP, Perl and Ruby On Rails.

Many of the core Linux programs are written in C but outside the Linux world it isn't used as commonly as other languages such as Java and Python.

Python and Java are both great choices because they are cross platform and therefore the programs you write for Linux will work on Windows and Macs as well.

Whilst you can use any editor for developing Python applications you will find that your programming life will be so much easier if you use a good integrated development environment (IDE) consisting of an editor and a debugger.

PyCharm is a cross platform editor developed by Jetbrains. If you come from a Windows development environment you will recognise Jetbrains as the company who produce the excellent product Resharper which is used to refactor your code, point out potential issues and automatically add statements such as when you use a class it will import it for you.

This article will show you how to get PyCharm, install and run Pycharm within Linux

### How To Get PyCharm

You can get PyCharm by visiting [here][1]
There is a large download button in the centre of the screen.

You have a choice of downloading the professional version or the community edition. If you are just getting into programming in Python then I recommend going for the community edition.

However the professional version has some great features that shouldn't be overlooked if you intend to program professionally.

### How To Install PyCharm

The file that has been downloaded will be called something like pycharm-professional-2016.2.3.tar.gz.

A file ending in "tar.gz" has been compressed using [the gzip tool][2] and has been archived using [tar][3] to keep the folder structure in one place.

You can read this guide for more information about [extracting tar.gz files][4].

For quickness though all you have to do to extract the file is open a terminal and navigate to the folder the file has been downloaded to.

  ```
  cd ~/Downloads
  ```

Now find out the name of the file you downloaded by running the following command:

  ```
  ls pycharm*
  ```

To extract the file run the following command:

  ```
  tar -xvzf pycharm-professional-2016.2.3.tar.gz -C ~
  ```

Make sure you replace the name of the pycharm file with the one provided via the ls command. (i.e the filename you downloaded).

The above command will put the PyCharm software in your home folder.

### How To Run PyCharm

To run PyCharm first navigate to your home folder:

  ```
  cd ~
  ```

Run the ls command to find the folder name

  ```
  ls
  ```

When you have the file name navigate into the pycharm folder as follows:

  ```
  cd pycharm-2016.2.3/bin
  ```

Finally to run PyCharm run the following command:

  ```
  sh pycharm.sh &
  ```

If you are running a desktop environment such as GNOME, KDE, Unity, Cinnamon or any other modern desktop you will also be able to use the menu or dash for that desktop environment to find PyCharm.

### Summary

Now that PyCharm is installed you can start creating desktop applications, web applications and all manner of tools.

If you want to learn how to program in Python then it is worth checking out this guide which shows the best places for [learning resources][5]. The article is geared more towards learning Linux than Python but the resources such as Pluralsight and Udemy provide access to really good course for Python.

To find out what features are available in PyCharm [click here][6] for a full overview. It covers everything from creating a project to describing the user interface, debugging and code refactoring.

-----------------------------------------------------------------------------------------------------------

via: https://www.lifewire.com/how-to-install-the-pycharm-python-ide-in-linux-4091033

作者：[ Gary Newell][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.lifewire.com/gary-newell-2180098
[1]:https://www.jetbrains.com/pycharm/
[2]:https://www.lifewire.com/example-uses-of-the-linux-gzip-command-4078675
[3]:https://www.lifewire.com/uses-of-linux-command-tar-2201086
[4]:https://www.lifewire.com/extract-tar-gz-files-2202057
[5]:https://www.lifewire.com/learn-linux-in-structured-manner-4061368
[6]:https://www.lifewire.com/pycharm-the-best-linux-python-ide-4091045
[7]:https://fthmb.tqn.com/ju1u-Ju56vYnXabPbsVRyopd72Q=/768x0/filters:no_upscale()/about/pycharmstart-57e2cb405f9b586c351a4cf7.png
