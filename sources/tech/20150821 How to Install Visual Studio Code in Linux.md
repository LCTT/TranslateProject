How to Install Visual Studio Code in Linux
================================================================================
Hi everyone, today we'll learn how to install Visual Studio Code in Linux Distributions. Visual Studio Code is a code-optimized editor based on Electron, a piece of software that is based on Chromium, which is used to deploy io.js applications for the desktop. It is a source code editor and text editor developed by Microsoft for all the operating system platforms including Linux. Visual Studio Code is free but not an open source software ie. its under proprietary software license terms. It is an awesome powerful and fast code editor for our day to day use.  Some of the cool features of visual studio code are navigation, intellisense support, syntax highlighting, bracket matching, auto indentation, and snippets, keyboard support with customizable bindings and support for dozens of languages like Python, C++, jade, PHP, XML, Batch, F#, DockerFile, Coffee Script, Java, HandleBars, R, Objective-C, PowerShell, Luna, Visual Basic, .Net, Asp.Net, C#, JSON, Node.js, Javascript, HTML, CSS, Less, Sass and Markdown. Visual Studio Code integrates with package managers and repositories, and builds and other common tasks to make everyday workflows faster. The most popular feature in Visual Studio Code is its debugging feature which includes a streamlined support for Node.js debugging in the preview.

Note: Please note that, Visual Studio Code is only available for 64-bit versions of Linux Distributions.

Here, are some easy to follow steps on how to install Visual Sudio Code in all Linux Distribution.

### 1. Downloading Visual Studio Code Package ###

First of all, we'll gonna download the Visual Studio Code Package for 64-bit Linux Operating System from the Microsoft server using the given url [http://go.microsoft.com/fwlink/?LinkID=534108][1] . Here, we'll use wget to download it and keep it under /tmp/VSCODE directory as shown below.

    # mkdir /tmp/vscode; cd /tmp/vscode/
    # wget https://az764295.vo.msecnd.net/public/0.3.0/VSCode-linux-x64.zip

    --2015-06-24 06:02:54-- https://az764295.vo.msecnd.net/public/0.3.0/VSCode-linux-x64.zip
    Resolving az764295.vo.msecnd.net (az764295.vo.msecnd.net)... 93.184.215.200, 2606:2800:11f:179a:1972:2405:35b:459
    Connecting to az764295.vo.msecnd.net (az764295.vo.msecnd.net)|93.184.215.200|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 64992671 (62M) [application/octet-stream]
    Saving to: ‘VSCode-linux-x64.zip’
    100%[================================================>] 64,992,671 14.9MB/s in 4.1s
    2015-06-24 06:02:58 (15.0 MB/s) - ‘VSCode-linux-x64.zip’ saved [64992671/64992671]

### 2. Extracting the Package ###

Now, after we have successfully downloaded the zipped package of Visual Studio Code, we'll gonna extract it using the unzip command to /opt/directory. To do so, we'll need to run the following command in a terminal or a console.

    # unzip /tmp/vscode/VSCode-linux-x64.zip -d /opt/

Note: If we don't have unzip already installed, we'll need to install it via our Package Manager. If you're running Ubuntu, apt-get whereas if you're running Fedora, CentOS, dnf or yum can be used to install it.

### 3. Running Visual Studio Code ###

After we have extracted the package, we can directly launch the Visual Studio Code by executing a file named Code.

    # sudo chmod +x /opt/VSCode-linux-x64/Code
    # sudo /opt/VSCode-linux-x64/Code

If we want to launch Code and want to be available globally via terminal in any place, we'll need to create the link of /opt/vscode/Code as/usr/local/bin/code .

    # ln -s /opt/VSCode-linux-x64/Code /usr/local/bin/code

Now, we can launch Visual Studio Code by running the following command in a terminal.

    # code .

### 4. Creating a Desktop Launcher ###

