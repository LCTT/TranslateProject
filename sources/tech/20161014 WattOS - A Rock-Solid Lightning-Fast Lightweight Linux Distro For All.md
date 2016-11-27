fuowang翻译中

WattOS: A Rock-Solid, Lightning-Fast, Lightweight Linux Distro For All
=============================

![WattOS](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/wattos-main.png?itok=b7-Z7GK1)

Jack Wallen takes a look at what makes lightweight WattOS special.

[Used with permission][81]

Everyone in the land of Linux has either heard of or made use of a lightweight Linux distribution. We all know the drill: small footprint, low resource requirement, includes a lightweight desktop environment (or window manager), and offers the same general layout as the next distribution, staking the same claims.

And most often they do their jobs. One problem that strikes down many of these lightweight Linux distros is that they don’t really include the tools the average user needs to get their work done. To that end, they wind up relegated to specialty tasks (like data recovery, kiosks, etc.).

To some extent, WattOS suffers from these same pitfalls (the only productivity tool it includes is a PDF viewer, and it uses the standard “task bar/start menu” metaphor for the desktop). Fortunately, however, WattOS makes up for those shortcomings by way of incredible speed, reliability, and the inclusion of the Synaptic Package Manager; so, WattOS could easily become a lightweight Linux distribution for everyone.

Let’s take a look at what makes WattOS special.

### The kernel

I was actually surprised to find WattOS to ship with kernel 4.4\. After an immediate upgrade, the uname -r command returned 4.4.0-38-generic. Considering this is a distribution targeted at bringing life to older, slower machines, the inclusion of the same kernel found on my Elementary OS Loki release was a pleasant surprise. This means WattOS should do a great job of working with both older and newer hardware.

Not so surprising is the fact that, when you go to the WattOS, you’ll find downloads for both the 32- and 64-bit versions (most modern distros are leaning away from 32-bit releases now). So, not only does the kernel offer support for modern hardware, but the architecture releases will allow you to give life to those older 32-bit machines.

### The speed

Once I’d installed WattOS, I had one of those moments of purest envy. The speed at which WattOS runs is incredible. Even when working with the platform as a VirtualBox guest, the speed of the WattOS desktop blew away my Elementary OS Loki desktop. Understand that the machine running the host is a [System76 Leopard][80], with a liquid cooled i7 and 16GB of RAM. Handing over approximately 2GB of RAM to WattOS made it feel like absolutely nothing could slow it down. The impressiveness of the speed is almost too much to describe...it has to be experienced. I’ve never witnessed Firefox open so quickly.

Speaking of app launching...LibreOffice. I wanted to test the speed at which LibreOffice would open, so I fired up the Synaptic Package Manager and attempted an install of the flagship, open source office suite.

To no avail.

The issue with installing LibreOffice centered on an uninstallable python3-uno package, and no matter what I tried, I couldn’t get it installed. However, after downloading the latest .deb release from the [LibreOffice site][79], I could unpack that download file, cd into LibreOffice_5.2.2.2_Linux_x86-64_deb/DEBS/ and then issue the command sudo dpkg -i *.deb to finally get LibreOffice installed.

How did LibreOffice run? Insanely fast. Once again, I’ve never seen this app open as quickly as on WattOS. Upon clicking the LibreOffice Writer icon, the app launched in half the time as it did on the host Elementary OS Loki (and that already is quite fast).

### The desktop

My personal preference of desktops tends to veer toward the more modern iterations. I’m a fan of Ubuntu Unity, GNOME 3, and (especially) [Elementary OS][78]. So the idea of using an old-school desktop metaphor has very little appeal to me. Even so, WattOS has done a great job of breathing a bit of modernity into the old school design. Take, for instance, the default desktop theme (Figure 1). The WattOS UI designers have done a decent job of theming the desktop so it doesn’t completely fall too far into the well of Windows XP or old-school Linux CDE-like window managers.

![WattOS](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/wattos_a.png?itok=eavmkVgL)

>Figure 1: The WattOS file manage revealing a somewhat modern theme.  [Used with permission][76]

There’s really little to say about the WattOS desktop (powered by [LXDE][75]) that hasn’t already been said about every Linux desktop of this ilk—it’s simple, straightforward, offers just enough flexibility and customization, and will be familiar to anyone who has used a computer since Windows 95.

### Surprises, good and bad

As with every new Linux desktop experience, there are always surprises of both the good and bad nature. First, the good.

Beyond the sheer speed of WattOS (and again I’ll comment on this with a simple...WOW!), there are a few little nice surprises tacked onto the desktop (most in the way of included applications). One of the best additions (one you rarely find included in a desktop by default) is [KeePassX][74]. I’ve come to the conclusion that password managers should be included on every desktop by default...and kudos to WattOS for including this outstanding tool.

Next comes the inclusion of Firefox. Many of the lightweight distributions will include browsers like [Surf][73] or [Midori][72]. Both are fine browsers, but they often fall short when it comes to websites like Google Docs. Because WattOS includes the full-blown Firefox, you will find the platform functions perfectly with any Firefox-compatible website.

Lastly, the less-than-good surprises. As I’ve already stated, I ran into an immediate hitch with installing LibreOffice. Installing the likes of GIMP went smoothly, however (so I concluded that was a one-off issue). Beyond that one problem, I believe the default desktop menu to be somewhat poorly laid out. For instance, the Synaptic Package Manager is found in the Preferences menu. I’d much rather see that listed prominently in the main menu and labeled something like “Install Applications” (or anything that a new user wouldn’t have trouble understanding). From my perspective, the Preferences menu should be dedicated to tools used to configure the various aspects of the platform...not installing applications.

