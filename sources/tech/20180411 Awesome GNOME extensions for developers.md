Awesome GNOME extensions for developers
======

![](https://fedoramagazine.org/wp-content/uploads/2018/04/gnome-extensions-for-developers-816x345.jpg)
Extensions add immense flexibility to the GNOME 3 desktop environment. They give users the advantage of customizing their desktop while adding ease and efficiency to their workflow. The Fedora Magazine has already covered some great desktop extensions such as [EasyScreenCast][1], [gTile][2], and [OpenWeather][3]. This article continues that coverage by focusing on extensions tailored for developers.

If you need assistance installing GNOME extensions, refer to the article [How to install a GNOME Shell extension][4].

### ![Docker Integration extension icon][5] Docker Integration

![Docker Integration extension status menu][6]

The [Docker Integration][7] extension is a must for developers using Docker for their apps. The status menu provides a list of Docker containers with the option to start, stop, pause and even remove them. The list updates automatically as new containers are added to the system.

After installing this extension, Fedora users may get the message: “Error occurred when fetching containers.” This is because Docker commands require sudo or root permissions by default. To configure your user account to run Docker, refer to the [Docker Installation page on the Fedora Developer Portal][8].

You can find more information on the [extension’s website][9].

### ![Jenkins CI Server Indicator icon][10] Jenkins CI Server Indicator

![Jenkins CI Server Indicator extension status menu][11]

The [Jenkins CI Server Indicator][12] extension makes it easy for developers to build their apps on a Jenkins CI Server. It displays a menu with a list of jobs and the state of those jobs. It also includes features such as easy access to the Jenkins web front-end, notifications for completed jobs, and the ability to trigger and filter jobs.

For more information, visit the [developer’s site][13].

### ![android-tool extension icon][14] android-tool

![android-tool extension status menu][15][android-tool][16] can be a valuable extension for Android developers. Features include capturing bug reports, device screenshots and screen-recording. It can also connect to the Android device via USB or TCP.

This extension does require the adb package. To install adb from the official Fedora repository [run this command][17]:
```
sudo dnf install android-tools

```

You can find more information at [the extension Github site][18].

### ![GnomeHub extension icon][19] GnomeHub

![GnomeHub extension status menu][20][GnomeHub][21] is a great extension for GNOME users using Github for their projects. It displays Github repositories and notifies the user of opened pull requests. In addition, users can add their favorite repositories in the extension’s settings.

For more information, refer to [the project’s Github page][22].

### ![gistnotes extension icon][23] gistnotes

Quite simply, [gistnotes][24] provides easy access for gist users to create, store and manage notes or code snippets. For more information refer to [the project’s website][25].

![gistnotes window][26]

### ![Arduino Control extension icon][27] Arduino Control

The [Arduino Control][28] extension allows users to connect to, and control, their Arduino boards. It also lets users add sliders and switches in the status menu. In addition, the developer includes scripts in the extension’s directory to connect to the board via Ethernet or USB.

Most importantly, this extension can be customized to fit your project. An example provided in the README file is the ability to “Control your Room Lights from any Computer on the Network.”

You can read more about the features and setup of this extension on [the project’s Github page][29].

### ![Hotel Manager extension icon][30] Hotel Manager

![Hotel Manager extension status menu.][31]

Developers using the Hotel process manager for their web apps should explore the [Hotel Manager][32] extension. It displays a list of web apps added to Hotel, and gives users the ability to start, stop and restart those apps. Furthermore, the computers icon to the right gives quick access to open, or view, that web app. The extension can also start, stop, or restart the Hotel daemon.

As of the publication of this article, Hotel Manager version 4 for GNOME 3.26 does not list the web apps in the extension’s drop-down menu. Version 4 also gives errors when installing on Fedora 28 (GNOME 3.28). However, version 3 works with Fedora 27 and Fedora 28.

For more details, see [the project’s Github page][33].

### VSCode Search Provider

[VSCode Search Provider][34] is a simple extension that displays Visual Studio Code projects in the GNOME overview search results. For heavy VSCode users, this extension saves time by giving developers quick access to their projects. You can find more information on [the project’s Github page][35].

![GNOME Overview search results showing VSCode projects.][36]

Do you have a favourite extension you use for development? Let us know in the comments.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/awesome-gnome-extensions-developers/

作者：[Shaun Assam][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/sassam/
[1]:https://fedoramagazine.org/screencast-gnome-extension/
[2]:https://fedoramagazine.org/must-have-gnome-extension-gtile/
[3]:https://fedoramagazine.org/weather-updates-openweather-gnome-shell-extension/
[4]:https://fedoramagazine.org/install-gnome-shell-extension/
[5]:https://fedoramagazine.org/wp-content/uploads/2017/08/dockericon.png
[6]:https://fedoramagazine.org/wp-content/uploads/2017/08/docker-extension-menu.png
[7]:https://extensions.gnome.org/extension/1065/docker-status/
[8]:https://developer.fedoraproject.org/tools/docker/docker-installation.html
[9]:https://github.com/gpouilloux/gnome-shell-extension-docker
[10]:https://fedoramagazine.org/wp-content/uploads/2017/08/jenkinsicon.png
[11]:https://fedoramagazine.org/wp-content/uploads/2017/08/jenkins-extension-menu.png
[12]:https://extensions.gnome.org/extension/399/jenkins-ci-server-indicator/
[13]:https://www.philipphoffmann.de/gnome-3-shell-extension-jenkins-ci-server-indicator/
[14]:https://fedoramagazine.org/wp-content/uploads/2017/08/androidtoolicon.png
[15]:https://fedoramagazine.org/wp-content/uploads/2017/08/android-tool-extension-menu.png
[16]:https://extensions.gnome.org/extension/1232/android-tool/
[17]:https://fedoramagazine.org/howto-use-sudo/
[18]:https://github.com/naman14/gnome-android-tool
[19]:https://fedoramagazine.org/wp-content/uploads/2017/08/gnomehubicon.png
[20]:https://fedoramagazine.org/wp-content/uploads/2017/08/gnomehub-extension-menu.png
[21]:https://extensions.gnome.org/extension/1263/gnomehub/
[22]:https://github.com/lagartoflojo/gnomehub
[23]:https://fedoramagazine.org/wp-content/uploads/2017/08/gistnotesicon.png
[24]:https://extensions.gnome.org/extension/917/gistnotes/
[25]:https://github.com/mohan43u/gistnotes
[26]:https://fedoramagazine.org/wp-content/uploads/2018/04/gistnoteswindow.png
[27]:https://fedoramagazine.org/wp-content/uploads/2017/08/arduinoicon.png
[28]:https://extensions.gnome.org/extension/894/arduino-control/
[29]:https://github.com/simonthechipmunk/arduinocontrol
[30]:https://fedoramagazine.org/wp-content/uploads/2017/08/hotelicon.png
[31]:https://fedoramagazine.org/wp-content/uploads/2017/08/hotelmanager-extension-menu.png
[32]:https://extensions.gnome.org/extension/1285/hotel-manager/
[33]:https://github.com/hardpixel/hotel-manager
[34]:https://extensions.gnome.org/extension/1207/vscode-search-provider/
[35]:https://github.com/jomik/vscode-search-provider
[36]:https://fedoramagazine.org/wp-content/uploads/2018/04/vscodesearch.png
