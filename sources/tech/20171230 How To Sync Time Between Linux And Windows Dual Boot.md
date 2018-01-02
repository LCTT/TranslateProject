translating by lujun9972
How To Sync Time Between Linux And Windows Dual Boot
======
Dual Booting has become very common among people trying out different Linux Distributions while still keeping their windows system. This has become extremely popular since it is so easy to do. However, one big problem with dual booting is the **Time.**

Yes, you read that right. When you are using only one Operating System your system sync time effortlessly. But when on a dual boot of Windows & Linux, there can be a time sync error. Linux uses GMT while Windows uses your Local time. When you log in to Windows after spending time with Linux or vice versa, there might be incorrect time displayed.

Worry not, as we have a simple solution for this.

Just click on the start menu in your windows system and search for regedit.

[![open regedit in windows 10][1]][1]

Click on Enter, Now you will see a screen like the one below. This is the registry editor.

[![windows 10 registry editor][2]][2]

From the navigation menu on the left side, Navigate to -

 **`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation`**

On the right side of the window, Right click on any empty space and select **`New>> DWORD(32 bit) Value`**.

[![change time format utc from windows registry][3]][3]

After you have done that, the new entry you created will be highlighted by default. Rename it to `**RealTimeIsUniversal**` and give it a value of **1.**

[![set universal time utc in windows][4]][4]

We are done with all configurations and next time you reboot, you will not have the time sync problem.

--------------------------------------------------------------------------------

via: http://www.theitstuff.com/how-to-sync-time-between-linux-and-windows-dual-boot-2

作者：[Rishabh Kandari][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.theitstuff.com
[1]:http://www.theitstuff.com/wp-content/uploads/2017/12/syncdualbootime1-e1512732558530.jpg
[2]:http://www.theitstuff.com/wp-content/uploads/2017/12/syncdualbootime2.jpg
[3]:http://www.theitstuff.com/wp-content/uploads/2017/12/syncdualbootime3.jpg
[4]:http://www.theitstuff.com/wp-content/uploads/2017/12/syncdualbootime4.jpg
