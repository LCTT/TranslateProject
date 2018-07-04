How to develop the FOSS leaders of the future
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_paperclips.png?itok=j48op49T)
Do you hold a critical role in a free and open source software project? Would you like to make it easier for the next person to step into your shoes, while also giving yourself the freedom to take breaks and avoid burnout?

Of course you would! But how do you get started?

Before you do anything, remember that this is a free or open source project. As with all things in FOSS, your succession planning should happen in collaboration with others. The [Principle of Least Astonishment][1] also applies: Don't work on your plan in isolation, then spring it on the entire community. Work together and publicly, so no one is caught off guard when the cultural or governance changes start happening.

### Identify and analyse critical roles

As a project leader, your first step is to identify the critical roles in your community. While it can help to ask each community members what role they perform, it's important to realize that most people perform multiple roles. Make sure you consider every role that each community member plays in the project.

Once you've identified the roles and determined which ones are critical to your project, the next step is to list all of the duties and responsibilities for each of those critical roles. Be very honest here. List the duties and responsibilities you think each role has, then ask the person who performs that role to list the duties the role actually has. You'll almost certainly find that the second list is longer than the first.

### Refactor large roles

During this process, have you discovered any roles that encompass a large number of duties and responsibilities? Large roles are like large methods in your code: They're a sign of a problem, and they need to be refactored to make them easier to maintain. One of the easiest and most effective steps in succession planning for FOSS projects is to split up each large role into two or more smaller roles and distribute these to other community members. With that one step, you've greatly improved the [bus factor][2] for your project. Even better, you've made each one of those new, smaller roles much more accessible and less intimidating for new community members. People are much more likely to volunteer for a role if it's not a massive burden.

### Limit role tenure

Another way to make a role more enticing is to limit its tenure. Community members will be more willing to step into roles that aren't open-ended. They can look at their life and work plans and ask themselves, "Can I take on this role for the next eighteen months?" (or whatever term limit you set).

Setting term limits also helps those who are currently performing the role. They know when they can set aside those duties and move on to something else, which can help alleviate burnout. Also, setting a term limit creates a pool of people who have performed the role and are qualified to step in if needed, which can also mitigate burnout.

### Knowledge transfer

Once you've identified and defined the critical roles in your project, most of what remains is knowledge transfer. Even small projects involve a lot of moving parts and knowledge that needs to be where everyone can see, share, use, and contribute to it. What sort of knowledge should you be collecting? The answer will vary by project, needs, and role, but here are some of the most common (and commonly overlooked) types of information needed to implement a succession plan:

  * **Roles and their duties** : You've spent a lot of time identifying, analyzing, and potentially refactoring roles and their duties. Make sure this information doesn't get lost.
  * **Policies and procedures** : None of those duties occur in a vacuum. Each duty must be performed in a particular way (procedures) when particular conditions are met (policies). Take stock of these details for every duty of every role.
  * **Resources** : What accounts are associated with the project, or are necessary for it to operate? Who helps you with meetup space, sponsorship, or in-kind services? Such information is vital to project operation but can be easily lost when the responsible community member moves on.
  * **Credentials** : Ideally, every external service required by the project will use a login that goes to an email address designated for a specific role (`sre@project.org`) rather than to a personal address. Every role's address should include multiple people on the distribution list to ensure that important messages (such as downtime or bogus "forgot password" requests) aren't missed. The credentials for every service should be kept in a secure keystore, with access limited to the fewest number of people possible.
  * **Project history** : All community members benefit greatly from learning the history of the project. Collecting project history information can clarify why decisions were made in the past, for example, and reveal otherwise unexpressed requirements and values of the community. Project histories can also help new community members understand "inside jokes," jargon, and other cultural factors.
  * **Transition plans** : A succession plan doesn't do much good if project leaders haven't thought through how to transition a role from one person to another. How will you locate and prepare people to take over a critical role? Since the project has already done a lot of thinking and knowledge transfer, transition plans for each role may be easier to put together.



Doing a complete knowledge transfer for all roles in a project can be an enormous undertaking, but the effort is worth it. To avoid being overwhelmed by such a daunting task, approach it one role at a time, finishing each one before you move onto the next. Limiting the scope in this way makes both progress and success much more likely.

