Translating by XLCYun.
A Week With GNOME As My Linux Desktop: What They Get Right & Wrong - Page 4 - GNOME Settings
================================================================================
### Settings ###

There are a few specific KDE Control modules that I am going to pick at, mostly because they are so laughable horrible compared to their gnome counter-part that its honestly pathetic.

First one up? Printers.

![](http://www.phoronix.net/image.php?id=gnome-week-editorial&image=gnome_week_printers1_show&w=1920)

Gnome is on the left, KDE is on the right. You know what the difference is between the printer applet on the left, and the one on the right? When I opened up Gnome Control Center and hit "Printers" the applet popped up and nothing happened. When I opened up KDE System Settings and hit "Printers" I got a password prompt. Before I was even allowed to LOOK at the printers I had to give up ROOT'S password.

Let me just re-iterate that. In this, the days of PolicyKit and Logind, I am still being asked for Root's password for what should be a sudo operation. I didn't even SETUP root's password when I installed the system. I had to drop down to Konsole and run 'sudo passwd root' so that I could GIVE root a password so that I could go back into System Setting's printer applet and then give up root's password to even LOOK at what printers were available. Once I did that I got prompted for root's password AGAIN when I hit "Add Printer" then I got prompted for root's password AGAIN after I went through and selected a printer and driver. Three times I got asked for ROOT'S password just to add a printer to the system.

When I added a printer under Gnome I didn't get prompted for my SUDO password until I hit "Unlock" in the printer applet. I got asked once, then I never got asked again. KDE, I am begging you... Adopt Gnome's "Unlock" methodology. Do not prompt for a password until you really need one. Furthermore, whatever library is out there that allows for KDE applications to bypass PolicyKit / Logind (if its available) and prompt directly for root... Bin that code. If this was a multi-user system I either have to give up root's password, or be there every second of every day in order to put it in any time a user might have to update, change, or add a new printer. Both options are completely unacceptable.

One more thing...

![](http://www.phoronix.net/image.php?id=gnome-week-editorial&image=gnome_week_printers2_show&w=1920)

![](http://www.phoronix.net/image.php?id=gnome-week-editorial&image=gnome_week_printers3_show&w=1920)

Question to the forums: What looks cleaner to you? I had this realization when I was writing this article: Gnome's applet makes it very clear where any additional printers are going to go, they set aside a column on the left to list them. Before I added a second printer to KDE, and it suddenly grew a left side column, I had this nightmare-image in my head of the applet just shoving another icon into the screen and them being listed out like preview images in a folder of pictures. I was pleasantly surprised to see that I was wrong but the fact that the applet just 'grew' another column that didn't exist before and drastically altered its presentation is not really 'good' either. It's a design that's confusing, shocking, and non-intuitive.

Enough about printers though... Next KDE System Setting that is up for my public stoning? Multimedia, Aka Phonon.

![](http://www.phoronix.net/image.php?id=gnome-week-editorial&image=gnome_week_sound_show&w=1920)

As always, Gnome's on the left, KDE is on the right. Let's just run through the Gnome setting first... The eyes go left to right, top to bottom, right? So let's do the same. First up: volume control slider. The blue hint against the empty bar with 100% clearly marked removes all confusion about which way is "volume up." Immediately after the slider is an easy On/Off toggle that functions a mute on/off. Points to Gnome for remembering what the volume was set to BEFORE I muted sound, and returning to that same level AFTER I press volume-up to un-mute. Kmixer, you amnesiac piece of crap, I wish I could say as much about you.

Moving on! Tabbed options for Output, Input and Applications? With per application volume controls within easy reach? Gnome I love you more and more with every passing second. Balance options, sound profiles, and a clearly marked "Test Speakers" option.

I'm not sure how this could have been implemented in a cleaner, more concise way. Yes, it's just a Gnome-ized Pavucontrol but I think that's the point. Pavucontrol got it mostly right to begin with, the Sound applet in Gnome Control Center just refines it slightly to make it even closer to perfect.

Phonon, you're up. And let me start by saying: What the fsck am I looking at? -I- get that I am looking at the priority list for the audio devices on the system, but the way it is presented is a bit of a nightmare. Also where are the things the user probably cares about? A priority list is a great thing to have, it SHOULD be available, but it's something the user messes with once or twice and then never touches again. It's not important, or common, enough to warrant being front and center. Where's the volume slider? Where's per application controls? The things that users will be using more frequently? Well.. those are under Kmix, a separate program, with its own settings and configuration... not under the System Settings... which kind of makes System Settings a bit of a misnomer. And in that same vein, Let's hop over to network settings.

![](http://www.phoronix.net/image.php?id=gnome-week-editorial&image=gnome_week_network_show&w=1920)

Presented above is the Gnome Network Settings. KDE's isn't included because of the reason I'm about to hit on. If you go to KDE's System Settings and hit any of the three options under the "Network" Section you get tons of options: Bluetooth settings, default username and password for Samba shares (Seriously, "Connectivity" only has 2 options: Username and password for SMB shares. How the fsck does THAT deserve the all-inclusive title "Connectivity"?), controls for Browser Identification (which only work for Konqueror...a dead project), proxy settings, etc... Where's my wifi settings? They aren't there. Where are they? Well, they are in the network applet's private settings... not under Network Settings...

KDE, you're killing me. You have "System Settings" USE IT!

--------------------------------------------------------------------------------

via: http://www.phoronix.com/scan.php?page=article&item=gnome-week-editorial&num=4

作者：Eric Griffith
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出
