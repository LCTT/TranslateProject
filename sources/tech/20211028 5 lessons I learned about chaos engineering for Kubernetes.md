[#]: subject: "5 lessons I learned about chaos engineering for Kubernetes"
[#]: via: "https://opensource.com/article/21/10/chaos-engineering-kubernetes-ebook"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 lessons I learned about chaos engineering for Kubernetes
======
To ensure that you're breaking things responsibly and intelligently,
download our new eBook about chaos engineering for Kubernetes.
![Scrabble letters spell out chaos for chaos engineering][1]

Kubernetes is a complex framework for a complex job. Managing several containers can be complicated, and managing hundreds and thousands of them is essentially just not humanly possible. Kubernetes makes highly available and highly scaled cloud applications a reality, and it usually does its job remarkably well. However, people don't tend to notice the days and months of success. Months and years of smooth operation aren't the things that result in phone calls at 2 AM. In IT, it's the failures that count. And unfortunately, failures don't run on a schedule.

[Jessica Cherry's][2] new eBook, **[Chaos engineering for Kubernetes][3]**, introduces several concepts about how system engineers can help test the robustness of the systems they've designed. Surprisingly, a big part of it is failure. Here are the top five lessons I've learned from Cherry's book.

### Intentional failure is part of success

It doesn't matter that you've done everything right. You've purchased bespoke hardware for the job, you've installed a stable distribution, purchased support, read the fine manuals, documented your process, automated recovery, made backups, and on and on. After all the prep work, there's only one thing you can be sure about: Something will go wrong eventually.

It's not morbid to think that way because it's just what happens in technological and mechanical systems. Things fail.

You can't stop things from failing, but you can _make_ them fail when it's convenient to you. Unfortunately, forcing a failure on your system doesn't "use up" all of your allotted failures for the year. Things will still fail unexpectedly, but by causing failure according to your own schedule, you ensure that you have the resources and knowledge you need to fix problems.

### Randomized failure is part of resiliency

You're not the only who needs to know how to handle failure. Your infrastructure needs to be able to withstand failure, too. While you can test some of this with scheduled failures, randomness helps ensure resiliency. After all, some failures will happen when you're not around to ensure that everything else still functions. Ideally, you want to develop the peace of mind that something could break without you ever knowing about it (but you will know about it eventually because you're monitoring your cluster. You are monitoring your cluster, right?).

### Resiliency needs to happen in many places

I'll never forget the first large-scale (200 users was large-scale for me, then) shared file server. It had an LVM pool of storage with plenty of space for additional hard drives, battery backup, a robust SAMBA back-end, an AMANDA-based backup routine, a fallback network, and easy admin access both locally and remotely. The server didn't need constant availability, so I had plenty of time to test it during the week, but it did require availability at specific times during the workday. It was well-used, and I was justly proud of it for several months.

And then, one week, my file server ran out of hard drive space. No problem—I'd built it to have expandable storage, so it would be a simple matter of walking up to the server, sliding in a new drive, and continuing about my day. Except for one small glitch: The hard drives weren't hot-swappable on the hardware I'd purchased. (Who knew there were rack servers without hot-swappable drive bays?) The whole system had to be shut down for me to add storage to it, and of course, it happened on a Friday afternoon, when everybody's work was being rendered.

Lesson learned: Resiliency isn't a fixed point in time. You don't design a system to be perfect at one specific moment; you design it so it can fail at any moment.

It's hard to detect the weak spots in your design unless you cause failure at unexpected times and in unexpected places.

### Chaos strengthens order

I used to think that rigorous testing was a luxury. I thought it was something big teams could afford to do because they surely had dedicated QA people sitting in labs tinkering and disassembling carbon copies of what's in production.

As I had the privilege of working on larger and larger teams, though, I found that more people only means there's a greater _potential_ for tests to happen. It never guarantees that tests are actually getting done.

Chaos engineering is a practice anyone can adopt. Talk to your department, assemble a team, form a plan. Set up monitoring, make your cluster operation transparent, invite questions and challenges. Get a plan for formalized chaos engineering because Chaos strains Order and ultimately can make it stronger.

### Kubernetes can be surprisingly fun

People sometimes ask me what I do with my Raspberry Pi Kubernetes cluster. Admittedly, I don't personally run any vital services on my little open hybrid cloud. But as it turns out, there's a lot of fun to be had with a miniature super-computer (well, it's super to me, anyway.). Looking at pretty Grafana dashboards and playing Doom with pods are both fun, but so is the configuration, the challenge of testing my cluster's performance after a node's been suddenly removed from the network, trying to see how many times an SD card can survive improper removal (so far a lot, thanks probably to ext4), configuring two containers to interact with one another, coming to grips with the logical structures of namespaces and pods, and so on.

At the end of the day, Kubernetes has given me my own cloud, and I frankly enjoy having that kind of power at my fingertips.

Chaos engineering gives you permission to be a little wanton. It encourages you to be methodically reckless. And in the end, you get a more resilient system.

### Download the ebook

Of course, you can't just try to aimlessly destroy your own computer and call it chaos engineering. Without discipline, documentation, and mitigation, it's just chaos. To ensure that you're breaking things responsibly and intelligently, download **[Chaos engineering for Kubernetes][3]**. And then let slip the monkeys of chaos!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/chaos-engineering-kubernetes-ebook

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brett-jordan-chaos-unsplash.jpg?itok=sApp5dVd (Scrabble letters spell out chaos for chaos engineering)
[2]: https://opensource.com/users/cherrybomb
[3]: https://opensource.com/downloads/chaos-engineering-kubernetes