### Document, document, document!

Succession planning takes time. The community will be making a lot of decisions and collecting a lot of information, so make sure nothing gets lost. It's important to document everything (not just in email threads). Where knowledge is concerned, documentation scales and people do not. Include even the things that you think are obvious—what's obvious to a more seasoned community member may be less so to a newbie, so don't skip steps or information.

Gather these decisions, processes, policies, and other bits of information into a single place, even if it's just a collection of markdown files in the main project repository. The "how" and "where" of the documentation can be sorted out later. It's better to capture key information first and spend time [bike-shedding][3] a documentation system later.

Once you've collected all of this information, you should understand that it's unlikely that anyone will read it. I know, it seems unfair, but that's just how things usually work out. The reason? There is simply too much documentation and too little time. To address this, add an abstract, or summary, at the top of each item. Often that's all a person needs, and if not, the complete document is there for a deep dive. Recognizing and adapting to how most people use documentation increases the likelihood that they will use yours.

Above all, don't skip the documentation process. Without documentation, succession plans are impossible.

### New leaders

If you don't yet perform a critical role but would like to, you can contribute to the succession planning process while apprenticing your way into one of those roles.

For starters, actively look for opportunities to learn and contribute. Shadow people in critical roles. You'll learn how the role is done, and you can document it to help with the succession planning process. You'll also get the opportunity to see whether it's a role you're interested in pursuing further.

Asking for mentorship is a great way to get yourself closer to taking on a critical role in the project. Even if you haven't heard that mentoring is available, it's perfectly OK to ask about it. The people already in those roles are usually happy to mentor others, but often are too busy to think about offering mentorship. Asking is a helpful reminder to them that they should be helping to train people to take over their role when they need a break.

As you perform your own tasks, actively seek out feedback. This will not only improve your skills, but it shows that you're interested in doing a better job for the community. This commitment will pay off when your project needs people to step into critical roles.

Finally, as you communicate with more experienced community members, take note of anecdotes about the history of the project and how it operates. This history is very important, especially for new contributors or people stepping into critical roles. It provides the context necessary for new contributors to understand what things do or don't work and why. As you hear these stories, document them so they can be passed on to those who come after you.

### Succession planning examples

While too few FOSS projects are actively considering succession planning, some are doing a great job of trying to reduce their bus factor and prevent maintainer burnout.

[Exercism][4] isn't just an excellent tool for gaining fluency in programming languages. It's also an [open source project][5] that goes out of its way to help contributors [land their first patch][6]. In 2016, the project reviewed the health of each language track and [discovered that many were woefully maintained][7]. There simply weren't enough people covering each language, so maintainers were burning out. The Exercism community recognized the risk this created and pushed to find new maintainers for as many language tracks as possible. As a result, the project was able to revive several tracks from near-death and develop a structure for inviting people to become maintainers.

The purpose of the [Vox Pupuli][8] project is to serve as a sort of succession plan for the [Puppet module][9] community. When a maintainer no longer wishes or is able to work on their module, they can bequeath it to the Vox Pupuli community. This community of 30 collaborators shares responsibility for maintaining all the modules it accepts into the project. The large number of collaborators ensures that no single person bears the burden of maintenance while also providing a long and fruitful life for every module in the project.

These are just two examples of how some FOSS projects are tackling succession planning. Share your stories in the comments below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/succession-planning-how-develop-foss-leaders-future

作者：[VM(Vicky) Brasseur)][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/vmbrasseur
[1]:https://en.wikipedia.org/wiki/Principle_of_least_astonishment
[2]:https://en.wikipedia.org/wiki/Bus_factor
[3]:https://en.wikipedia.org/wiki/Law_of_triviality
[4]:http://exercism.io
[5]:https://github.com/exercism/exercism.io
[6]:https://github.com/exercism/exercism.io/blob/master/CONTRIBUTING.md
[7]:https://tinyletter.com/exercism/letters/exercism-track-health-check-new-maintainers
[8]:https://voxpupuli.org
[9]:https://forge.puppet.com
