wcnnbdk1 Translating
Setup honeypot in Kali Linux
====

The Pentbox is a safety kit containing various tools for streamlining PenTest conducting a job easily. It is programmed in Ruby and oriented to GNU / Linux, with support for Windows, MacOS and every systems where Ruby is installed. In this small article we will explain how to set up a honeypot in Kali Linux. If you don’t know what is a honeypot, “a honeypot is a computer security mechanism set to detect, deflect, or, in some manner, counteract attempts at unauthorized use of information systems.”

### Download Pentbox:

Simply type in the following command in your terminal to download pentbox-1.8.

```
root@kali:~# wget http://downloads.sourceforge.net/project/pentbox18realised/pentbox-1.8.tar.gz
```

![](https://www.blackmoreops.com/wp-content/uploads/2016/05/Set-up-a-honeypot-in-Kali-Linux-blackMORE-Ops-1.jpg)

### Uncompress pentbox files

Decompressing the file with the following command:

```
root@kali:~# tar -zxvf pentbox-1.8.tar.gz
```

![](https://www.blackmoreops.com/wp-content/uploads/2016/05/Set-up-a-honeypot-in-Kali-Linux-blackMORE-Ops-2.jpg)

### Run pentbox ruby script

Change directory into pentbox folder

```
root@kali:~# cd pentbox-1.8/
```

![](https://www.blackmoreops.com/wp-content/uploads/2016/05/Set-up-a-honeypot-in-Kali-Linux-blackMORE-Ops-3.jpg)

Run pentbox using the following command

```
root@kali:~# ./pentbox.rb
```

![](https://www.blackmoreops.com/wp-content/uploads/2016/05/Set-up-a-honeypot-in-Kali-Linux-blackMORE-Ops-4.jpg)

### Setup a honeypot

Use option 2 (Network Tools) and then option 3 (Honeypot).

![](https://www.blackmoreops.com/wp-content/uploads/2016/05/Set-up-a-honeypot-in-Kali-Linux-blackMORE-Ops-5.jpg)

Finally for first test, choose option 1 (Fast Auto Configuration)

![](https://www.blackmoreops.com/wp-content/uploads/2016/05/Set-up-a-honeypot-in-Kali-Linux-blackMORE-Ops-6.jpg)

This opens up a honeypot in port 80. Simply open browser and browse to http://192.168.160.128 (where 192.168.160.128 is your IP Address. You should see an Access denied error.

![](https://www.blackmoreops.com/wp-content/uploads/2016/05/Set-up-a-honeypot-in-Kali-Linux-blackMORE-Ops-7.jpg)

and in the terminal you should see “HONEYPOT ACTIVATED ON PORT 80” followed by “INTRUSION ATTEMPT DETECTED”.

![](https://www.blackmoreops.com/wp-content/uploads/2016/05/Set-up-a-honeypot-in-Kali-Linux-blackMORE-Ops-8.jpg)

Now, if you do the same steps but this time select Option 2 (Manual Configuration), you should see more extra options

![](https://www.blackmoreops.com/wp-content/uploads/2016/05/Set-up-a-honeypot-in-Kali-Linux-blackMORE-Ops-9.jpg)

Do the same steps but select port 22 this time (SSH Port). Then do a port forwarding in your home router to forward port external port 22 to this machines’ port 22. Alternatively, set it up in a VPS in your cloud server.

You’d be amazed how many bots out there scanning port SSH continuously. You know what you do then? You try to hack them back for the lulz!

Here’s a video of setting up honeypot if video is your thing:

<https://youtu.be/NufOMiktplA>

--------------------------------------------------------------------------------

via: https://www.blackmoreops.com/2016/05/06/setup-honeypot-in-kali-linux/

作者：[blackmoreops.com][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: blackmoreops.com
