How to Build an Amazon Echo with Raspberry Pi
======

![](https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-featured-image.jpg)

Many people today are using assistant software in their homes and offices to help with everyday tasks. There are many different models to purchase, but did you know you can build your own? [Amazon Developer][1] allows you to use the Alexa software to create your own [Amazon Echo][2] with [Raspberry Pi][3].

### Materials

For this project, you’ll need:

  * The Raspberry Pi 3 or Pi 2 Model B and Micro-USB power cable
  * Micro SD Card (Minimum 8 GB) – If you don’t have an operating system installed, there’s an easy-to-use operating system called NOOBS (New Out of the Box Software). The simplest way to get NOOBS is to buy an SD card with NOOBS pre-loaded.
  * USB 2.0 Mini Microphone
  * External speaker and 3.5mm audio cable
  * USB Keyboard and Mouse and external HDMI Monitor
  * Internet connection (Ethernet or WiFi)
  * For a Pi 2 to connect to the Internet wirelessly, you need a WiFi Wireless Adapter. The Pi 3 has built-in WiFi.



**Related** : [5 Essential Tips & Tricks to Personalize Your Amazon Echo][4]

### Register for an Amazon Developer account

If you need an Amazon Developer account, create a free one on their [page][1]. Read the AVS (Alexa Voice Service) Terms and Agreements [here][5].

![raspberrypi-echo-amazon-developer-account][6]

![raspberrypi-echo-amazon-developer-account][6]

Complete your profile information.

![raspberrypi-echo-register-profile-info][7]

![raspberrypi-echo-register-profile-info][7]

Read and accept the App Distribution Agreement.

![raspberrypi-echo-register-app-distribution-agree][8]

![raspberrypi-echo-register-app-distribution-agree][8]

Select whether you are choosing to monetize your apps.

![raspberrypi-echo-register-payments][9]

![raspberrypi-echo-register-payments][9]

### Create your device on Amazon Developer

After registering your Amazon Developer account, create an Alexa device and Security profile. Make careful note of the following parameters as you go through the setup – ProductID, ClientID, and ClientSecret, because you need to enter these again later.

From the top menu, select “Alexa Voice Service.”

![raspberrypi-echo-alexa-voice-service][10]

![raspberrypi-echo-alexa-voice-service][10]

The “Welcome to Developer” screen will appear.

![raspberrypi-echo-developer-welcome][11]

![raspberrypi-echo-developer-welcome][11]

The first screen asks about the product you are building.

1\. First, name your device.

![raspberrypi-echo-product-name][12]

![raspberrypi-echo-product-name][12]

2\. Next, type a Product ID with no spaces or special characters.

**Note** : You need this later. Record it somewhere.

![raspberrypi-echo-product-id][13]

![raspberrypi-echo-product-id][13]

3\. Select Alexa-Enabled Device for the product type.

![raspberrypi-echo-product-type][14]

![raspberrypi-echo-product-type][14]

4\. Alexa needs a companion app. Select yes for this question.

![raspberrypi-echo-companion-app][15]

![raspberrypi-echo-companion-app][15]

5\. Choose Wireless Speakers from the dropdown menu.

6\. Enter “Raspberry Pi Project on Github” into the description box. This is information for AVS and isn’t visible to others.

7\. Check both the “Touch-initiated” and “Hands-free” options.

![raspberrypi-echo-product-options][16]

![raspberrypi-echo-product-options][16]

8\. You can upload an image for your device, but let’s skip this step for now.

9\. Check “no” for commercial distribution and children’s product questions.

![raspberrypi-echo-product-options-2][17]

![raspberrypi-echo-product-options-2][17]

10\. Click “Next.”

### Create your security profile

On this page, you create a new LWA (Login with Amazon) security profile to identify the user data and security credentials with this project.

1\. Click “Create new profile.”

![raspberrypi-echo-lwa-security-profile2][18]

![raspberrypi-echo-lwa-security-profile2][18]

2\. Create a name for the profile. It could be something like, “Alexa Security Profile.”

![raspberrypi-echo-security-profile-name][19]

![raspberrypi-echo-security-profile-name][19]

3\. Type a description for the profile. You can choose “Alexa Security Profile Description.”

![raspberrypi-echo-security-description][20]

![raspberrypi-echo-security-description][20]

4\. Click “Next.”

5\. Amazon generates a Client ID and Client Secret for you. These are the other two values you need later. Keep them nearby.

![raspberrypi-echo-id-and-secret1][21]

![raspberrypi-echo-id-and-secret1][21]

