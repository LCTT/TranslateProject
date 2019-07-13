[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Managing changes in open source projects)
[#]: via: (https://opensource.com/article/19/3/managing-changes-open-source-projects)
[#]: author: (Ben Cotton (Red Hat, Community Moderator) https://opensource.com/users/bcotton)

Managing changes in open source projects
======

Here's how to create a visible change process to support the community around an open source project.

![scrabble letters: "time for change"][1]

Why bother having a process for proposing changes to your open source project? Why not just let people do what they're doing and merge the features when they're ready? Well, you can certainly do that if you're the only person on the project. Or maybe if it's just you and a few friends.

But if the project is large, you might need to coordinate how some of the changes land. Or, at the very least, let people know a change is coming so they can adjust if it affects the parts they work on. A visible change process is also helpful to the community. It allows them to give feedback that can improve your idea. And if nothing else, it lets people know what's coming so that they can get excited, and maybe get you a little bit of coverage on Opensource.com or the like. Basically, it's "here's what I'm going to do" instead of "here's what I did," and it might save you some headaches as you scramble to QA right before your release.

So let's say I've convinced you that having a change process is a good idea. How do you build one?

**[Watch my talk on this topic]**
<https://www.youtube.com/embed/cVV1K3Junkc>

### Right-size your change process

Before we start talking about what a change process looks like, I want to make it very clear that this is not a one-size-fits-all situation. The smaller your project is—mainly in the number of contributors—the less process you'll probably need. As [Richard Hackman says][2], the number of communication channels in a team goes up exponentially with the number of people on the team. In community-driven projects, this becomes even more complicated as people come and go, and even your long-time contributors might not be checking in every day. So the change process consolidates those communication channels into a single area where people can quickly check to see if they care and then get back to whatever it is they do.

At one end of the scale, there's the command-line Twitter client I maintain. The change process there is, "I pick something I want to work on, probably make a Git branch for it but I might forget that, merge it, and tag a release when I'm out of stuff that I can/want to do." At the other end is Fedora. Fedora isn't really a single project; it's a program of related projects that mostly move in the same direction. More than 200 people a week touch Fedora in a technical sense: spec file maintenance, build submission, etc. This doesn't even include the untold number of people who are working on the upstreams. And these upstreams all have their own release schedules and their own processes for how features land and when. Nobody can keep up with everything on their own, so the change process brings important changes to light.

### Decide who needs to review changes

One of the first things you need to consider when putting together a change process for your community is: "who needs to review changes?" This isn't necessarily approving the changes; we'll come to that shortly. But are there people who should take a look early in the process? Maybe your release engineering or infrastructure teams need to review them to make sure they don't require changes to build infrastructure. Maybe you have a legal review process to make sure licenses are in order. Or maybe you just have a change wrangler who looks to make sure all the required information is included. Or you may choose to do none of these and have change proposals go directly to the community.

But this brings up the next step. Do you want full community feedback or only a select group to provide feedback? My preference, and what we do in Fedora, is to publish changes to the community before they're approved. But the structure of your community may fit a model where some approval body signs off on the change before it is sent to the community as an announcement.

### Determine who approves changes

Even if you lack any sort of organizational structure, someone ends up approving changes. This should reflect the norms and values of your community. The simplest form of approval is the person who proposed the change implements it. Easy peasy! In loosely organized communities, that might work. Fully democratic communities might put it to a community-wide vote. If a certain number or proportion of members votes in favor, the change is approved. Other communities may give that power to an individual or group. They could be responsible for the entire project or certain subsections.

In Fedora, change approval is the role of the Fedora Engineering Steering Committee (FESCo). This is a nine-person body elected by community members. This gives the community the ability to remove members who are not acting in the best interests of the project but also enables relatively quick decisions without large overhead.

In much of this article, I am simply presenting information, but I'm going to take a moment to be opinionated. For any project with a significant contributor base, a model where a small body makes approval decisions is the right approach. A pure democracy can be pretty messy. People who may have no familiarity with the technical ramifications of a change will be able to cast a binding vote. And that process is subject to "brigading," where someone brings along a large group of otherwise-uninterested people to support their position. Think about what it might look like if someone proposed changing the default text editor. Would the decision process be rational?

### Plan how to enforce changes

The other advantage of having a defined approval body is it can mediate conflicts between changes. What happens if two proposed changes conflict? Or if a change turns out to have a negative impact? Someone needs to have the authority to say "this isn't going in after all" or make sure conflicting changes are brought into agreement. Your QA team and processes will be a part of this, and maybe they're the ones who will make the final call.

It's relatively straightforward to come up with a plan if a change doesn't work as expected or is incomplete by the deadline. If you require a contingency plan as part of the change process, then you implement that plan. The harder part is: what happens if someone makes a change that doesn't go through your change process? Here's a secret your friendly project manager doesn't want you to know: you can't force people to go through your process, particularly in community projects.

So if something sneaks in and you don't discover it until you have a release candidate, you have a couple of options: you can let it in, or you can get someone to forcibly remove it. In either case, you'll have someone who is very unhappy. Either the person who made the change, because you kicked their work out, or the people who had to deal with the breakage it caused. (If it snuck in without anyone noticing, then it's probably not that big of a deal.)

The answer, in either case, is going to be social pressure to follow the process. Processes are sometimes painful to follow, but a well-designed and well-maintained process will give more benefit than it costs. In this case, the benefit may be identifying breakages sooner or giving other developers a chance to take advantage of new features that are offered. And it can help prevent slips in the release schedule or hero effort from your QA team.

### Implement your change process

So we've thought about the life of a change proposal in your project. Throw in some deadlines that make sense for your release cadence, and you can now come up with the policy—but how do you implement it?

First, you'll want to identify the required information for a change proposal. At a minimum, I'd suggest the following. You may have more requirements depending on the specifics of what your community is making and how it operates.

  * Name and summary
  * Benefit to the project
  * Scope
  * Owner
  * Test plan
  * Dependencies and impacts
  * Contingency plan



You'll also want one or several change wranglers. These aren't gatekeepers so much as shepherds. They may not have the ability to approve or reject change proposals, but they are responsible for moving the proposals through the process. They check the proposal for completeness, submit it to the appropriate bodies, make appropriate announcements, etc. You can have people wrangle their own changes, but this can be a specialized task and will generally benefit from a dedicated person who does this regularly, instead of making community members do it less frequently.

And you'll need some tooling to manage these changes. This could be a wiki page, a kanban board, a ticket tracker, something else, or a combination of these. But basically, you want to be able to track their state and provide some easy reporting on the status of changes. This makes it easier to know what is complete, what is at risk, and what needs to be deferred to a later release. You can use whatever works best for you, but in general, you'll want to minimize copy-and-pasting and maximize scriptability.

### Remember to iterate

Your change process may seem perfect. Then people will start using it. You'll discover edge cases you didn't consider. You'll find that the community hates a certain part of it. Decisions that were once valid will become invalid over time as technology and society change. In Fedora, our Features process revealed itself to be ambiguous and burdensome, so it was refined into the [Changes][3] process we use today. Even though the Changes process is much better than its predecessor, we still adjust it here and there to make sure it's best meeting the needs of the community.

When designing your process, make sure it fits the size and values of your community. Consider who gets a voice and who gets a vote in approving changes. Come up with a plan for how you'll handle incomplete changes and other exceptions. Decide who will guide the changes through the process and how they'll be tracked. And once you design your change policy, write it down in a place that's easy for your community to find so that they can follow it. But most of all, remember that the process is here to serve the community; the community is not here to serve the process.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/managing-changes-open-source-projects

作者：[Ben Cotton (Red Hat, Community Moderator)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bcotton
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/change_words_scrabble_letters.jpg?itok=mbRFmPJ1 (scrabble letters: "time for change")
[2]: https://hbr.org/2009/05/why-teams-dont-work
[3]: https://fedoraproject.org/wiki/Changes/Policy
