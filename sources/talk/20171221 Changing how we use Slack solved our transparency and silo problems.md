Changing how we use Slack solved our transparency and silo problems
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open_abstract_pieces.jpg?itok=tGR1d2MU)

Collaboration and information silos are a reality in most organizations today. People tend to regard them as huge barriers to innovation and organizational efficiency. They're also a favorite target for solutions from software tool vendors of all types.

Tools by themselves, however, are seldom (if ever), the answer to a problem like organizational silos. The reason for this is simple: Silos are made of people, and human dynamics are key drivers for the existence of silos in the first place.

So what is the answer?

Successful communities are the key to breaking down silos. Tools play an important role in the process, but if you don't build successful communities around those tools, then you'll face an uphill battle with limited chances for success. Tools enable communities; they do not build them. This takes a thoughtful approach--one that looks at culture first, process second, and tools last.

Successful communities are the key to breaking down silos.

However, this is a challenge because, in most cases, this is not the way the process works in most businesses. Too many companies begin their journey to fix silos by thinking about tools first and considering metrics that don't evaluate the right factors for success. Too often, people choose tools for purely cost-based, compliance-based, or effort-based reasons--instead of factoring in the needs and desires of the user base. But subjective measures like "customer/user delight" are a real factor for these internal tools, and can make or break the success of both the tool adoption and the goal of increased collaboration.

It's critical to understand the best technical tool (or what the business may consider the most cost-effective) is not always the solution that drives community, transparency, and collaboration forward. There is a reason that "Shadow IT"--users choosing their own tool solution, building community and critical mass around them--exists and is so effective: People who choose their own tools are more likely to stay engaged and bring others with them, breaking down silos organically.

This is a story of how Autodesk ended up adopting Slack at enterprise scale to help solve our transparency and silo problems. Interestingly, Slack wasn't (and isn't) an IT-supported application at Autodesk. It's an enterprise solution that was adopted, built, and is still run by a group of passionate volunteers who are committed to a "default to open" paradigm.

Utilizing Slack makes transparency happen for us.

### Chat-tastrophe

First, some perspective: My job at Autodesk is running our [Open@ADSK][1] initiative. I was originally hired to drive our open source strategy, but we quickly expanded my role to include driving open source best practices for internal development (inner source), and transforming how we collaborate internally as an organization. This last piece is where we pick up our story of Slack adoption in the company.

But before we even begin to talk about our journey with Slack, let's address why lack of transparency and openness was a challenge for us. What is it that makes transparency such a desirable quality in organizations, and what was I facing when I started at Autodesk?

Every company says they want "better collaboration." In our case, we are a 35-year-old software company that has been immensely successful at selling desktop "shrink-wrapped" software to several industries, including architecture, engineering, construction, manufacturing, and entertainment. But no successful company rests on its laurels, and Autodesk leadership recognized that a move to Cloud-based solutions for our products was key to the future growth of the company, including opening up new markets through product combinations that required Cloud computing and deep product integrations.

The challenge in making this move was far more than just technical or architectural--it was rooted in the DNA of the company, in everything from how we were organized to how we integrated our products. The basic format of integration in our desktop products was file import/export. While this is undoubtedly important, it led to a culture of highly-specialized teams working in an environment that's more siloed than we'd like and not sharing information (or code). Prior to the move to a cloud-based approach, this wasn't as a much of a problem--but, in an environment that requires organizations to behave more like open source projects do, transparency, openness, and collaboration go from "nice-to-have" to "business critical."

Like many companies our size, Autodesk has had many different collaboration solutions through the years, some of them commercial, and many of them home-grown. However, none of them effectively solved the many-to-many real-time collaboration challenge. Some reasons for this were technical, but many of them were cultural.

I relied on a philosophy I'd formed through challenging experiences in my career: "Culture first, tools last."

When someone first tasked me with trying to find a solution for this, I relied on a philosophy I'd formed through challenging experiences in my career: "Culture first, tools last." This is still a challenge for engineering folks like myself. We want to jump immediately to tools as the solution to any problem. However, it's critical to evaluate a company's ethos (culture), as well as existing processes to determine what kinds of tools might be a good fit. Unfortunately, I've seen too many cases where leaders have dictated a tool choice from above, based on the factors discussed earlier. I needed a different approach that relied more on fitting a tool into the culture we wanted to become, not the other way around.

What I found at Autodesk were several small camps of people using tools like HipChat, IRC, Microsoft Lync, and others, to try to meet their needs. However, the most interesting thing I found was 85 separate instances of Slack in the company!

Eureka! I'd stumbled onto a viral success (one enabled by Slack's ability to easily spin up "free" instances). I'd also landed squarely in what I like to call "silo-land."

