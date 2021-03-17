[#]: subject: (Track your family calendar with a Raspberry Pi and a low-power display)
[#]: via: (https://opensource.com/article/21/3/family-calendar-raspberry-pi)
[#]: author: (Javier Pena https://opensource.com/users/jpena)
[#]: collector: (lujun9972)
[#]: translator: (wyxplus)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Track your family calendar with a Raspberry Pi and a low-power display
======
Help everyone keep up with your family's schedule using open source
tools and an E Ink display.
![Calendar with coffee and breakfast][1]

Some families have a complex schedule: the kids have school and afterschool activities, you have important events you want to remember, everyone has multiple appointments, and so forth. While you can keep track of everything using your cellphone and an app, wouldn't it be better to have a large, low-power display at home to show your family's calendar? Meet the E Ink calendar!

![E Ink calendar][2]

(Javier Pena, [CC BY-SA 4.0][3])

### The hardware

The calendar started as a holiday project, so I tried to reuse as much as I could. This included a Raspberry Pi 2 that had been unused for too long. I did not have an E Ink display, so I had to buy it. Fortunately, I found a vendor that provided [open source drivers and examples][4] for its Raspberry Pi-ready screen, which is connected using some [GPIO][5] ports.

My family also wanted to switch between different calendars, and that required some form of input. Instead of adding a USB keyboard, I opted for a simpler solution and bought a 1x4 matrix keypad, similar to the one described in [this article][6]. This allowed me to connect the keypad to some GPIO ports in the Raspberry Pi.

Finally, I needed a photo frame to house the whole setup. It looks a bit messy on the back, but it gets the job done.

![Calendar internals][7]

(Javier Pena, [CC BY-SA 4.0][3])

### The software

I took inspiration from a [similar project][8] and started writing the Python code for my project. I needed to get data from two areas:

  * Weather data, which I got from the [OpenWeather API][9]
  * Calendar data; I decided to use the [CalDav standard][10], which lets me connect to a calendar running on my home server



Since I had to wait for some parts to arrive, I used a modular approach for the input and display so that I could debug most of the code without the hardware. The calendar application supports drivers, and I wrote a [Pygame][11] driver to run it on a desktop PC.

The best part of writing the code was being able to reuse existing open source projects, so accessing the different APIs was easy. I could focus on the user interface—having per-person weekly and everyone daily calendars, allowing calendar selection using the keypad—and I had time to add some extra touches, like custom screen savers for special days.

![E Ink calendar screensaver][12]

(Javier Pena, [CC BY-SA 4.0][3])

The final integration step was making sure my calendar application would run on startup and be resilient to errors. I used a base [Raspberry Pi OS][13] image and installed the application as a systemd service so that it would survive failures and system restarts.

Once I finished everything, I uploaded the code [to GitHub][14]. So if you want to create a similar calendar, feel free to have a look and reuse it!

### The result

The calendar has become an everyday appliance in our kitchen. It helps us remember our daily activities, and even our kids use it to check their schedule before going to school.

On a personal note, the project helped me appreciate the _power of open_. Without open source drivers and libraries and open APIs, we would still be organizing our schedule with paper and a pen. Crazy, isn't it?

Need to keep your schedule straight? Learn how to do it using open source with these free...

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/family-calendar-raspberry-pi

作者：[Javier Pena][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jpena
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/calendar-coffee.jpg?itok=9idm1917 (Calendar with coffee and breakfast)
[2]: https://opensource.com/sites/default/files/uploads/calendar.jpg (E Ink calendar)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://github.com/waveshare/e-Paper
[5]: https://opensource.com/article/19/3/gpio-pins-raspberry-pi
[6]: https://www.instructables.com/1x4-Membrane-Keypad-w-Arduino/
[7]: https://opensource.com/sites/default/files/uploads/calendar_internals.jpg (Calendar internals)
[8]: https://github.com/zli117/EInk-Calendar
[9]: https://openweathermap.org
[10]: https://en.wikipedia.org/wiki/CalDAV
[11]: https://github.com/pygame/pygame
[12]: https://opensource.com/sites/default/files/uploads/calendar_screensaver.jpg (E Ink calendar screensaver)
[13]: https://www.raspberrypi.org/software/
[14]: https://github.com/javierpena/eink-calendar
