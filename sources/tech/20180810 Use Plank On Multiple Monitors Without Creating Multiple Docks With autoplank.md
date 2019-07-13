Use Plank On Multiple Monitors Without Creating Multiple Docks With autoplank
======

![](https://3.bp.blogspot.com/-BNHa6rP_kGk/W22cJrT3ghI/AAAAAAAABWA/TAKZgxJfYuwz-Me-M135-LWYl5qvs6cIwCLcBGAs/s640/plank-dock.png)

**[autoplank][1] is a small tool written in Go which adds multi-monitor support to Plank dock without having to create [multiple][2] docks.**

**When you move your mouse cursor to the bottom of a monitor, autoplank detect your mouse movement using** `xdotool` and it automatically moves Plank to that monitor. This tool **only works if Plank is set to run at the bottom of the screen** , at least for now.

There's a slight delay until Plank actually shows up on the monitor where the mouse is though. The developer says this is intentional, to make sure you actually want to access Plank on that monitor. The time delay before showing plank is not currently configurable, but that may change in the future.

autoplank should work with elementary OS, as well as any desktop environment or Linux distribution you use Plank dock on.

Plank is a simple dock that shows icons of running applications / windows. The application allows pinning applications to the dock, and comes with a few built-in simple "docklets": a clipboard manager, clock, CPU monitor, show desktop and trash. To access its settings, hold down the `Ctrl` key while right clicking anywhere on the Plank dock, and then clicking on `Preferences` .

Plank is used by default in elementary OS, but it can be used on any desktop environment or Linux distribution you wish.

### Install autoplank

On its GitHub page, it's mentioned that you need Go 1.8 or newer to build autoplank but I was able to successfully build it with Go 1.6 in Ubuntu 16.04 (elementary OS 0.4 Loki).

The developer has said on

**1\. Install required dependencies.**

To build autoplank you'll need Go (`golang-go` in Debian, Ubuntu, elementary OS, etc.). To get the latest Git code you'll also need `git` , and for detecting the monitor on which you move the mose, you'll also need to install `xdotool` .

Install these in Ubuntu, Debian, elementary OS and so on, by using this command:
```
sudo apt install git golang-go xdotool

```

**2\. Get the latest autoplank from[Git][1], build it, and install it in** `/usr/local/bin` :
```
git clone https://github.com/abiosoft/autoplank
cd autoplank
go build -o autoplank
sudo mv autoplank /usr/local/bin/

```

You can remove the autoplank folder from your home directory now.

When you want to uninstall autoplank, simply remove the `/usr/local/bin/autoplank` binary (`sudo rm /usr/local/bin/autoplank`).

**3\. Add autoplank to startup.**

If you want to try autoplank before adding it to startup or creating a systemd service for it, you can simply type `autoplank` in a terminal to start it.

To have autoplank work between reboots, you'll need to add it to your startup applications. The exact steps for doing this depend on your desktop environments, so I won't tell you exactly how to do that for every desktop environment, but remember to use `/usr/local/bin/autoplank` as the executable in Startup Applications.

In elementary OS, you can open `System Settings` , then in `Applications` , on the `Startup` tab, click the `+` button in the bottom left-hand side corner of the window, then add `/usr/local/bin/autoplank` in the `Type in a custom command` field:

![](https://4.bp.blogspot.com/-hbh1PLDX-0A/W22eIhEQ1iI/AAAAAAAABWM/GkgrzaPPjA8CHnxF5L4UPPUG_vPa9VT-gCLcBGAs/s640/autoplank-startup-elementaryos.png)

**Another way of using autoplank is by creating a systemd service for it, as explained[here][3].** Using a systemd service for autoplank has the advantage of restarting autoplank if it crashes for whatever reason. Use either the systemd service or add autoplank to your startup applications (don't use both).

**4\. After you do this, logout, login and autoplank should be running so you can move the mouse at the bottom of a monitor to move Plank dock there.**


--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/08/use-plank-on-multiple-monitors-without.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://github.com/abiosoft/autoplank
[2]:https://answers.launchpad.net/plank/+question/204593
[3]:https://github.com/abiosoft/autoplank#optional-create-a-service
[4]:https://www.reddit.com/r/elementaryos/comments/95a879/autoplank_use_plank_on_multimonitor_setup/e3r9saq/
