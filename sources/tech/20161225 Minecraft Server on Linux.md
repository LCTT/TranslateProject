Minecraft Server on Linux
=============================

![Title.jpg](https://www.linuxforum.com/attachments/title-jpg.89/) 

Minecraft is a major game being played on many different consoles and computer systems. As of June 2016 there have been over 106 million units sold on all platforms. Because of the popularity, you may want to host a Minecraft party at home. To do this you install a Minecraft Server to allow all users to connect locally and play in the same world together.

**System Requirements**

To start, you need a Linux system with a fair amount of Random Access Memory (RAM). The more players you will host on the server the more RAM you will need. Hard Drive space is not a large requirement, just enough to install Java and the Minecraft Server Java file. The Minecraft Server should have a decent network connection whether wired or WiFi.

Let's look at some minimum requirements for the Minecraft Server:

**Processor: **Duo Core or better
**RAM:** 2 GB (20-40 players), 3 GB (30-60 players), 8 GB (60+ players)
**OS:** An OS with no Graphical User Interface (GUI) to allow more resources free

**NOTE:** The requirements are for the Minecraft Server program and not for the whole OS! If more resources can be allocated to the Minecraft Server it will operate better.

**Installing JAVA**

Once you have a system with Linux running on it you will need to install the latest version of Java.

To verify your Java version enter the following command in a terminal: “java -version”. The result should be:

```
java version "1.8.0_101"

Java(TM) SE Runtime Environment (build 1.8.0_101-b13)

Java HotSpot(TM) Client VM (build 25.101-b13, mixed mode)
```

If your current Java version is not 1.8 or higher then install Java version 8 by performing the following from a terminal on a Ubuntu system:

1.  _sudo add-apt-repository ppa:webupd8team/java_
2.  _sudo apt-get update_
3.  _sudo apt-get install oracle-java8-installer_

**NOTE:** If the 'add-apt-repository' command is not found, run 'sudo apt-get install software-properties-common'. You could also change the third command to be 'oracle-java9-installer' for the newest version of JAVA.

For a Redhat system, such as CentOS, use the following command:

1.  _sudo yum install java-1.8.0-openjdk_

After the installation verify the version by entering the version command, 'java -version', and verify the output. Once you have the appropriate version of Java you may proceed with the rest of the installation.

**Minecraft Server Version Download**

The next thing is to check the version of Minecraft which the users will be running. See Figure 1 taken from a system running Minecraft and notice the version number in the bottom left corner.

 ![Figure 01.jpg](https://www.linuxforum.com/attachments/figure-01-jpg.85/) 

**FIGURE 1**

Keep in mind the version number of the Minecraft client software. Each client should be the same version to make this work.

The next thing to do is download the Minecraft Server for the version you will need for the clients. To download the version you need you will need to know its location. The command to get the needed file is:

_sudo wget _[_https://s3.amazonaws.com/Minecraft.Download/versions/[version]/minecraft_server.[version].jar_][1]

As seen in Figure 1, the version number is 1.10.2\. The command would then be:

_sudo wget _[_https://s3.amazonaws.com/Minecraft.Download/versions/1.10.2/minecraft_server.1.10.2.jar_][2]

When you download the file it will be saved to the current directory in which you are currently in when you run the command. To determine the current location use the command 'pwd'.

Once you have the file and know the folder where it has been saved you are ready to continue.

**Server Information**

Before starting the Minecraft Server you must know the amount of available RAM on the current system to be able to use what is needed. When starting the Minecraft Server you will specify the starting amount of RAM and the maximum amount of RAM to use as more players join. Again, it is important to have enough RAM. If needed, use a minimal install of an Operating System (OS) such as a Minimal install of Ubuntu to have more RAM available.

Once you have the Minecraft Server file you need it is time to determine the amount of RAM which can be allocated to Minecraft. To determine the available RAM open a terminal and type the following command – a sample output is shown in Figure 2:

_free -h_

 ![Figure 02.jpg](https://www.linuxforum.com/attachments/figure-02-jpg.86/) 

**FIGURE 2**

On this low end system as shown in Figure 2, you can see there is only 684 MB of free RAM. This is not an adequate system to use for a Minecraft Server. On another system I have 2.8 GB available to use for the Minecraft Server.

Before we start the server we need to find the IP Address of the server. To do this, run the command 'ifconfig'. As shown in Figure 3, there should be a listing for a network connection that shows an Internet Address, or 'inet addr', which is '192.168.0.2'. On my server system it is listed with the address of '192.168.0.14', which is the address that will be used from the client systems.

 ![Figure 03.jpg](https://www.linuxforum.com/attachments/figure-03-jpg.87/) 

**FIGURE 3**

**Start Minecraft Server**

The next step is to actually start the Minecraft Server. There are a few items to cover before we actually start it. When starting the Minecraft Server you specify how much memory to initialize for Minecraft. You also will designate the maximum amount to use as well.

If my system has 3.7 GB free and I know I will have less than 40 players, then I only need 2 GB set aside. Of course, I may add a little to allow for any growth of users. I also want to leave some memory for the system to use if needed. I will set my minimum at 2 GB and my maximum at 3 GB. Since my maximum is 3 GB I will leave the system 700 MB of RAM if needed, but this is only if the Minecraft Server uses more than the initial 2 GB.

The command line to start the server is:

_sudo java -Xms# -Xmx# -jar [path]/minecraft_server.[version].jar nogui_

Now for a breakdown of the command structure:

-Xms# - the amount of the initial startup RAM (-Xms2048m)
-Xmx# - the amount of the maximum RAM (-Xmx3096m)
[path] – the path to the Minecraft Server File (/home/tux/MCS/)
[version] – the version of the Minecraft Server downloaded (1.10.2)
nogui – used to show that the system is text based only to help reduce RAM use. If you install the GUI, then remove the _nogui_ parameter

An example of the full command for a system using an initial 2 GB of RAM with a maximum of 3 GB with a path to '/home/tux/MCS/' and a version of '1.10.2' would be:

_sudo java -Xms2048m -Xmx3096m -jar /home/tux/MCS/minecraft_server.1.10.2.jar nogui_

**NOTE:** The RAM sizes are in values of megabytes. Multiply the value by 1024\. For example, for 2 GB of RAM multiply 2x1024 for a value of 2048\. Do not forget the lowercase 'm' to specify megabytes. You can easily specify '2g' and '3g' for 2 GB and 3 GB.

After you run the server the first time there will be an error. It states that the EULA must be agreed to before starting the server.

To agree to the EULA you need to edit the 'eula.txt' file in the same folder as the Minecraft Server JAR file.

Open the 'eula.txt' file in a text editor such as nano. Make sure you do this with root privileges. Change the line 'eula=false' to 'eula=true' and save the file.

Now, enter the command again to start the server. A screen full of information should pass by and then a section of lines which states it is preparing the spawn area. The lines will count up to 100% as it creates the initial world. Any error messages about the system time changing are normal so ignore them.

At this point you can open the client program and see a screen similar to Figure 1 above. Click on the button 'Multiplayer'. At the next screen, Figure 4, choose 'Direct Connect'. You will then be prompted for the server address, so type in the IP Address of the Minecraft Server. You should now be able to connect to the game.

 ![Figure 04.jpg](https://www.linuxforum.com/attachments/figure-04-jpg.88/) 

**FIGURE 4**

**Troubleshooting certain connections**

If some clients cannot connect to the server, then you need to exit the JAVA program by pressing CTRL+Z. Open the file 'server.properties' with an editor such as 'nano'. Remember to be root. Edit the line 'online-mode'. It should be set to 'true'. Change this to 'false' and save the file. Reboot the system and start the Minecraft Server. Have the clients reconnect to the server and everything should be working.

Happy mining!

--------------------------------------------------------------------------------

via: https://www.linuxforum.com/threads/minecraft-server-on-linux.3202/

作者：[Jarret][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxforum.com/members/jarret.268/
[1]:https://s3.amazonaws.com/Minecraft.Download/versions/%5Bversion%5D/minecraft_server.%5Bversion%5D.jar
[2]:https://s3.amazonaws.com/Minecraft.Download/versions/%5Bversion%5D/minecraft_server.%5Bversion%5D.jar
