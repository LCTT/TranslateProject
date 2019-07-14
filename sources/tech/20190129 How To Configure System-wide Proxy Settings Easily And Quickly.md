[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Configure System-wide Proxy Settings Easily And Quickly)
[#]: via: (https://www.ostechnix.com/how-to-configure-system-wide-proxy-settings-easily-and-quickly/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

How To Configure System-wide Proxy Settings Easily And Quickly
======

![](https://www.ostechnix.com/wp-content/uploads/2019/01/ProxyMan-720x340.png)

Today, we will be discussing a simple, yet useful command line utility named **“ProxyMan”**. As the name says, it helps you to apply and manage proxy settings on our system easily and quickly. Using ProxyMan, we can set or unset proxy settings automatically at multiple points, without having to configure them manually one by one. It also allows you to save the settings for later use. In a nutshell, ProxyMan simplifies the task of configuring system-wide proxy settings with a single command. It is free, open source utility written in **Bash** and standard POSIX tools, no dependency required. ProxyMan can be helpful if you’re behind a proxy server and you want to apply the proxy settings system-wide in one go.

### Installing ProxyMan

Download the latest ProxyMan version from the [**releases page**][1]. It is available as zip and tar file. I am going to download zip file.

```
$ wget https://github.com/himanshub16/ProxyMan/archive/v3.1.1.zip
```

Extract the downloaded zip file:

```
$ unzip v3.1.1.zip
```

The above command will extract the contents in a folder named “ **ProxyMan-3.1.1** ” in your current working directory. Cd to that folder and install ProxyMan as shown below:

```
$ cd ProxyMan-3.1.1/

$ ./install
```

If you see **“Installed successfully”** message as output, congratulations! ProxyMan has been installed.

Let us go ahead and see how to configure proxy settings.

### Configure System-wide Proxy Settings

ProxyMan usage is pretty simple and straight forward. Like I already said, It allows us to set/unset proxy settings, list current proxy settings, list available configs, save settings in a profile and load profile later. Proxyman currently manages proxy settings for **GNOME gsettings** , **bash** , **apt** , **dnf** , **git** , **npm** and **Dropbox**.

**Set proxy settings**

To set proxy settings system-wide, simply run:

```
$ proxyman set
```

You will asked to answer a series of simple questions such as,

  1. HTTP Proxy host IP address,
  2. HTTP port,
  3. Use username/password authentication,
  4. Use same settings for HTTPS and FTP,
  5. Save profile for later use,
  6. Finally, choose the list of targets to apply the proxy settings. You can choose all at once or separate multiple choices with space.



Sample output for the above command:

```
Enter details to set proxy
HTTP Proxy Host 192.168.225.22
HTTP Proxy Port 8080
Use auth - userid/password (y/n)? n
Use same for HTTPS and FTP (y/n)? y
No Proxy (default localhost,127.0.0.1,192.168.1.1,::1,*.local)
Save profile for later use (y/n)? y
Enter profile name : proxy1
Saved to /home/sk/.config/proxyman/proxy1.

Select targets to modify
| 1 | All of them ... Don't bother me
| 2 | Terminal / bash / zsh (current user)
| 3 | /etc/environment
| 4 | apt/dnf (Package manager)
| 5 | Desktop settings (GNOME/Ubuntu)
| 6 | npm & yarn
| 7 | Dropbox
| 8 | Git
| 9 | Docker

Separate multiple choices with space
? 1
Setting proxy...
To activate in current terminal window
run source ~/.bashrc
[sudo] password for sk:
Done
```

**List proxy settings**

To view the current proxy settings, run:

```
$ proxyman list
```

Sample output:

```
Hmm... listing it all

Shell proxy settings : /home/sk/.bashrc
export http_proxy="http://192.168.225.22:8080/"
export ftp_proxy="ftp://192.168.225.22:8080/"
export rsync_proxy="rsync://192.168.225.22:8080/"
export no_proxy="localhost,127.0.0.1,192.168.1.1,::1,*.local"
export HTTP_PROXY="http://192.168.225.22:8080/"
export FTP_PROXY="ftp://192.168.225.22:8080/"
export RSYNC_PROXY="rsync://192.168.225.22:8080/"
export NO_PROXY="localhost,127.0.0.1,192.168.1.1,::1,*.local"
export https_proxy="/"
export HTTPS_PROXY="/"

git proxy settings :
http http://192.168.225.22:8080/
https https://192.168.225.22:8080/

APT proxy settings :
3
Done
```

**Unset proxy settings**

To unset proxy settings, the command would be:

```
$ proxyman unset
```

You can unset proxy settings for all targets at once by entering number **1** or enter any given number to unset proxy settings for the respective target.

```
Select targets to modify
| 1 | All of them ... Don't bother me
| 2 | Terminal / bash / zsh (current user)
| 3 | /etc/environment
| 4 | apt/dnf (Package manager)
| 5 | Desktop settings (GNOME/Ubuntu)
| 6 | npm & yarn
| 7 | Dropbox
| 8 | Git
| 9 | Docker

Separate multiple choices with space
? 1
Unset all proxy settings
To activate in current terminal window
run source ~/.bashrc
Done
```

To apply the changes, simply run:

```
$ source ~/.bashrc
```

On ZSH, use this command instead:

```
$ source ~/.zshrc
```

To verify if the proxy settings have been removed, simply run “proxyman list” command:

```
$ proxyman list
Hmm... listing it all

Shell proxy settings : /home/sk/.bashrc
None

git proxy settings :
http
https

APT proxy settings :
None
Done
```

As you can see, there is no proxy settings for all targets.

**View list of configs (profiles)**

Remember we saved proxy settings as a profile in the “Set proxy settings” section? You can view the list of available profiles with command:

```
$ proxyman configs
```

Sample output:

```
Here are available configs!
proxy1
Done
```

As you can see, we have only one profile i.e **proxy1**.

**Load profiles**

The profiles will be available until you delete them permanently, so you can load a profile (E.g proxy1) at any time using command:

```
$ proxyman load proxy1
```

This command will list the proxy settings for proxy1 profile. You can apply these settings to all or multiple targets by entering the respective number with space-separated.

```
Loading profile : proxy1
HTTP > 192.168.225.22 8080
HTTPS > 192.168.225.22 8080
FTP > 192.168.225.22 8080
no_proxy > localhost,127.0.0.1,192.168.1.1,::1,*.local
Use auth > n
Use same > y
Config >
Targets >
Select targets to modify
| 1 | All of them ... Don't bother me
| 2 | Terminal / bash / zsh (current user)
| 3 | /etc/environment
| 4 | apt/dnf (Package manager)
| 5 | Desktop settings (GNOME/Ubuntu)
| 6 | npm & yarn
| 7 | Dropbox
| 8 | Git
| 9 | Docker

Separate multiple choices with space
? 1
Setting proxy...
To activate in current terminal window
run source ~/.bashrc
Done
```

Finally, activate the changes using command:

```
$ source ~/.bashrc
```

For ZSH:

```
$ source ~/.zshrc
```

**Deleting profiles**

To delete a profile, run:

```
$ proxyman delete proxy1
```

Output:

```
Deleting profile : proxy1
Done
```

To display help, run:

```
$ proxyman help
```


### Conclusion

Before I came to know about Proxyman, I used to apply proxy settings manually at multiple places, for example package manager, web browser etc. Not anymore! ProxyMan did this job automatically in couple seconds.

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-configure-system-wide-proxy-settings-easily-and-quickly/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://github.com/himanshub16/ProxyMan/releases/
