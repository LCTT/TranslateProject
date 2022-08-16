[#]: subject: "Check Disk Space Using Agedu In Linux"
[#]: via: "https://ostechnix.com/agedu-find-out-wasted-disk-space-in-linux/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Check Disk Space Using Agedu In Linux
======
Find Wasted Disk Space With Agedu

Running out of disk space? It is time to find out which directories and files are occupying the most disk space. Fortunately, checking Linux disk space is made easier with **Agedu** utility. This guide explains **what is Agedu**, how to install Agedu, and how to **check disk space** in Linux and **find wasted disk space using Agedu**.

### What Is Agedu?

**Agedu** is a command line utility that tracks down the wasted disk space in your Linux system. Agedu works just like as [du command][1]. It scans your hard disk and displays the disk usage result in the Terminal window.

Agedu has a built-in web server, so we can display the result as a neatly organized HTML report in different colors in our web browser.

It distinguishes the data in different colors. The red color represents the data that has been accessed a long time ago, Green represents the recently accessed data, and the spectrum through orange and yellow represents points in between.

By analyzing the colored output, we can immediately get a grasp of which directories and files have been used frequently and which data have been stagnated.

Once we find out the stagnated data, we can simply delete them if they are no longer needed or move them safely to an archive medium to free up some disk space.

Agedu has both CLI and web-based interface. You can view the disk usage report either from the Terminal window or from a web browser.

Agedu is a cross-platform utility. It works on Linux, Unix and Windows operating systems. It is an open source program and is released under MIT license.

Let us go ahead and see how to use agedu to find wasted disk space in Linux with practical examples.

### Install Agedu in Linux

Agedu is packaged for popular Linux distributions and is available in the default repositories of some Linux versions.

**Install Agedu in Arch Linux:**

Agedu is available in AUR, so you can install it on Arch Linux, EndeavourOS and Manjaro Linux an **AUR** helper programs, such as [Paru][2] or [Yay][3].

```
$ paru -S agedu
```

Or,

```
$ yay -S agedu
```

**Install Agedu in Debian, Ubuntu, Linux Mint, Pop OS:**

Agedu is available in the default repositories of Debian-based systems like Ubuntu, Linux Mint, and Pop OS. To install Agedu in Debian and Ubuntu, run:

```
$ sudo apt install agedu
```

**Install Agedu in Fedora, RHEL and its clones:**

On RPM based distributions like Fedora, RHEL, CentOS, AlmaLinux, Rocky Linux, add **[EPEL]** repository using command:

```
$ sudo dnf install epel-release
```

And then, install agedu as shown below.

```
$ sudo dnf install agedu
```

On older RPM-based systems, replace `dnf` with `yum` in the above commands.

### Check Disk Space With Agedu In Linux

The usage of agedu utility is trivial. The syntax of agedu is:

```
agedu [ options ] action [action...]
```

Let us see some examples.

Open the Terminal and run the following command to scan $HOME directory.

```
$ agedu -s /home/ostechnix/
```

**Sample output:**

```
Built pathname index, 6731 entries, 684647 bytes of index                      
Faking directory atimes
Building index
Final index file size = 1475496 bytes
```

![Scan A Directory With Agedu In Linux][4]

This command will create data index file called "`agedu.dat` " in the current working directory.

#### View Linux Disk Space Usage Reports With Agedu

To query the disk space report from the index file which we created in the previous step, run:

```
$ agedu -t /home/ostechnix/
```

**Sample output:**

```
30288       /home/ostechnix/.cache
6804        /home/ostechnix/.config
3875876     /home/ostechnix/.docker
40          /home/ostechnix/.gnupg
864         /home/ostechnix/.local
12          /home/ostechnix/.password-store
76          /home/ostechnix/.pki
512         /home/ostechnix/Downloads
604         /home/ostechnix/descent
5844        /home/ostechnix/dotfile
39076       /home/ostechnix/grub2-themes
335188      /home/ostechnix/snap
4684516     /home/ostechnix
```

Let us narrow down the report more specifically. Say for example, to list the files which are not viewed or accessed for last 2 days and more, run:

```
$ agedu -t /home/ostechnix/ -a 2d
```

**Sample output:**

```
15216       /home/ostechnix/.cache
5740        /home/ostechnix/.config
51052       /home/ostechnix/.docker
40          /home/ostechnix/.gnupg
328         /home/ostechnix/.local
12          /home/ostechnix/.password-store
512         /home/ostechnix/Downloads
604         /home/ostechnix/descent
5844        /home/ostechnix/dotfile
39076       /home/ostechnix/grub2-themes
335028      /home/ostechnix/snap
842756      /home/ostechnix
```

Similarly, just replace letter **"d"** with **"w"**for**weeks, "m"**for**months, "y"**for**years**.

For instance, you can view the files which are not accessed for the past two weeks using this command:

```
$ agedu -t /home/ostechnix/ -a 2w
```

#### Get Disk Space Reports Of Particular File Types

Agedu offers many useful options to track down the disk usage. One among them is view reports of a particular file type.

For example, let us generate the report of txt files using command:

```
$ agedu -s . --exclude '*' --include '*.txt'
```

**Sample output:**

```
Built pathname index, 714 entries, 59257 bytes of index                        
Faking directory atimes
Building index
Final index file size = 189056 bytes
```

The above command will scan the disk usage taken only by the .txt files and excludes all other files in the current directory.

Likewise, to scan a particular path, just specify it as shown below.

```
$ sudo agedu -s /home/ostechnix/Downloads --exclude '*' --include '*.txt'
```

To view the report, run:

```
$ sudo agedu -t /home/ostechnix/Downloads
```

#### View Disk Space Usage Reports In Web Browser

To generate HTML report and view it on the web browser, run:

```
$ agedu -w --auth none
```

You can use just **"sudo agedu -w"**, however **"--auth none"** option will eliminate the 403 forbidden error.

**Sample output:**

```
URL: http://localhost:33239/
```

The HTML report of disk usage has been generated. Let us take a look at it. Open up your web browser and point it to **http://localhost:33239** or **http://IP-Address:33239**. Please note that different port number will be generated each time you run this command.

![View Disk Space Report Using Agedu In Web Browser][5]

Click on any directory to view its sub directories disk usage.

![View Disk Space Report Of Sub-directories Using Agedu In Web Browser][6]

As you see above, the most used disk space is showed on the top followed by subsequent smaller results. To exit Agedu, go back to the Terminal window where the Agedu is running and press **CTRL+D**.

Once you find out data which are no longer used for a long time, you can just delete them or move them to any external medium.

#### Configure Password Authentication For Agedu Web Interface

Agedu web interface doesn't has authentication by default. However, It has an option to allow us to enable password protection to view the reports in web browser.

Enter the following command to generate a password to access agedu's web interface.

```
$ agedu -w --address localhost:46484 --auth basic
```

This command will automatically create a username with password as shown in the output below. Please note down the username and password.

```
Username: agedu
Password: 29tj42tdtgrgpa3y
URL: http://localhost:46484/
```

Now, open your web browser and point it to **http://locahost:46484**. This time it will ask you to enter the username and its password.

![Configure Password Authentication For Agedu Web Interface][7]

Once you entered the valid username and its password, you can access the agedu web interface.

#### Define Custom Username And Password

I don't like the default username and password. I want to define my own. Can I be able to do that? Of course you can.

To set a custom username with password, run:

```
$ agedu -w --address locahost:46484 --auth basic --auth-fd 0
```

Next, enter your custom user and its password as shown below.

```
ostechnix:password
```

Here **ostechnix** is my username and its password is **password**. It's just an example. I recommend you to use a strong password.

And then, press `CTRL+D` to exit and return back to Terminal.

From now, you can access the agedu's web interface using your custom username and password.

#### Remove Index Files

After deleting the unused files/directories, remove the index file generated by agedu:

```
$ agedu -R
```

You can also combine `-w` and `-R` options to view the disk space report and delete the index file after viewing the report like below.

```
$ agedu -s /home/ostechnix -w -R
```

The above command scans the HOME directory, builds its index, serves disk report via web browser, and cleans it up once you close the browser window.

#### Set Custom Port For Agedu

As you see before, agedu serves the result via different random ports each time. You can set a particular port of your liking if you want to.

To set a port for agedu, run:

```
$ agedu -w --address localhost:1234 --auth none
```

Here, 1234 is the custom port. Replace it with your own.

**Sample output:**

```
URL: http://localhost:1234/
```

Or just specify the actual IP address.

```
$ sudo agedu -w --address 192.168.1.40:1234
```

Now, you can view the report by visiting the URL - **http://localhost:1234** or **http://192.168.1.40:1234** from your browser.

To exit Agedu, go the terminal where Agedu is running and press **CTRL+D**.

For more details, refer Agedu manual page.

```
$ man agedu
```

### Conclusion

Checking Linux disk space once in a while will help you to clean up unnecessary junk in your hard drive. With the help of Agedu, we can easily check disk space in Linux and track down the wasted disk space and finally remove them if they no longer needed.

**Resource:**

* [Agedu home page][8]

--------------------------------------------------------------------------------

via: https://ostechnix.com/agedu-find-out-wasted-disk-space-in-linux/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/find-size-directory-linux/
[2]: https://ostechnix.com/how-to-install-paru-aur-helper-in-arch-linux/
[3]: https://ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[4]: https://ostechnix.com/wp-content/uploads/2022/08/Find-Wasted-Disk-Space-With-Agedu-In-Linux.png
[5]: https://ostechnix.com/wp-content/uploads/2022/08/View-Disk-Space-Report-Using-Agedu-In-Web-Browser.png
[6]: https://ostechnix.com/wp-content/uploads/2022/08/View-Disk-Space-Report-Of-Sub-directories-Using-Agedu-In-Web-Browser.png
[7]: https://ostechnix.com/wp-content/uploads/2022/08/Configure-Password-Authentication-For-Agedu-Web-Interface.png
[8]: http://www.chiark.greenend.org.uk/~sgtatham/agedu/