Next, after we have successfully extracted the Visual Studio Code package, we'll  gonna create a desktop launcher so that it will be easily available in the launchers, menus, desktop, according to the desktop environment so that anyone can launch it from them. So, first we'll gonna copy the icon file to /usr/share/icons/ directory.

    # cp /opt/VSCode-linux-x64/resources/app/vso.png /usr/share/icons/

Then, we'll gonna create the desktop launcher having the extension as .desktop. Here, we'll create a file named visualstudiocode.desktop under /tmp/VSCODE/ folder using our favorite text editor.

    # vi /tmp/vscode/visualstudiocode.desktop

Then, we'll gonna paste the following lines into that file.

    [Desktop Entry]
    Name=Visual Studio Code
    Comment=Multi-platform code editor for Linux
    Exec=/opt/VSCode-linux-x64/Code
    Icon=/usr/share/icons/vso.png
    Type=Application
    StartupNotify=true
    Categories=TextEditor;Development;Utility;
    MimeType=text/plain;

After we're done creating the desktop file, we'll wanna copy that desktop file to /usr/share/applications/ directory so that it will be available in launchers and menus for use with single click.

    # cp /tmp/vscode/visualstudiocode.desktop /usr/share/applications/

Once its done, we can launch it by opening it from the Launcher or Menu.

![Visual Studio Code](http://blog.linoxide.com/wp-content/uploads/2015/06/visual-studio-code.png)

### Installing Visual Studio Code in Ubuntu ###

We can use Ubuntu Make 0.7 in order to install Visual Studio Code in Ubuntu 14.04/14.10/15.04 distribution of linux. This method is the most easiest way to setup Code in ubuntu as we just need to execute few commands for it. First of all, we'll need to install Ubuntu Make 0.7 in our ubuntu distribution of linux. To install it, we'll need to add PPA for it. This can be done by running the command below.

    # add-apt-repository ppa:ubuntu-desktop/ubuntu-make

    This ppa proposes package backport of Ubuntu make for supported releases.
    More info: https://launchpad.net/~ubuntu-desktop/+archive/ubuntu/ubuntu-make
    Press [ENTER] to continue or ctrl-c to cancel adding it
    gpg: keyring `/tmp/tmpv0vf24us/secring.gpg' created
    gpg: keyring `/tmp/tmpv0vf24us/pubring.gpg' created
    gpg: requesting key A1231595 from hkp server keyserver.ubuntu.com
    gpg: /tmp/tmpv0vf24us/trustdb.gpg: trustdb created
    gpg: key A1231595: public key "Launchpad PPA for Ubuntu Desktop" imported
    gpg: no ultimately trusted keys found
    gpg: Total number processed: 1
    gpg: imported: 1 (RSA: 1)
    OK

Then, we'll gonna update the local repository index and install ubuntu-make.

    # apt-get update
    # apt-get install ubuntu-make

After Ubuntu Make is installed in our ubuntu operating system, we'll gonna install Code by running the following command in a terminal.

    # umake web visual-studio-code

![Umake Web Code](http://blog.linoxide.com/wp-content/uploads/2015/06/umake-web-code.png)

After running the above command, we'll be asked to enter the path where we want to install it. Then, it will ask for permission to install Visual Studio Code in our ubuntu system. Then, we'll press "a". Once we do that, it will download and install it in our ubuntu machine. Finally, we can launch it by opening it from the Launcher or Menu.

### Conclusion ###

We have successfully installed Visual Studio Code in Linux Distribution. Installing Visual Studio Code in every linux distribution is the same as shown in the above steps where we can also use umake to install it in ubuntu distributions. Umake is a popular tool for the development tools, IDEs, Languages. We can easily install Android Studios, Eclipse and many other popular IDEs with umake. Visual Studio Code is based on a project in Github called [Electron][2] which is a part of [Atom.io][3] Editor. It has a bunch of new cool and improved features that Atom.io Editor doesn't have. Visual Studio Code is currently only available in 64-bit platform of linux operating system. So, If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you ! Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-visual-studio-code-linux/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://go.microsoft.com/fwlink/?LinkID=534108
[2]:https://github.com/atom/electron
[3]:https://github.com/atom/atom