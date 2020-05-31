[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A new way to build cross-platform UIs for Linux ARM devices)
[#]: via: (https://opensource.com/article/20/5/linux-arm-ui)
[#]: author: (Bruno Muniz https://opensource.com/users/brunoamuniz)

A new way to build cross-platform UIs for Linux ARM devices
======
A proof of concept using AndroidXML and TotalCross provides an easier
way of creating UIs for Raspberry Pi and other devices.
![Digital images of a computer desktop][1]

Creating a great user experience (UX) for your applications is a tough job, especially if you are developing embedded applications. Today, there are two types of graphical user interface (GUI) tools generally available for developing embedded software: either they involve complex technologies, or they are extremely expensive.

However, we have created a proof of concept (PoC) for a new way to use existing, well-established tools to build user interfaces (UIs) for applications that run on desktop, mobile, embedded devices, and low-power Linux ARM devices. Our method uses Android Studio to draw the UI; [TotalCross][2] to render the Android XML on the device; a new [TotalCross API][3] called [KnowCode][4]; and a [Raspberry Pi 4][5] to execute the application.

### Choosing Android Studio

It's possible to build a responsive and beautiful UX for an application using the TotalCross API, but creating the UI in Android Studio shortens the time between prototyping and the real application.

There are a lot of tools available to build UIs for applications, but [Android Studio][6] is the one developers worldwide use most often. In addition to its massive adoption, this tool is also super-intuitive to use, and it's really powerful for creating both simple and complex applications. The only drawback, in my opinion, is the computing power required to use the tool, which is way heavier than other integrated development environments (IDEs) like VSCode or its open source alternative, [VSCodium][7].

By thinking through these issues, we created a proof of concept using Android Studio to draw the UI and TotalCross to run the Android XML directly on the device.

### Building the UI

For our PoC, we wanted to create a home-appliance application to control temperature and other things and that would run on a Linux ARM device.

![Home appliance application to control thermostat][8]

(Bruno Muniz, [CC BY-SA 4.0][9])

We wanted to develop our application for a Raspberry Pi, so we used Android's [ConstraintLayout][10] to build a fixed-screen-size UI of 848x480 (the Raspberry Pi's resolution), but you can build responsive UIs with other layouts.

Android XML adds a lot of flexibility for UI creation, making it easy to build rich user experiences for applications. In the XML below, we used two main components: [ImageView][11] and [TextView][12].


```
&lt;ImageView
android:id="@+id/imageView6"
android:layout_width="273dp"
android:layout_height="291dp"
android:background="@drawable/Casa"
tools:layout_editor_absoluteX="109dp"
tools:layout_editor_absoluteY="95dp" /&gt;
&lt;TextView
android:id="@+id/insideTempEdit"
android:layout_width="94dp"
android:layout_height="92dp"
android:background="#F5F5F5"
android:text="20"
android:textAlignment="center"
android:gravity="center"
android:textColor="#000000"
android:textSize="67dp"
android:textStyle="bold"
tools:layout_editor_absoluteX="196dp"
tools:layout_editor_absoluteY="246dp" /&gt;
```

The TextView elements are used to show some data to the user, like the temperature inside a building. Most ImageViews are used as buttons for user interaction with the UI, but they're also needed to implement the Events provided by the components on the screen.

### Integrating with TotalCross

The second technology in this PoC is TotalCross. We don't want to use anything from Android on the device because:

  1. Our goal is to provide a great UI for Linux ARM.
  2. We want to achieve a low footprint on the device.
  3. We want the application to run on low-end hardware devices with low computing power (e.g., no GPU, low RAM, etc.).



To begin, we created an empty TotalCross project using our [VSCode plugin][13]. Next, we saved a copy of the images inside the **drawable** folder and a copy of the Android XML file inside the **XML** folder—both are located inside the **Resources** folder:

![Home Appliance file structure][14]

(Bruno Muniz, [CC BY-SA 4.0][9])

To run the XML file using the TotalCross Simulator, we added a new TotalCross API called KnowCode and a MainWindow to load the XML. The code below uses the API to load and render the XML:


```
public void initUI() {
    XmlScreenAbstractLayout xmlCont = XmlScreenFactory.create(“xml / homeApplianceXML.xml”);
    swap(xmlCont);
}
```

That's it! With only two commands, we can run an Android XML file using TotalCross. Here is how the XML performs on TotalCross' simulator:

![TotalCross simulator running temperature application][15]

(Bruno Muniz, [CC BY-SA 4.0][9])

There are two things remaining to finish this PoC: adding some events to provide user interaction and running it on a Raspberry Pi.

### Adding events

The KnowCode API provides a way to get an XML element by its ID (getControlByID) and change its behavior to do things like adding events, changing visibility, and more.

For example, to enable users to change the temperature in their home or other building, we put plus and minus buttons on the bottom of the UI and a "click" event that increases or decreases the temperature one degree every time the buttons are clicked:


```
[Button][16] plus = ([Button][16]) xmlCont.getControlByID("@+id/plus");
[Label][17] insideTempLabel = ([Label][17]) xmlCont.getControlByID("@+id/insideTempLabel");
plus.addPressListener(new PressListener() {
    @Override
    public void controlPressed(ControlEvent e) {
        try {
            [String][18] tempString = insideTempLabel.getText();
            int temp;
            temp = Convert.toInt(tempString);
            insideTempLabel.setText(Convert.toString(++temp));
        } catch (InvalidNumberException e1) {
            e1.printStackTrace();
        }
    }
});
```

### Testing on a Raspberry Pi 4

Finally, the last step! We ran the application on a device and checked the results. We just needed to package the application and deploy and run it on the target device. A [VNC][19] can also be used to check the application on the device.

The entire application, including assets (images, etc.), Android XML, TotalCross, and the KnowCode API, is about 8MB on Linux ARM.

Here's a demo of the application:

![Application demo][20]

(Bruno Muniz, [CC BY-SA 4.0][9])

In this example, the application was packaged only for Linux ARM, but the same app will run as a Linux desktop app, Android devices, Windows, Windows CE, and even iOS.

All of the sample source code and the project are available in the [HomeApplianceXML GitHub][21] repository.

### New possibilities with existing tools

Creating GUIs for embedded applications doesn't need to be as hard as it is today. This proof of concept brings a new perspective on how to do this task easily—not only for embedded systems but for all major operating systems, all using the same code base.

We are not aiming to create a new tool for designers or developers to build UI applications; our goal is to provide new possibilities for using the best tools that are already available.

What's your opinion of this new way to build apps? Share your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/linux-arm-ui

作者：[Bruno Muniz][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brunoamuniz
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://totalcross.com/
[3]: https://yourapp.totalcross.com/knowcode-app
[4]: https://github.com/TotalCross/KnowCodeXML
[5]: https://www.raspberrypi.org/
[6]: https://developer.android.com/studio
[7]: https://vscodium.com/
[8]: https://opensource.com/sites/default/files/uploads/homeapplianceapp.png (Home appliance application to control thermostat)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://codelabs.developers.google.com/codelabs/constraint-layout/index.html#0
[11]: https://developer.android.com/reference/android/widget/ImageView
[12]: https://developer.android.com/reference/android/widget/TextView
[13]: https://medium.com/totalcross-community/totalcross-plugin-for-vscode-4f45da146a0a
[14]: https://opensource.com/sites/default/files/uploads/homeappliancexml.png (Home Appliance file structure)
[15]: https://opensource.com/sites/default/files/uploads/totalcross-simulator_0.png (TotalCross simulator running temperature application)
[16]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+button
[17]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+label
[18]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[19]: https://tigervnc.org/
[20]: https://opensource.com/sites/default/files/uploads/application.gif (Application demo)
[21]: https://github.com/TotalCross/HomeApplianceXML
