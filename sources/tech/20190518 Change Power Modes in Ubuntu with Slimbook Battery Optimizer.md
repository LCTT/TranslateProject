[#]: collector: (lujun9972)
[#]: translator: (zhs852)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Change Power Modes in Ubuntu with Slimbook Battery Optimizer)
[#]: via: (https://itsfoss.com/slimbook-battry-optimizer-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Change Power Modes in Ubuntu with Slimbook Battery Optimizer
======

_**Brief: Slimbook Battery is a nifty applet indicator that allows you to quickly change the power mode on your Linux laptop and thus save battery life.**_

[Slimbook][1], the Spanish computer vendor that sells [laptops preloaded with Linux][2], has released a handy little application to optimize battery performance in Ubuntu-based Linux distributions.

Since Slimbook sells its own Linux systems, they have created a few applications to tweak the performance of Linux on their hardware. This battery optimizer is one such tool.

You don’t need to buy a Slimbook product to use this nifty application because Slimbook has made it available via [their official PPA][3].

### Slimbook battery optimizer application

The application is called Slimbook Battery. It is basically an applet indicator that sits on the top panel and gives you quick access to various power/battery modes.

![Slimbook Battery Mode Ubuntu][4]

You might have seen it in Windows where you can put your laptop in one of the power modes. Slimbook Battery also offers similar battery saving modes here:

  * Energy Saving: For maximum battery saving
  * Balanced: A compromise between performance and power saving
  * Maximum Performance: For maximum performance obviously



You can configure all these modes from the advanced mode:

![Configure various power modes][5]

If you feel like you have messed up the configuration, you can set things back to normal with ‘restore default values’ option.

You can also change the general configuration of the application like auto-start, default power mode etc.

![Slimbook Battery general configuration][6]

Skimbook has a dedicated page that provides more information on various power saving parameters. If you want to configure things on your own, you should refer to [this page][7].

I have noticed that the interface of Slimbook Battery needs some improvements. For example, the ‘question mark’ icon on some parameters should be clickable to provide more information. But clicking the question mark icon doesn’t do anything at the time of writing this article.

Altogether, Slimbook Battery is a handy app you can use for quickly switching the power mode. If you decide to install it on Ubuntu and other Ubuntu-based distributions such as Linux Mint, elementary OS etc, you can use its official [PPA][8].

[][9]

Suggested read Ubuntu Forums Hacked, User Data Stolen!!!

#### Install Slimbook Batter in Ubuntu-based distributions

Open a terminal and use the following commands one by one:

```
sudo add-apt-repository ppa:slimbook/slimbook
sudo apt update
sudo apt install slimbookbattery
```

Once installed, search for Slimbook Battery in the menu:

![Start Slimbook Battery Optimizer][10]

When you click on it to start it, you’ll find it in the top panel. From here, you can select your desired power mode.

![Slimbook Battery power mode][4]

#### Remove Slimbook Battery

If you don’t want to use this application, you can remove it using the following commands:

```
sudo apt remove slimbookbattery
sudo add-apt-repository -r ppa:slimbook/slimbook
```

In my opinion, such applications serves a certain purpose and should be encouraged. This tool gives you an easy way to change the power mode and at the same time, it gives you more tweaking options for various performance settings.

Did you use Slimbook Battery? What’s your experience with it?

--------------------------------------------------------------------------------

via: https://itsfoss.com/slimbook-battry-optimizer-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://slimbook.es/en/
[2]: https://itsfoss.com/get-linux-laptops/
[3]: https://launchpad.net/~slimbook/+archive/ubuntu/slimbook
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/slimbook-battery-mode-ubuntu.jpg?resize=800%2C400&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/slimbook-battery-optimizer-2.jpg?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/slimbook-battery-optimizer-1.jpg?ssl=1
[7]: https://slimbook.es/en/tutoriales/aplicaciones-slimbook/398-slimbook-battery-3-application-for-optimize-battery-of-your-laptop
[8]: https://itsfoss.com/ppa-guide/
[9]: https://itsfoss.com/ubuntu-forums-hacked-again/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/slimbook-battery-optimizer.jpg?ssl=1
