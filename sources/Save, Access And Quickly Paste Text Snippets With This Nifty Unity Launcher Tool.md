Save, Access And Quickly Paste Text Snippets With This Nifty Unity Launcher Tool
================================================================================
**Repeatedly typing out certain information – like e-mail or home addresses, verbose terminal commands, and well timed quotes from cult TV shows – can be a chore.**

![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/10/Screen-Shot-2013-10-31-at-13.04.jpg)

*Snippets – Handy Way to Access Stored Text*

Thankfully there are tools out there to help.

*‘Snippets’* is one such utility for Unity. It’s a simple Launcher item that lets you save and store excerpts in a text file, then, when needed, select them from a Unity Quicklist to copy them the clipboard.

Now before anyone throws their underwear at me in disgust, I’m well aware Snippets is not unique – or the first – in offering this sort of feature. But what it is unique in doing is offering it through a Unity Launcher item.

Features-wise, the tool is simple enough, offering:

- Ability to add & access snippets stored in .txt file
- View stored snippets in quicklist
- Click snippets to copy them to clipboard
- Option to add current clipboard item to .txt file

While it’s not a “live” clipboard manager – it only lists items you specifically add; it does not present a history of your most recent clipboard items – it is still a handy little tool.

### How to Install Snippets for Unity ###

To make use of this nifty Snippets launcher item you’ll need to first install the command-line clipboard tool xclip. Hit the button below to get it from the Software Center.

- [Click to Install XClip in Ubuntu][1]

Next up, download the following ‘Snippets‘ archive. This contains everything else needed to use the app.

- [Download ‘Snippets’ Unity Launcher Script][2]

When the archive has downloaded fully you’ll want to extract it. Enter the resulting folder and hit Ctrl+H to reveal hidden files. Move the folder ‘.snippets-launcher‘ to your Home folder. **The utility won’t work if this step isn’t followed**.

Next step is to install the launcher item. This is taken care of by a script inside the folder you just moved, but it doesn’t have executable permissions (needed to install it) so we’ll need to first take care of that, too.

Open a new Terminal window and enter the following commands carefully:

    cd .snippets-launcher/ && chmod +x snippets.sh
    
    ./snippets.sh

That’s it; Snippets should now be ready to use. Open the Unity Dash to search for the Snippets item and drag it onto the launcher.

- Left click on the launcher item opens the text file where you add your snippets
- Right click on the launcher item opens the quick list

Options in the quicklist:

- Left click on a snippet to add it to the clipboard
- Left click ‘Date’ to copy the current date
- Click ‘Add Clipboard Content’ to add current item to .txt file
- After adding items to .txt file click ‘Update Launcher’

For more information on the lazy-making tool, [head over to the Ubuntu Forums thread][3] where its developer, “Stinkeye”, will be happy to help.

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2013/10/unity-launcher-clipboard-snippets-item

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:apt://xclip
[2]:https://www.dropbox.com/s/ha6lngizmz78srv/snippets%20by%20stinkeye.tar.gz
[3]:http://ubuntuforums.org/showthread.php?t=2184916