3 scary sysadmin stories
======

Terrifying ghosts are hanging around every data center, just waiting to haunt the unsuspecting sysadmin.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/spooky_halloween_haunted_house.jpg?itok=UkRBeItZ)

> "It's all just a bunch of hocus pocus!" — Max in [Hocus Pocus][1]

Over my many years as a system administrator, I've heard many horror stories about the different ghosts that have haunted new admins due to their inexperience.

Here are three of the stories that stand out to me the most in helping build my character as a good sysadmin.

### The ghost of the failed restore

In a well-known data center (whose name I do not want to remember), one cold October night we had a production outage in which thousands of web servers stopped responding due to downtime in the main database. The database administrator asked me, the rookie sysadmin, to recover the database's last full backup and restore it to bring the service back online.

But, at the end of the process, the database was still broken. I didn't worry, because there were other full backup files in stock. However, even after doing the process several times, the result didn't change.

With great fear, I asked the senior sysadmin what to do to fix this behavior.

"You remember when I showed you, a few days ago, how the full backup script was running? Something about how important it was to validate the backup?" responded the sysadmin.

"Of course! You told me that I had to stay a couple of extra hours to perform that task," I answered.

"Exactly! But you preferred to leave early without finishing that task," he said.

"Oh my! I thought it was optional!" I exclaimed.

"It was, it was…"

**Moral of the story:** Even with the best solution that promises to make the most thorough backups, the ghost of the failed restoration can appear, darkening our job skills, if we don't make a habit of validating the backup every time.

### The dark window

Once upon a night watch, reflecting I was, lonely and tired,
Looking at the file window on my screen.
Clicking randomly, nearly napping, suddenly came a beeping
From some server, sounding gently, sounding on my pager.
"It's just a warning," I muttered, "sounding on my pager—
Only this and nothing more."
Soon again I heard a beeping somewhat louder than before.
Opening my pager with great disdain,
There was the message from a server of the saintly days of yore:
"The legacy application, it's down, doesn't respond," and nothing more.
There were many stories of this server,
Incredibly, almost terrified,
I went down to the data center to review it.
I sat engaged in guessing, what would be the console to restart it
Without keyboard, mouse, or monitor?
"The task level up"—I think—"only this and nothing more."
Then, thinking, "In another rack, I saw a similar server,
I'll take its monitor and keyboard, nothing bad."
Suddenly, this server shut down, and my pager beeped again:
"The legacy application, it's down, doesn't respond", and nothing more.
Bemused, I sat down to call my sysadmin mentor:
"I wanted to use the console of another server, and now both are out."
"Did you follow my advice? Don't use the graphics console, the terminal is better."
Of course, I remember, it was last December;
I felt fear, a horror that I had never felt before;
"It is a tool of the past and nothing more."
With great shame I understood my mistake:
"Master," I said, "truly, your forgiveness I implore;
but the fact is I thought it was not used anymore.
A dark window and nothing more."
"Learn it well, little kid," he spoke.
"In the terminal you can trust, it's your friend and much, much more."
Step by step, my master showed me to connect with the terminal,
And restarting each one
With infinite patience, he taught me
That from that dark window I should not separate
Never, nevermore.

**Moral of the story:** Fluency in the command-line terminal is a skill often abandoned and considered archaic by newer generations, but it improves your flexibility and productivity as a sysadmin in obvious and subtle ways.

### Troll bridge

I'd been a sysadmin for three or four years when one of my old mentors was removed from work. The older man was known for making fun of the new guys in the group—the ones who brought from the university the desire to improve processes with the newly released community operating system. My manager assigned me the older man's office, a small space under the access stairs to the data center—"Troll Bridge," they called it—and the few legacy servers he still managed.

While reviewing those legacy servers, I realized most of them had many scripts that did practically all the work. I just had to check that they did not go offline due to an electrical failure. I started using those methods, adapting them so my own servers would work the same way, making my tasks more efficient and, at the same time, requiring less of my time to complete them. My day soon became surfing the internet, watching funny videos, and even participating in internet forums.

A couple of years went by, and I maintained my work in the same way. When a new server arrived, I automated its tasks so I could free myself and continue with my usual participation in internet forums. One day, when I shared one of my scripts in the internet forum, a new admin told me I could simplify it using one novelty language, a new trend that was becoming popular among the new folks.

"I am a sysadmin, not a programmer," I answered. "They will never be the same."

From that day on, I dedicated myself to ridiculing the kids who told me I should program in the new languages.

"You do not know, newbie," I answered every time, "this job will never change."

A few years later, my responsibilities increased, and my manager wanted me to modify the code of the applications hosted on my server.

"That's what the job is about now," said my manager. "Development and operations are joining; if you're not willing to do it, we'll bring in some guy who does."

"I will never do it, it's not my role," I said.

"Well then…" he said, looking at me harshly.

I've been here ever since. Hiding. Waiting. Under my bridge.

I watch from the shadows as the people pass: up the stairs, muttering, or talking about the things the new applications do. Sometimes people pause beneath my bridge, to talk, or share code, or make plans. And I watch them, but they don't see me.

I'm just going to stay here, in the darkness under the bridge. I can hear you all out there, everything you say.

Oh yes, I can hear you.
But I'm not coming out.

**Moral of the story:** "The lazy sysadmin is the best sysadmin" is a well-known phrase that means if we are proactive enough to automate all our processes properly, we will have a lot of free time. The best sysadmins never seem to be very busy; they prefer to be relaxed and let the system do the work for them. "Work smarter not harder." However, if we don't use this free time productively, we can fall into obsoleteness and become something we do not want. The best sysadmins reinvent themselves constantly; they are always researching and learning.

Following these stories' morals—and continually learning from my mistakes—helped me improve my management skills and create the good habits necessary for the sysadmin job.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/3-scary-sysadmin-stories

作者：[Alex Callejas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/darkaxl
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Hocus_Pocus_(1993_film)
