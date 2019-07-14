[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create your own video streaming server with Linux)
[#]: via: (https://opensource.com/article/19/1/basic-live-video-streaming-server)
[#]: author: (Aaron J.Prisk https://opensource.com/users/ricepriskytreat)

Create your own video streaming server with Linux
======
Set up a basic live streaming server on a Linux or BSD operating system.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/shortcut_command_function_editing_key.png?itok=a0sEc5vo)

Live video streaming is incredibly popular—and it's still growing. Platforms like Amazon's Twitch and Google's YouTube boast millions of users that stream and consume countless hours of live and recorded media. These services are often free to use but require you to have an account and generally hold your content behind advertisements. Some people don't need their videos to be available to the masses or just want more control over their content. Thankfully, with the power of open source software, anyone can set up a live streaming server.

### Getting started

In this tutorial, I'll explain how to set up a basic live streaming server with a Linux or BSD operating system.

This leads to the inevitable question of system requirements. These can vary, as there are a lot of variables involved with live streaming, such as:

  * **Stream quality:** Do you want to stream in high definition or will standard definition fit your needs?
  * **Viewership:** How many viewers are you expecting for your videos?
  * **Storage:** Do you plan on keeping saved copies of your video stream?
  * **Access:** Will your stream be private or open to the world?



There are no set rules when it comes to system requirements, so I recommend you experiment and find what works best for your needs. I installed my server on a virtual machine with 4GB RAM, a 20GB hard drive, and a single Intel i7 processor core.

This project uses the Real-Time Messaging Protocol (RTMP) to handle audio and video streaming. There are other protocols available, but I chose RTMP because it has broad support. As open standards like WebRTC become more compatible, I would recommend that route.

It's also very important to know that "live" doesn't always mean instant. A video stream must be encoded, transferred, buffered, and displayed, which often adds delays. The delay can be shortened or lengthened depending on the type of stream you're creating and its attributes.

### Setting up a Linux server

You can use many different distributions of Linux, but I prefer Ubuntu, so I downloaded the [Ubuntu Server][1] edition for my operating system. If you prefer your server to have a graphical user interface (GUI), feel free to use [Ubuntu Desktop][2] or one of its many flavors. Then, I fired up the Ubuntu installer on my computer or virtual machine and chose the settings that best matched my environment. Below are the steps I took.

Note: Because this is a server, you'll probably want to set some static network settings.

![](https://opensource.com/sites/default/files/uploads/stream-server_profilesetup.png)

After the installer finishes and your system reboots, you'll be greeted with a lovely new Ubuntu system. As with any newly installed operating system, install any updates that are available:

```
sudo apt update
sudo apt upgrade
```

This streaming server will use the very powerful and versatile Nginx web server, so you'll need to install it:

```
sudo apt install nginx
```

Then you'll need to get the RTMP module so Nginx can handle your media stream:

```
sudo add-apt-repository universe
sudo apt install libnginx-mod-rtmp
```

Adjust your web server's configuration so it can accept and deliver your media stream.

```
sudo nano /etc/nginx/nginx.conf
```

Scroll to the bottom of the configuration file and add the following code:

```
rtmp {
        server {
                listen 1935;
                chunk_size 4096;

                application live {
                        live on;
                        record off;
                }
        }
}
```

![](https://opensource.com/sites/default/files/uploads/stream-server_config.png)

Save the config. Because I'm a heretic, I use [Nano][3] for editing configuration files. In Nano, you can save your config by pressing **Ctrl+X** , **Y** , and then **Enter.**

This is a very minimal config that will create a working streaming server. You'll add to this config later, but this is a great starting point.

However, before you can begin your first stream, you'll need to restart Nginx with its new configuration:

```
sudo systemctl restart nginx
```

### Setting up a BSD server

If you're of the "beastie" persuasion, getting a streaming server up and running is also devilishly easy.

Head on over to the [FreeBSD][4] website and download the latest release. Fire up the FreeBSD installer on your computer or virtual machine and go through the initial steps and choose settings that best match your environment. Since this is a server, you'll likely want to set some static network settings.

After the installer finishes and your system reboots, you should have a shiny new FreeBSD system. Like any other freshly installed system, you'll likely want to get everything updated (from this step forward, make sure you're logged in as root):

```
pkg update
pkg upgrade
```

I install [Nano][3] for editing configuration files:

```
pkg install nano
```

This streaming server will use the very powerful and versatile Nginx web server. You can build Nginx using the excellent ports system that FreeBSD boasts.

First, update your ports tree:

```
portsnap fetch
portsnap extract
```

Browse to the Nginx ports directory:

```
cd /usr/ports/www/nginx
```

And begin building Nginx by running:

```
make install
```

You'll see a screen asking what modules to include in your Nginx build. For this project, you'll need to add the RTMP module. Scroll down until the RTMP module is selected and press **Space**. Then Press **Enter** to proceed with the rest of the build and installation.

Once Nginx has finished installing, it's time to configure it for streaming purposes.

First, add an entry into **/etc/rc.conf** to ensure the Nginx server starts when your system boots:

```
nano /etc/rc.conf
```

Add this text to the file:

```
nginx_enable="YES"
```

![](https://opensource.com/sites/default/files/uploads/stream-server_streamingconfig.png)

Next, create a webroot directory from where Nginx will serve its content. I call mine **stream** :

```
cd /usr/local/www/
mkdir stream
chmod -R 755 stream/
```

Now that you have created your stream directory, configure Nginx by editing its configuration file:

```
nano /usr/local/etc/nginx/nginx.conf
```

Load your streaming modules at the top of the file:

```
load_module /usr/local/libexec/nginx/ngx_stream_module.so;
load_module /usr/local/libexec/nginx/ngx_rtmp_module.so;
```

![](https://opensource.com/sites/default/files/uploads/stream-server_modules.png)

Under the **Server** section, change the webroot location to match the one you created earlier:

```
Location / {
root /usr/local/www/stream
}
```

![](https://opensource.com/sites/default/files/uploads/stream-server_webroot.png)

And finally, add your RTMP settings so Nginx will know how to handle your media streams:

```
rtmp {
        server {
                listen 1935;
                chunk_size 4096;

                application live {
                        live on;
                        record off;
                }
        }
}
```

Save the config. In Nano, you can do this by pressing **Ctrl+X** , **Y** , and then **Enter.**

As you can see, this is a very minimal config that will create a working streaming server. Later, you'll add to this config, but this will provide you with a great starting point.

However, before you can begin your first stream, you'll need to restart Nginx with its new config:

```
service nginx restart
```

### Set up your streaming software

#### Broadcasting with OBS

Now that your server is ready to accept your video streams, it's time to set up your streaming software. This tutorial uses the powerful and open source Open Broadcast Studio (OBS).

Head over to the [OBS website][5] and find the build for your operating system and install it. Once OBS launches, you should see a first-time-run wizard that will help you configure OBS with the settings that best fit your hardware.

![](https://opensource.com/sites/default/files/uploads/stream-server_autoconfig.png)

OBS isn't capturing anything because you haven't supplied it with a source. For this tutorial, you'll just capture your desktop for the stream. Simply click the **+** button under **Source** , choose **Screen Capture** , and select which desktop you want to capture.

Click OK, and you should see OBS mirroring your desktop.

Now it's time to send your newly configured video stream to your server. In OBS, click **File** > **Settings**. Click on the **Stream** section, and set **Stream Type** to **Custom Streaming Server**.

In the URL box, enter the prefix **rtmp://** followed the IP address of your streaming server followed by **/live**. For example, **rtmp://IP-ADDRESS/live**.

Next, you'll probably want to enter a Stream key—a special identifier required to view your stream. Enter whatever key you want (and can remember) in the **Stream key** box.

![](https://opensource.com/sites/default/files/uploads/stream-server_streamkey.png)

Click **Apply** and then **OK**.

Now that OBS is configured to send your stream to your server, you can start your first stream. Click **Start Streaming**.

If everything worked, you should see the button change to **Stop Streaming** and some bandwidth metrics will appear at the bottom of OBS.

![](https://opensource.com/sites/default/files/uploads/stream-server_metrics.png)

If you receive an error, double-check Stream Settings in OBS for misspellings. If everything looks good, there could be another issue preventing it from working.

### Viewing your stream

A live video isn't much good if no one is watching it, so be your first viewer!

There are a multitude of open source media players that support RTMP, but the most well-known is probably [VLC media player][6].

After you install and launch VLC, open your stream by clicking on **Media** > **Open Network Stream**. Enter the path to your stream, adding the Stream Key you set up in OBS, then click **Play**. For example, **rtmp://IP-ADDRESS/live/SECRET-KEY**.

You should now be viewing your very own live video stream!

![](https://opensource.com/sites/default/files/uploads/stream-server_livevideo.png)

### Where to go next?

This is a very simple setup that will get you off the ground. Here are two other features you likely will want to use.

  * **Limit access:** The next step you might want to take is to limit access to your server, as the default setup allows anyone to stream to and from the server. There are a variety of ways to set this up, such as an operating system firewall, [.htaccess file][7], or even using the [built-in access controls in the STMP module][8].

  * **Record streams:** This simple Nginx configuration will only stream and won't save your videos, but this is easy to add. In the Nginx config, under the RTMP section, set up the recording options and the location where you want to save your videos. Make sure the path you set exists and Nginx is able to write to it.




```
application live {
             live on;
             record all;
             record_path /var/www/html/recordings;
             record_unique on;
}
```

The world of live streaming is constantly evolving, and if you're interested in more advanced uses, there are lots of other great resources you can find floating around the internet. Good luck and happy streaming!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/basic-live-video-streaming-server

作者：[Aaron J.Prisk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ricepriskytreat
[b]: https://github.com/lujun9972
[1]: https://www.ubuntu.com/download/server
[2]: https://www.ubuntu.com/download/desktop
[3]: https://www.nano-editor.org/
[4]: https://www.freebsd.org/
[5]: https://obsproject.com/
[6]: https://www.videolan.org/vlc/index.html
[7]: https://httpd.apache.org/docs/current/howto/htaccess.html
[8]: https://github.com/arut/nginx-rtmp-module/wiki/Directives#access
