MapTool: A robust, flexible virtual tabletop for RPGs
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rpg_gaming_maptool.jpg?itok=l7hT-Ohv)

When I was looking for a virtual tabletop for role-playing games (RPGs), either for local play or for playing on a network with family and friends around the world, I had several criteria. First, I wanted a platform I could use offline while I prepped a campaign. Second, I didn't want something that came with the burden of being a social network. I wanted the equivalent of a [Sword Coast][1] campaign-setting [boxed set][2] that I could put on my digital "shelf" and use when I wanted, how I wanted.

I looked at it this way: I purchased [AD&D 2nd edition][3] as a hardcover book, so even though there have since been many great releases, I can still play AD&D 2nd edition today. The same goes for my digital life. When I want to use my digital maps and tokens or go back to an old campaign, I want access to them regardless of circumstance.

![](https://opensource.com/sites/default/files/u128651/fullscreen.jpg)

### Virtual tabletop

[MapTool][4] is the flagship product of the RPTools software suite. It's a Java application, so it runs on any operating system that can run Java, which is basically every computer. It's also open source and costs nothing to use, although RPTools accepts [donations][5] if you're so inclined.

### Installing MapTool

Download MapTool from [rptools.net][6].

It's likely that you already have Java installed; if not, download and install it from [java.net][7]. If you're not sure whether you have it installed or not, you can download MapTool first, try to run it, and install Java if it fails to run.

### Using MapTool

If you're a game master (GM), MapTool is a great way to provide strategic maps for battles and exploration without investing in physical maps, tokens, or miniatures.

MapTool is a full-featured virtual tabletop. You can load maps into it, import custom tokens, track initiative order and health, and save campaigns. You can use it locally at your game table, or you can share your session with remote gamers so they can follow along. There are other virtual tabletops out there, but MapTool is the only one you own, part and parcel.

To load a map into MapTool, all you need is a PNG or JPEG version of a map.

  1. Launch MapTool, then go to the **Map** menu and select **New Map**.
  2. In the **Map Properties** window that appears, click the **Map** button.
  3. Click the **Filesystem** button in the bottom-left corner to locate your map graphic on your hard drive.



If you have no digital maps yet, there are dozens of map packs available from [Open Gaming Store][8], so you're sure to find a map regardless of where your adventure path may take you.

MapTool, like most virtual tabletops, expects a PNG or JPEG. I maintain a simple [Image Magick][9] script to convert maps from PDF to PNG. The script runs on Linux, BSD, or Mac and is probably also easily adapted to PowerShell.
```
#!/usr/bin/env bash

#GNU All-Permissive http://www.gnu.org/licenses



CMD=`which convert` || echo "Image Magick not found in PATH."

ARG=("${@}")

ARRAYSIZE=${#ARG[*]}



while [ True ]; do

  for item in "${ARG[@]}"; do

$CMD "${item}" `basename "${item}" .pdf`.jpg || \

$CMD "${item}" `basename "${item}" .PDF`.jpg

  done

 done

exit

```

If running code like that scares you, there are plenty of PDF-to-image converters, like [GIMP][10], for manually converting a PDF to PNG or JPEG on an as-needed basis.

#### Adding tokens

Now that you have a map loaded, it's time to add player characters (PCs) and non-player characters (NPCs). MapTool ships with a modest selection of token graphics, but you can always create and use your own or download more from the internet. In fact, the RPTools website recently linked to [ImmortalNights][11], a website by artist Devin Night, with over 100 tokens for free and purchase.

  1. Click the **Tokens** folder icon in the MapTool **Resource Library** panel.
  2. In the panel just beneath the **Resource Library** panel, the default tokens appear. You can add your own tokens using the **Add resources to library** option in the **File** menu.
  3. In the **New token** pop-up dialogue box, give the token a name and PC or NPC designation.

![](https://opensource.com/sites/default/files/u128651/token.png)

  4. Once the token is on the map, it should align perfectly with the map grid. If it doesn't, you can adjust the grid.
  5. Right-click on the token to adjust its rotation, size, and other attributes.



#### Adjusting the grid

By default, MapTool provides an invisible 50x50 square grid over any map. If your map graphic already has a grid on it, you can adjust MapTool's grid to match your graphic.

  1. Select **Adjust grid** in the **Map** menu. A grid overlay appears over your map.
  2. Click and drag the overlay grid so one overlay square sits inside one of your map graphic's grid squares.
  3. Adjust the **Grid Size** pixel value in the property box in the top-right corner of the MapTool window.
  4. When finished, click the property box's **Close** button.



You can set the default grid size using the **Preferences** selection in the **Edit** menu. For instance, I do this for [Paizo][12] maps on my 96dpi screen.

MapTool's default assumes each grid block is a five-foot square, but you can adjust that if you're using a wide area representing long-distance travel or if you've drawn a custom map to your own scale.

### Sharing the screen locally

While you can use MapTool solely as a GM tool to help keep track of character positions, you can also share it with your players.

If you're using MapTool as a digital replacement for physical maps at your game table, you can just plug your computer into your TV. That's the simplest way to share the map with everyone at your table.

Another alternative is to use MapTool's built-in server. If your players are physically sitting in the same room and on the same network, select **Start server** from the **File** menu.

The only required field is a name for the GM. The default port is 51234. If you don't know what that means, that's OK; a port is just a flag identifying where a service like MapTool is running.

Once your MapTool server is started, players can connect by selecting **Connect to server** in the **File** menu.

![](https://opensource.com/sites/default/files/u128651/connect_0.png)

A name is required, but no password is needed unless the GM has set one when starting the server.

The IP address is your local IP address, so it starts with either 192.168 or 10. If you don't know your local IP address, you can check it from your computer's networking control panel. On Linux, you can also find it by typing:
```
$ ip -4 -ts a

```

And on BSD or Mac:
```
$ ifconfig

```

On Windows, open PowerShell from your **Start** menu and type:
```
ipconfig

```

![](https://opensource.com/sites/default/files/u128651/powershell.jpg)

If your players have trouble connecting, there are two likely causes:

  * You forgot to start the server. Start it and have your players try again.
  * You have a firewall running on your computer. If you're on your home network, it's safe to deactivate your firewall or to tell it to permit traffic on port 51234. If you're in a public gaming space, you should not lower your firewall, but it's safe to permit traffic on port 51234 as long as you have set a password for your MapTool server.

![](https://opensource.com/sites/default/files/u128651/connect_0.png)

### Sharing the screen worldwide

If you're playing remotely with people all over the world, letting them into your private MapTool server is a little more complex to set up, but you only have to do it once and then you're set.

#### Router

The first device that needs to be adjusted is your home router. This is the box you got from your internet service provider. You might also call it your modem.

Every device is different, so there's no way for me to definitively tell you what you need to click on to adjust your settings. Generally, you access your home router through a web browser. Your router's address is often printed on the bottom of the router and begins with either 192.168 or 10.

Navigate to the router address and log in with the credentials you were provided when you got your internet service. It's often as simple as `admin` with a numeric password (sometimes this password is printed on the router, too). If you don't know the login, call your internet provider and ask for details.

Different routers use different terms for the same thing; keywords to look for are **Port forwarding** , **Virtual server** , and **Firewall**. Whatever your router calls it, you want to accept traffic coming to port 51234 of your router and forward that traffic to the same port of your personal computer's IP address.

![](https://opensource.com/sites/default/files/u128651/router.png)

If you're confused, search the internet for the term "port forwarding" and your router's brand name. This isn't an uncommon task for PC gamers, so instructions are out there.

#### Finding your external IP address

Now you're allowing traffic through the MapTool port, so you need to tell your players where to go.

  1. Get your worldwide IP address at [icanhazip.com][13].
  2. Start the MapTool server from the **File** menu. Set a password for safety.
  3. Have players select **Connect to server** from the **File** menu.
  4. In the **Connect to server** window, have players click the **Direct** tab and enter a username, password, and your IP address.

![](https://opensource.com/sites/default/files/u128651/remote.png)

### Features a-plenty

This has been a brief overview of things you can do with MapTool. It has many other features, including an initiative tracker, adjustable tokens visibility (hide treasure and monsters from your players!), impersonation, line-of-sight (conceal hidden doors behind statues or other structures!), and fog of war.

It can serve just as a digital battle map, or it can be the centerpiece of your tabletop game.

![](https://opensource.com/sites/default/files/u128651/fog.jpg)

### Why MapTool?

Before you comment about them: Yes, there are a few virtual tabletop services online, and some of them are very good. They provide a good supply of games looking for players and players looking for games. If you can't find your fellow gamers locally, online tabletops are a great solution.

By contrast, some people are not fans of social networking, so we shy away from sites that excitedly "bring people together." I've got friends to game with, and we're happy to build and set up our own infrastructure. We don't need to sign up for yet another site; we don't need to throw our hats into a great big online bucket and register when and how we game.

Ultimately, I like MapTool because I have it with me whether or not I'm online. I can plan a campaign, populate it with graphics, and set up all my maps in advance without depending on having internet access. It's almost like doing the frontend programming for a video game, knowing that the backend "technology" will all happen in the player's minds on game night.

If you're looking for a robust and flexible virtual tabletop, try MapTool!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/maptool

作者：[Seth Kenlon][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[1]:https://en.wikibooks.org/wiki/Dungeons_%26_Dragons/Commercial_settings/Forgotten_Realms/Sword_Coast
[2]:https://en.wikipedia.org/wiki/Dungeons_%26_Dragons_campaign_settings
[3]:https://en.wikipedia.org/wiki/Editions_of_Dungeons_%26_Dragons#Advanced_Dungeons_&_Dragons_2nd_edition
[4]:http://www.rptools.net/toolbox/maptool/
[5]:http://www.rptools.net/donate/
[6]:http://www.rptools.net/downloadsw/
[7]:http://jdk.java.net/8
[8]:https://www.opengamingstore.com/search?q=map
[9]:http://www.imagemagick.org/script/index.php
[10]:http://gimp.org
[11]:http://immortalnights.com/tokenpage.html
[12]:http://paizo.com/
[13]:http://icanhazip.com/
