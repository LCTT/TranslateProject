[#]: subject: "Using Homebrew Package Manager on Fedora Linux"
[#]: via: "https://fedoramagazine.org/using-homebrew-package-manager-on-fedora-linux/"
[#]: author: "Mehdi Haghgoo https://fedoramagazine.org/author/powergame/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Using Homebrew Package Manager on Fedora Linux
======

![][1]

### Introduction

Homebrew is a package manager for macOS to install UNIX tools on macOS. But, it can be used on Linux (and Windows WSL) as well. It is written in Ruby and provides software packages that might not be provided by the host system (macOS or Linux), so it offers an auxiliary package manager besides the OS package manager. In addition, it installs packages only to its prefix (either /home/linuxbrew/.linuxbrew or ~/.linuxbrew) as a non-root user, without polluting system paths. This package manager works on Fedora Linux too. In this article, I will try to show you how Homebrew is different from Fedora Linux package manager _dnf_ , why you might want to install and use it on Fedora Linux, and how.

##### Warning

You should always inspect the packages and binaries you are installing on your system. Homebrew packages usually run as a non-sudoer user and to a dedicated prefix so they are quite unlikely to cause harm or misconfigurations. However, do all the installations at your own risk. The author and the Fedora community are not responsible for any damages that might result directly or indirectly from following this article.

### How Homebrew Works

Homebrew uses Ruby and Git behind the scenes. It builds software from source using special Ruby scripts called formulae which look like this (Using wget package as an example):

```

    class Wget < Formula
      homepage "https://www.gnu.org/software/wget/"
      url "https://ftp.gnu.org/gnu/wget/wget-1.15.tar.gz"
      sha256 "52126be8cf1bddd7536886e74c053ad7d0ed2aa89b4b630f76785bac21695fcd"

      def install
        system "./configure", "--prefix=#{prefix}"
        system "make", "install"
      end
    end

```

### How Homebrew is Different from _dnf_

Homebrew is a package manager that provides up-to-date versions of many UNIX software tools and packages e.g. ffmpeg, composer, minikube, etc. It proves useful when you want to install some packages that are not available in Fedora Linux _rpm_ repositories for some reason. So, it does not replace _dnf_.

### Install Homebrew

Before starting to install Homebrew, make sure you have glibc and gcc installed. These tools can be installed on Fedora with:

```

    sudo dnf groupinstall "Development Tools"

```

Then, install Homebrew by running the following command in a terminal:

```

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

```

During the installation you will be prompted for your sudo password. Also, you will have the option to choose the installation prefix for Homebrew, but the default prefix is fine. During the install, you will be made the owner of the Homebrew prefix, so that you will not have to enter the sudo password to install packages. The installation will take several minutes. Once finished, run the following commands to add brew to your PATH:

```

    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bash_profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

```

### Install and Investigate Packages

To install a package using a formula on Homebrew, simply run:

```

    brew install <formula>

```

Replace &lt;formula&gt; with the name of the formula you want to install. For example, to install Minikube, simply run:

```

    brew install minikube

```

You can also search for formulae with:

```

    brew search <formula>

```

To get information about a formula, run:

```

    brew info <formula>

```

Also, you can see all the installed formulae with the following command:

```

    brew list

```

### Uninstall Packages

To uninstall a package from your Homebrew prefix, run:

```

    brew uninstall <formula>

```

### Upgrade Packages

To upgrade a specific package installed with Homebrew, run:

```

    brew upgrade <formula>

```

To update Homebrew and all the installed Formulae to the latest versions, run:

```

    brew update

```

### Wrap Up

Homebrew is a simple package manager that can be a helpful tool alongside _dnf_ (The two are not related at all). Try to stick with the native _dnf_ package manager for Fedora to avoid software conflicts. However, if you don’t find a piece of software in the Fedora Linux repositories, then you might be able to find and install it with Homebrew. See the [Formulae list][2] for what is available. Also, Homebrew on Fedora Linux does not support graphical applications (called casks in Homebrew terminology) yet. At least, I didn’t have any luck installing any GUI apps.

### References and Further Reading

To learn more about Homebrew, check out the following resources:

  * Homebrew Homepage: <https://brew.sh>
  * Homebrew Docs: <https://docs.brew.sh>
  * Wikipedia Homebrew Page: <https://en.wikipedia.org/wiki/Homebrew_(package_manager)>



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-homebrew-package-manager-on-fedora-linux/

作者：[Mehdi Haghgoo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/powergame/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/03/homebrew_sized-up-816x346.png
[2]: https://formulae.brew.sh/formula/
