[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Live video streaming with open source Video.js)
[#]: via: (https://opensource.com/article/20/2/video-streaming-tools)
[#]: author: (Aaron J. Prisk https://opensource.com/users/ricepriskytreat)

Live video streaming with open source Video.js
======
Video.js is a widely used protocol that will serve your live video
stream to a wide range of devices.
![video editing dashboard][1]

Last year, I wrote about [creating a video streaming server with Linux][2]. That project uses the Real-Time Messaging Protocol (RMTP), Nginx web server, Open Broadcast Studio (OBS), and VLC media player.

I used VLC to play our video stream, which may be fine for a small local deployment but isn't very practical on a large scale. First, your viewers have to use VLC, and RTMP streams can provide inconsistent playback. This is where [Video.js][3] comes into play! Video.js is an open source JavaScript framework for creating custom HTML5 video players. Video.js is incredibly powerful, and it's used by a host of very popular websites—largely due to its open nature and how easy it is to get up and running.

### Get started with Video.js

This project is based off of the video streaming project I wrote about last year. Since that project was set to serve RMTP streams, to use Video.js, you'll need to make some adjustments to that Nginx configuration. HTTP Live Streaming ([HLS][4]) is a widely used protocol developed by Apple that will serve your stream better to a multitude of devices. HLS will take your stream, break it into chunks, and serve it via a specialized playlist. This allows for a more fault-tolerant stream that can play on more devices.

First, create a directory that will house the HLS stream and give Nginx permission to write to it:


```
mkdir /mnt/hls
chown www:www /mnt/hls
```

Next, fire up your text editor, open the Nginx.conf file, and add the following under the **application live** section:


```
       application live {
            live on;
            # Turn on HLS
            hls on;
            hls_path /mnt/hls/;
            hls_fragment 3;
            hls_playlist_length 60;
            # disable consuming the stream from nginx as rtmp
            deny play all;
}
```

Take note of the HLS fragment and playlist length settings. You may want to adjust them later, depending on your streaming needs, but this is a good baseline to start with. Next, we need to ensure that Nginx is able to listen for requests from our player and understand how to present it to the user. So, we'll want to add a new section at the bottom of our nginx.conf file.


```
server {
        listen 8080;

        location / {
            # Disable cache
            add_header 'Cache-Control' 'no-cache';

            # CORS setup
            add_header 'Access-Control-Allow-Origin' '*' always;
            add_header 'Access-Control-Expose-Headers' 'Content-Length';

            # allow CORS preflight requests
            if ($request_method = 'OPTIONS') {
                add_header 'Access-Control-Allow-Origin' '*';
                add_header 'Access-Control-Max-Age' 1728000;
                add_header 'Content-Type' 'text/plain charset=UTF-8';
                add_header 'Content-Length' 0;
                return 204;
            }

            types {
                application/dash+xml mpd;
                application/vnd.apple.mpegurl m3u8;
                video/mp2t ts;
            }

            root /mnt/;
        }
    }
```

Visit Video.js's [Getting started][5] page to download the latest release and check out the release notes. Also on that page, Video.js has a great introductory template you can use to create a very basic web player. I'll break down the important bits of that template and insert the pieces you need to get your new HTML player to use your stream.

The **head** links in the Video.js library from a content-delivery network (CDN). You can also opt to download and store Video.js locally on your web server if you want.


```
&lt;head&gt;
  &lt;link href="<https://vjs.zencdn.net/7.5.5/video-js.css>" rel="stylesheet" /&gt;

  &lt;!-- If you'd like to support IE8 (for Video.js versions prior to v7) --&gt;
  &lt;script src="[https://vjs.zencdn.net/ie8/1.1.2/videojs-ie8.min.js"\&gt;\][6]&lt;/script&gt;
&lt;/head&gt;
```

Now to the real meat of the player. The **body** section sets the parameters of how the video player will be displayed. Within the **video** element, you need to define the properties of your player. How big do you want it to be? Do you want it to have a poster (i.e., a thumbnail)? Does it need any special player controls? This example defines a simple 600x600 pixel player with an appropriate (to me) thumbnail featuring Beastie (the BSD Demon) and Tux (the Linux penguin).


```
&lt;body&gt;
  &lt;video
    id="my-video"
    class="video-js"
    controls
    preload="auto"
    width="600"
    height="600"
    poster="BEASTIE-TUX.jpg"
    data-setup="{}"
  &gt;
```

Now that you've set how you want your player to look, you need to tell it what to play. Video.js can handle a large number of different formats, including HLS streams.


```
    &lt;source src="<http://MY-WEB-SERVER:8080/hls/STREAM-KEY.m3u8>" type="application/x-mpegURL" /&gt;
    &lt;p class="vjs-no-js"&gt;
      To view this video please enable JavaScript, and consider upgrading to a
      web browser that
      &lt;a href="<https://videojs.com/html5-video-support/>" target="_blank"
        &gt;supports HTML5 video&lt;/a
      &gt;
    &lt;/p&gt;
  &lt;/video&gt;
```

### Record your streams

Keeping a copy of your streams is super easy. Just add the following at the bottom of your **application live** section in the nginx.conf file:


```
# Enable stream recording
record all;
record_path /mnt/recordings/;
record_unique on;
```

Make sure that **record_path** exists and that Nginx has permissions to write to it:


```
`chown -R www:www /mnt/recordings`
```

### Down the stream

That's it! You should now have a spiffy new HTML5-friendly live video player. There are lots of great resources out there on how to expand all your video-making adventures. If you have any questions or suggestions, feel free to reach out to me on [Twitter][7] or leave a comment below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/video-streaming-tools

作者：[Aaron J. Prisk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ricepriskytreat
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/video_editing_folder_music_wave_play.png?itok=-J9rs-My (video editing dashboard)
[2]: https://opensource.com/article/19/1/basic-live-video-streaming-server
[3]: https://videojs.com/
[4]: https://en.wikipedia.org/wiki/HTTP_Live_Streaming
[5]: https://videojs.com/getting-started
[6]: https://vjs.zencdn.net/ie8/1.1.2/videojs-ie8.min.js"\>\
[7]: https://twitter.com/AKernelPanic
