Translating--------------geekpi


How To Watch Netflix In Ubuntu 14.04 With Netflix Desktop App
================================================================================
Watching Netflix on Windows is easy. You can use the web browser or the desktop app but its not the same story in Linux. It does not work by default in Linux as Netflix requires [Microsoft Silverlight][1] and since it’s “the Microsoft”, it is obviously not available on Linux. So is there no way we can use Neflix in Linux? Of course, there is. In this article we shall see how to watch Netflix in Ubuntu 14.04 (and perhaps older versions such as 13.10, 13.04 etc as well).

### How to watch Netflix in Ubuntu 14.04: ###

We shall be using [Pipelight][2], a project that brings Silverlight support to Linux via [Wine][3]. The project is in beta but works quite well. Let’s see how to install Pipelight in Ubuntu 14.04.

#### Install Pipelight in Ubuntu 14.04 ####

Installing Pipelight in Ubuntu 14.04 is very easy thanks to the PPA by Pipelight team. Open a terminal and run the following commands one by one:

    sudo apt-add-repository ppa:pipelight/stable
    sudo apt-get update
    sudo apt-get install pipelight-multi

It’s around 450 MB of download so it may take some time if you have slow internet connection. Also, Pipelight is in beta, therefore check the installation instructions here (in case, if they change it in future).

#### Enable Sliverlight to play Netflix ####

Usually silverlight plugin should have been enabled with Pipelight by default but just to make sure, enable Silverlight using the command below:

    sudo pipelight-plugin --enable silverlight

There will be two conditions to accept, once you do that, it will take some more time to install Silverlight.

#### Install Netflix desktop app in Ubuntu 14.04 ####

By this time, you should be able to use Netflix in web browsers. But there is more to it from Pipelight project. The PPA which we just used, also contains Netflix desktop app for Ubuntu. To install the Netflix desktop app, use the following command:

    sudo apt-get install netflix-desktop

Once installed, you can search for Netflix in Unity Dash.

![](http://itsfoss.com/wp-content/uploads/2014/04/Netflix_Desktop_App_Ubuntu.png)

At first run, it will install some Wine related stuff. Let it do that. Afterwards, it should run fine:

![](http://itsfoss.com/wp-content/uploads/2014/04/Netflix_desktop_app_Ubuntu_1404.jpeg)

### Using Netflix outside USA in Ubuntu : ###

Did you notice the Netflix desktop app above? It says that Netflix is not available in my country of residence (i.e. France). I am not a Netflix fan but I have written about [how to watch Netflix outside US easily][4]. If you want to watch Netflix outside USA, you can change DNS settings for this purpose. Tunlr was a free service which was shutdown.

Alternatively, I used [Unlocator][5] while it was free in beta. Extremely easy to use and excellent was the experience. Unlocator is not free anymore but if you could spend around $5 per month, [Unlocator][5] is an excellent DNS unlocker service.

--------------------------------------------------------------------------------

via: http://itsfoss.com/netflix-ubuntu-1404-desktop-app/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.microsoft.com/silverlight/
[2]:http://fds-team.de/cms/articles/2013-08/pipelight-using-silverlight-in-linux-browsers.html
[3]:http://en.wikipedia.org/wiki/Wine_(software)
[4]:http://itsfoss.com/easiest-watch-netflix-hulu-usa/
[5]:http://goo.gl/QHT0oq
