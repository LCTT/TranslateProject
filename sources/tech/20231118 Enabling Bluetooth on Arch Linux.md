[#]: subject: "Enabling Bluetooth on Arch Linux"
[#]: via: "https://itsfoss.com/bluetooth-arch-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Enabling Bluetooth on Arch Linux
======

So, [I installed Arch Linux quite easily][1] thanks to the archinstall script.

After I started using it and exploring it, I tried using my Bluetooth headphones only to notice that the Bluetooth was not working.

I could see the Bluetooth option but I just could not enable it. Clicking the toggle button kept on switching back to disabled.

0:00

/0:05

1×

Bluetooth turn on button not working

Here's what I did and what worked for me.

### Ensure that Bluetooth service is running

If the service is not running, Bluetooth won't be turned on and you won't be able to connect to it.

Check the status of the Bluetooth service and see if it is running or not.

```

    systemctl status bluetooth

```

It gave me the following output:

```

    [abhishek@itsfoss ~]$ systemctl status bluetooth
    ○ bluetooth.service - Bluetooth service
         Loaded: loaded (/usr/lib/systemd/system/bluetooth.service; disabled; preset: disabled)
         Active: inactive (dead)
           Docs: man:bluetoothd(8)

```

As you can see, the `bluetooth` service is inactive. It is not running. And the state is disabled.

It means that Bluetooth daemon is not running at present and it is also not set to start automatically on each boot.

That made things easier for me. I have identified the root cause in the first attempt. That doesn't happen frequently with Arch Linux.

Start the Bluetooth daemon with:

```

    sudo systemctl start bluetooth

```

Make the Bluetooth service run automatically when the system starts:

```

    systemctl enable bluetooth

```

It should show the following output:

```

    [abhishek@itsfoss ~]$ systemctl enable bluetooth
    Created symlink /etc/systemd/system/dbus-org.bluez.service → /usr/lib/systemd/system/bluetooth.service.
    Created symlink /etc/systemd/system/bluetooth.target.wants/bluetooth.service → /usr/lib/systemd/system/bluetooth.service.

```

Now, the Bluetooth was enabled and it was evident in the system settings:

![][2]

### Tip on connecting to a Bluetooth device

You probably already that you should put your Bluetooth device in pairing mode first. That's critical.

Afterward, you can try toggling the Bluetooth button off and on again so that it searches for available devices.

If it immediately doesn't show, you may click on some other system settings and come back to Bluetooth again. It worked for me several times in the past, don't ask why.

### Other troubleshooting tips

Here are a few more tips on fixing the Bluetooth connection issue in Arch Linux:

#### Ensure no blockage

Ensure that Bluetooth is not being blocked:

```

    rfkill list

```

Check the output:

```

    [abhishek@itsfoss ~]$ rfkill list
    0: hci0: Bluetooth
        Soft blocked: no
        Hard blocked: no
    1: phy0: Wireless LAN
        Soft blocked: no
        Hard blocked: no

```

If you see Bluetooth being blocked, unblock it with:

```

    rfkill unblock bluetooth

```

#### Pipewire vs Pulseaudio

In some cases, Pipewire and Pulseaudio can spoil the game if you experimented with them in the past.

If you are using Pipewire, ensure that you have pipewire-pulse installed:

```

     sudo pacman -Syu pipewire-pulse

```

If you are using Pulseaudio, `bluez` and `pulseaudio-bluetooth` could help you.

Check out the Arch Wiki page for more information.

![][3]

### Did it work for you?

Hardware compatibility issue is a problem with any operating system and Linux is no exception.

Another thing is that there is no single solution. Your system may have a different problem than mine, and the suggestions mentioned here may or may not work for you.

The magnificent Arch Wiki has a lot more suggestions than what I can offer. Do go through it if you still have not managed to fix your Bluetooth problem.

![][3]

Over to you now. Did it work for you? If yes, which method was it? If not, what kind of problem are you facing and what troubleshooting methods have you tried so far?

--------------------------------------------------------------------------------

via: https://itsfoss.com/bluetooth-arch-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.youtube.com/watch?v=WksxVLrALhg
[2]: https://itsfoss.com/content/images/2023/11/bluetooth-working-arch-linux.png
[3]: https://wiki.archlinux.org/favicon.ico
