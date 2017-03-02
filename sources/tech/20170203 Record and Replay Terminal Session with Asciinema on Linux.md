### Record and Replay Terminal Session with Asciinema on Linux

![](https://linuxconfig.org/images/asciimena-video-example.jpg?58942057)

Contents

*   *   [1. Introduction][11]
    *   [2. Difficulty][12]
    *   [3. Conventions][13]
    *   [4. Standard Repository Installation][14]
        *   [4.1. Arch Linux][1]
        *   [4.2. Debian][2]
        *   [4.3. Ubuntu][3]
        *   [4.4. Fedora][4]
    *   [5. Installation From Source][15]
    *   [6. Prerequisites][16]
        *   [6.1. Arch Linux][5]
        *   [6.2. Debian][6]
        *   [6.3. Ubuntu][7]
        *   [6.4. Fedora][8]
        *   [6.5. CentOS][9]
    *   [7. Linuxbrew Installation][17]
    *   [8. Asciinema Installation][18]
    *   [9. Recording Terminal Session][19]
    *   [10. Replay Recorded Terminal Session][20]
    *   [11. Embedding Video as HTML][21]
    *   [12. Conclusion][22]
    *   [13. Troubleshooting][23]
        *   [13.1. asciinema needs a UTF-8][10]

### Introduction

Asciinema is a lightweight and very efficient alternative to a `Script`terminal session recorder. It allows you to record, replay and share your JSON formatted terminal session recordings. The main advantage in comparison to desktop recorders such as Recordmydesktop, Simplescreenrecorder, Vokoscreen or Kazam is that Asciinema records all standard terminal input, output and error as a plain ASCII text with ANSI escape code . 

As a result, JSON format file is minuscule in size even for a longer terminal session. Furthermore, JSON format gives the user the ability to share the Asciinema JSON output file via simple file transfer, on the public website as part of embedded HTML code or share it on Asciinema.org using asciinema account. Lastly, in case that you have made some mistake during your terminal session, your recorded terminal session can be retrospectively edited using any text editor, that is if you know your way around ANSI escape code syntax.

### Difficulty

EASY

### Conventions

*   **#** - requires given command to be executed with root privileges either directly as a root user or by use of `sudo` command
*   **$** - given command to be executed as a regular non-privileged user

### Standard Repository Installation

It is very likely that asciinema is installable as part fo your distribution repository. However, if Asciinema is not available on your system or you wish to install the latest version, you can use Linuxbrew package manager to perform Asciinema installation as described below in the "Installation From Source" section.

### Arch Linux

```
# pacman -S asciinema
```

### Debian

```
# apt install asciinema
```

### Ubuntu

```
$ sudo apt install asciinema
```

### Fedora

```
$ sudo dnf install asciinema
```

### Installation From Source

The easiest and recommended way to install the latest Asciinema version from source is by use of Linuxbrew package manager.

### Prerequisites

The following list of prerequisites fulfils dependency requirements for both, Linuxbrew and Asciinema.

*   git
*   gcc
*   make
*   ruby

Before you proceed with Linuxbrew installation make sure that the above packages are istalled on your Linux system.

### Arch Linux

```
# pacman -S git gcc make ruby
```

### Debian

```
# apt install git gcc make ruby
```

### Ubuntu

```
$ sudo apt install git gcc make ruby
```

### Fedora

```
$ sudo dnf install git gcc make ruby
```

### CentOS

```
# yum install git gcc make ruby
```

### Linuxbrew Installation

The Linuxbrew package manager is a fork of the popular Homebrew package manager used on Apple's MacOS operating system. Homebrew is known for its ease of use, which is to be seen shortly, when we use Linuxbrew to install Asciinema. Run the bellow command to install Linuxbrew on your Linux distribution:
```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
```
Linuxbrew is now installed under your `$HOME/.linuxbrew/`. What remains is to make it part of your executable `PATH` environment variable.
```
$ echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >>~/.bash_profile
$ . ~/.bash_profile
```
To confirm the Linuxbrew installation you can use `brew` command to query its version:
```
$ brew --version
Homebrew 1.1.7
Homebrew/homebrew-core (git revision 5229; last commit 2017-02-02)
```

### Asciinema Installation

With the Linuxbrew now installed, the installation of Asciinema should be easy as single one-liner:
```
$ brew install asciinema
```
Check the correctnes of asciinema installation:
```
$ asciinema --version
asciinema 1.3.0
```

### Recording Terminal Session

After all that hard work with the installation, it is finally time to have some fun. Asciinema is an extremely easy to use software. In fact, the current version 1.3 has only few command line options available and one of them is `--help`. 

Let's start by recording a terminal session using the `rec` option. The following command will start recording your terminal session after which you will have an option to either discard your recording or upload it on asciinema.org website for a future reference.
```
$ asciinema rec
```
Once you run the above command, you will be notified that your asciinema recording session has started, and that the recording can be stopped by entering `CTRL+D` key sequence or execution of `exit` command. If you are on Debian/Ubuntu/Mint Linux you can try this as your first asciinema recording:
```
$ su
Password: 
# apt install sl
# exit
$ sl
```
Once you enter the last exit command you will be asked:
```
$ exit
~ Asciicast recording finished.
~ Press <Enter> to upload, <Ctrl-C> to cancel.

https://asciinema.org/a/7lw94ys68gsgr1yzdtzwijxm4
```
If you do not feel like to upload your super secret kung-fu command line skills to asciinema.org, you have an option to store Asciinema recording as a local file in JSON format. For example, the following asciinema recording will be stored as `/tmp/my_rec.json`:
```
$ asciinema rec /tmp/my_rec.json
```
Another extremely useful asciinema feature is time trimming. If you happen to be a slow writer or perhaps you are doing multitasking, the time between entering and execution of your commands can stretch greatly. Asciinema records your keystrokes real-time, meaning every pause you make will reflect on the lenght of your resulting video. Use `-w` option to shorten the time between your keystrokes. For example, the following command trims the time between your keystrokes to 0.2 seconds:
```
$ asciinema rec -w 0.2
```

### Replay Recorded Terminal Session

There are two options to replay your recorded terminal sessions. First, play you terminal session directly from asciinema.org. That is, provided that you have previously uploaded your recording to asciinema.org and you have valid URL:
```
$ asciinema play https://asciinema.org/a/7lw94ys68gsgr1yzdtzwijxm4
```
Alternatively, use your locally stored JSON file:
```
$ asciinema play /tmp/my_rec.json
```
Use `wget` command to download your previously uploaded recording. Simply add `.json` to your existing URL:
```
$ wget -q -O steam_locomotive.json https://asciinema.org/a/7lw94ys68gsgr1yzdtzwijxm4.json
$ asciinema play steam_locomotive.json
```

### Embedding Video as HTML

Lastly, Asciinema also comes with a stand-alone JavaScript player. Which means that it is easy to share your terminal session recordings on your website. The below lines illustrate this idea with a simple `index.html`code. First, download all necessary parts:
```
$ cd /tmp/
$ mkdir steam_locomotive
$ cd steam_locomotive/
$ wget -q -O steam_locomotive.json https://asciinema.org/a/7lw94ys68gsgr1yzdtzwijxm4.json
$ wget -q https://github.com/asciinema/asciinema-player/releases/download/v2.4.0/asciinema-player.css
$ wget -q https://github.com/asciinema/asciinema-player/releases/download/v2.4.0/asciinema-player.js
```
Next, create a new `/tmp/steam_locomotive/index.html` file with a following content:
```
<html>
<head>
  <link rel="stylesheet" type="text/css" href="./asciinema-player.css" />
</head>
<body>
  <asciinema-player src="./steam_locomotive.json" cols="80" rows="24"></asciinema-player>
  <script src="./asciinema-player.js"></script>
</body>
</html>
```
Once ready, open up your web browser, hit CTRL+O and open your newly created `/tmp/steam_locomotive/index.html` file. 

### Conclusion

As mentioned before, the main advantage for recording your terminal sessions with the Asciinema recorder is the minuscule output file which makes your videos extremely easy to share. The example above produced a file containing 58 472 characters, that is 58KB for 22 seconds video session. When reviewing the output JSON file, even this number is greatly inflated, mostly due to the fact that we have seen a Steam Locomotive rushing across our terminal. Normal terminal session of this length should produce a much smaller output file. 

Next, time when you are about to ask a question on forums about your Linux configuration issue and having a hard time to explain how to reproduce your problem, simply run:
```
$ asciinema rec
```
and paste the resulting URL into your forum post.

### Troubleshooting

### asciinema needs a UTF-8

Error message:
```
asciinema needs a UTF-8 native locale to run. Check the output of `locale` command.
```
Solution:
Generate and export UTF-8 locale. For example:
```
$ localedef -c -f UTF-8 -i en_US en_US.UTF-8
$ export LC_ALL=en_US.UTF-8
```

--------------------------------------------------------------------------------

via: https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux

作者：[Lubos Rendek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux
[1]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h4-1-arch-linux
[2]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h4-2-debian
[3]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h4-3-ubuntu
[4]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h4-4-fedora
[5]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h6-1-arch-linux
[6]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h6-2-debian
[7]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h6-3-ubuntu
[8]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h6-4-fedora
[9]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h6-5-centos
[10]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h13-1-asciinema-needs-a-utf-8
[11]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h1-introduction
[12]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h2-difficulty
[13]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h3-conventions
[14]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h4-standard-repository-installation
[15]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h5-installation-from-source
[16]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h6-prerequisites
[17]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h7-linuxbrew-installation
[18]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h8-asciinema-installation
[19]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h9-recording-terminal-session
[20]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h10-replay-recorded-terminal-session
[21]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h11-embedding-video-as-html
[22]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h12-conclusion
[23]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h13-troubleshooting
