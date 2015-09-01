How to automatically dim your screen on Linux
================================================================================
When you start spending the majority of your time in front of a computer, natural questions start arising. Is this healthy? How can I diminish the strain on my eyes? Why is the sunlight burning me? Although active research is still going on to answer these questions, a lot of programmers have already adopted a few applications to make their daily habits a little healthier for their eyes. Among those applications, there are two which I found particularly interesting: Calise and Redshift.

### Calise ###

In and out of development limbo, [Calise][1] stands for "Camera Light Sensor." In other terms, it is an open source program that computes the best backlight level for your screen based on the light intensity received by your webcam. And for more precision, Calise is capable of taking in account the weather in your area based on your geographical coordinates. What I like about it is the compatibility with every desktops, even non-X ones. 

![](https://farm1.staticflickr.com/569/21016715646_6e1e95f066_o.jpg)

It comes with a command line interface and a GUI, supports multiple user profiles, and can even export its data to CSV. After installation, you will have to calibrate it quickly before the magic happens. 

![](https://farm6.staticflickr.com/5770/21050571901_1e7b2d63ec_c.jpg)

What is less likeable is unfortunately that if you are as paranoid as I am, you have a little piece of tape in front of your webcam, which greatly affects Calise's precision. But that aside, Calise is a great application, which deserves our attention and support. As I mentioned earlier, it has gone through some rough patches in its development schedule over the last couple of years, so I really hope that this project will continue.

![](https://farm1.staticflickr.com/633/21032989702_9ae563db1e_o.png)

### Redshift ###

If you already considered decreasing the strain on your eyes caused by your screen, it is possible that you have heard of f.lux, a free proprietary software that modifies the luminosity and color scheme of your display based on the time of the day. However, if you really prefer open source software, there is an alternative: [Redshift][2]. Inspired by f.lux, Redshift also alters the color scheme and luminosity to enhance the experience of sitting in front of your screen at night. On startup, you can configure it with you geographic position as longitude and latitude, and then let it run in tray. Redshift will smoothly adjust the color scheme or your screen based on the position of the sun. At night, you will see the screen's color temperature turn towards red, making it a lot less painful for your eyes. 

![](https://farm6.staticflickr.com/5823/20420303684_2b6e917fee_b.jpg)

Just like Calise, it proposes a command line interface as well as a GUI client. To start Redshift quickly, just use the command:

    $ redshift -l [LAT]:[LON] 

Replacing [LAT]:[LON] by your latitude and longitude.

However, it is also possible to input your coordinates by GPS via the gpsd module. For Arch Linux users, I recommend this [wiki page][3].

### Conclusion ###

To conclude, Linux users have no excuse for not taking care of their eyes. Calise and Redshift are both amazing. I really hope that their development will continue and that they get the support they deserve. Of course, there are more than just two programs out there to fulfill the purpose of protecting your eyes and staying healthy, but I feel that Calise and Redshift are a good start.

If there is a program that you really like and that you use regularly to reduce the strain on your eyes, please let us know in the comments.

--------------------------------------------------------------------------------

via: http://xmodulo.com/automatically-dim-your-screen-linux.html

作者：[Adrien Brochard][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://calise.sourceforge.net/
[2]:http://jonls.dk/redshift/
[3]:https://wiki.archlinux.org/index.php/Redshift#Automatic_location_based_on_GPS