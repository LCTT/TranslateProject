[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why I switched from Mac to Linux)
[#]: via: (https://opensource.com/article/20/3/mac-linux)
[#]: author: (Lee Tusman https://opensource.com/users/leeto)

Why I switched from Mac to Linux
======
After 25 years, Lee made the switch to Linux and couldn't be happier.
Here's what he uses.
![Code going into a computer.][1]

In 1994, my family bought a Macintosh Performa 475 as a home computer. I had used Macintosh SE computers in school and learned to type with [Mavis Beacon Teaches Typing][2], so I've been a Mac user for well over 25 years. Back in the mid-1990s, I was attracted to its ease of use. It didn't start with a DOS command prompt; it opened to a friendly desktop. It was playful. And even though there was a lot less software for Macintosh than PCs, I thought the Mac ecosystem was better, just on the strength of KidPix and Hypercard, which I still think of as the unsurpassed, most intuitive _creative stack_.

Even so, I still had the feeling that Mac was an underdog compared to Windows. I remember thinking the company could disappear one day. Flash-forward decades later, and Apple is a behemoth, a trillion-dollar company. But as it evolved, it changed significantly. Some changes have been for the better, such as better stabilization, simpler hardware choices, increased security, and more accessibility options. Other changes annoyed me—not all at once, but slowly. Most significantly, I am annoyed by Apple's closed ecosystem—the difficulty of accessing photos without iPhoto; the necessity of using iTunes; and the enforced bundling of the Apple store ecosystem even when I don't want to use it.

Over time, I found myself working largely in the terminal. I used iTerm2 and the [Homebrew][3] package manager. I couldn't get all my Linux software to work, but much of it did. I thought I had the best of both worlds: the macOS graphical operating system and user interface alongside the ability to jump into a quick terminal session.

Later, I began using Raspberry Pi computers booting Raspbian. I also collected a number of very old laptops rescued from the trash at universities, so, by necessity, I decided to try out various Linux distros. While none of them became my main machine, I started to really enjoy using Linux. I began to consider what it would be like to try running a Linux distro as my daily driver, but I thought the Macbook's comfort and ease, especially the hardware's size and weight, would be hard to find in a non-Mac laptop.

## Time to make the switch?

About two years ago, I began using a Dell for work. It was a larger laptop with an integrated GPU, and dual-booted Linux and Windows. I used it for game development, 3D modeling, some machine learning, and basic programming in C# and Java. I considered making it my primary machine, but I loved the portability of my Macbook Air, and continued to use that as well.

Last fall, I started to notice my Air was running hot, and the fan was coming on more often. My primary machine was starting to show its age. For years, I used the Mac's terminal to access Darwin's Unix-like operating system, and I was spending more and more time bouncing between the terminal and my web browser. Was it time to make the switch?

I began exploring the possibilities for a Macbook-like Linux laptop. After doing some research, reading reviews and message boards, I went with the long-celebrated Dell XPS 13 Developer Edition 7390, opting for the 10th Generation i7. I chose it because I love the feel of the Macbook (and especially the slim Macbook Air), and reviews of the XPS 13 suggested it seemed it was similar, with really positive reviews of the trackpad and keyboard.

Most importantly, it came loaded with Ubuntu. While it's easy enough to get a PC, wipe it, and install a new Linux distro, I was attracted to the cohesive operating system and hardware, but one that allowed a lot of the customization we know and love in Linux. So when there was a sale, I took the plunge and purchased it.

## What it's like to run Linux daily

I've been using the XPS 13 for three months and my dual-booted Linux work laptop for two years. At first, I thought I'd want to spend more time finding an alternate desktop environment or window manager that was more Mac-like, such as [Enlightenment][4]. I tried several, but I have to say, I like the simplicity of running [GNOME][5] out of the box. For one thing, it's minimal; there's not much GUI to get caught up in. In fact, it's intuitive and the [overview][6] takes only a couple minutes to read. 

I can access my applications through the application dash bar or a grid button to get to the application view. To access my file system, I click on the **Files** icon in the dash. To open the GNOME terminal, I type **Ctrl+Alt+T** or just **Alt+Tab** to switch between an open application and an open terminal. It's also easy to define your own [custom hotkey shortcuts][7].

Beyond this, there's not much else to say. Unlike the Mac's desktop, there's not a lot to get lost in, which means there's less to distract me from my work or the applications I want to run. I didn't realize all the options or how much time I spent navigating windows on my Mac. In Linux, there are just files, applications, and the terminal.

I installed the [i3 tiling window manager][8] to do a test run. I had a few issues configuring it because I type in [Dvorak][9], and i3 doesn't adapt to the alternate keyboard configuration. I think with more effort, I could figure out a new keyboard mapping in i3, but the main thing I was looking for was simple tiling.

I looked up GNOME's tiling capabilities and was pleasantly surprised. You press the **Super** key (for me, it's the key with the Windows logo—which I should cover with a sticker!) and then a modifier key. For example, pressing **Super+Left** moves your current window to a tile on the left side of the screen. **Super+Right** moves to the right half. **Super+Up** maximizes the current window. **Super+Down** reverts to the previous size. You can move between app windows with **Alt+Tab**. This is all default behavior and can be customized in the Keyboard settings.

Plugging in headphones or connecting to HDMI works the way you expect. Sometimes, I open the Sound settings to switch between the HDMI sound output or my external audio cable, just as I would on a Mac or PC. The trackpad is responsive, and I haven't noticed any difference from the Macbook's. When I plug in a three-button mouse, it works instantly, even with my Bluetooth mouse and keyboard.

### Software

I installed Atom, VLC, Keybase, Brave Browser, Krita, Blender, and Thunderbird in a matter of minutes. I installed other software with the Apt package manager in the terminal (as normal), which offers many more packages than the Homebrew package manager for macOS.

### Music

I have a variety of options for listening to music. I use Spotify and [PyRadio][10] to stream music. [Rhythmbox][11] is installed by default on Ubuntu; the simple music player launches instantly and without any bloat. Simply click on the menu, choose **Add Music**, and navigate to a directory of audio tracks (it searches recursively). You can also stream podcasts or online radio easily.

### Text and PDFs

I tend to write in Markdown in [Neovim][12] with some plugins, then convert my document using Pandoc to whatever final format is needed. For a nice Markdown editor with preview, I downloaded [Ghostwriter][13], a minimal-focus writing application.

If someone sends me a Microsoft Word document, I can open it using the default LibreOffice Writer application.

Occasionally, I have to sign a document. This is easy with macOS's Preview application and my signature in PNG format, and I needed a Linux equivalent. I found that the default PDF viewer app didn't have the annotation tools I needed. The LibreOffice Draw program was acceptable but not particularly easy to use, and it occasionally crashed. Based on some research, I installed [Xournal][14], which has the simple annotation tools I need to add dates, text, and my signature and is fairly comparable to Mac's Preview app. It works exactly as needed.

### Importing images from my phone

I have an iPhone. To get my images off the phone, there are a number of methods to sync and access your files. If you have a different phone, your process may be different. Here's my method:

  1. Install gvfs-backends with **sudo apt install gvfs-backends**, which is part of the GNO