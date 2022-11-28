[#]: subject: (12 Raspberry Pi projects to try this year)
[#]: via: (https://opensource.com/articles/21/3/raspberry-pi-projects)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

12 Raspberry Pi projects to try this year
======
There are plenty of reasons to use your Raspberry Pi at home, work, and
everywhere in between. Celebrate Pi Day by choosing one of these
projects.
![Raspberry Pi 4 board][1]

Remember when the Raspberry Pi was just a really tiny hobbyist Linux computer? Well, to the surprise of no one, the Pi's power and scope has escalated quickly. Have you got a new Raspberry Pi or an old one lying around needing something to do? If so, we have plenty of new project ideas, ranging from home automation to cross-platform coding, and even some new hardware to check out.

### Raspberry Pi at home

Although I started using the Raspberry Pi mostly for electronics projects, any spare Pi not attached to a breadboard quickly became a home server. As I decommission old units, I always look for a new reason to keep it working on something useful.

  * While it's fun to make LEDs blink with a Pi, after you've finished a few basic electronics projects, it might be time to give your Pi some serious responsibilities. Predictably, it turns out that a homemade smart thermostat is substantially smarter than those you buy off the shelf. Try out ThermOS and this tutorial to [build your own multizone thermostat with a Raspberry Pi][2].

  * Whether you have a child trying to focus on remote schoolwork or an adult trying to stay on task during work hours, being able to "turn off" parts of the Internet can be an invaluable feature for your home network. [The Pi-hole project][3] grants you this ability by turning your Pi into your local DNS server, which allows you to block or re-route specific sites. There's a sizable community around Pi-hole, so there are existing lists of commonly blocked sites, and several front-ends to help you interact with Pi-hole right from your Android phone.

  * Some families have a complex schedule. Kids have school and afterschool activities, adults have important events to attend, anniversaries and birthdays to remember, appointments to keep, and so on. You can keep track of everything using your mobile phone, but this is the future! Shouldn't wall calendars be interactive by now?

For me, nothing is more futuristic than paper that changes its ink. Of course, we have e-ink now, and the Pi can use an e-ink display as its screen. [Build a family calendar][4] with a Pi and an e-ink display for one of the lowest-powered yet most futuristic (or magical, if you prefer) calendaring systems possible.

  * There's something about the Raspberry Pi's minimal design and lack of a case that inspires you to want to build something with it. After you've built yourself a thermostat and a calendar, why not [replace your home router with a Raspberry Pi][5]? With the OpenWRT distribution, you can repurpose your Pi as a router, and with the right hardware you can even add mobile connectivity.




### Monitoring your world with the Pi

For modern technology to be truly interactive, it has to have an awareness of its environment. For instance, a display that brightens or dims based on ambient light isn't possible without useful light sensor data. Similarly, the actual _environment_ is really important to us humans, and so it helps to have technology that can monitor it for us.

  * Gathering data from sensors is one of the foundations you need to understand before embarking on a home automation or Internet of Things project. The Pi can do serious computing tasks, but it's got to get its data from something. Sensors provide a Pi with data about the environment. [Learn more about the fine art of gathering data over sensors][6] so you'll be ready to monitor the physical world with your Pi.

  * Once you're gathering data, you need a way to process it. The open source monitoring tool Prometheus is famous for its ability to represent complex data inputs, and so it's an ideal candidate to be your IoT (Internet of Things) aggregator. Get started now, and in no time you'll be monitoring and measuring and general data crunching with [Prometheus on a Pi][7].

  * While a Pi is inexpensive and small enough to be given a single task, it's still a surprisingly powerful computer. Whether you've got one Pi monitoring a dozen other Pi units on your IoT, or whether you just have a Pi tracking the temperature of your greenhouse, sometimes it's nice to be able to check in on the Pi itself to find out what its workload is like, or where specific tasks might be able to be optimized.

Grafana is a great platform for monitoring servers, including a Raspberry Pi. [Prometheus and Grafana][8] work together to monitor all aspects of your hardware, providing a friendly dashboard so you can check in on performance and reliability at a glance.

  * You can download mobile apps to help you scan your home for WiFi signal strength, or you can [build your own on a Raspberry Pi using Go][9]. The latter sounds a lot more fun than the former, and because you're writing it yourself, there's a lot more customization you can do on a Pi-based solution.




### The Pi at work

I've run file shares and development servers on Pi units at work, and I've seen them at former workplaces doing all kinds of odd jobs (I remember one that got hooked up to an espresso machine to count how many cups of coffee my department consumed each day, not for accounting purposes but for bragging rights). Ask your IT department before bringing your Pi to work, of course, but look around and see what odd job a credit-card-sized computer might be able to do for you.

  * Of course you could host a website on a Raspberry Pi from the very beginning of the Pi. But as the Pi has developed, it's gotten more RAM and better processing power, and so [a dynamic website with SQLite or Postgres and Python][10] is an entirely reasonable prospect.

  * Printers are infamously frustrating. Wouldn't it be nice to program [your very own print UI][11] using the amazing cross-platform framework TotalCross and a Pi? The less you have to struggle through screens of poorly designed and excessive options, the better. If you design it yourself, you can provide exactly the options your department needs, leaving the rest out of sight and out of mind.

  * Containers are the latest trend in computing, but before containers there were FreeBSD jails. Jails are a great solution for running high-risk applications safely, but they can be complex to set up and maintain. However, if you install FreeBSD on your Pi and run [Bastille for jail management][12] and mix in the liberal use of jail templates, you'll find yourself using jails with the same ease you use containers on Linux.

  * The "problem" with having so many tech devices around your desk is that your attention tends to get split between screens. If you'd rather be able to relax and just stare at a single screen, then you might look into the Scrcpy project, a screen copying application that [lets you access the screen of your mobile device on your Linux desktop or Pi][13]. I've tested scrcpy on a Pi 3 and a Pi 4, and the performance has surprised me each time. I use scrcpy often, but especially when I'm setting up an exciting new Edge computing node on your Pi cluster, or building my smart thermostat, or my mobile router, or whatever else.




### Get a Pi

To be fair, not everyone has a Pi. If you haven't gotten hold of a Pi yet, you might [take a look at the Pi 400][14], an ultra-portable Pi-in-a-keyboard computer. Evocative of the Commodore 64, this unique form factor is designed to make it easy for you to plug your keyboard (and the Pi inside of it) into the closest monitor and get started computing. It's fast, easy, convenient, and almost _painfully_ retro. If you don't own a Pi yet, this may well be the one to get.

What Pi projects are you working on for Pi day? Tell us in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/articles/21/3/raspberry-pi-projects

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/raspberry-pi-4_lead.jpg?itok=2bkk43om (Raspberry Pi 4 board)
[2]: https://opensource.com/article/21/3/thermostat-raspberry-pi
[3]: https://opensource.com/article/21/3/raspberry-pi-parental-control
[4]: https://opensource.com/article/21/3/family-calendar-raspberry-pi
[5]: https://opensource.com/article/21/3/router-raspberry-pi
[6]: https://opensource.com/article/21/3/sensor-data-raspberry-pi
[7]: https://opensource.com/article/21/3/iot-measure-raspberry-pi
[8]: https://opensource.com/article/21/3/raspberry-pi-grafana-cloud
[9]: https://opensource.com/article/21/3/troubleshoot-wifi-go-raspberry-pi
[10]: https://opensource.com/article/21/3/web-hosting-raspberry-pi
[11]: https://opensource.com/article/21/3/raspberry-pi-totalcross
[12]: https://opensource.com/article/21/3/bastille-raspberry-pi
[13]: https://opensource.com/article/21/3/android-raspberry-pi
[14]: https://opensource.com/article/21/3/raspberry-pi-400-review
