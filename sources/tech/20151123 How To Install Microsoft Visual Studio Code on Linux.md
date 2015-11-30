How To Install Microsoft Visual Studio Code on Linux
================================================================================
Visual Studio code (VScode) is the cross-platform Chromium-based code editor is being open sourced today by Microsoft. How do I install Microsoft Visual Studio Code on a Debian or Ubuntu or Fedora Linux desktop?

Visual Studio supports debugging Linux apps and code editor now open source by Microsoft. It is a preview (beta) version but you can test it and use it on your own Linux based desktop.

### Why use Visual Studio Code? ###

From the project website:

> Visual Studio Code provides developers with a new choice of developer tool that combines the simplicity and streamlined experience of a code editor with the best of what developers need for their core code-edit-debug cycle. Visual Studio Code is the first code editor, and first cross-platform development tool - supporting OS X, Linux, and Windows - in the Visual Studio family. If you use Unity, ASP.NET 5, NODE.JS or related tool, give it a try.

### Requirements for Visual Studio Code on Linux ###

1. Ubuntu Desktop version 14.04
1. GLIBCXX version 3.4.15 or later
1. GLIBC version 2.15 or later

The following installation instructions are tested on:

1. Fedora Linux 22 and 23
1. Debian Linux 8
1. Ubuntu Linux 14.04 LTS

### Download Visual Studio Code ###

Visit [this page][1] to grab the latest version and save it to ~/Downloads/ folder on Linux desktop:

![Fig.01: Download Visual Studio Code For Linux](http://s0.cyberciti.org/uploads/faq/2015/11/download-visual-studio-code.jpg)

Fig.01: Download Visual Studio Code For Linux

Make a new folder (say $HOME/VSCode) and extract VSCode-linux-x64.zip inside that folder or in /usr/local/ folder. Unzip VSCode-linux64.zip to that folder.

Make a new folder (say $HOME/VSCode) and extract VSCode-linux-x64.zip inside that folder or in /usr/local/ folder. Unzip VSCode-linux64.zip to that folder.

### Alternate install method ###

You can use the wget command to download VScode as follows:

    $ wget 'https://az764295.vo.msecnd.net/public/0.10.1-release/VSCode-linux64.zip'

Sample outputs:

    --2015-11-18 13:55:23--  https://az764295.vo.msecnd.net/public/0.10.1-release/VSCode-linux64.zip
    Resolving az764295.vo.msecnd.net (az764295.vo.msecnd.net)... 93.184.215.200, 2606:2800:11f:179a:1972:2405:35b:459
    Connecting to az764295.vo.msecnd.net (az764295.vo.msecnd.net)|93.184.215.200|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 64638315 (62M) [application/octet-stream]
    Saving to: 'VSCode-linux64.zip'
     
    100%[======================================>] 64,638,315  84.9MB/s   in 0.7s
     
    2015-11-18 13:55:23 (84.9 MB/s) - 'VSCode-linux64.zip' saved [64638315/64638315]
 
### Install VScode using the command line ###

Cd to ~/Download/ location, enter:

    $ cd ~/Download/
    $ ls -l

Sample outputs:

![Fig.02: VSCode downloaded to my ~/Downloads/ folder](http://s0.cyberciti.org/uploads/faq/2015/11/list-vscode-linux.jpg)

Fig.02: VSCode downloaded to my ~/Downloads/ folder

Unzip VSCode-linux64.zip in /usr/local/ directory, enter:

    $ sudo unzip VSCode-linux64.zip -d /usr/local/

Cd into /usr/local/ to create the soft-link as follows using the ln command for the Code executable. This is useful to run VSCode from the terminal application:

    $ su -
    # cd /usr/local/
    # ls -l
    # cd bin/
    # ln -s ../VSCode-linux-x64/Code code
    # exit

Sample session:

![Fig.03 Create the sym-link with the absolute path to the Code executable](http://s0.cyberciti.org/uploads/faq/2015/11/verify-and-ln-vscode.jpg)

Fig.03 Create the sym-link with the absolute path to the Code executable

### How do I use VSCode on Linux? ###

Open the Terminal app and type the following command:

    $ /usr/local/bin/code

Sample outputs:

![Fig.04: VSCode in action on Linux](http://s0.cyberciti.org/uploads/faq/2015/11/vscode-welcome.jpg)

Fig.04: VSCode in action on Linux

And, there you have it, the VSCode installed and working correctly on the latest version of Debian, Ubuntu and Fedora Linux. I suggest that you read [getting started pages from Microsoft][2] to understand the core concepts that will make you more productive writing and navigating your code.

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/debian-ubuntu-fedora-linux-installing-visual-studio-code/

作者：Vivek Gite
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://code.visualstudio.com/Download
[2]:https://code.visualstudio.com/docs