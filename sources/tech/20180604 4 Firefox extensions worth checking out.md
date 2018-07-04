4 Firefox extensions worth checking out
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/firefox_blue_lead.jpg?itok=gYaubJUv)

I've been a Firefox user since v2.0 came out about 12 years ago. There were times when it wasn't the best web browser out there, but still, I kept going back to it for one reason: My favorite extensions wouldn't work with anything else.

Today, I like the current state of Firefox itself for being fast, customizable, and open source, but I also appreciate extensions for manifesting ideas the original developers never thought of: What if you want to browse without a mouse? What if you don't like staring at bright light coming out of the monitor at night? What about using a dedicated media player for YouTube and other video hosting websites for better performance and extended playback controls? And what if you need a more sophisticated way to disable trackers and speed up loading pages?

Fortunately, there's an answer for each of these questions, and I'm going to give them to you in the form of my favorite extensions—all of which are free software or open source (i.e., distributed under the [GNU GPL][1], [MPL][2], or [Apache][3] license) and make an excellent browser even better.

Although the terms add-on and extension have slightly different meanings, I'll use them interchangeably in this article.

### Tridactyl

![Tridactyl screenshot][5]

Tridactyl's new tab page, showcasing link hinting.

[Tridactyl][6] enables you to use your keyboard for most of your browsing activities. It's inspired by the now-defunct [Vimperator][7] and [Pentadactyl][8], which were inspired by the default keybindings of [Vim][9]. Since I'm already used to Vim and other command-line applications, I find features like being able to navigate with the keys `h/j/k/l`, interact with hyperlinks with `f/F`, and create custom keybindings and commands very convenient.

Tridactyl's optional native messenger (for now, available only for GNU/Linux and Mac OSX), which was implemented recently, offers even more cool features to boot. With it, for example, you can hide some elements of the GUI of Firefox (à la Vimperator and Pentadactyl), open a link or the current page in an external program (I often use [mpv][10] and [youtube-dl][11] for videos) and edit the content of text areas with your favorite text editor by pressing `Ctrl-I` (or any key combination of your choice).

Having said that, keep in mind that it's a relatively young project and may still be rough around the edges. On the other hand, its development is very active, and when you look past its childhood illnesses, it can be a pleasure to use.

### Open With

![Open With Screenshot][13]

A context menu provided by Open With. I can open the current page with one of the external programs listed here.

Speaking of interaction with external programs, sometimes it's nice to have the ability to do that with the mouse. That's where [Open With][14] comes in.

Apart from the added context menu (shown in the screenshot), you can find your own defined commands by clicking on the extension's icon on the add-on bar. As its icon and the description on [its page on Mozilla Add-ons][14] suggest, it was primarily intended to work with other web browsers, but I can use it with mpv and youtube-dl with ease as well.

Keyboard shortcuts are available here, too, but they're severely limited. There are no more than three different combinations that can be selected in a drop-down list in the extension's settings. In contrast, Tridactyl lets me assign commands to virtually anything that isn't blocked by Firefox. Open With is currently for the mouse, really.

### Stylus

![Stylus Screenshot][16]

In this screenshot, I've just searched for and installed a dark theme for the site I'm currently on with Stylus. Even the popup has custom style (called Deepdark Stylus)!

[Stylus][17] is a userstyle manager, which means that by writing custom CSS rules and loading them with Stylus, you can change the appearance of any webpage. If you don't know CSS, there are a plethora of userstyles made by others on websites such as [userstyles.org][18].

