Get organized at the Linux command line with Calcurse
======

Keep up with your calendar and to-do list with Calcurse.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/calendar.jpg?itok=jEKbhvDT)

Do you need complex, feature-packed graphical or web applications to get and stay organized? I don't think so. The right command line tool can do the job and do it well.

Of course, uttering the words command and line together can strike fear into the hearts of some Linux users. The command line, to them, is terra incognita.

Organizing yourself at the command line is easy with [Calcurse][1]. Calcurse brings a graphical look and feel to a text-based interface. You get the simplicity and focus of the command line married to ease of use and navigation.

Let's take a closer look at Calcurse, which is open sourced under the BSD License.

### Getting the software

If compiling code is your thing (it's not mine, generally), you can grab the source code from the [Calcurse website][1]. Otherwise, get the [binary installer][2] for your Linux distribution. You might even be able to get Calcurse from your Linux distro's package manager. It never hurts to check.

Compile or install Calcurse (neither takes all that long), and you're ready to go.

### Using Calcurse

Crack open a terminal window and type **calcurse**.

![](https://opensource.com/sites/default/files/uploads/calcurse-main.png)

Calcurse's interface consists of three panels:

  * Appointments (the left side of the screen)
  * Calendar (the top right)
  * To-do list (the bottom right)



Move between the panels by pressing the Tab key on your keyboard. To add a new item to a panel, press **a**. Calcurse walks you through what you need to do to add the item.

One interesting quirk is that the Appointment and Calendar panels work together. You add an appointment by tabbing to the Calendar panel. There, you choose the date for your appointment. Once you do that, you tab back to the Appointments panel. I know …

Press **a** to set a start time, a duration (in minutes), and a description of the appointment. The start time and duration are optional. Calcurse displays appointments on the day they're due.

![](https://opensource.com/sites/default/files/uploads/calcurse-appointment.png)

Here's what a day's appointments look like:

![](https://opensource.com/sites/default/files/uploads/calcurse-appt-list.png)

The to-do list works on its own. Tab to the ToDo panel and (again) press **a**. Type a description of the task, then set a priority (1 is the highest and 9 is the lowest). Calcurse lists your uncompleted tasks in the ToDo panel.

![](https://opensource.com/sites/default/files/uploads/calcurse-todo.png)

If your task has a long description, Calcurse truncates it. You can view long descriptions by navigating to the task using the up or down arrow keys on your keyboard, then pressing **v**.

![](https://opensource.com/sites/default/files/uploads/calcurse-view-todo.png)

Calcurse saves its information in text files in a hidden folder called **.calcurse** in your home directory—for example, **/home/scott/.calcurse**. If Calcurse stops working, it's easy to find your information.

### Other useful features

Other Calcurse features include the ability to set recurring appointments. To do that, find the appointment you want to repeat and press **r** in the Appointments panel. You'll be asked to set the frequency (for example, daily or weekly) and how long you want the appointment to repeat.

You can also import calendars in [ICAL][3] format or export your data in either ICAL or [PCAL][4] format. With ICAL, you can share your data with other calendar applications. With PCAL, you can generate a Postscript version of your calendar.

There are also a number of command line arguments you can pass to Calcurse. You can read about them [in the documentation][5].

While simple, Calcurse does a solid job of helping you keep organized. You'll need to be a bit more mindful of your tasks and appointments, but you'll be able to focus better on what you need to do and where you need to be.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/calcurse

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: http://www.calcurse.org/
[2]: http://www.calcurse.org/downloads/#packages
[3]: https://tools.ietf.org/html/rfc2445
[4]: http://pcal.sourceforge.net/
[5]: http://www.calcurse.org/files/manual.chunked/ar01s04.html#_invocation
