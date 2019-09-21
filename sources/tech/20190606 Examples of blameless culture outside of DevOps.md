[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Examples of blameless culture outside of DevOps)
[#]: via: (https://opensource.com/article/19/6/everyday-blameless)
[#]: author: (Patrick Housley https://opensource.com/users/patrickhousley)

Examples of blameless culture outside of DevOps
======
Is blameless culture just a matter of postmortems and top-down change?
Or are there things individuals can do to promote it?
![people in different locations who are part of the same team][1]

A blameless culture is not a new concept in the technology industry. In fact, in 2012, [John Allspaw][2] wrote about how [Etsy uses blameless postmortems][3] to dive to the heart of problems when they arise. Other technology giants, like Google, have also worked hard to implement a blameless culture. But what is a blameless culture? Is it just a matter of postmortems? Does it take a culture change to make blameless a reality? And what about flagrant misconduct?

### Exploring blameless culture

In 2009, [Mike Rother][4] wrote an [award-winning book][5] on the culture of Toyota, in which he broke down how the automaker became so successful in the 20th century when most other car manufacturers were either stagnant or losing ground. Books on Toyota were nothing new, but how Mike approached Toyota's success was unique. Instead of focusing on the processes and procedures Toyota implements, he explains in exquisite detail the company's culture, including its focus on blameless failure and continuous improvement.

Mike explains that Toyota, in the face of failure, focuses on the system where the failure occurred instead of who is at fault. Furthermore, the company treats failure as a learning opportunity, not a chance to chastise the operator. This is the very definition of a blameless culture and one that the technology field can still learn much from.

### It's not a culture shift

It shouldn't take an executive initiative to attain blamelessness. It's not so much the company's culture that we need to change, but our attitudes towards fault and failure. Sure, the company's culture should change, but, even in a blameless culture, some people still have the undying urge to point fingers and call others out for their shortcomings.

I was once contracted to work with a company on developing and improving its digital footprint. This company employed its own developers, and, as you might imagine, there was tension at times. If a bug was found in production, the search began immediately for the person responsible. I think it's just human nature to want to find someone to blame. But there is a better way, and it will take practice.

### Blamelessness at the microscale

When I talk about implementing blamelessness, I'm not talking about doing it at the scale of companies and organizations. That's too large for most of us. Instead, focus your attention on the smallest scale: the code commit, review, and pull request. Focus on your actions and the actions of your peers and those you lead. You may find that you have the biggest impact in this area.

How often do you or one of your peers get a bug report, dig in to find out what is wrong, and stop once you determine who made the breaking change? Do you immediately assume that a pull request or code commit needs to be reverted? Do you contact that individual and tell them what they broke and which commit it was? If this is happening within your team, you're the furthest from blamelessness you could be. But it can be remedied.

Obviously, when you find a bug, you need to understand what broke, where, and who did it. But don't stop there. Attempt to fix the issue. The chances are high that patching the code will be a faster resolution than trying to figure out which code to back out. Too many times, I have seen people try to back out code only to find that they broke something else.

If you're not confident that you can fix the issue, politely ask the individual who made the breaking change to assist. Yes, assist! My mom always said, "you can catch more flies with honey than vinegar." You will typically get a more positive response if you ask people for help instead of pointing out what they broke.

Finally, once you have a fix, make sure to ask the individual who caused the bug to review your change. This isn't about rubbing it in their face. Remember that failure represents a learning opportunity, and the person who created the failure will learn if they have a chance to review the fix you created. Furthermore, that individual may have unique details and reasoning that suggests your change may fix the immediate issue but may not solve the original problem.

### Catch flagrant misconduct and abuse sooner

A blameless culture doesn't provide blanket protection if someone is knowingly attempting to do wrong. That also doesn't mean the system is not faulty. Remember how Toyota focuses on the system where failure occurs? If an individual can knowingly create havoc within the software they are working on, they should be held accountable—but so should the system.

When reviewing failure, no matter how small, always ask, "How could we have caught this sooner?" Chances are you could improve some part of your software development lifecycle (SDLC) to make failures less likely to happen. Maybe you need to add more tests. Or run your tests more often. Whatever the solution, remember that fixing the bug is only part of a complete fix.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/everyday-blameless

作者：[Patrick Housley][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/patrickhousley
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/connection_people_team_collaboration.png?itok=0_vQT8xV (people in different locations who are part of the same team)
[2]: https://twitter.com/allspaw
[3]: https://codeascraft.com/2012/05/22/blameless-postmortems/
[4]: http://www-personal.umich.edu/~mrother/Homepage.html
[5]: https://en.wikipedia.org/wiki/Toyota_Kata
