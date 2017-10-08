What all you need to know about HTML5
============================================================


  _![](https://i0.wp.com/opensourceforu.com/wp-content/uploads/2017/05/handwritten-html5-peter-booth-e-plus-getty-images-56a6faec5f9b58b7d0e5d1cf.jpg?resize=700%2C467)_  

 _HTML5, the fifth and current version of the HTML standard, is a markup language used to structure and present content on the World Wide Web. This article will help readers get acquainted with it._ 

HTML5 has evolved through the cooperation between the W3C and the Web Hypertext Application Technology Working Group. It is a higher version of HTML, and its many new elements make your pages more semantic and dynamic. It was developed to provide a greater Web experience for everyone. HTML5 offers great features that make the Web more dynamic and interactive.

The new features of HTML5 are:

*   New sets of tags such as <header> and <section>

*   <canvas> element for 2D drawing

*   Local storage

*   New form controls like calendar, date and time

*   New media functionality

*   Geo-location

HTML5 is not an official standard as yet; hence, not all browsers support it or some of its features. One of the most important reasons behind developing HTML5 was to prevent users from having to download and install multiple plugins like Silverlight and Flash.

**New tags and elements**

**Semantic elements:** Figure 1 displays a few useful semantic elements.
**Form elements:** The form elements present in HTML5 are shown in Figure 2.
**Graphic elements:** The graphic elements in HTML5 can be seen in Figure 3.
**Media elements:** The new media elements in HTML5 are listed in Figure 4.

 [![](https://i0.wp.com/opensourceforu.com/wp-content/uploads/2017/05/Figure-1-7.jpg?resize=350%2C277)][3] 

Figure 1: Semantic elements

 [![](https://i1.wp.com/opensourceforu.com/wp-content/uploads/2017/05/Figure-2-5.jpg?resize=350%2C108)][4] 

Figure 2: Form elements

**Advanced features of HTML5**

**Geo-location**

It is an HTML5 API that is used to get the geographical location of a website’s user, who has to first permit the site to fetch his or her location. This usually happens via a button and/or browser popup. All the latest versions of Chrome, Firefox, IE, Safari and Opera can use the geo-location feature of HTML5.

Some uses of geo-location are:

*   Public transportation websites

*   Taxi and other transportation websites

*   To calculate shipping costs on an e-commerce site

*   Travel agency websites

*   Real estate websites

*   Movie theatre websites can find movies playing nearby

*   Online gaming

*   For sites to feature local headlines and weather on their front page

*   Job postings can automatically include commute times

**How it works:** Geo-location works by scanning common sources of location information, which include the following:

*   Global Positioning System (GPS), which is the most accurate

*   Network signals—IP address, RFID, Wi-Fi and Bluetooth MAC addresses

*   GSM/CDMA cell IDs

*   User inputs

The API offers a very handy function to detect geo-location support in browsers:

| `if` `(navigator.geolocation) {``//` `do` `stuff``}` |

The  _getCurrentPosition_  API is the main method for using geo-location. It retrieves the current geographic location of the user’s device. The location is described as a set of geographic coordinates along with the heading and speed. The location information is returned as a position object.

The syntax is:

`getCurrentPosition(showLocation, ErrorHandler, options);` 

*   _showLocation:_  This defines the callback method that retrieves location information.

*   _ErrorHandler(Optional):_  This defines the callback method that is invoked when an error occurs in processing the asynchronous call.

*   _options (Optional):_  This defines a set of options for retrieving the location information.

 [![](https://i0.wp.com/opensourceforu.com/wp-content/uploads/2017/05/Figure-3-2.jpg?resize=350%2C72)][5] 

Figure 3: Graphic elements

 [![](https://i0.wp.com/opensourceforu.com/wp-content/uploads/2017/05/Figure-4-2.jpg?resize=350%2C144)][6] 

Figure 4: Media elements

Figure 5 incorporates the set of properties returned by a position object.

We can present location information to the user in two ways—geodetic and civil:

1\. The geodetic way of describing a position refers directly to the latitude and longitude.
2\. The civic representation of location data is readable and easily understood by humans.

As shown in Table 1, each attribute/parameter has both a geodetic representation and a civic representation.

 [![](https://i0.wp.com/opensourceforu.com/wp-content/uploads/2017/05/table-1.jpg?resize=350%2C132)][7] 

**Web storage**

In HTML, to store user data on a local machine, we were using JavaScript cookies. To avoid that, HTML5 has introduced Web storage, with which websites themselves store user data on a local machine.

The advantages of Web storage, as compared to cookies, are:

*   More secure

*   Faster

*   Stores a larger amount of data

*   The stored data is not sent with every server request. It is only included when asked for. This is a big advantage of HTML5 Web storage over cookies.

There are two types of Web storage objects:

1) Local – this stores data with no expiration date.
2) Session – this stores data for one session only.

**How it works:** The  _localStorage_  and  _sessionStorage_  objects create a  _key = value pair._ 

An example is: _ key=“Name”,_   _value=“Palak”_ 

These are stored as strings but can be converted, if required, by using JavaScript functions like  _parseInt()_  and  _parseFloat()_ .

Given below is the syntax for using Web storage objects:

 `Storing a Value:``• localStorage.setItem(“key1”, “value1”);``• localStorage[“key1”] = “value1”;``Getting a Value:``• alert(localStorage.getItem(“key1”));``• alert(localStorage[“key1”]);``Remove a Value:``• removeItem(“key1”);``Remove All Values:``• localStorage.``clear``();` 

 [![](https://i0.wp.com/opensourceforu.com/wp-content/uploads/2017/05/Figure5-1.jpg?resize=350%2C202)][8] 

Figure 5: Position object properties

**Application Cache (AppCache)**

Using HTML5 Apache, we can make a Web application work offline without an Internet connection. All browsers, besides IE, can use  _AppCache_  (at this point in time).

The advantages of Application Cache are:

*   Enables browsing Web pages offline

*   Pages load faster

*   Results in less load for servers

The  _cache manifest_  file is a simple text file that lists the resources the browser should cache for offline access. The  _manifest_  attribute can be included on the document’s HTML tag, as follows:

`<html manifest=”``test``.appcache”>``...``<``/html``>` 

It should be on all the pages that you want to cache.

The application pages that are cached will remain unless:

1\. The user clears them out.
2\. The manifest has been modified.
3\. The cache is updated.

**Video**

Until HTML5 was launched, there was no uniform standard for showing video on Web pages. Most of the videos were shown through different plugins like Flash. But HTML5 specifies a standard way to show the video on a Web page by using a video element.

Currently, it supports three video formats for the video element, as shown in Table 2.

 [![](https://i0.wp.com/opensourceforu.com/wp-content/uploads/2017/05/table-2.jpg?resize=350%2C115)][9] 
The example given below shows the use of this video element:
 `<! DOCTYPE HTML>``<html>``<body>``<video src=” vdeo.ogg” width=”320” height=”240” controls=”controls”>``This browser does not support the video element.``<``/video``>``<``/body``>``<``/html``>` 

This example uses an Ogg file, and will work in Firefox, Opera and Chrome. To make the video work in Safari and future versions of Chrome, we must add an MPEG4 and WebM file.

The video element allows multiple source elements. Source elements can link to different video files. The browser will use the first recognised format, as follows:

`<video width=”320” height=”240” controls=”controls”>``<``source` `src=”vdeo.ogg” ``type``=”video``/ogg``” />``<``source` `src=” vdeo.mp4” ``type``=”video``/mp4``” />``<``source` `src=” vdeo.webm” ``type``=”video``/webm``” />``This browser does not support the video element.``<``/video``>` 

 [![](https://i0.wp.com/opensourceforu.com/wp-content/uploads/2017/05/Figure6-1.jpg?resize=350%2C253)][10] 

Figure 6: Output of Canvas

**Audio**

With audio, the case is similar to video. Until HTML5 was launched, there wasn’t any uniform standard for playing audio on Web pages. Most of the audio was also played through different plugins like Flash. But HTML5 specifies a standard way to play audio on a Web page by using an audio element. The audio element is used to play sound files and to stream audio.

Currently, HTML5 supports three audio formats for the audio element, as shown in Table 3.

 [![](https://i1.wp.com/opensourceforu.com/wp-content/uploads/2017/05/table-3.jpg?resize=350%2C123)][11] 
The use of the audio element is demonstrated below:

 `<! DOCTYPE HTML>``<html>``<body>``<audio src=” song.ogg” controls=”controls”>``This browser does not support the audio element.``<``/video``>``<``/body``>``<``/html``>` 

This example uses an Ogg file and will work in Firefox, Opera and Chrome. To make the audio work in Safari and future versions of Chrome, we must add an MP3 and Wav file.

The audio element allows multiple source elements, which can link to different audio files. The browser will use the first recognised format, as follows:

`<audio controls=”controls”>``<``source` `src=”song.ogg” ``type``=”audio``/ogg``” />``<``source` `src=”song.mp3” ``type``=”audio``/mpeg``” />``This browser does not support the audio element.``<``/audio``>` 

**Canvas**

To create graphics on a Web page, HTML5 uses the Canvas API. We can draw anything with it and it uses JavaScript. This can improve the performance of our website by avoiding the need to download images off the network. With Canvas, we can draw shapes and lines, arcs and text, gradients and patterns. In addition, Canvas gives us the power to manipulate pixels in the images and even in video. You can add the Canvas element to an HTML page as shown below:

 `<canvas ``id``=”myCanvas” width=”200” height=”100”><``/canvas``>` 

The Canvas element doesn’t have capabilities to draw elements. We can achieve this by using JavaScript. All drawings should be inside JavaScript.

 `<script ``type``=”text``/javascript``”>``var c=document.getElementById(“myCanvas”);``var cxt=c.getContext(“2d”);``cxt.fillStyle=”blue”;``cxt.storkeStyle = “red”;``cxt.fillRect(10,10,100,100);``cxt.storkeRect(10,10,100,100);``<``/script``>` 

The output of the above script is seen in Figure 6.

You can draw many objects like arcs, circles, linear/vertical gradients, etc.

**HTML5 tools**

To operate effectively, all skilled or amateur Web developers/designers should use HTML5 tools, which are a great help when one needs to set up workflows/websites or perform repetitive tasks. They improve the usability of Web designs.

Featured below are some essential tools which help in creating amazing websites.

 _**HTML5 Maker:**_  This is used to interact with content in websites with the help of HTML, JavaScript and CSS. It is very easy to use. It also allows us to develop slide shows, sliders, HTML5 animation and more.

 _**Liveweave:** _ This is used to test the code. It cuts down on the time spent on saving the code and loading it on screen. Pasting the code in the editor gives instant results. It is very easy to use and also provides the auto-complete feature for some of the code, which makes development and testing faster and easier.

 _**Font dragr:**_  This previews the custom Web fonts in a browser. It loads the font instantly, so you get to know whether it looks good or not. It also offers a drag-and-drop interface, allowing you to drop your typefaces, Web open fonts and vector graphics to test all of them immediately.

 _**HTML5 Please:**_  This allows us to find anything related to HTML5\. If you want to know how to use any feature, you can search for it on HTML Please. It provides lists of useful resources about supporting browsers and devices, syntax, general recommendations of how to use the element, etc.

 _**Modernizr:** _ This is an open source tool which is used to provide the best experience possible, given the visitor’s browser. With this tool, you can detect whether the visitor’s browser supports HTML5 features, and load the scripts accordingly.

 _**Adobe Edge Animate:**_  This is a useful tool for HTML5 developers who have to deal with interactive HTML animations. It is used in digital publishing, the Web and in the advertising fields. This tool allows users to create flawless animations, which run across multiple devices.

 _**Video.js:**_  This is a HTML5 video player based on JavaScript. If you want to add videos to your website, you should use this tool. It makes videos look good and a part of the website.

 _**The W3 Validator:**_  The W3 Validator tests the validity of the markup of websites in HTML, XHTML, SMIL, MathML, etc. To test the markup validity of any website, you have to choose the document type as HTML5 and enter your Web page’s URL. By doing this, your code will get checked, and all errors and warnings will be mentioned.

 _**HTML5 Reset:** _ This tool allows developers to rewrite the code of their old websites in HTML5.
You can use these tools to provide a great Web experience for visitors to your website.

--------------------------------------------------------------------------------

Palak Shah

The author is a senior software engineer. She loves to explore new technologies and learn innovative concepts. She is also fond of philosophy. She can be reached at palak311@gmail.com

--------------------
via: http://opensourceforu.com/2017/06/introduction-to-html5/

作者：[Palak Shah ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://opensourceforu.com/author/palak-shah/
[1]:http://opensourceforu.com/2017/06/introduction-to-html5/#disqus_thread
[2]:http://opensourceforu.com/author/palak-shah/
[3]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure-1-7.jpg
[4]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure-2-5.jpg
[5]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure-3-2.jpg
[6]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure-4-2.jpg
[7]:http://opensourceforu.com/wp-content/uploads/2017/05/table-1.jpg
[8]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure5-1.jpg
[9]:http://opensourceforu.com/wp-content/uploads/2017/05/table-2.jpg
[10]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure6-1.jpg
[11]:http://opensourceforu.com/wp-content/uploads/2017/05/table-3.jpg
