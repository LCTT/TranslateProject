[#]: subject: "I Tested The New Maui Shell On My Linux Phone. Here’s What I Found!"
[#]: via: "https://news.itsfoss.com/tested-maui-shell/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

I Tested The New Maui Shell On My Linux Phone. Here’s What I Found!
======

Just over a month ago, we got our [first glimpse of Maui Shell][1]. Developed by the team at Nitrux Linux, I was quite impressed with its smooth visuals, and especially its convergence features.

At the same time, I concluded [my year of daily driving the PinePhone][2], which meant that it was free to experiment on again. As a result, I soon found myself installing Maui Shell, which I spent quite a few hours testing.

Here’s what I found!

### A Quick Note on Maui Shell’s Development Status

Just before we get started, I do want to point out that Maui Shell is still in its early phase of development. As such, I am going to do my best to avoid talking about the bugs I noticed, and instead focus on the more fundamental aspects of it.

I will, however, make exceptions for larger and more time-consuming issues, so please keep that in mind.

With that out of the way, let’s get on to testing!

### Maui Shell on a Phone

![][3]

As soon as I finished installing it, I found myself on the (now familiar) desktop of Maui Shell. Immediately, it became very obvious that the scaling was entirely wrong, which made it much harder to use.

Fortunately, the people over at the Maui Project Telegram group were extremely helpful, and I managed to get the scaling fixed in less than an hour (thanks @wachidadinugroho).

Once that was done, I started testing.

#### Its Performance is Much Slower Than Molasses

If you read my PinePhone review, you may recall comparing its performance to the speed at which molasses drips. Unfortunately, Maui Shell takes this to a whole new level. Even the most basic interactions, like opening the quick control menus, could take as many as five seconds!

Unfortunately, my skills don’t extend far enough to be able to diagnose this slowness, but it would make sense for it to be caused by software rendering. In case you’re curious, software rendering is where the graphics aren’t rendered on the GPU, instead, it is being rendered on the much less efficient and optimized CPU.

The other possible culprit I considered was poor optimization (considering its early state). If that is the case, then it is highly likely that this will be fixed over the coming months preparing for Maui Shell’s first stable release.

However, as I said before, take my early insights with a pinch of salt.

#### Promising User Experience

![][4]

As with almost all mobile UIs, Maui Shell is simple and intuitive to use on a touchscreen. However, it also combines many desktop elements, which made a significant difference in enhancing the user experience.

For example, swiping down from the top of the screen produced a quick settings menu, similar to those found on Android and iOS.

However, different sections of the top notifications bar could be tapped individually to only show the related settings, similar to the various applets found on many desktop environments panels and taskbar.

Now, let’s head to **window management**:

For window management, the Maui Shell team obviously took some inspiration from Gnome and iOS, where swiping up from the bottom of the screen would show a Gnome-like overview of all the running apps. I found this to be extremely intuitive and simple, and I’m honestly quite surprised it hasn’t been done before!

Finally, the dock is also an important aspect of Maui Shell on mobile phones. It auto-hides by default and can be accessed by swiping up from the bottom of the screen slightly. From here, it shows the icons of all the running apps, as well as a button to open the app launcher.

Speaking of the app launcher, it’s very similar to the App Library found in iOS 14 and later. Each of the apps is sorted into categories and can be easily found and launched in just a few taps.

Overall, the usability proved to be a bit unique, and intriguing. However, this also extends to the apps, which are made with Mauikit and Kirigami.

I think the Maui Shell team got the fundamentals perfect.

#### The Apps Are Awesome

![][5]

Anything built with Mauikit integrates perfectly with Maui Shell. By far, the largest collection of Mauikit apps comes from the Maui Project, the developers of Maui Shell. Some of these include:

  * Index
  * Nota
  * Station
  * VVave
  * Pix
  * Clip
  * Buho
  * Shelf
  * Communicator



All of these apps work perfectly on mobile and desktop devices and bring desktop-class applications to phones. I was especially pleased with [Index][6], an interesting and functional mobile file manager.

![Maui Index app][7]

Aside from Mauikit apps, Kirigami applications also work well. As a result, there is a huge library of apps perfect for Maui Shell on both desktop and mobile devices.

### Other Thoughts

Aside from my observations, there are a few minor things I would like to mention:

  * Unfortunately, it appears that there isn’t a virtual keyboard for now. I circumvented this by using a keyboard attached with USB-C, but this does not mean that it’s impossible to use it as a phone.
  * I also found several scaling issues, which I was unable to resolve. These included apps scaling much more than the shell itself, as well as nothing scaling at all. This could perhaps be due to error on my part, but I certainly can’t expect typical users to be able to dig into obscure Qt-specific environment variables.



### Testing Maui Shell For Yourself

If all these issues don’t phase you, then you can try Maui Shell on a PinePhone using the instructions below. It should be noted these are PinePhone-specific, but can be modified to suit other needs:

  * Download and flash [Arch Linux ARM][8] to an SD card
  * Boot up the SD card, and connect an external keyboard
  * Login using the credentials _alarm_/_123456_
  * From here, connect to Wifi using `nmtui` and update the package list using `sudo pacman -Syu`
  * Run the following commands (these commands will take a long time to run):



```

    sudo pacman -S base-devel
    git clone https://aur.archlinux.org/packages/maui-shell-git
    git clone https://aur.archlinux.org/packages/mauikit-git
    cd mauikit-git
    makepkg -Asi
    cd ..
    cd maui-shell-git
    makepkg -Asi

```

  * Create a startup script using [Nano][9]:



```

    cd
    nano start.sh

```

Now, type into the file:

```

    #!/bin/sh

    # in case it's not detected
    # or you wish to override
    #
    # export QT_QPA_EGLFS_PHYSICAL_WIDTH=480
    # export QT_QPA_EGLFS_PHYSICAL_HEIGHT=270

    export QT_QPA_PLATFORM=eglfs
    export QT_AUTO_SCREEN_SCALE_FACTOR=0
    export QT_SCALE_FACTOR=2
    cask -r -plugin libinput

```

  * Make the script executable: `chmod +x start.sh`



From here, Maui Shell can be started using `./start.sh`.

That’s it!

_What are your thoughts on Maui Shell? Do you think its convergence features are useful? Let us know in the comments below!_

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/tested-maui-shell/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/maui-shell-unveiled/
[2]: https://news.itsfoss.com/pinephone-review/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjMyMSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjcxMiIgd2lkdGg9IjQ0NSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9Ijc3OSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[6]: https://mauikit.org/apps/index/
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxNiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: https://github.com/dreemurrs-embedded/Pine64-Arch/releases
[9]: https://news.itsfoss.com/gnu-nano-6-0-released/
