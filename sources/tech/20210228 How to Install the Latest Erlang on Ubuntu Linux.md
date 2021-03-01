[#]: subject: (How to Install the Latest Erlang on Ubuntu Linux)
[#]: via: (https://itsfoss.com/install-erlang-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Install the Latest Erlang on Ubuntu Linux
======

[Erlang][1] is a functional programming language for building massive scalable real-time systems. Originally created by [Ericsson][2] as a proprietary software, Erlang was later open sourced.

Erlang is available in the [Universe repository of Ubuntu][3]. With that repository enabled, you can easily install it using the following command:

```
sudo apt install erlang
```

![][4]

However, the _**Erlang version offered by Ubuntu repositories may not be the latest one**_.

If you want the _**latest Erlang version on Ubuntu**_, you can add the repository [offered by Erlang Solutions][5]. They provide prebuilt binaries for various Linux distributions, Windows and macOS.

If you had installed a package named `erlang` previously, it will be upgraded to the newer version offered by the added repository.

### Installing the latest version of Erlang on Ubuntu

You’ll need to [download the key file in Linux terminal][6]. You can use wget tool for that so make sure that you have it installed:

```
sudo apt install wget
```

Next, use wget to download the GPG key of the Erlang Solution repository and add it your apt packaging system. With the key added, your system will trust the packages coming from the repository.

```
wget -O- https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | sudo apt-key add -
```

Now, you should add a file for Erlang in your APT sources.list.d directory. This file will contain the information about the repository and the APT package manager will use it for getting the packages and any future updates to it.

**For Ubuntu 20.04 (and Ubuntu 20.10)** use the following:

```
echo "deb https://packages.erlang-solutions.com/ubuntu focal contrib" | sudo tee /etc/apt/sources.list.d/erlang-solution.list
```

I know that the above command mentions focal (for Ubuntu 20.04) but it also works for Ubuntu 20.10 groovy.

For **Ubuntu 18.04**, use the following:

```
echo "deb https://packages.erlang-solutions.com/ubuntu bionic contrib" | sudo tee /etc/apt/sources.list.d/erlang-solution.list
```

You must update the local package cache to inform it about the packages from the newly added repository:

```
sudo apt update
```

You’ll notice that it suggests several upgrades. If you list the available upgrades, you’ll find erlang packages there. To update the existing erlang version or install it afresh, use this command:

```
sudo apt install erlang
```

Once installed, you can test it out.

![][7]

To quit the Erlang shell, use Ctrl+g and then enter q. I had to do a hit and try to figure that out because I had never used Erlang before.

#### Removing erlang

To remove the program, use the following command:

```
sudo apt remove erlang
```

There will be a few dependencies left. You can remove them with the following command:

```
sudo apt autoremove
```

If you want, you may also remove the added repository file:

```
sudo rm /etc/apt/sources.list.d/erlang-solution.list
```

That’s about it. Enjoy learning and coding with Erlang on Ubuntu Linux.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-erlang-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.erlang.org/
[2]: https://www.ericsson.com/en
[3]: https://itsfoss.com/ubuntu-repositories/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/install-erlang-ubuntu.png?resize=800%2C445&ssl=1
[5]: https://www.erlang-solutions.com/downloads/
[6]: https://itsfoss.com/download-files-from-linux-terminal/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/erlang-shell.png?resize=800%2C274&ssl=1
