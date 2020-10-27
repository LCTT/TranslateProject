[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why it's important to keep the cloud open)
[#]: via: (https://opensource.com/article/20/10/keep-cloud-open)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Why it's important to keep the cloud open
======
An open cloud helps developers maintain autonomy and security while
taking advantage of the power and reach of the cloud.
![Sky with clouds and grass][1]

There's a famous sticker featured on many laptop lids; it goes something like this: "the 'cloud' is just somebody else's computer."

There's a lot of truth to that sentiment, but it's not exactly technically accurate. In fact, cloud computing isn't just somebody else's computer; it's somebody else's _hundreds and thousands_ of computers.

Years ago, "the cloud" did indeed just refer to the simplified graphic in a flowchart, so the illustrator didn't have to try to accurately depict the multiple networks that comprise the World Wide Web. Now, however, the cloud isn't just describing traffic or small-time remote file storage offers. The cloud of today is a _platform_ of interconnected computational nodes working together to keep containerized Linux images, each running a distinct service (or "microservice" in developer lingo), functioning as applications distributed over the whole world.

The cloud is a computer, no different in theory than the device you're reading this article on, but very different in construction. For instance, you don't own the cloud. You might wonder how such a concept can possibly be compatible with the idea of open source and free software, methods of computing in which the user famously owns the software they run. Surely you can't own software when you don't even own the device it's installed on?

### Open source and the cloud

For several years now, the Internet has been something of a software neutral zone. The model of the Internet isn't the same as "traditional" software in which there's a one-to-one, or maybe a one-per-family, relationship between the app and the user. The Internet is built of servers, which run services intended for multiple users. You sign up for an account on a site, and, in the best-case scenario, you more or less "own" your user account and data, but you don't own the site. You can't stop your Internet service and bring up the website on your computer. The software "lives" on a server somewhere. Even when the software is open source, such as WordPress or Drupal, and even if you download it and install it locally on your own computer, you still don't possess the instance you created an account on.

For this reason, even users very conscious of the threat of non-open software tend to overlook the question of software on the Internet. It can be increasingly difficult to recognize the importance of open source when even popular open source projects are hosted on Github (which uses a non-open web stack), Slack, or Discord instead of [Mattermost][2] or [Matrix][3] for chat; Google Docs instead of [Etherpad][4] for collaboration; Trello instead of [Phabricator][5] for [project management][6]; Jira for bug tracking; Gmail for communication, and so on. For as much as open source has won within software development and server hosting, it seems to willingly lock itself inside proprietary infrastructure.

### Why the cloud is so powerful

The problem doesn't end with infrastructure. The reason open source projects are locking themselves into proprietary systems for support is that the cloud itself is the computer, and the computer powered by the cloud is a lot more powerful than any developer's workstation. Not only does it have more processing power, but it also has a greater reach. An application you develop to run on the cloud can serve millions of users without even one of them having to figure out how to download and install anything. Your users just launch a browser and use your app, on any device, without even worrying about whether their device is powerful enough for the task they need to be done.

The cloud just makes sense, for computation, for delivery, and even for marketing. The problem is, it doesn't make any sense for open source. And that's why the cloud is no longer enough. The cloud needs to be upgraded to an open hybrid cloud.

### What is an open hybrid cloud?

When people talked about "the cloud" many years ago, it referred to the network serving as the computer. It was even then an old idea, but it was only just being realized. But because the network was the computer, the natural and correct assumption was that most users wouldn't own the computer; they'd only log in with client machines. And that's exactly the form it has taken—you own a device that browses to a cloud owned by Google, Microsoft, or Amazon.

This came to be known as the public cloud because the infrastructure running the cloud is available to the general public. You can buy time on several public clouds, interact with it through Kubernetes, and develop apps for Linux containers.

It didn't take long for individual companies to build private clouds—an infrastructure available only to their employees and clients. This ensured that important data remained under their control, and it often cost less than buying time on someone else's infrastructure.

A hybrid cloud combines these two concepts—you maintain a private cloud for your own use, and you use a public cloud to provide services you can't run only privately. An open hybrid cloud is a hybrid cloud built on open source, whether it's OKD, OpenShift, Kubernetes, RHEL, Debian, Alpine, Podman, Docker, Ansible, or custom scripts.

### Getting an open hybrid cloud

The cloud is powerful, so it stands to reason that it can actually help solve a little problem like ensuring user independence. It doesn't happen overnight, though, and the proprietary cloud is already entrenched in services used by millions. So, as an open source enthusiast, what can you do to promote the open hybrid cloud?

### Don't settle for closed clouds

If you're a developer, seek out an open hybrid cloud when you're looking for a platform to build upon. If you can't find one within your price range and you can't build a small one, then support open stacks. Look at the services your project relies upon and make sure you can reimplement the stack, should you need to.

### Use open source online

As a user, look for [federated systems][7] for social media, and look for open source platforms like WordPress, Drupal, Nextcloud, Etherpad, EtherCalc, and others, for online collaboration. You're not running the instance you're using, but at least you know that the code is auditable and that you're not supporting an environment that forces developers to contribute to proprietary software.

### Data liberation

Whether or not the environment is open source, ensure that important data is secure and can be exported. We're well into the 21st century, so there's no excuse for a website to gather data about without proper encryption and no excuse to withhold your data from you. You should be able to export anything you put _into_ a site for your own backups.

### Be open

In an open hybrid cloud, you own your development environment and your data, and you maintain your autonomy the same way you do with a laptop running [Linux][8] or [BSD][9]. Cloud computing is the future. Let's work together to make sure the future is open.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/keep-cloud-open

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-cloud.png?itok=vz0PIDDS (Sky with clouds and grass)
[2]: http://mattermost.com
[3]: http://matrix.org
[4]: http://etherpad.org
[5]: https://www.phacility.com/phabricator/
[6]: https://opensource.com/alternatives/trello
[7]: https://opensource.com/article/17/4/guide-to-mastodon
[8]: https://opensource.com/resources/linux
[9]: https://opensource.com/article/20/5/furybsd-linux
