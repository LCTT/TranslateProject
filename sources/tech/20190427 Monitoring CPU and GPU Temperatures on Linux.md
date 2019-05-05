[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Monitoring CPU and GPU Temperatures on Linux)
[#]: via: (https://itsfoss.com/monitor-cpu-gpu-temp-linux/)
[#]: author: (It's FOSS Community https://itsfoss.com/author/itsfoss/)

Monitoring CPU and GPU Temperatures on Linux
======

_**Brief: This articles discusses two simple ways of monitoring CPU and GPU temperatures in Linux command line.**_

Because of **[Steam][1]** (including _[Steam Play][2]_ , aka _Proton_ ) and other developments, **GNU/Linux** is becoming the gaming platform of choice for more and more computer users everyday. A good number of users are also going for **GNU/Linux** when it comes to other resource-consuming computing tasks such as [video editing][3] or graphic design ( _Kdenlive_ and _[Blender][4]_ are good examples of programs for these).

Whether you are one of those users or otherwise, you are bound to have wondered how hot your computer’s CPU and GPU can get (even more so if you do overclocking). If that is the case, keep reading. We will be looking at a couple of very simple commands to monitor CPU and GPU temps.

My setup includes a [Slimbook Kymera][5] and two displays (a TV set and a PC monitor) which allows me to use one for playing games and the other to keep an eye on the temperatures. Also, since I use [Zorin OS][6] I will be focusing on **Ubuntu** and **Ubuntu** derivatives.

To monitor the behaviour of both CPU and GPU we will be making use of the useful `watch` command to have dynamic readings every certain number of seconds.

![][7]

### Monitoring CPU Temperature in Linux

For CPU temps, we will combine `watch` with the `sensors` command. An interesting article about a [gui version of this tool has already been covered on It’s FOSS][8]. However, we will use the terminal version here:

```
watch -n 2 sensors
```

`watch` guarantees that the readings will be updated every 2 seconds (and this value can — of course — be changed to what best fit your needs):

```
Every 2,0s: sensors

iwlwifi-virtual-0
Adapter: Virtual device
temp1:        +39.0°C

acpitz-virtual-0
Adapter: Virtual device
temp1:        +27.8°C  (crit = +119.0°C)
temp2:        +29.8°C  (crit = +119.0°C)

coretemp-isa-0000
Adapter: ISA adapter
Package id 0:  +37.0°C  (high = +82.0°C, crit = +100.0°C)
Core 0:        +35.0°C  (high = +82.0°C, crit = +100.0°C)
Core 1:        +35.0°C  (high = +82.0°C, crit = +100.0°C)
Core 2:        +33.0°C  (high = +82.0°C, crit = +100.0°C)
Core 3:        +36.0°C  (high = +82.0°C, crit = +100.0°C)
Core 4:        +37.0°C  (high = +82.0°C, crit = +100.0°C)
Core 5:        +35.0°C  (high = +82.0°C, crit = +100.0°C)
```

Amongst other things, we get the following information:

  * We have 5 cores in use at the moment (with the current highest temperature being 37.0ºC).
  * Values higher than 82.0ºC are considered high.
  * A value over 100.0ºC is deemed critical.



[][9]

Suggested read Top 10 Command Line Games For Linux

The values above lead us to the conclusion that the computer’s workload is very light at the moment.

### Monitoring GPU Temperature in Linux

Let us turn to the graphics card now. I have never used an **AMD** dedicated graphics card, so I will be focusing on **Nvidia** ones. The first thing to do is download the appropriate, current driver through [additional drivers in Ubuntu][10].

On **Ubuntu** (and its forks such as **Zorin** or **Linux Mint** ), going to _Software & Updates_ > _Additional Drivers_ and selecting the most recent one normally suffices. Additionally, you can add/enable the official _ppa_ for graphics cards (either through the command line or via _Software & Updates_ > _Other Software_ ). After installing the driver you will have at your disposal the _Nvidia X Server_ gui application along with the command line utility _nvidia-smi_ (Nvidia System Management Interface). So we will use `watch` and `nvidia-smi`:

```
watch -n 2 nvidia-smi
```

And — the same as for the CPU — we will get updated readings every two seconds:

```
Every 2,0s: nvidia-smi

Fri Apr 19 20:45:30 2019
+-----------------------------------------------------------------------------+
| Nvidia-SMI 418.56       Driver Version: 418.56       CUDA Version: 10.1     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GeForce GTX 106...  Off  | 00000000:01:00.0  On |                  N/A |
|  0%   54C    P8    10W / 120W |    433MiB /  6077MiB |      4%      Default |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID   Type   Process name                             Usage      |
|=============================================================================|
|    0      1557      G   /usr/lib/xorg/Xorg                           190MiB |
|    0      1820      G   /usr/bin/gnome-shell                         174MiB |
|    0      7820      G   ...equest-channel-token=303407235874180773    65MiB |
+-----------------------------------------------------------------------------+
```

The chart gives the following information about the graphics card:

  * it is using the open source driver version 418.56.
  * the current temperature of the card is 54.0ºC — with the fan at 0% of its capacity.
  * the power consumption is very low: only 10W.
  * out of 6 GB of vram (video random access memory), it is only using 433 MB.
  * the used vram is being taken by three processes whose IDs are — respectively — 1557, 1820 and 7820.



[][11]

Suggested read Googler: Now You Can Google From Linux Terminal!

Most of these facts/values show that — clearly — we are not playing any resource-consuming games or dealing with heavy workloads. Should we started playing a game, processing a video — or the like —, the values would start to go up.

#### Conclusion

Althoug there are gui tools, I find these two commands very handy to check on your hardware in real time.

What do you make of them? You can learn more about the utilities involved by reading their man pages.

Do you have other preferences? Share them with us in the comments, ;).

Halof!!! (Have a lot of fun!!!).

![avatar][12]

### Alejandro Egea-Abellán

It’s FOSS Community Contributor

I developed a liking for electronics, linguistics, herpetology and computers (particularly GNU/Linux and FOSS). I am LPIC-2 certified and currently work as a technical consultant and Moodle administrator in the Department for Lifelong Learning at the Ministry of Education in Murcia, Spain. I am a firm believer in lifelong learning, the sharing of knowledge and computer-user freedom.

--------------------------------------------------------------------------------

via: https://itsfoss.com/monitor-cpu-gpu-temp-linux/

作者：[It's FOSS Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-steam-ubuntu-linux/
[2]: https://itsfoss.com/steam-play-proton/
[3]: https://itsfoss.com/best-video-editing-software-linux/
[4]: https://www.blender.org/
[5]: https://slimbook.es/
[6]: https://zorinos.com/
[7]: https://itsfoss.com/wp-content/uploads/2019/04/monitor-cpu-gpu-temperature-linux-800x450.png
[8]: https://itsfoss.com/check-laptop-cpu-temperature-ubuntu/
[9]: https://itsfoss.com/best-command-line-games-linux/
[10]: https://itsfoss.com/install-additional-drivers-ubuntu/
[11]: https://itsfoss.com/review-googler-linux/
[12]: https://itsfoss.com/wp-content/uploads/2019/04/EGEA-ABELLAN-Alejandro.jpg
