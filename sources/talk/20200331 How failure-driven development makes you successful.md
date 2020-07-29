[#]: collector: (lujun9972)
[#]: translator: (JonnieWayy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How failure-driven development makes you successful)
[#]: via: (https://opensource.com/article/20/3/failure-driven-development)
[#]: author: (Jessica Cherry https://opensource.com/users/jrepka)

How failure-driven development makes you successful
======
I'm the picture in the dictionary next to the word "failure"—and that's
why I'm good at my job.
![failure sign at a party, celebrating failure][1]

My job title is senior software engineer, but that's not what my closest co-workers call me. They call me "Cherrybomb" because of all the things I blow up. My regularly scheduled failures have been tracked down to our quarterly earnings and outage times. Literally, I am the production disaster you read about that says, "what not to do ever, in any case, at any time."

I started my career at a helpdesk where I wrote loops that wrecked servers in high-end companies. I have taken production applications down for up to eight hours without warning, and I have destroyed endless numbers of clusters in an attempt to make things better—and a couple just because I mistyped something.

I am the reason we have disaster recovery (DR) clusters in [Kubernetes][2]. I am the chaos engineer that, without warning, teaches people how to act and troubleshoot quickly when we have an application that has never been tested for an outage recovery plan. I exist as the best example of failure possible, and it's actually the coolest thing ever.

### Jess and the disappearing K8s clusters

One of my official responsibilities involves our application architecture. For any sort of architectural change, I get to make and test the code and see what is possible. Recently, this has been an epic pain in my bosses' side, to put it gently.

We run most of our infrastructure on Kubernetes, which is known for its resiliency. Despite that reputation, I managed to make two clusters just, well, disappear. You may be wondering how I could do that; it's pretty easy: **terraform destroy**. We manage our infrastructure as code through [Terraform][3], and it won't take any knowledge of the software to know that **destroy** can do something bad. Before you panic, it was the dev clusters, so life went on.

In light of this, it's reasonable to ask why I am still employed—and why am I writing about this. Those are easy to answer: I'm still employed because my infrastructure code updates work better and faster than the code we started with. And am I writing about this because everyone fails regularly; it is so very, very normal. If you're not failing regularly, I don't think you're trying hard enough to learn.

### Break things and train people

You'd also think no one would let me train anyone ever; that it's the worst idea ever because (as my team jokes) you should never, ever do the things I do. However, my boss has me train anyone walking in the door pretty regularly. I even provide training for entire teams using our infrastructure or code to teach people how to build their own infrastructure.

Here's why: Failure is your first step to success. Failure's lesson isn't just "backups are a fantastic idea." No, from failure, you learn to recover faster, troubleshoot quicker, and get amazingly better at your job. When you get amazing at your job, you can train others about what not to do and help them understand how everything works. Because of your experience, they will be a step ahead of you were when you started—and they, too, will most likely fail in new, amazing, epic ways that everyone can learn from.

### You are only as good as your failures

Nobody is born with talent in software engineering and cloud infrastructure, just like no one is born walking. We all start by rolling and bumping into things. From there, we learn to crawl and then stand for a moment or two. When we start walking, we fall and scratch our knees, bump our elbows, and—at least in my brother's case—walk right into a table's sharp corner and get stitches in the center of your eyebrow.

Things take time to learn. Read everything you can get your hands on to help you along your way—but that is always the beginning. Perfection is some fantasy that's impossible to achieve; you must fail to reach success.

Every step of the way, my failures teach me how to do things better.

Ultimately, you are only as good as the sum of your failures, because that's what shows you how successful you are.

Open source is about more than the code, it’s about the culture. The open culture that many open...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/failure-driven-development

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jrepka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_failure_celebrate.png?itok=LbvDAEZF (failure sign at a party, celebrating failure)
[2]: https://www.redhat.com/en/topics/containers/what-is-kubernetes
[3]: https://github.com/hashicorp/terraform
