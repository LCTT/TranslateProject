[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fixing “Unable to correct problems, you have held broken packages” Error in Ubuntu and other Linux Distributions)
[#]: via: (https://itsfoss.com/held-broken-packages-error/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Fixing “Unable to correct problems, you have held broken packages” Error in Ubuntu and other Linux Distributions
======

While there are [various ways to install applications in Ubuntu][1], I prefer to use the apt command in the terminal for installing software.

If you do the same, you may come across a dependency error like this:

```
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 green-recorder : Depends: python-urllib3 but it is not installable
E: Unable to correct problems, you have held broken packages.
```

Usually on It’s FOSS, you’ll find simple and easy to follow solutions to complicated problems. Unfortunately, this one is not that straightforward.

In this troubleshooting article, I’ll tell you why this error occurs and give some pointers on how to go about solving this issue.

### Why do you see the “you have held broken packages” error?

![][2]

You were trying to install an application package, most probably from a [PPA][3] or third-party repository.

Applications often need specific versions of libraries and software component (called dependencies). These dependencies may not be part of the application package itself, but they are expected to either be installed on your system already or installed during the installation of the application.

Your Linux system tries to install these dependencies on its own. But if the dependency package version is not available on your system, it gets confused as it has no way to solve this dependency problem.

This is why it informs you that the software you were trying to install depends on XYZ but this XYZ cannot be installed.

Another usecase is when your package can be held is when you try to install two versions of the same software. Say you are installing a specific version of Wine when you have another one installed already.

### How to go about fixing the “Unable to correct problems, you have held broken packages” error

You can try a few things to make things work. You need to have some ideas on installing/removing packages in Linux command line to work things out here.

#### Make sure that your system’s package cache is updated

First, make sure that local package cache is updated. Your system checks this cache for the available packages. It’s possible (but not certain) that the dependency package is seen by the system after the cache update.

```
sudo apt update
```

Try installing the troublesome package again and see if it fixes the problem.

#### Install the dependency

If you try to install the troublesome package again and it still complains about the same dependency error than perhaps that dependency is not available for distribution version.

You may [use the apt search command][4] see if you could this library from some other package or name:

```
sudo apt search package_name
```

If the package is available, is it the same version as requested by the package you were trying to install?

Try to install the dependency package and see what happens:

```
sudo apt install dependency_package
```

You may encounter a dependency chain. You try to install dependency A but it complains of B. Then you try installing B and it complains of C.

It may also happen that when you try to install package C, it is already installed. Check the version of package C. Is it the same version as required by package B? If yes, then removing C and installing it again could help.

#### Can you get the missing dependency package from some other source?

If the missing dependency package cannot be found on your system (no results in apt search), you may try to get the dependency package from some place else. I know that’s not very convenient thing to do but you don’t have many options here.

For example, in the case of installing shutter, it complained about libgoo-canvas-perl and this library is no more available on Ubuntu system.

```
sudo apt install shutter
Reading package lists... Done
Building dependency tree
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 shutter : Depends: libgoo-canvas-perl but it is not going to be installed
E: Unable to correct problems, you have held broken packages.
```

However, since it was available in the previous versions of Ubuntu, I looked for this package on Ubuntu’s package archive and found it under the listing of Ubuntu 14.04 [here][5]. I downloaded the .DEB file and installed it.

Now that this dependency package is installed, trying to install the original application (shutter in this case) should not complain about at least this package anymore.

#### If you cannot find the dependency package anywhere, install the troublesome package from some other source

So in the example above, I tried to install Green Recorder application using its PPA. This application needs `python-urllib3` library but unfortunately, this library is not available in my Ubuntu 20.04 system.

```
[email protected]:~$ apt search python-urllib3
Sorting... Done
Full Text Search... Done
```

Clearly, this is a poorly packaged application. The developer made it available for Ubuntu 20.04 without realizing that Ubuntu 20.04 doesn’t support Python 2 anymore and all the Python libs now start with python3 prefix. So the python-urllib3 should be python3-urllib3.

If you are in such a situation, maybe check the project’s homepage or search on the internet for an alternate source for installing it. Perhaps there is a Snap/Flatpak version or some user created a PPA for it? If nothing else, you may go with source code option as well.

#### If you see the held broken package error during update try this

Most of the discussion so far assumed that you see this error while installing a new application. That may not always be the case.

If you see this error when you try updating your system with sudo apt update command, then you’ll have to take a slightly different approach.

First, check which package is being held with this command:

```
dpkg --get-selections | grep hold
```

If you see some packages being held, remove them and then go on updating your system or installing the software.

You may also [use Synaptic package manager][6] for fixing the broken packages.

#### Did you manage to fix the issue?

As I had mentioned earlier, there is no straightforward fix for this problem. You’ll have to investigate on your own and see if it can be fixed or not.

Please share in the comments if your problem gets fixed. If not, I may try to help you out.

--------------------------------------------------------------------------------

via: https://itsfoss.com/held-broken-packages-error/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/remove-install-software-ubuntu/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/broken-package-error-ubuntu.png?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/ppa-guide/
[4]: https://itsfoss.com/apt-search-command/
[5]: https://launchpad.net/ubuntu/+source/libgoo-canvas-perl
[6]: https://itsfoss.com/synaptic-package-manager/
