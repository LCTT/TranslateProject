A Command Line Productivity Tool For Tracking Work Hours
======

![](https://www.ostechnix.com/wp-content/uploads/2018/03/Moro-720x340.jpg)
Keeping track of your work hours will give you an insight about the amount of work you get done in a specific time frame. There are plenty of GUI-based productivity tools available on the Internet for tracking work hours. However, I couldn’t find a good CLI-based tool. Today, I stumbled upon a a simple, yet useful tool named **“Moro”** for tracking work hours. Moro is a Finnish word which means “Hello”. Using Moro, you can find how much time you take to complete a specific task. It is free, open source and written using **NodeJS**.

### Moro – A Command Line Productivity Tool For Tracking Work Hours

Since Moro is written using NodeJS, make sure you have installed it on your system. If you haven’t installed it already, follow the link given below to install NodeJS and NPM in your Linux box.

Once NodeJS and Npm installed, run the following command to install Moro.
```
$ npm install -g moro

```

### Usage

Moro’s working concept is very simple. It saves your work staring time, ending time and the break time in your system. At the end of each day, it will tell you how many hours you have worked!

When you reached to office, just type:
```
$ moro

```

Sample output:
```
💙 Moro \o/

✔ You clocked in at: 9:20

```

Moro will register this time as your starting time.

When you leave the office, again type:
```
$ moro

```

Sample output:
```
💙 Moro \o/

✔ You clocked out at: 19:22

ℹ Today looks like this so far:

┌──────────────────┬─────────────────────────┐
│ Today you worked │ 9 Hours and 72 Minutes │
├──────────────────┼─────────────────────────┤
│ Clock in │ 9:20 │
├──────────────────┼─────────────────────────┤
│ Clock out │ 19:22 │
├──────────────────┼─────────────────────────┤
│ Break duration │ 30 minutes │
├──────────────────┼─────────────────────────┤
│ Date │ 2018-03-19 │
└──────────────────┴─────────────────────────┘
ℹ Run moro --help to learn how to edit your clock in, clock out or break duration for today

```

Moro will registers that time as your ending time.

Now, More will subtract the starting time from ending time and then subtracts another 30 minutes for break time from the total and gives you the total working hours on that day. Sorry I am really terrible at explaining Math calculations. Let us say you came to work at 10 am in the morning and left 17.30 in the evening. So, the total hours you spent on the office is 7.30 hours (i.e 17.30-10). Then subtract the break time (default is 30 minutes) from the total. Hence, your total working time is 7 hours. Understood? Great!

**Note:** Don’t confuse “moro” with “more” command like I did while writing this guide.

To see all your registered hours, run:
```
$ moro report --all

```

Just in case, you forgot to register the start time or end time, you can specify that later on the same.

For example, to register 10 am as start time, run:
```
$ moro hi 10:00

💙 Moro \o/

✔ You clocked in at: 10:00

⏰ Working until 18:00 will make it a full (7.5 hours) day

```

To register 17.30 as end time:
```
$ moro bye 17:30

💙 Moro \o/

✔ You clocked out at: 17:30

ℹ Today looks like this so far:

┌──────────────────┬───────────────────────┐
│ Today you worked │ 7 Hours and 0 Minutes │
├──────────────────┼───────────────────────┤
│ Clock in │ 10:00 │
├──────────────────┼───────────────────────┤
│ Clock out │ 17:30 │
├──────────────────┼───────────────────────┤
│ Break duration │ 30 minutes │
├──────────────────┼───────────────────────┤
│ Date │ 2018-03-19 │
└──────────────────┴───────────────────────┘
ℹ Run moro --help to learn how to edit your clock in, clock out or break duration for today

```

You already know Moro will subtract 30 minutes for break time, by default. If you wanted to set a custom break time, you could simply set it using command:
```
$ moro break 45

```

Now, the break time is 45 minutes.

To clear all data:
```
$ moro clear --yes

💙 Moro \o/

✔ Database file deleted successfully

```

**Add notes**

Sometimes, you may want to add note while working. Don’t look for a separate note taking application. Moro will help you to add notes. To add a note, just run:
```
$ moro note mynotes

```

To search for the registered notes at later time, simply do:
```
$ moro search mynotes

```

**Change default settings**

The default full work day is 7.5 hours. Since the developer is from Finland, it’s the official work hours. You can, however, change this settings as per your country’s work hours.

Say for example, to set it 7 hours, run:
```
$ moro config --day 7

```

Also the default break time can be changed from 30 minutes like below:
```
$ moro config --break 45

```

**Backup your data**

Like I already said, Moro stores the tracking time data in your home directory, and the file name is **.moro-data.db**.

You can can, however, save the backup database file to different location. To do so, move the **.more-data.db** file to a different location of your choice and tell Moro to use that database file like below.
```
$ moro config --database-path /home/sk/personal/moro-data.db

```

As per above command, I have assigned the default database file’s location to **/home/sk/personal** directory.

For help, run:
```
$ moro --help

```

As you can see, Moro is very simple, yet useful to track how much time you’ve spent to get your work done. It is will be useful for freelancers and also anyone who must get things done under a limited time frame.

And, that’s all for today. Hope this helps. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/moro-a-command-line-productivity-tool-for-tracking-work-hours/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
