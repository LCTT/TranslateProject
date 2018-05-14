Systemd Services: Beyond Starting and Stopping
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/systemd-minetest-2.jpg?itok=bXO0ggHL)
[In the previous article][1], we showed how to create a systemd service that you can run as a regular user to start and stop your game server. As it stands, however, your service is still not much better than running the server directly. Let's jazz it up a bit by having it send out emails to the players, alerting them when the server becomes available and warning them when it is about to be turned off:
```
# minetest.service

[Unit]
Description= Minetest server
Documentation= https://wiki.minetest.net/Main_Page

[Service]
Type= simple

ExecStart= /usr/games/minetest --server
ExecStartPost= /home/<username>/bin/mtsendmail.sh "Ready to rumble?" "Minetest Starting up"

TimeoutStopSec= 180
ExecStop= /home/<username>/bin/mtsendmail.sh "Off to bed. Nightie night!" "
  Minetest Stopping in 2 minutes"
ExecStop= /bin/sleep 120
ExecStop= /bin/kill -2 $MAINPID

```

There are a few new things in here. First, there's the `ExecStartPost` directive. You can use this directive for anything you want to run right after the main application starts. In this case, you run a custom script, `mtsendmail` (see below), that sends an email to your friends telling them that the server is up.
```
#!/bin/bash
# mtsendmail
echo $1 | mutt -F /home/<username>/.muttrc -s "$2" my_minetest@mailing_list.com

```

You can use [Mutt][2], a command-line email client, to shoot off your messages. Although the script shown above is to all practical effects only one line long, remember you can't have a line with pipes and redirections as a systemd unit argument, so you have to wrap it in a script.

For the record, there is also an `ExecStartPre` directive for things you want to execute before starting the service proper.

Next up, you have a block of commands that close down the server. The `TimeoutStopSec` directive pushes up the time before systemd bails on shutting down the service. The default time out value is round about 90 seconds. Anything longer, and systemd will force the service to close down and report a failure. But, as you want to give your users a couple of minutes before closing the server completely, you are going to push the default up to three minutes. This will stop systemd from thinking the closedown has failed.

Then the close down proper starts. Although there is no `ExecStopPre` as such, you can simulate running stuff before closing down your server by using more than one `ExecStop` directive. They will be executed in order, from topmost to bottommost, and will allow you to send out a message before the server is actually stopped.

With that in mind, the first thing you do is shoot off an email to your friends, warning them the server is going down. Then you wait two minutes. Finally you close down the server. Minetest likes to be closed down with [Ctrl] + [c], which translates into an interrupt signal ( _SIGINT_ ). That is what you do when you issue the `kill -2 $MAINPID` command. `$MAINPID` is a systemd variable for your service that points to the PID of the main application.

This is much better! Now, when you run
```
systemctl --user start minetest

```

The service will start up the Minetest server and send out an email to your users. Likewise when you are about to close down, but giving two minutes to users to log off.

### Starting at Boot

The next step is to make your service available as soon as the machine boots up, and close down when you switch it off at night.

Start be moving your service out to where the system services live, The directory youa re looking for is _/etc/systemd/system/_ :
```
sudo mv /home/<username>/.config/systemd/user/minetest.service /etc/systemd/system/

```

If you were to try and run the service now, it would have to be with superuser privileges:
```
sudo systemctl start minetest

```

But, what's more, if you check your service's status with
```
sudo systemctl status minetest

```

You would see it had failed miserably. This is because systemd does not have any context, no links to worlds, textures, configuration files, or details of the specific user running the service. You can solve this problem by adding the `User` directive to your unit:
```
# minetest.service

[Unit]
Description= Minetest server
Documentation= https://wiki.minetest.net/Main_Page

[Service]
Type= simple
User= <username>

ExecStart= /usr/games/minetest --server
ExecStartPost= /home/<username>/bin/mtsendmail.sh "Ready to rumble?"
  "Minetest Starting up"

TimeoutStopSec= 180
ExecStop= /home/<username>/bin/mtsendmail.sh "Off to bed. Nightie night!"
  "Minetest Stopping in 2 minutes"
ExecStop= /bin/sleep 120
ExecStop= /bin/kill -2 $MAINPID

```

The `User` directive tells systemd which user's environment it should use to correctly run the service. You could use root, but that would probably be a security hazard. You could also use your personal user and that would be a bit better, but what many administrators do is create a specific user for each service, effectively isolating the service from the rest of the system and users.

The next step is to make your service start when you boot up and stop when you power down your computer. To do that you need to _enable_ your service, but, before you can do that, you have to tell systemd where to _install_ it.

In systemd parlance, _installing_ means telling systemd when in the boot sequence should your service become activated. For example the _cups.service_ , the service for the _Common UNIX Printing System_ , will have to be brought up after the network framework is activated, but before any other printing services are enabled. Likewise, the _minetest.service_ uses a user's email (among other things) and will have to be slotted in when the network is up and services for regular users become available.

You do all that by adding a new section and directive to your unit:
```
...
[Install]
WantedBy= multi-user.target

```

You can read this as "wait until we have everything ready for a multiples user system." Targets in systemd are like the old run levels and can be used to put your machine into one state or another, or, like here, to tell your service to wait until a certain state has been reached.

Your final _minetest.service_ file will look like this:
```
# minetest.service
[Unit]
Description= Minetest server
Documentation= https://wiki.minetest.net/Main_Page

[Service]
Type= simple
User= <username>

ExecStart= /usr/games/minetest --server
ExecStartPost= /home/<username>/bin/mtsendmail.sh "Ready to rumble?"
  "Minetest Starting up"

TimeoutStopSec= 180
ExecStop= /home/<username>/bin/mtsendmail.sh "Off to bed. Nightie night!"
  "Minetest Stopping in 2 minutes"
ExecStop= /bin/sleep 120
ExecStop= /bin/kill -2 $MAINPID

[Install]
WantedBy= multi-user.target

```

Before trying it out, you may have to do some adjustments to your email script:
```
#!/bin/bash
# mtsendmail

sleep 20
echo $1 | mutt -F /home/<username>/.muttrc -s "$2" my_minetest@mailing_list.com
sleep 10

```

This is because the system will need some time to set up the emailing system (so you wait 20 seconds) and also some time to actually send the email (so you wait 10 seconds). Notice that these are the wait times that worked for me. You may have to adjust these for your own system.

And you're done! Run:
```
sudo systemctl enable minetest

```

and the Minetest service will come online when you power up and gracefully shut down when you power off, warning your users in the process.

### Conclusion

The fact that Debian, Ubuntu, and distros of the same family have a special package called _minetest-server_ that does some of the above for you (but no messaging!) should not deter you from setting up your own customised services. In fact, the version you set up here is much more versatile and does more than Debian's default server.

Furthermore, the process described here will allow you to set up most simple servers as services, whether they are for games, web applications, or whatever. And those are the first steps towards veritable systemd guruhood.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/5/systemd-services-beyond-starting-and-stopping

作者：[Paul Brown][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/bro66
[1]:https://www.linux.com/blog/learn/intro-to-linux/2018/5/writing-systemd-services-fun-and-profit
[2]:http://www.mutt.org/
