How to create a free baby monitoring system with Gonimo
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/baby.png?itok=7jyDs9vE)

New and expecting parents quickly learn that there is a long--and expensive--list of equipment that a new baby needs. High on that list is a baby monitor, so they can keep an eye (and an ear) on their infant while they're doing other things. But this is one piece of equipment that doesn't have to eat into your baby fund; Gonimo is a free and open source solution that turns existing devices into a baby monitoring system, freeing up some of your baby budget for any of the thousands of other must-have or trendy items lining the aisles of the nearby big-box baby store.

Gonimo was born when its developer, an open source fan, had twins and found problems with the existing options:

  * Status-quo hardware baby monitors are expensive, have limited range, and require you to carry extra devices.
  * There are mobile monitoring apps, but most of the existing iOS/Android baby monitoring apps are unreliable and unsecure, with no obvious open source product in sight.
  * If you have two young children (e.g., twins), you'll need two monitors, doubling your costs.



Gonimo was created as an open source solution to the shortcomings of typical monitors:

  * Expensive? Nope, it is free!
  * Limited range? No, it works with internet/WiFi, wherever you are.
  * Download and install apps? Uh-uh, it works in your existing web browser.
  * Buy new devices? No way, you can use any laptop, mobile phone, or tablet with a web browser and a microphone and/or camera.



(Note: Apple iOS devices are unfortunately not yet supported, but that's expected to change very soon--read on for how you can help make that happen.)

### Get started

Transforming your devices into a baby monitor is easy. From your device's browser (ideally Chrome), visit [gonimo.com][1] and click Start baby monitor to get to the web app.

  1. **Create family:** On the first-time startup screen, you will see a cute rabbit running on the globe. This is where you create a new family. Hit the **+** button and either accept the randomly generated family name or type in your own choice.



![Start screen][3]


Create a new family from the start screen

  1. **Invite devices:** After you've set up your family, the next screen directs you to invite another device to join your Gonimo family. There is a one-time invitation link that you can directly send via email or copy and paste into a message. From the other device, simply open the link and accept the invitation. Repeat this process for any other devices you'd like to invite to your family. Your devices are now in the same family, ready to cooperate as a fully working baby monitor system.



![Invite screen][5]


Invite family members

  1. **Start baby station stream:** Next, choose which device will stream the baby's audio and video to the parent station by going to the [Gonimo home screen][6], clicking on the button with the pacifier, and giving the web browser permission to access the device's microphone and camera. Adjust the camera to point at your baby's bed, or turn it off to save device battery (audio will still be streamed). Hit Start. The stream is now active.



![Select baby station][8]


Select the baby station

![Press Start][10]


Press Start to stream video.

  1. **Connect to parent station stream:** To view the baby station stream, go to another device in your Gonimo family --this is the parent station. Hit the "parent" button on the Gonimo home screen. You will see a list of all the devices in the family; next to the one with the active baby station will be a pulsing Connect button. Select Connect, and you can see and hear your baby over a peer-to-peer audio/video stream. A volume bar provides visualization for the transmitted audio stream.



![Select parent station][12]


Select parent station

![Press Connect][14]


Press Connect to start viewing the baby stream.

  1. **Congratulations!** You have successfully transformed your devices into a baby monitor directly over a web browser without downloading or installing any apps!



For more information and detailed descriptions about renaming devices, removing devices from a family, or deleting a family, check out the [video tutorial][15] at gonimo.com.

### Flexibility of the family system

One of Gonimo's strengths is its family-based system, which offers enormous flexibility for different kinds of situations that aren't available even in commercial Android or iOS apps. To dive into these features, let's assume that you have created a family that consists of three devices.

  * **Multi-baby:** What if you want to keep an eye on your two young children who sleep in separate rooms? Put a device in each child's room and set them as baby stations. The third device will act as the parent station, on which you can connect to both streams and see your toddlers via split screen. You can even extend this use case to more than two baby stations by inviting more devices to your family and setting them up as baby stations. As soon as your parent station is connected to the first baby station, return to the Device Overview screen by clicking the back arrow in the top left corner. Now you can connect to the second (and, in turn, the third, and fourth, and fifth, and so on) device, and the split screen will be established automatically. Voila!


  * **Multi-parent:** What if daddy wants to watch the children while he's at work? Just invite a fourth device (e.g., his office PC) to the family and set it up as a parent station. Both parents can check in on their children simultaneously from their own devices, even independently choosing to which stream(s) they wish to connect.


  * **Multi-family:** A single device can also be part of several families. This is very useful when your baby station is something that's always with you, such as a tablet, and you frequently visit relatives or friends. Create another family for "Granny's house" or "Uncle John's house," which consists of your baby station device paired with Granny's or Uncle John's devices. You can switch the baby station device among those families, whenever you want, from the baby station device's Gonimo home screen.



### Want to participate?

The Gonimo team loves open source. Code from the community, for the community. Gonimo's users are very important to us, but they are only one part of the Gonimo story. Creative brains behind the scenes are the key to creating a great baby monitor experience.

Currently we especially need help from people who are willing to be iOS 11 testers, as Apple's support of WebRTC in iOS 11 means we will finally be able to support iOS devices. If you can, please help us realize this awesome milestone.

If you know Haskell or want to learn it, you can check out [our code at GitHub][16]. Pull requests, code reviews, and issues are all welcome.

And, finally, please help by spreading the word to new parents and the open source world that the Gonimo baby monitor is simple to use and already in your pocket.

### About The Author
Robert Klotzner;I Am Father Of Twins;A Programmer. Once I Heard That Ordinary People Can Actually Program Computers;I Bought A Page Book About C;Started Learning;I Was Fifteen Back Then. I Sticked With C;For Quite A While;Learned Java;Went Back To C

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/9/gonimo

作者：[Robert Klotzner][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/robert-klotzner
[1]:https://gonimo.com/
[2]:/file/371256
[3]:https://opensource.com/sites/default/files/u128651/start-screen.png (Start screen)
[4]:/file/371236
[5]:https://opensource.com/sites/default/files/u128651/invite-screen.png (Invite screen)
[6]:https://app.gonimo.com/
[7]:/file/371231
[8]:https://opensource.com/sites/default/files/u128651/baby-select.png (Select baby station)
[9]:/file/371226
[10]:https://opensource.com/sites/default/files/u128651/baby-screen.png (Press Start)
[11]:/file/371251
[12]:https://opensource.com/sites/default/files/u128651/parent-select.png (Select parent station)
[13]:/file/371241
[14]:https://opensource.com/sites/default/files/u128651/parent-screen.png (Press Connect)
[15]:https://gonimo.com/index.php#intro
[16]:https://github.com/gonimo/gonimo
