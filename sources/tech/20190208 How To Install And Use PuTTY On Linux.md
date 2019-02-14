[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Install And Use PuTTY On Linux)
[#]: via: (https://www.ostechnix.com/how-to-install-and-use-putty-on-linux/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

How To Install And Use PuTTY On Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2019/02/putty-720x340.png)

**PuTTY** is a free and open source GUI client that supports wide range of protocols including SSH, Telnet, Rlogin and serial for Windows and Unix-like operating systems. Generally, Windows admins use PuTTY as a SSH and telnet client to access the remote Linux servers from their local Windows systems. However, PuTTY is not limited to Windows. It is also popular among Linux users as well. This guide explains how to install PuTTY on Linux and how to access and manage the remote Linux servers using PuTTY.

### Install PuTTY on Linux

PuTTY is available in the official repositories of most Linux distributions. For instance, you can install PuTTY on Arch Linux and its variants using the following command:

```
$ sudo pacman -S putty
```

On Debian, Ubuntu, Linux Mint:

```
$ sudo apt install putty
```

### How to use PuTTY to access remote Linux systems

Once PuTTY is installed, launch it from the menu or from your application launcher. Alternatively, you can launch it from the Terminal by running the following command:

```
$ putty
```

This is how PuTTY default interface looks like.

![](https://www.ostechnix.com/wp-content/uploads/2019/02/putty-default-interface.png)

As you can see, most of the options are self-explanatory. On the left pane of the PuTTY interface, you can do/edit/modify various configurations such as,

  1. PuTTY session logging,
  2. Options for controlling the terminal emulation, control and change effects of keys,
  3. Control terminal bell sounds,
  4. Enable/disable Terminal advanced features,
  5. Set the size of PuTTY window,
  6. Control the scrollback in PuTTY window (Default is 2000 lines),
  7. Change appearance of PuTTY window and cursor,
  8. Adjust windows border,
  9. Change fonts for texts in PuTTY window,
  10. Save login details,
  11. Set proxy details,
  12. Options to control various protocols such as SSH, Telnet, Rlogin, Serial etc.
  13. And more.



All options are categorized under a distinct name for ease of understanding.

### Access a remote Linux server using PuTTY

Click on the **Session** tab on the left pane. Enter the hostname (or IP address) of your remote system you want to connect to. Next choose the connection type, for example Telnet, Rlogin, SSH etc. The default port number will be automatically selected depending upon the connection type you choose. For example if you choose SSH, port number 22 will be selected. For Telnet, port number 23 will be selected and so on. If you have changed the default port number, don’t forget to mention it in the **Port** section. I am going to access my remote via SSH, hence I choose SSH connection type. After entering the Hostname or IP address of the system, click **Open**.

![](http://www.ostechnix.com/wp-content/uploads/2019/02/putty-1.png)

If this is the first time you have connected to this remote system, PuTTY will display a security alert dialog box that asks whether you trust the host you are connecting to. Click **Accept** to add the remote system’s host key to the PuTTY’s cache:

![][2]

Next enter your remote system’s user name and password. Congratulations! You’ve successfully connected to your remote system via SSH using PuTTY.

![](https://www.ostechnix.com/wp-content/uploads/2019/02/putty-3.png)

**Access remote systems configured with key-based authentication**

Some Linux administrators might have configured their remote servers with key-based authentication. For example, when accessing AMS instances from PuTTY, you need to specify the key file’s location. PuTTY supports public key authentication and uses its own key format ( **.ppk** files).

Enter the hostname or IP address in the Session section. Next, In the **Category** pane, expand **Connection** , expand **SSH** , and then choose **Auth**. Browse the location of the **.ppk** key file and click **Open**.

![][3]

Click Accept to add the host key if it is the first time you are connecting to the remote system. Finally, enter the remote system’s passphrase (if the key is protected with a passphrase while generating it) to connect.

**Save PuTTY sessions**

Sometimes, you want to connect to the remote system multiple times. If so, you can save the session and load it whenever you want without having to type the hostname or ip address, port number every time.

Enter the hostname (or IP address) and provide a session name and click **Save**. If you have key file, make sure you have already given the location before hitting the Save button.

![][4]

Now, choose session name under the **Saved sessions** tab and click **Load** and click **Open** to launch it.

**Transferring files to remote systems using the PuTTY Secure Copy Client (pscp)
**

Usually, the Linux users and admins use **‘scp’** command line tool to transfer files from local Linux system to the remote Linux servers. PuTTY does have a dedicated client named **PuTTY Secure Copy Clinet** ( **PSCP** in short) to do this job. If you’re using windows os in your local system, you may need this tool to transfer files from local system to remote systems. PSCP can be used in both Linux and Windows systems.

The following command will copy **file.txt** to my remote Ubuntu system from Arch Linux.

```
pscp -i test.ppk file.txt sk@192.168.225.22:/home/sk/
```

Here,

  * **-i test.ppk** : Key file to access remote system,
  * **file.txt** : file to be copied to remote system,
  * **sk@192.168.225.22** : username and ip address of remote system,
  * **/home/sk/** : Destination path.



To copy a directory. use **-r** (recursive) option like below:

```
 pscp -i test.ppk -r dir/ sk@192.168.225.22:/home/sk/
```

To transfer files from Windows to remote Linux server using pscp, run the following command from command prompt:

```
pscp -i test.ppk c:\documents\file.txt.txt sk@192.168.225.22:/home/sk/
```

You know now what is PuTTY, how to install and use it to access remote systems. Also, you have learned how to transfer files to the remote systems from the local system using pscp program.

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-install-and-use-putty-on-linux/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: http://www.ostechnix.com/wp-content/uploads/2019/02/putty-2.png
[3]: http://www.ostechnix.com/wp-content/uploads/2019/02/putty-4.png
[4]: http://www.ostechnix.com/wp-content/uploads/2019/02/putty-5.png