6\. Enter your Allowed origins and Allowed return URLs. We’re setting up http and https routes for this project, so type the following into your “Allowed Origins” field — “<http://localhost:3000.”>

7\. Click “Add.”

8\. Type “<https://localhost:3000”> into the same box where you typed the first one.

![raspberrypi-echo-allowed-origins-2][22]

![raspberrypi-echo-allowed-origins-2][22]

9\. Click “Add” again.

10\. Do the same thing to the Allowed Return URLs, except enter the following two URLs:

11\. The page should look like this before you click Finish. Make sure none of your URLs are still in the field where you typed them. They are displayed on a grey background after you add them.

![raspberrypi-echo-all-origins][23]

![raspberrypi-echo-all-origins][23]

12\. Once you click “Finish,” this screen appears. Your project has been created and is ready to install.

![raspberrypi-echo-product-screen][24]

![raspberrypi-echo-product-screen][24]

### Clone the Alexa sample app

1\. Open Terminal.

![raspberrypi-echo-open-terminal2][25]

![raspberrypi-echo-open-terminal2][25]

2\. Type the following:
```
cd Desktop
git clone https://github.com/alexa/alexa-avs-sample-app.git
```

### Update the install script by adding your credentials

Before you run the install script, update the script with the credentials that you recorded from Amazon — ProductID, ClientID, ClientSecret.

1\. Type the following in Terminal:
```
cd ~/Desktop/alexa-avs-sample-app
nano automated_install.sh
```

2\. When it runs, this screen appears. Use the arrows on your keyboard to navigate, and replace the fields for ProductID, ClientID, and ClientSecret with your values.

![raspberrypi-echo-insert-device-data][26]

![raspberrypi-echo-insert-device-data][26]

The changes should look like this:
```
ProductID="Your Device Name"
ClientID="amzn.xxxxx.xxxxxxxxx"
ClientSecret="4e8cb14xxxxxxxxxxxxxxxxxxxxxxxxxxxxx6b4f9"
```

3\. Type Ctrl + X to exit the script. Type Y and then Enter to save your changes.

### Run the install script

To run the script, open Terminal and run the following commands.
```
cd ~/Desktop/alexa-avs-sample-app
. automated_install.sh
```

While this script is running, you will be asked to answer some simple questions. These are to make sure you’ve completed all of the necessary setup on Amazon before you install the program.

![raspberrypi-echo-setup-questions][27]

![raspberrypi-echo-setup-questions][27]

The installation is about thirty minutes, so go grab a snack.

When installed correctly, your terminal window will look like the following image.

![raspberrypi-echo-end-install2][28]

![raspberrypi-echo-end-install2][28]

### The Three Terminals

You must complete three steps to run the Alexa app. Each of them must run in a separate Terminal window, and you must do them in the correct order.

There were some programs that I needed but didn’t have. I installed these programs as I went. In case you have the same problem, I included a side note about this in each step.

#### Terminal 1

This window runs the web service to authorize your app with AVS (Alexa Voice Service)

Open Terminal and type in the following commands:
```
cd ~/Desktop/alexa-avs-sample-app/samples
cd companionService && npm start
```

**Note** : npm is a package manager for the JavaScript programming language. If it is not available when you run the command, you can get it [here][29].

When the scripts finish, the window looks like this, showing that Pi is listening on port 3000.

![raspberrypi-echo-port-3000][30]

![raspberrypi-echo-port-3000][30]

Don’t close this window. It needs to remain open while completing the next steps.

#### Terminal 2

This window communicates with AVS.

Type the following into another Terminal window.
```
cd ~/Desktop/alexa-avs-sample-app/samples
cd javaclient && mvn exec:exec
```

**Note** : mvn is short for Apache Maven. If you don’t have it, click [here][31] to get started.

When you run the client, a dialog box appears saying, “Please register your device by …”

Click Yes.

![raspberrypi-echo-open-site][32]

![raspberrypi-echo-open-site][32]

With some browsers, you’ll get a warning that the connection is not safe. Dismiss this by clicking the “advanced” button. Then on the next screen, click on “Proceed to localhost (unsafe).”

Now, log into Amazon using your developer credentials.

The next screen asks for permission to use the security profile you created earlier for the device you are registering. Click Okay.

![raspberrypi-echo-use-security-profile][33]

![raspberrypi-echo-use-security-profile][33]

You will be redirected to a URL beginning with “<https://localhost:3000/authresponse”> that looks like the following image.

![raspberrypi-echo-device-tokens-ready][34]