Beyond that, you’d be hard-pressed to find anything wrong with WattOS—especially considering you’re looking at a Linux distribution geared toward older and lesser-powered hardware.

### The conclusion

Although WattOS is designed to give life to older hardware, there’s no reason why it couldn’t serve on a modern desktop...and serve it well. With a next-to-zero learning curve, WattOS is instantly familiar, blazingly fast, and rock solid. Give this small footprint Linux distro a try; I’m confident you’ll be equally impressed. And if you find WattOS not fast enough (something I cannot imagine happening), you can always give [Microwatt][71] a go (an even lighter, lightweight distribution).

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/wattos-rock-solid-lightning-fast-lightweight-linux-distro-all

作者：[JACK WALLEN][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[1]:https://www.youtube.com/channel/UCOfXyFkINXf_e9XNosTJZDw
[2]:https://www.youtube.com/user/desainew
[3]:https://www.youtube.com/channel/UCEQXp_fcqwPcqrzNtWJ1w9w
[4]:http://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Ffreedompenguin.com%2Farticles%2Fopinion%2Fopen-source-design-thing%2F
[5]:http://twitter.com/intent/tweet/?text=Is+Open+Source+Design+a+Thing%3F&url=https%3A%2F%2Ffreedompenguin.com%2Farticles%2Fopinion%2Fopen-source-design-thing%2F
[6]:https://plus.google.com/share?url=https%3A%2F%2Ffreedompenguin.com%2Farticles%2Fopinion%2Fopen-source-design-thing%2F
[7]:https://atom.io/
[8]:http://froont.com/
[9]:https://webflow.com/
[10]:https://gravit.io/
[11]:http://getbootstrap.com/
[12]:https://inkscape.org/en/
[13]:https://www.gimp.org/
[14]:https://en.wikipedia.org/wiki/Free_and_open-source_software
[15]:https://medium.com/dawn-capital/why-leverage-the-power-of-open-source-to-build-a-successful-software-business-8aba6f665bc4#.ggmn2ojxp
[16]:https://github.com/majutsushi/tagbar
[17]:http://ctags.sourceforge.net/
[18]:https://github.com/majutsushi/tagbar/zipball/70fix
[19]:https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
[20]:http://www.vim.org/scripts/script.php?script_id=2332
[21]:https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers-2-syntastic/
[22]:https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-delimitmate-help.png
[23]:https://github.com/Raimondi/delimitMate
[24]:https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-tagbar-visibility.png
[25]:https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-tagbar-ex2.png
[26]:https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-tagbar-example.png
[27]:http://www.tldp.org/LDP/intro-linux/html/sect_06_02.html
[28]:http://majutsushi.github.io/tagbar/
[29]:http://vi.stackexchange.com/questions/388/what-is-the-difference-between-the-vim-plugin-managers
[30]:https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-vimrc.png
[31]:http://www.vim.org/
[32]:https://github.com/scrooloose/syntastic
[33]:https://github.com/scrooloose/syntastic/blob/master/doc/syntastic.txt
[34]:https://www.howtoforge.com/images/3337/big/syntastic-error-all-descr.png
[35]:https://www.howtoforge.com/images/3337/big/syntastic-error-descr.png
[36]:https://www.howtoforge.com/images/3337/big/syntastic-error-highlight.png
[37]:https://github.com/scrooloose/syntastic
[38]:http://www.vim.org/
[39]:https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers/
[40]:https://en.wikipedia.org/wiki/Trim_%28computing%29
[41]:https://en.wikipedia.org/wiki/Sudo
[42]:http://snapcraft.io/
[43]:http://flatpak.org/
[44]:https://en.wikipedia.org/wiki/Wine_%28software%29
[45]:https://en.wikipedia.org/wiki/Live_CD
[46]:http://distrowatch.com/
[47]:http://www.internetnews.com/skerner/2009/10/white-house-goes-open-source-w.html
[48]:https://www.whitehouse.gov/blog/2016/10/13/removing-barriers-constituent-conversations
[49]:http://planetwatt.com/new/index.php/2016/09/23/microwatt-r10-released/
[50]:http://midori-browser.org/
[51]:http://surf.suckless.org/
[52]:https://www.keepassx.org/
[53]:http://lxde.org/
[54]:https://www.linux.com/licenses/category/used-permission
[55]:https://www.linux.com/files/images/wattosapng
[56]:https://elementary.io/
[57]:https://www.libreoffice.org/
[58]:https://system76.com/desktops/leopard
[59]:https://www.linux.com/licenses/category/used-permission
[60]:http://planetwatt.com/new/index.php/2016/09/23/microwatt-r10-released/
[61]:http://midori-browser.org/
[62]:http://surf.suckless.org/
[63]:https://www.keepassx.org/
[64]:http://lxde.org/
[65]:https://www.linux.com/licenses/category/used-permission
[66]:https://www.linux.com/files/images/wattosapng
[67]:https://elementary.io/
[68]:https://www.libreoffice.org/
[69]:https://system76.com/desktops/leopard
[70]:https://www.linux.com/licenses/category/used-permission
[71]:http://planetwatt.com/new/index.php/2016/09/23/microwatt-r10-released/
[72]:http://midori-browser.org/
[73]:http://surf.suckless.org/
[74]:https://www.keepassx.org/
[75]:http://lxde.org/
[76]:https://www.linux.com/licenses/category/used-permission
[77]:https://www.linux.com/files/images/wattosapng
[78]:https://elementary.io/
[79]:https://www.libreoffice.org/
[80]:https://system76.com/desktops/leopard
[81]:https://www.linux.com/licenses/category/used-permission]
