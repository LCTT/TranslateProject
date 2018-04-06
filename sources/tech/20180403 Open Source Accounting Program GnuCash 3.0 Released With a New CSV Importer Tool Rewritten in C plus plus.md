Open Source Accounting Program GnuCash 3.0 Released With a New CSV Importer Tool Rewritten in C++
============================================================

The free and open source accounting software, [GnuCash][10] has released its version 3.0\. The software that was first released in 1998 under the GNU General Public License (GPL) is available for GNU/Linux, Solaris, BSD, Microsoft and Mac OSX.

The featured change to be seen in GnuCash 3.0 is that it now uses Gtk3 Toolkit and WebKit2Gtk API. According to John Ralls,  _“This change was forced on us by some major Linux distributions dropping support for the WebKit1 API.”_ 

[Suggested readGNU Khata: Open Source Accounting Software][11]

Some major featured changes include a new user interface to manage transaction files, improvement in the removal of old prices from the price database as well as deleted files can now be removed from the history list.

![GnuCash 3.0 Released](https://itsfoss.com/wp-content/uploads/2018/04/gnucash-3-released-featured.jpeg)


### New Features and Improvements in GnuCash 3.0

The new features come on two fronts, for the Users and for the Developers.

*   Gtk+-3.0 Toolkit and WebKit2Gtk API: GnuCash 3.0 now uses Gtk+-3.0 Toolkit and WebKit2Gtk API. This is because some some major Linux Distros have dropped support for the WebKit1 API. It should also be noted that the WebKit project does not support Microsoft Windows so it can only use WebKit1 API alongside Gtk3.

*   Database Management Changes: A new user interface is now available for users to manage transaction files. New editors are now able to remove old or incorrect match data from import maps. There is an improvement in the tool used to remove old prices from the database as well as clear deleted files in the file menu’s history list.

*   CSV Importer: A new feature that has been partly rewritten in [C++][1] is now available whereby users can re-import CSV files that were exported from GnuCash. This works alongside a separate CSV price importer.

*   Each operating system now has data file directories allocated appropriately by default. For Linux, it is $XDG_CONFIG_HOME/gnucash (or the default $HOME/.config/gnucash). However, it is possible for users to override it with the environment variable, GNC_DOC_PATH which has replaced GNC_DOT_DIR in older versions of GnuCash.

*   GnuCash has dropped Guile-1.8 and now supports Guile-2.2

*   The appearance of chart reports have been improved and now comes with modern chart colors.

*   Transaction Report: Improvements have also been made in transaction reporting with a “Subtotal Summary Grid” now included.

Other changes include an improvement in the dialog box layout which now includes the detected Finance::Quote version; the maximum fraction digit has been increased from 6 to 9 and prices can now go up to 18-digit precision. Checkout the [release note][13] for other improvements and new features for developers.

### Download and installation of GnuCash 3.0

Though GnuCash is available in the software repositories of all major Linux distributions, it will take some time before it gets updated to the latest version 3.0. 

Till then, either you wait or you download the [source code][14] and build it yourself.

[Download GnuCash 3.0 Source Code][15]

Have you used GnuCash before for personal accounting or for business? Share your experience with us in the comment section below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/gnucash-3-release/

作者：[ Derick Sullivan M. Lobga][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/derick/
[1]:https://itsfoss.com/c-plus-plus-ubuntu/
[2]:https://itsfoss.com/author/derick/
[3]:https://itsfoss.com/gnucash-3-release/#comments
[4]:https://www.facebook.com/share.php?u=https%3A%2F%2Fitsfoss.com%2Fgnucash-3-release%2F%3Futm_source%3Dfacebook%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[5]:https://twitter.com/share?original_referer=/&text=Open+Source+Accounting+Program+GnuCash+3.0+Released+With+a+New+CSV+Importer+Tool+Rewritten+in+C%2B%2B&url=https://itsfoss.com/gnucash-3-release/%3Futm_source%3Dtwitter%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare&via=itsfoss2
[6]:https://plus.google.com/share?url=https%3A%2F%2Fitsfoss.com%2Fgnucash-3-release%2F%3Futm_source%3DgooglePlus%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[7]:https://www.linkedin.com/cws/share?url=https%3A%2F%2Fitsfoss.com%2Fgnucash-3-release%2F%3Futm_source%3DlinkedIn%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[8]:http://www.stumbleupon.com/submit?url=https://itsfoss.com/gnucash-3-release/&title=Open+Source+Accounting+Program+GnuCash+3.0+Released+With+a+New+CSV+Importer+Tool+Rewritten+in+C%2B%2B
[9]:https://www.reddit.com/submit?url=https://itsfoss.com/gnucash-3-release/&title=Open+Source+Accounting+Program+GnuCash+3.0+Released+With+a+New+CSV+Importer+Tool+Rewritten+in+C%2B%2B
[10]:https://www.gnucash.org/
[11]:https://itsfoss.com/using-gnu-khata/
[12]:http://pinterest.com/pin/create/bookmarklet/?media=https://itsfoss.com/wp-content/uploads/2018/04/gnucash-3-released-featured.jpeg&url=https://itsfoss.com/gnucash-3-release/?utm_source=newsletter&utm_medium=email&utm_campaign=linux_and_open_source_articles_this_week&utm_term=2018-04-05&is_video=false&description=GnuCash%203.0%20Released
[13]:https://lists.gnucash.org/pipermail/gnucash-user/2018-April/075866.html
[14]:https://itsfoss.com/install-software-from-source-code/
[15]:http://downloads.sourceforge.net/sourceforge/gnucash/gnucash-3.0.tar.bz2
