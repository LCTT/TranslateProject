[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use Mac-style emoji on Linux)
[#]: via: (https://opensource.com/article/21/2/emoji-linux)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg)

Use Mac-style emoji on Linux
======
Splatmoji provides an easy way to spice up your communication with
emoji.
![Emoji keyboard][1]

Linux provides an amazing desktop experience by default. Although advanced users have the flexibility to choose their own [window manager][2], the day-to-day flow of Gnome is better than ever since the [GNOME 3.36 improvements][3]. As a long-time Mac enthusiast turned Linux user, that's huge.

There is, however, one shortcut I use every day on a Mac that you won't find by default on Linux. It's a task I do dozens of times a day and an essential part of my digital communication. It's the emoji launcher.

You might laugh when you see that, but stick with me.

Most communication includes body language, and experts estimate upwards of 80% of what people remember comes from it. According to Advancement Courses' [History of emoji][4], people have been using "typographical art" since the 1800s. It's indisputable that in 1881, _Puck Magazine_ included four emotional faces for joy, melancholy, indifference, and astonishment. There is some disagreement about whether Abraham Lincoln's use of a winking smiley face, `;)`, in 1862 was a typo or an intentional form of expression. I could speculate further back into hieroglyphics, as this [museum exhibit][5] did. However you look at it, emoji and their ancestorial predecessors have conveyed complex human emotion in writing for a long time. That power is not going away.

Macs make it trivial to add these odd forms of expression to text with a shortcut to insert emoji into a sentence quickly. Pressing **Cmd**+**Ctrl**+**Space** launches a menu, and a quick click completes the keystroke.

GNOME does not (yet) have this functionality by default, but there is open source software to add it.

## My first attempts at emoji on Linux

So how can you add emoji-shortcut functionality to a Linux window manager? I began with trial and error. I tried about a dozen different tools along the way. I found [Autokey][6], which has been a great way to insert text using shortcuts or keywords (and I still use for that), but the [emoji extension][7] did not render for me (on Fedora or Pop!_OS). I hope one day it does, so I can use colon notation to insert emoji, like `:+1:` to get a 👍️.

It turns out that the way emoji render and interact with font choices throughout a window manager is nontrivial. Partway through my struggle, I reached out to the GNOME emoji team (yes, there's a [team for emoji][8]!) and got a small taste of its complexity.

I did, however, find a project that works consistently across multiple Linux distributions. It's called Splatmoji.

## Splatmoji for inserting emoji

[Splatmoji][9] lets me consistently insert emoji into my Linux setup exactly like I would on a Mac. Here is what it looks like in action:

![Splatmoji scroll example][10]

(Matthew Broberg, [CC BY-SA 4.0][11])

It's written in Bash, which is impressive for all that it does. Splatmoji depends on a pretty interesting toolchain outside of Bash to avoid a lot of complexity in its main features. It uses:

  * **[rofi][12]** to provide a smooth window-switcher experience
  * [**xdotool**][13] to input the keystrokes into the window
  * [**xsel**][14] or [**xclipboard**][15] to copy the selected item
  * [**jq**][16], a JSON processor, if JSON escaping is called



Thanks to these dependencies, Splatmoji is a surprisingly straightforward tool that calls these pieces in the right order.

## Set up Splatmoji

Splatmoji offers packaged releases for dnf and apt-based systems, but I set it up using the source code to keep up with the latest updates to the project:


```
# Go to whatever directory you want to store the source code.
# I keep everything in a ~/Development folder, and do so here.
# Note that `mkdir -p` will make that folder if you haven't already.
$ mkdir -p ~/Development
$ cd ~/Development
$ git clone <https://github.com/cspeterson/splatmoji>
$ cd splatmoji/
```

Install the requirements above using the syntax for your package manager. I usually use [Homebrew][17] and add `/home/linuxbrew/.linuxbrew/bin/` to my path, but I will use `dnf` for this example:


```
`$ sudo dnf install rofi xdoto