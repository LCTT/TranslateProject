Translating by GOLinux ...
Reset Unity and Compiz Settings in Ubuntu 14.04 [Quick Tip]
================================================================================
If you keep experimenting with your Ubuntu system you might end up with a messed up Unity and Compiz settings. In this quick tip we shall see how to reset Unity and Compiz settings in Ubuntu 14.04. In fact it is all about running a couple of commands.

### Reset Unity and Compiz settings in Ubuntu 14.04 ###

Open a terminal (Ctrl+Alt+T) and use the following command to reset compiz:

    dconf reset -f /org/compiz/

When you have reset compiz, restart Unity:

    setsid unity

Optionally, if you want to reset Unity to the default launcher icons, try the command below:

    unity --reset-icons

### Possible troubleshoot: ###

If you encounter an error like this while resetting the compiz:

> error: GDBus.Error:org.gtk.GDBus.UnmappedGError.Quark._g_2dfile_2derror_2dquark.Code17: Cannot open dconf database: invalid gvdb header

The possible reason is that user file has messed up. Make a back up of dconf config and remove the config file:

    mv ~/.config/dconf/ ~/.config/dconf.bak

I hope this quick tip helped you to reset Unity and compiz in Ubuntu 14.04. Any questions or suggestions are always welcomed.

--------------------------------------------------------------------------------

via: http://itsfoss.com/reset-unity-compiz-settings-ubuntu-1404/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
