[#]: subject: (Get started with edge computing by programming embedded systems)
[#]: via: (https://opensource.com/article/21/3/rtos-embedded-development)
[#]: author: (Alan Smithee https://opensource.com/users/alansmithee)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Get started with edge computing by programming embedded systems
======
The AT device package for controlling wireless modems is one of RTOS's
most popular extensions.
![Looking at a map][1]

RTOS is an open source [operating system for embedded devices][2] developed by RT-Thread. It provides a standardized, friendly foundation for developers to program a variety of devices and includes a large number of useful libraries and toolkits to make the process easier.

Like Linux, RTOS uses a modular approach, which makes it easy to extend. Packages enable developers to use RTOS for any device they want to target. One of RTOS's most popular extensions is the AT device package, which includes porting files and sample code for different AT devices (i.e., modems).

At over 62,000 downloads (at the time of this writing, at least), one of the most popular extensions to RTOS is the AT device package, which includes porting files and sample code for different AT devices.

### About AT commands

AT commands were originally a protocol to control old dial-up modems. As modem technology moved on to higher bandwidths, it remained useful to have a light and efficient protocol for device control, and major mobile phone manufacturers jointly developed a set of AT commands to control the GSM module on mobile phones.

Today, the AT protocol is still common in networked communication, and there are many devices, including WiFi, Bluetooth, and 4G, that accept AT commands.

If you're creating purpose-built appliances for edge computing input, monitoring, or the Internet of Things (IoT), some of the AT devices supported by RTOS that you may encounter include ESP8266, ESP32, M26, MC20, RW007, MW31, SIM800C, W60X, SIM76XX, A9/A9G, BC26, AIR720, ME3616, M 6315, BC28, and EC200X.

RT-Thread contains the Socket Abstraction Layer (SAL) component, which implements the abstraction of various network protocols and interfaces and provides a standard set of [BSD socket][3] APIs to the upper level. The SAL then takes over the AT socket interface so that developers just need to consider the network interface provided by the network application layer.

This package implements the AT socket on devices (including the ones above), allowing communications through standard socket interfaces in the form of AT commands. The [RT-thread programming guide][4] includes descriptions of specific functions.

The at_device package is distributed under an LGPLv2.1 license, and it's easy to obtain by using the [RT-Thread Env tool][5]. This tool includes a configurator and a package manager, which configure the kernel and component functions and can be used to tailor the components and manage online packages. This enables developers to build systems as if they were building blocks.

### Get the at_device package

To use AT devices with RTOS, you must enable the AT component library and AT socket functionality. This requires:

  * RT_Thread 4.0.2+
  * RT_Thread AT component 1.3.0+
  * RT_Thread SAL component
  * RT-Thread netdev component



The AT device package has been updated for multiple versions. Different versions require different configuration options, so they must fit into the corresponding system versions. Most of the currently available AT device package versions are:

  * V1.2.0: For RT-Thread versions less than V3.1.3, AT component version equals V1.0.0
  * V1.3.0: For RT-Thread versions less than V3.1.3, AT component version equals V1.1.0
  * V1.4.0: For RT-Thread versions less than V3.1.3 or equal to V4.0.0, AT component version equals V1.2.0
  * V1.5.0: For RT-Thread versions less than V3.1.3 or equal to V4.0.0, AT component version equals V1.2.0
  * V1.6.0: For RT-Thread versions equal to V3.1.3 or V4.0.1, AT component version equals V1.2.0
  * V2.0.0/V2.0.1: For RT-Thread versions higher than V4.0.1 or higher than 3.1.3, AT component version equals V1.3.0
  * Latest version: For RT-Thread versions higher than V4.0.1 or higher than 3.1.3, AT component version equals V1.3.0



Getting the right version is mostly an automatic process done in menuconfig. It provides the best version of the at_device package based on your current system environment.

As mentioned, different versions require different configuration options. For instance, version 1.x supports enabling one AT device at a time:


```
RT-Thread online packages  ---&gt;
     IoT - internet of things  ---&gt;
        -*- AT DEVICE: RT-Thread AT component porting or samples for different device  
        [ ]   Enable at device init by thread
              AT socket device modules (Not selected, please select)  ---&gt;    
              Version (V1.6.0)  ---&gt;
```

The option to enable the AT device init by thread dictates whether the configuration creates a separate thread to initialize the device network.

Version 2.x supports enabling multiple AT devices at the same time:


```
RT-Thread online packages  ---&gt;
     IoT - internet of things  ---&gt;
        -*- AT DEVICE: RT-Thread AT component porting or samples for different device
        [*]   Quectel M26/MC20  ---&gt;
          [*]   Enable initialize by thread
          [*]   Enable sample
          (-1)    Power pin
          (-1)    Power status pin
          (uart3) AT client device name
          (512)   The maximum length of receive line buffer
        [ ]   Quectel EC20  ---&gt;
        [ ]   Espressif ESP32  ---&gt;
        [*]   Espressif ESP8266  ---&gt;
          [*]   Enable initialize by thread
          [*]   Enable sample
          (realthread) WIFI ssid
          (12345678) WIFI password
          (uart2) AT client device name
          (512)   The maximum length of receive line buffer
        [ ]   Realthread RW007  ---&gt;
        [ ]   SIMCom SIM800C  ---&gt;
        [ ]   SIMCom SIM76XX  ---&gt;
        [ ]   Notion MW31  ---&gt;
        [ ]   WinnerMicro W60X  ---&gt;
        [ ]   AiThink A9/A9G  ---&gt;
        [ ]   Quectel BC26  ---&gt;
        [ ]   Luat air720  ---&gt;
        [ ]   GOSUNCN ME3616  ---&gt;
        [ ]   ChinaMobile M6315  ---&gt;
        [ ]   Quectel BC28  ---&gt;
        [ ]   Quectel ec200x  ---&gt;
        Version (latest)  ---&gt;
```

This version includes many other options, including one to enable sample code, which might be particularly useful to new developers or any developer using an unfamiliar device.

You can also control options to choose which pin you want to use to supply power to your component, a pin to indicate the power state, the name of the serial device the sample device uses, and the maximum length of the data the sample device receives. On applicable devices, you can also set the SSID name and password.

In short, there is no shortage of control options.

  * V2.X.X version supports enabling multiple AT devices simultaneously, and the enabled device information can be viewed with the `ifocnfig` command in [finsh shell][6].
  * V2.X.X version requires the device to register before it's used; the registration can be done in the samples directory file or customized in the application layer.
  * Pin options such as **Power pin** and **Power status pin** are configured according to the device's hardware connection. They can be configured as `-1` if the hardware power-on function is not used.
  * One AT device should correspond to one serial name, and the **AT client device name** for each device should be different.



### AT components configuration options

When the AT device package is selected and device support is enabled, client functionality for the AT component is selected by default. That means more options—this time for the AT component:


```
RT-Thread Components  ---&gt;
    Network  ---&gt;
        AT commands  ---&gt;
    [ ]   Enable debug log output
    [ ]   Enable AT commands server
    -*-   Enable AT commands client
    (1)     The maximum number of supported clients
    -*-     Enable BSD Socket API support by AT commnads
    [*]     Enable CLI(Command-Line Interface) for AT commands
    [ ]     Enable print RAW format AT command communication data
    (128)   The maximum length of AT Commonds buffer
```

The configuration options related to the AT device package are:

  * **The maximum number of supported clients**: Selecting multiple devices in the AT device package requires this option to be configured as the corresponding value.
  * **Enable BSD Socket API support by AT commands**: This option will be selected by default when selecting the AT device package.
  * **The maximum length of AT Commands buffe:** The maximum length of the data the AT commands can send.



### Anything is possible

When you start programming embedded systems, you quickly realize that you can create anything you can imagine. RTOS aims to help you get there, and its packages offer a head start. Interconnected devices are the expectation now. IoT technology on the [edge][7] must be able to communicate across various protocols, and the AT protocol is the key.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/rtos-embedded-development

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tips_map_guide_ebook_help_troubleshooting_lightbulb_520.png?itok=L0BQHgjr (Looking at a map)
[2]: https://opensource.com/article/20/6/open-source-rtos
[3]: https://en.wikipedia.org/wiki/Berkeley_sockets
[4]: https://github.com/RT-Thread/rtthread-manual-doc/blob/master/at/at.md
[5]: https://www.rt-thread.io/download.html?download=Env
[6]: https://www.rt-thread.org/download/rttdoc_1_0_0/group__finsh.html
[7]: https://www.redhat.com/en/topics/edge-computing
