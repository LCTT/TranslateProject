KDE Plasma 5—For those Linux users undecided on the kernel’s future
================================================================================
> Review—new release straddles traditional desktop needs, long term multi-device plans.

Finally, the KDE project has released KDE Plasma 5, a major new version of the venerable K Desktop Environment.

Plasma 5 arrives in the middle of an ongoing debate about the future of the Linux desktop. On one hand there are the brand new desktop paradigms represented by GNOME and Unity. Both break from the traditional desktop model in significant ways, and both attempt to create interfaces that will work on the desktop and the much-anticipated, tablet-based future (which [may or may not ever arrive][1]).

Linux desktops like KDE, XFCE, LXDE, Mate, and even Cinnamon are the other side of the fence. None has re-invented itself too much. They continue to offer users a traditional desktop experience, which is not to say these projects aren't growing and refining. All of them continue to turn out incremental releases that fine tune what is a well-proven desktop model.

![Ubuntu's Unity desktop](http://cdn.arstechnica.net/wp-content/uploads/2014/08/screenshot-unity.png)
Ubuntu's Unity desktop

![GNOME 3 desktop](http://cdn.arstechnica.net/wp-content/uploads/2014/08/screenshot-gnome.png)
GNOME 3 desktop

GNOME and Unity end up getting the lion's share of attention in this ongoing debate. They're both new and different. They're both opinionated and polarizing. For every Linux user that loves them, there's another that loves to hate them. It makes for, if nothing else, lively comments and forum posts in the Linux world. But the difference between these two Linux camps is about more than just how your desktop looks and behaves. It's about what the future of computing looks like.

GNOME and Unity believe that the future of computing consists of multiple devices all running the same software—the new desktop these two create only makes sense within this vision. These new versions aren't really built as desktops for the future, but they include a hybrid desktop fallback mode for now and appear to believe in devices going forward. The other side of the Linux schism largely seems to ignore those.

And unlike the world of closed source OSes—where changes are handed down, like them or leave them—the Linux world is in the middle of a conversation about these two opposite ideas.

For users, it can be frustrating. The last thing you need when you're trying to get work done is an update that completely changes your desktop, forcing you to learn new ways of working. Even the best case scenario, moving to another desktop when your old favorite suddenly veers off in a new direction, usually means jettisoning years of muscle memory and familiarity.

Luckily, there's a simple way to navigate this mess and find the right desktop for you. Here it is in a nutshell: do you want to bend your will to your desktop or do you want to bend your desktop to your will?

If you fall in the first camp and don't mind learning new ways of working, Unity and GNOME 3 will be your best bets. If you fall in the latter camp, XFCE, Cinnamon, Mate, and a host of others will all likely prove a good fit. And even if you want to go non-traditional in a different direction from GNOME 3 and Unity, there's always Xmonad, Ratpoison, and others that very few Linux users will ever try. (This is a small shame, as Xmonad may be the best thing in Linux since Linus said, uh, hey, here's a kernel for your GNU system.)

![KDE Plasma 5's new boot screen.](http://cdn.arstechnica.net/wp-content/uploads/2014/08/screenshot01.png)
KDE Plasma 5's new boot screen.

So what about the undecided Linux users, all those people in the middle? You like the traditional desktop experience, and you're not ready to give up your menu and shortcuts for HUDs and other new tools. But at the same time, you're curious about tablets and other form factors, and you want something that will work across them all. You, my hypothetical friend, are an excellent candidate for the brand new KDE Plasma 5.

KDE is attempting to do something no other desktop in Linux has tried to date—move toward the tablet and mobile device future while still producing a desktop experience that's familiar, functional, and infinitely customizable.

### KDE Plasma 5 and the world of "convergence" ###

KDE users who made it through the transition from KDE 3.5 to 4 likely still flinch at the mention of a major upgrade to any part of KDE, but there's good news for KDE fans in Plasma 5. This is a major update, yes, but it comes with a handful of exceptions (which I'll get into in a minute because you'd never know it).

It turns out that the incredibly bumpy move to KDE 4 really did lay the groundwork for a better future—we are now in that future.

With this update, KDE is laying future groundwork in a less disruptive way. We're referring to an inevitable move to tablets and other form factors, but fear not. KDE seems poised to do what GNOME and Unity could not—branch out to other form factors without abandoning the traditional desktop. In other words, this release resisted the urge to mess with the tried and true just because something new is on the horizon.

(As a quick aside: You'd be forgiven for not remembering this, but the whole convergence thing that Canonical goes on about with each new Unity update? KDE started using the word "convergence" way back when Canonical was still running user tests to determine the optimal shade of brown for GNOME 2 menus.)

With KDE Frameworks 5, Qt5, and some other updates to the plumbing that come along with Plasma 5, KDE's version of convergence is here. It's simply under the hood where it belongs.

So while the components are there to allow the KDE project and its developers to build different interfaces—KDE calls these new frameworks the "converged Plasma shell," which is what loads up the desktop in Plasma 5—the Plasma 5 desktop is, thus far, the only interface. KDE plans to build out others, but the [official release announcement][2] for Plasma 5 says that "a tablet-centric and media center user experience are under development."

In this sense, KDE's vision of convergence is not unlike what Ubuntu envisions; the user interface will change based on the device and hardware. For example, you might have the "tablet-centric" interface that's in the works running while you're reading the Web on the couch. But get up, walk back to your office, connect to your wireless keyboard, and the interface shifts to something more keyboard-friendly.

This scenario has some potential problems, some of which Windows 8 users are likely already familiar with. For example, what will happen when a keyboard is plugged in, but you still want to interact with the screen via touch? What happens if you plug in a mouse, but you still want to scroll with your fingers?

We mention these small points not to say that KDE hasn't thought them through (here's hoping they have), but because this idea of "convergence" of adaptive user interfaces will be very difficult to get right. And one thing KDE has long had that gives users hope for the project's success is limitless configurability.

The hope for KDE on a tablet is that any user would be able to configure every last detail of the experience. Simply put, there would be a way for you to determine what you want to happen when a keyboard is detected rather than letting the OS determine it.

### The Plasma 5 desktop ###

KDE Plasma 5 is KDE 4 evolved rather than any kind of revolutionary new interface.

![The KDE Plasma 5 desktop.](http://cdn.arstechnica.net/wp-content/uploads/2014/08/screenshot02.png)
The KDE Plasma 5 desktop.

We've been using this release—still not completely stable during testing, though most of the glitches have been graphical, not data threatening—for over a month now in virtual machines. We've been dual booting on a Retina MacBook Pro and, to see how well it holds up on older hardware, an aging, underpowered Toshiba laptop. KDE Plasma 5 was tested using Kubuntu (virtual machine and the Toshiba) and atop a fresh install of Arch Linux (dual boot MacBook).

If you'd like to try out Plasma 5, the simplest way is to grab the [Neon live CD available from KDE][3]. That will get you Plasma with Ubuntu under the hood. If you want to commit and test it on an existing Kubuntu install, here are the commands for that:

    sudo add-apt-repository ppa:neon/kf5
    sudo apt-get update
    sudo apt-get install project-neon5-session project-neon5-utils project-neon5-konsole project-neon5-breeze project-neon5-plasma-workspace-wallpapers

Restart your machine and you should see a new option at the login screen offering to start up a Neon session.

Once you have Plasma 5 up and running, the first thing you'll notice is the new default KDE theme, known as Breeze.

### Plasma 5's Breezy new look ###

Breeze is what KDE refers to as a modernized interface, with "reduced visual clutter throughout the workspace." Sure enough, the busy, somewhat cluttered feel that has long been a part of the default KDE look is gone.

![The KDE Plasma 5 desktop's Breeze theme is most complete in the Kickoff menu. Note the type to search message.](http://cdn.arstechnica.net/wp-content/uploads/2014/08/screenshot03.png)
The KDE Plasma 5 desktop's Breeze theme is most complete in the Kickoff menu. Note the type to search message.

The entire interface has been flattened out, with bigger fonts, better contrast, and a sort of flat, "frosted" look that's somewhere between OS X Yosemite, Android L, and KDE 4.x. That's not to say KDE ripped off Apple or Google. They couldn't have, since Plasma 5 and the Breeze theme were well on their way before Apple revealed Yosemite or Google announced Android L.

Still, while it would be incorrect to say KDE has ripped anyone off, Breeze's visual design and overall aesthetic are very much a product of its time. In that sense it looks "modern," so long as you define modern to mean lots of strong type, few textures or outlines, lots of translucency, and monochrome iconography.

KDE's designers have put a lot of work into Breeze and it shows. This isn't just a new coat of paint. Breeze makes KDE more approachable out of the box with cleaned up menus, a less cluttered notification center, and a revamped Kickoff start menu.

![A cleaner, less nagging notification center.](http://cdn.arstechnica.net/wp-content/uploads/2014/08/screenshot04.png)
A cleaner, less nagging notification center.

How much Breeze matters depends on whether or not you'll ever even use it. KDE tends to attract users that like customizing their systems, which, presumably, includes customizing the theme. One thing to look forward to is what distros that heavily customize the default KDE theme—notably OpenSUSE—will do now that Breeze provides a somewhat higher starting bar.

Currently, most distros will likely not jump on Breeze, since it is very much a work in progress. And coincidently, Breeze is where you'll notice some of the first signs of incompleteness in Plasma 5. While the Kickoff menu has some nice new icons, much of the rest of the interface does not. And as of the latest updates available in the Kubuntu ppa, Breeze does not use its new Window Decorations. The Window Decorations are installed, but they aren't turned on by default. You can head to the System Settings app and turn them on for a more complete, though possibly buggier, Breeze experience.

![Top is the default Oxygen Window Decorations, bottom the new Breeze theme.](http://cdn.arstechnica.net/wp-content/uploads/2014/08/screenshot05.png)
Top is the default Oxygen Window Decorations, bottom the new Breeze theme.

Not everything is ideal, and sometimes it's hard to tell what's a bug or incomplete feature and what is just poorly designed. For example, there's quite a bit of window and overlay translucency in Breeze, some of which looks nice. At other times, this gets in the way. Stacked windows and preview overlays bleed into what's behind them and become hard to read in the background. Pulling them to the foreground solves the problem, but it's hard to say what the value of the transparency is in this case.

![Transparency... why?](http://cdn.arstechnica.net/wp-content/uploads/2014/08/screenshot06.png)
Transparency... why?

So yes, Breeze is still a work in progress, and not just in terms of features and design; things are still being worked out in terms of genuine bugs and glitches. We have encountered some unexpected behavior accordingly, particularly with regard to screen redraws. Those happen frequently and slow enough to notice. Windows disappear at times, and the menu bar occasionally only draws half of itself.

Plasma 5 has never crashed during our testing, nor has it lost any data. But be warned—little visual glitches abound. We would suggest waiting for things to stabilize and for the distro of your choice to integrate it before jumping in with both feet.

### Plasma menus go vertical ###

Breeze gives Plasma 5 a new look, but there are also a number of changes in behavior. For example, both the widget explorer and the alt-tab window switcher are now vertically oriented and located in the same place by default—the far left side of the screen.

![The default look for the alt-tab switcher menu.](http://cdn.arstechnica.net/wp-content/uploads/2014/08/screenshot07.png)
The default look for the alt-tab switcher menu.

While that consistency is probably good for KDE newcomers, who need to learn to expect that various stuff will appear to the left of the screen, it can be a little frustrating for long-time users anticipating something else. Some of these changes seem somewhat arbitrary.

![The widget explorer menu.](http://cdn.arstechnica.net/wp-content/uploads/2014/08/screenshot08.png)
The widget explorer menu.

The KDE project claims the shift to vertical instead of horizontal lists, in things like the widget explorer and window switcher, "provide better usability." It stops short of saying how exactly. The release docs claim that moving the window switcher to the side of the screen "shifts the user's focus towards the applications and documents, clearing the stage for the task at hand." But if you only call up the window switcher when you're, ahem, switching windows, then it seems more likely that the user is between tasks rather than involved in one.

![KDE still loves offering options. Notice the dark gray bar to the right that's an artifact (glitch) from dragging the window.](http://cdn.arstechnica.net/wp-content/uploads/2014/08/screenshot09.png)
KDE still loves offering options. Notice the dark gray bar to the right that's an artifact (glitch) from dragging the window.

This is KDE, though, not Unity; infinite customization is a feature, not a bug. A trip to the System Settings will get your old style window switcher back, and there are some 10 different visual possibilities for the window switcher in Plasma 5. If the default is not to your liking, customize away.

### So long Nepomuk, thanks for all the spinning fans ###

If you're a heavy user of KDE's sometimes awesome, sometimes not, search features, this may be the biggest news in Plasma 5. It's true, KDE has ditched Nepomuk in favor of a new search engine known as Baloo.

Nepomuk started life as an EU-funded metadata search project, with the lofty-sounding goal of creating a "Networked Environment for Personalized, Ontology-based Management of Unified Knowledge." By the time it trickled down to the KDE project, Nepomuk became a somewhat more mundane desktop search tool that alternated between brilliant and maddening.

![Searching for files in Plasma 5.](http://cdn.arstechnica.net/wp-content/uploads/2014/08/screenshot10.png)
Searching for files in Plasma 5.

Baloo takes much of what made Nepomuk great—namely, full text file search and an uncanny ability to pick up on relationships between files, for example, knowing that particular document is related to a contact—and [improves it][4]. Actually use the search features in Plasma 5 and you'll notice two things right off the bat: it's faster and your fan doesn't go haywire every time something new is indexed.

Baloo significantly reduces the resource footprint of searching and, according to KDE, is more accurate. We can't vouch for the latter, since we never used search much in older versions of KDE (see fan spinning comments), but in terms of accuracy, simple file searches in Plasma 5 are on par with what you'll find in Ubuntu, OS X, and elsewhere. The success of more complex searches involving relationships or complex metadata will vary depending on how much you use the default KDE apps. For example, you need to use the Kontact Suite if you want to take advantage of Baloo-based searches involving relationships between contacts and files.

That will likely change as time goes on, though, because another big change from Nepomuk is the new, improved developer API. The API for searching means third-party apps can tie in Plasma 5's Semantic Search infrastructure and take advantage of the same tools the default apps use.

Curiously, for something that has seen as much work as Baloo has, the visibility and discoverability of the search feature has taken a step backward. Fire up Plasma 5's Kickoff menu—KDE's answer to the Windows Start menu—and search is nowhere to be found. If you look closely, you'll see a tiny little reminder to "type to search," which is a step up from the first release (which had no indication that you could search). Still, this isn't as discoverable as a dedicated search box.

### Kickoff and its new cousin, Kicker ###

KDE's answer to the Windows Start button has always been overkill in these eyes, packing too much in too little space, but with Breeze the menu has been cleaned up a bit and feels less visually overwhelming.

![The Kickoff menu in the default theme.](http://cdn.arstechnica.net/wp-content/uploads/2014/08/screenshot11.png)
The Kickoff menu in the default theme.

If it's still a bit too much for your needs, Plasma 5 offers a new, more traditional menu-based launcher called Kicker. Kicker does less—it's much closer to the Start menu in XP, a single, narrower pane that offers expanding menus where needed—and makes a lightweight alternative if all you want to do is launch applications and files. It also has a very obvious search box.

![The new Kicker menu option.](http://cdn.arstechnica.net/wp-content/uploads/2014/08/screenshot12.png)
The new Kicker menu option.

The other side of the menu bar has been revamped and cleaned up a bit as well. The most notable change is the notification app, which seems to kick up fewer notifications and does a better job of displaying them and quickly getting them out of the way.

### OpenGL, QtQuick, and HiDPI Screens ###

Plasma 5 finishes up KDE's migration to Qt 5 and QtQuick, the latter of which uses a hardware-accelerated OpenGL scenegraph to render graphics. Most of what's new with OpenGL pertains to offloading graphics to any available GPU. That means, provided you've got the hardware for it, Plasma 5 can take full advantage of today's powerful GPUs.

Indeed, on newish hardware (our test MacBook's NVIDIA GeForce GT graphics card, for example) Plasma 5 is snappy, considerably snappier than its predecessor. Perhaps even more impressive, take away whatever GPU advantage Plasma 5 might gain over KDE 4.x systems, and it still feels faster. That is, running on older hardware still isn't KDE's strong point, but the story is better than it used to be. Still, if you're looking to get some extra mileage out of older hardware, stick with Xfce, LXDE or something even simpler like Openbox.

Interestingly, the revamped Frameworks that make up Plasma 5's graphics stack also pave the way for KDE to switch to the Wayland display server protocol. KDE doesn't seem to be in a hurry to make the switch to Wayland though, noting only that full support will be available in "a future release."

This release also claims improved support for HDPI displays. But, as with the HDPI support in GNOME and Unity, the actual experience is a very mixed bag. Font rendering in particular is nowhere near as smooth as what OS X offers. Even installing and fiddling with Infinality has never produced satisfactory results for me. We're still not sure if the problem is in setup, and we're not in fact seeing the new HDPI features. Or, possibly the KDE project just has a very different definition of what constitutes HDPI support. Hopefully it's the former.

### What's missing ###

Earlier in this review, we said that the transition from KDE 4 to the Plasma 5 desktop would not be as bumpy as the move from KDE 3.x to 4.x. For the most part, that's true, but, for some people, there may be exceptions.

The KDE project says the focus for this release has been "concentrated on tools that make up the central workflows" and notes that "not all features from the Plasma 4.x series are available yet." That might ring a bell for those who made it through the KDE 3 to 4 transition.

In testing, we didn't run across any noticeable gaps in functionality or obvious missing features, save what was mentioned: the incomplete Breeze theme, some graphical glitches, and some questionable design choices. That said, have a look at the [list of known issues][5], in particular the note about performance.

And we suggest trying Plasma 5 first to make sure all your must-haves are there before you jump in with both feet.

### Conclusion ###

KDE's Plasma 5 release lacks the attention-grabbing, paradigm-shifting changes that keep Unity and GNOME in the spotlight. Instead, the KDE project has been focused on improving its core desktop experience. Plasma 5 is not perfect by any means, but, unlike Unity and GNOME, it's easy to change the things you don't like.

What's perhaps most heartening about this release is that KDE has managed to get a lot of the groundwork done for alternate interfaces without messing with their desktop interface much at all. The speed improvements are also good news. If you've tried KDE in the past and found it too "heavy," you might want to give Plasma 5 a fresh look.

--------------------------------------------------------------------------------

via: http://arstechnica.com/information-technology/2014/08/kde-plasma-5-for-those-linux-users-undecided-on-the-kernels-future/

作者：Scott Gilbertson
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://arstechnica.com/gadgets/2014/08/op-ed-tables-really-are-pcsbecause-theres-no-point-in-buying-new-ones/
[2]:http://www.kde.org/announcements/plasma5.0/
[3]:http://files.kde.org/snapshots/neon5-latest.iso.mirrorlist
[4]:https://dot.kde.org/2014/02/24/kdes-next-generation-semantic-search
[5]:https://community.kde.org/Plasma/5.0_Errata