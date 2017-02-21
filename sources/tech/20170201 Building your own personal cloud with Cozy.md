Building your own personal cloud with Cozy
============================================================

 ![Building your own personal cloud with Cozy](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/life_tree_clouds.png?itok=dSV0oTDS "Building your own personal cloud with Cozy") 
>Image by : [Pixabay][2]. Modified by Opensource.com. [CC BY-SA 4.0][3]

Most everyone I know uses some sort of web-based application for their calendar, emails, file storage, and much more. But what if, like me, you've got concerns about privacy, or just want to simplify your digital life into a place you control? [Cozy][4] is a project that is moving in the right direction—toward a robust self-hosted cloud platform. Cozy's source code is available on [GitHub][5], and it is licensed under the AGPL 3.0 license.

### Installation

Installing Cozy is snap-easy, with [easy-to-follow instructions][6] for a variety of platforms. For my testing, I'm using Debian 8, 64-bit. The installation takes a few minutes, but then you just go to the server's IP, register an account, and a default set of applications is loaded up and ready to roll.

One note on this—the installation assumes no other web server is running, and it will want to install [Nginx web server][7]. If your server already has websites running, configuration may be a bit more challenging. My install was on a brand new Virtual Private Server (VPS), so this was a snap. Run the installer, start Nginx, and you're ready to hit the cloud.

Cozy has [an App Store][8] where you can download additional applications. Some look pretty interesting, like the [Ghost blogging platform][9] and [TiddlyWiki][10] open source wiki. The intent here, clearly, is to allow integration in the platform with lots of other goodies. I think it's just a matter of time before you'll see this start to take off, with many other popular open source applications offering integration abilities. Right now, [Node.js][11] applications are supported, but if other application layers were possible, you'd see that many other good things could happen.

One capability that is possible is using the free Android application to access your information from Android devices. No iOS app exists, but there is a plan to solve that problem.

Currently, Cozy comes with a nice set of core applications.

 ![Main Cozy Interface](https://opensource.com/sites/default/files/main_cozy_interface.jpg "Main Cozy Interface") 

Main Cozy interface

### Files

Like a lot of folks, I use [Dropbox][12] for file storage. In fact, I pay for Dropbox Pro because I use _so much_ storage. For me, then, moving my files to Cozy would be a money-saver—if it has the features I want.

I wish I could say it does, truly I do. I was very impressed with the web-based file upload and file-management tool built into the Cozy web application. Drag-and-drop works like you'd expect, and the interface is clean and uncluttered. I had no trouble at all uploading some sample files and folders, navigating around, and moving, deleting, and renaming files.

If what you want is a web-based cloud file storage, you're set. What's missing, for me, is the selective synchronization of files and folders, which Dropbox has. With Dropbox, if you drop a file in a folder, it's copied out to the cloud and made available to all your synced devices in a matter of minutes. To be fair, [Cozy is working on it][13], but it's in beta and only for Linux clients at the moment. Also, I have a [Chrome][14] extension called [Download to Dropbox][15] that I use to capture images and other content from time to time, and no such tool exists yet for Cozy.

 ![File Manager Interface](https://opensource.com/sites/default/files/cozy_2.jpg "File Manager Interface") 

File Manager interface

### Importing data from Google

If you currently use Google Calendar or Contacts, importing these is very easy with the app installed in Cozy. When you authorize access to Google, you're given an API key, which you paste in Cozy, and it performs the copy quickly and efficiently. In both cases, the contents were tagged as having been imported from Google. Given the clutter in my contacts, this is probably a good thing, as it gives you the opportunity to tidy up as you relabel them into more meaningful categories. Calendar events imported all on the "Google Calendar," but I noticed that _some_ of my events had the times incorrect, possibly an artifact of time zone settings on one end or the other.

### Contacts  

Contacts works like you'd expect, and the interface looks a _lot_ like Google Contacts. There are a few sticky areas, though. Synchronization with (for instance) your smart phone happens via [CardDAV][16], a standard protocol for sharing contacts data—and a technology that Android phones _do not speak natively_. To sync your contacts to an Android device, you're going to have to load an app on your phone for that. For me, that's a _huge_ strike against it, as I have enough odd apps like that already (work mail versus Gmail versus other mail, oh my!), and I do not want to install another that won't sync up with my smartphone's native contacts application. If you're using an iPhone, you can do CardDAV right out of the box.

### Calendar  

The good news for Calendar users is that an Android device _can_ speak [CalDAV][17], the interchange format for this type of data. As I noted with the import app, some of my calendar items came over with the wrong times. I've seen this before with other calendar system moves, so that really didn't bother me much. The interface lets you create and manage multiple calendars, just like with Google, but you can't subscribe to other calendars outside of this Cozy instance. One other quirk is of the app is starting of the week on Monday, which you can't change. Normally, I start my week on Sunday, so changing from Monday would be a useful feature for me. The Settings dialog didn't actually have any settings; it merely gave instructions on how to connect via CalDAV. Again, this application is close to what I need, but Cozy is not quite there.

### Photos

The Photos app is pretty impressive, borrowing a lot from the Files application. You can even add photos to an album that are in files in the other app, or upload directly with drag and drop. Unfortunately, I don't see any way to reorder or edit pictures once you've uploaded them. You can only delete them from the album. The app does have a tool for sharing via a token link, and you can specify one or more contact. The system will send those contacts an email inviting them to view the album. There are more feature-rich album applications than this, to be sure, but this is a good start for the Cozy platform.

 ![Photos Interface](https://opensource.com/sites/default/files/cozy_3_0.jpg "Photos Interface") 

Photos interface

### Final thoughts

Cozy has some really big goals. They're trying to build a platform where you can deploy _any_ cloud-based service you like. Is it ready for prime time? Not quite. Some of the shortcomings I've mentioned are problematic for power users, and there is no iOS application yet, which may hamper adoption for those users. However, keep an eye on this one—Cozy has the potential, as development continues, to become a one-stop replacement for a great many applications.

--------------------------------------------------------------------------------

译者简介：

D Ruth Bavousett - D Ruth Bavousett has been a system administrator and software developer for a long, long time, getting her professional start on a VAX 11/780, way back when. She spent a lot of her career (so far) serving the technology needs of libraries, and has been a contributor since 2008 to the Koha open source library automation suite.Ruth is currently a Perl Developer at cPanel in Houston, and also serves as chief of staff for two cats.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/2/cozy-personal-cloud

作者：[D Ruth Bavousett][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/druthb
[1]:https://opensource.com/article/17/2/cozy-personal-cloud?rate=FEMc3av4LgYK-jeEscdiqPhSgHZkYNsNCINhOoVR9N8
[2]:https://pixabay.com/en/tree-field-cornfield-nature-247122/
[3]:https://creativecommons.org/licenses/by-sa/4.0/
[4]:https://cozy.io/
[5]:https://github.com/cozy/cozy
[6]:https://docs.cozy.io/en/host/install/
[7]:https://www.nginx.com/
[8]:https://cozy.io/en/apps/
[9]:https://ghost.org/
[10]:http://tiddlywiki.com/
[11]:http://nodejs.org/
[12]:https://www.dropbox.com/
[13]:https://github.com/cozy-labs/cozy-desktop
[14]:https://www.google.com/chrome/
[15]:https://github.com/pwnall/dropship-chrome
[16]:https://en.wikipedia.org/wiki/CardDAV
[17]:https://en.wikipedia.org/wiki/CalDAV
[18]:https://opensource.com/user/36051/feed
[19]:https://opensource.com/article/17/2/cozy-personal-cloud#comments
[20]:https://opensource.com/users/druthb
