[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Take to the virtual skies with FlightGear)
[#]: via: (https://opensource.com/article/19/1/flightgear)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

Take to the virtual skies with FlightGear
======
Dreaming of piloting a plane? Try open source flight simulator FlightGear.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/flightgear_cockpit_plane_sky.jpg?itok=LRy0lpOS)

If you've ever dreamed of piloting a plane, you'll love [FlightGear][1]. It's a full-featured, [open source][2] flight simulator that runs on Linux, MacOS, and Windows.

The FlightGear project began in 1996 due to dissatisfaction with commercial flight simulation programs, which were not scalable. Its goal was to create a sophisticated, robust, extensible, and open flight simulator framework for use in academia and pilot training or by anyone who wants to play with a flight simulation scenario.

### Getting started

FlightGear's hardware requirements are fairly modest, including an accelerated 3D video card that supports OpenGL for smooth framerates. It runs well on my Linux laptop with an i5 processor and only 4GB of RAM. Its documentation includes an [online manual][3]; a [wiki][4] with portals for [users][5] and [developers][6]; and extensive tutorials (such as one for its default aircraft, the [Cessna 172p][7]) to teach you how to operate it.

It's easy to install on both [Fedora][8] and [Ubuntu][9] Linux. Fedora users can consult the [Fedora installation page][10] to get FlightGear running.

On Ubuntu 18.04, I had to install a repository:

```
$ sudo add-apt-repository ppa:saiarcot895/flightgear
$ sudo apt-get update
$ sudo apt-get install flightgear
```

Once the installation finished, I launched it from the GUI, but you can also launch the application from a terminal by entering:

```
$ fgfs
```

### Configuring FlightGear

The menu on the left side of the application window provides configuration options.

![](https://opensource.com/sites/default/files/uploads/flightgear_menu.png)

**Summary** returns you to the application's home screen.

**Aircraft** shows the aircraft you have installed and offers the option to install up to 539 other aircraft available in FlightGear's default "hangar." I installed a Cessna 150L, a Piper J-3 Cub, and a Bombardier CRJ-700. Some of the aircraft (including the CRJ-700) have tutorials to teach you how to fly a commercial jet; I found the tutorials informative and accurate.

![](https://opensource.com/sites/default/files/uploads/flightgear_aircraft.png)

To select an aircraft to pilot, highlight it and click on **Fly!** at the bottom of the menu. I chose the default Cessna 172p and found the cockpit depiction extremely accurate.

![](https://opensource.com/sites/default/files/uploads/flightgear_cockpit-view.png)

The default airport is Honolulu, but you can change it in the **Location** menu by providing your favorite airport's [ICAO airport code][11] identifier. I found some small, local, non-towered airports like Olean and Dunkirk, New York, as well as larger airports including Buffalo, O'Hare, and Raleigh—and could even choose a specific runway.

Under **Environment** , you can adjust the time of day, the season, and the weather. The simulation includes advance weather modeling and the ability to download current weather from [NOAA][12].

**Settings** provides an option to start the simulation in Paused mode by default. Also in Settings, you can select multi-player mode, which allows you to "fly" with other players on FlightGear supporters' global network of servers that allow for multiple users. You must have a moderately fast internet connection to support this functionality.

The **Add-ons** menu allows you to download aircraft and additional scenery.

### Take flight

To "fly" my Cessna, I used a Logitech joystick that worked well. You can calibrate your joystick using an option in the **File** menu at the top.

Overall, I found the simulation very accurate and think the graphics are great. Try FlightGear yourself — I think you will find it a very fun and complete simulation package.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/flightgear

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: http://home.flightgear.org/
[2]: http://wiki.flightgear.org/GNU_General_Public_License
[3]: http://flightgear.sourceforge.net/getstart-en/getstart-en.html
[4]: http://wiki.flightgear.org/FlightGear_Wiki
[5]: http://wiki.flightgear.org/Portal:User
[6]: http://wiki.flightgear.org/Portal:Developer
[7]: http://wiki.flightgear.org/Cessna_172P
[8]: http://rpmfind.net/linux/rpm2html/search.php?query=flightgear
[9]: https://launchpad.net/~saiarcot895/+archive/ubuntu/flightgear
[10]: https://apps.fedoraproject.org/packages/FlightGear/
[11]: https://en.wikipedia.org/wiki/ICAO_airport_code
[12]: https://www.noaa.gov/
