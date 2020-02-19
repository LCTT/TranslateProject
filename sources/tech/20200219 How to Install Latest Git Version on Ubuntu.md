[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install Latest Git Version on Ubuntu)
[#]: via: (https://itsfoss.com/install-git-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Install Latest Git Version on Ubuntu
======

Installing Git on Ubuntu is very easy. It is available in the [main repository of Ubuntu][1] and you can install it [using the apt command][2] like this:

```
sudo apt install git
```

Easy? Isn’t it?

There is only a slight little problem (which might not be a problem at all) and that is the version of [Git][3] it installs.

On an LTS system, the software stability is of upmost importance this is why Ubuntu 18.04 and other distributions often provide older but stable version of a software that is well tested with the distribution release.

This is why when you check the Git version, you’ll see that it installs a version which is older than the [current Git version available on Git project’s website][4]:

```
[email protected]:~$ git --version
git version 2.17.1
```

At the time of writing this tutorial, the version available on its website is 2.25. So how do you install the latest Git on Ubuntu then?

### Install latest Git on Ubuntu-based Linux distributions

![][5]

One way would be to [install from source code][6]. That cool, old school method is not everyone’s cup of tea. Thankfully, there is a [PPA available from Ubuntu Git Maintainers team][7] that you can use to easily install the latest stable Git version.

```
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git
```

Even if you had installed Git using apt previously, it will get updated to the latest stable version.

```
[email protected]:~$ git --version
git version 2.25.0
```

The beauty of [using PPA][8] is that if there is a new stable version of Git released, you’ll get it with the system updates. [Just update Ubuntu][9] to get the latest Git stable version.

Trivia

Did you know that Git version control system was created by none other than [Linux creator Linus Torvalds][10]?

### Configure Git [Recommended for developers]

If you have installed Git for development purposes, you’ll soon start cloning repos, make your changes and commit your change.

If you try to commit your code, you may see a ‘Please tell me who you are’ error like this:

```
[email protected]:~/compress-pdf$ git commit -m "update readme"

*** Please tell me who you are.

Run

  git config --global user.email "[email protected]"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: unable to auto-detect email address (got '[email protected](none)')
```

This is because you haven’t configured Git with your personal information which is mandatory.

As the error already hints, you can set up global Git configuration like this:

```
git config --global user.name "Your Name"
git config --global user.email "[email protected]"
```

You can check the Git configuration with this command:

```
git config --list
```

It should show an output like this:

```
[email protected]
user.name=abhishek
```

This configuration is stored in ~/.gitconfig file. You may also change it manually to change the configuration.

* * *

**In the end…**

I hope this quick little tutorial helped you to install Git on Ubuntu. With the PPA, you easily get the latest Git version.

If you have any questions or suggestions, please feel free to ask in the comment section. A quick ‘thank you’ is also welcomed :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-git-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-repositories/
[2]: https://itsfoss.com/apt-command-guide/
[3]: https://git-scm.com/
[4]: https://git-scm.com/downloads
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/02/install_git_ubuntu.png?ssl=1
[6]: https://itsfoss.com/install-software-from-source-code/
[7]: https://launchpad.net/~git-core/+archive/ubuntu/ppa
[8]: https://itsfoss.com/ppa-guide/
[9]: https://itsfoss.com/update-ubuntu/
[10]: https://itsfoss.com/linus-torvalds-facts/
