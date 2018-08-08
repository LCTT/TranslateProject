Systemd Timers: Three Use Cases
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/timer-analogue-1078057.jpg?itok=IKS4TrkE)

In this systemd tutorial series, we have[ already talked about systemd timer units to some degree][1], but, before moving on to the sockets, let's look at three examples that illustrate how you can best leverage these units.

### Simple _cron_ -like behavior

This is something I have to do: collect [popcon data from Debian][2] every week, preferably at the same time so I can see how the downloads for certain applications evolve. This is the typical thing you can have a _cron_ job do, but a systemd timer can do it too:
```
# cron-like popcon.timer

[Unit]
Description= Says when to download and process popcons

[Timer]
OnCalendar= Thu *-*-* 05:32:07
Unit= popcon.service

[Install]
WantedBy= basic.target

```

The actual _popcon.service_ runs a regular _wget_ job, so nothing special. What is new in here is the `OnCalendar=` directive. This is what lets you set a service to run on a certain date at a certain time. In this case, `Thu` means " _run on Thursdays_ " and the `*-*-*` means " _the exact date, month and year don't matter_ ", which translates to " _run on Thursday, regardless of the date, month or year_ ".

Then you have the time you want to run the service. I chose at about 5:30 am CEST, which is when the server is not very busy.

If the server is down and misses the weekly deadline, you can also work an _anacron_ -like functionality into the same timer:
```
# popcon.timer with anacron-like functionality

[Unit]
Description=Says when to download and process popcons

[Timer]
Unit=popcon.service
OnCalendar=Thu *-*-* 05:32:07
Persistent=true

[Install]
WantedBy=basic.target

```

When you set the `Persistent=` directive to true, it tells systemd to run the service immediately after booting if the server was down when it was supposed to run. This means that if the machine was down, say for maintenance, in the early hours of Thursday, as soon as it is booted again, _popcon.service_ will be run immediately and then it will go back to the routine of running the service every Thursday at 5:32 am.

So far, so straightforward.

### Delayed execution

But let's kick thing up a notch and "improve" the [systemd-based surveillance system][3]. Remember that the system started taking pictures the moment you plugged in a camera. Suppose you don't want pictures of your face while you install the camera. You will want to delay the start up of the picture-taking service by a minute or two so you can plug in the camera and move out of frame.

To do this; first change the Udev rule so it points to a timer:
```
ACTION=="add", SUBSYSTEM=="video4linux", ATTRS{idVendor}=="03f0",
ATTRS{idProduct}=="e207", TAG+="systemd", ENV{SYSTEMD_WANTS}="picchanged.timer",
SYMLINK+="mywebcam", MODE="0666"

```

The timer looks like this:
```
# picchanged.timer

[Unit]
Description= Runs picchanged 1 minute after the camera is plugged in

[Timer]
OnActiveSec= 1 m
Unit= picchanged.path

[Install]
WantedBy= basic.target

```

The Udev rule gets triggered when you plug the camera in and it calls the timer. The timer waits for one minute after it starts (`OnActiveSec= 1 m`) and then runs _picchanged.path_ , which [monitors to see if the master image changes][4]. The _picchanged.path_ is also in charge of pulling in the _webcam.service_ , the service that actually takes the picture.

### Start and stop Minetest server at a certain time every day

In the final example, let's say you have decided to delegate parenting to systemd. I mean, systemd seems to be already taking over most of your life anyway. Why not embrace the inevitable?

So you have your Minetest service set up for your kids. You also want to give some semblance of caring about their education and upbringing and have them do homework and chores. What you want to do is make sure Minetest is only available for a limited time (say from 5 pm to 7 pm) every evening.

This is different from " _starting a service at certain time_ " in that, writing a timer to start the service at 5 pm is easy...:
```
# minetest.timer

[Unit]
Description= Runs the minetest.service at 5pm everyday

[Timer]
OnCalendar= *-*-* 17:00:00
Unit= minetest.service

[Install]
WantedBy= basic.target

```

... But writing a counterpart timer that shuts down a service at a certain time needs a bigger dose of lateral thinking.

Let's start with the obvious -- the timer:
```
# stopminetest.timer

[Unit]
Description= Stops the minetest.service at 7 pm everyday

[Timer]
OnCalendar= *-*-* 19:05:00
Unit= stopminetest.service

[Install]
WantedBy= basic.target

```

The tricky part is how to tell _stopminetest.service_ to actually, you know, stop the Minetest. There is no way to pass the PID of the Minetest server from _minetest.service_. and there are no obvious commands in systemd's unit vocabulary to stop or disable a running service.

