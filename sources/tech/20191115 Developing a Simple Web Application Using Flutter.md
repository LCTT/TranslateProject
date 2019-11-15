[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Developing a Simple Web Application Using Flutter)
[#]: via: (https://opensourceforu.com/2019/11/developing-a-simple-web-application-using/)
[#]: author: (Jis Joe Mathew https://opensourceforu.com/author/jis-joe/)

Developing a Simple Web Application Using Flutter
======

[![][1]][2]

_This article guides readers on how to run and deploy their first Web application using Flutter._

Flutter has moved to a new stage, the Web, after having travelled a long way in Android and iOS development. Flutter 1.5 has been released by Google, along with support for Web application development.

**Configuring Flutter for the Web**
In order to use the Web package, enter the _flutter upgrade_ command to update to Flutter version 1.5.4.

  * Open a terminal
  * Type flutter upgrade
  * Check the version by typing _flutter –version_



![Figure 1: Upgrading Flutter to the latest version][3]

![Figure 2: Starting a new Flutter Web project in VSC][4]

One can also use Android Studio 3.0 or later versions for Flutter Web development, but we will use Visual Studio Code for this tutorial.

**Creating a new project with Flutter Web**
Open Visual Studio Code and press _Shift+Ctrl+P_ to start a new project. Type flutter and select _New Web Project_.
Now, name the project. I have named it _open_source_for_you_.
Open the terminal window in VSC, and type in the following commands:

```
flutter packages pub global activate webdev

flutter packages upgrade
```

Now use the following command to run the website, on localhost, with the IP address 127.0.0.1

```
flutter packages pub global run webdev serve
```

Open any browser and type, _<http://127.0.0.1:8080/>_
There is a Web folder inside the project directory which contains an _index.html_ file. The _dart_ file is compiled into a JavaScript file and is included in the HTML file using the following code:

```
<script defer src="main.dart.js" type="application/javascript"></script>
```

**Coding and making changes to the demo page**
Let’s create a simple application, which will print ‘Welcome to OSFY’ on the Web page.
Let’s now open the Dart file, which is located in the _lib_ folder _main.dart_ (the default name) (see Figure 5).
We can now remove the debug tag using the property of _MaterialApp_, as follows:

```
debugShowCheckedModeBanner: false
```

![Figure 3: Naming the project][5]

![Figure 4: The Flutter demo application running on port 8080][6]

![Figure 5: Location of main.dart file][7]

Now, adding more into the Dart file is very similar to writing code in Flutter in Dart. For that, we can declare a class titled _MyClass_, which extends the _StatelessWidget_.
We use a _Center_ widget to position elements to the centre. We can also add a _Padding_ widget to add padding. Use the following code to obtain the output shown in Figure 5. Use the Refresh button to view the changes.

```
class MyClass extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Padding(
padding: EdgeInsets.all(20.0),
child: Text(
'Welcome to OSFY',
style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
),
),
],
),
),
);
}
}
```

![Figure 6: Output of MyClass][8]

![Figure 7: Final output][9]

Let’s add an image from the Internet – I’ve chosen the ‘Open Source for You’ logo from the magazine’s website. We use _Image.network_.

```
Image.network(
'https://opensourceforu.com/wp-content/uploads/2014/03/OSFY-Logo.jpg',
height: 100,
width: 150
),
```

The final output is shown in Figure 7.

![Avatar][10]

[Jis Joe Mathew][11]

The author is assistant professor of computer science and engineering at Amal Jyoti College, Kanirapally, Kerala. He can be contacted at [jisjoemathew@gmail.com][12].

[![][13]][14]

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/11/developing-a-simple-web-application-using/

作者：[Jis Joe Mathew][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/jis-joe/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Screenshot-from-2019-11-15-16-20-30.png?resize=696%2C495&ssl=1 (Screenshot from 2019-11-15 16-20-30)
[2]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Screenshot-from-2019-11-15-16-20-30.png?fit=900%2C640&ssl=1
[3]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-1-Upgrading-Flutter-to-the-latest-version.jpg?resize=350%2C230&ssl=1
[4]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-2-Starting-a-new-Flutter-Web-project-in-VSC.jpg?resize=350%2C93&ssl=1
[5]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-3-Naming-the-project.jpg?resize=350%2C147&ssl=1
[6]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-4-The-Flutter-demo-application-running-on-port-8080.jpg?resize=350%2C111&ssl=1
[7]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-5-Location-of-main.dart-file.jpg?resize=350%2C173&ssl=1
[8]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-6-Output-of-MyClass.jpg?resize=350%2C173&ssl=1
[9]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-7-Final-output.jpg?resize=350%2C167&ssl=1
[10]: https://secure.gravatar.com/avatar/64db0e07799ae14fd1b51d0633db6593?s=100&r=g
[11]: https://opensourceforu.com/author/jis-joe/
[12]: mailto:jisjoemathew@gmail.com
[13]: https://opensourceforu.com/wp-content/uploads/2019/11/assoc.png
[14]: https://feedburner.google.com/fb/a/mailverify?uri=LinuxForYou&loc=en_US
