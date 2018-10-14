How to Enable Click to Minimize On Ubuntu
============================================================


 _Brief: This quick tutorial shows you how to enable click to minimize option on Ubuntu 18.04 and Ubuntu 16.04._ 

The launcher at the left hand side in [Ubuntu][7] is a handy tool for quickly accessing applications. When you click on an icon in the launcher, the application window appears in focus.

If you click again on the icon of an application already in focus, the default behavior is to do nothing. This may bother you if you expect the application window to be minimized on the second click.

Perhaps this GIF will be better in explaining the click on minimize behavior on Ubuntu.

[video](https://giphy.com/gifs/linux-ubuntu-itsfoss-52FlrSIMxnZ1qq9koP?utm_source=iframe&utm_medium=embed&utm_campaign=Embeds&utm_term=https%3A%2F%2Fitsfoss.com%2Fclick-to-minimize-ubuntu%2F%3Futm_source%3Dnewsletter&%3Butm_medium=email&%3Butm_campaign=new_linux_laptop_ubuntu_1804_flavor_reviews_meltdown_20_and_other_linux_stuff&%3Butm_term=2018-05-23)

In my opinion, this should be the default behavior but apparently Ubuntu doesn’t think so. So what? Customization is one of the main reason [why I use Linux][8] and this behavior can also be easily changed.

In this quick tutorial, I’ll show you how to enable click to minimize on Ubuntu 18.04 and 16.04\. I’ll show both command line and the GUI methods here.


### Enable click to minimize on Ubuntu using command line (recommended)

 _This method is for Ubuntu 18.04 and 17.10 users with [GNOME desktop environment][1]_ .

The first option is using the terminal. I recommend this way to ‘minimize on click’ even if you are not comfortable with the command line.

It’s not at all complicated. Open a terminal using Ctrl+Alt+T shortcut or searching for it in the menu. All you need is to copy paste the command below in the terminal.

```
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
```

No need of restarting your system or any thing of that sort. You can test the minimize on click behavior immediately after it.

If you do not like ‘click to minimize’ behavior, you can set it back to default using the command below:

```
gsettings reset org.gnome.shell.extensions.dash-to-dock click-action
```

### Enable click to minimize on Ubuntu using GUI tool

You can do the same steps mentioned above using a GUI tool called [Dconf Editor][10]. It is a powerful tool that allows you to change many hidden aspects of your Linux desktop. I avoid recommending it because one wrong click here and there may screw up your desktop settings. So be careful while using this tool keeping in mind that it works on single click and changes are applied immediately.

You can find and install Dconf Editor in the Ubuntu Software Center.

![dconf editor in Ubuntu software center](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/dconf-editor-ubuntu-800x250.png)

Once installed, launch Dconf Editor and go to org -> gnome -> shell -> extensions -> dash-to-dock. Scroll down a bit until you find click-action. Click on it to access the click action settings.

In here, turn off the Use default value option and change the Custom Valueto ‘minimize’.

![Enable minmize to click on Ubuntu using dconf editor](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/enable-minimize-click-dconf-800x425.png)

You can see that the minimize on click behavior has been applied instantly.

### Enable click to minimize on Ubuntu 16.04 Unity

If you are using Unity desktop environment, you can easily d it using Unity Tweak Tool. If you have not installed it already, look for Unity Tweak Tool in Software Center and install it.

Once installed, launch Unity Tweak Tool and click on Launcher here.

![Enable minmize to click using Unity Tweak Tool](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/minimiz-click-ubuntu-unity-1.png)

Check the “Minimize single window application on click” option here.

![Enable minmize to click using Unity Tweak Tool](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/minimiz-click-ubuntu-unity.png)

That’s all. The change takes into effect right away.

### Did it work for you?

I hope this quick tip helped you to enable the minimize on click feature in Ubuntu. If you are using Ubuntu 18.04, I suggest reading [GNOME customization tips][11] for more such options.

If you have any questions or suggestions, please leave a comment. If it helped you, perhaps you could share this article on various social media platforms such as Reddit and Twitter.


#### 关于作者

I am a professional software developer, and founder of It's FOSS. I am an avid Linux lover and Open Source enthusiast. I use Ubuntu and believe in sharing knowledge. Apart from Linux, I love classic detective mysteries. I'm a huge fan of Agatha Christie's work.

--------------------------------------------------------------------------------

via: https://itsfoss.com/click-to-minimize-ubuntu/

作者：[Abhishek Prakash ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/abhishek/
[1]:https://www.gnome.org/
[2]:https://itsfoss.com/author/abhishek/
[3]:https://itsfoss.com/click-to-minimize-ubuntu/#comments
[4]:https://itsfoss.com/category/how-to/
[5]:https://itsfoss.com/tag/quick-tip/
[6]:https://itsfoss.com/tag/ubuntu-18-04/
[7]:https://www.ubuntu.com/
[8]:https://itsfoss.com/reasons-switch-linux-windows-xp/
[9]:https://itsfoss.com/how-to-know-ubuntu-unity-version/
[10]:https://wiki.gnome.org/Projects/dconf
[11]:https://itsfoss.com/gnome-tricks-ubuntu/
