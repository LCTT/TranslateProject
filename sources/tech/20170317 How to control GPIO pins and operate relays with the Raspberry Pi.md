being translated by zhousiyu325

How to control GPIO pins and operate relays with the Raspberry Pi
============================================================

> Learn how to operate relays and control GPIO pins with the Pi using PHP and a temperature sensor.

 ![How to control GPIO pins and operate relays with the Raspberry Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/raspberry_pi_day_lead_0.jpeg?itok=lCxmviRD "How to control GPIO pins and operate relays with the Raspberry Pi") 
>Image by : opensource.com

Ever wondered how to control items like your fans, lights, and more using your phone or computer from anywhere?

I was looking to control my Christmas lights using any mobile phone, tablet, laptop... simply by using a Raspberry Pi. Let me show you how to operate relays and control GPIO pins with the Pi using PHP and a temperature sensor. I put them all together using AJAX.

### Hardware requirements

*   Raspberry Pi
*   SD Card with Raspbian installed (any SD card would work, but I prefer to use a 32GB class 10 card)
*   Power adapter
*   Jumper wires (female to female and male to female)
*   Relay board (I use a 12V relay board with for relays)
*   DS18B20 temperature probe
*   Wi-Fi adapter for Raspberry Pi
*   Router (for Internet access, you need to have a port-forwarding supported router)
*   10K-ohm resistor

### Software requirements

*   Download and install Raspbian on your SD Card
*   Working Internet connection
*   Apache web server
*   PHP
*   WiringPi
*   SSH client on a Mac or Windows client

### General configurations and setup

1\. Insert the SD card into Raspberry Pi and connect it to the router using an Ethernet cable

2\. Connect the Wi-Fi Adapter.

3\. Now SSH to Pi and edit the **interfaces** file using:

**sudo nano /etc/network/interfaces**

This will open the file in an editor called **nano**. It is a very simple text editor that is easy to approach and use. If you're not familiar to a Linux-based operating systems, just use the arrow keys.