All of those instances were not talking to each other--so, effectively, we'd created isolated islands of information that, while useful to those in them, couldn't transform the way we operated as an enterprise. Essentially, our existing organizational culture was recreated in digital format in these separate Slack systems. Our organization housed a mix of these small, free instances, as well as multiple paid instances, which also meant we were not taking advantage of a common billing arrangement.

My first (open source) thought was: "Hey, why aren't we using IRC, or some other open source tool, for this?" I quickly realized that didn't matter, as our open source engineers weren't the only people using Slack. People from all areas of the company--even senior leadership--were adopting Slack in droves, and, in some cases, convincing their management to pay for it!

My second (engineering) thought was: "Oh, this is simple. We just collapse all 85 of those instances into a single cohesive Slack instance." What soon became obvious was that was the easy part of the solution. Much harder was the work of cajoling, convincing, and moving people to a single, transparent instance. Building in the "guard rails" to enable a closed source tool to provide this transparency was key. These guard rails came in the form of processes, guidelines, and community norms that were the hardest part of this transformation.

### The real work begins

As I began to slowly help users migrate to the common instance (paying for it was also a challenge, but a topic for another day), I discovered a dedicated group of power users who were helping each other in the #adsk-slack-help channel on our new common instance of Slack. These power users were, in effect, building the roots of our transparency and community through their efforts.

The open source community manager in me quickly realized these users were the path to successfully scaling Slack at Autodesk. I enlisted five of them to help me, and, together we set about fabricating the community structure for the tool's rollout.

We did, however, learn an important lesson about transparency and company culture along the way.

Here I should note the distinction between a community structure/governance model and traditional IT policies: With the exception of security and data privacy/legal policies, volunteer admins and user community members completely define and govern our Slack instance. One of the keys to our success with Slack (currently approximately 9,100 users and roughly 4,300 public channels) was how we engaged and involved our users in building these governance structures. Things like channel naming conventions and our growing list of frequently asked questions were organic and have continued in that same vein. Our community members feel like their voices are heard (even if some disagree), and that they have been a part of the success of our deployment of Slack.

We did, however, learn an important lesson about transparency and company culture along the way.

### It's not the tool

When we first launched our main Slack instance, we left the ability for anyone to make a channel private turned on. After about three months of usage, we saw a clear trend: More people were creating private channels (and messages) than they were public channels (the ratio was about two to one, private versus public). Since our effort to merge 85 Slack instances was intended to increase participation and transparency, we quickly adjusted our policy and turned off this feature for regular users. We instead implemented a policy of review by the admin team, with clear criteria (finance, legal, personnel discussions among the reasons) defined for private channels.

This was probably the only time in this entire process that I regretted something.

We took an amazing amount of flak for this decision because we were dealing with a corporate culture that was used to working in independent units that had minimal interaction with each other. Our defining moment of clarity (and the tipping point where things started to get better) occurred in an all-hands meeting when one of our senior executives asked me to address a question about Slack. I stood up to answer the question, and said (paraphrased from memory): "It's not about the tool. I could give you all the best, gold-plated collaboration platform in existence, but we aren't going to be successful if we don't change our approach to collaboration and learn to default to open."

I didn't think anything more about that statement--until that senior executive starting using the phrase "default to open" in his slide decks, in his staff meetings, and with everyone he met. That one moment has defined what we have been trying to do with Slack: The tool isn't the sole reason we've been successful; it's the approach that we've taken around building a self-sustaining community that not only wants to use this tool, but craves the ability it gives them to work easily across the enterprise.

### What we learned

The tool isn't the sole reason we've been successful; it's the approach that we've taken around building a self-sustaining community that not only wants to use this tool, but craves the ability it gives them to work easily across the enterprise.

I say all the time that this could have happened with other, similar tools (Hipchat, IRC, etc), but it works in this case specifically because we chose an approach of supporting a solution that the user community adopted for their needs, not strictly what the company may have chosen if the decision was coming from the top of the organizational chart. We put a lot of work into making it an acceptable solution (from the perspectives of security, legal, finance, etc.) for the company, but, ultimately, our success has come from the fact that we built this rollout (and continue to run the tool) as a community, not as a traditional corporate IT system.

The most important lesson I learned through all of this is that transparency and community are evolutionary, not revolutionary. You have to understand where your culture is, where you want it to go, and utilize the lever points that the community is adopting itself to make sustained and significant progress. There is a fine balance point between an anarchy, and a thriving community, and we've tried to model our approach on the successful practices of today's thriving open source communities.

Communities are personal. Tools come and go, but keeping your community at the forefront of your push to transparency is the key to success.

This article is part of the [Open Organization Workbook project][2].

--------------------------------------------------------------------------------

via: https://opensource.com/open-organization/17/12/chat-platform-default-to-open

作者：[Guy Martin][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/guyma
[1]:mailto:Open@ADSK
[2]:https://opensource.com/open-organization/17/8/workbook-project-announcement
