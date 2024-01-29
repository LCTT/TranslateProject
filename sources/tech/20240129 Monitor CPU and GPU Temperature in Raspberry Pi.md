[#]: subject: "Monitor CPU and GPU Temperature in Raspberry Pi"
[#]: via: "https://itsfoss.com/raspberry-pi-cpu-gpu-temperature/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1705972010"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Monitor CPU and GPU Temperature in Raspberry Pi
======

Heating is one of the most common issues in all the single board computers like Raspberry Pi.

Keeping an eye on the CPU temperature could be one way to determine why your Pi is lagging or acting slow.

📋

This tutorial has been performed on a Raspberry Pi 5 running Raspberry Pi OS. And hence it uses the tools provided by Raspberry Pi.

I'll be discussing two ways of monitoring the CPU and GPU temperature on a Raspberry Pi running the Raspbian OS:

  * Monitor the temperature with an applet on the top panel (for desktop systems with GUI)
  * Monitoring the temperature in command line (suitable for all systems)



Let's see them one by one.

⚠️

Raspberry Pi uses a system on chip (SoC) from Broadcom which consists of an ARM processor (CPU) and an on-chip GPU. In simpler words, the chip has both CPU and GPU in it. Raspberry Pi provides utilities that show the temperature for this SoC. You can take that as the temperature of both CPU and GPU.

### Method 1: Monitoring Raspberry Pi CPU and GPU temperature using GUI tool

If you are using your Raspberry Pi as a desktop system with Raspbian OS, you can add a handy applet to the top of your screen. It will show you the current CPU (actually the SoC) temperature.

Here are the steps.

Right click on an empty space on the top panel.

![][1]

Since most people are concerned with CPU temperature, it is named as CPU Temp even though it shows the temperature of the SoC (that houses both CPU and GPU).

Select **CPU Temp** and click on **Add to right** and hit the OK button.

![][2]

The 'Add to right' means it will be added to the right most corner of the panel. This is where you would want it anyway. CPU and GPU will show the CPU and GPU usage respectively (if you want that as well in the top panel).

Now, you should start seeing the temperature of your processor chip:

![The SoC temperature changes continually][3]

Right click on the applet and you can configure it to some extent.

![][4]

You can change the colors of the applet or of critical points such as CPU frequency cap or temperature threshold.

![][5]

### Method 2: Monitoring Raspberry Pi GPU and CPU temperature in the command line

Raspberry Pi has a dedicated command line utility, [vcgencmd][6], that shows various aspects of the Broadcom SoC, including its core temperature.

To see the current temperature of the system on chip (that consists of both CPU and GPU), use this command:

```

    vcgencmd measure_temp

```

It will show an output like:

```

    temp=52.3'C

```

Now, it's a one time command. But if you want to monitor the CPU temperature at a regular interval, you can use the watch command:

Let's say you want to monitor the chip temperature every 2 seconds. Use it in this fashion:

```

    watch -n 2 vcgencmd measure_temp

```

And now it you'll see the current temperature value changes at every two seconds:

```

    Every 2.0s: vcgencmd measure_temp  raspberrypi: Mon Jan 29 16:25:27 2024

    temp=53.0'C

```

By the way, if you are seeing your screen filled up with YYYYYY while using the watch command, change the locale and use a UTF-8 one. That happened with me on my new Raspberry Pi 5.

### Conclusion

Monitoring your CPU temperature is important in Raspberry Pi. If you find that your Pi is heating up frequently, you may want to invest into a heat sink or cooler of some sort to reduce the SoC temperature.

You may also use other Linux commands like sensors (package lm-sensor has to be installed) for measuring CPU temperature.

Enjoy your Pi and don't hesitate to use the comment section for your questions, suggestions or thank-yous 😄

--------------------------------------------------------------------------------

via: https://itsfoss.com/raspberry-pi-cpu-gpu-temperature/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2024/01/add-applet-raspberry-pi--1-.webp
[2]: https://itsfoss.com/content/images/2024/01/monitor-cpu-temp-raspberry-pi.webp
[3]: https://itsfoss.com/content/images/2024/01/displaying-cpu-temperature-raspberry-pi.webp
[4]: https://itsfoss.com/content/images/2024/01/configure-plugin-raspberry-pi.webp
[5]: https://itsfoss.com/content/images/2024/01/raspberry-pi-cpu-temperature-monitoring-options.webp
[6]: https://elinux.org/RPI_vcgencmd_usage
