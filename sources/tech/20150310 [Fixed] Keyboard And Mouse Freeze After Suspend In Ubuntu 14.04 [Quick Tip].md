translating by martin.

[Fixed] Keyboard And Mouse Freeze After Suspend In Ubuntu 14.04 [Quick Tip]
================================================================================
### Problem: ###

When Ubuntu 14.04 or 14.10 comes back from sleep or suspend mode, the keyboard and mouse freeze. Nothing can be clicked or entered. The only way out is to force shutdown the system by pressing the power button. This is very inconvenient, rather very annoying. Because the default behavior in Ubuntu is that when you close the lid of the laptop, it goes in sleep mode.

In this quick post, we shall see how to fix this issue of mouse freeze after suspend in Ubuntu 14.04 and 14.10.

### Solution to mouse freezing after sleep in Ubuntu 14.04 ###

The issue is actually coming from Kernel upgrade. I am not sure of the reason why, but a re-install of  input device driver seems to be fixing this issue.

    sudo apt-get install --reinstall xserver-xorg-input-all

This quick tip was based on a question asked by an It’s FOSS reader, Dev. Try this quick tip and see if it works for you as well. In a similar issue, you can [fix no Unity, launcher and dash after logging in to Ubuntu][1].

--------------------------------------------------------------------------------

via: http://itsfoss.com/keyboard-mouse-freeze-suspend/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/how-to-fix-no-unity-no-launcher-no-dash-in-ubuntu-12-10-quick-tip/