Now, you may be asking, "Isn't that exactly what [Stylish][19] does?" You would be correct! You see, Stylus is based on Stylish and provides additional improvements: It respects your privacy by not containing any telemetry, all development is done in the open (although Stylish is still actively developed, I haven't been able to find the source code for recent versions), and it supports [UserCSS][20], among other things.

UserCSS is an interesting format, especially for developers. I've written several userstyles for various websites (mainly dark themes and tweaks for better readability), and while the internal editor of Stylus is excellent, I still prefer editing code with Neovim. For that, all I need to do is load a local file with its name ending with ".user.css" in Stylus, enable the option "Live Reload", and any changes will be applied as soon as I modify and save that file in Neovim. Remote UserCSS files are also supported, so whenever I push changes to GitHub or any git-based development platforms, they'll automatically become available for users. (I provide a link to the raw version of the file so that they can access it easily.)

### uMatrix

![uMatrix Screenshot][22]

The user interface of uMatrix, showing the current rules for the currently visited webpage.

Jeremy Garcia mentioned uBlock Origin in [his article][23] here on Opensource.com as an excellent blocker. I'd like to draw attention to another extension made by [gorhill][24]: uMatrix.

[uMatrix][25] allows you to set blocking rules for certain requests on a webpage, which can be toggled by clicking on the add-on's popup (seen in the screenshot above). These requests are distinguished by the categories of scripts, requests made by scripts, cookies, CSS rules, images, media content, frames, and anything else labeled as "other" by uMatrix. You can set up global rules to, for instance, allow all requests by default and add only particular ones to the blacklist (the more convenient approach), or block everything by default and whitelist certain requests manually (the safer approach). If you've been using NoScript or RequestPolicy, you can [import][26] your whitelist rules from them, too.

In addition, uMatrix supports [hosts files][27], which can be used to block requests from certain domains. These are not to be confused with the filter lists used by uBlock Origin, which use the same syntax as the filters set by Adblock Plus. By default, uMatrix blocks domains of servers known to distribute ads, trackers, and malware with the help of a few hosts files, and you can add more external sources if you want to.

So which one shall you choose—uBlock Origin or uMatrix? Personally, I use both on my desktop PC and only uMatrix on my Android phone. There's some overlap between the two, [according to gorhill][28], but they have a different target userbase and goals. If all you want is an easy way to block trackers and ads, uBlock Origin is a better choice. On the other hand, if you want granular control over what a webpage can or can't do inside your browser, even if it takes some time to configure and it can prevent sites from functioning as intended, uMatrix is the way to go.

### Conclusion

Currently, these are my favorite extensions for Firefox. Tridactyl is for speeding up browsing navigation by relying on the keyboard and interacting with external programs; Open With is there if I need to open something in another program with the mouse; Stylus is the definitive userstyle manager, appealing to both users and developers alike; and uMatrix is essentially a firewall within Firefox for filtering out requests on unknown territories.

Even though I almost exclusively discussed the benefits of these add-ons, no software is ever perfect. If you like any of them and think they can be improved in any way, I recommend that you go to their GitHub page and look for their contribution guides. Usually, developers of free and open source software welcome bug reports and pull requests. Telling your friends about them or saying thanks are also excellent ways to help the developers, especially if they work on their projects in their spare time.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/firefox-open-source-extensions

作者：[Zsolt Szakács][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/zsolt
[1]:https://www.gnu.org/licenses/gpl-3.0.en.html
[2]:https://www.mozilla.org/en-US/MPL/
[3]:https://www.apache.org/licenses/LICENSE-2.0
[4]:/file/398411
[5]:https://opensource.com/sites/default/files/uploads/tridactyl.png (Tridactyl's new tab page, showcasing link hinting)
[6]:https://addons.mozilla.org/en-US/firefox/addon/tridactyl-vim/
[7]:https://github.com/vimperator/vimperator-labs
[8]:https://addons.mozilla.org/en-US/firefox/addon/pentadactyl/
[9]:https://www.vim.org/
[10]:https://mpv.io/
[11]:https://rg3.github.io/youtube-dl/index.html
[12]:/file/398416
[13]:https://opensource.com/sites/default/files/uploads/openwith.png (A context menu provided by Open With. I can open the current page with one of the external programs listed here.)
[14]:https://addons.mozilla.org/en-US/firefox/addon/open-with/
[15]:/file/398421
[16]:https://opensource.com/sites/default/files/uploads/stylus.png (In this screenshot, I've just searched for and installed a dark theme for the site I'm currently on with Stylus. Even the popup has custom style (called Deepdark Stylus)!)
[17]:https://addons.mozilla.org/en-US/firefox/addon/styl-us/
[18]:https://userstyles.org/
[19]:https://addons.mozilla.org/en-US/firefox/addon/stylish/
[20]:https://github.com/openstyles/stylus/wiki/Usercss
[21]:/file/398426
[22]:https://opensource.com/sites/default/files/uploads/umatrix.png (The user interface of uMatrix, showing the current rules for the currently visited webpage.)
[23]:https://opensource.com/article/18/5/firefox-extensions
[24]:https://addons.mozilla.org/en-US/firefox/user/gorhill/
[25]:https://addons.mozilla.org/en-US/firefox/addon/umatrix
[26]:https://github.com/gorhill/uMatrix/wiki/FAQ
[27]:https://en.wikipedia.org/wiki/Hosts_(file)
[28]:https://github.com/gorhill/uMatrix/issues/32#issuecomment-61372436
