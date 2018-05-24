Person with diabetes finds open source and builds her own medical device
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/health_heartbeat.png?itok=P-GXea-p)
Dana Lewis is the 2018 Women in [Open Source Community Award][1] winner! Here is her story about how open source improved her health in a big way.

Dana has Type 1 diabetes and commercially available medical devices were failing her. The continuous glucose monitor (CGM) alarm she was using to manage her blood sugar was not loud enough to wake her up. The product design put her in danger every time she went to sleep.

"I went to a bunch of manufacturers and asked what they could do, and I was told, 'It’s loud enough for most people.' I was told that 'it’s not a problem for most people, and we're working on it. It'll be out in a future version.’' That was all really frustrating to hear, but at the same time, I didn’t feel like I could do anything about it because it’s an FDA-approved medical device. You can’t change it."

These obstacles aside, Dana thought that if she could get her data from the device, she could use her phone to make a louder alarm. Toward the end of 2013, she saw a tweet that provided an answer to her problem. The author of the tweet, who is the parent of a child with diabetes, had reverse-engineered a CGM to get the data off his child’s device so that he could monitor his child’s blood sugar remotely.

She realized that if he was willing to share, she could use the same code to build a louder alarm system.

"I didn’t understand that it was perfectly normal to ask people to share code. That was my first introduction to open source."

The system evolved from a louder alarm to a web page where she could share data with her loved ones. Together with her now-husband, Scott Leibrand, she iteratively added features to the page, eventually including an algorithm that could not only monitor glucose levels in real time but also proactively predict future highs and lows.

As Dana got more involved with the open source diabetes community, she met Ben West. He had spent years figuring out how to communicate with the insulin pump Dana used. Unlike a CGM, which tells the user if their blood sugar is high or low, an insulin pump is a separate device used to continuously infuse insulin throughout the day.

"A light bulb went off. We said, 'Oh, if we take this code to communicate with the pump with what we’ve done to access the data from the CGM in real time and our algorithm, we can actually process data from both devices in real time and create a closed-loop system.'"

The result was a do-it-yourself artificial pancreas system (DIY APS).

Using the algorithm to process data from the insulin pump and CGM, the DIY APS forecasts predicted blood glucose levels and automates adjustments to the insulin delivery, making small changes to keep blood sugar within the target range. This makes life much easier for people with diabetes because they no longer have to calibrate insulin delivery manually several times per day.

"Because we had been using open source software, we knew that the right thing to do was to turn around and make what we had done open source as well so that other people could leverage it." And thus, OpenAPS (the Open Source Artificial Pancreas System) was born.

The OpenAPS community has since grown to more than 600 users of various DIY "closed-loop" systems. OpenAPS contributors have embraced the hashtag #WeAreNotWaiting as a mantra to express their belief that patient communities should not have to wait for the healthcare industry to create something that works for them.

"Yes, you may choose to adopt a commercial solution in the future—that’s totally fine, and you should have the freedom do to that. Waiting should be a choice and not the status quo. To me, what’s amazing about this movement of open source in healthcare is that waiting is now a choice. You can choose not to DIY. You can choose to wait for a commercial solution. But if you don’t want to wait, you don’t have to. There are a plethora of options to take advantage of. A lot of problems have been solved by people in the community."

The OpenAPS community is made up of people with diabetes, their loved ones, parents of children with diabetes, and people who want to use their skills for good. By helping lead the community, Dana has learned about the many ways of contributing to an open source project. She sees many valuable contributions to OpenAPS come from non-technical contributors on Facebook or [Gitter][2].

"There are a lot of different ways that people contribute, and it’s important that we recognize all of those because they’re all equally valuable. And they often involve different interests and different skill sets, but together, that’s what makes a community project in open source succeed."

She knows firsthand how discouraging it can be for contributions to go unrecognized by others in a community. She also isn’t shy about discussing people’s tendency to discount the contributions of women. She first wrote about her experience being treated differently in a [2014 blog post][3] and [reflected on it again][4] when she learned she was a Women in Open Source Award finalist.

