[#]: subject: "Play with model trains in OpenTTD"
[#]: via: "https://opensource.com/article/21/9/model-trains-openttd"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Play with model trains in OpenTTD
======
Don't have room for a physical model train set? Try virtual trains with
OpenTTD.
![Old train][1]

My father has always been fond of model trains, and I remember watching him building a track around the Christmas tree when I was young. When [Lego][2] train sets were released, he and I transitioned to them for their convenience and inherent extensibility. We built and operated Lego trains and monorail tracks over the course of many years. I've often imagined a possible future in which I have a garage or a basement dedicated to miniature landscapes and electric whistling trains. Then again, the probability of me diving that severely into yet another hobby is pretty low, so I was very happy to discover that _virtual_ model railways can provide me with much of the same satisfaction. The engine for my virtualized hobby is [OpenTTD][3], an open source simulation game based on an old '90s game called **Transport Tycoon Deluxe**.

### Installing OpenTTD

You can download OpenTTD for Linux, macOS, and Windows from [openttd.org/downloads][4].

If you're running Debian Linux or one of its derivatives, or even [running it on a Chromebook][5], you can download the `.deb` package. Install it with `apt`:


```
`$ sudo apt install ./openttd*deb`
```

If you're using any other Linux distribution, download the generic installer and extract the package with [the `tar command`][6]:


```
`$ tar xvf openttd-x.yy.z-linux*.tar.xz`
```

OpenTTD is also available on [Steam][7] for Linux, macOS, and Windows (Steam isn't open source, but it's a common cross-platform gaming client).

### Launch OpenTTD

If you installed OpenTTD, you can launch it from your application menu.

If you're downloaded the generic package, change into the directory and launch the game using the local `openttd` command:


```
$ cd openttd*
$ ./openttd &amp;
```

The first time you launch OpenTTD, it alerts you that you must download a graphic set. This is automatically installed in the Steam edition, but it's a single-click in the stand-alone app. And anyway, because OpenTTD is open source, it's well modded, so you'll end up downloading a lot more than just the default graphics.

After the graphics have been downloaded, you're presented with the quaintly diminutive interface. I find a 640x480 interface a little small, and while the old graphics do hearken back to simpler computing days, a slight upgrade for modern screens is helpful. For that reason, your first stop is the **Check online content** button.

### Loading mods

The **Content downloading** screen provides you with a window to approved OpenTTD mods, giving improved graphics, new music, train models, and map names appropriate to your location or interests. I use the New Zealand set, so all of my generated cities sound familiar, although, since 2020, I've started using the Fallout 3 set. There are _a lot_ of mods, so use the search bar in the top right to narrow your choices.

Here are the mods I consider essential:

  * **abase** \- High res graphics. At nearly 300 MB, this is the largest download you're likely to need (the game itself is barely 50 MB).
  * **OpenSFX** \- A sound set so you can hear the traffic in cities, the horns of the boating industry, and the very satisfying whistles of trains.
  * **Town names** \- The default names of cities are fun, but I find it easier to remember names that feel local.
  * **Trains** \- OpenTTD has a default set of train models that work perfectly well, but if you're a trainspotter already, then you might enjoy downloading some additional train sets. I use the NZR set, but there are many trains available, including trains from the UK, the USA, Austria, Belgium, Czech Republic, and on and on down the alphabet.
  * **Beginner tutorial** \- A scenario to help you learn the game and its interface.



### Game engine defaults

Once you download your new assets, you must set them as your defaults. There are two places for this: Game engine defaults and in-game scripts and assets.

![OpenTTD main menu][8]

The OpenTTD menu (Seth Kenlon, [CC BY-SA 4.0][9])

Click the **Game Options** button. In the **Game Options** screen, adjust these settings:

  * Set the **screen resolution** to your preferred interface size.
  * Set **base graphics set** to **abase.**
  * Set **base sounds set** to **OpenSFX.**



Close the **Game Options** screen. Your changes are saved automatically.

### Game options

From the main menu screen, click the **NewGRF Settings** button.

![NewGRF settings window][10]

The NewGRF settings menu (Seth Kenlon, [CC BY-SA 4.0][9])

Inactive mods are listed at the bottom of the **NewGRF Settings** window. To activate one, select it and click the **Add** button in the bottom left. Once you've chosen the mods to activate, click the **Apply** button.

### Tutorial

If you downloaded the **Beginner tutorial** scenario, you could learn OpenTTD by playing through it. To start the tutorial, click the **Play scenario** button near the top of the main menu screen. Select the tutorial and begin.

The tutorial gives you a full tour of the game's interface, and it takes some time to get through it.

### Quickstart

By way of a quicker introduction, here's what you need to know: vehicles come from depots, and everything needs a schedule. By remembering those two rules, you can start building trains (and roads and seaports and airports) right away.

#### **Build stations**

To build a simple rail line between two cities, click the railway track icon in the top icon bar.

![New icon bar - railway option][11]

The new icon bar - railway option (Seth Kenlon, [CC BY-SA 4.0][9])

Railways start and end with stations, so I usually place a station at each end of my intended line. Click the train station icon (mouse over it to see its label). For a train station to serve a region, its area of effect must overlap with as much of the region as possible. To see a station's coverage, enable **Coverage area highlight** by clicking the **On** button at the bottom of the station dialog box.

![Station coverage window][12]

Station coverage information window (Seth Kenlon, [CC BY-SA 4.0][9])

The dark grid overlay represents coverage, while the white grid overlay shows the physical footprint of the station. As you hover over an area, the supplies that a station's coverage enables are listed in the station popup window. Start simple and create a single-track, 4-car platform. Do this twice between two cities on the map.

![create station menu][13]

The create station menu (Seth Kenlon, [CC BY-SA 4.0][9])

### Lay the rails

Next, connect the stations with rails. The isometric view of OpenTTD takes some getting used to, but after clicking on the rail icons and clicking and dragging on the map, you start to get a feel for it. The X-rail icon provides an "autorail" mode, which aligns the track based on where in a square you click.

Be careful as you lay your rails. OpenTTD is rather unforgiving, so once you click in a square, rails are constructed. You must use the dynamite icon to remove rails. Just like in real life, there's no undo button.

### Train depot

Trains come from a depot. So to add a train to your railway, you must add a depot somewhere along the line. Click the depot icon and place a depot near an existing rail. Connect the depot to an existing track to ensure your trains can get from the depot to the appropriate (in this simple example, the only) line.

![create depot menu][14]

The create depot menu (Seth Kenlon, [CC BY-SA 4.0][9])

### Model trains

At long last, you get to add a virtual model train to your virtual railway. To create a train, click on your depot.

Click the **New Vehicle** button at the bottom of the depot window to list available train engines and cars. The list you get depends partly on what models you've added from the downloadable content. Generally, there are three types of engines: Steam, diesel, and electric. Early in the game, which starts in the year 1950, you have only steam. As the years progress, you get innovative new models you can use as upgrades.

![create train menu][15]

The create train menu (Seth Kenlon, [CC BY-SA 4.0][9])

For now, create a simple train that includes an engine, a passenger car, and a mail car. If you want to add other kinds of cars, click on your stations to confirm the types of supplies they're able to accept (as determined by its area of coverage).

### Create a train schedule

Now that you have a railway and a train, you must create a train schedule. Schedules are attached to vehicles, so any time you add a new vehicle of any kind, you must add a schedule for it to be useful.

To add a schedule to your train, click the number to the left of the train in its depot listing. This opens a viewport for the train, with buttons along the right side of the window. Click the arrow icon to see that train's schedule.

![create schedule menu][16]

The create schedule menu (Seth Kenlon, [CC BY-SA 4.0][9])

To create a schedule, click the **Go To** button at the bottom of the schedule window, and then click on the station you want to set as the first destination. Then click the next station. You can adjust loading and unloading requirements by selecting a stop in the schedule and browsing the options in the **Full load** and **Unload** drop-down menus, and you can adjust routes (should you develop new routes) in the **Non-stop** drop-down menu. The options are plentiful, and as cities grow and your map becomes more developed, you may have to adjust your strategy.

But for now, click the red **Stopped** button at the bottom of your train viewport to put your train into service!

![train moving from station to station][17]

Train in service (Seth Kenlon, [CC BY-SA 4.0][9])

### Try OpenTTD

OpenTTD is a simulator, but it's also a game, so you do have constraints, including a budget and parameters you might want to optimize. For instance, you can click on a city, farm, or factory to discover what kind of imports and exports are acceptable to it. You can borrow money by clicking the budget button in the bottom right corner of the OpenTTD window. And it's not just a virtual train set. You can build roads, airports, seaports, and more. Just remember that all vehicles need depots and schedules, and you're halfway to a successful virtual enterprise.

OpenTTD has an active and enthusiastic community, [an extensive wiki][18], and there are lots of resources and tutorials available online. Download the game and give it a try!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/model-trains-openttd

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/train-plane-speed-big-machine.png?itok=f377dXKs (Old train)
[2]: https://opensource.com/article/20/6/open-source-virtual-lego
[3]: http://openttd.org
[4]: https://www.openttd.org/downloads/openttd-releases/latest.html
[5]: https://opensource.com/article/21/2/chromebook-linux
[6]: https://opensource.com/article/17/7/how-unzip-targz-file
[7]: https://store.steampowered.com/app/1536610/OpenTTD/
[8]: https://opensource.com/sites/default/files/openttd-menu.jpg (OpenTTD menu)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://opensource.com/sites/default/files/openttd-newgrf.jpg (The NewGRF settings menu)
[11]: https://opensource.com/sites/default/files/openttd-iconbar-railway.jpg (The new icon bar - railway option)
[12]: https://opensource.com/sites/default/files/openttd-window-station.jpg (Station coverage information window)
[13]: https://opensource.com/sites/default/files/openttd-create-station.jpg (The create station menu)
[14]: https://opensource.com/sites/default/files/openttd-create-depot.jpg (Create depot menu)
[15]: https://opensource.com/sites/default/files/openttd-create-train.jpg (The create train menu)
[16]: https://opensource.com/sites/default/files/openttd-create-schedule.png (The create schedule menu)
[17]: https://opensource.com/sites/default/files/openttd-train.jpg (Train in service)
[18]: https://wiki.openttd.org/en/
