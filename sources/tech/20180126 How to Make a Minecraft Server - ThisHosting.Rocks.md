translating by heart4lor

How to Make a Minecraft Server – ThisHosting.Rocks
======
We’ll show you how to make a Minecraft server with beginner-friendly step-by-step instructions. It will be a persistent multiplayer server that you can play on with your friends from all around the world. You don’t have to be in a LAN.

### How to Make a Minecraft Server – Quick Guide

This is our “Table of contents” if you’re in a hurry and want to go straight to the point. We recommend reading everything though.

*   [Learn stuff][1] (optional)

*   [Learn more stuff][2] (optional)

*   [Requirements][3] (required)

*   [Install and start the Minecraft server][4] (required)

*   [Run the server even after you log out of your VPS][5] (optional)

*   [Make the server automatically start at boot][6] (optional)

*   [Configure your Minecraft server][7] (required)

*   [FAQs][8] (optional)

Before going into the actual instructions, a few things you should know:

#### Reasons why you would NOT use a specialized Minecraft server hosting provider

Since you’re here, you’re obviously interested in hosting your own Minecraft server. There are more reasons why you would not use a specialized Minecraft hosting provider, but here are a few:

*   They’re slow most of the time. This is because you actually share the resources with multiple users. It becomes overloaded at some point. Most of them oversell their servers too.

*   You don’t have full control over the Minecraft server or the actual server. You cannot customize anything you want to.

*   You’re limited. Those kinds of hosting plans are always limited in one way or another.

