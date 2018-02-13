Building Slack for the Linux community and adopting snaps
======
![][1]

Used by millions around the world, [Slack][2] is an enterprise software platform that allows teams and businesses of all sizes to communicate effectively. Slack works seamlessly with other software tools within a single integrated environment, providing an accessible archive of an organisation’s communications, information and projects. Although Slack has grown at a rapid rate in the 4 years since their inception, their desktop engineering team who work across Windows, MacOS and Linux consists of just 4 people currently. We spoke to Felix Rieseberg, Staff Software Engineer, who works on this team following the release of Slack’s first [snap last month][3] to discover more about the company’s attitude to the Linux community and why they decided to build a snap.

[Install Slack snap][4]

### Can you tell us about the Slack snap which has been published?

We launched our first snap last month as a new way to distribute to our Linux community. In the enterprise space, we find that people tend to adopt new technology at a slower pace than consumers, so we will continue to offer a .deb package.

### What level of interest do you see for Slack from the Linux community?

I’m excited that interest for Slack is growing across all platforms, so it is hard for us to say whether the interest coming out of the Linux community is different from the one we’re generally seeing. However, it is important for us to meet users wherever they do their work. We have a dedicated QA engineer focusing entirely on Linux and we really do try hard to deliver the best possible experience.

We generally find it is a little harder to build for Linux, than say Windows, as there is a less predictable base to work from – and this is an area where the Linux community truly shines. We have a fairly large number of users that are quite helpful when it comes to reporting bugs and hunting root causes down.

### How did you find out about snaps?

Martin Wimpress at Canonical reached out to me and explained the concept of snaps. Honestly, initially I was hesitant – even though I use Ubuntu – because it seemed like another standard to build and maintain. However, once understanding the benefits I was convinced it was a worthwhile investment.

### What was the appeal of snaps that made you decide to invest in them?

Without doubt, the biggest reason we decided to build the snap is the updating feature. We at Slack make heavy use of web technologies, which in turn allows us to offer a wide variety of features – like the integration of YouTube videos or Spotify playlists. Much like a browser, that means that we frequently need to update the application.

On macOS and Windows, we already had a dedicated auto-updater that doesn’t require the user to even think about updates. We have found that any sort of interruption, even for an update, is an annoyance that we’d like to avoid. Therefore, the automatic updates via snaps seemed far more seamless and easy.

### How does building snaps compare to other forms of packaging you produce? How easy was it to integrate with your existing infrastructure and process?

As far as Linux is concerned, we have not tried other “new” packaging formats, but we’ll never say never. Snaps were an easy choice given that the majority of our Linux customers do use Ubuntu. The fact that snaps also run on other distributions was a decent bonus. I think it is really neat how Canonical is making snaps cross-distro rather than focusing on just Ubuntu.

Building it was surprisingly easy: We have one unified build process that creates installers and packages – and our snap creation simply takes the .deb package and churns out a snap. For other technologies, we sometimes had to build in-house tools to support our buildchain, but the `snapcraft` tool turned out to be just the right thing. The team at Canonical were incredibly helpful to push it through as we did experience a few problems along the way.

### How do you see the store changing the way users find and install your software?

What is really unique about Slack is that people don’t just stumble upon it – they know about it from elsewhere and actively try to find it. Therefore, our levels of awareness are already high but having the snap available in the store, I hope, will make installation a lot easier for our users.

We always try to do the best for our users. The more convinced we become that it is better than other installation options, the more we will recommend the snap to our users.

### What are your expectations or already seen savings by using snaps instead of having to package for other distros?

We expect the snap to offer more convenience for our users and ensure they enjoy using Slack more. From our side, the snap will save time on customer support as users won’t be stuck on previous versions which will naturally resolve a lot of issues. Having the snap is an additional bonus for us and something to build on, rather than displacing anything we already have.

### What release channels (edge/beta/candidate/stable) in the store are you using or plan to use, if any?

We used the edge channel exclusively in the development to share with the team at Canonical. Slack for Linux as a whole is still in beta, but long-term, having the options for channels is interesting and being able to release versions to interested customers a little earlier will certainly be beneficial.

### How do ￼you think packaging your software as a snap helps your users? Did you get any feedback from them?

Installation and updating generally being easier will be the big benefit to our users. Long-term, the question is “Will users that installed the snap experience less problems than other customers?” I have a decent amount of hope that the built-in dependencies in snaps make it likely.

### What advice or knowledge would you share with developers who are new to snaps?

I would recommend starting with the Debian package to build your snap – that was shockingly easy. It also starts the scope smaller to avoid being overwhelmed. It is a fairly small time investment and probably worth it. Also if you can, try to find someone at Canonical to work with – they have amazing engineers.

### Where do you see the biggest opportunity for development?

We are taking it step by step currently – first get people on the snap, and build from there. People using it will already be more secure as they will benefit from the latest updates.

--------------------------------------------------------------------------------

via: https://insights.ubuntu.com/2018/02/06/building-slack-for-the-linux-community-and-adopting-snaps/

作者：[Sarah][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.ubuntu.com/author/sarahfd/
[1]:https://insights.ubuntu.com/wp-content/uploads/a115/Slack_linux_screenshot@2x-2.png
[2]:https://slack.com/
[3]:https://insights.ubuntu.com/2018/01/18/canonical-brings-slack-to-the-snap-ecosystem/
[4]:https://snapcraft.io/slack/
