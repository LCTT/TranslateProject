Ricky-Gong 翻译中

How to Manage Your To-Do Lists in Ubuntu Using Go For It Application
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/10/gfi-featured1.jpg)

Task management is arguably one of the most important and challenging part of professional as well as personal life. Professionally, as you assume more and more responsibility, your performance is directly related to or affected with your ability to manage the tasks you’re assigned.

If your job involves working on a computer, then you’ll be happy to know that there are various applications available that claim to make task management easy for you. While most of them cater to Windows users, there are many options available on Linux, too. In this article we will discuss one such application: Go For It.

### Go For It ###

[Go For It][1] (GFI) is developed by Manuel Kehl, who describes it as a “a simple and stylish productivity app, featuring a to-do list, merged with a timer that keeps your focus on the current task.” The timer feature, specifically, is interesting, as it also makes sure that you take a break from your current task and relax for sometime before proceeding further.

### Download and Installation ###

Users of Debian-based systems, like Ubuntu, can easily install the app by running the following commands in terminal:

    sudo add-apt-repository ppa:mank319/go-for-it
    sudo apt-get update
    sudo apt-get install go-for-it

Once done, you can execute the application by running the following command:

    go-for-it

### Usage and Configuration ###

Here is how the GFI interface looks when you run the app for the very first time:

![gfi-first-run](https://www.maketecheasier.com/assets/uploads/2015/10/gfi-first-run1.png)

As you can see, the interface consists of three tabs: To-Do, Timer, and Done. While the To-Do tab contains a list of tasks (the 4 tasks shown in the image above are there by default – you can delete them by clicking on the rectangular box in front of them), the Timer tab contains task timer, while Done contains a list of tasks that you’ve finished successfully. Right at the bottom is a text box where you can enter the task text and click “+” to add it to the list above.

For example, I added a task named “MTE-research-work” to the list and selected it by clicking on it in the list – see the screenshot below:

![gfi-task-added](https://www.maketecheasier.com/assets/uploads/2015/10/gfi-task-added1.png)

Then I selected the Timer tab. Here I could see a 25-minute timer for the active task which was “MTE-reaserch-work.”

![gfi-active-task-timer](https://www.maketecheasier.com/assets/uploads/2015/10/gfi-active-task-timer.png)

Of course, you can change the timer value and set to any time you want. I, however, didn’t change the value and clicked the Start button present below to start the task timer. Once 60 seconds were left, GFI issued a notification indicating the same.

![gfi-first-notification-new](https://www.maketecheasier.com/assets/uploads/2015/10/gfi-first-notification-new.jpg)

And once the time was up, I was asked to take a break of five minutes.

![gfi-time-up-notification-new](https://www.maketecheasier.com/assets/uploads/2015/10/gfi-time-up-notification-new.jpg)

Once those five minutes were over, I could again start the task timer for my task.

![gfi-break-time-up-new](https://www.maketecheasier.com/assets/uploads/2015/10/gfi-break-time-up-new.jpg)

When you’re done with your task, you can click the Done button in the Timer tab. The task is then removed from the To-Do tab and listed in the Done tab.

![gfi-task-done](https://www.maketecheasier.com/assets/uploads/2015/10/gfi-task-done1.png)

GFI also allows you to tweak some of its settings. For example, the settings window shown below contains options to tweak the default task duration, break duration, and reminder time.

![gfi-settings](https://www.maketecheasier.com/assets/uploads/2015/10/gfi-settings1.png)

It’s worth mentioning that GFI stores the to-do lists in the Todo.txt format which simplifies synchronization with mobile devices and makes it possible for you to edit tasks using other frontends – read more about it [here][2].

You can also see the GFI app in action in the video below.

注：youtube 视频
<iframe frameborder="0" src="http://www.youtube.com/embed/mnw556C9FZQ?autoplay=1&amp;autohide=2&amp;border=1&amp;wmode=opaque&amp;enablejsapi=1&amp;controls=1&amp;showinfo=0" id="youtube-iframe"></iframe>

### Conclusion ###

As you have observed, GFI is an easy to understand and simple to use task management application. Although it doesn’t offer a plethora of features, it does what it claims – the timer integration is especially useful. If you’re looking for a basic, open-source task management tool for Linux, Go For It is worth trying.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/to-do-lists-ubuntu-go-for-it/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/himanshu/
[1]:http://manuel-kehl.de/projects/go-for-it/
[2]:http://todotxt.com/