After opening the file in **nano** you will see a screen like this:

 ![File editor nano](https://opensource.com/sites/default/files/putty_0.png "File editor nano") 

4\. To configure your wireless network, modify the file as follows:

**iface lo inet loopback**

**iface eth0 inet dhcp**

**allow-hotplug wlan0**

**auto wlan0**

**iface wlan0 inet dhcp**

**   wpa-ssid "Your Network SSID"**

**   wpa-psk "Your Password"**

5\. Press CTRL + O to save it, and then CTRL + X to exit the editor.

At this point, everything is configured and all you need to do is reload the network interfaces by running:

**sudo service networking reload**

(Warning: if you are connected using a remote connection it will disconnect now.)

### Software configurations

### Installing Apache Web Server

Apache is a popular web server application you can install on the Raspberry Pi to allow it to serve web pages. On its own, Apache can serve HTML files over HTTP, and with additional modules it can serve dynamic web pages using scripting languages such as PHP.

Install Apache by typing the following command on the command line:

**sudo apt-get install apache2 -y**

Once the installation is complete, type in the IP Address of your Pi to test the server. If you get the next image, then you have installed and set up your server successfully.

 ![Successful server setup](https://opensource.com/sites/default/files/itworks.png "Successful server setup") 

To change this default page and add your own html file, go to **var/www/html**:

**cd /var/www/html**

To test this, add any file to this folder.

### Installing PHP

PHP is a preprocessor, meaning this is code that runs when the server receives a request for a web page. It runs, works out what needs to be shown on the page, then sends that page to the browser. Unlike static HTML, PHP can show different content under different circumstances. Other languages are capable of this, but since WordPress is written in PHP it's what you need to use this time. PHP is a very popular language on the web, with large projects like Facebook and Wikipedia written in it.

Install the PHP and Apache packages with the following command:

**sudo apt-get install php5 libapache2-mod-php5 -y**

### Testing PHP

Create the file **index.php**:

**sudo nano index.php**

Put some PHP content in it:

**<?php echo "hello world"; ?>**

Save the file. Next, delete "index.html" because it takes precedence over "index.php":

**sudo rm index.html**

Refresh your browser. You should see “hello world.” This is not dynamic, but it is still served by PHP. If you see the raw PHP above instead of “hello world,” reload and restart Apache with:

**sudo /etc/init.d/apache2 reload**

**sudo /etc/init.d/apache2 restart**

### Installing WiringPi

WiringPi is maintained under **git** for ease of change tracking; however, you have a plan B if you’re unable to use **git** for whatever reason. (Usually your firewall will be blocking you, so do check that first!)

If you do not have **git** installed, then under any of the Debian releases (e.g., Raspbian), you can install it with:

**sudo apt-get install git-core**

If you get any errors here, make sure your Pi is up to date with the latest version of Raspbian:

**sudo apt-get update sudo apt-get upgrade**

To obtain WiringPi using **git**:

**sudo git clone git://git.drogon.net/wiringPi**

If you have already used the clone operation for the first time, then:

**cd wiringPi git pull origin**

It will fetch an updated version, and then you can re-run the build script below.

To build/install there is a new simplified script:

**cd wiringPi ./build**

The new build script will compile and install it all for you. It does use the **sudo** command at one point, so you may wish to inspect the script before running it.

### Testing WiringPi

Run the **gpio** command to check the installation:

**gpio -v gpio readall**

This should give you some confidence that it’s working OK.

### Connecting DS18B20 To Raspberry Pi

*   The Black wire on your probe is for GND
*   The Red wire is for VCC
*   The Yellow wire is the GPIO wire

 ![GPIO image](https://opensource.com/sites/default/files/gpio_0.png "GPIO image") 

Connect:

*   VCC to 3V Pin 1
*   GPIO wire to Pin 7 (GPIO 04)
*   Ground wire to any GND Pin 9

### Software Configuration

For using DS18B20 temperature sensor module with PHP, you need to activate the kernel module for the GPIO pins on the Raspberry Pi and the DS18B20 by executing the commands:

**sudo modprobe w1-gpio**

**sudo modprobe w1-therm**

You do not want to do that manually every time the Raspberry reboots, so you want to enable these modules on every boot. This is done by adding the following lines to the file **/etc/modules**:

**sudo nano /etc/modules/**

Add the following lines to it:

**w1-gpio**

**w1-therm**

To test this, type in:

**cd /sys/bus/w1/devices/**

Now type **ls. **

You should see your device information. In the device drivers, your DS18B20 sensor should be listed as a series of numbers and letters. In this case, the device is registered as 28-000005e2fdc3\. You then need to access the sensor with the cd command, replacing my serial number with your own: **cd 28-000005e2fdc3. **

The DS18B20 sensor periodically writes to the **w1_slave** file, so you simply use the cat command to read it**: cat w1_slave.**

This yields the following two lines of text, with the output **t=** showing the temperature in degrees Celsius. Place a decimal point after the first two digits (e.g., the temperature reading I received is 30.125 degrees Celsius).

### Connecting the relay

1\. Take two jumper wires and connect one of them to the GPIO 24 (Pin18) on the Pi and the other one to the GND Pin. You may refer the following diagram.

2\. Now connect the other ends of the wire to the relay board. Connect the GND to the GND on the relay and GPIO Output wire to the relay channel pin number, which depends on the relay that you are using. Remember theGNDgoes to GND on the relay and GPIO Output goes to the relay input pin.

 ![Headers](https://opensource.com/sites/default/files/headers.png "Headers") 

Caution! Be very careful with the relay connections with Pi because if it causes a backflow of current, you with have a short circuit.

3\. Now connect the power supply to the relay, either using 12V power adapter or by connecting the VCC Pin to 3.3V or 5V on the Pi.

### Controlling the relay using PHP

Let's create a PHP script to control the GPIO pins on the Raspberry Pi, with the help of the WiringPi software.

1\. Create a file in the Apache server’s root web directory. Navigate using:

**cd ../../../**

**cd var/www/html/**

2\. Create a new folder called Home:

**sudo mkdir Home**

3\. Create a new PHP file called **on.php**:

**sudo nano on.php**

4\. Add the following code to it:

```
<?php

          system(“ gpio-g mode 24 out “) ;
          system(“ gpio-g write 24 1”) ;

?>
```

5\. Save the file using CTRL + O and exit using CTRL + X

In the code above, in the first line you've set the GPIO Pin 24 to output mode using the command:

```
system(“ gpio-g mode 24 out “) ;
```

In the second line, you’ve turned on the GPIO Pin 24, Using “1,” where “1” in binary refers to ON and “0” Means OFF.

6\. To turn off the relay, create another file called **off.php** and replace “1” with “0.”

```
<?php

system(“ gpio-g mode 24 out “) ;
system(“ gpio-g write 24 0”) ;

?>
```

7\. If you have your relay connected to the Pi, visit your web browser and type in the IP Address of your Pi followed by the directory name and file name:       

**http://{IPADDRESS}/home/on.php**

This will turn ON the relay.

8\. To turn it OFF, open the page called **off.php**,

**http://{IPADDRESS}/home/off.php**

Now you need to control both these things from a single page without refreshing or visiting the pages individually. For that you'll use AJAX.

9\. Create a new HTML file and add this code to it.

```
[html + php + ajax codeblock]

<html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">// <![CDATA[

$(document).ready(function() {

$('#on').click(function(){

var a= new XMLHttpRequest();

a.open("GET", "on.php"); a.onreadystatechange=function(){

if(a.readyState==4){ if(a.status ==200){

 } else alert ("http error"); } }

a.send();

});

});

$(document).ready(function()

{ $('#Off').click(function(){

var a= new XMLHttpRequest();

a.open("GET", "off.php");

a.onreadystatechange=function(){

if(a.readyState==4){

if(a.status ==200){

 } else alert ("http error"); } }

a.send();

});

});

</script>

<button id="on" type="button"> Switch Lights On </button>

<button id="off" type="button"> Switch Lights Off </button>
```

10\. Save the file, go to your web browser, and open that page. You’ll see two buttons, which will turn lights on and off. Based on the same idea, you can create a beautiful web interface using bootstrap and CSS skills.

### Viewing temperature on this web page

1\. Create a file called **temperature.php**:

```
sudo nano temperature.php
```

2\. Add the following code to it, replace 10-000802292522 with your device ID:

```
<?php
//File to read
$file = '/sys/devices/w1_bus_master1/10-000802292522/w1_slave';
//Read the file line by line
$lines = file($file);
//Get the temp from second line
$temp = explode('=', $lines[1]);
//Setup some nice formatting (i.e., 21,3)
$temp = number_format($temp[1] / 1000, 1, ',', '');
//And echo that temp
echo $temp . " °C";
?>
```

3\. Go to the HTML file that you just created, and create a new **<div>** with the **id** “screen”: **<div id=“screen”></div>.**

4\. Add the following code after the **<body>** tag or at the end of the document:

```
<script>
$(document).ready(function(){
setInterval(function(){
$("#screen").load('temperature.php')
}, 1000);
});
</script>
```

In this, **#screen** is the **id** of **<div>** in which you want to display the temperature. It loads the **temperature.php** file every 1000 milliseconds.

I have used bootstrap to make a beautiful panel for displaying temperature. You can add multiple icons and glyphicons as well to make it more attractive.

This was just a basic system that controls a relay board and displays the temperature. You can develop it even further by creating event-based triggers based on timings, temperature readings from the thermostat, etc.

--------------------------------------------------------------------------------


作者简介：

Abdul Hannan Mustajab - I'm 17 years old and live in India. I am pursuing an education in science, math, and computer science. I blog about my projects at spunkytechnology.com. I've been working on AI based IoT using different micro controllers and boards . 

--------


via: https://opensource.com/article/17/3/operate-relays-control-gpio-pins-raspberry-pi

作者：[ Abdul Hannan Mustajab][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mustajabhannan
[1]:http://www.php.net/system
[2]:http://www.php.net/system
[3]:http://www.php.net/system
[4]:http://www.php.net/system
[5]:http://www.php.net/system
[6]:http://www.php.net/file
[7]:http://www.php.net/explode
[8]:http://www.php.net/number_format
[9]:https://opensource.com/article/17/3/operate-relays-control-gpio-pins-raspberry-pi?rate=RX8QqLzmUb_wEeLw0Ee0UYdp1ehVokKZ-JbbJK_Cn5M
[10]:https://opensource.com/user/123336/feed
[11]:https://opensource.com/users/mustajabhannan
