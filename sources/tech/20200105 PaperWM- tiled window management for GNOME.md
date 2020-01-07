[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (PaperWM: tiled window management for GNOME)
[#]: via: (https://jvns.ca/blog/2020/01/05/paperwm/)
[#]: author: (Julia Evans https://jvns.ca/)

PaperWM: tiled window management for GNOME
======

When I started using Linux on my personal computer, one of the first things I got excited about was tiny lightweight window managers, largely because my laptop at the time had 32MB of RAM and anything else was unusable.

Then I got into tiling window managers like [xmonad][1]! I could manage my windows with my keyboard! They were so fast! I could configure xmonad by writing a Haskell program! I could customize everything in all kinds of fun ways (like using [dmenu][2] as a launcher)! I used 3 or 4 different tiling window managers over the years and it was fun.

About 6 years ago I decided configuring my tiling window manager wasn’t fun for me anymore and switched to using the Ubuntu stock desktop environment: Gnome. (which is much faster now that I have 500x more RAM in my laptop :) )

So I’ve been using Gnome for a long time, but I still kind of missed tiling window managers. Then 6 months ago a friend told me about [PaperWM][3], which lets you tile your windows in Gnome! I installed it immediately and I’ve been using it ever since.

### PaperWM: tiling window management for Gnome

The basic idea of [PaperWM][3] is: you want to keep using Gnome (because all kinds of things Just Work in Gnome) but you also kinda wish you were using a tiling window manager.

It’s a Gnome extension (instead of being a standalone window manager) and it’s in Javascript.

### “Paper” means all of your windows are in a line

The main idea in PaperWM is it puts all your windows in a line, which is actually quite different from traditional tiling window managers where you can tile your windows any way you want. Here’s a gif of me moving between / resizing some windows while writing this blog post (there’s a browser and two terminal windows):

![][4]

PaperWM’s Github README links to this video: <http://10gui.com/video/>, which describes a similar system as a “linear window manager”.

I’d never heard of this way of organizing windows before but I like the simplicity of it – if I’m looking for a specific window I just move left/right until I find it.

### everything I do in PaperWM

there are lots of other features but these are the only ones I use:

  * move left and right between windows (`Super + ,`, `Super + .`)
  * move the window left/right in the ordering (`Super+Shift+,`, `Super+Shift+.`)
  * full screen a window (`Super + f`)
  * make a window smaller (`Super + r`)



### I like tools that I don’t have to configure

I’ve been using PaperWM for 6 months on a laptop and I really like it! I also really appreciate that even though it’s configurable (by writing a Javascript configuration file), it does the things I want out of the box without me having to research how to configure it.

The [fish shell][5] is another delightful tool like that – I basically don’t configure fish at all (except to set environment variables etc) and I really like the default feature set.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/01/05/paperwm/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://xmonad.org/
[2]: https://wiki.archlinux.org/index.php/Dmenu
[3]: https://github.com/paperwm/PaperWM
[4]: https://jvns.ca/images/paperwm.gif
[5]: https://jvns.ca/blog/2017/04/23/the-fish-shell-is-awesome/
