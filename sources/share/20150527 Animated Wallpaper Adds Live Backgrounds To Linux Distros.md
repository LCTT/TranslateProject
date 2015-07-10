Translating by Love-xuan
Animated Wallpaper Adds Live Backgrounds To Linux Distros
================================================================================
**We know a lot of you love having a stylish Ubuntu desktop to show off.**

![Live Wallpaper](http://i.imgur.com/9JIUw5p.gif)

Live Wallpaper

And as Linux makes it so easy to create a stunning workspace with a minimal effort, that’s understandable!

Today, we’re highlighting — [re-highlighting][2] for those of you with long memories — a free, open-source tool that can add extra bling your OS screenshots and screencasts.

It’s called **Live Wallpaper** and (as you can probably guess) it will replace the standard static desktop background with an animated alternative powered by OpenGL.

And the best bit: it can be installed in Ubuntu very easily.

### Animated Wallpaper Themes ###

![](http://www.omgubuntu.co.uk/wp-content/uploads/2015/05/animated-wallpaper-ubuntu-750x383.jpg)

Live Wallpaper is not the only app of this type, but it is one of the the best.

It comes with a number of different themes out of the box.

These range from the subtle (‘noise’) to frenetic (‘nexus’), and caters to everything in between. There’s even the obligatory clock wallpaper inspired by the welcome screen of the Ubuntu Phone:

- Circles — Clock inspired by Ubuntu Phone with ‘evolving circle’ aura
- Galaxy — Spinning galaxy that can be resized/repositioned
- Gradient Clock — A polar clock overlaid on basic gradient
- Nexus — Brightly colored particles fire across screen
- Noise — A bokeh design similar to the iOS dynamic wallpaper
- Photoslide — Grid of photos from folder (default ~/Photos) animate in/out

Live Wallpaper is **fully open-source** so there’s nothing to stop imaginative artists with the know-how (and patience) from creating some slick themes of their own.

### Settings & Features ###

![](http://www.omgubuntu.co.uk/wp-content/uploads/2015/05/live-wallpaper-gui-settings.jpg)

Each theme can be configured or customised in some way, though certain themes have more options than others.

For example, in Nexus (pictured above) you can change the number and colour of the the pulse particles, their size, and their frequency.

The preferences app also provides a set of **general options** that will apply to all themes. These include:

- Setting live wallpaper to run on log-in
- Setting a custom background that the animation sits on
- Adjusting the FPS (including option to show FPS on screen)
- Specifying the multi-monitor behaviour

With so many options available it should be easy to create a background set up that suits you.

### Drawbacks ###

#### No Desktop Icons ####

You can’t add, open or edit files or folders on the desktop while Live Wallpaper is ‘On’.

The Preferences app does list an option that will, supposedly, let you do this. It may work on really older releases but in our testing, on Ubuntu 14.10, it does nothing.

One workaround that seems to work for some users of the app on Ubuntu is setting a .png image as the custom background. It doesn’t have to be a transparent .png, simply a .png.

#### Resource Usage ####

Animated wallpapers use more system resources than standard background images.

We’re not talking about 50% load at all times —at least not with this app in our testing— but those on low-power devices and laptops will want to use apps like this cautiously.  Use a [system monitoring tool][2] to keep an eye on CPU and GPU load.

#### Quitting the app ####

The biggest “bug” for me is the absolute lack of “quit” option.

Sure, the animated wallpaper can be turned off from the Indicator Applet and the Preferences tool but quitting the app entirely, quitting the indicator applet? Nope. To do that I have to use the ‘pkill livewallpaper’ command in the Terminal.

### How to Install Live Wallpaper in Ubuntu 14.04 LTS + ###

![](http://www.omgubuntu.co.uk/wp-content/uploads/2015/05/terminal-command-750x146.jpg)

To install Live Wallpaper in Ubuntu 14.04 LTS and above you will first need to add the official PPA for the app to your Software Sources.

The quickest way to do this is using the Terminal:

    sudo add-apt-repository ppa:fyrmir/livewallpaper-daily
    
    sudo apt-get update && sudo apt-get install livewallpaper

You should also install the indicator applet, which lets you quickly and easily turn on/off the animated wallpaper and switch theme from the menu area, and the GUI settings tool so that you can configure each theme based on your tastes.

    sudo apt-get install livewallpaper-config livewallpaper-indicator

When everything has installed you will be able to launch the app and its preferences tool from the Unity Dash.

![](http://www.omgubuntu.co.uk/wp-content/uploads/2015/05/live-wallpaper-app-launcher.png)

Annoyingly, the Indicator Applet won’t automatically open after you install it. It does add itself to the start up list, so a quick log out > log in will get it to show.

### Summary ###

If you fancy breathing life into a dull desktop, give it a spin — and let us know what you think of it and what animated wallpapers you’d love to see added! 

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2015/05/animated-wallpaper-adds-live-backgrounds-to-linux-distros

作者：[Joey-Elijah Sneddon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:http://www.omgubuntu.co.uk/2012/11/live-wallpaper-for-ubuntu
[2]:http://www.omgubuntu.co.uk/2011/11/5-system-monitoring-tools-for-ubuntu
