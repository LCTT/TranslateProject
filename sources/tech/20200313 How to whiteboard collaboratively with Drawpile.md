[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to whiteboard collaboratively with Drawpile)
[#]: via: (https://opensource.com/article/20/3/drawpile)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to whiteboard collaboratively with Drawpile
======
Need to whiteboard or draw something with others? Give Drawpile a try.
![markers for a whiteboard][1]

Thanks to applications like [Krita][2] and [MyPaint][3], open source software users have all the tools they need to create stunning digital paintings. They are so good that you can see [art created with Krita][4] in some of your [favorite RPG books][5]. And it's getting better all the time; for example, [GIMP][6] 2.10 adopted MyPaint's brush engine, so users can benefit from MyPaint without even installing the whole application.

But what about collaborative illustration? What do two or more artists do when they want to work together on one piece? What does your work team use when you need to whiteboard during a business meeting? Those are the questions, and the answer is [Drawpile][7].

![Drawpile's UI][8]

Nyarlathotep by Sophia Eberhard

Drawpile is a drawing application for Linux, Windows, and macOS. It's got a respectable brush engine and all the basic editorial tools (selection tools, flips and flops, mirror, and so on) to make it a good freehand digital paint application. But its most powerful feature is its easy multi-user mode. If you have Drawpile installed, you can host a drawing session from your computer or on a Drawpile server, allowing other users to join you in your virtual studio. This goes well beyond a screen-share session, which would just allow other users to _view_ your painting, and it's not a remote desktop with just one cursor. Drawpile enables several users, each with their own brush, to work on the same canvas at the same time over a network that can span the globe.

### Installing Drawpile

If you're using Linux, Drawpile is available as a [Flatpak][9] from [Flathub.org][10].

On Windows and macOS, download and install Drawpile from [Drawpile's download page][11]. When you first launch it on macOS, you must right-click on its icon and select **Open** to accept that it hasn't been signed by a registered Apple developer.

### Drawing with Drawpile

The Drawpile interface is simple and minimal. Along the right side of the application window are docked palettes, and along the top is a toolbar. Most of the tools available to you are visible: paint brushes, paint buckets, lines, Bézier curves, and so on.

For quick access to brushes, Drawpile allows you to assign a unique brush, along with all of its settings (including color), to the number keys **1** through **5** on your keyboard. It's an efficient and easy way to quickly move between drawing tools. The **6** key holds an eraser.

Drawpile also has layers, so you can keep different parts of your painting separate until you combine them for your final render. If you're an animator, you can even use Drawpile's onion skin and flipbook features (both available in the **Layer** menu) to do rudimentary frame-by-frame animation. Unlike Krita, Drawpile doesn't feature an [animation timeline][12], but it's enough for quick and fun animations.

### Custom brushes

Drawpile isn't Krita or MyPaint, so its brush engine is simple in comparison. The preset brushes have the usual properties, though, including:

  * **Opacity** adjusts how your strokes blend with existing paint
  * **Hardness** defines the edges of your stroke
  * **Smudging** allows existing strokes to be affected by your brush
  * **Color pickup** allows your paint to pick up color from existing strokes
  * **Spacing** controls how often the full brush cursor is sampled during a stroke



Most of these are pressure-sensitive, so if you're using a drawing tablet (Wacom, for instance), then your brush strokes are dynamic depending upon pen pressure. The tablet support is borrowed from Krita, and it makes a big difference (although it's probably overkill for mock-ups or whiteboarding sessions).

When you find a brush setting you like, you can add it to your brush set so you can use it again later. To add a brush, click the **Menu** button in the top-right corner of the docked **Brushes** palette and select **Add brush**.

![Adding a brush in Drawpile][13]

If the **Brushes** palette isn't visible, go to the **View** menu in the top menu bar and select **Brushes** from the **Docks** submenu.

### Collaborative drawing

To participate in a shared drawing session, go to the **Session** menu and click either **Host** to host a session or **Join** to join in on an existing one.

#### Hosting a session

If you're hosting a session, give your session a title and an optional password (or leave it blank to allow anyone in). In the **Server** section, set whether you're hosting the session from your computer or from someone else's server. You can host sessions on **pub.drawpile.net** for free, but all of your data will be sent out to the internet, which could affect performance. If you have a good internet connection, the lag is negligible, but if you're not confident in your internet speed or there's no reason to go out to the internet because your collaborators are in the same building as you, then you can host your session locally.

![Settings for hosting a session][14]

If you host locally, you must provide your IP address or computer name (ending in **.local**) to your collaborators so their Drawpile apps can find your computer. You can find your computer name in the **Sharing** preferences of the GNOME desktop if you're on Linux:

![Sharing Drawpile in GNOME][15]

You must enable Remote Login, and possibly adjust your [firewall settings][16] to allow other users to get through.

On macOS and Windows, you may be running a firewall, and you may need to provide additional sharing permissions in your control panel or system settings.

#### Joining a session

If you're joining a session, you need to know either the URL or the IP address of the session you're trying to join. A URL is like a website address, such as syntheticdreams.net/listing. An IP address is the numerical version of a URL, such as 93.184.216.34. Some IP addresses are internal to your building, while others exist out on the internet. If you haven't been invited to a drawing session, you might be able to find a public group on Drawpile's [Communities][17] page.

### Drawing with friends

Open source has always been about sharing. Drawpile is not only software you can share with your friends and colleagues; it's software that allows you to work with them in a fun and creative way. Try Drawpile for your next project or boardroom meeting!

Nick Hamilton talks about what he loves about the open source digital painting tool, Krita, prior...

Akkana Peck shares three of her favorite GIMP tools.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/drawpile

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/markers_whiteboard_draw.png?itok=hp6v1gHC (markers for a whiteboard)
[2]: https://krita.org/en/
[3]: http://mypaint.org
[4]: https://krita.org/en/item/interview-with-alexandru-sabo/
[5]: https://paizo.com/products/btpy9g9x?Pathfinder-Roleplaying-Game-Bestiary-5
[6]: https://www.gimp.org/
[7]: https://drawpile.net
[8]: https://opensource.com/sites/default/files/uploads/drawpile-ui.jpg (Drawpile's UI)
[9]: https://opensource.com/article/19/10/how-build-flatpak-packaging
[10]: https://flathub.org/apps/details/net.drawpile.drawpile
[11]: https://drawpile.net/download/
[12]: https://opensource.com/life/16/10/animation-krita
[13]: https://opensource.com/sites/default/files/uploads/drawpile-brush-add.jpg (Adding a brush in Drawpile)
[14]: https://opensource.com/sites/default/files/uploads/drawpile-session-host.png (Settings for hosting a session)
[15]: https://opensource.com/sites/default/files/uploads/gnome-sharing.png (Sharing Drawpile in GNOME)
[16]: https://opensource.com/article/19/7/make-linux-stronger-firewalls
[17]: https://drawpile.net/communities
