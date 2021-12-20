[#]: subject: "Open source file sharing with this Linux tool"
[#]: via: "https://opensource.com/article/21/12/file-sharing-linux-samba"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Open source file sharing with this Linux tool
======
Samba is a flexible file sharing tool that unites all the different
platforms you might have running in your organization.
![Files in a folder][1]

In the early days of my Linux experience, I was the technology director of a small PreK-12 school district in the state of New York. Our technology budget was always stretched to the limit. We were a Windows 2000 Active Directory Domain, but we had limited central server disk space and no teacher home directories. In addition, we experienced a dozen or so hard disk failures for staff computers.

I was looking for a way to preserve staff work at a minimal cost. That's when I discovered Samba. I used Linux up to that point for content filtering, having no idea that our Windows workstations could connect to a server and keep their files backed up.

The [Samba project][2] has been around since 1992. The project was 10 years old when I started experimenting with it and knew nothing about how to configure it. I bought a book and read about how to implement it, then I took one of the older computers from our computer closet, purchased a 300-gigabyte Seagate IDE drive, installed Linux, and configured Samba. I used a simple configuration, and it worked. After showing it to one of our IT assistants, we deployed the solution. The hard drive failure problem continued, but our staff no longer had to worry about losing all their hard work.

Samba is licensed with [GPL][3] and is widely available on most Linux distributions. Samba has excellent [documentation][4], and Fedora users can consult documentation about [Samba on Fedora][5].

### Install Samba on Linux

You can install Samba using your distribution's package manager.

On Fedora, CentOS, RHEL, Mageia, and similar:

`$ sudo dnf install samba`

On Debian, Linux Mint, and similar:

`$ sudo apt install samba`

### Create a shared folder with Samba

Creating a simple shared folder only takes five steps.

1\. Create a directory on your Linux server where you want users to be able to save shared files. This directory can be anywhere on the server: in `/home` or `/opt` or whatever works best for you. I use my home directory, and I call the shared directory `sambashare`.

`$ mkdir /home/don/sambashare`

On Fedora and other distributions running SELinux, you must give security clearance to this shared directory:


```


$ sudo semanage fcontext --add --type "samba_share_t" ~/sambashare
$ sudo restorecon -R ~/sambashare

```

2\. Edit the Samba configuration file with Nano or the text editor of your choice.

`$ sudo nano /etc/samba/smb.conf`

Add this to the bottom of the `smb.conf` file, replacing my example path of `/home/don/sambashare` with the location of your own shared directory:


```


[sambashare]
        comment = Samba on Linux       
        path = /home/don/sambashare
        read only = no
        browsable = yes

```

If you're using Nano, press **Ctrl-O** and then **Return** to save and **Ctrl-X** to exit.

3\. Start or restart the Samba service, depending on your distribution.

On Fedora and similar, services don't start without your explicit permission, so enable Samba to start now, and on boot:

`$ sudo systemctl enable –now smb.conf`

On Debian and similar, Samba starts after installation by default, so you must restart it now:

`$ sudo service smbd restart`

4\. Update your firewall rules to allow access to your Samba share. How you do this depends on what firewall your system uses.

If you're running firewalld:


```


$ sudo firewall-cmd --permanent --add-service=samba
$ sudo firewall-cmd --reload

```

If you're running UFW:

`$ sudo ufw allow samba`

5\. Now you need to set up a password to access your Samba share. The username (don, in my example) must belong to an account on your system.

`$ sudo smbpasswd -a don`

I place a simple `README` file in each Samba share so users understand that the directory is located on the server, that they must be on the VPN to access it from home, and so on.

### Accessing Samba from Windows and Mac

On a Windows computer, open the file manager (Windows Explorer) and edit the file path to `\ip-address-of-the-Linux-computer\sambashare`. You're prompted for the Samba share password, and then the files in the `sambashare` directory appear in your file manager window, just as if they existed locally on your desktop. You can begin storing your files on this new shared directory on your network.

On a macOS computer, go to the Finder menu and select Go. In the dialogue box that appears, type in `smb://ip-address/sambashare` and follow the prompts to enter your Samba password.

### Samba means sharing

Samba makes sharing files easy. You can use many other schemes within Samba to create shared locations, including common folders for groups of users, inboxes that accept incoming files only, and whatever else you might need. It's open source, flexible, and it unites all the different platforms you might have running in your organization.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/file-sharing-linux-samba

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_paper_folder.png?itok=eIJWac15 (Files in a folder)
[2]: https://www.samba.org/
[3]: https://www.samba.org/samba/docs/GPL.html
[4]: https://www.samba.org/samba/docs/
[5]: https://docs.fedoraproject.org/en-US/quick-docs/samba/
