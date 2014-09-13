The awesomely epic guide to KDE
================================================================================
**Everything you ever wanted to know about KDE (but were too afraid of the number of possible solutions to ask).**

Desktops on Linux. They’re a concept completely alien to users of other operating systems because they never having to think about them. Desktops must feel like the abstract idea of time to the Amondawa tribe, a thought that doesn’t have any use until you’re in a different environment. But here it is – on Linux you don’t have to use the graphical environment lurking beneath your mouse cursor. You can change it for something completely different. If you don’t like windows, switch to xmonad. If you like full-screen apps, try Gnome. And if you’re after the most powerful and configurable point-and-click desktop, there’s KDE.

KDE is wonderful, as they all are in their own way. But in our opinion, KDE in particular suffers from poor default configuration and a rather allusive learning curve. This is doubly frustrating, firstly because it has been quietly growing more brilliant over the last couple of years, and secondly, because KDE should be the first choice for users unhappy with their old desktop – in particular, Windows 8 users pining for an interface that makes sense.

But fear not. We’re going to use a decade’s worth of KDE firefighting to bring you the definitive guide to making KDE look good and function slightly more like how you might expect it to. We’re not going to look at KDE’s applications, other than perhaps Dolphin; we’re instead going to look at the functionality in the desktop environment itself. And while our guinea pig distribution is going to be Mageia, this guide will be equally applicable to any recent KDE desktop running from almost any distribution, so don’t let the default Mageia background put you off.

### Fonts ###

A great first target for getting your system looking good is its selection of fonts. It used to be the case that many of us would routinely copy fonts across from a Windows installation, getting the professional Ariel and Helvetica font rendering that was missing from Linux at the time. But thanks to generic quality fonts such as DejaVu and Nimbus Sans/Roman, this isn’t a problem any more. But it’s still worth finding a font you prefer, as there are now so many great alternatives to choose between.

The best source of free fonts we’ve found is [www.fontsquirrel.com][1] – it hosts the Roboto, Roboto Slab (Hello!) and Roboto Condensed (Hello!) typefaces used throughout our magazine, and also on the Nexus 5 smartphone (Roboto was developed for use in the Ice Cream Sandwich version of the Android mobile operating system). 

TrueType fonts, with their **.ttf** file extensions, are incredibly easy to install from KDE. Download the zip file, right-click and select something from the Extract menu. Now all you need to do is drag a selection across the TrueType fonts you want to install and select ‘Install’ from the right-click Actions menu. KDE will take care of the rest. 

Another brilliant thing about KDE is that you can change all the fonts at once. Open the System Settings panel and click on Application Appearances, followed by the fonts tab, and click on Adjust All Fonts. Now just select a font from the requester. Most KDE applications will update with your choice immediately, while other applications, such as Firefox, will require a restart. Either way, it’s a quick and effective way of experimenting with your desktop’s usability and appearance. We’d recommend either Open Sans or the thinner Aller fonts. 

