Translating----geekpi

Linux FAQs with Answers--How to add a cron job on Linux
================================================================================
> **Question**: I would like to schedule a task on my Linux box, so that the task runs periodically at fixed times. How can I add a cron job for this task on my Linux system?

The cron utility is the default task scheduler used in Linux. Using cron, you can schedule a task (e.g., a command or a shell-script) to run it periodically or one-time at a specific time of hour, day, week, month, etc. The cron tool is useful when you schedule a variety of regular maintenance jobs, such as periodic backup, rotating logs, checking filesystem, monitoring disk space, and so on.

### Add a Cron Job from the Command Line ###

To add a cron job, you can use a command-line tool called crontab.

Type the following command to create a new cron job to run as the current user.

    $ crontab -e

If you want a cron job to run as any other user, type the following command instead.

    $ sudo crontab -u <username> -e

You will be presented with a text editor window, where you can add or edit cron jobs. By default, nano editor will be used.

![](https://farm9.staticflickr.com/8586/16200331362_1385807ac0_b.jpg)

Each cron job is formatted as follows.

    <minute> <hour> <day-of-month> <month-of-year> <day-of-week> <command>

The first five elements specify the schedule for a task, and the last element is the (full-path) command or script to execute according to the schedule.

![](https://farm8.staticflickr.com/7472/16199272841_dffe0b2873_b.jpg)

Here are a few useful cron job examples.

- *** * * * * /home/dan/bin/script.sh**: run every minute.
- **0 * * * * /home/dan/bin/script.sh**: run every hour.
- **0 0 * * * /home/dan/bin/script.sh**: run at 12am daily.
- **0 9,18 * * * /home/dan/bin/script.sh**: run at 9AM and 6PM twice a day.
- **0 9-18 * * * /home/dan/bin/script.sh**: run every hour from 9AM and 6PM.
- **0 9-18 * * 1-5 /home/dan/bin/script.sh**: run every hour from 9AM and 6PM every weekday.
- ***/10 * * * * /home/dan/bin/script.sh**: run every 10 minutes. 

Once you are done with setting up cron job(s), press Ctrl+X to save and quit the editor. At this point, newly added cron jobs should be activated.

To browse existing cron jobs of yours, use the following command:

    $ crontab -l

### Add a Cron Job from GUI ###

If you are in Linux desktop environment, you can use a GUI fronend for crontab to add or edit a cron job via a more user-friendly interface.

On GNOME desktop, there is GNOME Schedule (gnome-schedule package).

![](https://farm8.staticflickr.com/7484/16015054699_d96f0e9b6a_c.jpg)

On KDE desktop, there is Task Scheduler (kcron package).

![](https://farm8.staticflickr.com/7473/16175298266_825376c901_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/add-cron-job-linux.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出