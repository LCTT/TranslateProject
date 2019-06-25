[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (9 ways to save the planet)
[#]: via: (https://opensource.com/article/19/4/save-planet)
[#]: author: (Jen Wike Huger  https://opensource.com/users/jen-wike/users/alanfdoss/users/jmpearce)

9 ways to save the planet
======
These ideas have an open source twist.
![][1]

What can be done to help save the planet? The question can seem depressing at a time when it feels like an individual's contribution isn't enough. But, who are we Earth dwellers if not for a collection of individuals? So, I asked our writer community to share ways that open source software or hardware can be used to make a difference. Here's what I heard back.

### 9 ways to save the planet with an open source twist

**1.** **Disable the blinking cursor in your terminal.**

It might sound silly, but the trivial, blinking cursor can cause up to [2 watts per hour of extra power consumption][2]. To disable it, go to Terminal Settings: Edit > Preferences > Cursor > Cursor blinking > Disabled.

_Recommended by Mars Toktonaliev_

**2\. Reduce your consumption of animal products and processed foods.**

One way to do this is to add these open source apps to your phone: Daily Dozen, OpenFoodFacts, OpenVegeMap, and Food Restrictions. These apps will help you eat a healthy, plant-based diet, find vegan- and vegetarian-friendly restaurants, and communicate your dietary needs to others, even if they do not speak the same language. To learn more about these apps read [_4 open source apps to support eating a plant-based diet_][3].

_Recommendation by Joshua Allen Holm_

**3\. Recycle old computers.**

How? With Linux, of course. Pay it forward by giving creating a new computer for someone who can't one and keep a computer out of the landfill. Here's how we do it at [The Asian Penguins][4].

_Recommendation by Stu Keroff_

**4\. Turn off devices when you're not using them.**

Use "smart power strips" that have a "master" outlet and several "controlled" outlets. Plug your PC into the master outlet, and when you turn on the computer, your monitor, printer, and anything else plugged into the controlled outlets turns on too. A simpler, low-tech solution is a power strip with a timer. That's what I use at home. You can use switches on the timer to set a handy schedule to turn the power on and off at specific times. Automatically turn off your network printer when no one is at home. Or for my six-year-old laptop, extend the life of the battery with a schedule to alternate when it's running from wall power (outlet is on) and when it's running from the battery (outlet is off).

_Recommended by Jim Hall_

**5\. Reduce the use of your HVAC system.**

Sunlight shining through windows adds a lot of heat to your home during the summer. Use Home Assistant to [automatically adjust][5] window blinds and awnings [based on the time of day][6], or even based on the angle of the sun.

_Recommended by Michael Hrivnak_

**6\. Turn your thermostat off or to a lower setting while you're away.**

If your home thermostat has an "Away" feature, activating it on your way out the door is easy to forget. With a touch of automation, any connected thermostat can begin automatically saving energy while you're not home. [Stataway][7] is one such project that uses your phone's GPS coordinates to determine when it should set your thermostat to "Home" or "Away".

_Recommended by Michael Hrivnak_

**7\. Save computing power for later.**

I have an idea: Create a script that can read the power output from an alternative energy array (wind and solar) and begin turning on servers (taking them from a power-saving sleep mode to an active mode) in a computing cluster until the overload power is used (whatever excess is produced beyond what can be stored/buffered for later use). Then use the overload power during high-production times for compute-intensive projects like rendering. This process would be essentially free of cost because the power can't be buffered for other uses. I'm sure the monitoring, power management, and server array tools must exist to do this. Then, it's just an integration problem, making it all work together.

_Recommended by Terry Hancock_

**8\. Turn off exterior lights.**

Light pollution affects more than 80% of the world's population, according to the [World Atlas of Artificial Night Sky Brightness][8], published (Creative Commons Attribution-NonCommercial 4.0) in 2016 in the open access journal _Science Advances_. Turning off exterior lights is a quick way to benefit wildlife, human health, our ability to enjoy the night sky, and of course energy consumption. Visit [darksky.org][9] for more ideas on how to reduce the impact of your exterior lighting.

_Recommended by Michael Hrivnak_

**9\. Reduce your CPU count.**

For me, I remember I used to have a whole bunch of computers running in my basement as my IT playground/lab. I've become more conscious now of power consumption and so have really drastically reduced my CPU count. I like to take advantage of VMs, zones, containers... that type of technology a lot more these days. Also, I'm really glad that small form factor and SoC computers, such as the Raspberry Pi, exist because I can do a lot with one, such as run a DNS or Web server, without heating the room and running up my electricity bill.

P.S. All of these computers are running Linux, FreeBSD, or Raspbian!

_Recommended by Alan Formy-Duvall_

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/save-planet

作者：[Jen Wike Huger ][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jen-wike/users/alanfdoss/users/jmpearce
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/pixelated-world.png?itok=fHjM6m53
[2]: https://www.redhat.com/archives/fedora-devel-list/2009-January/msg02406.html
[3]: https://opensource.com/article/19/4/apps-plant-based-diets
[4]: https://opensource.com/article/19/2/asian-penguins-close-digital-divide
[5]: https://www.home-assistant.io/docs/automation/trigger/#sun-trigger
[6]: https://www.home-assistant.io/components/cover/
[7]: https://github.com/mhrivnak/stataway
[8]: http://advances.sciencemag.org/content/2/6/e1600377
[9]: http://darksky.org/
