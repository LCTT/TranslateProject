[#]: subject: "Control your Raspberry Pi remotely with your smartphone"
[#]: via: "https://opensource.com/article/21/9/raspberry-pi-remote-control"
[#]: author: "Stephan Avenwedde https://opensource.com/users/hansic99"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Control your Raspberry Pi remotely with your smartphone
======
Control the GPIOs of your Raspberry Pi remotely with your smartphone.
![A person looking at a phone][1]

Wouldn't it be nice to control the general-purpose input/outputs (GPIOs) of the Raspberry Pi remotely with your smartphone? If you can answer the question in the affirmative, I would like to introduce you to a simple way to implement this. Writing this article, I have no specific application in mind, but I can think of combining it with lawn irrigation, any illumination, or a garage door opener.

Anyway, all you need to get started is a Raspberry Pi and a smartphone. The actual logic is already available on GitHub, so even without programming skills, you will be able to follow the steps described in this article.

### Architecture

We do the major work with [Pythonic][2]—a graphical Python programming framework I develop in my leisure. Pythonic brings a [Telegram][3] bot programming element with it, which acts as our smartphone interface. A significant advantage of this setup is that it is scalable regarding the number of clients: You can decide whether you want to control the GPIOs only by yourself, share them with your relatives or friends, or share the control capabilities with the public. Of course, a prerequisite is permanent internet access to communicate between the Telegram server and the client. To establish internet access, you could use either the Ethernet interface or the WiFi functionality of the Raspberry Pi.

### Install Pythonic

To get started, you have to install Pythonic on your Raspberry Pi. The easiest way of doing that is to flash the SD card with the preconfigured Pythonic image available on [sourceforge.net][4].

Download and unzip the image and flash it to the SD card of the Raspberry Pi. On Windows, you can use [balenaEtcha][5] for it. On Linux, you can do it with the onboard tools.

  1. Plugin the SD card and check under which device it is showing up by typing `lsblk -p`.

![Using lsblk -p to check under which device your SD card shows ][6]

(Stephan Avenwedde, [CC-BY SA 4.0][7])

  2. In the screenshot above, the SD card device is `/dev/sdc`, and my systems automatically mounted two partitions that were found on it. If this is the case, unmount it by typing `umount /dev/sdc1 && umount /dev/sdc2`.

  3. Flash the SD card with the following command: `dd if=~/Downloads/Pythonic-1.7.img of=/dev/sdc bs=32M, conv=fsync`. 
**Attention***: *This will delete all previous files on the SD card.

  4. The flashing process will take a while.
Once the process is finished, put the SD card back in your Raspberry Pi and boot it up.




### Establishing a connection

The Pythonic image has no pre-installed desktop. The whole configuration is web-based, so you must establish a TCP/IP connection. It is straightforward to connect using an ordinary internet router. If you don't have access to such a router, you can also establish a connection over the onboard universal asynchronous receiver/transmitter ****(UART) device to configure the Ethernet or WiFi interface.

#### Locale DNS

By default, the Pythonic image is configured to acquire an IP address by DHCP. Your internet router at home usually runs a DHCP server that distributes IP addresses to connected devices. Make a connection between a free Ethernet port of your internet router and the Ethernet port on your Raspberry Pi and boot it up.

You can now try to access the web-based GUI from a device within your local network. If the DNS in your local network works properly, open a browser and navigate to http ://PythonicRPI:7000/ to open the programming GUI.

#### Locale IP

I assume your router also offers a graphical configuration GUI. The configuration GUI provides information about the devices in your local network. You can find the IP address of your local router by typing `ip route`.

In my case, the route is available under 192.168.188.1. Now login to your router's configuration page and check which IP was the Raspberry Pi given.

![Viewing active connections][8]

(Stephan Avenwedde, [CC-BY SA 4.0][7])

In my network, the Raspberry Pi is available under 192.168.188.63, so I can access the GUI at http ://192.168.188.63:7000/.

#### UART

Put the SD card back into the card reader and mount the _boot_ partition. Open the _config.txt_ on the _boot_ partition and add the following line to the end:


```
`enable_uart=1`
```

Put the SD card back in the Raspberry Pi and boot it up. You can now establish a console connection with a UART-USB converter to set up a static IP address or configure a WiFi connection.

![Establishing a UART connection][9]

(Stephan Avenwedde, [CC-BY SA 4.0][7])

The default connection parameters are:

  * TxD: GPIO14
  * RxD: GPIO15
  * Ground: Pin 6 or 14
  * Baud rate: 115200
  * Data bits: 8
  * Parity bit: None
  * Stop bits: 1



You can find more information on [elinux.org][10].

### Uploading the configuration

To proceed with the upcoming steps, download the example files from [github][11] to your local hard drive.

![GitHub example files repository ][12]

(Stephan Avenwedde, [CC-BY SA 4.0][7])

The example consists of several files of two elementary types:

  * `*.py-files`—Contains the actual implementation of specific functionality.
  * `current_config.json`—This file describes the configured elements, the links between the elements, and the variable configuration of the elements.



This example is a slightly modified version of the already available reference implementation. You can access it by dragging and dropping the files from the left sidebar to the working area.

Now upload the configuration to your target:

![Pythonic GUI overview][13]

(Stephan Avenwedde, [CC-BY SA 4.0][7])

With the blue-marked button, you upload the `current_config.json` to the target. You can upload only valid configuration files. After uploading, you can find the file on the target under `/home/pythonic/Pythonic/current_config.json`.

With the green-marked button, you upload each `*.py-files`. Afterward, the `*.py-files` can be found under `/home/pythonic/Pythonic/executables`.

It is possible to upload any kind of file to the `executables` folder because I plan to support binary executables in the future.

However, so that the configuration works, the actual implementation must be available for each element described in `current_config.json`.

### Setup a Telegram Bot

The configuration should now look like this:

![Pythonic GPIO remote configuration][14]

(Stephan Avenwedde, [CC-BY SA 4.0][7])

Well done! But this setup won't work yet. Try to start this configuration by clicking **Play** on the _ManualScheduler - 0x5f8125f5_ element. The connected Telegram element will start but then immediately quit. This is because the Telegram element needs some additional configuration: Right-click on the Telegram element. You should now see pop-up windows like this:

![Pop-up for Phythonic GPIO remote Telegram][15]

(Stephan Avenwedde, [CC-BY SA 4.0][7])

You have to provide a Telegram bot token to communicate with the server. The process of creating a bot token is described on [core.telegram.org][16].

In a nutshell: Start a chat with the [BotFather][17] and create a bot with the `/newbot` command. At the end of the process, the BotFather will provide you a token that you can copy and paste to the Telegram element.

That's it. Now you should be able to start the Telegram element by clicking on the play button on the _ManualScheduler - 0x5f8125f5_ element. The Telegram element should now be active, which can be seen from the green frame.

![ Active RPI Telegram element][18]

(Stephan Avenwedde, [CC-BY SA 4.0][7])

The spinning bar on the bottom info line indicates a working connection with the backend.

Start a chat with your newly created bot by typing _@&lt;name-of-your-bot&gt;_ in the search field of Telegram. Click **Start** to get the initial state of the GPIOs. I named my bot _RPIremoteIO_:

![Start RPI Telegram][19]

(Stephan Avenwedde, [CC-BY SA 4.0][7])

### Debugging and Modification

Open a new tab in your browser and navigate to http ://PythonicRPI:8000/. This will open the pre-installed [code-server][20] IDE. On the left pane, click on the files button and open `telegram_2ca7cd73.py` :

![RPI code server IDE][21]

(Stephan Avenwedde, [CC-BY SA 4.0][7])

You should now be able to start debugging and follow the path of execution like in the following screen recording:

<https://youtu.be/IjJehKq7YCc>

The Telegram element uses an [inline keyboard][22] which shows the target state of GPIO4 and GPIO5. This way, several users could control the state of GPIOs without disturbing each other because the new target state for the GPIOs is always provided to all subscribers.

### Conclusion

With this example, you should get a feeling of how everything connects. You can adapt the example as you like: Change or add additional GPIOs, use the analog features or get the input state on demand. If you connect a suitable relay, you could also drive higher loads with the Raspberry Pi. I am sure you will do something great with it!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/raspberry-pi-remote-control

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/idea_innovation_mobile_phone.png?itok=RqVtvxkd (A person looking at a phone)
[2]: https://github.com/hANSIc99/Pythonic
[3]: https://telegram.org/
[4]: https://sourceforge.net/projects/pythonicrpi/
[5]: https://www.balena.io/etcher/
[6]: https://opensource.com/sites/default/files/uploads/pi_gen_lsblk_mounted_1.png (Using lsblk -p to check under which device your SD card shows )
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/active_connections.png (Viewing active connections)
[9]: https://opensource.com/sites/default/files/uploads/pythonic_rpi_uart.jpg (Establishing a UART connection)
[10]: https://elinux.org/RPi_Serial_Connection
[11]: https://github.com/hANSIc99/Pythonic/tree/master/examples/rpi_telegram_remote_io
[12]: https://opensource.com/sites/default/files/uploads/github_example_remote_gpio.png (GitHub example files repository )
[13]: https://opensource.com/sites/default/files/uploads/pythonic_gui_overview.png (Pythonic GUI overview)
[14]: https://opensource.com/sites/default/files/uploads/pythonic_gpio_remote_config.png (Pythonic GPIO remote configuration)
[15]: https://opensource.com/sites/default/files/uploads/pythonic_gpio_remote_telegram.png (Pop-up for Phythonic GPIO remote Telegram)
[16]: https://core.telegram.org/bots#6-botfather
[17]: https://t.me/botfather
[18]: https://opensource.com/sites/default/files/uploads/rpi_telegram_active.png (Active RPI Telegram element)
[19]: https://opensource.com/sites/default/files/uploads/rpi_start_telegram.png (Start RPI Telegram)
[20]: https://github.com/cdr/code-server
[21]: https://opensource.com/sites/default/files/uploads/rpi_code-server_ide.png (RPI code server IDE)
[22]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
