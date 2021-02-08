[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using ‘apt search’ and ‘apt show’ Commands to Search and Find Details of Packages in Ubuntu)
[#]: via: (https://itsfoss.com/apt-search-command/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Using ‘apt search’ and ‘apt show’ Commands to Search and Find Details of Packages in Ubuntu
======

_**This is a detailed beginners guide to apt search command. Using apt search and apt show commands, you can get details of the available versions, dependencies, repositories and other important information about packages in Ubuntu.**_

Have you ever wondered if a certain package is available to install via [apt package manager][1]?

Have you wondered if the package offered by [Ubuntu repositories][2] are the latest one or not?

The apt package manager in [Ubuntu][3] and many other distribution provides two handy [apt command options][4] for this purpose.

The apt search command looks for the provided string in the name and description of the packages.

```
apt search package_name
```

The apt show command provides detailed information on a package:

```
apt show package_name
```

The commands don’t require you to [be root in Ubuntu][5]. Here’s an example of these commands:

![][6]

### Why would you want to use apt search or apt show command?

Let’s say you want to [install Gambas programming language in Ubuntu][7]. You are happy with your knowledge of the apt command so you decided to use the command line for installing application.

You open a terminal and use the apt command to install gambas but it results in [unable to locate package error][8].

```
sudo apt install gambas
Reading package lists... Done
Building dependency tree
Reading state information... Done
E: Unable to locate package gambas
```

Why did Ubuntu not find the gambas package? Because there is no such package called gambas. Instead, it is available as gambas3. This is a situation where you could take the advantage of the apt search command.

Let’s move to apt show command. This command provides detailed information about a package, its repository, dependencies and a lot more.

Knowing what version of a package is available from the official repository could help you in deciding whether you should install it from some other sources.

Quick recall

The apt package manager works on a local database/cache of available packages from various repositories. This database contains the information about the available package version, dependencies etc. It doesn’t contain the entire package itself. The packages are downloaded from the remote repositories.

When you run the sudo apt update command, this cache is created/updated in the /var/lib/apt/lists/ directory. The apt search and apt show commands utilize this cache.

The term package is used for an application, program, software.

### Search for available packages using apt search command

![][9]

Let me continue the gambas example. Say, you search for

```
apt search gambas
```

It will give you a huge list of packages that have “gambas” in its name or description. This output list is in alphabetical order.

Now, you’ll of course have to make some intelligent prediction about the package you want. In this example, the first result says “Complete visual development environment for Gambas”. This gives you a good hint that this is the main package you are looking for.

![][10]

Why so many packages associated with gambas? Because a number of these gambas packages are probably dependencies that will installed automatically if you install the gambas3 package. If you use the _‘apt show gambas3_‘ command, it will show all the dependencies that will be installed with gambas3 package.

Some of these listed packages could be libraries that a developer may need in some special cases while developing her/his software.

#### Use apt search for package name only

By default, apt search command looks for the searched term in both the name of the package and its description.

You may narrow down the search by instructing the apt command to search for package names only.

```
apt search --names-only search_term
```

If you are following this as a tutorial, give it a try. Check the output with search term ‘transitional’ with and without –names-only option and you’ll see how the output changes.

```
apt search transitional
apt search --names-only transitional
```

**Bonus Tip**: You can use ‘apt list –installed’ command to [look for installed packages in Ubuntu][11].

### Get detailed information on a package using apt show command

The output of the apt search commands a brief introduction of the packages. If you want more details, use the apt show command.

```
apt show exact_package_name
```

The apt show command works on the exact package name and it gives you a lot more information on the package. You get:

  * Version information
  * Repository information
  * Origin and maintainer of the package information
  * Where to file a bug
  * Download and installation size
  * Dependencies
  * Detailed description of the package
  * And a lot more



Here’s an example:

![][12]

You need to give the exact package name otherwise the apt show won’t work. The good thing is that tab completion works apt show command.

As you can see in the previous image, you have plenty of information that you may found helpful.

The apt show command also works on installed packages. In that case, you can see which source the package was installed from. Was it a PPA or some third-party repository or universe or the main repository itself?

Personally, I use apt show a lot. This helps me know if the package version provided by Ubuntu is the latest or not. Pretty handy tool!

### Conclusion

If you read my detailed [guide on the difference between apt and apt-get commands][13], you would know that this ‘apt search’ command works similar to ‘apt-cache search’. There is no such command as “apt-get search”.

The purpose of creating apt command is to give you one tool with only enough option to manage the packages in your Debian/Ubuntu system. The apt-get, apt-cache and other apt tools still exist, and they can be used in scripting for more complex scenarios.

I hope you found this introduction to **apt search** and **apt show** commands useful. I welcome your questions and suggestions on this topic.

If you liked it, please share it on various Linux forums and communities you frequent. That helps us a lot. Thank you.

--------------------------------------------------------------------------------

via: https://itsfoss.com/apt-search-command/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://wiki.debian.org/Apt
[2]: https://itsfoss.com/ubuntu-repositories/
[3]: https://ubuntu.com/
[4]: https://itsfoss.com/apt-command-guide/
[5]: https://itsfoss.com/root-user-ubuntu/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/apt-search-apt-show-example-800x493.png?resize=800%2C493&ssl=1
[7]: https://itsfoss.com/install-gambas-ubuntu/
[8]: https://itsfoss.com/unable-to-locate-package-error-ubuntu/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/apt-search-command.png?ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/apt-search-command-example.png?fit=800%2C297&ssl=1
[11]: https://itsfoss.com/list-installed-packages-ubuntu/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/apt-show-command-example-800x474.png?resize=800%2C474&ssl=1
[13]: https://itsfoss.com/apt-vs-apt-get-difference/
