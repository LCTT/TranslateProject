Tlog - A Tool to Record / Play Terminal IO and Sessions
======
Tlog is a terminal I/O recording and playback package for Linux Distros. It's suitable for implementing centralized user session recording. It logs everything that passes through as JSON messages. The primary purpose of logging in JSON format is to eventually deliver the recorded data to a storage service such as Elasticsearch, where it can be searched and queried, and from where it can be played back. At the same time, they retain all the passed data and timing.

Tlog contains three tools namely tlog-rec, tlog-rec-session and tlog-play.

  * `Tlog-rec tool` is used for recording terminal input or output of programs or shells in general.
  * `Tlog-rec-session tool` is used for recording I/O of whole terminal sessions, with protection from recorded users.
  * `Tlog-play tool` for playing back the recordings.



In this article, I'll explain how to install Tlog on a CentOS 7.4 server.

### Installation

Before proceeding with the install, we need to ensure that our system meets all the software requirements for compiling and installing the application. On the first step, update your system repositories and software packages by using the below command.
```
#yum update
```

We need to install the required dependencies for this software installation. I've installed all dependency packages with these commands prior to the installation.
```
#yum install wget gcc
#yum install systemd-devel json-c-devel libcurl-devel m4
```

After completing these installations, we can download the [source package][1] for this tool and extract it on your server as required:
```
#wget https://github.com/Scribery/tlog/releases/download/v3/tlog-3.tar.gz
#tar -xvf tlog-3.tar.gz
# cd tlog-3
```

Now you can start building this tool using our usual configure and make approach.
```
#./configure --prefix=/usr --sysconfdir=/etc && make
#make install
#ldconfig
```

Finally, you need to run `ldconfig`. It creates the necessary links and cache to the most recent shared libraries found in the directories specified on the command line, in the file /etc/ld.so.conf, and in the trusted directories (/lib and /usr/lib).

### Tlog workflow chart

![Tlog working process][2]

Firstly, a user authenticates to login via PAM. The Name Service Switch (NSS) provides the information as `tlog` is a shell to the user. This initiates the tlog section and it collects the information from the Env/config files about the actual shell and starts the actual shell in a PTY. Then it starts logging everything passing between the terminal and the PTY via syslog or sd-journal.

### Usage

You can test if session recording and playback work in general with a freshly installed tlog, by recording a session into a file with `tlog-rec` and then playing it back with `tlog-play`.

#### Recording to a file

To record a session into a file, execute `tlog-rec` on the command line as such:
```
tlog-rec --writer=file --file-path=tlog.log
```

This command will record our terminal session to a file named tlog.log and save it in the path specified in the command.

#### Playing back from a file

You can playback the recorded session during or after recording using `tlog-play` command.
```
tlog-play --reader=file --file-path=tlog.log
```

This command reads the previously recorded file tlog.log from the file path mentioned in the command line.

### Wrapping up

Tlog is an open-source package which can be used for implementing centralized user session recording. This is mainly intended to be used as part of a larger user session recording solution but is designed to be independent and reusable.This tool can be a great help for recording everything users do and store it somewhere on the server side safe for the future reference. You can get more details about this package usage in this [documentation][3]. I hope this article is useful to you. Please post your valuable suggestions and comments on this.

### About Saheetha Shameer(the author)
I'm working as a Senior System Administrator. I'm a quick learner and have a slight inclination towards following the current and emerging trends in the industry. My hobbies include hearing music, playing strategy computer games, reading and gardening. I also have a high passion for experimenting with various culinary delights :-)

--------------------------------------------------------------------------------

via: https://linoxide.com/linux-how-to/tlog-tool-record-play-terminal-io-sessions/

作者：[Saheetha Shameer][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linoxide.com/author/saheethas/
[1]:https://github.com/Scribery/tlog/releases/download/v3/tlog-3.tar.gz
[2]:https://linoxide.com/wp-content/uploads/2018/01/Tlog-working-process.png
[3]:https://github.com/Scribery/tlog/blob/master/README.md
