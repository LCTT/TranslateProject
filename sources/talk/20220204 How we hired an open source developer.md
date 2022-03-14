[#]: subject: "How we hired an open source developer"
[#]: via: "https://opensource.com/article/22/2/how-we-hired-open-source-developer"
[#]: author: "Mike Bursell https://opensource.com/users/mikecamel"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How we hired an open source developer
======
My team opted out of the standard algorithm coding exercise for a
process that yielded more relevant results.
![people in different locations who are part of the same team][1]

As the CEO and co-founder of [Profian][2], a start-up security company, I've been part of our effort to hire developers to work on [Enarx][3], a security project that deals with confidential computing, written almost exclusively in [Rust][4] (with a bit of Assembly). Profian has now found all the people it was looking for in this search, with a couple of developers due to start in the next few weeks. However, new contributors are absolutely welcome to Enarx, and if things continue to go well, the company will definitely want to hire more folks in the future.

Hiring people is not easy, and Profian had a set of specialized requirements that made the task even more difficult. I thought it would be useful and interesting for the community to share how we approached the problem.

### What were we looking for?

These are the specialized requirements I'm talking about:

  * **Systems programming:** Profian mainly needs people who are happy programming at the systems layer. This is pretty far down the stack, with lots of interactions directly with hardware or the OS. To create client-server pieces, for instance, we have to write quite a lot of the protocols, manage the crypto, and so forth, and the tools for this aren't all very mature (see "Rust" below).

  * **Rust:** Almost all of the project is written in Rust, and what isn't is written in Assembly language (currently exclusively x86, though that may change as we add more platforms). Rust is new, cool, and exciting, but it's still quite young, and some areas don't have all the support you might like or aren't as mature as you'd hope—everything from cryptography through multithreading libraries and compiler/build infrastructure.

  * **Distributed team:** Profian is building a team of folks where we can find them. Profian has developers in Germany, Finland, the Netherlands, North Carolina (US), Massachusetts (US), Virginia (US), and Georgia (US). I'm in the United Kingdom, our community manager is in Brazil, and we have interns in India and Nigeria. We knew from the beginning that we wouldn't have everyone in one place, and this required people who would be able to communicate and collaborate with people via video, chat, and (at worst) email.

  * **Security:** Enarx is a security project. Although we weren't specifically looking for security experts, we need people who can think and work with security top of mind and design and write code that is applicable and appropriate for the environment.

  * **Git:** All of our code is stored in git (mainly [GitHub][5], with a bit of GitLab thrown in). so much of our interaction around code revolves around git that anybody joining us would need to be very comfortable using it as a standard tool in their day-to-day work.

  * **Open source:** Open source isn't just a licence; it's a mindset and, equally important, a way of collaborating. A great deal of open source software is created by people who aren't geographically co-located and who might not even see themselves as a team. We needed to know that the people we hired, while gelling as a close team within the company, would be able to collaborate with people outside the organisation and embrace Profian's "open by default" culture, not just for code, but for discussions, communications, and documentation.




### How did we find them?

As I've mentioned elsewhere, [recruiting is hard][6]. Profian used a variety of means to find candidates, with varying levels of success:

  * LinkedIn job adverts
  * LinkedIn searches
  * Language-specific discussion boards and hiring boards (e.g., Reddit)
  * An external recruiter (shout out to Gerald at [Interstem][7])
  * Word-of-mouth/personal recommendations



It's difficult to judge between these sources in terms of quality, but without an external recruiter, we'd certainly have struggled with quantity (and we had some great candidates from that pathway, too).

### How did we select them?

We needed to measure all of the candidates against all of the requirements noted above, but not all of them were equal. For instance, although we were keen to hire Rust programmers, someone with strong C/C++ skills at the systems level would be able to pick up Rust quickly enough to be useful. On the other hand, a good knowledge of using git was absolutely vital, as we couldn't spend time working with new team members to bring them up to speed on our way of working.

A strong open source background was, possibly surprisingly, not a requirement, but the mindset to work in that sort of model was, and anyone with a history of open source involvement is likely to have a good knowledge of git. The same goes for the ability to work in a distributed team: So much of open source is distributed that involvement in almost any open source community was a positive indicator. Security, we decided, was a "nice-to-have" qualification.

We wanted to keep the process simple and quick. Profian doesn't have a dedicated HR or People function, and we're busy trying to get code written. This is what we ended up with (with slight variations), and we tried to complete it within 1-2 weeks:

  1. Initial CV/resume/GitHub/GitLab/LinkedIn review to decide whether to interview
  2. 30-40 minute discussion with me as CEO, to find out if they might be a good cultural fit, to give them a chance to find out about us, and to get an idea if they were as technically adept as they appeared in Step 1
  3. Deep dive technical discussion led by Nathaniel, usually with me there
  4. Chat with other members of the team
  5. Coding exercise
  6. Quick decision (usually within 24 hours)



The coding exercise was key, but we decided against the usual approach. Our view was that a pure "algorithm coding" exercise beloved by many tech companies was pretty much useless for what we wanted: to find out whether a candidate could quickly understand a piece of code, fix some problems, and work with the team to do so. We created a GitHub repository with some almost-working Rust code in it (in fact, we ended up using two, with one for people a little higher up the stack), then instructed candidates to fix it, perform some git-related processes on it, and improve it slightly, adding tests along the way.

An essential part of the test was to get candidates to interact with the team via our chat room(s). We scheduled 15 minutes on a video call for setup and initial questions, two hours for the exercise ("open book" – as well as talking to the team, candidates were encouraged to use all resources available to them on the Internet), followed by a 30-minute wrap-up session where the team could ask questions, and the candidate could reflect on the task. This conversation, combined with the chat interactions during the exercise, allowed us to get an idea of how well the candidate was able to communicate with the team. Afterwards, the candidate would drop off the call, and we'd most often decide within 5-10 minutes whether we wanted to hire them.

This method generally worked very well. Some candidates struggled with the task, some didn't communicate well, some failed to do well with the git interactions – these were the people we didn't hire. It doesn't mean they're not good coders or might not be a good fit for the project or the company later on, but they didn't meet the criteria we need now. Of the developers we hired, the level of Rust experience and need for interaction with the team varied, but the level of git expertise and their reactions to our discussions afterwards were always sufficient for us to decide to take them.

### Reflections

On the whole, I don't think we'd change a huge amount about the selection process—though I'm pretty sure we could do better with the search process. The route through to the coding exercise allowed us to filter out quite a few candidates, and the coding exercise did a great job of helping us pick the right people. Hopefully, everyone who's come through the process will be a great fit and produce great code (and tests and documentation and …) for the project. Time will tell!

* * *

This article originally appeared on [Alice, Eve and Bob – a security blog][8] and is republished with permission.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/how-we-hired-open-source-developer

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/connection_people_team_collaboration.png?itok=0_vQT8xV (people in different locations who are part of the same team)
[2]: https://profian.com/
[3]: https://enarx.dev/
[4]: https://opensource.com/article/21/3/rust-programmer
[5]: https://github.com/enarx/
[6]: https://aliceevebob.com/2021/11/09/recruiting-is-hard/
[7]: https://www.interstem.co.uk/
[8]: https://aliceevebob.com/
