How to level up your organization's security expertise
======
These best practices will make your employees more savvy and your organization more secure.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk)

IT security is critical to every company these days. In the words of former FBI director Robert Mueller: “There are only two types of companies: Those that have been hacked, and those that will be.”

At the same time, IT security is constantly evolving. We all know we need to keep up with the latest trends in cybersecurity and security tooling, but how can we do that without sacrificing our ability to keep moving forward on our business priorities?

No single person in your organization can handle all of the security work alone; your entire development and operations team will need to develop an awareness of security tooling and best practices, just like they all need to build skills in open source and in agile software delivery. There are a number of best practices that can help you level up the overall security expertise in your company through basic and intermediate education, subject matter experts, and knowledge-sharing.

### Basic education: Annual cybersecurity education and security contact information

At IBM, we all complete an online cybersecurity training class each year. I recommend this as a best practice for other companies as well. The online training is taught at a basic level, and it doesn’t assume that anyone has a technical background. Topics include social engineering, phishing and spearfishing attacks, problematic websites, viruses and worms, and so on. We learn how to avoid situations that may put ourselves or our systems at risk, how to recognize signs of an attempted security breach, and how to report a problem if we notice something that seems suspicious. This online education serves the purpose of raising the overall security awareness and readiness of the organization at a low per-person cost. A nice side effect of this education is that this basic knowledge can be applied to our personal lives, and we can share what we learned with our family and friends as well.

In addition to the general cybersecurity education, all employees should have annual training on data security and privacy regulations and how to comply with those.

Finally, we make it easy to find the Corporate Security Incident Response team by sharing the link to its website in prominent places, including Slack, and setting up suggested matches to ensure that a search of our internal website will send people to the right place:

