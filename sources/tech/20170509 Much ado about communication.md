translating--geekpi

Much ado about communication
============================================================

### One of an open source project's first challenges is determining the best way for contributors to collaborate.


![Much ado about communication](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/rh_003601_05_mech_osyearbook2016_business_cc.png?itok=xZestz1h "Much ado about communication")
>Image by : Opensource.com

One of the first challenges an open source project faces is how to communicate among contributors. There are a plethora of options: forums, chat channels, issues, mailing lists, pull requests, and more. How do we choose which is the right medium to use and how do we do it right?

Sadly and all too often, projects shy away from making a disciplined decision and instead opt for "all of the above." This results in a fragmented community: Some people sit in Slack/Mattermost/IRC, some use the forum, some use mailing lists, some live in issues, and few read all of them.

This is a common issue I see in organizations I'm [working with to build their internal and external communities][2]. Which of these channels do we choose and for which purposes? Also, when is it OK to say no to one of them?

This is what I want to dig into here.

### Structured and unstructured

I have a tiny, peanut-sized brain in my head. Because of this, I tend to break problems down into smaller pieces so I can better understand them. Likewise, I tend to break different options in a scenario down into smaller thematic pieces to better understand their purpose. I take this approach with communication channels too.

I believe there are two broad categories of communication channels: structured and unstructured.

Structured channels have a very specific focus in each individual unit of communication. An example here is a GitHub/GitLab/Jira issue. An issue is a very specific piece of information that relates to a bug or feature. The discussion that cascades after the initial issue post is typically very focused on that specific topic and finding an outcome (such as a bugfix or a final plan for a feature). The outcome is then typically reflected in a status (e.g. "FIXED," "WONTFIX," or "INVALID"). This means you can understand the beginning and end of the communication without reading the pieces in between.

Likewise, pull/merge requests are structured. They are focused on a specific type (typically code) of contribution. After the initial pull/merge request, the discussion is very focused on an outcome: getting the contribution in shape to merge into the wider codebase.

Another example here is a StackOverflow/AskBot style Q&A post. These posts start with a question and are then edited and responded to in order to provide a concise answer to the question.

With each of these structured mechanisms there usually is little deviation from the structure. You never see people asking others how their kids/cats/dogs/family are doing in an issue, pull request, or Q&A topic. It is socially unacceptable to veer off topic, and that is part of the power of a structured medium: It is focused and (usually) efficient.

The inverse, unstructured media, include chat channels and forums. In these environments there is typically a theme (such as the topic of a channel or sub-forum), but conversations are much less tied to a specific outcome or conclusion and can often be more general in nature. As an example, in a developer mailing list you will get a mix of discussions including general questions, ideas for new features, architectural challenges, and discussions that relate to the operational running of the community itself. With each of these discussions it is imperative on the participants to keep the conversation focused, on topic, and productive. As you can imagine, this is often not the case, and these kinds of discussions can veer away from a productive outcome.

### The impact of recording

Aside from the subtle differences between structured and unstructured communication, the impact of what is recorded and how it can be searched plays a large role too.

Typically, all structured channels are recorded. People reference old bugs, questions from StackOverflow are reused over and over again. You can search for something, and even if there is lots of discussion, the issue, pull request, or question is usually updated to reflect the ultimate conclusion.

This is part of the point: We want to be able to quickly and easily dig up old issues/questions/pull requests/etc., link to them, and reference them. A key component here is that we convert this content into referenceable material that can be used to educate and inform people about previous knowledge. As our community grows, our structured communication becomes a corpus of knowledge that can inform the future from lessons in the past.

This gets murkier with unstructured communication. On one hand, forums are generally simple and effective to search, but they are of course filled with unstructured conversation, so the thing you are looking for might be buried inside a discussion. As an example, many communities use a forum as a support tool. While this is a more than capable platform, the problem is that the answer to a question may be response #16 or response #340 in a discussion. As we are bombarded with more and more sources of information (and in smaller pieces, such as Twitter), we have become increasingly impatient to reading through large swaths of material, and this can be problematic with an unstructured medium.

A particularly interesting case is real-time chat. Historically, IRC has paved the way for real-time chat for many years, and for most IRC users there was little (if any) notion of recording those discussions. Sure, some projects (such as Ubuntu) record IRC logs, but this is generally not a useful resource. As my pal Jeff Atwood said to me once: "If you have to search chat for something, you have already lost."

While IRC is limited in recording, Slack and Mattermost are better. Conversations are archived, but the point still typically stands: Why would you want to search through large bodies of conversation to find a point that someone made? Other channels are far better for referencing previous discussions.

This does create an interesting opportunity though. One consistent benefit that chat exhibits over all other media is how human it is. Structured channels, and even unstructured channels such as forums and mailing lists, rarely encourage off-the-cuff social discussion. Chat does. Chat is where you ask: "How was your weekend?" "Did you see the game?" and "Are you going to see Testament, Sepultura, and Prong next week?" (OK, maybe the last one is just me.)

So, while real-time discussion may be less effective in our corpus of previous collaboration, it does provide a vital glue in shaping relationships.

### Choose your poison

So, back to our original question for open source communities: Which of these do we pick?

While this answer will vary from project to project, I tend to think of this on two levels.

First, you should generally prioritize structured communication. This is where tangible work gets done: in bugs/issues, pull requests, in support Q&A discussions, etc. If you are tight on resources, focus your efforts on these channels: You can more easily draw a dotted line between the investment of time and money there and productive output in the community.

Second, if you are passionate about building a broader community that can focus on engineering, advocacy, translations, documentation, and more, explore whether bringing in unstructured channels makes sense. Community is not just about getting stuff done, it is also about building relationships and friendships, providing support to each other in our work, and helping people grow and flourish in our communities. Unstructured communication is a helpful tool in this.

Of course, I am merely scratching the surface of a large topic here, but I hope this provides a little clarity in how to assess and choose the value of communication channels. Remember, less is more here: Don't be tempted to defer the decision and provide all of the above; you will get a fragmented community that's just about as inviting as an empty restaurant.

May the force be with you, and be sure to let me know how you get on. I am always available through my [website][3] and at [jono@jonobacon.com][4].

--------------------------------------------------------------------------------

作者简介：

Jono Bacon - Jono Bacon is a leading community manager, speaker, author, and podcaster. He is the founder of Jono Bacon Consulting which provides community strategy/execution, developer workflow, and other services. He also previously served as director of community at GitHub, Canonical, XPRIZE, OpenAdvantage, and consulted and advised a range of organizations.

--------------------

via: https://opensource.com/article/17/5/much-ado-about-communication

作者：[ Jono Bacon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jonobacon
[1]:https://opensource.com/article/17/5/much-ado-about-communication?rate=fBsUIx1TCGIXAFnRdYGTUqSG1pMmMCpdhYlyrFtRLS8
[2]:http://www.jonobaconconsulting.com/
[3]:http://www.jonobacon.com/
[4]:mailto:jono@jonobacon.com
[5]:https://opensource.com/user/26312/feed
[6]:https://opensource.com/users/jonobacon
