[#]: subject: (Wrong Time Displayed in Windows-Linux Dual Boot Setup? Here’s How to Fix it)
[#]: via: (https://itsfoss.com/wrong-time-dual-boot/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Wrong Time Displayed in Windows-Linux Dual Boot Setup? Here’s How to Fix it
======

If you [dual boot Windows and Ubuntu][1] or any other Linux distribution, you might have noticed a time difference between the two operating systems.

When you [use Linux][2], it shows the correct time. But when you boot into Windows, it shows the wrong time. Sometimes, it is the opposite and Linux shows the wrong time and Windows has the correct time.

That’s strange specially because you are connected to the internet and your date and time is set to be used automatically.

Don’t worry! You are not the only one to face this issue. You can fix it by using the following command in the Linux terminal:

```
timedatectl set-local-rtc 1
```

Again, don’t worry. I’ll explain why you encounter a time difference in a dual boot setup. I’ll show you how the above command fixes the wrong time issue in Windows after dual boot.

### Why Windows and Linux show different time in dual boot?

A computer has two main clocks: a system clock and a hardware clock.

A hardware clock which is also called RTC ([real time clock][3]) or CMOS/BIOS clock. This clock is outside the operating system, on your computer’s motherboard. It keeps on running even after your system is powered off.

The system clock is what you see inside your operating system.

When your computer is powered on, the hardware clock is read and used to set the system clock. Afterwards, the system clock is used for tracking time. If your operating system makes any changes to system clock, like changing time zone etc, it tries to sync this information to the hardware clock.

By default, Linux assumes that the time stored in the hardware clock is in UTC, not the local time. On the other hand, Windows thinks that the time stored on the hardware clock is local time. That’s where the trouble starts.

Let me explain with examples.

You see I am in Kolkata time zone which is UTC+5:30. After installing when I set the [timezon][4][e][4] [in Ubuntu][4] to the Kolkata time zone, Ubuntu syncs this time information to the hardware clock but with an offset of 5:30 because it has to be in UTC for Linux.

Let’ say the current time in Kolkata timezone is 15:00 which means that the UTC time is 09:30.

Now when I turn off the system and boot into Windows, the hardware clock has the UTC time (09:30 in this example). But Windows thinks the hardware clock has stored the local time. And thus it changes the system clock (which should have shown 15:00) to use the UTC time (09:30) as the local time. And hence, Windows shows 09:30 as the time which is 5:30 hours behind the actual time (15:00 in our example).

![][5]

Again, if I set the correct time in Windows by toggling the automatic time zone and time buttons, you know what is going to happen? Now it will show the correct time on the system (15:00) and sync this information (notice the “Synchronize your clock” option in the image) to the hardware clock.

If you boot into Linux, it reads the time from the hardware clock which is in local time (15:00) but since Linux believes it to be the UTC time, it adds an offset of 5:30 to the system clock. Now Linux shows a time of 20:30 which is 5:30 hours ahead of the actual time.

Now that you understand the root cause of the time difference issues in dual boot, it’s time to see how to fix the issue.

### Fixing Windows Showing Wrong Time in a Dual Boot Setup With Linux

There are two ways you can go about handling this issue:

  * Make Windows use UTC time for the hardware clock
  * Make Linux use local time for the hardware clock



It is easier to make the changes in Linux and hence I’ll recommend going with the second method.

Ubuntu and most other Linux distributions use systemd these days and hence you can use timedatectl command to change the settings.

What you are doing is to tell your Linux system to use the local time for the hardware clock (RTC). You do that with the `set-local-rtc` (set local time for RTC) option:

```
timedatectl set-local-rtc 1
```

As you can notice in the image below, the RTC now uses the local time.

![][6]

Now if you boot into Windows, it takes the hardware clock to be as local time which is actually correct this time. When you boot into Linux, your Linux system knows that the hardware clock is using local time, not UTC. And hence, it doesn’t try to add the off-set this time.

This fixes the time difference issue between Linux and Windows in dual boot.

You see a warning about not using local time for RTC. For desktop setups, it should not cause any issues. At least, I cannot think of one.

I hope I made things clear for you. If you still have questions, please leave a comment below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/wrong-time-dual-boot/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/
[2]: https://itsfoss.com/why-use-linux/
[3]: https://www.computerhope.com/jargon/r/rtc.htm
[4]: https://itsfoss.com/change-timezone-ubuntu/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/set-time-windows.jpg?resize=800%2C491&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/set-local-time-for-rtc-ubuntu.png?resize=800%2C490&ssl=1
