[#]: subject: "How to Install Latest Vim 9.0 on Ubuntu Based Linux Distributions"
[#]: via: "https://itsfoss.com/install-latest-vim-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Latest Vim 9.0 on Ubuntu Based Linux Distributions
======
Brief: This quick tutorial shows the steps for installing the latest version of Vim on Ubuntu Linux.

Vim is one of the most [popular terminal-based text editors][1]. However, it is not installed by default on Ubuntu.

Ubuntu uses Nano as the default terminal editor. Nano is also an excellent tool and I am not going into [Nano vs Vim debate][2].

If you have already spent some time mastering the Vim shortcuts, you don’t have to forget them and start using a new editor.

You can install Vim on Ubuntu using the following command in the terminal:

```
sudo apt install vim
```

That’s quite simple, right? This approach’s major problem is that you won’t get the latest Vim version.

You can check the installed Vim version with the following command:

```
vim --version
```

And if you check the [Vim website][3], you’ll find that Vim has newer versions released already.

At the time of writing this article, [Vim 9.0 is released][4] but is not available in Ubuntu repositories yet.

The good news is that you can install the latest Vim using an [unofficial but actively maintained PPA][5].

### Install Vim 9 on Ubuntu using a PPA

If you have specific Vim configuration files, there is no harm in making a backup for them.

Now, to install the latest Vim version, add the PPA repository first:

```
sudo add-apt-repository ppa:jonathonf/vim
```

![Adding the PPA to get the latest Vim version][6]

You don’t need to update the package cache on Ubuntu but other distributions like Mint may still require it:

```
sudo apt update
```

Now, use the command below to install the latest Vim version offered by the PPA:

```
sudo apt install vim
```

If you had already an older Vim version installed, it would be upgraded. You can check the installed Vim version using:

```
vim --version
```

![Checking installed Vim version][7]

This is a very well-maintained PPA and is available for all active Ubuntu versions.

If you are new to this PPA thing, I have a detailed guide on this topic. You should read to learn more about the [concept of PPA in Ubuntu][8].

### Downgrade or remove it

If you want to go back to the older Vim version provided by Ubuntu, you should remove the existing version, remove the PPA and install it again.

Before removing Vim, you should copy the vimrc or other such config file if you had made custom changes and plan to use Vim again.

Alright. Open a terminal and use the following command:

```
sudo apt remove vim
```

Now delete the PPA otherwise you’ll get the latest Vim again (if you try installing Vim for the older version):

```
sudo add-apt-repository -r ppa:jonathonf/vim
```

Now, if you want the old, official Ubuntu version of Vim, just install it again [using the apt command][9].

Enjoy Vim on Ubuntu.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-latest-vim-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/command-line-text-editors-linux/
[2]: https://itsfoss.com/vim-vs-nano/
[3]: https://www.vim.org/
[4]: https://news.itsfoss.com/vim-9-0-release/
[5]: https://launchpad.net/~jonathonf/+archive/ubuntu/vim
[6]: https://itsfoss.com/wp-content/uploads/2022/07/install-latest-vim-on-ubuntu-using-ppa.png
[7]: https://itsfoss.com/wp-content/uploads/2022/07/vim-9-ubuntu.png
[8]: https://itsfoss.com/ppa-guide/
[9]: https://itsfoss.com/apt-command-guide/
