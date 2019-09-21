Streama – Setup Your Own Streaming Media Server In Minutes
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/streama-720x340.png)

**Streama** is a free, open source application that helps to setup your own personal streaming media server in minutes in Unix-like operating systems. It’s like Netflix, but self-hostable. You can deploy it on your local system or VPS or dedicated server and stream the media files across multiple devices. The media files can be accessed from a web-browser from any system on your network. If you have deployed on your VPS, you can access it from anywhere. Streama works like your own personal Netflix system to stream your TV shows, videos, audios and movies. Streama is a web-based application written using Grails 3 (server-side) with SpringSecurity and all frond-end components are written in AngularJS. The built-in player is completely HTML5-based.

### Prominent Features

Streama ships with a lot features as listed below.

  * Easy to install configure. You can either download docker instance and fire up your media server in minutes or install vanilla version on your local or VPS or dedicated server.
  * Drag and drop support to upload media files.
  * Live sync watching support. You can watch videos with your friends, family remotely. It doesn’t matter where they are. You can all watch the same video at a time.
  * Built-in beautiful video player to watch/listen video and audio.
  * Built-in browser to access the media files in the server.
  * Multi-user support. You can create individual user accounts to your family members and access the media server simultaneously.
  * Streama supports pause-play option. Pause the playback at any time and Streama remembers where you left off last time.
  * Streama can be able to detect similar movies and videos and shows for you to add.
  * Self-hostable
  * It is completely free and open source.



What do you need more? Streama has everything you to need to setup a full-fledged streaming media server in your Linux box.

### Setup Your Own Streaming Media Server Using Streama

Streama requires JAVA 8 or later, preferably **OpenJDK**. And, the recommended OS is **Ubuntu**. For the purpose of this guide, I will be using Ubuntu 18.04 LTS.

By default, the latest Ubuntu 18.04 includes Open JDK 11. To install default openJDK in Ubuntu 18.04 or later, run:

```
$ sudo apt install default-jdk

```

Java 8 is the latest stable Long Time Support version. If you prefer to use Java LTS, run:

```
$ sudo apt install openjdk-8-jdk
```

I have installed openjdk-8-jdk. To check the installed Java version, run:

```
$ java -version
openjdk version "1.8.0_181"
OpenJDK Runtime Environment (build 1.8.0_181-8u181-b13-0ubuntu0.18.04.1-b13)
OpenJDK 64-Bit Server VM (build 25.181-b13, mixed mode)
```

Once java installed, create a directory to save Streama executable and yml files.

```
$ sudo mkdir /data

$ sudo mkdir /data/streama
```

I followed the official documentation, so I used this path – /data/streama. It is optional. You’re free to use any location of your choice.

Switch to streama directory:

```
$ cd /data/streama
```

Download the latest Streama executable file from [**releases page**][1]. As of writing this guide, the latest version was **v1.6.0-RC8**.

```
$ sudo wget https://github.com/streamaserver/streama/releases/download/v1.6.0-RC8/streama-1.6.0-RC8.war
```

Make it executable:

```
$ sudo chmod +x streama-1.6.0-RC8.war
```

Now, run Streama application using command:

```
$ sudo ./streama-1.6.0-RC8.war
```

If you an output something like below, Streama is working!

```
INFO streama.Application - Starting Application on ubuntuserver with PID 26714 (/data/streama/streama-1.6.0-RC8.war started by root in /data/streama)
DEBUG streama.Application - Running with Spring Boot v1.4.4.RELEASE, Spring v4.3.6.RELEASE
INFO streama.Application - The following profiles are active: production

Configuring Spring Security Core ...
... finished configuring Spring Security Core

INFO streama.Application - Started Application in 92.003 seconds (JVM running for 98.66)
Grails application running at http://localhost:8080 in environment: production
```

Open your web browser and navigate to URL – **<http://ip-address:8080>**

You should see Streama login screen. Login with default credentials – **admin/admin**

![](https://www.ostechnix.com/wp-content/uploads/2018/09/streama-login-page.png)

Now, You need to fill out some required base-settings. Click OK button in the next screen and you will be redirected to the settings page. In the Settings page, you need to set some parameters such as the location of the Uploads directory, Streama logo, name of the media server, base URL, allow anonymous access, allow users to download videos. All fields marked with ***** is necessary to fill. Once you provided the details, click **Save settings** button.

![](http://www.ostechnix.com/wp-content/uploads/2018/09/streama-settings.png)

Congratulations! Your media server is ready to use!

Here is how Stream dashboard looks like.

![](http://www.ostechnix.com/wp-content/uploads/2018/09/Streama-dashboard.png)

And, this is the contents management page where you can upload movies, shows, access files via file manager, view the notifications and highlights.

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Manage-contents-in-Streama.png)

### Adding movies/shows

Let me show you how to add a movie.

Go to the **“Manage Content”** page from the dashboard and click **“Create New Movie”** link.

Enter the movie details, such as name, release date, IMDB ID and movie description and click **Save**. These are all optional, you can simply ignore them if you don’t know about the details.

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Add-movie-in-Streama-1.png)

We have added the movie details, but we haven’t added the actual movie yet. To do so, click on the red box in the bottom that says – **“No video file yet! Drop file or Click here to add”**.

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Add-movie-in-Streama-2.png)

You could either drag and drop the movie file inside this dashboard or click on the red box to manually upload it.

Choose the movie file to upload and click Upload.

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Add-movie-in-Streama-3.png)

Once the upload is completed, you could see the uploaded movie details. Click on the three horizontal lines next to the movie if you want to edit/modify movie details.

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Add-movie-in-Streama-4.png)

Similarly, you can create TV shows, videos and audios.

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Add-movie-in-Streama-5.png)

And also the movies/shows are started to appear in the home screen of your dashboard. Simply click on it to play the video and enjoy Netflix experience right from your Linux desktop.

For more details, refer the product’s official website.

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/streama-setup-your-own-streaming-media-server-in-minutes/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://github.com/streamaserver/streama/releases
