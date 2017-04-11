How to install Asterisk on the Raspberry Pi
============================================================

> Are you looking for a phone system for your small business or home office?


 ![How to install Asterisk on the Raspberry Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/life-raspberrypi_0.png?itok=wxVxQ0Z4 "How to install Asterisk on the Raspberry Pi") 
>Image credits : Dwight Sipler on [Flickr][8]

Are you looking for a phone system for your small business or home office? I've been interested in a scalable VoIP (Voice over IP) solution, and that's when I came across an implementation of [Asterisk][9] on the Raspberry Pi.

My curiosity was piqued and I was determined to give it a try, so I [downloaded][10] the software from [Asterisk][11] and then set about building the server using my Raspberry Pi 3.

### Getting started

First, I burned the downloaded image onto a MicroSD card; the suggested minimum is 4GB. After transferring the image to the MicroSD card and inserting it into the appropriate slot on the Raspberry Pi, I connected an Ethernet cable to the Pi and to an Ethernet port on my home router.

More on Raspberry Pi

*   [Our latest on Raspberry Pi][1]
*   [What is Raspberry Pi?][2]
*   [Getting started with Raspberry Pi][3]
*   [Send us your Raspberry Pi projects and tutorials][4]

Next, I opened a terminal on my Linux computer and entered **ssh root@192.168.1.8**, which is the IP address of my server. I was prompted to log in as root on the **raspbx**. The default password is "raspberry." (For security reasons, be sure to change your passwords from the default settings if you plan to do more than just try it out.)

Once I was logged into the shell on the **raspbx,** I then needed to prepare the server for use. Following the [documentation][12] provided on the site, I created new host keys as directed by entering **regen-hostkeys** at the shell prompt. Then, I configured the time zone for the server by entering **configure-timezone** at the shell prompt. I configured the locale setting by entering, **dpkg-reconfigure locales** at the prompt. I also installed [Fail2Ban][13] to provide security on my server.

Now I was ready to test my configuration.

### Testing

I logged out of the **raspbx** shell and then opened a browser and pointed it at the IP address of my server. Loading the server IP address into the browser, I was presented with a lovely login page.

[FreePBX][14] provides a very nice web-based, open source graphical user interface, which I used to control and configure Asterisk (find on [GitHub][15]). (FreePBX is licensed under the GPL.) I used it to complete the rest of the configuration. The default login for FreePBX is**username:admin;password:admin**.

 ![FreePBX_Login_Screen](https://opensource.com/sites/default/files/freepbx_login_screen.png "FreePBX_Login_Screen") 

Once in, I navigated to the Application Menu, which is located at the upper left of the display. I clicked on the menu link and selected the second option, which is Applications, and selected the fourth option, which is labeled Extensions. From there I created a **New Chan_Sip** extension.

 ![](https://opensource.com/sites/default/files/add_a_new_chan_sip_extension.png) 

I configured a **Sip** extension user with a password. Passwords are either automatically generated or you can elect to create your own.

Now that I had a functioning extension I was anxious to try out my new VoIP server. I downloaded and installed [Yate Client][16], which I discovered in the process of building the server. After installing [Yate][17], I wanted to test the connectivity with the server. I discovered that I could connect to the server for an echo test using Yate and entering ***43**. I was really excited when I heard the instructions through the client.

 ![](https://opensource.com/sites/default/files/echotest.png) 

I decided to create another **Sip** extension so that I could test the voicemail capabilities of the system. Once I completed that I used the Yate client to call that extension and leave a brief voice message. Then using Yate again, I called that extension and entered ***97** and retrieved the voice message. Then I wanted to see if I could use my new server to call an outside line. Returning to the menu, I chose the Connectivity option and added a Google Voice line.

 ![Google_Voice_Connectivity](https://opensource.com/sites/default/files/google_voice_connectivity.png "Google_Voice_Connectivity") 

Then I returned to the Connectivity menu and added Google Voice to the Outbound routes.

 ![Google_Voice_outbound_route](https://opensource.com/sites/default/files/google_voice_outbound_route.png "Google_Voice_outbound_route") 

### Completing a call

Returning to the Yate client, I entered an outside line and successfully completed that call.

I'm convinced that this particular VoIP solution could easily work for a small office. According to the [Frequently Asked Questions][18] section of the RasPBX website, a typical Raspberry Pi system could support up to 10 concurrent calls on a Raspberry Pi 1.

Asterisk has many nuances and the FreePBX software easily leveraged them.

 _For more information about the Asterisk on Raspberry Pi project, follow their[blog][5]. You can find additional information about [FreePBX source code][6] on their website._

--------------------------------------------------------------------------------

作者简介：

Don Watkins - Educator, education technology specialist,  entrepreneur, open source advocate. M.A. in Educational Psychology, MSED in Educational Leadership, Linux system administrator, CCNA, virtualization using Virtual Box. Follow me at @Don_Watkins .

----------


via: https://opensource.com/article/17/4/asterisk-raspberry-pi-3

作者：[Don Watkins][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://opensource.com/tags/raspberry-pi?src=raspberry_pi_resource_menu
[2]:https://opensource.com/resources/what-raspberry-pi?src=raspberry_pi_resource_menu
[3]:https://opensource.com/article/16/12/getting-started-raspberry-pi?src=raspberry_pi_resource_menu
[4]:https://opensource.com/article/17/2/raspberry-pi-submit-your-article?src=raspberry_pi_resource_menu
[5]:http://www.raspberry-asterisk.org/blog/
[6]:https://www.freepbx.org/development/source-code/
[7]:https://opensource.com/article/17/4/asterisk-raspberry-pi-3?rate=zM9tOp0HEPyOUq31Np__W0QNnuAfWATkdkixOdSysDY
[8]:http://www.flickr.com/photos/photofarmer/272567650/
[9]:http://www.asterisk.org/
[10]:http://download.raspberry-asterisk.org/raspbx-28-01-2017.zip
[11]:http://www.raspberry-asterisk.org/downloads/
[12]:http://www.raspberry-asterisk.org/documentation/
[13]:http://www.raspberry-asterisk.org/documentation/#fail2ban
[14]:https://www.freepbx.org/
[15]:https://github.com/asterisk/asterisk/blob/master/LICENSE
[16]:http://yateclient.yate.ro/index.php/Download/Download
[17]:https://en.wikipedia.org/wiki/Yate_(telephony_engine)
[18]:http://www.raspberry-asterisk.org/faq/
[19]:https://opensource.com/user/15542/feed
[20]:https://opensource.com/article/17/4/asterisk-raspberry-pi-3#comments
[21]:https://opensource.com/users/don-watkins
