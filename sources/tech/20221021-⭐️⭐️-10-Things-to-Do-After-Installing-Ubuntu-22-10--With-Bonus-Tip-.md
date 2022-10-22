[#]: subject: "10 Things to Do After Installing Ubuntu 22.10 [With Bonus Tip]"
[#]: via: "https://www.debugpoint.com/things-to-do-ubuntu-22-10/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

10 Things to Do After Installing Ubuntu 22.10 [With Bonus Tip]
======

**Here’s our recommended list of 10 things after installing Ubuntu 22.10 “Kinetic Kudu” (GNOME Edition).**

![][1]

Ubuntu 22.10 brings exciting new features such as GNOME 43, the latest Kernel, a newly re-designed tray menu, Files features, Pipewire and [many more][2].

I am sure you are excited to try them.

But wait.

Before you head over to enjoy a new installation of Ubuntu, here’s an assorted list of customization tips which you can’t miss.

### 10 Things to Do After Installing Ubuntu 22.10

#### 1. Update your system

The first thing you need to do after installing Ubuntu 22.10 is to update your system. Often, the latest ISO may not contain all the updates due to time differences. So, to update your system, oprn a terminal window and run the following commands.

```
sudo apt update && sudo apt upgrade
```

Once the commands are complete, you can proceed to the next steps.

#### 2. Remove Firefox Snap and install Flatpak or deb

Since Ubuntu 21.10 last year, the default web browser Firefox comes as a Snap package. Now, if you are an average user, this may not be a problem or a thing to worry about. But many users may not like the Snap package of Firefox for several reasons. For example, the startup time is slow. Unnecessary Snap update notifications when there is a backend update and so on.

So, to completely remove Firefox as Snap, you can follow the guide [on this page][3] that I have written. It’s a little complex and may take time. And install a deb version of Firefox from PPA or use the [Flatpak version][4].

As I said, this is an optional tip; you may skip it if you want.

#### 3. Install and Enable Flatpak

While every distribution today ships Flatpak by default, Ubuntu does not. Because it promotes its own sandboxing technology Snap.

But Flatpak applications are the best for everyone. It helps you to quickly install and use several applications without worrying about dependency and other things.

Most of the Flatpak applications are present in a centralised repo @ Flathub.

To enable Flatpak applications in Ubuntu 22.10, follow the below commands.

```
sudo apt install flatpakflatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakreporeboot
```

Also, if you want to learn more about this process, [read this nice guide][5], we published a while ago.

#### 4. Review privacy settings

I recommend you opt out of any data collection after installing Ubuntu. Everyone knows that it’s difficult to protect your privacy over the internet, no matter how hard you try. These little steps matter.

To configure the privacy, open Settings and select Privacy. Then review the settings listed under privacy.

Also, ensure to disable backend reporting to Ubuntu servers with your usage. Run the following command to do that. Unfortunately, there is no option in the settings to disable it.

```
sudo ubuntu-report -f send no
```

![Turn off location services in Ubuntu 22.10][6]

#### 5. Explore GNOME 43 Features

The most visual and functional change coming in this release is GNOME 43. This is going to impact everyone and your workflow. Because there are some fundamental and core changes. GNOME 43 brings a new pill-shaped tray menu and updated native applications with new features such as Files and GNOME Web.

Do go over the detailed [GNOME 43 features][7] here to learn more. Or explore them yourself.

![Quick Settings Demo in GNOME 43][8]

#### 6. Ensure the audio works with Pipewire

If you work with Audio primarily or your workflow deals with sound capture, playback and other stuff, then make sure your Audio works properly in Ubuntu 22.10, wired or via Bluetooth.

Because there is a change in the audio server in this release for the first time in many years. The legacy PulseAudio is now replaced by the modern Pipewire. So it’s important for you to verify.

#### 7. Install additional packages

It’s important to ensure you can play all video and audio formats on your Ubuntu desktop. If you skipped the extra package installation during the setup, you could install them via the below commands.

```
sudo apt install ubuntu-restricted-extras
```

This should settle any video or audio playback problem in Ubuntu. Especially with GNOME Videos which can’t play anything by default.

#### 8. Setup basic apps

The base Ubuntu with GNOME comes with a very basic set of applications. Hence, it’s almost necessary for everyone to install applications before you use Ubuntu.

Now, necessary apps are different for everyone due to diverse workflow. Hence, here’s a quick list of generic apps which I think you can go ahead and install since they are preety much common for all.

- GIMP – Advanced photo editor
- VLC – Media play that plays anything without the need for additional codecs
- Leafpad – A lightweight text editor (even lightweight from default gedit)
- Synaptic – A far better package manager

Command to install them:

```
sudo apt install -y gimp vlc leafpad synaptic
```

#### 9. Get some GNOME Extensions

You can extend your GNOME 43’s functionality using several cool extensions. That includes customizing the top bar, tray, changing the adwaita accent colour further and more. So, to do that, make sure you install the GNOME Extension manager first via Flatpak using the command below.

```
flatpak install flathub com.mattjakeman.ExtensionManager
```

And once you do, you can go ahead with any extensions you want by searching for them in the above app. However, here’s a quick set of necessary extensions which I feel are perfect for your brand-new Ubuntu desktop. You can simply search with these names in the Extension manager apps.

- Caffeine
- Custom Hot Corners
- Dash to Dock
- Blur my shell
- Gradients
- Hide Activities Button
- Net speed simplified

#### 10. Prepare backup

Last but not least, make sure you prepare for backup from the beginning. We always feel the necessity for backup when we run into difficult situations. To do that, the ideal app is Timeshift – which is easy to install and use.

Here’s the set of commands you can run from the terminal to install. And after installation, you can open and follow the on-screen instructions to set up a backup.

```
sudo add-apt-repository -y ppa:teejee2008/ppasudo apt-get updatesudo apt-get install timeshift
```

### Bonus Tips

If you want to customize your new Ubuntu installation further, here are some bonus tips for you.

#### Install nice fonts

Fonts impact everything. It’s one of the small yet impactful settings. However, Ubuntu comes with a default “Ubuntu regular” font, which is also good.

But you can also go ahead and install some nice fonts from Ubuntu’s official repo. Here is some command to install them.

```
sudo apt install fonts-roboto fonts-cascadia-code fonts-firacode
```

After installation, you can change the font using the [GNOME Tweak tool][9].

#### Install TLP

You must take care of your laptop battery if you are a heavy laptop user. While no battery is everlasting, you can still take some steps to ensure it lasts longer. The TLP is one of the best programs available in Linux, which helps to do that automatically. All you need to do is install it using the following command and run.

```
sudo apt install tlp
```

As per the recommendation, always keep the battery strength between 50% to 80%. Don’t overcharge or let it discharge below 50%. Don’t keep it plugged into power continuously.

### Wrapping Up

So, there you have it. Ten gettings started tips with some bonus for your Ubuntu desktop journey.

I hope this helps and that you get to install & tweak your desktop with further customization. That said, do let me know what is your best after-install tips in Ubuntu in the comment box.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/things-to-do-ubuntu-22-10/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/10/u2210-things-hd-1024x576.jpg
[2]: https://www.debugpoint.com/ubuntu-22-10/
[3]: https://www.debugpoint.com/remove-firefox-snap-ubuntu/
[4]: https://flathub.org/apps/details/org.mozilla.firefox
[5]: https://www.debugpoint.com/how-to-install-flatpak-apps-ubuntu-linux/
[6]: https://www.debugpoint.com/wp-content/uploads/2022/10/Turn-off-location-services-in-Ubuntu-22.10.jpg
[7]: https://www.debugpoint.com/gnome-43/
[8]: https://www.debugpoint.com/wp-content/uploads/2022/08/Quick-Settings-Demo-in-GNOME-43.gif
[9]: https://www.debugpoint.com/customize-your-ubuntu-desktop-using-gnome-tweak/
