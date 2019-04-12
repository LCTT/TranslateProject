[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install and Configure Plex on Ubuntu Linux)
[#]: via: (https://itsfoss.com/install-plex-ubuntu)
[#]: author: (Chinmay https://itsfoss.com/author/chinmay/)

How to Install and Configure Plex on Ubuntu Linux
======

When you are a media hog and have a big collection of movies, photos or music, the below capabilities would be very handy.

  * Share media with family and other people.
  * Access media from different devices and platforms.



Plex ticks all of those boxes and more. Plex is a client-server media player system with additional features. Plex supports a wide array of platforms, both for the server and the player. No wonder it is considered one of the [best media servers for Linux][1].

Note: Plex is not a completely open source media player. We have covered it because this is one of the frequently [requested tutorial][2].

### Install Plex on Ubuntu

For this guide I am installing Plex on Elementary OS, an Ubuntu based distribution. You can still follow along if you are installing it on a headless Linux machine.

Go to the Plex [downloads][3] page, select Ubuntu 64-bit (I would not recommend installing it on a 32-bit CPU) and download the .deb file.

![][4]

[Download Plex][3]

You can [install the .deb file][5] by just clicking on the package. If it does not work, you can use an installer like **Eddy** or **[GDebi][6].**

You can also install it via the terminal using dpkg as shown below.

Install Plex on a headless Linux system

For a [headless system][7], you can use **wget** to download the .deb package. This example uses the current link for Ubuntu, at the time of writing. Be sure to use the up-to-date version supplied on the Plex website.

```
wget https://downloads.plex.tv/plex-media-server-new/1.15.1.791-8bec0f76c/debian/plexmediaserver_1.15.1.791-8bec0f76c_amd64.deb
```

The above command downloads the 64-bit .deb package. Once downloaded install the package using the following command.

```
dpkg -i plexmediaserver*.deb
```

Enable version upgrades for Plex

The .deb installation does create an entry in sources.d, but [repository updates][8] are not enabled by default and the contents of _plexmediaserver.list_ are commented out. This means that if there is a new Plex version available, your system will not be able to update your Plex install.

To enable repository updates you can either remove the # from the line starting with deb or run the following commands.

```
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
```

The above command updates the entry in sources.d directory.

We also need to add Plex’s public key to facilitate secure and safe downloads. You can try running the command below, unfortunately this **did not work for me** and the [GPG][9] key was not added.

```
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
```

To fix this issue I found out the key hash for from the error message after running _sudo apt-get update._

![][10]

```
97203C7B3ADCA79D
```

The above hash can be used to add the key from the key-server. Run the below commands to add the key.

```
gpg --keyserver https://downloads.plex.tv/plex-keys/PlexSign.key --recv-keys 97203C7B3ADCA79D
```

```
gpg --export --armor 97203C7B3ADCA79D|sudo apt-key add -
```

You should see an **OK** once the key is added.

Run the below command to verify that the repository is added to the sources list successfully.

```
sudo apt update
```

To update Plex to the newest version available on the repository, run the below [apt-get command][11].

```
sudo apt-get --only-upgrade install plexmediaserver
```

Once installed the Plex service automatically starts running. You can check if its running by running the this command in a terminal.

```
systemctl status plexmediaserver
```

If the service is running properly you should see something like this.

![Check the status of Plex Server][12]

### Configuring Plex as a Media Server

The Plex server is accessible on the ports 32400 and 32401. Navigate to **localhost:32400** or **localhost:32401** using a browser. You should replace the ‘localhost’ with the IP address of the machine running Plex server if you are going headless.

The first time you are required to sign up or log in to your Plex account.

![Plex Login Page][13]

Now you can go ahead and give a friendly name to your Plex Server. This name will be used to identify the server over the network. You can also have multiple Plex servers identified by different names on the same network.

![Plex Server Setup][14]

Now it is finally time to add all your collections to the Plex library. Here your collections will be automatically get indexed and organized.

You can click the add library button to add all your collections.

![Add Media Library][15]

![][16]

Navigate to the location of the media you want to add to Plex .

![][17]

You can add multiple folders and different types of media.

When you are done, you are taken to a very slick looking Plex UI. You can already see the contents of your libraries showing up on the home screen. It also automatically selects a thumbnail and also fills the metadata.

![][18]

You can head over to the settings and configure some of the settings. You can create new users( **only with Plex Pass** ), adjust the transcoding settings set scheduled library updates and more.

If you have a public IP assigned to your router by the ISP you can also enable Remote Access. This means that you can be traveling and still access your libraries at home, considering you have your Plex server running all the time.

Now you are all set up and ready, but how do you access your media? Yes you can access through your browser but Plex has a presence in almost all platforms you can think of including Android Auto.

### Accessing Your Media and Plex Pass

You can access you media either by using the web browser (the same address you used earlier) or Plex’s suite of apps. The web browser experience is pretty good on computers and can be better on phones.

Plex apps provide a much better experience. But, the iOS and Android apps need to be activated with a [Plex Pass][19]. Without activation you are limited to 1 minute of video playback and images are watermarked.

Plex Pass is a premium subscription service which activates the mobile apps and enables more features. You can also individually activate your apps tied to a particular phone for a cheaper price. You can also create multiple users and set permissions with the Plex Pass which is a very handy feature.

You can check out all the benefits of Plex Pass [here][19].

_Note: Plex Meida Player is free on all platforms other than Android and iOS App._

**Conclusion**

That’s about all things you need to know for the first time configuration, go ahead and explore the Plex UI, it also gives you access to free online content like podcasts and music through Tidal.

There are alternatives to Plex like [Jellyfin][20] which is free but native apps are in beta and on road to be published on the App stores.You can also use a NAS with any of the freely available media centers like Kodi, OpenELEC or even VLC media player.

Here is an article listing the [best Linux media servers.][1]

Let us know your experience with Plex and what you use for your media sharing needs.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-plex-ubuntu

作者：[Chinmay][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/chinmay/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-linux-media-server/
[2]: https://itsfoss.com/request-tutorial/
[3]: https://www.plex.tv/media-server-downloads/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/downloads-plex.png?ssl=1
[5]: https://itsfoss.com/install-deb-files-ubuntu/
[6]: https://itsfoss.com/gdebi-default-ubuntu-software-center/
[7]: https://www.lions-wing.net/lessons/servers/home-server.html
[8]: https://itsfoss.com/ubuntu-repositories/
[9]: https://www.gnupg.org/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/Screenshot-from-2019-03-26-07-21-05-1.png?ssl=1
[11]: https://itsfoss.com/apt-get-linux-guide/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/check-plex-service.png?ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/plex-home-page.png?ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/Plex-server-setup.png?ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/add-library.png?ssl=1
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/add-plex-library.png?ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/add-plex-folder.png?ssl=1
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/Screenshot-from-2019-03-17-22-27-56.png?ssl=1
[19]: https://www.plex.tv/plex-pass/
[20]: https://jellyfin.readthedocs.io/en/latest/
