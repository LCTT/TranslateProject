translating---geekpi

# [Open source social robot kit runs on Raspberry Pi and Arduino][22]



![](http://linuxgizmos.com/files/thecorpora_qboone-thm.jpg)
Thecorpora’s Scratch-ready “Q.bo One” robot is based on the RPi 3 and Arduino, and offers stereo cams, mics, a speaker, and visual and language recognition.

In 2010, robotics developer Francisco Paz and his Barcelona-based Thecorpora startup introduced the first [Qbo][6] “Cue-be-oh” robot as an open source proof-of-concept and research project for exploring AI capabilities in multi-sensory, interactive robots. Now, after a preview in February at Mobile World Congress, Thecorpora has gone to Indiegogo to launch the first mass produced version of the social robot in partnership with Arrow.


 [![](http://linuxgizmos.com/files/thecorpora_qboone-sm.jpg)][7]   [![](http://linuxgizmos.com/files/thecorpora_qboone2-sm.jpg)][8] 
**Q.bo One from angle (left) and top**


Like the original, the new Q.bo One has a spherical head with eyes (dual stereoscopic cameras), ears (3x mics), and mouth (speakers), and is controlled by WiFi and Bluetooth. The Q.bo One also similarly features open source Linux software and open spec hardware. Instead of using an Intel Atom-based Mini-ITX board, however, it runs Raspbian on a Raspberry Pi 3 linked to an Arduino compatible mainboard.


 [![](http://linuxgizmos.com/files/thecorpora_qboone_side-sm.jpg)][9] 
**Q.bo One side views**


The Q.bo One is available on Indiegogo through mid-July starting at $369 (early bird) or $399 in kit form including its built-in Raspberry Pi 3 and Arduino-based “Qboard” controller board. It also sells for $499 fully assembled. The Indiegogo campaign is currently about 15 percent toward its flexible $100,000 goal, and shipments are due in December.

More proficient roboticists and embedded developers may instead want the $99 package with just the RPi and Qboard PCBs and software, or the $249 version, which gives you the robot kit without the boards. With this package, you could replace the Qboard with your own Arduino controller, and swap out the RPi 3 for another Linux SBC. Thecorpora lists the Banana Pi, BeagleBone, Tinker Board, and [soon to be retired Intel Edison][10], as examples of compatible alternatives.

<center>
 [![](http://linuxgizmos.com/files/thecorpora_qboone_kit-sm.jpg)][11] 
**Q.bo One kit**
(click image to enlarge)
</center>

Unlike the 2010 Qbo, the Q.bo One is not mobile aside from its spherical head, which swivels in its base with the help of dual servos in order to track voices and motion. The Robotis Dynamixel servos, which are also found in the open source, Raspberry Pi based [TurtleBot 3][23] robot kit, can move up and down in addition to left and right.

<center>
 [![](http://linuxgizmos.com/files/thecorpora_qboone_detail-sm.jpg)][12]   [![](http://linuxgizmos.com/files/thecorpora_qboone_qboard-sm.jpg)][13] 
**Q.bo One detail view (left) and Qboard detail**
(click images to enlarge)
</center>

The Q.bo One can also be compared with the similarly stationary, Linux-based [Jibo][24] “social robot,” which launched on Indiegogo in 2014 to the tune of $3.6 million. The Jibo has yet to ship, however, with the [latest delays][25] pushing it toward a release sometime this year.

| 
![](http://linuxgizmos.com/files/thecorpora_qboone_mouth.jpg)

**Q.bo One** |

We’ll go out on a limb and predict the Q.bo One will ship closer to its Dec. 2017 target. The core technology and AI software has been proven, and so are the Raspberry Pi and Arduino technologies. The Qboard mainboard has already been built and certified for manufacturing by Arrow.

The open source design suggests that even a mobile version wouldn’t be out of the question. That would make it more like the rolling, humanoid [Pepper][14], a similarly AI-infused conversational robot from Softbank and Aldeberan.

The Q.bo One has added a few tricks since the original, such as a “mouth” formed by 20 LEDs that light up in different, programmable patterns to mimic lips moving during speech. There are also three touch sensors around head if you want to tap the bot to get its attention. But all you really need to do is speak, and the Q.bo One will swivel and gaze adoringly at you like a cocker spaniel.

Interfaces include everything you have on the Raspberry Pi 3, which just demolished the competition in our [2017 hacker board survey][15]. An antenna mount is provided for the RPi 3’s WiFi and Bluetooth radios.

<center>
 [![](http://linuxgizmos.com/files/thecorpora_qboone_arch-sm.jpg)][16]   [![](http://linuxgizmos.com/files/thecorpora_qboone_scratch-sm.jpg)][17] 
**Q.bo One software architecture (left) and Q.bo One with Scratch screen**
(click images to enlarge)
</center>

The Qboard (also referred to as the Q.board) runs Arduino code on an Atmel ATSAMD21 MCU, and houses the three microphones, speaker, touch sensors, Dynamixel controller, and the LED matrix for the mouth. Other features include GPIO, an I2C interface, and a micro-USB port that can connect to a desktop computer.

The Q.bo One can recognize faces and track movements, and the bot can even recognize itself in a mirror. With the help of a cloud connection, the robot can recognize and converse with other Q.bo One bots. The robot can respond to questions with the help of natural language processing, and read aloud with text-to-speech

Scratch programming is available, enabling the robot’s main function, which is to teach kids about robots and programming. The robot is also designed for educators and makers, and can act as a companion to the elderly.

The Raspbian based software uses OpenCV for vision processing, and can be programmed with a wide variety of languages including C++. The software also offers hooks to IBM Bluemix, NodeRED, and ROS. Presumably, you could also integrate an [Alexa][18] or [Google Assistant][19] voice agent, although Thecorpora makes no mention of this.



**Further information**

The Q.bo One is available on Indiegogo through mid-July starting at $369 for the full kit and $499 fully assembled. Shipments are expected in Dec. 2017\. More information may be found on the [Q.bo One Indiegogo page][20] and [Thecorpora website][21].

--------------------------------------------------------------------------------

via: http://linuxgizmos.com/open-source-social-robot-kit-runs-on-raspberry-pi-and-arduino/

作者：[ Eric Brown][a]
译者：[zky001](https://github.com/zky001)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxgizmos.com/open-source-social-robot-kit-runs-on-raspberry-pi-and-arduino/
[1]:http://twitter.com/share?url=http://linuxgizmos.com/open-source-social-robot-kit-runs-on-raspberry-pi-and-arduino/&text=Open+source+social+robot+kit+runs+on+Raspberry+Pi+and+Arduino+
[2]:https://plus.google.com/share?url=http://linuxgizmos.com/open-source-social-robot-kit-runs-on-raspberry-pi-and-arduino/
[3]:http://www.facebook.com/sharer.php?u=http://linuxgizmos.com/open-source-social-robot-kit-runs-on-raspberry-pi-and-arduino/
[4]:http://www.linkedin.com/shareArticle?mini=true&url=http://linuxgizmos.com/open-source-social-robot-kit-runs-on-raspberry-pi-and-arduino/
[5]:http://reddit.com/submit?url=http://linuxgizmos.com/open-source-social-robot-kit-runs-on-raspberry-pi-and-arduino/&title=Open%20source%20social%20robot%20kit%20runs%20on%20Raspberry%20Pi%20and%20Arduino
[6]:http://linuxdevices.linuxgizmos.com/open-source-robot-is-all-eyes/
[7]:http://linuxgizmos.com/files/thecorpora_qboone.jpg
[8]:http://linuxgizmos.com/files/thecorpora_qboone2.jpg
[9]:http://linuxgizmos.com/files/thecorpora_qboone_side.jpg
[10]:http://linuxgizmos.com/intel-pulls-the-plug-on-its-joule-edison-and-galileo-boards/
[11]:http://linuxgizmos.com/files/thecorpora_qboone_kit.jpg
[12]:http://linuxgizmos.com/files/thecorpora_qboone_detail.jpg
[13]:http://linuxgizmos.com/files/thecorpora_qboone_qboard.jpg
[14]:http://linuxgizmos.com/worlds-first-emotional-robot-runs-linux/
[15]:http://linuxgizmos.com/2017-hacker-board-survey-raspberry-pi-still-rules-but-x86-sbcs-make-gains/
[16]:http://linuxgizmos.com/files/thecorpora_qboone_arch.jpg
[17]:http://linuxgizmos.com/files/thecorpora_qboone_scratch.jpg
[18]:http://linuxgizmos.com/how-to-add-alexa-to-your-raspberry-pi-3-gizmo/
[19]:http://linuxgizmos.com/free-raspberry-pi-voice-kit-taps-google-assistant-sdk/
[20]:https://www.indiegogo.com/projects/q-bo-one-an-open-source-robot-for-everyone#/
[21]:http://thecorpora.com/
[22]:http://linuxgizmos.com/open-source-social-robot-kit-runs-on-raspberry-pi-and-arduino/
[23]:http://linuxgizmos.com/ubuntu-driven-turtlebot-gets-a-major-rev-with-a-pi-or-joule-in-the-drivers-seat/
[24]:http://linuxgizmos.com/cheery-social-robot-owes-it-all-to-its-inner-linux/
[25]:https://www.slashgear.com/jibo-delayed-to-2017-as-social-robot-hits-more-hurdles-20464725/
