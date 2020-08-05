[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Leaving Google: Five Years On)
[#]: via: (https://theartofmachinery.com/2020/08/04/leaving_google.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

Leaving Google: Five Years On
======

About five years ago now, I handed in my Google employee badge and walked out of the Sydney Google office to start a new life of self-employment. I figured I should write up this story because I got a lot out of reading [Michael Lynch’s][1]. As you can see, it’s still taken me a couple of years to get around to writing this post, but I finally told myself that if I don’t write it for the fifth anniversary, I never will.

This post is kind of long, but I hope it has something useful for new developers who are interested in working at a big tech company, or for big company employees who are wondering what it’s like to quit. I’ll talk about my story of getting into, working at and quitting Google, and what I’ve done since. Feel free to ask if you want more detail about something, though I already have a lot of blog posts to write, so I can’t promise anything in-depth straight away.

Also, at the risk of labouring the obvious: I haven’t worked at Google for five years, so don’t take this story as a literal description of Google today or what all Google employees experience. However, I think a lot of it’s still relevant to tech careers in general.

### The windy road to Google

I got my first paid programming job in 2005. It was working at the local power company, taking some old Pascal code and making it work on a different OS with a different compiler. It was basically just a summer job for extra money while doing the maths and physics degree I’d started that same year. They were happy to have an undergraduate who could do the job; I was just blown away that these grown ups were not only interested in my programming hobby, but actually going to give me real money for it.

I kept doing stuff like that until I graduated in 2007. I liked programming work, and Google was a cool company doing cool programming stuff, so I applied for an internship. The Google interview process was famous for being tough, so I spent weeks practising on all the Google interview problems I could find online. I don’t think the process has changed much in 13 years: I submitted a résumé, and I got invited to a few rounds of phone interviews that were mostly algorithmic problems (I remember a dynamic programming one and a divide-and-conquer geometric one). I passed the initial interviews, and got invited to come to Sydney for a day of on-site interviews with Google engineers. I went home and waited for what felt like an eternity for the phone call from Google HR. I got rejected.

It’s natural to feel bad about our rejections and failures, so we don’t talk about them much. But for the same reason, other people don’t talk about theirs, which only makes things worse. When I _did_ get into Google later, I felt like there must be something a bit wrong with me as a “ex-reject”, but one day I was at a table with a bunch of colleagues and the conversation came up. That’s when I discovered that actually a lot of people around me had been rejected at least once. I wasn’t even the “worst”. One guy joked that he must have only got in because Google HR got tired of rejecting him. I’m talking about some pretty impressive engineers, as well — some were responsible for code I use all the time, and I bet you use, too.

Companies that do interviews usually interview two or more candidates for each hire. That means there are more rejections around than acceptances, so the average interviewee gets rejected more often than not. Yet we keep forgetting that. Four developers go into an interview; one gets hired, the other three rant on social media about how the interview was totally flawed because they personally got rejected. Sure, interviews are far from perfect, but we need to stop taking them so personally.

Rejection and failure aren’t so bad as long as you can figure out what went wrong and how you could improve yourself. The Google interviews were heavily algorithm-oriented, and I fumbled through a lot of them but definitely didn’t come out shining.

After the Google rejection, I got two things and took a kind of sabbatical year. The first thing was an Australian Business Number (ABN) that I used to do maths and science tuition, as well as tech job contracts. The other thing I got was a library card at the university science and tech library. I wasn’t planning to interview at Google again, but the interview experience told me there was a lot I didn’t know. I’d give tutorials in the library and read books in between. By the way, a few people thought I was weird for doing all that accounting and stuff for my tuition business, when most tutors just did it cash-in-hand. But I learned a lot that’s helped me later in life, so I don’t regret a thing.

In 2009, I did a maths honours year (a.k.a, bachelors fourth year) based on the work of a magician-turned-mathematician called Persi Diaconis. The computer science department let me take one of their algorithms units as part of it.

As I said, I hadn’t planned to interview for Google again, but let me fast forward to how it happened. I’d been studying Japanese since high school, so in 2012 I decided to try living in Tokyo. That mostly worked out, except I made one pretty big mistake: I didn’t have any paper qualifications in Japanese, so it was really hard to get job interviews. Eventually, a friend of mine who had been accepted at Google suggested I give it another try. Like all Google offices, the official business language at Google Tokyo is English, so they didn’t require me to have Japanese qualifications.

### Google interviews, again

My friend gave me a recommendation to Google HR. That definitely helps, but don’t get too excited if you get a recommendation, yourself. It ensures your résumé gets noticed (not trivial) and cuts one of the phone interviews, but you still have to pass the remaining phone and on-site interviews.

This time I practised using problems from [Project Euler][2] and [Google CodeJam][3]. I had to do some live programming in a Google Doc during the phone interview, which was a bit awkward, but otherwise the phone interviews went okay. Then I got invited to the Mori Tower office in Roppongi for a day of onsite interviews.

![Mori Tower in Tokyo, where I interviewed for Google. It's the sixth tallest building in the city, which means it's huge. \(Photo from here.\)][4]

My first interview went terribly. I got brain freeze. I knew I could solve the problem, but I couldn’t think straight until the interviewer walked out of the room. Instantly I relaxed and recognised it as a ternary search problem. That was pretty frustrating, but I decided to just keep going and see how the rest of the interviews went.

Two of the interviews were bad. One is still today the worst interview question I’ve ever had. The interviewer said, “You run a program twice with the same input and get different results. Tell me why.” I replied, “When that’s happened on modern computers and I didn’t expect it, it’s usually been a race condition.” He just said, “No, it’s not a race condition,” and looked at me waiting for my next answer. The question could have been a great question if he’d been interested in a discussion, but apparently he really did just want to play “guess the secret number”. For almost everything I said, he simply replied, “No.” Apparently the program was fully deterministic, stored no state, and had no dependence on the environment (such as disk or the real time clock), but gave different results each time it was executed. I suspect we had a different understanding of what “stored state” or “environment” meant or something, but I had no way to tell. At one point (getting desperate) I tried asking if temperature changes in the electronic components were having an effect, and he said, “No, that would be a race condition, and I’ve already told you it’s not a race condition.” Eventually the interview ended, and I still don’t know what that secret number was.

I’m telling that story because I’ve heard much tamer horror stories being told as proof that interviewers are terrible people who hate interviewees. But, contrary to popular stereotype, most of the interviews that day were basically okay, and the interviewers were friendly and respectful. Interviewing is genuinely really hard, too, so it’s good to cut interviewers some slack. Hopefully, the “guess the number” interviewer got feedback from Google HR that his question just wasn’t helpful for making hiring decisions.

This time, the interviews resulted in an offer, but with a little catch: the job was in Sydney, working as a site reliability engineer. I’d never heard of SRE before, but I had a phone call with a senior Sydney SRE who explained that he’d noticed my experience doing embedded engineering in the natural gas industry, and thought SRE would be a good fit because of a similar emphasis on reliability and fitting tight constraints.

Having spent about a year building up a life in Tokyo, I didn’t want to drop everything and move to Sydney, but no way in hell was I in a position to turn down an offer from Google. I did make one very stupid mistake when talking with the recruiter: I got asked how much money I was making, and I blurted it right out. [Don’t do that.][5] It means it doesn’t matter what happens in the interview, or how much you were being underpaid at your previous job, or whatever; you’ll probably either be rejected or get offered some token amount on top of your old pay and be treated as crazy and unreasonable if you try to negotiate more. In my case, I was making much less than even an entry-level position at Google. I can’t say for sure that’s the whole story, but in 2013 I moved to Sydney to be a new-grad level SRE on Google Maps.

### Google Maps SRE at Sydney

A product like Maps is really several software projects, each with its own team of developers. Even a feature like route-finding is really multiple software projects — from gathering transport timetable data, to calculating routes, to rendering results, etc. There are two sides to the SRE job: One is being oncall for the various projects, responding in real time to any production incidents. The other side of the job (when there aren’t any fires to fight) is applying experience from production incidents to other projects and pre-emptively finding ways they could go wrong, or opportunities to make them perform better. Google’s SREs also act like an internal consulting group for developers with questions about deployment practices, or automation, or monitoring, or things like that.

The work was pretty intense. As a team, we were expected to deal with at least one production incident a week, or else take on responsibility for more services. Every week, all the SREs in Sydney would get together to swap stories of failures that had happened, or new tips for how to make things work better. The learning curve felt like being an undergraduate again.

I sometimes get a shocked, “But don’t you miss the benefits?!” from people who hear I chose to quit Google. The material benefits (like meals, etc.) are definitely nice, but they’re things that you can buy, so, no, they’re not things I miss. If you ask me what I miss, I’d say it’s the people who worked there. Contrary to what you might have heard, arrogant people don’t enjoy working at places like Google. There’s an infamous story of a narcissist who got a job at Google and kept embarrassing himself by pretending to be a top expert in all kinds of things. He lasted less than half a year before leaving. Overall, the culture was very low on arrogance and blame slinging and politics compared to other places I’ve worked at. On the other hand, Google doesn’t have a monopoly on nice colleagues.

There’s one kind of corporate politics that was a big problem, though. Getting promoted required “demonstrating impact”, and it was well known that the easiest way to do that was to launch some new thing (not the only way, but easiest). The result was Googlers who were more interesting in promoting their own alpha-quality, prototype solutions to problems than improving existing solutions. We had a standing joke in SRE that there were two kinds of software inside Google: old things that worked well but were deprecated and were Ungoogly to even consider using, and hot new things that were the 100% official tools to use today even though they didn’t work yet. As SREs, we often saw first hand what went wrong with the new hotness (which sometimes became the old deprecated thing before it even got out of alpha). ([I’ve talked more in depth about this kind of thing before.][6])

This isn’t something that we cynical SREs just imagined; it was openly recognised as a problem in the company, and I remember being reassured that promotion committees had started looking for evidence of impact through things like maintenance work.

### The promotion application

In 2015, after working at Google for a couple of years, my manager told me it really was about time to apply for a promotion above my new-grad level. The promotion process was centrally managed through promotion committees twice a year. You’d make your application and back it up with a short description of projects you’d worked on, supported by references from your colleagues. The committee would do a review and give you the thumbs up or down. Your manager’s recommendation alone wasn’t enough because your manager had an incentive to get you promoted. Having high-ranked staff under you helps your own career advancement.

To cut a long story short, I made my application and the committee said no. Actually, it was a pretty damning no. I don’t remember the response in detail, but it felt like the committee had just gone hunting through my application looking for things to be dismissive about. For example, one project I’d worked on was an internal tool that was building up a backlog of feature requests. I’d looked at the project and figured out that the root problem was that it had outgrown the key-value store it had been built on, and needed a proper database. I argued for switching to a relational DB, and I went ahead and implemented it: schema, data migration, queries, the live site migration, etc. The new queries were much faster, and (more importantly) the new features could be supported efficiently. One problem I had to solve before migrating was that most of the code wasn’t covered by tests, and that was because most of the code wasn’t testable. I refactored the code using dependency injection and [other tricks I’ve talked about before][7], and that let me build a regression test suite. I remember that project was mostly dismissed with the comment that writing unit tests is “new-grad-level work”.

My manager was really supportive and wrote an appeal. He didn’t show it to me, but I think it was several pages that could be reduced down to “WTF” (argued more eloquently and with more detail). Here are some of the reasons I also thought this response was a bit WTF:

Google SRE has a concept of “point-personship”. The point person for a project has two roles: One is to know the software project to a greater depth than other SREs, so that you can answer questions they might have. The other role is to be the first point of contact for the devs on the project itself, so that they can get answers to all their SRE questions. The Google job ladder guide said that point-personship wasn’t required at the new-grad level, but looked good for promotion. As my application had said, I was point person for three projects.

My point-personships made it easy to find senior developers who agreed to help support my promotion application. They were all shocked when they found out I was new-grad level. They’d all agreed to support my application assuming I was already at a higher level.

On my application, I mentioned being a mentor for a group of new-grad interns we had. When I made my application, many of them were being hired as permanent employees. I was senior enough to be their mentor, but firmly not enough to be promoted above their level.

The response to my manager’s appeal took a completely different tack from the original review. This time I was “strongly exceeding expections for my [new-grad] job level”, but the problem was that they just needed a little bit more time to be sure I could be promoted to new-grad-plus-one. I was told I could keep strongly exceeding expectations for another six months until the next promotion cycle, and maybe I’d get a promotion then. The appeal was over; that was the deal.

I wrote an email that I was taking another option. Like many tech companies, Google has an employee stock program. You’re given a nominal grant when you start work, and you actually receive real shares at various “vestment” milestones. My next stock vestment was a couple of months away. The day after that, I wouldn’t be working for Google any more.

### My reasons for quitting

The decision to quit any job isn’t easy, and one day you might face the same decision. Here are some of the factors that helped me make my choice. ([Some of this thinking I explained in more depth in an older post.][8])

If you think about it, given that I wasn’t literally a new grad, Google’s review should have been something like, “You’re doing some things very wrong. You simply won’t get a promotion until you improve at X and Y and Z.” Being told, “You’re strongly exceeding expectations, but we need another six months or so,” didn’t make any sense. No one raised concerns about whether I was capable of doing my job. I was getting a lot of excuses, but not any useful feedback to help me do better. (NB: sometimes you have to explicitly ask for feedback. Managers can fall into the trap of defending the performance ratings they give, instead of thinking about the report’s need for feedback.)

I also wasn’t sure what the promotion committee might see in six months that they hadn’t already seen in two years. Why wouldn’t they ask for another six months again? If I needed to prove myself for years to get new-grad-plus-one, how old would I be before I got new-grad-plus-two?

When I first started at Google, my job level was irrelevant because I was learning so much and getting a famous company on my résumé. Two years in, the equation was different. The value of the future that Google was offering me was waning, while the value of opportunities outside Google had gone up. Google job levels mean practically nothing outside Google. In the past five years, plenty of people have asked about what I did at Google, but not a single person has asked me what my Google job level was, or called me a new grad. Although I took a financial hit short term, I effectively got a promotion that day I handed in my badge.

Credit where it’s due, Google didn’t do anything like this, but it’s common in other companies: trying to make employees feel guilty about asking for pay rises. At a place I worked a few years ago, some engineers asked for a payrise after a highly successful launch following a lot of crunch time. Management played the victim and accused the engineers of “twisting their arms”. (About six months later they lost most of their engineering team.) If you’re genuinely co-operative about the timing of when you might quit (e.g., after a launch date, not the week before) and willing to document your knowledge and clean up after yourself, etc., you’re only twisting your employers’ arms by as much as they’re underpaying you.

Nominally, I left a large amount of unvested stock behind at Google. But stock isn’t yours until it’s yours. I just had a promise of being paid shares in future, and I could convert it to an equivalent pay rate by dividing it by time required. Working two months for that vestment was worth it. Working years for the remaining vestments wasn’t. Don’t fall for endowment bias.

When shouldn’t you quit? Well, are you’re getting a good deal compared to what you could get elsewhere? Corporate career paths aren’t mandated by heaven; they’re a series of business offers representing what the company estimates you’ll work for. If you think you’re getting a good deal (considering all compensation and intangibles like the work environment), great! Otherwise, it’s time to think hard about what to do next.

### After Google

I should warn you that I took a strategy that was high growth, at the expense of short-term stability. If stability is more important to you, you’ll do things differently. My plan A, plan B and plan C all fell apart, and I ended up spending a few months struggling to find a way. Eventually I got a contract at a small web shop, working on [Safety Town][9], a government road safety website for kids. The pay was a big cut from Google, especially considering it was my first work in months. But, you know, I really enjoyed that project. Sure, it wasn’t “cool” like Google, and maybe some kids at school didn’t think it was cool. On the other hand, at Google I was a tiny part of a huge thing. Safety Town had a small team, with everyone playing a crucial role. For part of the Safety Town project, I was _the_ backend engineer, and Safety Town was the only thing I had to worry about at that time. And, heck, maybe some kids have learned a thing or two about road safety from that website. I’ve done plenty of projects since then, most of them bigger, but I still show people Safety Town.

![Screenshot of Safety Town home page, owned by Australian NSW government.][10]

I remember a poster in the Sydney Google office that said, “Shoot for the moon! Even if you miss, you’ll land among the stars!” It’s easy to forget that you can have a quality life even if you’re not doing moonshots for famous companies, or doing moonshots for startups.

Here’s one trick that helped me get contracts. I’d go to Sydney tech events, stand within view of the job board, and wait until I saw someone writing on it. Suppose they were writing about CSS development for an insurance company project. Even if I weren’t especially interested in CSS or insurance, I’d wander over and say, “Hi, what kind of insurance project is that?” It’s the easiest conversation starter because their head’s full of the project while they’re trying to fit it into a tiny space on the job board. Usually the conversation still wouldn’t lead to a job for me, but occasionally I’d discover something I could help with. Some events don’t have a job board, but the organisers are often glad to offer the microphone to someone for a few minutes. It adds community engagement to their events.

I got a major break after working on a website for government procurement, just because I learned to not be so clueless about government procurement. It’s hard to say exactly how much that knowledge was worth, but less than a year afterwards I signed a government contract for about 40% more than I would have hoped was possible before. (I don’t do so much government and big enterprise work nowadays, though.)

After about a year and a half, I had my own one-person company. As I built up a reputation, I gradually got more SRE-like work. Basically, doing dev work was my “in”, then several months later I’d get contacted by someone who needed SRE/DevOps help and remembered me. I actually like both SRE and pure dev work, but supply and demand means SRE work is good business. I can still do programming in my spare time.

Speaking of which, work/life balance is my favourite thing about my new lifestyle. No one pays me between contracts, but I can make the most of it by learning new things doing side projects. After one long, intense contract, I took a break and did [a month-long backpacking trip exploring rural Japan][11]. It was a trip I’d wanted to do for a long time, but before Google I needed more money, and during Google I needed more time. Being self-employed is far from stress free and isn’t for everyone, but there’s stress that makes you feel dead, and there’s stress that makes you feel more alive. For me, self-employment is the second kind, and I’d say I’ve been less stressed overall in the past five years than I was while at Google. In my case, at least, I can honestly say I don’t regret joining Google when I did, and I don’t regret leaving when I did, either.

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2020/08/04/leaving_google.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://mtlynch.io/why-i-quit-google/
[2]: https://projecteuler.net
[3]: https://codingcompetitions.withgoogle.com/codejam
[4]: https://theartofmachinery.com/images/leaving_google/mori-tower.jpg
[5]: https://www.kalzumeus.com/2012/01/23/salary-negotiation/
[6]: https://theartofmachinery.com/2019/03/19/hello_world_marketing.html
[7]: https://theartofmachinery.com/2016/03/28/dirtying_pure_functions_can_be_useful.html
[8]: https://theartofmachinery.com/2018/10/07/payrise_by_switching_jobs.html
[9]: https://www.safetytown.com.au/
[10]: https://theartofmachinery.com/images/leaving_google/safetytown.png
[11]: https://theartofmachinery.com/2018/03/23/seto_trip_1.html
