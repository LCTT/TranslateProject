3 innovative open source projects for the new school year
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/desk_clock_job_work.jpg?itok=Nj4fuhl6)

I first wrote about open source learning software for educators in the fall of 2013. Fast-forward five years—today, open source software and principles have moved from outsiders in the education industry to the popular crowd.

Since Penn Manor School District has [adopted open software][1] and cultivated a learning community built on trust, we've watched student creativity, ingenuity, and engagement soar. Here are three free and open source software tools we’ve used during the past school year. All three have enabled great student projects and may spark cool classroom ideas for open-minded educators.

### Catch a wave: Software-defined radio

Students may love the modern sounds of Spotify and Soundcloud, but there's an old-school charm to snatching noise from the atmosphere. Penn Manor help desk student apprentices had serious fun with [software-defined radio][2] (SDR). With an inexpensive software-defined radio kit, students can capture much more than humdrum FM radio stations. One of our help desk apprentices, JR, discovered everything from local emergency radio chatter to unencrypted pager messages.

Our basic setup involved a student’s Linux laptop running [gqrx software][3] paired with a [USB RTL-SDR tuner and a simple antenna][4]. It was light enough to fit in a student backpack for SDR on the go. And the kit was great for creative hacking, which JR demonstrated when he improvised all manner of antennas, including a frying pan, in an attempt to capture signals from the U.S. weather satellite [NOAA-18][5].

Former Penn Manor IT specialist Tom Swartz maintains an excellent [quick-start resource for SDR][6].

### Stream far for a middle school crowd: OBS Studio

Remember live morning TV announcements in school? Amateur weather reports, daily news updates, middle school puns... In-house video studios are an excellent opportunity for fun collaboration and technical learning. But many schools are stuck running proprietary broadcast and video mixing software, and many more are unable to afford costly production hardware such as [NewTek’s TriCaster][7].

Cue [OBS Studio][8], a free, open source, real-time broadcasting program ideally suited for school projects as well as professional video streaming. During the past six months, several Penn Manor schools successfully upgraded to OBS Studio running on Linux. OBS handles our multi-source video and audio mixing, chroma key compositing, transitions, and just about anything else students need to run a surprising polished video broadcast.

Penn Manor students stream a live morning show via UDP multicast to staff and students tuned in via the [mpv][9] media player. OBS also supports live streaming to YouTube, Facebook Live, and Twitch, which means students can broadcast daily school lunch menus and other vital updates to the world.

### Self-drive by light: TurtleBot3 and Lidar

Of course, robots are cool, but robots with lasers are ace. The newest star of the Penn Manor student help desk is Patch, a petite educational robot built with the [TurtleBot3][10] open hardware and software kit. The Turtlebot platform is extensible and great for hardware hacking, but we were most interested in creating a self-driving gadget.

We used the Turtlebot3 Burger, the entry-level kit powered by a Raspberry PI and loaded with a laser distance sensor. New student tech apprentices Aiden, Alex, and Tristen were challenged to make the robot autonomously navigate down one Penn Manor High School hallway and back to the technology center. It was a tall order: The team spent several months building the bot, and then working through the [ROS][11]-based programming, [rviz][12] (a 3D environment visualizer) and mapping for simultaneous localization and mapping (SLAM).

Building the robot was a joy, but without a doubt, the programming challenged the students, none of whom had previously touched any of the ROS software tools. However, after much persistence, trial and error, and tenacity, Aiden and Tristen succeeded in achieving both the hallway navigation goal and in confusing fellow students with a tiny robot transversing school corridors and magically avoiding objects and people in its path.

I recommend the TurtleBot3, but educators should be aware of the cost (approximately US$ 500) and the complexity. However, the kit is an outstanding resource for students aspiring to technology careers or those who want to build something amazing.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/back-school-project-ideas

作者：[Charlie Reisinger][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/charlie
[1]: https://opensource.com/education/14/9/interview-charlie-reisinger-penn-manor
[2]: https://en.wikipedia.org/wiki/Software-defined_radio
[3]: http://gqrx.dk/
[4]: https://www.amazon.com/JahyShow%C2%AE-RTL2832U-RTL-SDR-Receiver-Compatible/dp/B01H830YQ6
[5]: https://en.wikipedia.org/wiki/NOAA-18
[6]: https://github.com/tomswartz07/CPOSC2017
[7]: https://www.newtek.com/tricaster/
[8]: https://obsproject.com/
[9]: https://mpv.io/
[10]: https://www.turtlebot.com/
[11]: http://www.ros.org/
[12]: http://wiki.ros.org/rviz
