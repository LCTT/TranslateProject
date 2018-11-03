Translating by FelixYFZ
5 steps to building a cloud that meets your users' needs
构建满足客户需求的一套云环境的5个步骤
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook2016_cloud_cc.png?itok=XSV7yR9e)
This article was co-written with [Ian Tewksbury][1].
这篇文是和[Ian Teksbury][1]共同完成的。
However you define it, a cloud is simply another tool for your users to perform their part of your organization's value stream. It can be easy when talking about any new paradigm or technology (the cloud is arguably both) to get distracted by the shiny newness of it. Conversations can quickly devolve into feature wish lists set off by a series of never-ending questions, all of which you probably have already considered:
无论你如何定义，云就是你的用户展现组织价值的另一个工具。当谈论新的范例或者技术的时候是很容易被，(云是两者兼有)它的新特性所分心。由一系列无止境的问题引发的对话能够很快的被发展为工能愿景清单，所有的这些多是你可能已经考虑到的。
  * Will it be public, private, or hybrid?
  * 是公有云，私有云还是混合云？
  * Will it use virtual machines or containers, or both?
  * 将会使用虚拟机还是容器，或者是两者？
  * Will it be self-service?
  * 将会提供自助服务吗？
  * Will it be fully automated from development to production, or will it have manual gates?
  * 将会完全自动的从开发转移到生产，还是它将需要手动操作？
  * How fast can we make it?
  * 我们能以多块的速度创建？
  * What about tool X, Y, or Z?
  * 关于工具X,Y,还有Z？



The list goes on.
这样的清单还可以列举很多。

The usual approach to beginning IT modernization, or digital transformation, or whatever you call it is to start answering high-level questions in the higher-level echelons of management. The outcome of this approach is predictable: failure. After extensively researching and spending months, if not years, deploying the fanciest new technology, the new cloud is never used and falls into disrepair until it is eventually scrapped or forgotten in the dustier corners of the datacenter and budget.
开始现代化，或者数字转型，无论你如何称呼的通常方法是开始回答高级管理层的一些高层次问题，这种方法的结果是可以预想到的：失败。经过大范围的调研并且花费
了数月的时间，如果不是几年，部署这个最炫的新技术，新的云技术从未被使用过而且陷入了荒废直到它最终被丢弃或者遗忘在数据中心的一角和预算中。
That's because whatever was delivered was not the tool the users wanted or needed. Worse yet, it likely was a single tool when users really needed a collection of tools that could be swapped out over time as newer, shinier, upgraded tools come along that better meet their needs.
因为无论你交付的是什么工具都不是用户所想要或者需要的。更加糟糕的是，当用户真正需要的是一个单独的工具时，一系列的工具就会被用户抛弃因为新的，闪光的
升级的工具能够更好的满足他们的需求。
### Focus on what matters
### 议题聚焦

The problem is focus, which has traditionally been on the tools. But the tools are not what add to your organization's value stream; end users making use of tools are what do that. You need to shift your focus from building your cloud—for example, the technology and the tools, to your people, your users.
问题是关注，传统一直是关注工具。但工具并不是要增加到组织价值中的东西；终端用户利用它做什么。你需要将你的注意力从创建云(列入技术和工具)转移到你的人员和用户身上。
Beyond the fact that users using tools (not the tools themselves) are what drive value, there are other reasons to focus attention on the users. The tools are for the users to use to solve their problems and allow them to create value, so it follows that if those tools don't meet those users' needs, then those tools won't be used. If you deliver tools that your users don't like, they won't use them. This is natural human behavior.
事实上，使用工具的用户(而不是工具本身)是驱动价值的因素，聚焦注意力在用户身上也是由其他原因的。工具是给用户使用去解决他们的问题并允许他们创造价值的，
所有这就导致了如果那些工具不能满足那些用户的需求，那么那些工具将不会被使用。如果你交付给你的用户的工具并不是他们喜欢的，他们将不会使用，这就是人类的
行为。
The IT industry got away with providing a single solution to users for decades because there were only one or two options, and the users had no power to change that. That is no longer the case. We now live in the world of technological choice. It is no longer acceptable to users to not be given a choice; they have choices in their personal technological lives, and they expect it in the workplace, too. Today's users are educated and know there are better options than the ones you've been providing.
数十年来，IT产业只为用户提供一种解决方案，因为仅有一个或两个选项，用户是没有权力去改变的。现在情况已经不同了。我们现在生活在一个技术选择的世界中。
不给用户一个选择的机会的情况将不会被接受的；他们在个人的科技生活中由选择，同时希望在工作中也有选择。现在的用户都是受过教育的并且知道将会有比你提供的机会更好的选择。
As a result, outside the most physically secure locations, there is no way to stop them from just doing what they want, which we call "shadow IT." If your organization has such strict security and compliance polices that shadow IT is impossible, many of your best people will grow frustrated and leave for other organizations that offer them choices.
因此，在物理上的最安全的地点之外，没有能够阻止他们只做他们自己想要的东西的方法，我们称之为“影子IT。”如果你的组织由如此严格的安全策略和承诺策略，许多员工将会感到灰心丧气并且会离职去其他能提供更好机会的公司。
For all of these reasons, you must design your expensive and time-consuming cloud project with your end user foremost in mind.
基于以上所有的原因，你必须牢记要首要和你的终端用户设计你的昂贵又费时的云项目。
### Five-step process to build a cloud for users' needs

