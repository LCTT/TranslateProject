[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Streaming Australian TV Channels to a Raspberry Pi)
[#]: via: (https://blog.dxmtechsupport.com.au/streaming-australian-tv-channels-to-a-raspberry-pi/)
[#]: author: (James Mawson https://blog.dxmtechsupport.com.au/author/james-mawson/)

Streaming Australian TV Channels to a Raspberry Pi
======

If you’re anything like me, it’s been years since you’ve even thought about hooking an antenna to your television. With so much of the good stuff available by streaming and download, it’s easy go a very long time without even thinking about free-to-air TV.

But every now and again, something comes up – perhaps the cricket, news and current affairs shows, the FIFA World Cup – where the easiest thing would be to just chuck on the telly.

When I first started tinkering with the Raspberry Pi as a gaming and media centre platform, the standard advice for watching broadcast TV always seemed to involve an antenna and a USB TV tuner.

Which I guess is fine if you can be arsed.

But what if you utterly can’t?

What if you bitterly resent the idea of more clutter, more cords to add to the mess, more stuff to buy? What if every USB port is precious and jealously guarded for your keyboard, mouse, game controllers and removable storage? What if the wall port for your roof antenna is in a different room?

That’s all a bit of a hassle for a thing you might use only a few times a year.

In 2018, shouldn’t we just be able to stream free TV from the internet?

It turns out that, yes, we can access legal and high quality TV streams from any Australian IP using [Freeview][1]. And thanks to a cool Kodi Add-on by [Matt Huisman][2], it’s now really easy to access this service from a Raspberry Pi.

I’ve tested this to work on a Model 3 B+ running Retropie 4.4 and Kodi 17.6. But it should work similarly for other models and operating systems, so long as you’re using a reasonably up-to-date version of Kodi.

Let’s jump right in.

### If You Already Have Kodi Installed

If you’re already using your Raspberry Pi to watch movies and TV shows, there’s a good chance you’ve already installed Kodi.

Most Raspberry Pi operating systems intended for media centre use – such as OSMC or Xbian – come with Kodi installed by default.

It’s fairly easy to get running on other Linux operating systems, and you might have already installed it there too.

If your version of Kodi is more than a year or so old, it might be an idea to update it. The following instructions are written for the interface on Kodi 17 (Krypton).

You can do that by typing the following commands at the command line:

```
sudo apt-get update
sudo apt-get upgrade
```

And now you can skip ahead to the next section.

### Installing Kodi

Installing Kodi on Retropie and other versions of Raspbian is fairly simple. Other Linux operating systems should be able to run it, perhaps with a bit of coaxing.

You will need to be connected to the internet to install it.

If you’re using something, such as Risc OS – you probably can’t install kodi. You will need to either swap in another SD card, or use a boot loader to boot into a media centre OS for your TV viewing.

#### Installing Kodi on Retropie

It’s really easy to install Kodi using the Retropie menu system.

Here’s how:

  1. Navigate to the Retropie main screen – that’s that horizontal menu where you can scroll left and right through all your different consoles
  2. Select “Retropie”
  3. Select “Retropie setup”
  4. Select “Manage Packages”
  5. Select “Manage Optional Packages”
  6. Scroll down and select “Kodi”
  7. Select “Install from Binary”



This will take a minute or two to install. Once it’s installed, you can exit out of the Retropie Setup screen. When you next restart Retropie, you will see Kodi under the “Ports” section of the Retropie main screen.

#### Installing Kodi on Raspbian

If you’re running Raspbian without Retropie. But that’s okay, because it’s pretty easy to do it from the command line

Just type:

```
sudo apt-get update
sudo apt-get install kodi
```

At this point you have a vanilla installation of Kodi. You can run it by typing:

```
kodi
```

It’s possible to delve a lot further into setting up Kodi from the command line. Check out [this guide][3] if you’re interested.

If not, what you’ve just installed will work just fine.

#### Installing Kodi on Other Versions of Linux

If you’re using a different flavour of Linux, such as Pidora or Arch Linux ARM, then the above might or might not work – I’m not really sure, because I don’t really use these operating systems.

If you get stuck, it might be worth a look at the [how-to guide][4] on the Kodi wiki.

#### Dual Booting a Media Centre OS

If your operating system of choice isn’t suitable for Kodi – or is just too confusing and difficult to figure out – it might be easiest to use a boot loader for multiple operating systems on the one SD card.

You can set this up using an OS installer like [PINN][5].

Using PINN, you can install a media centre OS like [OSMC][6] to use Kodi – it will be installed with the operating system – and then your preferred OS for your other uses.

It’s even possible to [move your existing OS over][7].

### Adding Australian TV Channels to Kodi

With Kodi installed and running, you’ve got a pretty good media player for the files on your network and hard drive.

But we need to install an add-on if we want to use it to chuck on the telly. This only takes a minute or so.

#### Installing Matt Huisman’s Kodi Repository

Ready? Let’s get started.

  1. Open Kodi
  2. Click the cog icon at the top left to enter the settings
  3. Click “System Settings”
  4. Select “Add-ons”
  5. Make sure that “Unknown Sources” is enabled
  6. Right click anywhere on the screen to navigate back to the settings menu
  7. Click “File Manager”
  8. Click “Add Source”
  9. Double-click “Add Source”
  10. Select “<None>”
  11. Type in exactly **<http://k.mjh.nz>**
  12. Select “OK”
  13. Click the text input underneath the label “Enter a name for this media source.”
  14. Type in exactly **MJH**
  15. Click “OK”
  16. Right click twice anywhere on the screen to navigate back to the main menu
  17. Select “Add-ons”
  18. Click “My Add-ons”
  19. Click “..”
  20. Click “Install from zip file”
  21. Click “MJH”
  22. Select “repository.matthuisman.zip”



The repository is now installing.

If you get stuck with any of this, here’s a video from Matt that starts by installing the repository.

<https://www.youtube.com/embed/LWYg6WS1WoU?feature=oembed>

#### Installing the Freeview Australia Add-On

We’re nearly there! Just a few more steps.

  1. Right click anywhere on the screen a couple of times to navigate back to the main menu
  2. Select “Add-ons”
  3. Click “My add-ons”
  4. Click “..”
  5. Click “Install from repository”
  6. Click “MattHuisman.nz Repository”
  7. Click “Video add-ons”
  8. Click “AU Freeview”
  9. Click “Install”



You can now have every free-to-air TV channel in your Add-ons main menu item.

### Watching TV

When you want to chuck the telly on, all you need to do is click “AU Freeview” in the Add-ons main menu item. This will give you a list of channels to browse through and select.

If you want, you can also add individual channels to your Favourites menu by right clicking them and selecting “Add to favourites”.

By default you will be watching Melbourne television. You can change the region by right clicking on “AU Freeview” and clicking “settings”.

When you first tune in, it sometimes jumps a bit for a few seconds, but after that it’s pretty smooth.

After spending a few minutes with this, you’ll quickly realise that free-to-air TV hasn’t improved in the years since you last looked at. Unfortunately, I don’t think there’s a fix for that.

But at least it’s there now for when you want it.

--------------------------------------------------------------------------------

via: https://blog.dxmtechsupport.com.au/streaming-australian-tv-channels-to-a-raspberry-pi/

作者：[James Mawson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.dxmtechsupport.com.au/author/james-mawson/
[b]: https://github.com/lujun9972
[1]: http://www.freeview.com.au/
[2]: https://www.matthuisman.nz/
[3]: https://www.raspberrypi.org/forums/viewtopic.php?t=192499
[4]: https://kodi.wiki/view/HOW-TO:Install_Kodi_for_Linux
[5]: https://github.com/procount/pinn
[6]: https://osmc.tv/
[7]: https://github.com/procount/pinn/wiki/How-to-Create-a-Multi-Boot-SD-card-out-of-2-existing-OSes-using-PINN
