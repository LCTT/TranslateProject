
Translating by fristadream

Will Android do for the IoT what it did for mobile?
============================================================

 ![](https://cdn-images-1.medium.com/max/1000/1*GF6e6Vd-22PViWT8EDpLNA.jpeg) 

Android Things gives the IoT Wings

### My first 24 hours with Android Things

Just when I was in the middle of an Android based IoT commercial project running on a Raspberry Pi 3, something awesome happened. Google released the first preview of [Android Things][1], their SDK targeted specifically at (initially) 3 SBC’s (Single Board Computers) — the Pi 3, the Intel Edison and the NXP Pico. To say I was struggling is a bit of an understatement — without even an established port of Android to the Pi, we were at the mercy of the various quirks and omissions of the well-meaning but problematic homebrew distro brigade. One of these problems was a deal breaker too — no touchscreen support, not even for the official one sold by [Element14][2]. I had an idea Android was heading for the Pi already, and earlier a mention in a [commit to the AOSP project from Google][3] got everyone excited for a while. So when, on 12th Dec 2016, without much fanfare I might add, Google announced “Android Things” plus a downloadable SDK, I dived in with both hands, a map and a flashlight, and hung a “do not disturb” sign on my door…

### Questions?

I had many questions regarding Googles Android on the Pi, having done extensive work with Android previously and a few Pi projects, including being involved right now in the one mentioned. I’ll try to address these as I proceed, but the first and biggest was answered right away — there is full Android Studio support and the Pi becomes just another regular ADB-addressable device on your list. Yay! The power, convenience and sheer ease of use we get within Android Studio is available at last to real IoT hardware, so we get all the layout previews, debug system, source checkers, automated tests etc. I can’t stress this enough. Up until now, most of my work onboard the Pi had been in Python having SSH’d in using some editor running on the Pi (MC if you really want to know). This worked, and no doubt hardcore Pi/Python heads could point out far better ways of working, but it really felt like I’d timewarped back to the 80’s in terms of software development. My projects involved writing Android software on handsets which controlled the Pi, so this rubbed salt in the wound — I was using Android Studio for “real” Android work, and SSH for the rest. That’s all over now.

All samples are for the 3 SBC’s, of which the the Pi 3 is just one. The Build.DEVICE constant lets you determine this at runtime, so you see lots of code like:

```
 public static String getGPIOForButton() {
     switch (Build.DEVICE) {
         case DEVICE_EDISON_ARDUINO:
             return "IO12";
         case DEVICE_EDISON:
             return "GP44";
         case DEVICE_RPI3:
             return "BCM21";
         case DEVICE_NXP:
             return "GPIO4_IO20";
         default:
             throw new IllegalStateException(“Unknown Build.DEVICE “ + Build.DEVICE);
     }
 }
```

Of keen interest is the GPIO handling. Since I’m only familiar with the Pi, I can only assume the other SBCs work the same way, but this is the set of pins which can be defined as inputs/outputs and is the main interface to the physical outside world. The Pi Linux based OS distros have full and easy support via read and write methods in Python, but for Android you’d have to use the NDK to write C++ drivers, and talk to these via JNI in Java. Not that difficult, but something else to maintain in your build chain. The Pi also designates 2 pins for I2C, the clock and the data, so extra work would be needed handling those. I2C is the really cool bus-addressable system which turns many separate pins of data into one by serialising it. So here’s the kicker — all that’s done directly in Android Things for you. You just _read()_and _write() _to/from whatever GPIO pin you need, and I2C is as easy as this:

```
public class HomeActivity extends Activity {
    // I2C Device Name
    private static final String I2C_DEVICE_NAME = ...;
    // I2C Slave Address
    private static final int I2C_ADDRESS = ...;

    private I2cDevice mDevice;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Attempt to access the I2C device
        try {
            PeripheralManagerService manager = new PeripheralManagerService();
            mDevice = manager.openI2cDevice(I2C_DEVICE_NAME, I2C_ADDRESS)
        } catch (IOException e) {
            Log.w(TAG, "Unable to access I2C device", e);
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();

        if (mDevice != null) {
            try {
                mDevice.close();
                mDevice = null;
            } catch (IOException e) {
                Log.w(TAG, "Unable to close I2C device", e);
            }
        }
    }
}
```

### What version of Android is Android Things based on?

This looks to be Android 7.0, which is fantastic because we get all the material design UI, the optimisations, the security hardening and so on from all the previous versions of Android. It also raises an interesting question — how are future platform updates rolled out, as opposed to your app which you have to manage separately? Remember, these devices may not be connected to the internet. We are no longer in the comfortable space of cellular/WiFi connections being assumed to at least be available, even if sometimes unreliable.

The other worry was this being an offshoot version of Android in name only, where to accommodate the lowest common denominator, something so simple it could power an Arduino has been released — more of a marketing exercise than a rich OS. That’s quickly put to bed by looking at the [samples][4], actually — some even use SVG graphics as resources, a very recent Android innovation, rather than the traditional bitmap-based graphics, which of course it also handles with ease.

Inevitably, regular Android will throw up issues when compared with Android Things. For example, there is the permissions conundrum. Mitigated somewhat by the fact Android Things is designed to power fixed hardware devices, so the user wouldn’t normally install apps after it’s been built, it’s nevertheless a problem asking them for permissions on a device which might not have a UI! The solution is to grant all the permissions an app might need at install time. Normally, these devices are one app only, and that app is the one which runs when it powers up.

 ![](https://cdn-images-1.medium.com/max/800/1*pi7HyLT-BVwHQ_Rw3TDSWQ.png) 

### What happened to Brillo?

Brillo was the codename given to Googles previous IoT OS, which sounds a lot like what Android Things used to be called. In fact you see many references to Brillo still, especially in the source code folder names in the GitHub Android Things examples. However, it has ceased to be. All hail the new king!

### UI Guidelines?

Google issues extensive guidelines regarding Android smartphone and tablet apps, such as how far apart on screen buttons should be and so on. Sure, its best to follow these where practical, but we’re not in Kansas any more. There is nothing there by default — it’s up the the app author to manage _everything_. This includes the top status bar, the bottom navigation bar — absolutely everything. Years of Google telling Android app authors never to render an onscreen BACK button because the platform will supply one is thrown out, because for Android Things there [might not even be a UI at all!][5]

### How much support of the Google services we’re used to from smartphones can we expect?

Quite a bit actually, but not everything. The first preview has no bluetooth support. No NFC, either — both of which are heavily contributing to the IoT revolution. The SBC’s support them, so I can’t see them not being available for too long. Since there’s no notification bar, there can’t be any notifications. No Maps. There’s no default soft keyboard, you have to install one yourself. And since there is no Play Store, you have to get down and dirty with ADB to do this, and many other operations.

When developing for Android Things I tried to make the same APK I was targeting for the Pi run on a regular handset. This threw up an error preventing it from being installed on anything other than an Android Things device: library “_com.google.android.things_” not present. Kinda makes sense, because only Android Things devices would need this, but it seemed limiting because not only would no smartphones or tablets have it present, but neither would any emulators. It looked like you could only run and test your Android Things apps on physical Android Things devices … until Google helpfully replied to my query on this in the [G+ Google’s IoT Developers Community][6] group with a workaround. Bullet dodged there, then.

### How can we expect the Android Things ecosystem to evolve now?

I’d expect to see a lot more porting of traditional Linux server based apps which didn’t really make sense to an Android restricted to smartphones and tablets. For example, a web server suddenly becomes very useful. Some exist already, but nothing like the heavyweights such as Apache or Nginx. IoT devices might not have a local UI, but administering them via a browser is certainly viable, so something to present a web panel this way is needed. Similarly comms apps from the big names — all it needs is a mike and speaker and in theory it’s good to go for any video calling app, like Duo, Skype, FB etc. How far this evolution goes is anyone’s guess. Will there be a Play Store? Will they show ads? Can we be sure they won’t spy on us, or let hackers control them? The IoT from a consumer point of view always was net-connected devices with touchscreens, and everyone’s already used to that way of working from their smartphones.

I’d also expect to see rapid progress regarding hardware — in particular many more SBC’s at even lower costs. Look at the amazing $5 Raspberry Pi Zero, which unfortunately almost certainly can’t run Android Things due to its limited CPU and RAM. How long until one like this can? It’s pretty obvious, now the bar has been set, any self respecting SBC manufacturer will be aiming for Android Things compatibility, and probably the economies of scale will apply to the peripherals too such as a $2 3" touchscreen. Microwave ovens just won’t sell unless you can watch YouTube on them, and your dishwasher just put in a bid for more powder on eBay since it noticed you’re running low…

However, I don’t think we can get too carried away here. Knowing a little about Android architecture helps when thinking of it as an all-encompassing IoT OS. It still uses Java, which has been hammered to death in the past with all its garbage-collection induced timing issues. That’s the least of it though. A genuine realtime OS relies on predictable, accurate and rock-solid timing or it can’t be described as “mission critical”. Think about medical applications, safety monitors, industrial controllers etc. With Android, your Activity/Service can, in theory, be killed at any time if the host OS thinks it needs to. Not so bad on a phone — the user restarts the app, kills other apps, or reboots the handset. A heart monitor is a different kettle all together though. If that foreground Activity/Service is watching a GPIO pin, and the signal isn’t dealt with exactly when it is supposed to, we have failed. Some pretty fundamental changes would have to be made to Android to support this, and so far there’s no indication it’s even planned.

### Those 24 hours

So, back to my project. I thought I’d take the work I’d done already and just port as much as I could over, waiting for the inevitable roadblock where I had to head over to the G+ group, cap in hand for help. Which, apart from the query about running on non-AT devices, never happened. And it ran great! This project uses some oddball stuff too, custom fonts, prescise timers — all of which appeared perfectly laid out in Android Studio. So its top marks from me, Google — at last I can start giving actual prototypes out rather than just videos and screenshots.

### The big picture

The IoT OS landscape today looks very fragmented. There is clearly no market leader and despite all the hype and buzz we hear, it’s still incredibly early days. Can Google do to the IoT with Android Things what it did to mobile, where it’s dominance is now very close to 90%? I believe so, and if that is to happen, this launch of Android Things is exactly how they would go about it.

Remember all the open vs closed software wars, mainly between Apple who never licence theirs, and Google who can’t give it away for free to enough people? That policy now comes back once more, because the idea of Apple launching a free IoT OS is as far fetched as them giving away their next iPhone for nothing.

The IoT OS game is wide open for someone to grab, and the opposition won’t even be putting their kit on this time…

Head over to the [Developer Preview][7] site to get your copy of the Android Things SDK now.

--------------------------------------------------------------------------------

via: https://medium.com/@carl.whalley/will-android-do-for-iot-what-it-did-for-mobile-c9ac79d06c#.hxva5aqi2

作者：[Carl Whalley][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@carl.whalley
[1]:https://developer.android.com/things/index.html
[2]:https://www.element14.com/community/docs/DOC-78156/l/raspberry-pi-7-touchscreen-display
[3]:http://www.androidpolice.com/2016/05/24/google-is-preparing-to-add-the-raspberry-pi-3-to-aosp-it-will-apparently-become-an-officially-supported-device/
[4]:https://github.com/androidthings/sample-simpleui/blob/master/app/src/main/res/drawable/pinout_board_vert.xml
[5]:https://developer.android.com/things/sdk/index.html
[6]:https://plus.google.com/+CarlWhalley/posts/4tF76pWEs1D
[7]:https://developer.android.com/things/preview/index.html