![](https://opensource.com/sites/default/files/uploads/security_search_screen.png)

### Intermediate education: Learn from your tools

Another great source of security expertise is through pre-built security tools. For example, we have set up a set of automated security tests that run against our web services using IBM AppScan, and the reports it generates include background knowledge about the vulnerabilities it finds, the severity of the threat, how to determine if your application is susceptible to the vulnerability, and how to fix the problem, with code examples.

Similarly, the free [npm audit command-line tool from npm, Inc.][1] will scan your open source Node.js modules and report any known vulnerabilities it finds. This tool also generates educational audit reports that include the severity of the threat, the vulnerable package, and versions with the vulnerability, an alternative package or versions that do not have the vulnerability, dependencies, and a link to more detailed information about the vulnerability. Here’s an example of a report from npm audit:

| High          | Regular Expression Denial of Service      |
| --------------| ----------------------------------------- |
| Package       | minimath                                  |
| --------------| ----------------------------------------- |
| Dependency of | gulp [dev]                                |
| --------------| ----------------------------------------- |
| Path          | gulp > vinyl-fs > glob-stream > minimatch |
| --------------| ----------------------------------------- |
| More info     | https://nodesecurity.io/advisories/118    |

Any good network-level security tool will also give you information on the types of attacks the tool is blocking and how it recognizes likely attacks. This information is available in the marketing materials online as well as the tool’s console and reports if you have access to those.

Each of your development teams or squads should have at least one subject matter expert who takes the time to read and fully understand the vulnerability reports that are relevant to you. This is often the technical lead, but it could be anyone who is interested in learning more about security. Your local subject matter expert will be able to recognize similar security holes in the future earlier in the development and deployment process.

Using the npm audit example above, a developer who reads and understands security advisory #118 from this report will be more likely to notice changes that may allow for a Regular Expression Denial of Service when reviewing code in the future. The team’s subject matter expert should also develop the skills needed to determine which of the vulnerability reports don’t actually apply to his or her specific project.

### Intermediate education: Conferences

Let’s not forget the value of attending security-related conferences, such as the [OWASP AppSec Conferences][2]. Conferences provide a great way for members of your team to focus on learning for a few days and bring back some of the newest ideas in the field. The “hallway track” of a conference, where we can learn from other practitioners, is also a valuable source of information. As much as most of us dislike being “sold to,” the sponsor hall at a conference is a good place to casually check out new security tools to see which ones you might be interested in evaluating later.

If your organization is big enough, ask your DevOps and security tool vendors to come to you! If you’ve already procured some great tools, but adoption isn’t going as quickly as you would like, many vendors would be happy to provide your teams with some additional practical training. It’s in their best interests to increase the adoption of their tools (making you more likely to continue paying for their services and to increase your license count), just like it’s in your best interests to maximize the value you get out of the tools you’re paying for. We recently hosted a [Toolbox@IBM][3] \+ DevSecOps summit at our largest sites (those with a couple thousand IT professionals). More than a dozen vendors sponsored each event, came onsite, set up booths, and gave conference talks, just like they would at a technical conference. We also had several of our own presenters speaking about DevOps and security best practices that were working well for them, and we had booths set up by our Corporate Information Security Office, agile coaching, onsite tech support, and internal toolchain teams. We had several hundred attendees at each site. It was great for our technical community because we could focus on the tools that we had already procured, learn how other teams in our company were using them, and make connections to help each other in the future.

When you send someone to a conference, it’s important to set the expectation that they will come back and share what they’ve learned with the team. We usually do this via an informal brown-bag lunch-and-learn, where people are encouraged to discuss new ideas interactively.

### Subject-matter experts and knowledge-sharing: The secure engineering guild

In the IBM Digital Business Group, we’ve adopted the squad model as described by [Spotify][4] and tweaked it to make it work for us. One sometimes-forgotten aspect of the squad model is the guild. Guilds are centers of excellence, focused around one topic or skill set, with members from many squads. Guild members learn together, share best practices with each other and their broader teams, and work to advance the state of the art. If you would like to establish your own secure engineering guild, here are some tips that have worked for me in setting up guilds in the past:

**Step 1: Advertise and recruit**

Your co-workers are busy people, so for many of them, a secure engineering guild could feel like just one more thing they have to cram into the week that doesn’t involve writing code. It’s important from the outset that the guild has a value proposition that will benefit its members as well as the organization.

Zane Lackey from [Signal Sciences][5] gave me some excellent advice: It’s important to call out the truth. In the past, he said, security initiatives may have been more of a hindrance or even a blocker to getting work done. Your secure engineering guild needs to focus on ways to make your engineering team’s lives easier and more efficient instead. You need to find ways to automate more of the busywork related to security and to make your development teams more self-sufficient so you don’t have to rely on security “gates” or hurdles late in the development process.

Here are some things that may attract people to your guild:

  * Learn about security vulnerabilities and what you can do to combat them
  * Become a subject matter expert
  * Participate in penetration testing
  * Evaluate and pilot new security tools
  * Add “Secure Engineering Guild” to your resume



Here are some additional guild recruiting tips:

  * Reach out directly to your security experts and ask them to join: security architects, network security administrators, people from your corporate security department, and so on.

  * Bring in an external speaker who can get people excited about secure engineering. Advertise it as “sponsored by the Secure Engineering Guild” and collect names and contact information for people who want to join your guild, both before and after the talk.

  * Get executive support for the program. Perhaps one of your VPs will write a blog post extolling the virtues of secure engineering skills and asking people to join the guild (or perhaps you can draft the blog post for her or him to edit and publish). You can combine that blog post with advertising the external speaker if the timing allows.

  * Ask your management team to nominate someone from each squad to join the guild. This hardline approach is important if you have an urgent need to drive rapid improvement in your security posture.




**Step 2: Build a team**

Guild meetings should be structured for action. It’s important to keep an agenda so people know what you plan to cover in each meeting, but leave time at the end for members to bring up any topics they want to discuss. Also be sure to take note of action items, and assign an owner and a target date for each of them. Finally, keep meeting minutes and send a brief summary out after each meeting.

Your first few guild meetings are your best opportunity to set off on the right foot, with a bit of team-building. I like to run a little design thinking exercise where you ask team members to share their ideas for the guild’s mission statement, vote on their favorites, and use those to craft a simple and exciting mission statement. The mission statement should include three components: WHO will benefit, WHAT the guild will do, and the WOW factor. The exercise itself is valuable because you can learn why people have decided to volunteer to be a part of the guild in the first place, and what they hope will come of it.

Another thing I like to do from the outset is ask people what they’re hoping to achieve as a guild. The guild should learn together, have fun, and do real work. Once you have those ideas out on the table, start putting owners and target dates next to those goals.

  * Would they like to run a book club? Get someone to suggest a book and set up book club meetings.

  * Would they like to share useful articles and blogs? Get someone to set up a Slack channel and invite everyone to it, or set up a shared document where people can contribute their favorite resources.

  * Would they like to pilot a new tool? Get someone to set up a free trial, try it out for their own team, and report back in a few weeks.

  * Would they like to continue a series of talks? Get someone to create a list of topics and speakers and send out the invitations.




If a few goals end up without owners or dates, that’s OK; just start a to-do list or backlog for people to refer to when they’ve completed their first task.

Finally, survey the team to find the best time and day of the week for ongoing meetings and set those up. I recommend starting with weekly 30-minute meetings and adjust as needed.

**Step 3: Keep the energy going, or reboot**

As the months go on, your guild could start to lose energy. Here are some ways to keep the excitement going or reboot a guild that’s losing energy.

  * Don’t be an echo chamber. Invite people in from various parts of the organization to talk for a few minutes about what they’re doing with respect to security engineering, and where they have concerns or see gaps.

  * Show measurable progress. If you’ve been assigning owners to action items and completing them all along, you’ve certainly made progress, but if you look at it only from week to week, the progress can feel small or insignificant. Once per quarter, take a step back and write a blog about all you’ve accomplished and send it out to your organization. Showing off what you’ve accomplished makes the team proud of what they’ve accomplished, and it’s another opportunity to recruit even more people for your guild.

  * Don’t be afraid to take on a large project. The guild should not be an ivory tower; it should get things done. Your guild may, for example, decide to roll out a new security tool that you love across a large organization. With a little bit of project management and a lot of executive support, you can and should tackle cross-squad projects. The guild members can and should be responsible for getting stories from the large projects prioritized in their own squads’ backlogs and completed in a timely manner.

  * Periodically brainstorm the next set of action items. As time goes by, the most critical or pressing needs of your organization will likely change. People will be more motivated to work on the things they consider most important and urgent.

  * Reward the extra work. You might offer an executive-sponsored cash award for the most impactful secure engineering projects. You might also have the guild itself choose someone to send to a security conference now and then.




### Go forth, and make your company more secure

A more secure company starts with a more educated team. Building upon that expertise, a secure engineering guild can drive real changes by developing and sharing best practices, finding the right owners for each action item, and driving them to closure. I hope you found a few tips here that will help you level up the security expertise in your organization. Please add your own helpful tips in the comments.


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/how-level-security-expertise-your-organization

作者：[Ann Marie Fred][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/annmarie99
[b]: https://github.com/lujun9972
[1]: https://www.npmjs.com/about
[2]: https://www.owasp.org/index.php/Category:OWASP_AppSec_Conference
[3]: mailto:Toolbox@IBM
[4]: https://medium.com/project-management-learnings/spotify-squad-framework-part-i-8f74bcfcd761
[5]: https://www.signalsciences.com/
