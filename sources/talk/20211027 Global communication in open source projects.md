[#]: subject: "Global communication in open source projects"
[#]: via: "https://opensource.com/article/21/10/global-communication-open-source"
[#]: author: "Rachel Naegele https://opensource.com/users/ranaegele"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Global communication in open source projects
======
An interview with FreeDOS Project founder Jim Hall on communicating
effectively around the world.
![Globe up in the clouds][1]

I am a current graduate student at the University of Minnesota, Twin Cities in the Scientific and Technical Communication MS program. The following is an interview I conducted with [Jim Hall][2] to learn about international professional communication strategies in the multinational group, the FreeDOS Project.

**You started the [FreeDOS project][3] in 1994. How did you communicate with the global network of developers for this project at the beginning? How have your communication strategies for international communication changed over the years?**

We've gone through a few different ways to communicate with each other.

In the early 1990s, USENET was a common way to communicate with a group of people. USENET was very similar to a message forum, but it was globally distributed. Topics were arranged in groups. You could post a message in a USENET group, and someone else would see it and possibly reply to it.

I posted the [first announcement][4] about FreeDOS on the comp.os.msdos.apps group. As we got started on FreeDOS, we used that group to discuss our development work. There are a few benefits of using a group like that:

  * It was global, so everyone could participate.
  * It was asynchronous, so it didn't matter what timezone you lived in.
  * It was open, so everyone could see the conversation.



Around 1996, we moved from USENET to an email list. Email lists were very common at the time, and they remain popular for some uses, such as ours. With an email list, whenever someone sends a message to the list, everyone gets a copy. The downside is that very active email lists can fill up your inbox. But the FreeDOS email lists aren't as active these days as they once were, so our email lists don't tend to have a high bandwidth.

Over the years, folks have experimented with other ways to communicate. Robert Riebisch at BTTR Software set up a general web-based discussion board called ["DOS Ain't Dead"][5] to discuss DOS projects in 1997, and it's still a popular forum for general DOS topics. You can also find FreeDOS topics discussed there. That's not our official discussion board, however; the official place for all FreeDOS development discussions is the [freedos-devel email list][6].

We use freedos-devel to discuss upcoming changes to the FreeDOS distribution, announce new versions of programs, ask for programming help, and generally talk about DOS development.

**What communication issues have you run into while working with a global team? How did you resolve these issues?**

With developers all around the world, in so many languages, from so many cultures, we have had our share of communication issues.

Our de facto language on the email list is English. We never set that as a rule, but almost everyone communicates in English anyway. Sometimes a new subscriber to the email list sends a message in another language, but usually someone who speaks that language can reply to them.

Inevitably, we do have miscommunication issues, usually because of cultural or language problems. For example, someone who doesn't speak English fluently might say something in an awkward way, and someone else might respond negatively to that. But these instances are pretty rare, I think. And we have strong [email list rules][7] that say (among other things) that you need to be nice to each other. And folks police each other pretty well; if there's an issue, it's usually short-lived.

Other issues include culture clash. In international communication, there's a concept of [high-context and low-context][8] communicators. Germany is a typical example of a low-context culture: They get right to the point with very little small talk. Other cultures might see the German style as speaking bluntly, but to a German, that's just a natural way to communicate. On the other hand, Korea or Japan is a typical example of a high-context culture; it would be very unusual for a high-context communicator to talk about a problem in a very direct way.

In the United States, we're more low context than high context, at about the one-quarter mark.

One example of this culture clash is when a user from a high-context country emailed the list to report a bug. I suppose this person viewed a program bug as an embarrassment for the developer, so the person didn't address the bug directly. They didn't provide a specific description of the bug. The other developers on the email list didn't respond well to that. I recall replies along the lines of "What's the problem here?" or "What are you talking about?" All because we communicate differently depending on our background.

**What have been the biggest challenges in creating a DOS for an international audience?**

I'm really glad that we have some very active people in FreeDOS who are working on translating messages in all these programs. There are a few folks who contribute to FreeDOS by translating messages from one language to another and sharing those message files so we can use them in the FreeDOS distribution.

FreeDOS is a small operating system with low memory constraints, so actually our biggest challenge has been technical.

In a more modern system like Linux, you can provide message translation through a service like [catgets][9] or [gettext][10]. Both are programming libraries where the program says, "I need this string [text] in the user's preferred language," and the library gives the program that string. This is an example of internationalization, by providing translations in different languages.

But writing a library like that can take a lot of memory, and a 16-bit operating system like DOS doesn't have a lot of memory to spare. So most early FreeDOS programs didn't bother dealing with it. If the programmer spoke English, they probably wrote their program to use English messages and to accept English input (such as "y" for "yes," and so on).

Unfortunately, that meant someone in Spain or France or Portugal who didn't understand English would have a hard time using FreeDOS. So, I wrote a simplified version of catgets for FreeDOS called Cats. It provided the same catgets function feature set, which meant if you were porting or translating a program from Linux to run on FreeDOS, the catgets function would do the same thing. The programmer wouldn't need to change anything in the source code for the program to work on FreeDOS; they just used FreeDOS Cats.

Catgets looks up a message or string using a _message catalog_ (a file that contains a list of messages in a specific language) and a pair of numbers called the _message set_ and the _message number._ The name catgets comes from the catalog to get a string in the user's preferred language. For example, a message to say "Hello" to the user might be stored in message set 1, as message number 2 in that message set. So you'd have this line in an English catalog file:

`1.2:Hello`

And you'd have other language catalog files that had the same messages translated to other languages. A Spanish catalog might have this line to represent the same message:

`1.2:Hola`

Tom Ehlert modified Cats to be even smaller but also much simpler. This version was named Kitten. Cats and Kitten solved the problem pretty well. A translator could create a message catalog by editing a plain text file, and someone else could use that right away. A lot of FreeDOS programs adopted Cats or Kitten to provide message internationalization. That solved a huge problem for us!

Kitten is not the only solution. Different developers might solve the language problem in different ways. But Kitten is probably the most popular way to do it.

**What are some of the main factors that you consider when communicating interculturally?**

For me, I need to be aware of who I'm talking to when I send a message. If I'm emailing a specific person, I'll use the email they sent me as a guide to guess whether they prefer a high-context or low-context answer. If I don't know, I'll probably default to a lower context mode. That means I'll get to the point quickly, but it's okay to set up some context.

If I'm writing for a more general audience (such as sending emails to our email list, posting an announcement to our website, or whatever), I'll also adopt the lower context communication mode. That's more important on a website, where many readers will probably click off the site if it's too wordy.

**Using your time working on the FreeDOS project as a reference, what advice would you give to someone looking to increase their intercultural communication competence?**

Ever since I learned about high-context vs. low-context communication styles, I've used that as a guide. For anyone who wants to increase their intercultural communication competence, I recommend learning the high- vs. low-context spectrum. Build your own understanding of where different cultures are placed on this spectrum: Italy tends to be around the middle, the UK tends to be around the one-third mark, and so on.

Beyond that, I would recommend always assuming positive intent. If someone reached out to you in an email, read past any preconceptions about how that person communicated and find the message they wanted to convey. A high-context communicator will rarely hit an issue head-on, so you may need to read more carefully. A low-context communicator will probably seem very blunt, but they are just trying to get to the point quickly.

Don't assume based on your own context.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/global-communication-open-source

作者：[Rachel Naegele][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ranaegele
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud-globe.png?itok=_drXt4Tn (Globe up in the clouds)
[2]: https://opensource.com/users/jim-hall
[3]: https://www.freedos.org/
[4]: https://groups.google.com/g/comp.os.msdos.apps/c/oQmT4ETcSzU/m/O1HR8PE2u-EJ
[5]: https://www.bttr-software.de/forum/board.php
[6]: http://lists.sourceforge.net/lists/listinfo/freedos-user
[7]: http://freedos.sourceforge.net/freedos/lists/remind.txt
[8]: https://en.wikipedia.org/wiki/High-context_and_low-context_cultures
[9]: https://www.ibm.com/docs/en/i/7.3?topic=functions-catgets-retrieve-message-from-message-catalog
[10]: https://www.gnu.org/software/gettext/manual/gettext.html
