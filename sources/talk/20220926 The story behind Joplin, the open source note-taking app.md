[#]: subject: "The story behind Joplin, the open source note-taking app"
[#]: via: "https://opensource.com/article/22/9/joplin-interview"
[#]: author: "Richard Chambers https://opensource.com/users/20i"
[#]: collector: "lkxed"
[#]: translator: "MareDevi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

The story behind Joplin, the open source note-taking app
======
Laurent Cozic sat down with me to discuss how Joplin got started and what's next for the open source note-taking app.

In this interview, I met up with Laurent Cozic, creator of the note-taking app, Joplin. [Joplin][2] was a winner of the [20i][3] rewards, so I wanted to find out what makes it such a success, and how he achieved it.

**Could you summarize what Joplin does?**

[Joplin][4] is an open source note-taking app. It allows you to capture your thoughts and securely access them from any device.

**Obviously, there are other note-taking apps out there—but apart from it being free to use, what makes it different?**

The fact that it is open source is an important aspect for many of our users, because it means there is no vendor locking on the data, and that data can be easily exported and accessed in various ways.

We also focus on security and data privacy, in particular with the synchronization end-to-end encryption feature, and by being transparent about any connection that the application makes. We also work with security researchers to keep the app more secure.

Finally, Joplin can be customized in several different ways—through plugins, which can add new functionalities, and themes to customize the app appearance. We also expose a data API, which allows third-party applications to access Joplin data.

**[[ Related read 5 note-taking apps for Linux ]][5]**

**It's a competitive market, so what inspired you to build it?**

It happened organically. I started looking into it in 2016, as I was looking at existing commercial note-taking applications, and I didn't like that the notes, attachments, or tags could not easily be exported or manipulated by other tools.

This is probably due to vendor locking and partly a lack of motivation from the vendor since they have no incentive to help users move their data to other apps. There is also an issue with the fact that these companies usually will keep the notes in plain text, and that can potentially cause issues in terms of data privacy and security.

So I decided to start creating a simple mobile and terminal application with sync capabilities to have my notes easily accessible on my devices. Later the desktop app was created and the project grew from there.

![Image of Joplin on Chrome OS.][6]

Image by: (Opensource.com, CC BY-SA 4.0)

**How long did Joplin take to make?**

I've been working on it on and off since 2016 but it wasn't full time. The past two years I've been focusing more on it.

**What advice might you have for someone setting to create their own open source app?**

Pick a project you use yourself and technologies you enjoy working with.

Managing an open source project can be difficult sometimes so there has to be this element of fun to make it worthwhile. Then I guess "release early, release often" applies here, so that you can gauge user's interest and whether it makes sense to spend time developing the project further.

**How many people are involved in Joplin's development?**

There are 3-4 people involved in the development. At the moment we also have six students working on the project as part of Google Summer of Code.

**Lots of people create open source projects, yet Joplin has been a resounding success for you. Could you offer creators any tips on how to get noticed?**

There's no simple formula and to be honest I don't think I could replicate the success in a different project! You've got to be passionate about what you're doing but also be rigorous, be organized, make steady progress, ensure the code quality remains high, and have a lot of test units to prevent regressions.

Also be open to the user feedback you receive, and try to improve the project based on it.

Once you've got all that, the rest is probably down to luck—if it turns out you're working on a project that interests a lot of people, things might work out well!

**Once you get noticed, how do you keep that momentum going, if you don't have a traditional marketing budget?**

I think it's about listening to the community around the project. For example I never planned to have a forum but someone suggested it on GitHub, so I made one and it became a great way to share ideas, discuss features, provide support, and so on. The community is generally welcoming of newcomers too, which creates a kind of virtuous circle.

Next to this, it's important to communicate regularly about the project.

We don't have a public roadmap, because the ETA for most features is generally "I don't know", but I try to communicate about coming features, new releases, and so on. We also communicate about important events, the Google Summer of Code in particular, or when we have the chance to win something like the 20i FOSS Awards.

Finally, very soon we'll have an in-person meetup in London, which is another way to keep in touch with the community and collaborators.

**How does user feedback influence the roadmap?**

Significantly. Contributors will often work on something simply because they need the feature. But next to this, we also keep track of the features that seem most important to users, based on what we read about on the forum and on the GitHub issue tracker.

For example, the mobile app is now high priority because we frequently hear from users that its limitations and issues are a problem to effectively use Joplin.

![Image of Joplin being used on a Desktop.][8]

Image by: (Opensource.com, CC BY-SA 4.0)

**How do you keep up to date with the latest in dev and coding?**

Mostly by reading Hacker News!

**Do you have a personal favorite FOSS that you'd recommend?**

Among the less well-known projects, [SpeedCrunch][9] is very good as a calculator. It has a lot of features and it's great how it keeps a history of all previous calculations.

I also use [KeepassXC][10] as a password manager. It has been improving steadily over the past few years.

Finally, [Visual Studio Code][11] is great as a cross-platform text editor.

**I'd assumed that Joplin was named after Janis, but Wikipedia tells me it's Scott Joplin. What made you choose the name?**

I wanted to name it "jot-it" at first but I think the name was already taken.

Since I was listening to Scott Joplin ragtime music a lot back then (I was pretty much obsessed with it), I decided to use his name.

I think the meaning of a product name is not too important, as long as the name itself is easy to write, pronounce, remember, and perhaps is associated with something positive (or at least nothing negative).

And I think "Joplin" ticks all these boxes.

**Is there anything you can say about plans for Joplin? An exclusive tease of a new feature, perhaps?**

As mentioned earlier, we are very keen to make improvements to the mobile app, both in terms of UX design and new features.

We're also looking at creating a "Plugin Store" to make it easier to browse and install plugins.

**Thanks for your time Laurent— best of luck with the future of Joplin.**

*[This interview was originally published on the 20i blog and has been republished with permission.][12]*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/joplin-interview

作者：[Richard Chambers][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/20i
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/wfh_work_home_laptop_work.png
[2]: https://joplinapp.org/
[3]: https://www.20i.com/foss-awards/winners
[4]: https://opensource.com/article/19/1/productivity-tool-joplin
[5]: https://opensource.com/article/22/8/note-taking-apps-linux
[6]: https://opensource.com/sites/default/files/2022-09/joplin-chrome-os.png
[7]: https://opensource.com/article/21/10/google-summer-code
[8]: https://opensource.com/sites/default/files/2022-09/joplin-desktop.png
[9]: https://heldercorreia.bitbucket.io/speedcrunch/
[10]: https://opensource.com/article/18/12/keepassx-security-best-practices
[11]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
[12]: https://www.20i.com/blog/joplin-creator-laurent-cozic/
