A Desktop GUI Application For NPM
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/ndm-3-720x340.png)

NPM, short for **N** ode **P** ackage **M** anager, is a command line package manager for installing NodeJS packages, or modules. We already have have published a guide that described how to [**manage NodeJS packages using NPM**][1]. As you may noticed, managing NodeJS packages or modules using Npm is not a big deal. However, if you’re not compatible with CLI-way, there is a desktop GUI application named **NDM** which can be used for managing NodeJS applications/modules. NDM, stands for **N** PM **D** esktop **M** anager, is a free, open source graphical front-end for NPM that allows us to install, update, remove NodeJS packages via a simple graphical window.

In this brief tutorial, we are going to learn about Ndm in Linux.

### Install NDM

NDM is available in AUR, so you can install it using any AUR helpers on Arch Linux and its derivatives like Antergos and Manjaro Linux.

Using [**Pacaur**][2]:
```
$ pacaur -S ndm

```

Using [**Packer**][3]:
```
$ packer -S ndm

```

Using [**Trizen**][4]:
```
$ trizen -S ndm

```

Using [**Yay**][5]:
```
$ yay -S ndm

```

Using [**Yaourt**][6]:
```
$ yaourt -S ndm

```

On RHEL based systems like CentOS, run the following command to install NDM.
```
$ echo "[fury] name=ndm repository baseurl=https://repo.fury.io/720kb/ enabled=1 gpgcheck=0" | sudo tee /etc/yum.repos.d/ndm.repo && sudo yum update &&

```

On Debian, Ubuntu, Linux Mint:
```
$ echo "deb [trusted=yes] https://apt.fury.io/720kb/ /" | sudo tee /etc/apt/sources.list.d/ndm.list && sudo apt-get update && sudo apt-get install ndm

```

NDM can also be installed using **Linuxbrew**. First, install Linuxbrew as described in the following link.

After installing Linuxbrew, you can install NDM using the following commands:
```
$ brew update

$ brew install ndm

```

On other Linux distributions, go to the [**NDM releases page**][7], download the latest version, compile and install it yourself.

### NDM Usage

Launch NDM wither from the Menu or using application launcher. This is how NDM’s default interface looks like.

![][9]

From here, you can install NodeJS packages/modules either locally or globally.

**Install NodeJS packages locally**

To install a package locally, first choose project directory by clicking on the **“Add projects”** button from the Home screen and select the directory where you want to keep your project files. For example, I have chosen a directory named **“demo”** as my project directory.

Click on the project directory (i.e **demo** ) and then, click **Add packages** button.

![][10]

Type the package name you want to install and hit the **Install** button.

![][11]

Once installed, the packages will be listed under the project’s directory. Simply click on the directory to view the list of installed packages locally.

![][12]

Similarly, you can create separate project directories and install NodeJS modules in them. To view the list of installed modules on a project, click on the project directory, and you will the packages on the right side.

**Install NodeJS packages globally**

To install NodeJS packages globally, click on the **Globals** button on the left from the main interface. Then, click “Add packages” button, type the name of the package and hit “Install” button.

**Manage packages**

Click on any installed packages and you will see various options on the top, such as

  1. Version (to view the installed version),
  2. Latest (to install latest available version),
  3. Update (to update the currently selected package),
  4. Uninstall (to remove the selected package) etc.



![][13]

NDM has two more options namely **“Update npm”** which is used to update the node package manager to latest available version, and **Doctor** that runs a set of checks to ensure that your npm installation has what it needs to manage your packages/modules.

### Conclusion

NDM makes the process of installing, updating, removing NodeJS packages easier! You don’t need to memorize the commands to perform those tasks. NDM lets us to do them all with a few mouse clicks via simple graphical window. For those who are lazy to type commands, NDM is perfect companion to manage NodeJS packages.

Cheers!

**Resource:**



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/ndm-a-desktop-gui-application-for-npm/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/manage-nodejs-packages-using-npm/
[2]:https://www.ostechnix.com/install-pacaur-arch-linux/
[3]:https://www.ostechnix.com/install-packer-arch-linux-2/
[4]:https://www.ostechnix.com/trizen-lightweight-aur-package-manager-arch-based-systems/
[5]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[6]:https://www.ostechnix.com/install-yaourt-arch-linux/
[7]:https://github.com/720kb/ndm/releases
[8]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[9]:http://www.ostechnix.com/wp-content/uploads/2018/04/ndm-1.png
[10]:http://www.ostechnix.com/wp-content/uploads/2018/04/ndm-5-1.png
[11]:http://www.ostechnix.com/wp-content/uploads/2018/04/ndm-6.png
[12]:http://www.ostechnix.com/wp-content/uploads/2018/04/ndm-7.png
[13]:http://www.ostechnix.com/wp-content/uploads/2018/04/ndm-8.png