![raspberrypi-echo-device-tokens-ready][34]

Go back to the open dialog box and click the OK button. The client is now able to accept requests from your Alexa device.

Keep the terminal open as well as the Voice Service Dialog box.

![raspberrypi-echo-voice-service-box][35]

![raspberrypi-echo-voice-service-box][35]

#### Terminal 3

This window installs the application that wakes up Alexa by using her wake word. Skip this if you don’t want to use voice to initiate Alexa.

Open a new terminal window and use one of the following commands to bring up a wake word engine using Sensory or KITT.AI.

To use the Sensory wake word engine, type:
```
cd ~/Desktop/alexa-avs-sample-app/samples
cd wakeWordAgent/src && ./wakeWordAgent -e sensory
```

To use KITT.AI’s wake word engine, type:
```
cd ~/Desktop/alexa-avs-sample-app/samples
cd wakeWordAgent/src && ./wakeWordAgent -e kitt_ai
```

### Test it out

Talk to Alexa by saying the wake word, “Alexa.” Wait for the beep before giving your command. For example, try it by saying, “Alexa.” Wait for the beep, and then ask, “What’s the time?”

If she responds correctly, you have a working Alexa device!

Check out Amazon’s Alexa [webpage][36] for more ideas. This Alexa can do everything an Echo can do!

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/build-amazon-echo-with-raspberry-pi/

作者：[Tracey Rosenberger][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/traceyrosenberger/
[1]:http://developer.amazon.com
[2]:https://www.amazon.com/dp/B06XCM9LJ4/?tag=maketecheas08-20
[3]:https://www.maketecheasier.com/tag/raspberry-pi
[4]:https://www.maketecheasier.com/essential-amazon-echo-tips-tricks/ (5 Essential Tips & Tricks to Personalize Your Amazon Echo)
[5]:https://developer.amazon.com/support/legal/alexa/alexa-voice-service/terms-and-agreements
[6]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-Amazon-developer-account.jpg (raspberrypi-echo-amazon-developer-account)
[7]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-Register-Profile-info.jpg (raspberrypi-echo-register-profile-info)
[8]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-Register-App-Distribution-Agree.jpg (raspberrypi-echo-register-app-distribution-agree)
[9]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-Register-Payments.jpg (raspberrypi-echo-register-payments)
[10]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-Alexa-voice-service.jpg (raspberrypi-echo-alexa-voice-service)
[11]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-developer-welcome.jpg (raspberrypi-echo-developer-welcome)
[12]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-product-name.jpg (raspberrypi-echo-product-name)
[13]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-product-ID.jpg (raspberrypi-echo-product-id)
[14]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-product-type.jpg (raspberrypi-echo-product-type)
[15]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-companion-app.jpg (raspberrypi-echo-companion-app)
[16]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-product-options.jpg (raspberrypi-echo-product-options)
[17]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-product-options-2.jpg (raspberrypi-echo-product-options-2)
[18]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-LWA-Security-Profile2.jpg (raspberrypi-echo-lwa-security-profile2)
[19]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-security-profile-name.jpg (raspberrypi-echo-security-profile-name)
[20]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-security-description.jpg (raspberrypi-echo-security-description)
[21]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-ID-and-secret1.jpg (raspberrypi-echo-id-and-secret1)
[22]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-allowed-origins-2.jpg (raspberrypi-echo-allowed-origins-2)
[23]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-all-origins.jpg (raspberrypi-echo-all-origins)
[24]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-product-screen.jpg (raspberrypi-echo-product-screen)
[25]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-open-terminal2.jpg (raspberrypi-echo-open-terminal2)
[26]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-insert-device-data.jpg (raspberrypi-echo-insert-device-data)
[27]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-setup-questions.jpg (raspberrypi-echo-setup-questions)
[28]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-end-install2.jpg (raspberrypi-echo-end-install2)
[29]:https://www.npmjs.com/
[30]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-Port-3000.jpg (raspberrypi-echo-port-3000)
[31]:https://maven.apache.org/
[32]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-open-site.jpg (raspberrypi-echo-open-site)
[33]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-use-security-profile.jpg (raspberrypi-echo-use-security-profile)
[34]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-device-tokens-ready.jpg (raspberrypi-echo-device-tokens-ready)
[35]:https://www.maketecheasier.com/assets/uploads/2018/03/RaspberryPi-Echo-Voice-service-box.jpg (raspberrypi-echo-voice-service-box)
[36]:https://www.amazon.com/meet-alexa/b?ie=UTF8&node=16067214011&tag=maketecheas08-20