![Most distributions don’t include decent fonts. But KDE enables you to quickly install new ones and apply them to your desktop.](http://www.linuxvoice.com/wp-content/uploads/2014/09/kde-4.png)
Most distributions don’t include decent fonts. But KDE enables you to quickly install new ones and apply them to your desktop.

### Eye candy ###

One of KDE’s most secret features is that backgrounds can be dynamic. We don’t find much use for this when it comes to the desktops that tells us the weather outside the window, but we do like backgrounds that dynamically grab images from the internet. With most distributions you’ll need to install something for this to work. Just search for **plasma-wallpaper** in your distribution’s package manager. Our favourite is **plasma-wallpaper-potd**, as this installs easy access to update-able wallpaper images from a variety of sources. 

Changing a desktop background is easy with KDE, but it’s not intuitive. Mageia, for example, defaults to using ‘Folder’ view, as this is closer to the traditional desktop where files from the Desktop folder in your home directory are displayed on the background, and the whole desktop works like a file manager. Right-click and select ‘Folder Settings’ if this is the view you’re using. Alternatively, KDE defaults to ‘Desktop’, where the background is clear apart from any widgets you add yourself, and files and folders are considered links to the sources. The menu item in this mode is labelled Desktop Settings. The View Configuration panel that changes the background is the same, however, and you need to make your changes in the Wallpaper drop-down menu. We’d recommend Picture Of The Day as the wallpaper, and the Astronomy Picture Of The Day as the image source.

Another default option we think is crazy is the blue glow that surrounds the active window. While every other desktop uses a slightly deeper drop-shadow, KDE’s active window looks like it’s bathed in radioactive light. The solution to this lies in the default theme, and this can be changed by going to KDE’s System Settings control panel and selecting Workspace Appearance. On the first page, which is labelled Window Decorations, you’ll find that Oxygen is nearly always selected, and it’s this theme that contains the option to change the blue glow. Just click on the Configure Decoration button, flip to the Shadows tab and disable Active Window Glow’. Alternatively, if you’d like active windows to have a more pronounced shadow, change the inner and outer colours to black.

You may have seen the option to download wallpapers, for example, from within a KDE window, and you can see this now by clicking on the Get New Decorations button. Themes are subjective, but our favourite combination is currently the Chrome window decoration (it looks identical to Google’s default theme for its browser) with the Aya desktop theme. The term ‘desktop theme’ is a bit of a misnomer, as it doesn’t encapsulate every setting as you might expect. Instead it controls how generic desktop elements are rendered. The most visible of these elements is the launch panel, and changing the desktop theme will usually have a dramatic effect on its appearance, but you’ll also notice a difference in the widgets system.

The final graphical flourish we’d suggest is to change the icon set that KDE uses. There’s nothing wrong with the default Oxygen set, but there are better options. Unfortunately, this is where the ‘Get New Themes’ download option often fails, probably because icon packages are large and can overwhelm the personal storage space often reserved for projects like these. We’d suggest going to [kde-look.org][2] and browsing its icon collections. Open up the Icons panel from KDE’s System Settings, click on the Icons tab followed by Install Theme File and point the requester at the location of the archive you just downloaded. KDE will take it from there and add the icon set to the list in the panel. Try Kotenza for a flat theme, or keep an eye on Nitrux development.

![Remove the blue glow and change a few of the display options, and KDE starts to look pretty good in our opinion.](http://www.linuxvoice.com/wp-content/uploads/2014/09/kde-5.png)
Remove the blue glow and change a few of the display options, and KDE starts to look pretty good in our opinion.

### The panel ###

Our next target is going to be the panel at the bottom of the screen. This has become a little dated, especially if you’re using KDE on a large or high-resolution display, so our first suggestion is to re-scale and centre it for your screen. The key to moving screen components in KDE is making sure they’re unlocked, and this accomplished by right-clicking on the ‘plasma’ cashew in the top-right of the display where the current activity is listed. Only when widgets are unlocked can you re-size the panel, and even add new applications from the launch menu.

With widgets unlocked, click on the cashew on the side of the panel followed by More Settings and select Centre for panel alignment. With this enabled you can re-size the panel using the sliders on either side and the panel itself will always stay in the middle of your screen. Just pretend you’re working on indentation on a word processor and you’ll get the idea. You can also change its height when the sliders are visible by dragging the central height widget, and to the left of this, you can drag the panel to a different edge on your screen. The top edge works quite well, but many of KDE’s applets don’t work well when stacked vertically on the left or right edges of the display.

There are two different kinds of task manager applets that come with KDE. The default displays each running application as a title bar in the panel, but this takes up quite a bit of space. The alternative task manager displays only the icon of the application, which we think is much more useful. Mageia defaults to the icon version, but most others – and KDE itself – prefer the title bar applet. To change this, click on the cashew again and hover over the old applet so that the ‘X’ appears, then click on this ‘X’ to remove the applet from the panel. Now click on Add Widgets, find the two task managers and drag the icon version on to your panel. You can re-arrange any other applets in this mode by dragging them to the left and right.

By default, the Icon-Only task manager will only display icons for tasks running on the current desktop, which we think is counterintuitive, as it’s more convenient to see all of the applications you may have running and to quickly switch between whatever desktops on which they may be running with a simple click. To change this behaviour, right-click on the applet and select the Settings menu option and the Behaviour tab in the next window. Deselect ‘Only Show Tasks From The Current Desktop’, and perhaps ‘Only Show Tasks From The Current Activity’ if you use KDE’s activities.

Another alteration we like to make is to reconfigure the virtual desktops applet from showing four desktops as a 2×2, which doesn’t look too good on a small panel, to 4×1. This can be done by right-clicking on the applet, selecting Pager Settings and then clicking on the Virtual Desktops tabs and changing the number of rows to ‘1’.

Finally, there’s the launch menu. Mageia has switched this from the new style of application launcher to the old style originally seen in Microsoft Windows. We prefer the former because of its search field, but the two can be switched by right-clicking the icon and selecting the Switch To… menu option.

If you find the hover-select action of this mode annoying, where moving the mouse over one of the categories automatically selects it, you can disable it by right-clicking on the launcher, selecting Launcher Settings from the menu and disabling ‘Switch Tabs On Hover’ from the General settings page. It’s worth reiterating that many of these menu options are only available when widgets are unlocked, so don’t despair if you don’t see the correct menu entry at first.

> ### Activities ###
> 
> No article on KDE would be complete without some discussion of what KDE calls Activities. In many ways, Activities are a solution waiting for a problem. They’re meta-virtual desktops that allow you to group desktop configuration and applications together. You may have an activity for photo editing, for example, or one for working and another for the internet. If you’ve got a touchscreen laptop, activities could be used to switch between an Android-style app launcher (the Search and Launch mode from the Desktop Settings panel), and the regular desktop mode. We use a single activity as a default for screenshots, for instance, while another activity switches everything to the file manager desktop mode. But the truth is that you have to understand what they are before you can find a way of using them.
> 
> Some installations of KDE will include the Activity applet in the toolbar. Its red, blue and green dots can be clicked on to open the activity manager, or you can click on the Plasma cashew in the top-right and select Activities. This will open the bar at the bottom of the screen, which lists activities installed and primed on your system. Clicking on any will switch between them; as will pressing the meta key (usually the Windows key) and Tab.
> 
> We’d suggest that finding a fast way to switch between activities, such as with a keyboard shortcut or with the Activity Bar widget is the key to using them more. With the Activity Manager open, clicking on Create Activity lets you either clone the current desktop, add a blank desktop or create a new activity from a list of templates. Clone works well if you want to add some default applications to the desktop for your current setup. To remove an activity, switch to another one and press the Stop and Delete buttons from the Activity Manager.

### Upgraded launch menu ###

You may want to look into replacing the default launch menu entirely. If you open the Add Widgets view, for instance, and search for menus, you’ll see several results. Our current favourite is called Application Launcher (QML). It provides the same kind of functionality as the default menu, but has a cleaner interface after you’ve enlarged the initial window. But if we’re being honest, we don’t use the launcher that much. We prefer to do most launching through KRunner, which is the seemingly simple requester that appears when you hold Alt+F2.

KRunner is better than the default launcher, because you can type this shortcut from anywhere, regardless of which applications are running or where your mouse is located. When you start to type the name of the application you want to run into KRunner, you’ll see the results filtered in real time beneath the entry field – press Enter to launch the top choice.

KRunner is capable of so much more. You can type in calculations like **=sin(90)**, for example, and see the result in real time. You can search Google with **gg**: or Wikipedia with **wp**: followed by the search terms, and add many other operations through installable modules. To make best use of this awesome KDE feature, make sure you’ve got the **plasma-addons** package installed, and search for **runner** on your distribution’s package manager. When you next launch KRunner and click on the tool icon to the left of the search bar, you’ll see a wide variety of plugins that can do all kinds of things with the text you type in. In classic KDE style, many don’t include instructions on how to use them, so here’s our breakdown of the most useful things you can do with KRunner:

![](http://www.linuxvoice.com/wp-content/uploads/2014/09/kde-3.png)

### File management ###

File management may not be the most exciting subject in Linux, but it is one we all seem to spend a lot of time doing, whether that’s moving a download into a better folder, or copying photos from a camera. The old file manager, Konqueror, was one of the best reasons for using KDE in the first place, and while Konqueror has been superseded by Dolphin in KDE 4.x, it’s still knocking around – even if it is labelled a web browser. 

If you open Konqueror and enter the URL as **file:/**, it turns back into that file manager of old, with many of its best features intact. You can click on the lower status bar, for example, and split the view vertically or horizontally, into other views. You can fill the view with proportionally sized blocks by selecting Preview File Size View from the right-click menu, and preview many other file types without ever leaving Konqueror. 

Mageia uses a double-click for most options, whereas we prefer a single click. This can be changed from the System-Settings panel by opening Input Devices, clicking on Mouse and enabling ‘Single-click To Open Files And Folders’. If you’ve become used to Apple’s reverse scroll, you’ll also find an option here to reverse the scroll direction on Linux.

Konqueror is a great application, but it hasn’t been a focus of KDE development for a considerable period of time. Dolphin has replaced it, and while this is a much simplified file manager, it does inherit some of Konqueror’s best features. You can still split the view, for instance, albeit one only once, and only horizontally, from the toolbar. You can also view lots of metadata. Select the Details View and right-click on the column headings for the files, and you can add columns that list the word counts in text files, or an image’s size and orientation, or the artist, title and duration of an audio file, all from within the contents of the data. This is KDE’s semantic desktop in action, and it’s been growing in functionality for the last couple of years. Apple’s OS X, for example, has only just started pushing its ability to tag files and applications – we’ve been able to do this from KDE for a long time. We don’t know any other desktop that comes close to providing that level of control.

### Window management ###

KDE has a comprehensive set of windowing functions as well as graphical effects. They’re all part of the window manager, KWin, rather than the desktop, which is what we’ve been dealing with so far. It’s the window manager’s job to handle the positioning, moving and rendering of your windows, which is why they can be replaced without switching the whole desktop. You might want to try KWin on the RazorQt desktop, for example, to get the best of both the minimal environment RazorQt offers and the power of KDE’s window manager.

The easiest way to get to KWin’s configuration settings is to right-click on the title bar of any window (this is usually the most visible element of any window manager), and select Window Manager Settings from the More Actions menu.

The Task Switcher is the tool that appears when you press Alt+Tab, and continually pressing those two keys will switch between all running applications on the current desktop. You can also use cursor keys to move left and right through the list. These settings are mostly sensibly configured, but you may want to include All Other Desktops in the Filter Windows By section, as that will allow you to quickly switch to applications running on other desktops. We also like the Cover Switch visualisation rather than the Thumbnails view, and you can even configure the perceived distance of the windows by clicking on the toolbar icon.

The next page on the window manager control module handles what happens at the edges of your screen. At the very least, we prefer to enable Switch Desktop On Edge by selecting Only When Moving Windows from the drop-down list. This means that when you drag a window to one edge, the virtual desktop will switch beneath, effectively dragging the window on to a new virtual desktop.

The great thing about enabling this only for dragged windows is that it doesn’t interfere with KDE’s fantastic window snapping feature. When you drag a window close to the left or right edge, for instance, KDE displays a ghosted window where your window will snap to if you release the mouse. This is a great way of turning KDE into a tiling window manager, where you can easily have two windows split down the middle of the screen area. Moving a window into any of the corners will also give you the ability to neatly arrange your windows to occupy a quarter of the screen, which is ideal for large displays.

We also enable a mode similar to Mission Control on OS X when the cursor is in the region of the top-left corner of the screen. On the screen edge layout, click on the dot in the top-right of the screen (or any other point you’d prefer) and select Desktop Grid from the drop-down menu that appears. Now when you move to the top-right of your display, you’ll get an overview of all your virtual desktops, any of which can be chosen with a click.

Two pages down in the configuration module, there’s a page called Focus. This is an old idea where you can change whether a window becomes active when you click on it, or when you roll your mouse cursor over it. KDE adds another twist to this by providing a slider that progresses from click to a strict hover policy, where the window under the cursor always becomes active. We prefer to use one of the middle options – Focus Follows Mouse – as this chooses the most obvious window to activate for us without making too many mistakes, and it means we seldom click to focus. We also reduce the focus delay to 200ms, but this will depend on how you feel about the feature after using it for a while.

KDE has so many features, many of which only come to light when you start to use the desktop. It really is a case of developers often adding things and then telling no one. But we feel KDE is worth the effort, and unlikely some other desktops, is unlikely to change too much in the transition from 4.x to 5. That means the time you spend learning how to use KDE now is an investment. Dive in!. 

![KDE visual effects (click for larger)](http://www.linuxvoice.com/wp-content/uploads/2014/09/kde-1.png)
KDE visual effects (click for larger)

--------------------------------------------------------------------------------

via: http://www.linuxvoice.com/desktops/

作者：[Ben Everard][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxvoice.com/author/ben_everard/
[1]:http://www.fontsquirrel.com/
[2]:http://kde-look.org/