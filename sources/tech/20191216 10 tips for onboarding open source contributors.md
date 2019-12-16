[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (10 tips for onboarding open source contributors)
[#]: via: (https://opensource.com/article/19/12/open-source-contributors)
[#]: author: (rowasc https://opensource.com/users/rowasc)

10 tips for onboarding open source contributors
======
Making new contributors feel welcome in your community is essential to
your project's future, so it's important to put time and attention into
onboarding them.
![Women programming][1]

Contributors are the lifeblood of many open source projects because they enable smaller projects to grow and improve without a lot of financial support and they bring fresh perspectives to the project. That is the case at [Ushahidi][2], a non-profit organization that is building and using software to help raise the voices of underserved, marginalized communities. Our products enable local observers to submit reports about local humanitarian crises (such as political unrest and natural disasters) using their mobile phones or the internet, while simultaneously creating a temporal and geospatial archive of events.

Ushahidi always strives for openness, but **it's very hard to evaluate how open your organization works from the inside**. Staff and longtime contributors know too much: they are cursed by knowledge and access to the people who know how things work. While a crisis brings out the good in people who want to help, getting involved with an open source project during a crisis is complex. The maintainers are usually going through a stressful time. New requests for features are coming every day. New bugs are being reported all the time.

There are never enough people to fix everything, which is why it's so important for projects to have a good process for onboarding new contributors.

### Why Ushahidi needed to re-engage with its community

In the beginning, Ushahidi had a really big community and did a lot of community engagement. We had community dev calls, where core developers and community developers talked about what they were working on. We had t-shirts and swag; we had community badges and blog posts celebrating the top contributor of the month. We sponsored tech events and made sure to have a booth or a presentation showcasing the platform.

Our documentation was good and extensive with toolkits and examples for different use cases, our forum was active, we were active!

But then a few things happened. The software got outdated, and the core team started working on a new version. At the same time, we adopted a new strategy around sustainability and started a Software-as-a-Service model, spanning from free grassroots deployments to more complex enterprise plans, to try to bring much-needed financial stability and sustainability and serve new use cases and needs.

All of this took longer than expected, and we did not want to bring in new contributors "just yet." Not getting our contributors engaged from the beginning resulted in our docs being unclear, unfinished, and unstructured. We did not adjust the software to be easy for our open source users to install or use. **Nothing was intentional, but we were not serving our open source community as well as we would like.** Now, our main focus is to re-engage with our community.

The following are 10 things we've learned and done that may help you improve your contributor onboarding processes if you're in a similar situation.

### 1\. Evaluate your processes

To evaluate how open your organization's processes are and how they are working for new contributors, source new folks who can try to answer questions like: "How do you get new code into production?" and "Who can trigger a production release?" or "How does testing happen?"

Some things to look for:

  * Is it clear to new contributors about how to get started? Are getting-started guides hard to find, too complex, or disorganized?
  * Are communication and coordination happening in the open? Or are they hidden in Slack rooms, making it hard to know what is going on?
  * Is the process for code reviews and merges clear? What about the safety nets for code contributions and the QA process?



When you're deep into a project with your community, it's difficult to know how it looks to new contributors. We learned that **what feels like an open process from the inside can feel very closed from the perspective of a new contributor**.

### 2\. Set the foundation

Diversity and inclusion are core to Ushahidi; about 80% of people working on the project are women and non-binary genders, a majority of our team are people of color, and we live on four continents. This reflects the reality that many of our users live in. They are not all in the United States, they are from diverse backgrounds, and they have different goals. What unites them is that they are all working to improve their communities in their own way.

For us, **having a good foundation starts with having a diverse team that represents our users and stakeholders**. But that's not all; we have also improved our contributor resources with:

  * A new developers hub
  * New and updated documentation
  * New pathways to contributing
  * Videos
  * FAQs



We're also restarting our community engagement by:

  * Doing webinars
  * Hosting hackathons
  * Proactively organizing and triaging issues
  * Announcing releases and contributors to each release



### 3\. Make "getting started" clear

When someone wants to start contributing, there needs to be clarity on how to start. We label good starter contributions as first-timer issues; these describe in detail what needs to be done, how to find the code, and what you need to do. It takes us longer to write these issues than it would to fix the actual thing ourselves, but that is not the goal. The goal is to **give people who may be new to open source a chance to contribute and learn about the work we do**.

#### Find the blockers

It is also important to understand where the blockers for getting started are. One of Ushahidi's biggest blockers was installing the software in development environments. We assumed that because our engineers could get things set up, others would be able to do so. But other people may not have the same environment, and they absolutely did not have the amount of support that our core engineering team gets.

To resolve this, we created videos on installation procedures, and we also created an **installation-helper** feature that checks common things that people forget during configuration and installation and also gives hints on how to solve problems.

![Ushahidi's installation-helper][3]

### 4\. Learn from diverse perspectives

It's important to ask others to evaluate and double-check the documentation we provide to our contributors. We are really lucky that our team has people in programs, community, and design roles that really care about open source, and their input often helps us figure out how to **reach people who are less experienced with coding or who may want to contribute in different ways than writing code or doing QA**.

When we were creating videos for our new developers hub, our community engagement officer was a big help. She is not a developer, and she is an excellent writer, so she helped by watching us go through the documentation, taking notes, then writing the initial scripts for our videos. She ensured that the things that we encounter daily—and know how to deal with by heart—are addressed in the documentation.

Input like this is very valuable, since it reminds us what we know and take for granted that could confuse and turn away new contributors.

### 5\. When possible, make short calls

Try to invest in calls when needed and when your schedule allows. **Sometimes a five-minute call with a new contributor will give a better return than a 30-minute text chat.** If you reach a point in a chat that it's clear your instructions aren't working for the person, ask them to jump on a call to show you what they are doing. It's important to set a time limit (e.g., "I have 10 minutes now, so let's see if we can solve it right away"); otherwise, you may end up spending the whole day fixing unrelated things, which is not a great way to scale yourself.

Make sure to use what you learn from these interactions to improve your documentation. Otherwise, you will find yourself doing so many 10-minute calls that you will never get anything done.

### 6\. Always say thank you

**Thank people even when it feels all you are getting are requests to do more work.** We say thank you for everything. We say thank you for bug reports, feature requests, for code contributions. We say thank you for reaching out and asking for help.

It is hard for some people to reach out, and thanking them validates that it was OK to do so. This validation may also help people not only for the current situation but also for other projects and situations in the future.

### 7\. Be kind in code reviews

Someone has found you, gotten set up, fixed a bug, and finally sent a pull request. It's time to review the code. Step away from your personal opinions on how things should be. It's not time to be nit-picky and rude.

When performing code reviews, **ensure you are helping the person make the code better** and not just following your personal preferences. Find at least one good thing to say about the pull request, and _always thank the contributor_.

If you get a pull request that you don't plan to merge, maybe because it's the wrong scope or direction or simply something you don't want to add, it is important to deal with it straightaway instead of ignoring it. It does not help anyone to ignore pull requests, and it only serves to clutter your repository. Thank the contributor, explain why you don't plan to merge the changes, and close the pull request.

If you merge the changes, make sure to tag the contributor when it goes out so that they know it had an impact.

### 8\. Be responsive

Throughout this process, **it is important to be responsive and not let people wait**. Giving someone some kind of response—even if you can't help them right now—and setting the expectation for when you'll be able to follow up is super-important.

Sometimes a comment goes undiscovered—you miss a notification and find it three months later. It's tricky to respond in those situations, but it's still better to acknowledge the message, apologize for the delay, and ask if they still want help (with this or something else) rather than just ignoring them forever. It sets the tone that you care about your work and community, even when you make mistakes.

### 9\. Help contributors thrive

Sometimes a contributor comes in, sends their contributions, and leaves without much interaction. But, on some occasions, you get the opportunity to work with people over a longer time. Working with new contributors over a period of weeks or months is extremely valuable because you will gain insights into how people—especially those new to your project or tech—see your work and what challenges they face. It's also a chance to help people grow and learn. It's a win-win for everyone.

In 2019, we participated in the [Google Summer of Code][4] and [Outreachy][5], and these experiences helped both the interns and our team learn new things. By working with interns, we get to understand what it's like to join our project, what onboarding looks like for a very junior engineer, and what blockers there might be to them contributing to our project.

#### Prevent imposter syndrome

On a related note, it's important to help prevent [impostor syndrome][6]. The feeling of not belonging or of "how did I even get here" is so common, especially among underrepresented groups in tech. It is written and talked about a lot, especially in the past tense, but rarely by people who are actively going through it.

How do you spot it? How do you know someone is feeling like they aren't accomplishing enough or are feeling like a fraud?

**Showing senior folks failing and learning from their mistakes helps to create an inclusive environment.** Things like pair programming, sharing your past experiences, discussing your career path, and telling people about when you made mistakes are ways to help to bridge gaps between senior engineers and new people. It helps new folks feel like they belong in tech because the smart, senior people in front of them also had concerns and made mistakes, but they picked themselves up and kept going.

### 10\. Avoid communication barriers

This may be obvious, but not all your contributors speak English as their first language. For many, it'll be their second, or maybe even third or fourth, language. A lot of your contributors may not speak English at a level that allows them to collaborate seamlessly, and it's important to remember that broken English is fine, even expected, in a global project. Be empathetic, be nice, and support these folks. Don't assume that someone is "dumb" just because they have bad grammar in English. Just because someone does not speak perfect English, it does not mean they aren't talented. It literally only means they don't speak perfect English.

Another potential communication barrier is using mannerisms that others may perceive in different ways than we intended. For example, signing an email "Thanks, Romina" or saying "OK, bye!" sound perfectly appropriate to me, but they could signal to someone else that you don't respect them. To assign the label "rude" to someone because of this would be… quite rude?

**When you are dealing with a multicultural, global network of contributors, try not to worry about language barriers or mannerisms that aren't meant to be offensive.**

This doesn't mean that you should excuse bad behavior. There are no excuses for calling another person names, putting someone down, or misgendering someone on purpose, and maintainers are obligated to act on the code of conduct and resolve the situation.

### In summary

Making new contributors feel welcome in your community is essential to your project's future, so it's important to put time and attention into onboarding them.

  * Make sure to see your community from the contributors' side.
  * Enabling underrepresented minorities to thrive creates a more welcoming community for everyone.
  * Be aware of the community you are serving and ask yourself what their specific needs are.
  * Allow questions both in private and public.
  * Be nice, set the tone.
  * Say thank you.
  * Be responsive.
  * Be consistent.



### Other resources

  * [Ushahidi's documentation][7]
  * [First Timers Only][8] offers good tips for first-time contributors
  * [GitHub's all-contributors repository][9] provides specs for recognizing all types of open source contributors
  * [Up For Grabs][10] to find open issues for OSS and how to label issues



The four-day-long siege of a Nairobi mall ended Tuesday with a death toll of more than 60 people –...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/open-source-contributors

作者：[rowasc][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rowasc
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/collab-team-pair-programming-code-keyboard2.png?itok=WnKfsl-G (Women programming)
[2]: https://www.ushahidi.com/
[3]: https://opensource.com/sites/default/files/uploads/ushahidi_installation-helper.png (Ushahidi's installation-helper)
[4]: https://summerofcode.withgoogle.com/archive/
[5]: https://www.outreachy.org/
[6]: https://opensource.com/open-organization/17/5/team-impostor-syndrome
[7]: https://docs.ushahidi.com/index/
[8]: https://www.firsttimersonly.com/
[9]: https://github.com/all-contributors/all-contributors
[10]: https://up-for-grabs.net/
