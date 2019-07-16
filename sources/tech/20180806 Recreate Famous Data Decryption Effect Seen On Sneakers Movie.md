Recreate Famous Data Decryption Effect Seen On Sneakers Movie
======

![](https://www.ostechnix.com/wp-content/uploads/2018/08/sneakers-720x340.jpg)

A while ago, we published a guide that described how to [**turn your Ubuntu Linux console into a veritable Hollywood technical melodrama hacker interface**][1] using **Hollywood** utility which is written by **Dustin Kirkland** from Canonical. Today, I have stumbled upon a similar CLI utility named “ **N** o **M** ore **S** ecrets”, shortly **nms**. Like Hollywood utility, the nms utility is also **USELESS** (Sorry!). You can use it just for fun. The nms will recreate the famous data decryption effect seen on Sneakers, released in 1992.

[**Sneakers**][2] is a comedy and crime-thriller genre movie, starred by **Robert Redford** among other famous actors named **Dan Aykroyd** , **David Strathairn** and **Ben Kingsley**. This movie is one of the popular hacker movie released in 1990s. If you haven’t watched it already, there is [**a scene**][3] in Sneakers movie where a group of experts who specialize in testing security systems will recover a top secret black box that has the ability to decrypt all existing encryption systems around the world. The nms utility simply simulates how exactly the data decryption effect scene looks like on Sneakers movie in your Terminal.

### Installing Nms

The nms project has no dependencies, but it relies on ANSI/VT100 terminal escape sequences to recreate the effect. Most modern terminal programs support these sequences by default. Just in case, if your Terminal doesn’t support these sequences, install **ncurses**. Ncurses is available in the default repositories of most Linux distributions. We are going to compile and install nms from source. So, just make sure you have installed the development tools in your Linux box. If you haven’t installed them already, refer the following links.

After installing, git, make, and gcc development tools, run the following commands one by one to compile and install nms utility.
```
$ git clone https://github.com/bartobri/no-more-secrets.git
$ cd ./no-more-secrets
$ make nms
$ make sneakers
$ sudo make install

```

Finally, check if the installation was successful using command:
```
$ nms -v
nms version 0.3.3

```

Alternatively, you can install nms using [**Linuxbrew**][4] package manager as shown below.
```
$ brew install no-more-secrets

```

Now it is time to run nms.

### Recreate Famous Data Decryption Effect Seen On Sneakers Movie Using Nms

The nms utility works on piped data. Pipe any Linux command’s output to nms tool like below and enjoy the effect right from your Terminal. Have a look at the following command:
```
$ ls -l | nms

```

By default, after the initial encrypted characters are displayed, the **nms** utility will wait for the user to press a key to start the decryption sequence. This is how the it is depicted in the Sneakers movie. Just press any key to start the decryption sequence to reveal the original plaintext characters.

If you don’t want to press any key, you can auto-initiate the decryption sequence using **-a** flag.
```
$ ls -l | nms -a

```

You can also set a foreground color, for example green, use **-f <color>** option as shown below.
```
$ ls -l | nms -f green

```

Remember If you don’t specify **-a** flag, you must press any key to initiate the decryption sequence.

To clear the screen before starting encryption and decryption processes, use **-c** flag.
```
$ ls -l | nms -c

```

To mask single blank space characters, use -s flag. Please note that other space characters such as tabs and newlines will not be masked.
```
$ ls -l | nms -s

```

You can also view the actual decryption effect scene in the Sneakers movie using the following command:
```
$ sneakers

```

Choose any option given to exit this utility.

Don’t like it? Sorry about that. Go to the nms project folder and simply run the following command to remove it.
```
$ sudo make uninstall

```

And, that’s all for now. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/no-more-secrets-recreate-famous-data-decryption-effect-seen-on-sneakers-movie/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/turn-ubuntu-terminal-hollywood-technical-melodrama-hacker-interface/
[2]:https://www.imdb.com/title/tt0105435/
[3]:https://www.youtube.com/watch?v=F5bAa6gFvLs&t=35
[4]:https://www.ostechnix.com/linuxbrew-common-package-manager-linux-mac-os-x/
