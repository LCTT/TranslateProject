translating wi-cuckoo LLAP
Install And Use ‘Go For It!’ To Do App In Linux
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Go_For_It_TODO_Linux.jpeg)

How do you manage tasks and remember things in desktop Linux? I preferred [using sticky notes in Ubuntu][1] for a long time. But the problem I faced was syncing it with other devices, especially with my smartphone. This is the reason why went on with [Google Keep][2].

Now, Google Keep is feature rich app and I really like it, and like it to the extent of calling it [Linux alternative of Evernote][3]. But not everyone may like a feature rich todo list app. Minmalist is the current trend and liked by many. And if you are one of the minimalist lover, who is looking for an open source to do list app, you should give [Go For It!][4] a try.

### Go For It! productivity desktop app for Linux ###

Go For It! is a simple to do list app that comes with a timer to keep you focused on the work. So, you add a task to the list and can attach a timer to it. It will keep remind you to work on the task. You can watch the video by its developer, [Manuel Kehl][5]:

注释：youtube视频，发布的时候可做成一个链接
<iframe width="640" height="390" frameborder="0" allowfullscreen="true" src="http://www.youtube.com/embed/mnw556C9FZQ?version=3&amp;rel=1&amp;fs=1&amp;showsearch=0&amp;showinfo=1&amp;iv_load_policy=1&amp;wmode=transparent" type="text/html" class="youtube-player"></iframe>

### Install Go For It! ###

To install Go For It! in Ubuntu 15.04, 14.10, 14.04 and other Ubuntu based Linux distributions such as Linux Mint, elementary OS Freya etc, use the official PPA of this app:

    sudo add-apt-repository ppa:mank319/go-for-it
    sudo apt-get update
    sudo apt-get install go-for-it

You can download the .deb binaries, binaries for Windows and source code from the respective links below:

- [Download source code][6]
- [Download .deb binaries][7]
- [Download for Windows][8]

### Using Go For It! in desktop Linux ###

Using Go For It! is really simple. You add tasks in the list. The tasks are saved in todo.txt file.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Go-for-it_todo_app_linux.png)

By default a timer of 25 minutes will be set on each task.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Go-for-it_todo_app_linux_1.png)

Once done, task is automatically archived to done.txt. Based on preferences, it will send desktop notifications at regular time interval and few minutes before the task is supposed to be over:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Go_for_it_Linux_notification.png)

You can change all these preferences from configuration.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Go-for-it_todo_app_linux_2.png)

So far so good. But what about using it on a smartphone. A productivity app is not complete if you cannot keep it synced across various devices. Good thing is that Go For It! is based on [todo.txt][9], which means you can use it in smartphones using third party apps and a cloud service like Dropbox.

### Using Go For It! in Android smartphones and tablets ###

You need to do couple of things here. First thing first, install Dropbox in Linux as well as in your Android phone, if you haven’t installed it already. The next thing you need to do is to change the configuration of Go For It! and **change the todo.txt directory to Dropbox location**.

Next, you will have to download [Simpletask Android app][10]. It’s a free app. Install this app. When you run Simpletask for the first time, you will ask to link your account with Dropbox:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Go_for_it_Android_1.jpeg)

Once you have linked Simpletask with Dropbox, open the app. If you have change the configuration of Go For It! to save the files in Dropbox, you should be able to see it in Simpletask. If you do not see it, click on the settings from the bottom and use the option of Open Todo file:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Go_for_it_Android.jpeg)

Now you should be able to see your tasks synced with Simpletask.

### Conclusion ###

With Simpletask, you can use it in similar fashion as a [markup language tool][11]. For minimal and focused usage Go For It! is a nice to do app. A clean interface is another plus point. It could have been better to have its own smartphone app but we already saw the workarounds.

On the down side, Go For It! doesn’t run in background. Which means, you’ll have to keep it running always. It doesn’t even has a minimize button, a tiny annoyance. What I would like to see is an indicator applet for it. Running in the background and quick access in the panel will definitely improve its usability.

Do try Go For It! and share your experience with it. What other to-do app do you use on desktop Linux? How does Go For It! compare with your other favorite productivity app?

--------------------------------------------------------------------------------

via: http://itsfoss.com/go-for-it-to-do-app-in-linux/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/indicator-stickynotes-windows-like-sticky-note-app-for-ubuntu/
[2]:http://itsfoss.com/install-google-keep-ubuntu-1310/
[3]:http://itsfoss.com/5-evernote-alternatives-linux/
[4]:http://manuel-kehl.de/projects/go-for-it/
[5]:http://manuel-kehl.de/about-me/
[6]:https://github.com/mank319/Go-For-It
[7]:https://launchpad.net/~mank319/+archive/ubuntu/go-for-it
[8]:http://manuel-kehl.de/projects/go-for-it/download-windows-version/
[9]:http://todotxt.com/
[10]:https://play.google.com/store/apps/details?id=nl.mpcjanssen.todotxtholo&hl=en
[11]:http://itsfoss.com/install-latex-ubuntu-1404/
