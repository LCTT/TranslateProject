[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (saturday comics: a weekly mailing list of programming comics)
[#]: via: (https://jvns.ca/blog/2020/07/05/saturday-comics/)
[#]: author: (Julia Evans https://jvns.ca/)

saturday comics: a weekly mailing list of programming comics
======

Hello! This post is about a mailing list ([Saturday Comics][1]) that I actually started a year ago. I realized I never wrote about it on this blog, which is maybe better anyway because now I know more about how it’s gone over the last year!

I think the main idea in this post is probably – if you want to have a mailing list that’s useful to people, but don’t have the discipline to write new email all the time, consider just making a mailing list of your best past work!

Let’s start by talking about some of the problems I wanted to solve with this mailing list.

### problems I wanted to solve

**problem 1: not everyone is on Twitter**.

I pretty much exclusively post draft zine pages to Twitter, but not everyone is on Twitter all the time. Lots of people aren’t on Twitter at all, for lots of very good reasons! So only posting my progress on my zines to Twitter felt silly.

**problem 2: weekly mailing lists felt impossible**:

I kept hearing “julia, you need a mailing list, mailing lists are the best”. So I wanted to set up some kind of “mailing list” or something. Okay! I’ve tried to set up a “weekly mailing list” of sorts a few times, and inevitably what happens is:

  * I announce the mailing list
  * people subscribe
  * I literally never email the list (or email it once, and then never again)



For obvious reason, that’s not super effective.

**problem 3: it was impossible to find my “best” work**:

I have an idea in my head of what my “best” comics are, but there was literally no way for anyone else other than me to find that out even though I know that some of my comics are a lot more useful to people than others.

I also recently added <https://wizardzines.com/comics/> as another way to fix this.

### send my favourite comics, not the newest comics

Unlike this blog (where people can read my newest work), I decided to use a different model: let people see some of my **favourite** comics.

The way I thought about this was – if someone isn’t familiar with my work and wants to learn more, they’re more likely to find something interesting to them in my “best” work than just whatever I happen to be working on at the time.

### solution: saturday comics, an automated weekly mailing list

So! I came up with “saturday comics”. The idea is pretty simple: you get 1 programming comic in your email every Saturday.

Unlike a normal weekly mailing list, though, you don’t get the “latest” email – instead, there’s a fixed list of emails in the list, and everyone who signs up gets all the emails in the list starting from the beginning.

For example, the first email is called [“bash tricks”][2], and so if someone signs up today, they’ll get the “bash tricks” email on Saturday.

### so far: 29 weeks of email

So far the list has 29 weeks (7 months) of email – if you sign up today, you’ll get a comic every week for at least 29 weeks.

You might notice that 29 is less than 52 and think “wait, you said this list has existed for a year!“. I haven’t quite kept up with 1 email a week so far. What happens in practice is that I’ll add 5 new emails, they’ll get sent out over 5 weeks, then subscribers will stop getting email for while, and then I’ll add more emails eventually and then they’ll start getting email again.

It’s maybe not ideal, but I think it’s okay, and it’s definitely better than my previous mailing list practices of “literally never email the mailing list ever”.

### so far: 5000 people have subscribed, and people seem to like it!

5000 people have subscribed to the list so far, and people seem to like it – I pretty often get replies saying “hey, thanks for this week’s comic, I loved this one” or see people tweeting about how they loved this week’s email.

You can [sign up here][3] if you want.

### how it works: a ConvertKit sequence

The way I implemented it is with a ConvertKit sequence. Here’s an example of what the setup looks like: there’s a list of subject lines &amp; when they’re scheduled to go out (like “1 week after the last email”), and then you can fill in each email’s content. I’ve found it pretty straightforward to use so far.

![][4]

### marketing = building trust

This list is sort of a marketing tool, but I’ve learned to think of marketing (at least for my business) as just building trust by helping people learn new things. So instead of worrying about optimizing conversion rates or whatever (which has never helped me at all), I just try to send emails to the list that will be helpful.

With every comic I include a link to the zine that it’s from in case people want to buy the zine, but I try to not be super in-your-face about it – if folks want to buy my zines, that’s great, if they want to just enjoy the weekly comics, that’s great too.

### that’s all!

This idea of a mailing list where you send out your favourite work instead of your latest work was really new to me, and I’m happy with how it’s gone so far!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/07/05/saturday-comics/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://wizardzines.com/saturday-comics/
[2]: https://wizardzines.com/comics/bash-tricks/
[3]: https://wizardzines.com/#saturday-comics
[4]: https://jvns.ca/images/sequence.png
