hunanchenxingyu translating ....
================================================================================
How To Install ‘California’ Calendar App in Ubuntu 14.04
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/05/california-calendar.jpg)

**When non-profit software outfit Yorba revealed that it had [begun work on a new desktop calendar app][1] called ‘California’ last month plenty of us were duly excited — “About time!“, we declared in our own headline. **

And for good reason as Yorba are the hands behind the user-friendly e-mail client ‘Geary‘ and slick photo management software ‘Shotwell‘. Expectations for their foray into Linux productivity software are, naturally, rather high.

Although **California is not yet stable** enough to warrant a formal release it is now available to install on Ubuntu through the company’s daily development PPA.

### Progress So Far ###

“*Neeeeeyaaaaaaaawwnnn!*” — that’s the sound of the caveats plane coming in to land at San Francisco International Airport.

Yes, California is in active development; it’s not finished nor is it stable enough for everyday use by everyday folk who might want to use it. But, if you’re clever enough to deal with a few bugs you can install the app on Ubuntu 14.04.

Whether you should will depend on your needs.

Current builds (i.e., at the time of writing) offers local management and basic support for Google Calendar and web cal (.ics). Events even show up in the GNOME Date/Time applet.

#### Natural Language Input ####

When first launching California you are presented with an overview of the current month. There is not yet — at least that I could find — a way to view by week, by year or by agenda. You can cycle though months using the navigation buttons, however.

New calendars (*e.g., ‘work‘, ‘pet schedule‘*) can be created and toggled on/off by clicking the Calendar icon in the toolbar. Each calendar can be assigned a different colour to help visually differentiate between items when all are shown in the main overview.

To create a new event click the ‘+’ icon and, using **natural language input** in the input box that appears, enter a description of the event you want to file. For example, enter the text “*Bake Sansa Stark A Lemon Cake on Wednesday 2.45 PM*” will lodge a new entry for the following Wednesday at the relevant time (14:45).

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/05/Screen-Shot-2014-05-15-at-21.26.20.png)

I can’t wait for this feature to become a bit more refined. Right now, while it accurately pinpoints dates (give or take) it doesn’t support creation of recurring events (e.g., via “*Skype chat with Sam every Tuesday at 7 AM*“) nor does it fill in locations or people (e.g., “*Coffee with Penelope on Monday 12 PM at Boston Tea Party*“).

For greater control you can also refine and edit entries created by double-clicking on them in the grid view. This will open up a window with additional fields, time pickers, date forms and so on.

#### Lacking In Radiance ####

If there is a drawback to be found (bugs and missing options should be overlooked at this stage) it is appearance. While it looks fantastic under Adwaita, under Ubuntu’s default theme it looks atrocious.

This is not the fault of Yorba (or GNOME) but Ubuntu’s design team who has yet to add theming support for GNOME’s new GTK Header Bars and its modal dialogs to its ‘light themes’.

California is fully useable on Ubuntu it just happens to resemble software run in the aftermath of a failed distribution upgrade. This issue won’t affect those running Ubuntu GNOME or rocking modern third-party GTK3 themes.

### Install California in Ubuntu 14.04 ###

If you glossed over the warning earlier, I’ll repeat: California is unstable and in active development.

The [Yorba Daily PPA][2] also contains newer (unstable) versions of Shotwell and Geary. Adding this PPA to your system will also see these upgraded.

    sudo add-apt-repository ppa:yorba/daily-builds
    sudo apt-get update && sudo apt-get install california

A safer way to try the app out is to [download the .deb installers from the PPA directly][3]:

- [Download California for Ubuntu 14.04 (64bit)][4]
- [Download California for Ubuntu 14.04 (32bit)][5]

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/05/california-calendar-app-hits-yorba-daily-ppa

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.omgubuntu.co.uk/2014/04/yorba-california-calendar-app-linux
[2]:https://launchpad.net/~yorba/+archive/daily-builds/
[3]:https://launchpad.net/~yorba/+archive/daily-builds/+packages
[4]:https://launchpad.net/~yorba/+archive/daily-builds/+files/california_0.1.0-0%7E188%7Eubuntu14.04.1_amd64.deb
[5]:https://launchpad.net/~yorba/+archive/daily-builds/+files/california_0.1.0-0%7E188%7Eubuntu14.04.1_i386.deb