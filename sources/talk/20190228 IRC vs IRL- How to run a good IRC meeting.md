[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (IRC vs IRL: How to run a good IRC meeting)
[#]: via: (https://opensource.com/article/19/2/irc-vs-irl-meetings)
[#]: author: (Ben Cotton https://opensource.com/users/bcotton)

IRC vs IRL: How to run a good IRC meeting
======
Internet Relay Chat meetings can be a great way to move a project forward if you follow these best practices.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_community_1.png?itok=rT7EdN2m)

There's an art to running a meeting in any format. Many people have learned to run in-person or telephone meetings, but [Internet Relay Chat][1] (IRC) meetings have unique characteristics that differ from "in real life" (IRL) meetings. This article will share the advantages and disadvantages of the IRC format as well as tips that will help you lead IRC meetings more effectively.

Why IRC? Despite the wealth of real-time chat options available today, [IRC remains a cornerstone of open source projects][2]. If your project uses another communication method, don't worry. Most of this advice works for any synchronous text chat mechanism, perhaps with a few tweaks here and there.

### Challenges of IRC meetings

IRC meetings pose certain challenges compared to in-person meetings. You know that lag between when one person finishes talking and the next one begins? It's worse in IRC because people have to type what they're thinking. This is slower than talking and—unlike with talking—you can't tell when someone else is trying to compose a message. Moderators must remember to insert long pauses when asking for responses or moving to the next topic. And someone who wants to speak up should insert a brief message (e.g., a period) to let the moderator know.

IRC meetings also lack the metadata you get from other methods. You can't read facial expressions or tone of voice in text. This means you have to be careful with your word choice and phrasing.

And IRC meetings make it really easy to get distracted. At least when someone is looking at funny cat GIFs during an in-person meeting, you'll see them smile and hear them laugh at inopportune times. In IRC, unless they accidentally paste the wrong text, there's no peer pressure even to pretend to pay attention. With IRC, you can even be in multiple meetings at once. I've done this, but it's dangerous if you need to be an active participant.

### Benefits of IRC meetings

IRC meetings have some unique advantages, too. IRC is a very resource-light medium. It doesn't tax bandwidth or CPU. This lowers the barrier for participation, which is advantageous for both the underprivileged and people who are on the road. For volunteer contributors, it means they may be able to participate during their workday. And it means participants don't need to find a quiet space where they can talk without bothering those around them.

With a meeting bot, IRC can produce meeting minutes instantly. In Fedora, we use Zodbot, an instance of Debian's [Meetbot][3], to log meetings and provide interaction. When a meeting ends, the minutes and full logs are immediately available to the community. This can reduce the administrative overhead of running the meeting.

### It's like a normal meeting, but different

Conducting a meeting via IRC or other text-based medium means thinking about the meeting in a slightly different way. Although it lacks some of the benefits of higher-bandwidth modes of communication, it has advantages, too. Running an IRC meeting provides the opportunity to develop discipline that can help you run any type of meeting.

Like any meeting, IRC meetings are best when there's a defined agenda and purpose. A good meeting moderator knows when to let the conversation follow twists and turns and when it's time to reel it back in. There's no hard and fast rule here—it's very much an art. But IRC offers an advantage in this regard. By setting the channel topic to the meeting's current topic, people have a visible reminder of what they should be talking about.

If your project doesn't already conduct synchronous meetings, you should give it some thought. For projects with a diverse set of time zones, finding a mutually agreeable time to hold a meeting is hard. You can't rely on meetings as your only source of coordination. But they can be a valuable part of how your project works.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/irc-vs-irl-meetings

作者：[Ben Cotton][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bcotton
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Internet_Relay_Chat
[2]: https://opensource.com/article/16/6/getting-started-irc
[3]: https://wiki.debian.org/MeetBot
