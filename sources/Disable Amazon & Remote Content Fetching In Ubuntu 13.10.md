(翻译中 by whatever1992)

Disable Amazon & Remote Content Fetching In Ubuntu 13.10
================================================================================
Now that Ubuntu 13.10 has been released, it’s now time to sit back and configure some settings that will suit your needs. Ubuntu 13.10 comes with many things and some of those may not be what you want when you install or upgrade Ubuntu.

For example, when you install or upgrade to Ubuntu 13.10, you’ll automatically get Amazon and other commercial shopping scopes enabled. These lenses show up when you open Unity Dash. When you perform searches from Dash, content that matches your search terms will also be delivered from remote sources like Amazon as well.

These added features provided by Canonical may be good for some, but for few users, this may be something they don’t want.

Because fetching content from remote sources requires bandwidth, this may have a negative impact on your Internet bill especially if you live in areas that charges based on usages.

For other users who may have security and privacy concerns, automatically searching remote sources from your local machine maybe not be the best idea. Some just don’t want commercial companies showing their products to them when performing basic searches from their local machines.

This brief tutorial is going to show you how to quick disable Amazon and all remote content fetching when using Ubuntu 13.10.

To get started, press **Ctrl – Alt – T** on your keyboard to show the terminal or console. When it opens, run the commands below to disable the feature.

    gsettings set com.canonical.Unity.Lenses remote-content-search 'none'

If you want to re-enable it, run the commands below.

    gsettings set com.canonical.Unity.Lenses remote-content-search 'all'

You’ll have to re-logon or restart your machine for the changes to take effect. After doing that, no remote sources will be use in your searches when using Ubuntu.

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/10/disable-amazon-remote-content-fetching-ubuntu-13-10/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