In her first blog post, she and Scott shared the differences in the way they were treated by members of the community. They both noticed that, in subtle ways, Dana was constantly battling to be taken seriously. People often directed technical questions to him instead of her, even after Scott tried to redirect them to Dana. By calling out these behaviors, the post opened up a highly productive discussion in the community.

"People would talk about the project initially as 'Scott’s thing' instead of 'Dana and Scott’s thing.' It was death by a thousand paper cuts in terms of frustration. I wrote the blog post to call it out. I said, 'Look, for some of you it’s conscious, but for some of you, it’s unconscious. We need to think that if we want this community to grow and support and allow many diverse participants, we need to talk about how we’re behaving.' To their credit, a lot of people in the community stopped and had serious conversations. They said, 'OK, here’s what I’m going to do to change. Call me out if I do it unconsciously.' It was phenomenal."

She added that if it weren’t for the support of Scott as another active developer in the community, as well as that of other women in the community she could talk to and get encouragement from, she might have stopped.

"I think that might have totally changed what happened in diabetes in open source if I had just thrown up my hands. I know that happens to other people, and it’s unfortunate. They leave open source because they don’t feel welcome or valued. My hope is that we continue to have the conversation about it and recognize that even if you’re not consciously trying to discourage people, we can all always do better at being more welcoming and engaging and recognizing contributions."

Communication and sharing about OpenAPS are examples of non-technical contributions that have been critical to the success of the community. Dana’s background in public relations and communications certainly contributed to getting the word out. She has written and spoken extensively about the community on the [DIYPS blog][5], in a [TEDx Talk][6], at [OSCON][7], and more.

"Not every project that is really impactful to a patient community has made it into the mainstream the way OpenAPS has. The diabetes community has done a really good job communicating about various projects, which brings more people with diabetes in and also gets the attention of people who want to help."

Her goal now is to help bring to light to other patient community projects. Specifically, she wants to share tools or skills community members have learned with other patient communities looking to take projects to the next level, facilitate research, or work with companies.

"I also realize that a lot of patients in these projects are told, 'You should patent that. You should create a company. You should create a non-profit.' But all those are huge things. They’re very time-consuming. They take away from your day job or require you to totally switch professions. People like me, we don’t always want to do that, and we shouldn’t have to do that in order to scale projects like this and help other people."

To this end, she also wants to find other pathways people can take that aren’t all-consuming—for example, writing a children’s book. Dana took on this challenge in 2017 to help her nieces and nephews understand their aunt’s diabetes devices. When her niece asked her what "the thing on her arm was" (her CGM), she realized she didn’t have a point of reference to explain to a young child what it meant to be a person with diabetes. Her solution was [Carolyn’s Robot Relative][8].

"I wanted to talk to my nieces and nephews in a way that was age-appropriate that also normalizes that people are different in different ways. I was like, 'I wish there was a kid’s book that talks about this. Well, why don’t I write my own?'"

She wrote the book and published it on Amazon because true to her open source values, she wanted it to be available to others. She followed up by also writing a [blog post about self-publishing a book on Amazon][9] in the hopes that others would publish books that speak to their own experiences.

Books like Carolyn’s Robot Relative and awards like the Women in Open Source Award speak to the greater need for representation of different kinds of people in many areas of life, including open source.

"Things are always better when the communities are more diverse."

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/dana-lewis-women-open-source-community-award-winner-2018

作者：[Taylor Greene][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/tgreene
[1]:https://www.redhat.com/en/about/women-in-open-source
[2]:https://gitter.im/
[3]:https://diyps.org/2014/08/25/being-female-a-patient-and-co-designing-diyps-means-often-being-discounted/
[4]:https://diyps.org/2018/02/01/women-in-open-source-make-a-difference/
[5]:https://diyps.org/
[6]:https://www.youtube.com/watch?v=kgu-AYSnyZ8
[7]:https://www.youtube.com/watch?v=eQGWrdgu_fE
[8]:https://www.amazon.com/gp/product/1977641415/ref=as_li_tl?ie=UTF8&tag=diyps-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1977641415&linkId=96bb65e21b5801901586e9fabd12c860
[9]:https://diyps.org/2017/11/01/makers-gonna-make-a-book-about-diabetes-devices-kids-book-written-by-danamlewis/