Now that we know the why, let's talk about the how. How do you build a cloud for the end user? How do you start refocusing your attention from the technology to the people using that technology?

Through experience, we've learned that the best approach involves two things: getting constant feedback from your users, and building things iteratively.

Your cloud environment will continually evolve with your organization. The following five-step process will help you create a cloud that meets your users' needs.

#### 1\. Identify who your users will be.

Before you can start asking users questions, you first must identify who the users of your new cloud will be. They will likely include developers who build applications on the cloud; the operations team who will operate, maintain, and likely build the cloud; and the security team who protects your organization. For the first iteration, scope down your users to a smaller group so you're less overwhelmed by feedback. Ask each of your identified user groups to appoint two liaisons (a primary and a secondary) who will represent their team on this journey. This will also keep your first delivery small in both size and time.

#### 2\. Talk to your users face-to-face to get valuable input.

The best way to get users' feedback is through direct communication. Mass emails asking for input will self-select respondents—if you even get a response. Group discussions can be helpful, but people tend to be more candid when they have a private, attentive audience.

Schedule in-person, individual meetings with your first set of users to ask them questions like the following:

  * What do you need in order to accomplish your tasks?
  * What do you want in order to accomplish your tasks?
  * What is your current, most annoying technological pain?
  * What is your current, most annoying policy or procedural pain?
  * What ideas do you have to address any of your needs, wants, or pains?



These questions are guidelines and not ideal for every organization. They should not be the only questions you ask, and they should lead to further discussion. Be sure to tell people that anything said or asked is taken as feedback, and all feedback is helpful, whether positive or negative. The outcome of these conversations will help set your development priorities.

Gathering this level of personalized feedback is another reason to keep your initial group of users small: It takes a lot of time to sit down with each user, but we have found it is absolutely worth the investment.

#### 3\. Design and deliver your first iteration of the solution.

Once you've collected feedback from your initial users, it is time to design and deliver a piece of functionality. We do not recommend trying to deliver the entire solution. The design and delivery phase should be short; this is to avoid making the huge mistake of spending a year building what you think is the correct solution, only to have your users reject it because it isn't beneficial to them. The specific tools you choose for building your cloud will depend on your organization and its specific needs. Just make sure that the solution you build is based on your users' feedback and that you deliver it in small chunks to solicit feedback from them as often as possible.

#### 4\. Ask users for feedback on the first iteration.

Great, now you've designed and delivered the first iteration of your fancy new cloud to your end users! You didn't spend a year doing it but instead tackled it in small pieces. Why is it important to do things in small chunks? It's because you're going back to your user groups and collecting feedback about your design and delivery. What do they like? What don't they like? Did you properly address their concerns? Is the technology great, but the process or policy side of the system still lacking?

Again, the questions you'll ask depend on your organization; the key here is to continue the discussions from the earlier phases. You're building this cloud for users after all, so make sure it's useful for them and a productive use of everyone's time.

#### 5\. Return to step 1.

This is an iterative process. Your first delivery should have been quick and small, and all future iterations should be, too. Don't expect to be able to follow this process once, twice, or even three times and be done. As you iterate, you will introduce more users and get better at the process. You will get more buy-in from users. You will be able to iterate faster and more reliably. And, finally, you will change your process to meet your users' needs.

Users are the most important part of this process, but the iteration is the second most important part because it allows you to keep going back to the users and getting more information. Throughout each phase, take note of what worked and what didn't. Be introspective and honest with yourself. Are we providing the most value possible for the time we spent? If not, try something different in the next phase. The great part about not spending too much time in each cycle is that, if something doesn't work this time, you can easily tweak it for next time, until you find an approach that works for your organization.

### This is just the beginning

Through many customer engagements, feedback gathered from users, and experiences from peers in the field, we've found time and time again that the most important thing you can do when building a cloud is to talk to your users. It seems obvious, but it is surprising how many organizations will go off and build something for months or years, then find out it isn't even useful to end users.

Now you know why you should keep your focus on the end users and have a process for building a cloud with them at the center. The remaining piece is the part that we all enjoy, the part where you go out and do it.

This article is based on "[Design your hybrid cloud for the end user—or fail][2]," a talk the authors will be giving at [Red Hat Summit 2018][3], which will be held May 8-10 in San Francisco.

[Register by May 7][3] to save US$ 500 off of registration. Use discount code **OPEN18** on the payment page to apply the discount.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/5-steps-building-your-cloud-correctly

作者：[Cameron Wyatt][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/cameronmwyatt
[1]:https://opensource.com/users/itewk
[2]:https://agenda.summit.redhat.com/SessionDetail.aspx?id=154225
[3]:https://www.redhat.com/en/summit/2018
