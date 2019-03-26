[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 Ways to Install Deb Files on Ubuntu Linux)
[#]: via: (https://itsfoss.com/install-deb-files-ubuntu)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

3 Ways to Install Deb Files on Ubuntu Linux
======

**This beginner article explains how to install deb packages in Ubuntu. It also shows you how to remove those deb packages afterwards.**

This is another article in the Ubuntu beginner series. If you are absolutely new to Ubuntu, you might wonder about [how to install applications][1].

The easiest way is to use the Ubuntu Software Center. Search for an application by its name and install it from there.

Life would be too simple if you could find all the applications in the Software Center. But that does not happen, unfortunately.

Some software are available via DEB packages. These are archived files that end with .deb extension.

You can think of .deb files as the .exe files in Windows. You double click on the .exe file and it starts the installation procedure in Windows. DEB packages are pretty much the same.

You can find these DEB packages from the download section of the software provider’s website. For example, if you want to [install Google Chrome on Ubuntu][2], you can download the DEB package of Chrome from its website.

Now the question arises, how do you install deb files? There are multiple ways of installing DEB packages in Ubuntu. I’ll show them to you one by one in this tutorial.

![Install deb files in Ubuntu][3]

### Installing .deb files in Ubuntu and Debian-based Linux Distributions

You can choose a GUI tool or a command line tool for installing a deb package. The choice is yours.

Let’s go on and see how to install deb files.

#### Method 1: Use the default Software Center

The simplest method is to use the default software center in Ubuntu. You have to do nothing special here. Simply go to the folder where you have downloaded the .deb file (it should be the Downloads folder) and double click on this file.

![Google Chrome deb file on Ubuntu][4]Double click on the downloaded .deb file to start installation

It will open the software center and you should see the option to install the software. All you have to do is to hit the install button and enter your login password.

![Install Google Chrome in Ubuntu Software Center][5]The installation of deb file will be carried out via Software Center

See, it’s even simple than installing from a .exe files on Windows, isn’t it?

#### Method 2: Use Gdebi application for installing deb packages with dependencies

Again, life would be a lot simpler if things always go smooth. But that’s not life as we know it.

Now that you know that .deb files can be easily installed via Software Center, let me tell you about the dependency error that you may encounter with some packages.

What happens is that a program may be dependent on another piece of software (libraries). When the developer is preparing the DEB package for you, he/she may assume that your system already has that piece of software on your system.

But if that’s not the case and your system doesn’t have those required pieces of software, you’ll encounter the infamous ‘dependency error’.

The Software Center cannot handle such errors on its own so you have to use another tool called [gdebi][6].

gdebi is a lightweight GUI application that has the sole purpose of installing deb packages.

It identifies the dependencies and tries to install these dependencies along with installing the .deb files.

![gdebi handling dependency while installing deb package][7]Image Credit: [Xmodulo][8]

Personally, I prefer gdebi over software center for installing deb files. It is a lightweight application so the installation seems quicker. You can read in detail about [using gDebi and making it the default for installing DEB packages][6].

You can install gdebi from the software center or using the command below:

```
sudo apt install gdebi
```

#### Method 3: Install .deb files in command line using dpkg

If you want to install deb packages in command lime, you can use either apt command or dpkg command. Apt command actually uses [dpkg command][9] underneath it but apt is more popular and easy to use.

If you want to use the apt command for deb files, use it like this:

```
sudo apt install path_to_deb_file
```

If you want to use dpkg command for installing deb packages, here’s how to do it:

```
sudo dpkg -i path_to_deb_file
```

In both commands, you should replace the path_to_deb_file with the path and name of the deb file you have downloaded.

![Install deb files using dpkg command in Ubuntu][10]Installing deb files using dpkg command in Ubuntu

If you get a dependency error while installing the deb packages, you may use the following command to fix the dependency issues:

```
sudo apt install -f
```

### How to remove deb packages

Removing a deb package is not a big deal as well. And no, you don’t need the original deb file that you had used for installing the program.

#### Method 1: Remove deb packages using apt commands

All you need is the name of the program that you have installed and then you can use apt or dpkg to remove that program.

```
sudo apt remove program_name
```

Now the question comes, how do you find the exact program name that you need to use in the remove command? The apt command has a solution for that as well.

You can find the list of all installed files with apt command but manually going through this will be a pain. So you can use the grep command to search for your package.

For example, I installed AppGrid application in the previous section but if I want to know the exact program name, I can use something like this:

```
sudo apt list --installed | grep grid
```

This will give me all the packages that have grid in their name and from there, I can get the exact program name.

```
apt list --installed | grep grid
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
appgrid/now 0.298 all [installed,local]
```

As you can see, a program called appgrid has been installed. Now you can use this program name with the apt remove command.

#### Method 2: Remove deb packages using dpkg commands

You can use dpkg to find the installed program’s name:

```
dpkg -l | grep grid
```

The output will give all the packages installed that has grid in its name.

```
dpkg -l | grep grid

ii appgrid 0.298 all Discover and install apps for Ubuntu
```

ii in the above command output means package has been correctly installed.

Now that you have the program name, you can use dpkg command to remove it:

```
dpkg -r program_name
```

**Tip: Updating deb packages**
Some deb packages (like Chrome) provide updates through system updates but for most other programs, you’ll have to remove the existing program and install the newer version.

I hope this beginner guide helped you to install deb packages on Ubuntu. I added the remove part so that you’ll have better control over the programs you installed.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-deb-files-ubuntu

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/remove-install-software-ubuntu/
[2]: https://itsfoss.com/install-chrome-ubuntu/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/deb-packages-ubuntu.png?resize=800%2C450&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/01/install-google-chrome-ubuntu-4.jpeg?resize=800%2C347&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/01/install-google-chrome-ubuntu-5.jpeg?resize=800%2C516&ssl=1
[6]: https://itsfoss.com/gdebi-default-ubuntu-software-center/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/01/gdebi-handling-dependency.jpg?ssl=1
[8]: http://xmodulo.com
[9]: https://help.ubuntu.com/lts/serverguide/dpkg.html.en
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/install-deb-file-with-dpkg.png?ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/deb-packages-ubuntu.png?fit=800%2C450&ssl=1
