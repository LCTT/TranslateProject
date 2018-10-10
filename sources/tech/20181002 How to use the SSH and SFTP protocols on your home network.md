How to use the SSH and SFTP protocols on your home network
======

Use the SSH and SFTP protocols to access other devices, efficiently and securely transfer files, and more.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openwires_fromRHT_520_0612LL.png?itok=PqZi55Ab)

Years ago, I decided to set up an extra computer (I always have extra computers) so that I could access it from work to transfer files I might need. To do this, the basic first step is to have your ISP assign a fixed IP address.

The not-so-basic but much more important next step is to set up your accessible system safely. In this particular case, I was planning to access it only from work, so I could restrict access to that IP address. Even so, you want to use all possible security features. What is amazing—and scary—is that as soon as you set this up, people from all over the world will immediately attempt to access your system. You can discover this by checking the logs. I presume there are bots constantly searching for open doors wherever they can find them.

Not long after I set up my computer, I decided my access was more a toy than a need, so I turned it off and gave myself one less thing to worry about. Nonetheless, there is another use for SSH and SFTP inside your home network, and it is more or less already set up for you.

One requirement, of course, is that the other computer in your home must be turned on, although it doesn’t matter whether someone is logged on or not. You also need to know its IP address. There are two ways to find this out. One is to get access to the router, which you can do through a browser. Typically, its address is something like **192.168.1.254**. With some searching, it should be easy enough to find out what is currently on and hooked up to the system by eth0 or WiFi. What can be challenging is recognizing the computer you’re interested in.

I find it easier to go to the computer in question, bring up a shell, and type:

```
ifconfig

```

This spits out a lot of information, but the bit you want is right after `inet` and might look something like **192.168.1.234**. After you find that, go back to the client computer you want to access this host, and on the command line, type:

```
ssh gregp@192.168.1.234

```

For this to work, **gregp** must be a valid user on that system. You will then be asked for his password, and if you enter it correctly, you will be connected to that other computer in a shell environment. I confess that I don’t use SSH in this way very often. I have used it at times so I can run `dnf` to upgrade some other computer than the one I’m sitting at. Usually, I use SFTP:

```
sftp gregp@192.168.1.234

```

because I have a greater need for an easy method of transferring files from one computer to another. It’s certainly more convenient and less time-consuming than using a USB stick or an external drive.

`get`, to receive files from the host; and `put`, to send files to the host. I usually migrate to the directory on my client where I either want to save files I will get from the host or send to the host before I connect. When you connect, you will be in the top-level directory—in this example, **home/gregp**. Once connected, you can then use `cd` just as you would in your client, except now you’re changing your working directory on the host. You may need to use `ls` to make sure you know where you are.

Once you’re connected, the two basic commands for SFTP are, to receive files from the host; and, to send files to the host. I usually migrate to the directory on my client where I either want to save files I will get from the host or send to the host before I connect. When you connect, you will be in the top-level directory—in this example,. Once connected, you can then usejust as you would in your client, except now you’re changing your working directory on the host. You may need to useto make sure you know where you are.

If you need to change the working directory on your client, use the command `lcd` (as in **local change directory** ). Similarly, use `lls` to show the working directory contents on your client system.

What if the host doesn’t have a directory with the name you would like? Use `mkdir` to make a new directory on it. Or you might copy a whole directory of files to the host with this:

```
put -r ThisDir/

```

which creates the directory and then copies all of its files and subdirectories to the host. These transfers are extremely fast, as fast as your hardware allows, and have none of the bottlenecks you might encounter on the internet. To see a list of commands you can use in an SFTP session, check:

```
man sftp

```

I have also been able to put SFTP to use on a Windows VM on my computer, yet another advantage of setting up a VM rather than a dual-boot system. This lets me move files to or from the Linux part of the system. So far I have only done this using a client in Windows.

You can also use SSH and SFTP to access any devices connected to your router by wire or WiFi. For a while, I used an app called [SSHDroid][1], which runs SSH in a passive mode. In other words, you use your computer to access the Android device that is the host. Recently I found another app, [Admin Hands][2], where the tablet or phone is the client and can be used for either SSH or SFTP operations. This app is great for backing up or sharing photos from your phone.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/ssh-sftp-home-network

作者：[Geg Pittman][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/greg-p
[1]: https://play.google.com/store/apps/details?id=berserker.android.apps.sshdroid
[2]: https://play.google.com/store/apps/details?id=com.arpaplus.adminhands&hl=en_US