The trick is to use systemd's `Conflicts=` directive. The `Conflicts=` directive is similar to systemd's `Wants=` directive, in that it does _exactly the opposite_. If you have `Wants=a.service` in a unit called _b.service_ , when it starts, _b.service_ will run _a.service_ if it is not running already. Likewise, if you have a line that reads `Conflicts= a.service` in your _b.service_ unit, as soon as _b.service_ starts, systemd will stop _a.service_.

This was created for when two services could clash when trying to take control of the same resource simultaneously, say when two services needed to access your printer at the same time. By putting a `Conflicts=` in your preferred service, you could make sure it would override the least important one.

You are going to use `Conflicts=` a bit differently, however. You will use `Conflicts=` to close down cleanly the _minetest.service_ :
```
# stopminetest.service

[Unit]
Description= Closes down the Minetest service
Conflicts= minetest.service

[Service]
Type= oneshot
ExecStart= /bin/echo "Closing down minetest.service"

```

The _stopminetest.service_ doesn't do much at all. Indeed, it could do nothing at all, but just because it contins that `Conflicts=` line in there, when it is started, systemd will close down _minetest.service_.

There is one last wrinkle in your perfect Minetest set up: What happens if you are late home from work, it is past the time when the server should be up but playtime is not over? The `Persistent=` directive (see above) that runs a service if it has missed its start time is no good here, because if you switch the server on, say at 11 am, it would start Minetest and that is not what you want. What you really want is a way to make sure that systemd will only start Minetest between the hours of 5 and 7 in the evening:
```
# minetest.timer

[Unit]
Description= Runs the minetest.service every minute between the hours of 5pm and 7pm

[Timer]
OnCalendar= *-*-* 17..19:*:00
Unit= minetest.service

[Install]
WantedBy= basic.target

```

The line `OnCalendar= *-*-* 17..19:*:00` is interesting for two reasons: (1) `17..19` is not a point in time, but a period of time, in this case the period of time between the times of 17 and 19; and (2) the `*` in the minute field indicates that the service must be run every minute. Hence, you would read this as " _run the minetest.service every minute between 5 and 7 pm_ ".

There is still one catch, though: once the _minetest.service_ is up and running, you want _minetest.timer_ to stop trying to run it again and again. You can do that by including a `Conflicts=` directive into _minetest.service_ :
```
# minetest.service

[Unit]
Description= Runs Minetest server
Conflicts= minetest.timer

[Service]
Type= simple
User= <your user name>

ExecStart= /usr/bin/minetest --server
ExecStop= /bin/kill -2 $MAINPID

[Install]
WantedBy= multi-user.targe

```

The `Conflicts=` directive shown above makes sure _minetest.timer_ is stopped as soon as the _minetest.service_ is successfully started.

Now enable and start _minetest.timer_ :
```
systemctl enable minetest.timer
systemctl start minetest.timer

```

And, if you boot the server at, say, 6 o'clock, _minetest.timer_ will start up and, as the time falls between 5 and 7, _minetest.timer_ will try and start _minetest.service_ every minute. But, as soon as _minetest.service_ is running, systemd will stop _minetest.timer_ because it  "conflicts" with _minetest.service_ , thus avoiding the timer from trying to start the service over and over when it is already running.

It is a bit counterintuitive that you use the service to kill the timer that started it up in the first place, but it works.

### Conclusion

You probably think that there are better ways of doing all of the above. I have heard the term "overengineered" in regard to these articles, especially when using systemd timers instead of cron.

But, the purpose of this series of articles is not to provide the best solution to any particular problem. The aim is to show solutions that use systemd units as much as possible, even to a ridiculous length. The aim is to showcase plenty of examples of how the different types of units and the directives they contain can be leveraged. It is up to you, the reader, to find the real practical applications for all of this.

Be that as it may, there is still one more thing to go: next time, we'll be looking at _sockets_ and _targets_ , and then we'll be done with systemd units.

Learn more about Linux through the free ["Introduction to Linux" ][5]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/intro-to-linux/2018/8/systemd-timers-two-use-cases-0

作者：[Paul Brown][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/bro66
[1]:https://www.linux.com/blog/learn/intro-to-linux/2018/7/setting-timer-systemd-linux
[2]:https://popcon.debian.org/
[3]:https://www.linux.com/blog/intro-to-linux/2018/6/systemd-services-reacting-change
[4]:https://www.linux.com/blog/learn/intro-to-linux/2018/6/systemd-services-monitoring-files-and-directories
[5]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
