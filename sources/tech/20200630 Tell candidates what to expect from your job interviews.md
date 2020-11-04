[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tell candidates what to expect from your job interviews)
[#]: via: (https://jvns.ca/blog/2020/06/30/tell-candidates-what-to-expect-from-your-job-interviews/)
[#]: author: (Julia Evans https://jvns.ca/)

Tell candidates what to expect from your job interviews
======

In my last job, I helped with a few projects (like [brag documents][1] and the engineering levels) to help make the engineering culture a little more inclusive, and I want to talk about one of them today: making the interview process a little easier to understand for candidates.

I worked on this project for a few days way back in 2015 and I’m pretty happy with how it turned out.

### giving everyone a little information helps level the playing field

Different tech companies run their interviews in very different ways, and I think it’s silly to expect candidates to magically intuit how your company’s interview process works.

It sucks for everyone when a candidate is surprised with an unexpected interview. For example, at the time the debugging interview required candidates to have a dev environment set up on their computer that let them install a library &amp; run the tests. Sometimes candidates didn’t have their environment set up the right way, which was a waste of everyone’s time! The point of the interview wasn’t to watch people install bundler!

### different companies have different rubrics

Also, different companies actually test different things in their interviews! At that job we didn’t care if people used Stack Overflow during their interviews and didn’t interview for algorithms expertise, but lots of companies **do** interview for algorithms expertise.

Telling people in advance what they’ll be measured on makes it way easier for them to prepare: if you tell them they won’t be asked algorithms questions, they don’t have to waste their time practicing implementing breadth first search or whatever.

### solution: write a short document!

My awesome coworker [Kiran][2] had a simple idea to help solve this problem: write a document explaining what to expect from the interview process! She wrote the document and I helped edit it a bit.

We called it [On-site interviews for Engineering: What to expect][3] (that link is to an old revision of that document I found in the internet archive).

It covered:

  * how to prepare for the interview
  * what candidates were evaluated on (debugging! navigating codebases! communication!)
  * a few things about the non-technical parts of the onsite interview



### keep it updated over time

That document was originally written in April 2015. A lot of things changed about the interview process over time, and so it needed to be kept updated.

I think the work of keeping the document updated is even more important than writing it in the first place, and a lot of amazing people worked on that. I don’t work there anymore, but some quick Googling turned up what I think is the [current version of that document][4], and it’s great!

### documenting your interview process is pretty easy

In my experience, advocating for changes to an interview process is really hard. You need to propose a new interview process, test the interviews, convince interviewers to get on board – it takes a long time.

In comparison, documenting an existing interview process (without changing it!!) is WAY EASIER. My memory is a pretty fuzzy, but I think basically nobody objected to documenting the interview process the company already had – it was just factual information about what we were already doing! Way less controversial.

### you can make small changes to your company’s culture

Making the companies I work at a better place for everyone to work is important to me. It’s a huge project, and I’ve tried a lot of things that haven’t worked.

But I’ve found it rewarding to work on changes like this that make one small thing a little better for people.

thanks to Kiran Bhattaram for coming up with this idea in the first place and for reviewing a draft of this post, and to [@jilljubs][5] for reminding me of earlier today

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/06/30/tell-candidates-what-to-expect-from-your-job-interviews/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/brag-documents/
[2]: https://www.kiranbot.com/
[3]: https://web.archive.org/web/20170928181711/https://stripe.com/jobs/engineering-onsite.pdf
[4]: https://docs.google.com/document/d/1YBQHW0WamAgiDiHBF2yI2Z3itnrdJu11S7VK6jzKAJs/edit
[5]: https://twitter.com/jilljubs/status/1277975930468626434
