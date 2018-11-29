[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (OpenSnitch – an Application Firewall for Linux [Review])
[#]: via: (https://itsfoss.com/opensnitch-firewall-linux/)
[#]: author: ([John Paul](https://itsfoss.com/author/john/))
[#]: url: ( )

OpenSnitch – an Application Firewall for Linux [Review]
======

Just because Linux is a lot more secure than Windows, there is no reason you should not be cautious. There are a number of firewalls available for Linux that you can use to make your Linux system more secure. Today we will be taking a look at one of such firewall tool called OpenSnitch.

### What is OpenSnitch?

![Linux firewall and security][1]

[OpenSnitch][2] is a port of Little Snitch. Little Snitch, in turn, is an application firewall designed solely for Mac OS. OpenSnitch is created by [Simone Margaritelli][3], also known as [evilsocket][4].

The main thing that OpenSnitch does is track internet requests made by applications you have installed. OpenSnitch allows you to create rules for which apps to allow to access the internet and which to block. Each time an application that does not have a rule in place tries to access the internet, a dialog box appears. This dialog box gives you the option to allow or block the connection.

You can also decide whether this new rule applies to the process, the exact URL it is attempting to reach, the domain that it is attempting to reach, to this single instance, to this session or forever.

![OpenSnitch firewall app in Linux][5]OpenSnatch rule request

All of the rules that you create are stored as [JSON files][6] so you can change them later if you need to. For example, if you incorrectly blocked an application.

OpenSnitch also has a nice graphical user interface that lets you see at a glance:

  * What applications are accessing the web
  * What IP address they are using
  * What User owns it
  * What port is being used



You can also export the information to a CSV file if you wish.

OpenSnitch is available under the GPL v3 license.

![OpenSnitch firewall interface][7]OpenSnitch processes tab

### Installing OpenSnitch in Linux

The installation instructions on the [OpenSnitch GitHub page][8] are aimed at Ubuntu users. If you are using another distro, you will have to adjust the commands. As far as I know, this application is only packaged in the [Arch User Repository][9].

Before you start, you need to have Go properly installed and the `$GOPATH` environment variable is defined.

First, install the necessary dependencies.

```
sudo apt-get install protobuf-compiler libpcap-dev libnetfilter-queue-dev python3-pip

go get github.com/golang/protobuf/protoc-gen-go

go get -u github.com/golang/dep/cmd/dep

python3 -m pip install --user grpcio-tools
```

Next, you will need to clone the OpenSnitch repo. There will probably be a message that no Go files where found. Ignore it. If you get a message that git is missing, just install it.

```
go get github.com/evilsocket/opensnitch

cd $GOPATH/src/github.com/evilsocket/opensnitch
```

If the `$GOPATH` environment variable is not setup correctly, you will get a “no such folder found” error on the previous command. just `cd` into the location of the “evilsocket/opensnitch” folder that was listed when you cloned it to your system.

Now, we build and install it.

```
make

sudo make install
```

If you get an error that the `dep` command could not be found, add `GOPATH/bin` is in the `PATH`.

Once that is finished, we will initiate the daemon and start the graphical user environment.

```
sudo systemctl enable opensnitchd

sudo service opensnitchd start

opensnitch-ui
```

![OpenSnitch firewall interface][10]OpenSnitch on Manjaro

### Experience

I’ll be honest: my experience with OpenSnitch was not great. I started by trying to install it on Fedora. I had trouble finding some of the dependencies. I switched over to Manjaro and was happy to find it in the Arch User Repository.

Unfortunately, after I ran the installation, I could not launch the graphical user interface. So I ran the last three steps by hand. Everything seemed to be working fine. The dialog box popped up asking me if I wanted to let Firefox visit the Manjaro website.

Interestingly, when I ran an [AUR tool][11] `yay` to update my system, the dialog box requested rules for `yay`, `pacman`, `pamac`, and `git`. Later, I had to close and restart the GUI because it was acting up. When I restart it, it stopped asking me to create rules. I installed Falkon and OpenSnitch did not ask me to give it any permissions. It did not even list Falkon in the OpenSnithch GUI. I reinstalled OpenSnitch. Same issue.

Then I moved to Ubuntu Mate. Since the installation instructions were written for Ubuntu, things went easier. However, I ran into a couple issues. I tweaked the installation instructions above to fix the problems I encountered.

Installation was not the only issue that I ran into. The dialog box that appeared every time a new app created a connection only lasted for 10 seconds. That was barely enough time to explore the available options. Most of the time, I only had time to allow an application (only the ones I trust) to access the web forever.

The GUI also left a bit to be desired. For some reason, the window was set to be on top all of the time. On top of that, there are no setting to change it. It would also have been nice to have the option to change rules from the GUI.

![][12]OpenSnitch hosts tab

### Final Thoughts on OpenSnitch

I like what OpenSnitch is aiming for: any easy way to control what information leaves your computer. However, it has too many rough edges for me to recommend it to a regular or hobby user. If you are a power user, who likes to tinker and dig for answers then maybe this is for you.

It’s kinda disappointing. I would have hoped that an application that recently hit 1.0 would be in a little better shape.

Have you ever used OpenSnitch? If not, what is your favorite firewall app? How do you make your Linux system more secure? Let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][13].

--------------------------------------------------------------------------------

via: https://itsfoss.com/opensnitch-firewall-linux/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/11/linux-firewall-security.jpg?fit=800%2C450&ssl=1
[2]: https://www.opensnitch.io/
[3]: https://github.com/evilsocket
[4]: https://twitter.com/evilsocket
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/11/opensnitch-dialog.jpg?fit=800%2C421&ssl=1
[6]: https://www.json.org/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/11/opensnitch-processes.jpg?fit=800%2C651&ssl=1
[8]: https://github.com/evilsocket/opensnitch
[9]: https://aur.archlinux.org/packages/opensnitch-git
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/11/opensnitch-manjaro.jpg?fit=800%2C651&ssl=1
[11]: https://itsfoss.com/best-aur-helpers/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/11/opensnitch-hosts.jpg?fit=800%2C651&ssl=1
[13]: http://reddit.com/r/linuxusersgroup
