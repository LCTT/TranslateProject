12 Practices every Android Development Beginner should know — Part 1
============================================================

### One practice at a time to become a better Android beginner



![](https://cdn-images-1.medium.com/max/800/1*RwCbsNdykQYr6vDa6aCGKQ.jpeg)

It’s been more than 12 years since Andy Rubin and team started working on the idea of a mobile operating system that would change the way mobile phones, rather smartphones were seen by consumers as well as the people who developed software for it. Smartphones back then were limited to texting and checking emails (and of course, making phone calls), giving users and developers a boundary to work within.

Android, the breaker of chains, with its excellent framework design gave both the parties the freedom to explore more than just a limited set of functionalities. One would argue that the iPhone brought the revolution in the mobile industry, but the thing is no matter how cool (and pricey, eh?) an iPhone is, it again brings that boundary, that limitation we never wanted.

However, as Uncle Ben said — with great power comes great responsibility — we also need to be extra careful with our Android application design approach. I have often seen, in many courses offered, the negligence to teach beginners that value, the value to understand the architecture well enough before starting. We just throw things at people without correctly explaining what the upsides and downsides are, how they impact design or what to use, what not to.

In this post, we will see some of the practices that a beginner or an intermediate (if missed any) level developer should know in order to get better out of the Android framework. This post will be followed by more in this series of posts where we will talk about more such useful practices. Let’s begin.

* * *

### 1\. Difference between @+id and @id

In order to access a widget (or component) in Java or to make others dependent on it, we need a unique value to represent it. That unique value is provided by android:id attribute which essentially adds id provided as a suffix to @+id/ to the  _id resource file_  for others to query. An id for Toolbar can be defined like this,

```
android:id=”@+id/toolbar
```

The following id can now be tracked by  _findViewById(…)_  which looks for it in the res file for id, or simply R.id directory and returns the type of View in question.

The other one, @id, behaves the same as findViewById(…) — looks for the component by the id provided but is reserved for layouts only. The most general use of it is to place a component relative to the component it returns.

```
android:layout_below=”@id/toolbar”
```

### 2\. Using @string res for providing Strings in XML

In simpler words, don’t use hard coded strings in XML. The reason behind it is fairly simple. When we use hard coded string in XML, we often use the same word over and over again. Just imagine the nightmare of changing the same word at multiple places which could have been just one had it been a string resource. The other benefit it provides is multi-language support as different string resource files can be created for different languages.

```
android:text=”My Awesome Application”
```

When using hard coded strings, you will often see a warning over the use of such strings in Android Studio, offering to change that hard coded string into a string resource. Try clicking on them and then hitting ALT + ENTER to get the resource extractor. You can also go to strings.xml located in values folder under res and declare a string resource like this,

```
<string name=”app_name”>My Awesome Application</string>
```

and then use it in place of the hard coded string,

```
android:text=”@string/app_name”
```

### 3\. Using @android and ?attr constants

This is a fairly effective practice to use predefined constants instead of declaring new ones. Take an example of #ffffff or white color which is used several times in a layout. Now instead of writing #ffffff every single time, or declaring a color resource for white, we could directly use this,

```
@android:color/white
```

Android has several color constants declared mainly for general colors like white, black or pink. It’s best use case is setting transparent color with,

```
@android:color/transparent
```

Another constant holder is ?attr which is used for setting predefined attribute values to different attributes. Just take an example of a custom Toolbar. This Toolbar needs a defined width and height. The width can be normally set to MATCH_PARENT, but what about height? Most of us aren’t aware of the guidelines, and we simply set the desired height that seems fitting. That’s wrong practice. Instead of setting our own height, we should rather be using,

```
android:layout_height=”?attr/actionBarSize”
```

Another use of ?attr is to draw ripples on views when clicked. SelectableItemBackground is a predefined drawable that can be set as background to any view which needs ripple effect,

```
android:background=”?attr/selectableItemBackground”
```

or we can use

```
android:background=”?attr/selectableItemBackgroundBorderless”
```

to enable borderless ripple.

### 4\. Difference between SP and DP

While there’s no real difference between these two, it’s important to know what these two are, and where to use them to best results.

SP or Scale-independent pixels are recommended for use with TextViews which require the font size to not change with display (density). Instead, the content of a TextView needs to scale as per the needs of a user, or simply the font size preferred by the user.

With anything else that needs dimension or position, DP or Density-independent pixels can be used. As mentioned earlier, DP and SP are same things, it’s just that DP scales well with changing densities as the Android System dynamically calculates the pixels from it making it suitable for use on components that need to look and feel the same on different devices with different display densities.

### 5\. Use of Drawables and Mipmaps

This is the most confusing of them all — How are drawable and mipmap different?

While it may seem that both serve the same purpose, they are inherentaly different. Mipmaps are meant to be used for storing icons, where as drawables are for any other format. Let’s see how they are used by the system internally and why not to use one in place of the other.

You’ll notice that your application has several mipmap and drawable folders, each representing a different display resolution. When it comes to choosing from Drawable folder, the system chooses from the folder that belongs to current device density. However, with Mipmap, the system can choose an icon from any folder that fits the need mainly because some launchers display larger icons than intended, so system chooses the next size up.

In short, use mipmaps for icons or markers that see a change in resolution when used on different device densities and use drawable for other resource types that can be stripped out when required.

For example, a Nexus 5 is xxhdpi. Now when we put icons in mipmap folders, all the folders of mipmap will be retained. But when it comes to drawable, only drawable-xxhdpi will be retained, terming any other folder useless.

### 6\. Using Vector Drawables

It’s a very common practice to add multiple versions (sizes) of the same asset in order to support different screen densities. While this approach may work, it also adds certain performance overheads like larger apk size and extra development effort. To eliminate these overheads, Android team at Google announced the addition of Vector Drawables.

Vector Drawables are SVGs (scaled vector graphics) but in XML representing an image drawn using a set of dots, lines and curves with fill colors. The very fact that Vector Drawables are made of lines and dots, gives them the ability to scale at different densities without losing resolution. The other associated benefit with Vector Drawables is the ease of animation. Add multiple vector drawables in a single AnimatedVectorDrawable file and we’re good to go instead of adding multiple images and handling them separately.

```
<vector xmlns:android=”http://schemas.android.com/apk/res/android" 
 android:width=”24dp” 
 android:height=”24dp” 
 android:viewportWidth=”24.0" 
 android:viewportHeight=”24.0">
```

```
    <path android:fillColor=”#69cdff” android:pathData=”M3,18h18v-2L3,16v2zM3,13h18v-2L3,11v2zM3,6v2h18L21,6L3,6z”/>
```

```
</vector>
```

The above vector definition will result in the following drawable,

![](https://cdn-images-1.medium.com/max/600/1*KGmMIhrQR0UyrpIP_niEZw.png)

To Add a vector drawable to your android project, right click on app module of your project, then New >> Vector Assets.This will get you Asset Studio which gives you two options to configure vector drawable. First, picking from Material Icons and second, choosing a local SVG or PSD file.

Google recommends using Material Icons for anything app related to maintain continuity and feel of Android. Be sure to check out all of the icons [here][1].

### 7\. Setting End/Start Margin

This is one of the easiest things people miss out on. Margin! Sure adding margin is easy but what about supporting older platforms?

Start and End are supersets of Left and Right respectively, so if the application has minSdkVersion 17 or less, start or end margin/padding is required with older left/right. On platforms where start and end are missing, these two can be safely ignored for left/right. Sample declaration looks like this,

```
android:layout_marginEnd=”20dp”
android:paddingStart=”20dp”
```

### 8\. Using Getter/Setter Generator

One of the most frustrating things to do while creating a holder class (which simply holds variable data) is creating multiple getters and setters — Copy/paste method body and rename them for each variable.

Luckily, Android Studio has a solution for it. It goes like this — declare all the variables you need inside the class, and go to Toolbar >> Code. The Shortcut for it is ALT + Insert. Clicking Code will get you Generate, tap on it and among many other options, there will be Getter and Setter option. Tapping on it while maintaining focus on your class page will add all the getters and setters to the class (handle the previous window on your own). Neat, isn’t it?

### 9\. Using Override/Implement Generator

Another helpful generator. Writing custom classes and extending them is easy but what about classes you have little idea about. Take PagerAdapter for example. You want a ViewPager to show a few pages and for that, you will need a custom PagerAdapter that will work as you define inside its overridden methods. But where are those methods? Android Studio may be gracious enough to force you to add a constructor to your custom class or even to give a short cut for (that’s you ALT + Enter), but the rest of the (abstract) methods from parent PagerAdapter need to be added manually which I am sure is tiring for most of us.

To get a list of all the overridden methods available, go to Code >> Generate and Override method or Implement methods, which ever is your need. You can even choose to add multiple methods to your class, just hold Ctrl and select methods and hit OK.

### 10\. Understanding Contexts Properly

Context is scary and I believe a lot of beginners never care to understand the architecture of Context class — what it is, and why is it needed everywhere.

In simpler terms, it is the one that binds all that you see on the screen together. All the views (or their extensions) are tied to the current environment using Context. Context is responsible for allowing access to application level resources such as density or current activity associated with it. Activities, Services, and Application all implement Context interface to provide other to-be-associated components in-house resources. Take an example of a TextView which has to be added to MainActivity. You would notice while creating an object that the TextView constructor needs Context. This is to resolve any resources needed within TextView definition. Say TextView needs to internally load the Roboto font. For doing this, TextView needs Context. Also when we are providing context (or this) to TextView, we’re telling it to bind with the current activity’s lifecycle.

Another key use of Context is to initiate application level operations such as initiating a library. A library lives through out the application lifecycle and thus it needs to be initiated with getApplicationContext() instead of  _getContext_  or  _this_ or  _getActivity()_ . It’s important to know the correct use of different Context types to avoid a memory leak. Other uses of Context includes starting an Activity or Service. Remember startActivity(…)? When you need to change Activity from a non-activity class, you will need a context object to access startActivity method since it belongs to the Context class, not Activity class.

```
getContext().startActivity(getContext(), SecondActivity.class);
```

If you want to know more about the behavior of Context, go [here][2] or [here][3]. The first one is a nice article on Contexts and where to use them while the latter is Android documentation for Context which has elaborately explained all of its available features — methods, static flags and more.

### Bonus #1: Formatting Code

Who doesn’t like clean, properly formatted code? Well, almost every one of us working on classes that tend to go up to 1000 lines in size want our code to stay structured. And it’s not that only larger classes need formatting, even smaller modular classes need to make sure code remains readable.

With Android Studio, or any of the JetBrains IDEs you don’t even need to care about manually structuring your code like adding indentation or space before =. Write code the way you want and when you feel like formatting it, just hit ALT + CTRL + L on Windows or ALT + CTRL + SHIFT + L on Linux. *Code Auto-Formatted*

### Bonus #2: Using Libraries

One of the key principles of Object Oriented Programming is to increase reuse of code or rather decrease the habit of reinventing the wheel. It’s a very common approach that a lot of beginners follow wrongly. The approach has two ends,

- Don’t use libraries, write every code on your own.

- Use a library for everything.

Going completely to either of the ends is wrong practice. If you go to the first end, you’re going to eat up a lot of resources just to live up to your pride to own everything. Plus chances are there that your code will be less tested than that library you should have gone with, increasing the chances of a buggy module. Don’t reinvent the wheel when there is a limited resource. Go with a tested library and when you’ve got the complete idea and resources, replace the library with your own reliable code.

With the second end, there is an even bigger issue — reliance on foreign code. Don’t get used to the idea of relying on others code for everything. Write your own code for things that need lesser resources or things that are within your reach. You don’t need a library that sets up custom TypeFaces (fonts) for you, that you can do on your own.

So remember, stay in the middle of the two ends — don’t reinvent everything but also don’t over-rely on foreign code. Stay neutral and code to your abilities.

* * *

This article was first published on [What’s That Lambda][4]. Be sure to visit for more articles like this one on Android, Node.js, Angular.js and more.

--------------------------------------------------------------------------------

via: https://android.jlelse.eu/12-practices-every-android-beginner-should-know-cd43c3710027

作者：[ Nilesh Singh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://android.jlelse.eu/@nileshsingh?source=post_header_lockup
[1]:https://material.io/icons/
[2]:https://blog.mindorks.com/understanding-context-in-android-application-330913e32514
[3]:https://developer.android.com/reference/android/content/Context.html
[4]:https://www.whatsthatlambda.com/android/android-dev-101-things-every-beginner-must-know