Of course, there are positives to using a Minecraft hosting provider. The best upside is that you don’t actually have to do all the stuff we’ll write about below. But where’s the fun in that? 
![🙂](https://s.w.org/images/core/emoji/2.3/svg/1f642.svg)

#### Why you should NOT use your personal computer to make a Minecraft server

We noticed lots of tutorials showing you how to host a server on your own computer. There are downsides to doing that, like:

*   Your home internet is not secured enough to handle DDoS attacks. Game servers are often prone to DDoS attacks, and your home network setup is most probably not secured enough to handle them. It’s most likely not powerful enough to handle a small attack.

*   You’ll need to handle port forwarding. If you’ve tried making a Minecraft server on your home network, you’ve surely stumbled upon port forwarding and had issues with it.

*   You’ll need to keep your computer on at all times. Your electricity bill will sky-rocket and you’ll add unnecessary load to your hardware. The hardware most servers use is enterprise-grade and designed to handle loads, with improved stability and longevity.

*   Your home internet is not fast enough. Home networks are not designed to handle multiplayer games. You’ll need a much larger internet plan to even consider making a small server. Luckily, data centers have multiple high-speed, enterprise-grade internet connections making sure they have (or strive to have) 100% uptime.

*   Your hardware is most likely not good enough. Again, servers use enterprise-grade hardware, latest and fastest CPUs, SSDs, and much more. Your personal computer most likely does not.

*   You probably use Windows/MacOS on your personal computer. Though this is debatable, we believe that Linux is much better for game hosting. Don’t worry, you don’t really need to know everything about Linux to make a Minecraft server (though it’s recommended). We’ll show you everything you need to know.

Our tip is not to use your personal computer, though technically you can. It’s not expensive to buy a cloud server. We’ll show you how to make a Minecraft server on cloud hosting below. It’s easy if you carefully follow the steps.

### Making a Minecraft Server – Requirements

There are a few requirements. You should have and know all of this before continuing to the tutorial:

*   You’ll need a [Linux cloud server][9]. We recommend [Vultr][10]. Their prices are cheap, services are high-quality, customer support is great, all server hardware is high-end. Check the [Minecraft server requirements][11] to find out what kind of server you should get (resources like RAM and Disk space). We recommend getting the $20 per month server. They support hourly pricing so if you only need the server temporary for playing with friends, you’ll pay less. Choose the Ubuntu 16.04 distro during signup. Choose the closest server location to where your players live during the signup process. Keep in mind that you’ll be responsible for your server. So you’ll have to secure it and manage it. If you don’t want to do that, you can get a [managed server][12], in which case the hosting provider will likely make a Minecraft server for you.

*   You’ll need an SSH client to connect to the Linux cloud server. [PuTTy][13] is often recommended for beginners, but we also recommend [MobaXTerm][14]. There are many other SSH clients to choose from, so pick your favorite.

*   You’ll need to setup your server (basic security setup at least). Google it and you’ll find many tutorials. You can use [Linode’s Security Guide][15] and follow the exact steps on your [Vultr][16] server.

*   We’ll handle the software requirements like Java below.

And finally, onto our actual tutorial:

### How to Make a Minecraft Server on Ubuntu (Linux)

These instructions are written for and tested on an Ubuntu 16.04 server from [Vultr][17]. Though they’ll also work on Ubuntu 14.04, [Ubuntu 18.04][18], and any other Ubuntu-based distro, and any other server provider.

We’re using the default Vanilla server from Minecraft. You can use alternatives like CraftBukkit or Spigot that allow more customizations and plugins. Though if you use too many plugins you’ll essentially ruin the server. There are pros and cons to each one. Nevertheless, the instructions below are for the default Vanilla server to keep things simple and beginner-friendly. We may publish a tutorial for CraftBukkit soon if there’s an interest.

#### 1. Login to your server

We’ll use the root user. If you use a limited-user, you’ll have to execute most commands with ‘sudo’. You’ll get a warning if you’re doing something you don’t have enough permissions for.

You can login to your server via your SSH client. Use your server IP and your port (most likely 22).

After you log in, make sure you [secure your server][19].

#### 2. Update Ubuntu

You should always first update your Ubuntu before you do anything else. You can update it with the following commands:

```
apt-get update && apt-get upgrade
```

Hit “enter” and/or “y” when prompted.

#### 3. Install necessary tools

You’ll need a few packages and tools for various things in this tutorial like text editing, making your server persistent etc. Install them with the following command:

```
apt-get install nano wget screen bash default-jdk ufw
```

Some of them may already be installed.

#### 4. Download Minecraft Server

First, create a directory where you’ll store your Minecraft server and all other files:

```
mkdir /opt/minecraft
```

And navigate to the new directory:

```
cd /opt/minecraft
```

Now you can download the Minecraft Server file. Go to the [download page][20] and get the link there. Download the file with wget:

```
wget https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar
```

#### 5. Install the Minecraft server

Once you’ve downloaded the server .jar file, you need to run it once and it will generate some files, including an eula.txt license file. The first time you run it, it will return an error and exit. That’s supposed to happen. Run in with the following command:

```
java -Xms2048M -Xmx3472M -jar minecraft_server.1.12.2.jar nogui
```

“-Xms2048M” is the minimum RAM that your Minecraft server can use and “-Xmx3472M” is the maximum. [Adjust][21] this based on your server’s resources. If you got the 4GB RAM server from [Vultr][22] you can leave them as-is, if you don’t use the server for anything else other than Minecraft.

After that command ends and returns an error, a new eula.txt file will be generated. You need to accept the license in that file. You can do that by adding “eula=true” to the file with the following command:

```
sed -i.orig 's/eula=false/eula=true/g' eula.txt
```

You can now start the server again and access the Minecraft server console with that same java command from before:

```
java -Xms2048M -Xmx3472M -jar minecraft_server.1.12.2.jar nogui
```

Make sure you’re in the /opt/minecraft directory, or the directory where you installed your MC server.

You’re free to stop here if you’re just testing this and need it for the short-term. If you’re having trouble loggin into the server, you’ll need to [configure your firewall][23].

The first time you successfully start the server it will take a bit longer to generate

We’ll show you how to create a script so you can start the server with it.

#### 6. Start the Minecraft server with a script, make it persistent, and enable it at boot

To make things easier, we’ll create a bash script that will start the server automatically.

So first, create a bash script with nano:

```
nano /opt/minecraft/startminecraft.sh
```

A new (blank) file will open. Paste the following:

```
#!/bin/bash
cd /opt/minecraft/ && java -Xms2048M -Xmx3472M -jar minecraft_server.1.12.2.jar nogui
```

If you’re new to nano – you can save and close the file with “CTRL + X”, then “Y”, and hitting enter. This script navigates to your Minecraft server directory you created previously and runs the java command for starting the server. You need to make it executable with the following command:

```
chmod +x startminecraft.sh
```

Then, you can start the server anytime with the following command:

```
/opt/minecraft/startminecraft.sh
```

But, if/when you log out of the SSH session the server will turn off. To keep the server up without being logged in all the time, you can use a screen session. A screen session basically means that it will keep running until the actual server reboots or turns off.

Start a screen session with this command:

```
screen -S minecraft
```

Once you’re in the screen session (looks like you would start a new ssh session), you can use the bash script from earlier to start the server:

```
/opt/minecraft/startminecraft.sh
```

To get out of the screen session, you should press CTRL + A-D. Even after you get out of the screen session (detach), the server will keep running. You can safely log off your Ubuntu server now, and the Minecraft server you created will keep running.

But, if the Ubuntu server reboots or shuts off, the screen session won’t work anymore. So **to do everything we did before automatically at boot** , do the following: 

Open the /etc/rc.local file:

```
nano /etc/rc.local
```

and add the following line above the “exit 0” line:

```
screen -dm -S minecraft /opt/minecraft/startminecraft.sh
exit 0
```

Save and close the file.

To access the Minecraft server console, just run the following command to attach to the screen session:

```
screen -r minecraft
```

That’s it for now. Congrats and have fun! You can now connect to your Minecraft server or configure/modify it.

### Configure your Ubuntu Server

You’ll, of course, need to set up your Ubuntu server and secure it if you haven’t already done so. Follow the [guide we mentioned earlier][24] and google it for more info. The configurations you need to do for your Minecraft server on your Ubuntu server are:

#### Enable and configure the firewall

First, if it’s not already enabled, you should enable UFW that you previously installed:

```
ufw enable
```

You should allow the default Minecraft server port:

```
ufw allow 25565/tcp
```

You should allow and deny other rules depending on how you use your server. You should deny ports like 80 and 443 if you don’t use the server for hosting websites. Google a UFW/Firewall guide for Ubuntu and you’ll get recommendations. Be careful when setting up your firewall, you may lock yourself out of your server if you block the SSH port.

Since this is the default port, it often gets automatically scanned and attacked. You can prevent attacks by blocking access to anyone that’s not of your whitelist.

First, you need to enable the whitelist mode in your [server.properties][25] file. To do that, open the file:

```
nano /opt/minecraft/server.properties
```

And change “white-list” line to “true”:

```
white-list=true
```

Save and close the file.

Then restart your server (either by restarting your Ubuntu server or by running the start bash script again):

```
/opt/minecraft/startminecraft.sh
```

Access the Minecraft server console:

```
screen -r minecraft
```

And if you want someone to be able to join your server, you need to add them to the whitelist with the following command:

```
whitelist add PlayerUsername
```

To remove them from the whitelist, use:

```
whitelist remove PlayerUsername
```

Exit the screen session (server console) with CTRL + A-D. It’s worth noting that this will deny access to everyone but the whitelisted usernames.

 [![how to create a minecraft server](https://thishosting.rocks/wp-content/uploads/2018/01/create-a-minecraft-server.jpg)][26] 

### How to Make a Minecraft Server – FAQs

We’ll answer some frequently asked questions about Minecraft Servers and our guide.

#### How do I restart the Minecraft server?

If you followed every step from our tutorial, including enabling the server to start on boot, you can just reboot your Ubuntu server. If you didn’t set it up to start at boot, you can just run the start script again which will restart the Minecraft server:

```
/opt/minecraft/startminecraft.sh
```

#### How do I configure my Minecraft server?

You can configure your server using the [server.properties][27] file. Check the Minecraft Wiki for more info, though you can leave everything as-is and it will work perfectly fine.

If you want to change the game mode, difficulty and stuff like that, you can use the server console. Access the server console by running:

```
screen -r minecraft
```

And execute [commands][28] there. Commands like:

```
difficulty hard
```

```
gamemode survival @a
```

You may need to restart the server depending on what command you used. There are many more commands you can use, check the [wiki][29] for more.

#### How do I upgrade my Minecraft server?

If there’s a new release, you need to do this:

Navigate to the minecraft directory:

```
cd /opt/minecraft
```

Download the latest version, example 1.12.3 with wget:

```
wget https://s3.amazonaws.com/Minecraft.Download/versions/1.12.3/minecraft_server.1.12.3.jar
```

Next, run and build the new server:

```
java -Xms2048M -Xmx3472M -jar minecraft_server.1.12.3.jar nogui
```

Finally, update your start script:

```
nano /opt/minecraft/startminecraft.sh
```

And update the version number accordingly:

```
#!/bin/bash
cd /opt/minecraft/ && java -Xms2048M -Xmx3472M -jar minecraft_server.1.12.3.jar nogui
```

Now you can restart the server and everything should go well.

#### Why is your Minecraft server tutorial so long, and yet others are only 2 lines long?!

We tried to make this beginner-friendly and be as detailed as possible. We also showed you how to make the Minecraft server persistent and start it automatically at boot, we showed you how to configure your server and everything. I mean, sure, you can start a Minecraft server with a couple of lines, but it would definitely suck, for more than one reason.

#### I don’t know Linux or anything you wrote about here, how do I make a Minecraft server?

Just read all of our article and copy and paste the commands. If you really don’t know how to do it all, [we can do it for you][30], or just get a [managed][31] server [provider][32] and let them do it for you.

#### How do I install mods on my server? How do I install plugins?

Our article is intended to be a starting guide. You should check the [Minecraft wiki][33] for more info, or just google it. There are plenty of tutorials online

--------------------------------------------------------------------------------

via: https://thishosting.rocks/how-to-make-a-minecraft-server/

作者：[ThisHosting.Rocks][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://thishosting.rocks
[1]:https://thishosting.rocks/how-to-make-a-minecraft-server/#reasons
[2]:https://thishosting.rocks/how-to-make-a-minecraft-server/#not-pc
[3]:https://thishosting.rocks/how-to-make-a-minecraft-server/#requirements
[4]:https://thishosting.rocks/how-to-make-a-minecraft-server/#make-minecraft-server
[5]:https://thishosting.rocks/how-to-make-a-minecraft-server/#persistent
[6]:https://thishosting.rocks/how-to-make-a-minecraft-server/#boot
[7]:https://thishosting.rocks/how-to-make-a-minecraft-server/#configure-minecraft-server
[8]:https://thishosting.rocks/how-to-make-a-minecraft-server/#faqs
[9]:https://thishosting.rocks/cheap-cloud-hosting-providers-comparison/
[10]:https://thishosting.rocks/go/vultr/
[11]:https://minecraft.gamepedia.com/Server/Requirements/Dedicated
[12]:https://thishosting.rocks/best-cheap-managed-vps/
[13]:https://www.chiark.greenend.org.uk/~sgtatham/putty/
[14]:https://mobaxterm.mobatek.net/
[15]:https://www.linode.com/docs/security/securing-your-server/
[16]:https://thishosting.rocks/go/vultr/
[17]:https://thishosting.rocks/go/vultr/
[18]:https://thishosting.rocks/ubuntu-18-04-new-features-release-date/
[19]:https://www.linode.com/docs/security/securing-your-server/
[20]:https://minecraft.net/en-us/download/server
[21]:https://minecraft.gamepedia.com/Commands
[22]:https://thishosting.rocks/go/vultr/
[23]:https://thishosting.rocks/how-to-make-a-minecraft-server/#configure-minecraft-server
[24]:https://www.linode.com/docs/security/securing-your-server/
[25]:https://minecraft.gamepedia.com/Server.properties
[26]:https://thishosting.rocks/wp-content/uploads/2018/01/create-a-minecraft-server.jpg
[27]:https://minecraft.gamepedia.com/Server.properties
[28]:https://minecraft.gamepedia.com/Commands
[29]:https://minecraft.gamepedia.com/Commands
[30]:https://thishosting.rocks/support/
[31]:https://thishosting.rocks/best-cheap-managed-vps/
[32]:https://thishosting.rocks/best-cheap-managed-vps/
[33]:https://minecraft.gamepedia.com/Minecraft_Wiki
