[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 big lessons from my internship with open source)
[#]: via: (https://opensource.com/article/21/1/open-source-intern)
[#]: author: (Jaideep Rao https://opensource.com/users/jaideeprao)

4 big lessons from my internship with open source
======
Just months after dipping my toes into open source, I learned lessons as
a college intern that will help anyone writing and contributing code to
a community.
![Brain on a computer screen][1]

If you happened to have a time machine and chose to shoot yourself back a year to ask me what I thought about making open source contributions (of all the things you could've done), you may have guessed that I would just shrug and say something along the lines of, "I don't know, isn't that reserved for all the hard-core devs with the insane GitHub stats and decked-out macros and stuff? I'd have no idea what I was doing, and who would even care what some random college student had to say about their code?" And you'd probably be correct. But this was all before I stumbled onto the incredible opportunity to intern at Red Hat within the OpenShift Engineering division for the better part of 2020.

I came into the internship like any fresh-faced computer science student, skirting through life writing untested, barely readable but somehow still functional code, and feeling proud of it. But this internship brought the opportunity to get my hands dirty with the open source culture and finally see what all the hype is about.

I worked within the OpenShift-GitOps team right around the time Red Hat officially adopted [Argo CD][2] into its ecosystem. Subsequently, I—along with the rest of the team—was tasked with making upstream contributions to Argo CD. I decided to throw some of my thoughts about my experience into an article to take you through it.

### Figuring things out

Starting out was difficult and disorienting, as you might expect. I think we can all agree that reading code is hard enough when it's written by a colleague on your team. To get up to speed with code written within a different organization, potentially using different technologies, different components, and different coding practices can get overwhelming quickly. On several occasions, I found myself mindlessly sifting through files.

I soon realized that my first step should have been to try to understand the product as a user, not as a developer. This involved trying to get the software up and running and playing around with it. Fortunately, I had an entire team going through the same thing, so we could help each other get set up and cruise through it.

This was also when I started to appreciate the power of good documentation and what it can do to simplify your life as a developer. As an added bonus, the good folks in the Argo community were accommodating enough to host a weekly office hour of sorts to ease in all the new contributors. These sessions went a long way in speeding the awkward settling-in phase and helping our programmer's instinct kick in sooner. (They were also just a great place to be a fly-on-the-wall observer.)

### Selecting and solving issues

Skipping forward a little, I began scouring the list of open issues looking for something to sink my teeth into. This can be a messy process. The open source community's heavy dependence on its members' proclivity to participate comes with its fair share of ambiguity and lack of obligation towards efficient communication. This may present itself in several ways, such as an inability to reproduce the described issue locally, insufficient context to understand the issue, or just painfully slow communication with the person who raised the issue. As you go through the open source experience, you might find this to be a recurring theme. However, this experience helped me realize that picking the right issue, understanding its semantics, and reproducing it locally is half the battle.

When things go right, and you find an interesting issue with decent engagement, it can be quite exciting! The discussions in the comments section can show the different use cases and workarounds people come up with about specific issues in the project. These can be great sources of context, and gathering context is the name of the game—at least until you know what the heck is going on.

Once I was in the weeds and starting to think about potential solutions to an issue, the thing that jumped out to me the most was how much of a learning curve was associated with each new issue I took on. One of the reasons was that I was picking randomly from whatever unclaimed open issues were filed under the next major release milestone. This meant the issues I took varied a lot. I would wind up going down a different rabbit hole for each, learning 10 new related concepts in the process (even if not all of them made their way into the eventual pull request).

The same thing was true even when trying to step through the code to track down the source of a bug and coming across all the different components involved. This phase always seemed to be packed with the most amount of learning. As I slowly made my way to the solution, I often needed to fill in some knowledge gaps. Once again, I believe I had the most supportive colleagues anyone could ask for since I could always consult them as needed.

### Submitting pull requests

Once a fix or feature is done and tested locally, you're ready to raise your pull request (PR)! This is usually followed by a few rounds of going back and forth with the repository's maintainers as they review your PR and potentially request changes. It always amazes me to think about the amount of time, effort, and deliberation that the seemingly smallest contribution can involve. This isn't always evident from the outside, and your PR might end up looking very different from what you started with.

I also learned that it is not uncommon for five lines of code changes to be accompanied by 150 lines of tests for those changes. In other words, writing unit tests for your PR can sometimes be just as involved as the fix/feature itself, if not more. After everything is said and done, your PR is finally merged. You can do a quick celebratory dance, but then it's onward to the next one!

### Learning big lessons

I learned a lot during my internship that will help me professionally and personally.

#### Professional lessons

  * Coming into this, most of my coding experience had been centered around personal projects or assignments for school or tasks assigned for my organization. These tend to be very specific to their intended audience and generally aren't very consequential to the wider community. In contrast, open source projects tend to have a much wider reach, so it was interesting to think about the potential scale of my contributions' impact. This made me feel like my work was consequential, and that made it feel worthwhile.
  * If you're like me, finding random issues and fixing them might stop being as exciting after a while. You might ask, "What is all of this actually leading to?" This is why I think it's important to have a larger picture and a sense of direction in mind. It helps drive your decisions and reminds you what you're working towards. Red Hat's larger objectives and long-term vision for adopting Argo CD provided me with this sense of direction and helped me stay motivated. But this can probably be achieved in multiple ways. Picking and working on issues more strategically, so they allow you to learn an aspect of programming that you're interested in getting better at, could be one of them.



#### Personal lessons

  * It's no secret that breaking into something new can be daunting. I, probably along with half the software industry, am no stranger to imposter syndrome. There were times I felt like I wasn't moving as quickly or making as much progress as I would have expected from myself. This was frustrating, but I eventually understood how important it is to be patient with yourself. Especially if you're someone who's just learning the ropes, it may take a while to start making good progress, but it's worth remembering that it's all part of the learning process.
  * Early on, I tended to compare myself with my more experienced colleagues who were going through issues and getting PRs merged faster than you could finish saying "Argo CD." This didn't help my confidence a whole lot, but I realized that pitting myself (an intern working part time) against industry veterans wasn't really a fair comparison for anyone. The best way to build yourself up is to compare yourself to who you used to be rather than to those around you.



#### Other helpful tips I learned

  * Do not hesitate to ask questions on the community forum. Also, try to find out if the project has a Slack, Discord, or Gitter that you can join.
  * Look at other PRs and discussions to gain context about what's happening in the project and better understand the codebase.
  * Try to identify unique log and error messages related to the workflow you're interested in. Searching for these messages directly against the codebase could be a quick way to locate the area you want to focus on, and reverse-engineering the sequence of function calls involved in getting to that point may help you understand everything that takes place along the way. (I found this to be particularly helpful.)
  * Looking at unit tests can be a good way to understand what a function is supposed to be doing and how it interacts with other functions (input/output formats, etc.).
  * Looking for issues labeled "good first issue" might be a good place to start. However, there may be many good issues that aren't labeled as such, so it might be worth looking through the issue board outside of that filter.
  * Always update documentation if you're making feature edits!



### Closing thoughts

The open source contribution experience is not a perfect process. As with anything else, it has its downsides. The sense of ambiguity from its open-ended nature and the occasional lack of feedback or communication can be hard to work around. On the other hand, I am pleased to see how much I was able to grow and get exposure to during this time. I found it challenging and gratifying to be a part of a developer team, and I am better for it.

Getting to work within a different paradigm, becoming a part of the wider developer community, and making new connections were all big pluses. Having your PRs merged is a good feeling as well! I also benefited by spotting [PlayerUnknown's Battlegrounds][3] as an Argo CD user, and I helped improve my friends' PUBG gaming experience by telling them about it.

If you made it all the way to the end, thanks for reading! I hope this can be helpful to you in starting your own journey into the open source world. Good luck!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/open-source-intern

作者：[Jaideep Rao][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jaideeprao
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brain_computer_solve_fix_tool.png?itok=okq8joti (Brain on a computer screen)
[2]: https://github.com/argoproj/argo-cd
[3]: https://en.wikipedia.org/wiki/PlayerUnknown%27s_Battlegrounds
